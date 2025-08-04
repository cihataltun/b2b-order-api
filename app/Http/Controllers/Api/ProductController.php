<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Validation\ValidationException;

class ProductController extends Controller
{
    /**
     * Tüm ürünleri listeler ve cache'ler.
     * Herkes erişebilir.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $products = Cache::remember('products', 60, function () { // 60 saniye cache
            return Product::all();
        });

        return response()->json($products);
    }

    /**
     * Yeni bir ürün oluşturur.
     * Sadece "admin" erişebilir.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'sku' => 'required|string|unique:products,sku|max:255',
            'price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
        ]);

        $product = Product::create($request->all());

        Cache::forget('products'); // Cache'i temizle

        return response()->json($product, 201);
    }

    /**
     * Belirli bir ürünü gösterir.
     * Herkes erişebilir.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Product $product)
    {
        return response()->json($product);
    }

    /**
     * Bir ürünü günceller.
     * Sadece "admin" erişebilir.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'sku' => 'required|string|unique:products,sku,' . $product->id . '|max:255',
            'price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
        ]);

        $product->update($request->all());

        Cache::forget('products'); // Cache'i temizle

        return response()->json($product);
    }

    /**
     * Bir ürünü siler.
     * Sadece "admin" erişebilir.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Product $product)
    {
        $product->delete();

        Cache::forget('products'); // Cache'i temizle

        return response()->json(['message' => 'Product deleted successfully'], 204);
    }
}
