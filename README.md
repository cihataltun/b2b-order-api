<!DOCTYPE html>
<html lang="tr" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B2B Sipariş API - İnteraktif Dokümantasyon</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Chosen Palette: Calm Harmony (Light neutrals with a subtle blue/indigo accent) -->
    <!-- Application Structure Plan: A single-page dashboard with a fixed top navigation bar ("Genel Bakış", "Kurulum", "Kullanıcılar", "API Uç Noktaları"). This structure organizes the linear README content into thematic, easily accessible sections. The flow allows users to get an overview, dive into setup with one-click copyable commands, see sample data, and explore API endpoints in a tabbed interface. This is more user-friendly for a developer than a long document, as it reduces scrolling and makes finding specific information faster. Two summary charts are included in the overview to provide a quick data-driven summary of the API's structure. -->
    <!-- Visualization & Content Choices:
    - Report Info: Setup commands -> Goal: Guide -> Presentation: Interactive step-by-step cards -> Interaction: "Copy to clipboard" buttons -> Justification: Improves developer workflow and reduces errors -> Library/Method: Vanilla JS.
    - Report Info: API endpoints -> Goal: Organize/Inform -> Presentation: Tabbed interface with color-coded badges for methods/auth -> Interaction: Tab switching, "Copy URL" buttons -> Justification: Breaks down complex information into manageable chunks and improves scannability -> Library/Method: Vanilla JS.
    - Report Info: Endpoint counts/auth types -> Goal: Summarize/Compare -> Presentation: Two Bar Charts (Endpoints by Category, Endpoints by Auth) -> Interaction: Hover tooltips -> Justification: Provides a high-level visual summary of the API's scope and security model, an insight not immediately available in the text -> Library/Method: Chart.js/Canvas.
    -->
    <!-- CONFIRMATION: NO SVG graphics used. NO Mermaid JS used. -->
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .chart-container {
            position: relative;
            width: 100%;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
            height: 300px;
            max-height: 350px;
        }
        @media (min-width: 768px) {
            .chart-container {
                height: 350px;
            }
        }
        .copied-feedback {
            position: absolute;
            top: -2.5rem;
            left: 50%;
            transform: translateX(-50%);
            background-color: #22c55e;
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 500;
            opacity: 0;
            transition: opacity 0.3s ease-in-out, top 0.3s ease-in-out;
            white-space: nowrap;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-800">

    <header class="bg-white/80 backdrop-blur-lg sticky top-0 z-50 border-b border-slate-200">
        <nav class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <div class="flex items-center">
                    <span class="text-xl font-bold text-slate-900">🛒 B2B Sipariş API</span>
                </div>
                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">
                        <a href="#overview" class="text-slate-600 hover:bg-slate-100 hover:text-slate-900 px-3 py-2 rounded-md text-sm font-medium">Genel Bakış</a>
                        <a href="#setup" class="text-slate-600 hover:bg-slate-100 hover:text-slate-900 px-3 py-2 rounded-md text-sm font-medium">Kurulum</a>
                        <a href="#users" class="text-slate-600 hover:bg-slate-100 hover:text-slate-900 px-3 py-2 rounded-md text-sm font-medium">Kullanıcılar</a>
                        <a href="#endpoints" class="text-slate-600 hover:bg-slate-100 hover:text-slate-900 px-3 py-2 rounded-md text-sm font-medium">API Uç Noktaları</a>
                    </div>
                </div>
                <div class="md:hidden">
                    <select id="mobile-nav" class="bg-slate-100 border border-slate-300 text-slate-900 text-sm rounded-lg focus:ring-indigo-500 focus:border-indigo-500 block w-full p-2.5">
                        <option value="#overview">Genel Bakış</option>
                        <option value="#setup">Kurulum</option>
                        <option value="#users">Kullanıcılar</option>
                        <option value="#endpoints">API Uç Noktaları</option>
                    </select>
                </div>
            </div>
        </nav>
    </header>

    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8 md:py-12">

        <section id="overview" class="mb-16 scroll-mt-24">
            <div class="text-center mb-12">
                <h1 class="text-4xl md:text-5xl font-extrabold text-slate-900 mb-4">B2B Sipariş API Dokümantasyonu</h1>
                <p class="max-w-3xl mx-auto text-lg text-slate-600">Bu proje, bir B2B (İşletmeden İşletmeye) sipariş sisteminin API tarafını **Laravel** ve **Laravel Sanctum** kullanarak geliştirmek için oluşturulmuştur. Bu interaktif doküman, projeyi hızla ayağa kaldırmanıza ve API uç noktalarını etkin bir şekilde kullanmanıza yardımcı olacaktır.</p>
            </div>
            <div class="bg-white p-6 sm:p-8 rounded-2xl shadow-sm border border-slate-200">
                 <h2 class="text-2xl font-bold text-slate-900 mb-6 text-center">API Yapısına Genel Bakış</h2>
                 <p class="text-center text-slate-600 mb-8">Aşağıdaki grafikler, API'nin genel yapısını ve yetkilendirme dağılımını özetlemektedir. Bu görseller, API'nin hangi alanlarda daha yoğun olduğunu ve güvenlik katmanlarını bir bakışta anlamanızı sağlar.</p>
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div class="w-full">
                        <h3 class="text-lg font-semibold text-slate-800 text-center mb-2">Uç Noktası Dağılımı</h3>
                        <div class="chart-container">
                            <canvas id="endpointsByCategoryChart"></canvas>
                        </div>
                    </div>
                    <div class="w-full">
                        <h3 class="text-lg font-semibold text-slate-800 text-center mb-2">Yetkilendirme Türleri</h3>
                        <div class="chart-container">
                            <canvas id="endpointsByAuthChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="setup" class="mb-16 scroll-mt-24">
            <h2 class="text-3xl font-bold text-slate-900 mb-2">🚀 Projeyi Çalıştırma</h2>
            <p class="text-slate-600 mb-8">Projeyi yerel makinenizde Docker kullanarak çalıştırmak için aşağıdaki adımları sırasıyla izleyin.</p>
            <div class="space-y-6">
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h3 class="font-bold text-slate-900"><span class="bg-indigo-100 text-indigo-800 text-sm font-semibold mr-2 px-2.5 py-0.5 rounded-full">Adım 1</span>Gerekli Dosyaları Kopyalayın</h3>
                    <p class="text-slate-600 my-2">Projenin kök dizininde bulunan `.env.example` dosyasını `.env` olarak kopyalayın.</p>
                    <div class="bg-slate-800 text-white p-4 rounded-lg font-mono text-sm relative">
                        cp .env.example .env
                        <button class="copy-btn absolute top-2 right-2 bg-slate-600 hover:bg-slate-500 text-white py-1 px-2 rounded-md text-xs">Kopyala</button>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h3 class="font-bold text-slate-900"><span class="bg-indigo-100 text-indigo-800 text-sm font-semibold mr-2 px-2.5 py-0.5 rounded-full">Adım 2</span>Docker Konteynerlerini Başlatın</h3>
                    <p class="text-slate-600 my-2">Docker konteynerlerini başlatarak Laravel uygulamanızı ve veritabanını ayağa kaldırın.</p>
                    <div class="bg-slate-800 text-white p-4 rounded-lg font-mono text-sm relative">
                        ./vendor/bin/sail up -d
                        <button class="copy-btn absolute top-2 right-2 bg-slate-600 hover:bg-slate-500 text-white py-1 px-2 rounded-md text-xs">Kopyala</button>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h3 class="font-bold text-slate-900"><span class="bg-indigo-100 text-indigo-800 text-sm font-semibold mr-2 px-2.5 py-0.5 rounded-full">Adım 3</span>Composer Paketlerini Kurun</h3>
                    <p class="text-slate-600 my-2">Docker konteyneri içinde Composer bağımlılıklarını kurun.</p>
                    <div class="bg-slate-800 text-white p-4 rounded-lg font-mono text-sm relative">
                        ./vendor/bin/sail composer install
                        <button class="copy-btn absolute top-2 right-2 bg-slate-600 hover:bg-slate-500 text-white py-1 px-2 rounded-md text-xs">Kopyala</button>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h3 class="font-bold text-slate-900"><span class="bg-indigo-100 text-indigo-800 text-sm font-semibold mr-2 px-2.5 py-0.5 rounded-full">Adım 4</span>Uygulama Anahtarını Oluşturun</h3>
                    <p class="text-slate-600 my-2">`.env` dosyasındaki `APP_KEY` değerini oluşturun.</p>
                    <div class="bg-slate-800 text-white p-4 rounded-lg font-mono text-sm relative">
                        ./vendor/bin/sail artisan key:generate
                        <button class="copy-btn absolute top-2 right-2 bg-slate-600 hover:bg-slate-500 text-white py-1 px-2 rounded-md text-xs">Kopyala</button>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200">
                    <h3 class="font-bold text-slate-900"><span class="bg-indigo-100 text-indigo-800 text-sm font-semibold mr-2 px-2.5 py-0.5 rounded-full">Adım 5</span>Veritabanını Hazırlayın</h3>
                    <p class="text-slate-600 my-2">Veritabanı tablolarını oluşturun (migration) ve varsayılan verileri yükleyin (seeder).</p>
                    <div class="bg-slate-800 text-white p-4 rounded-lg font-mono text-sm relative">
                        ./vendor/bin/sail artisan migrate:fresh --seed
                        <button class="copy-btn absolute top-2 right-2 bg-slate-600 hover:bg-slate-500 text-white py-1 px-2 rounded-md text-xs">Kopyala</button>
                    </div>
                </div>
                 <div class="bg-green-100 border-l-4 border-green-500 text-green-800 p-4 rounded-r-lg" role="alert">
                    <p class="font-bold">Uygulamaya Erişin</p>
                    <p>Projeniz artık hazır! Tarayıcınızdan <a href="http://localhost" target="_blank" class="font-semibold underline">http://localhost</a> adresine giderek Laravel'in karşılama sayfasını görebilirsiniz. API uç noktalarına ise <a href="http://localhost/api" target="_blank" class="font-semibold underline">http://localhost/api</a> üzerinden erişebilirsiniz.</p>
                </div>
            </div>
        </section>

        <section id="users" class="mb-16 scroll-mt-24">
            <h2 class="text-3xl font-bold text-slate-900 mb-2">👤 Örnek Kullanıcılar</h2>
            <p class="text-slate-600 mb-8">Proje veritabanına `migrate:fresh --seed` komutuyla aşağıdaki örnek kullanıcılar yüklenmiştir. Bu kullanıcılarla API'yi test edebilirsiniz.</p>
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left text-slate-500">
                        <thead class="text-xs text-slate-700 uppercase bg-slate-100">
                            <tr>
                                <th scope="col" class="px-6 py-3">Rol</th>
                                <th scope="col" class="px-6 py-3">E-posta</th>
                                <th scope="col" class="px-6 py-3">Parola</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="bg-white border-b">
                                <td class="px-6 py-4 font-medium text-slate-900"><span class="bg-red-100 text-red-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-full">Admin</span></td>
                                <td class="px-6 py-4 font-mono">admin@example.com</td>
                                <td class="px-6 py-4 font-mono">password</td>
                            </tr>
                            <tr class="bg-white border-b">
                                <td class="px-6 py-4 font-medium text-slate-900"><span class="bg-blue-100 text-blue-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-full">Customer</span></td>
                                <td class="px-6 py-4 font-mono">customer1@example.com</td>
                                <td class="px-6 py-4 font-mono">customer1</td>
                            </tr>
                            <tr class="bg-white border-b">
                                <td class="px-6 py-4 font-medium text-slate-900"><span class="bg-blue-100 text-blue-800 text-xs font-medium mr-2 px-2.5 py-0.5 rounded-full">Customer</span></td>
                                <td class="px-6 py-4 font-mono">customer2@example.com</td>
                                <td class="px-6 py-4 font-mono">customer2</td>
                            </tr>
                            <tr class="bg-white">
                                <td class="px-6 py-4 font-medium text-slate-900">...</td>
                                <td class="px-6 py-4 font-mono">...</td>
                                <td class="px-6 py-4 font-mono">...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <section id="endpoints" class="scroll-mt-24">
            <h2 class="text-3xl font-bold text-slate-900 mb-2">🔌 API Uç Noktaları</h2>
            <p class="text-slate-600 mb-8">Tüm API uç noktaları için `http://localhost` temel URL'sini kullanın. Korumalı uç noktalar için `Bearer token`'ı `Authorization` başlığında göndermeniz gerekmektedir.</p>
            
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-2 sm:p-4">
                <div class="mb-4 border-b border-slate-200">
                    <nav class="-mb-px flex space-x-2 sm:space-x-4" aria-label="Tabs">
                        <button data-tab="auth" class="tab-btn whitespace-nowrap py-3 px-2 sm:px-4 border-b-2 font-medium text-sm border-indigo-500 text-indigo-600">Kimlik Doğrulama</button>
                        <button data-tab="products" class="tab-btn whitespace-nowrap py-3 px-2 sm:px-4 border-b-2 font-medium text-sm border-transparent text-slate-500 hover:text-slate-700 hover:border-slate-300">Ürünler</button>
                        <button data-tab="orders" class="tab-btn whitespace-nowrap py-3 px-2 sm:px-4 border-b-2 font-medium text-sm border-transparent text-slate-500 hover:text-slate-700 hover:border-slate-300">Siparişler</button>
                    </nav>
                </div>

                <div id="auth" class="tab-content">
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-slate-500">
                            <thead class="text-xs text-slate-700 uppercase bg-slate-50"><tr><th class="px-6 py-3">Metot</th><th class="px-6 py-3">Uç Nokta</th><th class="px-6 py-3">Açıklama</th></tr></thead>
                            <tbody>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-green-100 text-green-800 font-bold p-2 rounded">POST</span></td><td class="px-6 py-4 font-mono relative">/api/register<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Yeni kullanıcı kaydı.</td></tr>
                                <tr class="bg-white"><td class="px-6 py-4"><span class="bg-green-100 text-green-800 font-bold p-2 rounded">POST</span></td><td class="px-6 py-4 font-mono relative">/api/login<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Kullanıcı girişi ve token alma.</td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="products" class="tab-content hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-slate-500">
                            <thead class="text-xs text-slate-700 uppercase bg-slate-50"><tr><th class="px-6 py-3">Metot</th><th class="px-6 py-3">Uç Nokta</th><th class="px-6 py-3">Açıklama</th><th class="px-6 py-3">Yetki</th></tr></thead>
                            <tbody>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-sky-100 text-sky-800 font-bold p-2 rounded">GET</span></td><td class="px-6 py-4 font-mono relative">/api/products<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Tüm ürünleri listele.</td><td class="px-6 py-4"><span class="bg-gray-100 text-gray-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Herkes</span></td></tr>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-green-100 text-green-800 font-bold p-2 rounded">POST</span></td><td class="px-6 py-4 font-mono relative">/api/products<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Yeni ürün oluştur.</td><td class="px-6 py-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Admin</span></td></tr>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-orange-100 text-orange-800 font-bold p-2 rounded">PUT</span></td><td class="px-6 py-4 font-mono relative">/api/products/{id}<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Ürünü güncelle.</td><td class="px-6 py-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Admin</span></td></tr>
                                <tr class="bg-white"><td class="px-6 py-4"><span class="bg-red-200 text-red-900 font-bold p-2 rounded">DELETE</span></td><td class="px-6 py-4 font-mono relative">/api/products/{id}<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Ürünü sil.</td><td class="px-6 py-4"><span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Admin</span></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="orders" class="tab-content hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-slate-500">
                            <thead class="text-xs text-slate-700 uppercase bg-slate-50"><tr><th class="px-6 py-3">Metot</th><th class="px-6 py-3">Uç Nokta</th><th class="px-6 py-3">Açıklama</th><th class="px-6 py-3">Yetki</th></tr></thead>
                            <tbody>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-sky-100 text-sky-800 font-bold p-2 rounded">GET</span></td><td class="px-6 py-4 font-mono relative">/api/orders<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Siparişleri listele (Admin için tümü, Müşteri için kendi siparişleri).</td><td class="px-6 py-4"><span class="bg-purple-100 text-purple-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Auth</span></td></tr>
                                <tr class="bg-white border-b"><td class="px-6 py-4"><span class="bg-sky-100 text-sky-800 font-bold p-2 rounded">GET</span></td><td class="px-6 py-4 font-mono relative">/api/orders/{id}<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Belirli bir siparişi görüntüle.</td><td class="px-6 py-4"><span class="bg-purple-100 text-purple-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Auth</span></td></tr>
                                <tr class="bg-white"><td class="px-6 py-4"><span class="bg-green-100 text-green-800 font-bold p-2 rounded">POST</span></td><td class="px-6 py-4 font-mono relative">/api/orders<button class="copy-btn absolute top-1/2 -translate-y-1/2 right-2 bg-slate-200 hover:bg-slate-300 text-slate-700 py-1 px-2 rounded-md text-xs">Kopyala</button></td><td class="px-6 py-4">Yeni sipariş oluştur.</td><td class="px-6 py-4"><span class="bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Customer</span></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="bg-white border-t border-slate-200 mt-16">
        <div class="container mx-auto py-6 px-4 sm:px-6 lg:px-8 text-center text-slate-500 text-sm">
            <p>&copy; 2025 B2B Sipariş API. İnteraktif dokümantasyon.</p>
        </div>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const baseUrl = 'http://localhost';

            // Mobile Navigation
            const mobileNav = document.getElementById('mobile-nav');
            mobileNav.addEventListener('change', (e) => {
                window.location.hash = e.target.value;
            });

            // Copy to clipboard functionality
            document.querySelectorAll('.copy-btn').forEach(button => {
                button.addEventListener('click', function (e) {
                    const parent = this.parentElement;
                    const textToCopy = parent.innerText.replace(this.innerText, '').trim();
                    
                    navigator.clipboard.writeText(textToCopy).then(() => {
                        let feedback = parent.querySelector('.copied-feedback');
                        if (!feedback) {
                            feedback = document.createElement('div');
                            feedback.className = 'copied-feedback';
                            feedback.innerText = 'Kopyalandı!';
                            parent.appendChild(feedback);
                        }
                        
                        requestAnimationFrame(() => {
                            feedback.style.opacity = '1';
                            feedback.style.top = '-2rem';
                        });

                        setTimeout(() => {
                            feedback.style.opacity = '0';
                            feedback.style.top = '-2.5rem';
                        }, 2000);

                    }).catch(err => {
                        console.error('Kopyalama başarısız oldu: ', err);
                    });
                });
            });

            // Tabs for API endpoints
            const tabButtons = document.querySelectorAll('.tab-btn');
            const tabContents = document.querySelectorAll('.tab-content');

            tabButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const tabId = button.dataset.tab;

                    tabButtons.forEach(btn => {
                        btn.classList.remove('border-indigo-500', 'text-indigo-600');
                        btn.classList.add('border-transparent', 'text-slate-500', 'hover:text-slate-700', 'hover:border-slate-300');
                    });

                    button.classList.add('border-indigo-500', 'text-indigo-600');
                    button.classList.remove('border-transparent', 'text-slate-500');

                    tabContents.forEach(content => {
                        if (content.id === tabId) {
                            content.classList.remove('hidden');
                        } else {
                            content.classList.add('hidden');
                        }
                    });
                });
            });

            // Chart.js implementation
            const chartOptions = {
                maintainAspectRatio: false,
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        backgroundColor: '#1e293b',
                        titleFont: { size: 14, weight: 'bold' },
                        bodyFont: { size: 12 },
                        padding: 10,
                        cornerRadius: 4,
                        displayColors: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: '#475569',
                            font: { size: 12 },
                            stepSize: 1
                        },
                        grid: {
                            color: '#e2e8f0'
                        }
                    },
                    x: {
                        ticks: {
                            color: '#475569',
                            font: { size: 12 }
                        },
                        grid: {
                            display: false
                        }
                    }
                }
            };

            // Chart 1: Endpoints by Category
            const ctxCategory = document.getElementById('endpointsByCategoryChart').getContext('2d');
            new Chart(ctxCategory, {
                type: 'bar',
                data: {
                    labels: ['Kimlik Doğrulama', 'Ürünler', 'Siparişler'],
                    datasets: [{
                        label: 'Uç Noktası Sayısı',
                        data: [2, 4, 3],
                        backgroundColor: ['#818cf8', '#60a5fa', '#34d399'],
                        borderColor: ['#6366f1', '#3b82f6', '#10b981'],
                        borderWidth: 1,
                        borderRadius: 4
                    }]
                },
                options: chartOptions
            });

            // Chart 2: Endpoints by Authorization
            const ctxAuth = document.getElementById('endpointsByAuthChart').getContext('2d');
            new Chart(ctxAuth, {
                type: 'bar',
                data: {
                    labels: ['Herkes', 'Admin', 'Auth', 'Customer'],
                    datasets: [{
                        label: 'Uç Noktası Sayısı',
                        data: [1, 3, 2, 1],
                        backgroundColor: ['#9ca3af', '#f87171', '#a78bfa', '#60a5fa'],
                        borderColor: ['#6b7280', '#ef4444', '#8b5cf6', '#3b82f6'],
                        borderWidth: 1,
                        borderRadius: 4
                    }]
                },
                options: chartOptions
            });
        });
    </script>
</body>
</html>
