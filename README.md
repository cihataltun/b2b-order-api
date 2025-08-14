
# 🛒 B2B Sipariş API Dokümantasyonu

Bu proje, bir B2B (İşletmeden İşletmeye) sipariş sisteminin API tarafını **Laravel** ve **Laravel Sanctum** kullanarak geliştirmek için oluşturulmuştur. Bu belge, projeyi hızla kurmanıza ve API End Point leri kullanmanıza yardımcı olacak şekilde hazırlanmıştır.

---

## 📊 Genel Bakış

### 🔹 API Kategorilerine Göre End Point Sayısı

| Kategori             | End Point Sayısı |
|----------------------|-----------------|
| Kimlik Doğrulama     | 2               |
| Ürünler              | 4               |
| Siparişler           | 3               |

### 🔹 Yetkilendirme Türlerine Göre End Point Dağılımı

| Yetki Türü | End Point Sayısı |
|------------|-----------------|
| Herkes     | 1               |
| Admin      | 3               |
| Auth       | 2               |
| Customer   | 1               |

---

## 🚀 Projeyi Çalıştırma

### Adım 1: `.env` Dosyasını Kopyalayın

```bash
cp .env.example .env
```

### Adım 2: Docker Konteynerlerini Başlatın

```bash
./vendor/bin/sail up -d
```

### Adım 3: Composer Paketlerini Kurun

```bash
./vendor/bin/sail composer install
```

### Adım 4: Uygulama Anahtarını Oluşturun

```bash
./vendor/bin/sail artisan key:generate
```

### Adım 5: Veritabanını Hazırlayın

```bash
./vendor/bin/sail artisan migrate:fresh --seed
```

### ✅ Uygulamaya Erişim

- Laravel Giriş Sayfası: [http://localhost](http://localhost)
- API End Pointları: [http://localhost/api](http://localhost/api)

---

## 👤 Örnek Kullanıcılar

`migrate:fresh --seed` komutu çalıştırıldığında aşağıdaki kullanıcılar veritabanına yüklenir:

| Rol      | E-posta               | Parola     |
|----------|------------------------|------------|
| Admin    | admin@example.com      | password   |
| Customer | customer1@example.com  | customer1  |
| Customer | customer2@example.com  | customer2  |

---

## 🔌 API End Points

API isteklerinde `http://localhost` temel URL olarak kullanılır. Yetki gerektiren End Points için `Bearer Token` kullanmalısınız.

---

### 🔐 Kimlik Doğrulama

| Metot | End Point      | Açıklama                |
|-------|---------------|--------------------------|
| POST  | /api/register | Yeni kullanıcı kaydı     |
| POST  | /api/login    | Giriş yap, token al      |

---

### 📦 Ürünler

| Metot | End Point             | Açıklama           | Yetki   |
|-------|----------------------|---------------------|---------|
| GET   | /api/products        | Ürünleri listele    | Herkes  |
| POST  | /api/products        | Yeni ürün oluştur   | Admin   |
| PUT   | /api/products/{id}   | Ürünü güncelle      | Admin   |
| DELETE| /api/products/{id}   | Ürünü sil           | Admin   |

---

### 🛒 Siparişler

| Metot | End Point             | Açıklama                                                  | Yetki     |
|-------|----------------------|-------------------------------------------------------------|-----------|
| GET   | /api/orders          | Siparişleri listele (Admin tümü, Müşteri kendi siparişleri)| Auth      |
| GET   | /api/orders/{id}     | Belirli siparişi görüntüle                                | Auth      |
| POST  | /api/orders          | Yeni sipariş oluştur                                      | Customer  |

---
