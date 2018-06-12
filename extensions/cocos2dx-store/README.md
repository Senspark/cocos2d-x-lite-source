# Looking for great devs who want maintain and moderate this project !!
# If you want to take over... contact us at os@soom.la

*This project is a part of The [SOOMLA](http://www.soom.la) Framework, which is a series of open source initiatives with a joint goal to help mobile game developers do more together. SOOMLA encourages better game design, economy modeling, social engagement, and faster development.*

Haven't you ever wanted an in-app purchase one liner that looks like this ?!

```cpp
soomla::CCStoreInventory::sharedStoreInventory()->buyItem("[itemId]", NULL);
```

cocos2dx-store
---

> The `master` branch supports cocos2d-x v3.x. For cocos2d-x v2.x use `cocos2dx-v2` branch.

> Draw your attention this page covers integration of C++ based solutions. If you need information regarding JS solution follow the link: https://github.com/soomla/cocos2dx-store/wiki/jsb#cocos2dx-store

**May 21st, 2015**: **cocos2dx-v2 is no longer supported** The branch will stay but won't be maintained. Starting to work on cocos2dx-v4 soon.

**April 1st, 2015**: v4.5 Event handlers replaced with Cocos2d-x event system (needs core update as well)

**March 16, 2015**: v4.4 Better integration for all Soomla modules in Cocos2d-x (needs core update as well)

**December 01, 2014**: v4.3.0 **Work Without a Device!** when working without a device, data is saved to UserDefault, you cannot test in-app purchases without a device

**February 4, 2014**: Added support for js-bindings.

**October 28, 2013**: iOS server side verification is added. This feature is not activated by default. [learn more](https://github.com/soomla/cocos2dx-store#ios-server-side-verification)


* More documentation and information in SOOMLA's [Knowledge Base](http://know.soom.la/docs/platforms/cocos2dx)  
* For issues you can use the [issues](https://github.com/soomla/cocos2dx-store/issues) section or SOOMLA's [Answers Website](http://answers.soom.la)

cocos2dx-store is the Cocos2d-x flavor of SOOMLA's Store Module.

## Economy Model
![SOOMLA's Economy Model](http://know.soom.la/img/tutorial_img/soomla_diagrams/EconomyModel.png)

## Example Project

A simple example project to show you some basic usage of cocos2dx-store: http://github.com/soomla/cocos2dx-store-example

This example is still under development but it can give you a taste of the important aspects of the framework.

## Download

#### Pre baked zip:

- [cocos2dx-store 4.6.3](http://library.soom.la/fetch/cocos2dx-store/4.6.3?cf=github)

#### From sources:
 - Clone this repository recursively: `git clone --recursive https://github.com/soomla/cocos2dx-store.git`
 - Run `./build_all` from project directory
 - Take created binaries from `build` directory and use it!

## Getting Started (With pre-built libraries)

*If you want to develop with sources, refer to the "Working with Sources" section below.*

> If you didn't already, clone the Cocos2d-x framework from [here](https://github.com/cocos2d/cocos2d-x), or download it from the [Cocos2d-x website](http://www.cocos2d-x.org/download). Make sure the version you clone is supported by SOOMLA's cocos2dx-store (the tag is the version).

1. Clone [soomla-cocos2dx-core](https://github.com/soomla/soomla-cocos2dx-core) and cocos2dx-store into the `extensions` folder located at the root of your Cocos2d-x framework.

	```
	$ git clone git@github.com:soomla/soomla-cocos2dx-core.git extensions/soomla-cocos2dx-core

	$ git clone git@github.com:soomla/cocos2dx-store.git extensions/cocos2dx-store
	```

2. cocos2dx-store uses a [fork](https://github.com/soomla/jansson) of the jansson library for JSON parsing. Clone it into the `external` directory at the root of your Cocos2d-x framework.

	```
	$ git clone git@github.com:soomla/jansson.git external/jansson
	```

3. Create your own implementation of `CCStoreAssets` that will represent the assets in your specific game. For a complete example refer to [cocos2dx-store-example](https://github.com/soomla/cocos2dx-store-example/blob/master/Classes/MuffinRushAssets.cpp).

4. Make sure to include the `Cocos2dxStore.h` header whenever you use any of the *cocos2dx-store* functions:

	```cpp
	#include "Cocos2dxStore.h"
	```

5. Initialize `CCSoomla` and `CCSoomlaStore` with the class you just created, a `customSecret` and other params:

	``` cpp
	soomla::CCSoomla::initialize("ExampleCustomSecret");

	YourImplementationAssets *assets = YourImplementationAssets::create();

	__Dictionary *storeParams = __Dictionary::create();
	 storeParams->setObject(__String::create("ExamplePublicKey"), "androidPublicKey");
	 storeParams->setObject(__Bool::create(true), "testPurchases");
	 storeParams->setObject(__Bool::create(true), "SSV");
	 storeParams->setObject(__Bool::create(true), "verifyOnServerFailure");

	soomla::CCSoomlaStore::initialize(assets, storeParams);
	```

	- *Custom Secret* - is an encryption secret you provide that will be used to secure your data.

	- *Android Public Key* - is the public key given to you from Google. (iOS doesn't have a public key).

	- *Test Purchases* - allows testing IAP on Google Play. (iOS doesn't have this functionality).

	- *SSV* - enables _Fraud Protection_. (in order to activate it in Google Play see the related section below).

	- *verifyOnServerFailure* - if you use Fraud Protection, optionally you set this param, if you want to get purchases
	automatically verified in case of network failures during the verification process.

	> Choose the secret wisely. You can't change it after you launch your game!
	> Initialize `CCSoomlaStore` ONLY ONCE when your application loads.

6. You'll need to subscribe to store events to get notified about in-app purchasing related events. refer to the [Event Handling](/cocos2dx/cpp/store/Store_Events) section for more information.

**The next steps are different according to which platform you're using.**

<br>

###**Instructions for iOS**

In your XCode project, perform the following steps:

1. Add `jansson` (**external/jansson/**) to your project (just add it as a source folder, make sure to check "create group").

2. For each of the following XCode projects:

 * `Cocos2dXCore.xcodeproj` (**extensions/soomla-cocos2dx-core/**).

 * `Cocos2dXStore.xcodeproj` (**extensions/cocos2dx-store/**).

    a. Drag the project into your project.

    b. Add its targets to your **Build Phases->Target Dependencies**.

    c. Add its `.a` files to **Build Phases->Link Binary With Libraries**.

 ![alt text](http://know.soom.la/img/tutorial_img/cocos2dx_getting_started/ios_steps1to4.png "iOS Integration")

3. Add the following directories to **Build Settings->Header Search Paths** (with the `recursive` option):

	- `$(SRCROOT)/../cocos2d/extensions/soomla-cocos2dx-core/Soomla`

	- `$(SRCROOT)/../cocos2d/extensions/soomla-cocos2dx-core/build/ios/headers`

	- `$(SRCROOT)/../cocos2d/extensions/cocos2dx-store/Soomla`

 ![alt text](http://know.soom.la/img/tutorial_img/cocos2dx_getting_started/headerSP.png "Header search paths")

4. Add `-ObjC` to your project **Build Settings->Other Linker Flags**.

	![alt text](http://know.soom.la/img/tutorial_img/cocos2dx_getting_started/objc.png "Other Linker Flags")

5. Make sure you have these 3 Frameworks linked to your XCode project: **Security, libsqlite3.0.dylib, StoreKit**.

**That's it! Now all you have to do is build your XCode project and run your game with cocos2dx-store.**

<br>
###**Instructions for Android**

1. Import cocos2dx-store module into your project's Android.mk by adding the following:

    ``` cpp
    //Add this line along with your other LOCAL_WHOLE_STATIC_LIBRARIES
    LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dx_store_static

	//Add this line at the end of the file, along with the other import-module calls
    $(call import-module, extensions/cocos2dx-store)  
    ```

2. Add the following jars to your android project's classpath:

    From `extensions/soomla-cocos2dx-core/build/android`:

    - SoomlaAndroidCore.jar
    - Cocos2dxAndroidCore.jar
    - square-otto-1.3.2.jar

  From `extensions/cocos2dx-store/build/android`:

    - SoomlaAndroidStore.jar
    - Cocos2dxAndroidStore.jar

3. Update your AndroidManifest.xml to include permissions and the SoomlaApp:

    ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="com.android.vending.BILLING"/>

    <application ...
    	       android:name="com.soomla.SoomlaApp">
    	       ...
    </application>
    ```


##**Select a Billing Service**

SOOMLA's cocos2dx-store knows how to contact Google Play, Amazon Appstore, or Apple App Store for you and will redirect your users to their purchasing system to complete the transaction.

###Google Play

1. Add `AndroidStoreGooglePlay.jar` from `extensions/cocos2dx-store/build/android/billing-services/google-play` to your classpath:

2. Update your AndroidManifest.xml:

	``` xml
	...
	<uses-permission android:name="com.android.vending.BILLING"/>

	<application ...
	 <activity android:name="com.soomla.store.billing.google.GooglePlayIabService$IabActivity"
	            android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen"/>
	 <meta-data android:name="billing.service" android:value="google.GooglePlayIabService"/>
	</application>
	```

3. Read our [tutorial](/android/store/Store_GooglePlayIAB) on how to define your in-app products in Google Play.

4. Start IAB Service in background **(optional)**

    ``` cpp
    // Start Iab Service
    #if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
        CCSoomlaStore::getInstance()->startIabServiceInBg();
    #endif

    // Stop Iab Service
    #if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
        CCSoomlaStore::getInstance()->stopIabServiceInBg();
    #endif
    ```

    This is not mandatory, your game will work without this, but we recommend it because it enhances performance. The idea here is to preemptively start the in-app billing setup process with Google's servers.

    In many games the user has to navigate into the in-game store, or start a game session in order to reach the point of making purchases. You want the user experience to be fast and smooth and prevent any lag that could be caused by network latency and setup routines you could have done silently in the background.

    > Don't forget to close the Iab Service when your store is closed.

5. In case you want to turn on Fraud Protection you need to get clientId, clientSecret and refreshToken as explained in
[Google Play Purchase Verification](/android/store/Store_GooglePlayVerification) and use them like this:

	``` cpp
	storeParams->setObject(__String::create(<YOU_CLIENT_ID>), "clientId");
	storeParams->setObject(__String::create(<YOUR_CLIENT_SECRET>), "clientSecret");
	storeParams->setObject(__String::create(<YOUR_REFRESH_TOKEN>), "refreshToken");
	```

###Amazon

1. Add `in-app-purchasing-1.0.3.jar` and `AndroidStoreAmazon.jar` from `extensions/cocos2dx-store/build/android/billing-services/amazon` to your classpath:

2. Update your manifest:

	``` xml
	<receiver android:name = "com.amazon.inapp.purchasing.ResponseReceiver" >
		<intent-filter>
	    <action android:name = "com.amazon.inapp.purchasing.NOTIFY"
	            android:permission = "com.amazon.inapp.purchasing.Permission.NOTIFY" />
		</intent-filter>
	</receiver>
	<meta-data android:name="billing.service" android:value="amazon.AmazonIabService" />
	```

3. Read our [tutorial](/android/store/Store_AmazonIAB) on how to define your in-app products in the Amazon Appstore.

###Apple App Store

1. Read our [tutorial](/ios/store/Store_AppStoreIAB) on how to define your in-app products in the App Store.

2. Use SOOMLA's Fraud Protection **(Optional)**

	As you probably know, fraud on IAP is pretty common. Hackers can crack their smartphones to think that a purchase
	was made when the payment isn't actually transferred to you. To help game developers with this issue, we created
	a verification server that you can use instantly through the framework.

	All you need to do is let cocos2dx-store know that you want to verify purchases. You can do this by passing an extra
	parameter to `CCSoomlaStore`:

	```cpp
	storeParams->setObject(Bool::create(true), "SSV");
	soomla::CCStoreService::initShared(assets, storeParams);
	```

**That's it! Now all you have to do is run the *build_native.sh* script and you can begin using cocos2dx-store in your game.**


## What's next? In App Purchasing.

When we implemented modelV3, we were thinking about ways that people buy things inside apps. We figured out many ways you can let your users purchase items in your game and we designed the new modelV3 to support 2 of them: `CCPurchaseWithMarket` and `CCPurchaseWithVirtualItem`.

- **CCPurchaseWithMarket** is a `CCPurchaseType` that allows users to purchase a `CCVirtualItem` with Google Play or the App Store.
- **CCPurchaseWithVirtualItem** is a `CCPurchaseType` that lets your users purchase a `CCVirtualItem` with another `CCVirtualItem`. For example: Buying a sword with 100 gems.

In order to define the way your various virtual items are purchased, you'll need to create your implementation of `CCStoreAssets` (the same one from step 5 in the [Getting Started](https://github.com/soomla/cocos2dx-store#getting-started) section above).

Here is an example:

Lets say you have a `CCVirtualCurrencyPack` you want to call `TEN_COINS_PACK` and a `CCVirtualCurrency` you want to call `COIN_CURRENCY` (`TEN_COINS_PACK` will hold 10 pieces of the currency `COIN_CURRENCY`):

```cpp
#define COIN_CURRENCY_ITEM_ID "coin_currency"
#define TEN_COIN_PACK_ITEM_ID       "ten_coin_pack"
#define TEN_COIN_PACK_PRODUCT_ID    "10_coins_pack"  // this is the product id from the developer console

CCVirtualCurrency *COIN_CURRENCY = CCVirtualCurrency::create(
	String::create("COIN_CURRECY"),
	String::create(""),
	String::create(COIN_CURRENCY_ITEM_ID)
);

CCVirtualCurrencyPack *TEN_COIN_PACK = CCVirtualCurrencyPack::create(
	String::create("10 Coins"),
	String::create("A pack of 10 coins"),
	String::create(TEN_COIN_PACK_ITEM_ID),
	Integer::create(10),
	String::create(COIN_CURRENCY_ITEM_ID),
	CCPurchaseWithMarket::create(String::create(TEN_COIN_PACK_PRODUCT_ID), Double::create(0.99))
);
```

Now you can use `CCStoreInventory` to buy your new currency pack:

    soomla::CCStoreInventory::sharedStoreInventory()->buyItem(TEN_COIN_PACK_ITEM_ID);

And that's it! cocos2dx-store knows how to contact Google Play or the App Store for you and will redirect your users to the purchasing system to complete the transaction. Don't forget to subscribe to store events in order to get notified of successful or failed purchases (see [Event Handling](https://github.com/soomla/cocos2dx-store#event-handling)).

## Storage & Meta-Data

`CCStoreInventory` and `CCStoreInfo` are important storage and metadata classes you should use when you want to perform all store operations:
* `CCStoreInventory` is a convenience class to let you perform operations on `CCVirtualCurrencies` and `CCVirtualGood`s. Use it to fetch/change the balances of `CCVirtualItem`s in your game (using their ItemIds!)  
* `CCStoreInfo` is where all meta data information about your specific game can be retrieved. It is initialized with your implementation of `CCStoreAssets` and you can use it to retrieve information about your specific game.

The on-device storage is encrypted and kept in a SQLite database. SOOMLA has a [cloud-based](http://dashboard.soom.la) storage service (The SOOMLA Highway) that allows this SQLite to be synced to a cloud-based repository that you define.

**Example Usages**

* Get all the `CCVirtualCurrencies`:

    ```cpp
    CCArray *vcArray = soomla::CCStoreInfo::sharedStoreInfo()->getVirtualCurrencies();
    ```

* Give the user 10 pieces of a virtual currency with itemId "currency_coin":

    ```cpp
    soomla::CCStoreInventory::sharedStoreInventory()->giveItem("currency_coin", 10);
    ```

* Take 10 virtual goods with itemId "green_hat":

    ```cpp
    soomla::CCStoreInventory::sharedStoreInventory()->takeItem("green_hat", 10);
    ```

* Get the current balance of green hats (virtual goods with itemId "green_hat"):

    ```cpp
    int greenHatsBalance = soomla::CCStoreInventory::sharedStoreInventory()->getItemBalance("green_hat");
    ```

## Event Handling

SOOMLA lets you subscribe to store events, get notified and implement your own application specific behaviour to them.

> Your behaviour is an addition to the default behaviour implemented by SOOMLA. You don't replace SOOMLA's behaviour.

SOOMLA uses the Cocos2d-x [`EventDispatcher`](http://www.cocos2d-x.org/wiki/EventDispatcher_Mechanism) to dispatch its own custom events.
The names of such events are defined in `CCStoreConsts`, the received event has a `__Dictionary` set in its `userData` which holds all the meta-data for the event.
You can subscribe to any event from anywhere in your code.

For example here's how to subscribe to the item purchased event:

```cpp
cocos2d::Director::getInstance()->getEventDispatcher()->addCustomEventListener(soomla::CCStoreConsts::EVENT_ITEM_PURCHASED, CC_CALLBACK_1(ExampleScene::onItemPurchased, this));
```

Continuing the example, here's how you would handle and extract data from such an event:

```cpp
void ExampleScene::onItemPurchased(cocos2d::EventCustom *event) {
  cocos2d::__Dictionary *eventData = (cocos2d::__Dictionary *)event->getUserData();
  soomla::CCPurchasableVirtualItem *purchasable = dynamic_cast<soomla::CCPurchasableVirtualItem *>(eventData->objectForKey(soomla::CCStoreConsts::DICT_ELEMENT_PURCHASABLE));
  cocos2d::__String *payload = dynamic_cast<cocos2d::__String *>(eventData->objectForKey(soomla::CCStoreConsts::DICT_ELEMENT_DEVELOPERPAYLOAD));

  // Use purchasable and payload for your needs
}
```

Each event has its own meta-data, see inline documentation in [`CCStoreEventDispatcher`](https://github.com/soomla/cocos2dx-store/blob/master/Soomla/CCStoreEventDispatcher.h) for more information.

## Error Handling

Since Cocos2d-x doesn't support exceptions, we use a different method to catch and work with exceptions on the native side. All functions that raise an exception on the native side have an additional *CCError*** parameter to them. In order to know if an exception was raised, send a reference to *CCError** to the function, and inspect it after running.

For example, if I want to purchase an item with the ItemID `huge_sword`, and check if all went well after the purchase, I would call `CCSoomlaStore::buyItem()`, like this:

```c++
soomla::CCError *err;
soomla::CCStoreInventory::sharedStoreInventory()->buyItem("huge_sword", &err);
if (err != NULL) {
    int code = err->getCode();
    switch code {
        case SOOMLA_EXCEPTION_ITEM_NOT_FOUND:
            // itemNotFoundException was raised
            break;
        case SOOMLA_EXCEPTION_INSUFFICIENT_FUNDS:
            // insufficientFundsException was raised
            break;
        case SOOMLA_EXCEPTION_NOT_ENOUGH_GOODS:
            // notEnoughGoodsException was raised
            break;
    }
}
```

You can choose to handle each exception on its own, handle all three at once, or not handle the exceptions at all. The `CCError` parameter is entirely optional, you can pass NULL instead if you do not wish to handle errors, but remember, error handling is *your* responsibility. cocos2dx-store doesn't do any external error handling (i.e. error handling that uses `CCError`) for you.

## Debugging

You can enable debug logging in cocos2dx-store by setting `SOOMLA_DEBUG` in `CCSoomlaUtils.h` to `true`. Debug logging can also be enabled at build time by adding `-DSOOMLA_DEBUG=1` to `APP_CPPFLAGS` in your `Application.mk` on Android, or by setting `SOOMLA_DEBUG=1` in your Build Settings' `Preprocessor Macros` on iOS.

If you want to see debug messages from _android-store_, set the `logDebug` variable in `com.soomla.store.StoreConfig` to `true`.

To see debug messages on iOS, make sure you have also `DEBUG=1` in your Build Settings' `Preprocessor Macros` (for Debug only).


## Working with sources

We try to do all our best to make your contributions as easy as it's possible. We prepared "sourced" environment for you if you wish to contribute in soomla projects. In order to get it you should:

1. Fetch submodules of repositories, you can do it by recursively cloning them:
    ```
    $ git clone --recursive git@github.com:soomla/soomla-cocos2dx-core.git extensions/soomla-cocos2dx-core
    $ git clone --recursive git@github.com:soomla/cocos2dx-store.git extensions/cocos2dx-store
    ```
or, if you have repositories already cloned, fetch the submodules with this command:
    ```
    $ git submodule update --init --recursive
    ```
> You should run this command in every repository.

1. For iOS: Use sourced versions of Linked projects (`extensions/soomla-cocos2dx-core/development/Cocos2dxCoreFromSources.xcodeproj`, `extensions/cocos2dx-store/development/Cocos2dxStoreFromSources.xcodeproj`)

1. For Android: You can use our "sourced" modules for Android Studio (or IntelliJ IDEA) (`extensions/soomla-cocos2dx-core/development/Cocos2dxCoreFromSources.iml`, `extensions/cocos2dx-store/development/Cocos2dxStoreFromSources.iml`), just include them to your project.

## How to move from v4.3.x to v4.5.x?

Version 4.5.x is all about making the integration process on iOS and Android easier.
If you are using v4.3.x and want to move to v4.4.x follow these steps:

1. Pull the latest version to your `extensions` folder
1. Remove any Soomla-related code in iOS (`AppController.mm`) and Android (`Cocos2dxActivity`), especially code related to `ServiceManager` and any other `Service`s.
1. In your AppDelegate.cpp:
  - Change `soomla::CCServiceManager::getInstance()->setCommonParams(commonParams);` to `soomla::CCSoomla::initialize("customSecret");`
  - Change `soomla::CCStoreService::initShared(assets, storeParams);` to `soomla::CCSoomlaStore::initialize(assets, storeParams);`
  - Remove any `#include`s to missing header files, you only need `Cocos2dxStore.h`
1. Remove any reference to `EventHandler`s and subscribing through Soomla `EventDispatcher`s, instead use the Cocos2d-x `EventDispatcher` to subscribe to events.
1. When in doubt follow the [cocos2dx-store-example](https://github.com/soomla/cocos2dx-store#example-project)`

Contribution
---
SOOMLA appreciates code contributions! You are more than welcome to extend the capabilities of SOOMLA.

Fork -> Clone -> Implement -> Add documentation -> Test -> Pull-Request.

IMPORTANT: If you would like to contribute, please follow our [Documentation Guidelines](https://github.com/soomla/cocos2dx-store/blob/master/documentation.md
). Clear, consistent comments will make our code easy to understand.

## SOOMLA, Elsewhere ...

+ [Framework Website](http://www.soom.la/)
+ [Knowledge Base](http://know.soom.la/)


<a href="https://www.facebook.com/pages/The-SOOMLA-Project/389643294427376"><img src="http://know.soom.la/img/tutorial_img/social/Facebook.png"></a><a href="https://twitter.com/Soomla"><img src="http://know.soom.la/img/tutorial_img/social/Twitter.png"></a><a href="https://plus.google.com/+SoomLa/posts"><img src="http://know.soom.la/img/tutorial_img/social/GoogleP.png"></a><a href ="https://www.youtube.com/channel/UCR1-D9GdSRRLD0fiEDkpeyg"><img src="http://know.soom.la/img/tutorial_img/social/Youtube.png"></a>

## License

Apache License. Copyright (c) 2012-2014 SOOMLA. http://www.soom.la
+ http://opensource.org/licenses/Apache-2.0
