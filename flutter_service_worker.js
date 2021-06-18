'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b79513a79fda498f81eb4dffc43fd166",
"assets/assets/icons/0.svg": "39780cf3224e65ee76d6725ebc6a844d",
"assets/assets/icons/200.svg": "fcad7b54d35acad5cd759d66f8d63e00",
"assets/assets/icons/201.svg": "e267b8cb502fd864135777da119d143c",
"assets/assets/icons/202.svg": "621f38b6894149f5057abe27ac02eb21",
"assets/assets/icons/210.svg": "408c70a1d891285c59f29531ce1ecf6f",
"assets/assets/icons/211.svg": "e86c151f07af65366a1e7c9749b8223e",
"assets/assets/icons/212.svg": "5871672e26cae7b035f9a7e0ac5a2b91",
"assets/assets/icons/221.svg": "cb1a4842633d4612eb4ebea6acfece28",
"assets/assets/icons/230.svg": "94d259d8e1e5291596350f215ab8202b",
"assets/assets/icons/231.svg": "d6dc6835460f6faafcece5a45cad2e0a",
"assets/assets/icons/232.svg": "cbe8b199d27dafe44ea583d29f310f7d",
"assets/assets/icons/300.svg": "14f73698bfc9e41182b9986d2c067001",
"assets/assets/icons/301.svg": "f00b71c034d68eae83830967053a61e0",
"assets/assets/icons/302.svg": "e5e1619a1749c4c4569a0c76fdb83215",
"assets/assets/icons/310.svg": "bee78d7a60c36cb82aac77c12711959a",
"assets/assets/icons/311.svg": "1fa7a56a50e937291bbe1ba13233a607",
"assets/assets/icons/312.svg": "e9bbbd32256203d2d4b51f8c6c47d950",
"assets/assets/icons/313%2520%25E2%2580%2593%25201.svg": "c1f3cfd09039137afce66e6a3d890f56",
"assets/assets/icons/313.svg": "21824efb14c53ab9c0fc5115dbde901f",
"assets/assets/icons/313n.svg": "063283751cdfd746b586b70048032b12",
"assets/assets/icons/314%2520%25E2%2580%2593%25201.svg": "53ae92406bb6089a5cb8ebd53eab15b7",
"assets/assets/icons/314.svg": "3d53cd1a50628cae38585f00c9c2d0a2",
"assets/assets/icons/314n.svg": "322dcd07e32b3d046be031b5fc2404fb",
"assets/assets/icons/321%2520%25E2%2580%2593%25201.svg": "4c8ced2942f127b46a175df60314670e",
"assets/assets/icons/321.svg": "283b424763b8f9a43c887bc6c5d13dda",
"assets/assets/icons/321n.svg": "7b5b10768922ae04b608e3b8c208e4a7",
"assets/assets/icons/500.svg": "9bdb97aae14882ffe0aa6b6c50920ec9",
"assets/assets/icons/501.svg": "875950b6beee1574b1fea6459743fd57",
"assets/assets/icons/502.svg": "d1ddc78b79f9d59c5e4a3d4cb2c8fcaa",
"assets/assets/icons/503.svg": "4690ced2ff6c55aa8c551997f3acbc07",
"assets/assets/icons/504.svg": "557d8427a3713a4486530bed88238932",
"assets/assets/icons/511.svg": "277525c0905c4b77459b07d8f1f4e1d7",
"assets/assets/icons/520.svg": "425f41e30f9fb3bdda0e2ac09817df12",
"assets/assets/icons/520n.svg": "270f5ed0405fee9d71bf61605205ea3e",
"assets/assets/icons/521.svg": "6b7d38635cc8890b1d9530b33c3282ea",
"assets/assets/icons/521n.svg": "2e1c7131ce573dcc9e6896b26f139baf",
"assets/assets/icons/522.svg": "7af92abe770171cda67f472f93d2d1ea",
"assets/assets/icons/522n.svg": "2bde819f258f19ba50e0aa6c332ab783",
"assets/assets/icons/531.svg": "8c794276619fa690ccd0e2b99a215d3c",
"assets/assets/icons/600.svg": "da93aabb2a5268a9b87dd06b1c5efc9d",
"assets/assets/icons/601.svg": "13c6e8a8a8108fae64d4d25d9d508010",
"assets/assets/icons/602.svg": "ff9a63444da5938343c89fe221420d06",
"assets/assets/icons/611.svg": "2d95ee9f9c9aff588462660a37abd45f",
"assets/assets/icons/612.svg": "907983c374d89a466968578f814af8d7",
"assets/assets/icons/612n.svg": "a5000078c1ab0d6d0d3c2b4e884b4b9a",
"assets/assets/icons/613.svg": "41d2b8021e1b8a3117cf16c4f763c452",
"assets/assets/icons/613n.svg": "df9363b431441343590839a75ffe9dd6",
"assets/assets/icons/615.svg": "cbfda920d5d999f81bdeec9f47b29851",
"assets/assets/icons/616.svg": "4f555f57392d820cade5af5af356040b",
"assets/assets/icons/620.svg": "bbffcd6f4b36427e6768058301333aae",
"assets/assets/icons/620n.svg": "69f57ae91e286b16a389e9e7e859a1f8",
"assets/assets/icons/621.svg": "dd3aaf75b0e8edd97830f32615ddfadc",
"assets/assets/icons/621n.svg": "9be2547f2dd4af48079cc2e2f8a7e976",
"assets/assets/icons/622.svg": "95c1858ccf9505efd950c51484697e31",
"assets/assets/icons/622n.svg": "bd245995c376796d117ff87c8d32dd2e",
"assets/assets/icons/701.svg": "2f7d09f2716ff6640819f24d2d3443fb",
"assets/assets/icons/711.svg": "9b1c22792ef15e95fbc5389df1874355",
"assets/assets/icons/721.svg": "1126eab294afe1874464ffbac1e3e46f",
"assets/assets/icons/731.svg": "ce85289769d4699d306f8cf31888893a",
"assets/assets/icons/741.svg": "7066101f785f7c744b31e6ced52e32da",
"assets/assets/icons/751.svg": "9e02b8bdf109e68b47647591fb92427b",
"assets/assets/icons/761.svg": "95edf925853f411249f9b31bdfcc5370",
"assets/assets/icons/762.svg": "fa2cfeb1d62eb56fd743a9b74f6c6b3f",
"assets/assets/icons/771.svg": "c0c4ddc1fe85ca22e71079a0a1845f78",
"assets/assets/icons/781.svg": "5cda685a4c3f1409ccf4431ee9fccbc5",
"assets/assets/icons/800.svg": "29a1b591b27753a9cf7e899b13588ef7",
"assets/assets/icons/800n.svg": "0f58eb92becb859fcf07614e2cb1c674",
"assets/assets/icons/801.png": "1c835e6b81028144a42fa12a33ccb6d9",
"assets/assets/icons/801.svg": "dd140a81d49b2129507490c4b46aaec6",
"assets/assets/icons/801n.svg": "546e7ff1d2eb625c3b6a884f8072f937",
"assets/assets/icons/802.svg": "a1ea252f35928ce9fe22d68ce3221019",
"assets/assets/icons/802n.svg": "b413526df798da70e3bcd6105fbe7229",
"assets/assets/icons/803.svg": "f6332cd1bd9f468d6ac7a150f2aae9ca",
"assets/assets/icons/803n.svg": "53541b4b9293b7c49a60e6718f0b2270",
"assets/assets/icons/804.svg": "1204543c9017bccc304f56a8e90f153d",
"assets/assets/icons/804n.svg": "274de691dd9a2a4f99308ac3c8242fe4",
"assets/assets/icons/humidity.svg": "9dc4d50c579fd60f84f3563f1f81d886",
"assets/assets/icons/menu.svg": "5bbfd5e866167a7fc0a0de5a9fe01523",
"assets/assets/icons/min_max.svg": "48a2899794e0c1efb461338f4daebaf5",
"assets/assets/icons/pressure.svg": "f02f1264a112e2a8803a4b5765618a7f",
"assets/assets/icons/search.svg": "a2457d8b09b7aa5d99e9e99b931b7218",
"assets/assets/icons/sunrise.svg": "230051fbd68c490a9d63f1f63f2c7e4f",
"assets/assets/icons/sunset.svg": "858d9ab794f99767adf5f3dfdcc3518f",
"assets/assets/icons/thermometer.svg": "ec5dfa961f776160fe9558802cbb9750",
"assets/assets/icons/wind.svg": "f522455328543df153447fc8d6bd200e",
"assets/assets/images/background.svg": "74a77c77a59871ae7c3320020ab4666c",
"assets/assets/images/clouds_background.jpg": "539048881444e6eb758ab910856b5f4a",
"assets/assets/images/launcher.png": "146656e43b881cca934e3092c1c5543d",
"assets/assets/images/launcher_bg.png": "a4a36d8c9549f02cccbe22b45243879f",
"assets/assets/images/launcher_fg.png": "0b02bf9e3af70da0e413c0b77f5f2393",
"assets/assets/images/location_unknown.svg": "11b86e8f83986a5a1c5f7c71d1839daa",
"assets/FontManifest.json": "2e7b04f9be0c95e9325585843f586fe4",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/quicksand/Quicksand-Bold.ttf": "0738679df4cf4e566f60343830da7bfa",
"assets/fonts/quicksand/Quicksand-Light.ttf": "188ca708e4cbbbe3837c3d904b8eeb61",
"assets/fonts/quicksand/Quicksand-Medium.ttf": "865b25e449878b6b4d1f9e098ff2f510",
"assets/fonts/quicksand/Quicksand-Regular.ttf": "216d43ee8707910af457af569eda1dec",
"assets/fonts/quicksand/Quicksand-SemiBold.ttf": "c82b184bf7450e14adccb7b0d6117474",
"assets/fonts/roboto/Roboto-Black.ttf": "5ebb24ee1112dd9562629375c387879a",
"assets/fonts/roboto/Roboto-BlackItalic.ttf": "99682a78fa4fe61e1177b94757336bbf",
"assets/fonts/roboto/Roboto-Bold.ttf": "e07df86cef2e721115583d61d1fb68a6",
"assets/fonts/roboto/Roboto-BoldItalic.ttf": "5b44818d2b9eda3e23cd5edd7b49b7d5",
"assets/fonts/roboto/Roboto-Italic.ttf": "a720f17aa773e493a7ebf8b08459e66c",
"assets/fonts/roboto/Roboto-Light.ttf": "88823c2015ffd5fa89d567e17297a137",
"assets/fonts/roboto/Roboto-LightItalic.ttf": "a3ce4440f2abf76f4a1b14b83920138c",
"assets/fonts/roboto/Roboto-Medium.ttf": "58aef543c97bbaf6a9896e8484456d98",
"assets/fonts/roboto/Roboto-MediumItalic.ttf": "cf23e1bb619029496260760b72aebd30",
"assets/fonts/roboto/Roboto-Regular.ttf": "11eabca2251325cfc5589c9c6fb57b46",
"assets/fonts/roboto/Roboto-Thin.ttf": "321de678e592d0b8f44f1a82d7ca4b62",
"assets/NOTICES": "0542d8aa25523579723e7dccbd01622a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "174c02fc4609e8fc4389f5d21f16a296",
"favicon.svg": "dd140a81d49b2129507490c4b46aaec6",
"icons/favicon.svg": "dd140a81d49b2129507490c4b46aaec6",
"index.html": "8e101927da1233b088fb2b339c696025",
"/": "8e101927da1233b088fb2b339c696025",
"main.dart.js": "9daee432857bd9d099e17df94cc0e015",
"manifest.json": "facda670ec0b4728ef0f296b422d40c9",
"version.json": "950ba10da9e27f4a0ad1ed8daed26d04"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
