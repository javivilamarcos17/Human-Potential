// Network-first: siempre la última versión si hay conexión; cache solo como respaldo offline.
const C='af-v2';
self.addEventListener('install',e=>{self.skipWaiting();});
self.addEventListener('activate',e=>{e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==C).map(k=>caches.delete(k)))).then(()=>clients.claim()));});
self.addEventListener('fetch',e=>{
  e.respondWith(fetch(e.request).then(n=>{
    if(e.request.method==='GET'&&n.ok){const cl=n.clone();caches.open(C).then(c=>c.put(e.request,cl));}
    return n;
  }).catch(()=>caches.match(e.request)));
});
