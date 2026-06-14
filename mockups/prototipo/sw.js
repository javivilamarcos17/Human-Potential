// SW de desarrollo: NO cachea (evita servir versiones viejas). Limpia cachés previas.
// En producción se puede reactivar el cache-first para offline.
self.addEventListener('install', e => self.skipWaiting());
self.addEventListener('activate', e => e.waitUntil(
  caches.keys().then(ks => Promise.all(ks.map(k => caches.delete(k)))).then(() => self.clients.claim())
));
// sin handler de 'fetch' → todas las peticiones van a la red normal, siempre lo último
