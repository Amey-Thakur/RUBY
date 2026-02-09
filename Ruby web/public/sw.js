// Minimal Service Worker for PWA
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open('ruby-v1').then((cache) => {
            return cache.addAll([
                'index.html',
                'style.css',
                'js/app.js',
                'js/data.js',
                'assets/Ruby Logo.png'
            ]);
        })
    );
});

self.addEventListener('fetch', (event) => {
    event.respondWith(
        caches.match(event.request).then((response) => {
            return response || fetch(event.request);
        })
    );
});
