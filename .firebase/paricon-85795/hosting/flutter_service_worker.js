'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"firebase-debug.log": "4e85cb268609cfe5387bea5502a1333e",
"version.json": "3f84b36312b62275b0942beab4883cfa",
"splash/img/light-2x.png": "96e883bc95e62dd30e43d2007421dad5",
"splash/img/dark-4x.png": "8b7541f98ca620b56e542232e77018a2",
"splash/img/light-3x.png": "84119d02c84177c5c45ed08246863731",
"splash/img/dark-3x.png": "84119d02c84177c5c45ed08246863731",
"splash/img/light-4x.png": "8b7541f98ca620b56e542232e77018a2",
"splash/img/dark-2x.png": "96e883bc95e62dd30e43d2007421dad5",
"splash/img/dark-1x.png": "9deecc59250c3748eaf091fd81878e76",
"splash/img/light-1x.png": "9deecc59250c3748eaf091fd81878e76",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "7e396886ad3c481f19e6e6f7f6472028",
"index.html": "c0fffb8c7f4656c6d8026e379807141c",
"/": "c0fffb8c7f4656c6d8026e379807141c",
"main.dart.js": "e1164bb59db71cf92e8b367ee44533b0",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.jpg": "fe8623b85671f3690a90fa753fd42f4f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "9b8fba25ef6ef48c534a996e17e61417",
"assets/images/welcome_screen.png": "04401d8511e1c390bcdc088a93d87601",
"assets/images/pi_icon_yellow.png": "c0270ad921afecf2dd257279b27e3d91",
"assets/images/pi.png": "c588d3898f99d803425ffc0a550e1190",
"assets/images/app-store-badge.svg": "2928664fe1fc6aca88583a6f606d60ba",
"assets/images/google-play-badge.png": "1e91d02cf5a902f38f2923c006d79281",
"assets/images/gLogo.png": "362a9ac6b7369723ac970f45488b9c6a",
"assets/images/pi2.png": "e8929c04af1edee682853ca0276f0717",
"assets/AssetManifest.json": "bf86cbc6b837df57e82f6ccd2eb3beb6",
"assets/NOTICES": "40e48501fd45abda6449545a86883c69",
"assets/audio/pi-intro.mov": "12f31f84cf2f567e61908d6320964d24",
"assets/audio/sacharja.mp3": "7401fc84390345e631dd5c17c173330d",
"assets/FontManifest.json": "6233869480b2564bcbcc1d86c9815fad",
"assets/AssetManifest.bin.json": "0f4be084826ef0372b535159ccbb2176",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lottie/profile-settings.json": "9ecfe6e3fb77eab6c97b9df5de3777ac",
"assets/lottie/b_female_01.json": "4e0d1fa3f37251aab77f6e274297b2c9",
"assets/lottie/error_404.json": "665e1bd0e3c705eb2b1baaf0775c0265",
"assets/lottie/friends-playing.json": "37a8208ebaf47706eb784b8253f8398a",
"assets/lottie/b_male_01.json": "8fe0aaf4a14b0b72ef3cac1d9caf8bef",
"assets/lottie/trophy.json": "55b9e56e8e931894bafe5b182c38cf41",
"assets/lottie/app_update.json": "2a4f061237bf9efcbf3cd8c694994e7a",
"assets/lottie/waving_hand.json": "241c1044ea7daeefd070c8f30a26509f",
"assets/lottie/no_net.json": "9e897cef935476f8b69892ab01aaf127",
"assets/lottie/trophies.json": "0e4d92e53cf4433ef59a73991e29e7be",
"assets/lottie/developer_typing.json": "f90502ecf58d8e13f767607461d9bb95",
"assets/lottie/online-players.json": "130e35632a5faab3118ea3e3e7a0c690",
"assets/lottie/avatar-outline.json": "a2bc655e006b23bfd7f6b87578b3625d",
"assets/AssetManifest.bin": "fd170a1ea1365ade101b026574bd0b3f",
"assets/fonts/Questrial-Regular.ttf": "74a3a9121f919fdb9e61ee96b545ed1e",
"assets/fonts/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/fonts/WendyOne-Regular.ttf": "67fbaacb77b660209fd5e314c425aa09",
"assets/fonts/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/fonts/MaterialIcons-Regular.otf": "82d71b6eaa25415a7403c84b1bae3424",
"assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/fonts/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/fonts/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
