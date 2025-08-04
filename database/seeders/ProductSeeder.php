<?php
namespace Database\Seeders;
use App\Models\Product;
use Illuminate\Database\Seeder;
class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Product::create([
            'name' => 'Laptop',
            'sku' => 'LAP-101',
            'price' => 1500.00,
            'stock_quantity' => 50,
        ]);
        Product::create([
            'name' => 'Mouse',
            'sku' => 'MOU-202',
            'price' => 25.50,
            'stock_quantity' => 200,
        ]);
        Product::create([
            'name' => 'Keyboard',
            'sku' => 'KEY-303',
            'price' => 75.00,
            'stock_quantity' => 150,
        ]);
        Product::create([
            'name' => 'Monitor',
            'sku' => 'MON-404',
            'price' => 300.00,
            'stock_quantity' => 75,
        ]);
    }
}
