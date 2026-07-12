// Offline service worker: cache-first for everything the game touches.
const CACHE='maxi-rush-v1';
self.addEventListener('install',e=>{self.skipWaiting();
  e.waitUntil(caches.open(CACHE).then(c=>c.addAll(['./','./index.html'])));});
self.addEventListener('activate',e=>e.waitUntil(clients.claim()));
self.addEventListener('fetch',e=>{
  e.respondWith(caches.match(e.request).then(hit=>hit||fetch(e.request).then(r=>{
    if(r.ok&&e.request.method==='GET'){const cl=r.clone();caches.open(CACHE).then(c=>c.put(e.request,cl));}
    return r;
  }).catch(()=>hit)));
});
