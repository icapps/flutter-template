'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0f5080b64f1cc84baebe35224d7d7287",
"version.json": "9692e6a2dac4ad01af0fd4a3db0756bd",
"index.html": "fb1359bfe9c5a7a3dc4ca69e04a3cf54",
"/": "fb1359bfe9c5a7a3dc4ca69e04a3cf54",
"main.dart.js": "32cb95d9dfa06c4c74fea2eca0792030",
"sqlite3.wasm": "fa7637a49a0e434f2a98f9981856d118",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "9ea0ad60aa00424a0872129e2bb87f22",
"drift_worker.dart.js": "5720b04ea6210f71ed5da2196082884d",
"assets/AssetManifest.json": "c00ac345b689f60a50d01220c3b3ffc8",
"assets/NOTICES": "6be1437ab2ab48595eab73867aff0511",
"assets/FontManifest.json": "f4206e2cb60b26b5d125cce7310a6d92",
"assets/AssetManifest.bin.json": "d83b4f4ffd587e1d6ab8bdd08bf15e6a",
"assets/packages/widgetbook/assets/logo.png": "445292cbfde4f60d5b3dca36d0d6dfb2",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBoldItalic.ttf": "8afe4dc13b83b66fec0ea671419954cc",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/packages/icapps_icons/lib/fonts/icappsIcons.ttf": "2fa4848ae17c2f8d21b53e010e7f569e",
"assets/packages/icapps_icons/fonts/icappsIcons.ttf": "c2f0d58408844577f0ee0dc01d025e76",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "42afd9d59b7c3990bb9495bc3cc4c0b4",
"assets/fonts/MaterialIcons-Regular.otf": "aa72c692cd2f8e43cdc7700eb49d02d7",
"assets/assets/locale/nl.json": "260688a080427a9b143aa33999118ceb",
"assets/assets/locale/en.json": "35541374286063a5c7a6e63c9d1a2796",
"assets/assets/images/icons/list.svg": "f860040a0e358994a97818e148cc8892",
"assets/assets/images/icons/settings_inactive.svg": "69dedd0021740bb04a3df3364ef401ff",
"assets/assets/images/icons/theme.svg": "48e257b66fd900356505e2ac783e19ad",
"assets/assets/images/icons/animation.svg": "3f794073a4dea0dd3dd6ad52e1336bbf",
"assets/assets/images/icons/file.svg": "4e440b1c250d687a7b34926738517aa1",
"assets/assets/images/icons/todo_active.svg": "d6638ef9ec733b4d3b4994cd8cfc4f49",
"assets/assets/images/icons/arrow_left.svg": "b29de3832f78288407ea9b8fd1f215e5",
"assets/assets/images/icons/download.svg": "794f79905c1f0f088303a8d7f4df3a73",
"assets/assets/images/icons/chevron_right.svg": "6ddf5dd8f3b7187da17275714986f2f6",
"assets/assets/images/icons/check.svg": "8dc851249dcf41aefa09a153a8995e26",
"assets/assets/images/icons/lock_open.svg": "11be3e1cc92d197ff80f83c93bc20443",
"assets/assets/images/icons/add.svg": "7a907a9165f571ddb10287a91cba5608",
"assets/assets/images/icons/todo_inactive.svg": "482df6fb96d1d6ea3ef2edcd455d339c",
"assets/assets/images/icons/box.svg": "2314db38f594041ff64eee510fa14822",
"assets/assets/images/icons/translations.svg": "7da05ab5b64e0735fe266b933289b044",
"assets/assets/images/icons/settings_active.svg": "416aee6b97c3f4e768a0c1a02ade1863",
"assets/assets/images/icons/license.svg": "f39950aef967cf565ae43451b0d1250e",
"assets/assets/images/analytics.svg": "cf0cc21ff95a33d9c49f3c4f3bde6373",
"assets/assets/api/todos.json": "25105c9c3f236a4ef6b41bfb744fbb3b",
"assets/assets/fonts/aeonik_pro/AeonikPro-Bold.otf": "add56d866715d012335575372ecf5a8d",
"assets/assets/fonts/aeonik_pro/AeonikPro-Light.otf": "92ad79cf127403a2cd0e77144c35d142",
"assets/assets/fonts/aeonik_pro/AeonikPro-Medium.otf": "40a980f4087fb2e3295fb86c78f9ff0e",
"assets/assets/fonts/aeonik_pro/AeonikPro-Regular.otf": "efec5aa8649f0ca45548faa82c81f900",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
