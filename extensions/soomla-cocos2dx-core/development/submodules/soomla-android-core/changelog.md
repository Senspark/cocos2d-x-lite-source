### v1.1.1 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.1.0...v1.1.1)

* Fixes
  * Fixed getOnlyEncryptedKeys when there are unencrypted keys present

### v1.1.0 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.5...v1.1.0)

* New Features
  * KeyValueStorage - changed to allow multiple instances with different storage
  * KeyValueStorage - added method of getting query values with limit
  * Added generating a unique id per installation if androidId can't be fetched

* Changes
  * Removed libs from repo and added scripts to download dependencies

### v1.0.5 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.5...v1.0.5)

* Changes
  * Rebuilt library with Java 1.7

### v1.0.4 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.4...v1.0.4)

* Fixes
  * Changed the way we count references for Foreground service

### v1.0.3 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.2...v1.0.3)

* Fixes
  * Fixing AsyncTask class not found for lower Android versions as proposed [here](http://stackoverflow.com/questions/6968744/getting-noclassdeffounderror-android-os-asynctask)

### v1.0.2 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.1...v1.0.2)

* Fixes
  * Foreground is disabled on android versions < ICS
  * Foreground will be available on versions < ICS but events are only available on versions >= ICS

### v1.0.1 [view commit logs](https://github.com/soomla/soomla-android-core/compare/v1.0.0...v1.0.1)

* New Features
  * Added Foreground service that fires events when the app goes to background/foreground
  * Added functions to fetch or reset rewards state

* Fixes
  * Fixed an issue when reward last-given-time wasn't saved correctly

### v1.0.0

Initial version of the SOOMLA Core library for Android
