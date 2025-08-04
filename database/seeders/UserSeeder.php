<?php
namespace Database\Seeders;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Admin kullanıcısı
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
            'role' => 'admin',
        ]);
        // 9 adet customer kullanıcısını sırasıyla customer1, customer2... parolalarıyla oluşturma
        for ($i = 1; $i <= 9; $i++) {
            User::create([
                'name' => 'Customer ' . $i,
                'email' => 'customer' . $i . '@example.com',
                'password' => Hash::make('customer' . $i), // Parolalar customer1, customer2... olarak belirleniyor
                'role' => 'customer',
            ]);
        }
    }
}
