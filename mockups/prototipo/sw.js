// Service worker mínimo: la app funciona sin conexión (cache-first del shell).
const C='af-v1';
self.addEventListener('install',e=>{e.waitUntil(caches.open(C).then(c=>c.addAll(['app-funcional.html','tokens.css'])));self.skipWaiting();});
self.addEventListener('activate',e=>e.waitUntil(clients.claim()));
self.addEventListener('fetch',e=>{e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request).then(n=>{if(e.request.method==='GET'&&n.ok){const cl=n.clone();caches.open(C).then(c=>c.put(e.request,cl));}return n;}).catch(()=>r)));});
