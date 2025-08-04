<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class OrderController extends Controller
{
    /**
     * Siparişleri listeler.
     * Admin: tüm siparişleri, Customer: sadece kendi siparişlerini görebilir.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $user = auth('sanctum')->user(); // auth('sanctum') olarak değiştirildi

        if ($user->role === 'admin') {
            $orders = Order::with('products')->get();
        } else {
            $orders = $user->orders()->with('products')->get();
        }

        return response()->json($orders);
    }

    /**
     * Yeni bir sipariş oluşturur.
     * Sadece "customer" erişebilir.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $user = auth('sanctum')->user(); // auth('sanctum') olarak değiştirildi

        // Sadece customer rolüne sahip kullanıcılar sipariş oluşturabilir.
        if ($user->role !== 'customer') {
            return response()->json(['message' => 'Forbidden. Only customers can place orders.'], 403);
        }

        $request->validate([
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|integer|exists:products,id',
            'items.*.quantity' => 'required|integer|min:1',
        ]);

        $totalPrice = 0;

        DB::beginTransaction();
        try {
            // Sipariş başlığını oluştur
            $order = Order::create([
                'user_id' => $user->id, // auth()->id() yerine $user->id olarak değiştirildi
                'status' => 'pending',
                'total_price' => 0,
            ]);

            $orderItems = [];
            foreach ($request->items as $item) {
                $product = Product::find($item['product_id']);

                if (!$product) {
                    throw ValidationException::withMessages([
                        'items' => ['Product not found.'],
                    ]);
                }

                // Yeterli stok kontrolü
                if ($product->stock_quantity < $item['quantity']) {
                    throw ValidationException::withMessages([
                        'items' => ['Not enough stock for product ID ' . $product->id]
                    ]);
                }

                $unitPrice = $product->price;
                $subtotal = $unitPrice * $item['quantity'];
                $totalPrice += $subtotal;

                // Pivot tablo verisini hazırla
                $orderItems[$product->id] = [
                    'quantity' => $item['quantity'],
                    'unit_price' => $unitPrice,
                ];

                // Stok miktarını güncelle
                $product->stock_quantity -= $item['quantity'];
                $product->save();
            }

            // Pivot tabloya ürünleri ekle
            $order->products()->attach($orderItems);

            // Toplam fiyatı güncelle
            $order->total_price = $totalPrice;
            $order->save();

            DB::commit();

            return response()->json($order->load('products'), 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Order creation failed: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Belirli bir siparişi gösterir.
     * Yalnızca yetkili kullanıcılar (admin veya kendi siparişi olan müşteri) erişebilir.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Order $order)
    {
        $user = auth('sanctum')->user(); // auth('sanctum') olarak değiştirildi

        if ($user->role === 'admin' || $user->id === $order->user_id) {
            return response()->json($order->load('products'));
        }

        return response()->json(['message' => 'Forbidden. You do not have the right permissions.'], 403);
    }
}
