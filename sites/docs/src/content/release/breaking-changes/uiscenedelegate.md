---
# title: UISceneDelegate adoption
title: UISceneDelegate 采用
# description: >-
#   A guide for Flutter iOS developers to adopt Apple's UISceneDelegate protocol.
description: >-
  Flutter iOS 开发人员采用 Apple 的 UISceneDelegate 协议的指南。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



:::important
As of the Flutter 3.41 release, `UIScene` support is the
default for iOS apps and auto migration to `UIScene`
is automatic.

从 Flutter 3.41 版本开始，`UIScene` 支持是 iOS 应用程序的默认支持，并且自动迁移到 `UIScene` 是自动的。

:::

## Summary

## 摘要


Apple now requires iOS developers to adopt the `UIScene` life cycle.
This migration has implications for the [app launch sequence][]
and [app life cycle][].

Apple 现在要求 iOS 开发人员采用 `UIScene` 生命周期。此次迁移对以下领域产生影响：[app launch sequence][]和[app life cycle][].


[app launch sequence]: {{site.apple-dev}}/documentation/uikit/about-the-app-launch-sequence
[app life cycle]: {{site.apple-dev}}/documentation/uikit/managing-your-app-s-life-cycle

## Background

## 背景


During WWDC25, Apple [announced][] the following:

在 WWDC25 期间，苹果[announced][]下列：


> In the release following iOS 26, any UIKit app built with the latest SDK will
> be required to use the UIScene life cycle, otherwise it will not launch.

> 在 iOS 26 之后的版本中，任何使用最新 SDK 构建的 UIKit 应用程序都将被要求使用 UIScene 生命周期，否则将无法启动。


To use the UIScene lifecycle with Flutter, migrate the following support:

要将 UIScene 生命周期与 Flutter 一起使用，请迁移以下支持：


* For all Flutter apps that support iOS,

  对于所有支持 iOS 的 Flutter 应用程序，

  visit the [migration guide][] for Flutter apps.

参观[migration guide][]对于 Flutter 应用程序。

* For Flutter apps embedded in iOS native apps, visit the

  对于嵌入在 iOS 本机应用程序中的 Flutter 应用程序，请访问

  [migration guide for adding Flutter to an existing app][migrate-existing-app].
* For Flutter plugins that use iOS application lifecycle events, visit the

  对于使用 iOS 应用程序生命周期事件的 Flutter 插件，请访问

  [migration guide for plugins][]

Migrating to UIScene shifts the `AppDelegate`'s role—the UI lifecycle is
now handled by the `UISceneDelegate`. The `AppDelegate`
remains responsible for process events and the overall application lifecycle.
All UI-related logic should be moved from the `AppDelegate` to the
corresponding `UISceneDelegate` methods. After migrating to `UIScene`,
UIKit won't call `AppDelegate` methods related to UI state.

迁移到 UIScene 会改变 `AppDelegate` 的角色 — UI 生命周期现在由 `UISceneDelegate` 处理。 `AppDelegate` 仍然负责进程事件和整个应用程序生命周期。所有与 UI 相关的逻辑都应从 `AppDelegate` 移动到相应的 `UISceneDelegate` 方法。迁移到 `UIScene` 后，UIKit 将不会调用与 UI 状态相关的 `AppDelegate` 方法。


[announced]: {{site.apple-dev}}/videos/play/wwdc2025/243/?time=1317
[migrate-existing-app]: /release/breaking-changes/uiscenedelegate/#migration-guide-for-adding-flutter-to-existing-app-add-to-app
[migration guide]: /release/breaking-changes/uiscenedelegate/#migration-guide-for-flutter-apps
[migration guide for plugins]: /release/breaking-changes/uiscenedelegate/#migration-guide-for-flutter-plugins

## Migration guide for Flutter apps

## Flutter 应用程序的迁移指南


### Auto-migrate

### 自动迁移


As of Flutter 3.41, `UIScene` is supported by default.
The Flutter CLI automatically migrates your app if your `AppDelegate`
hasn't been customized.

从 Flutter 3.41 开始，默认支持 `UIScene`。如果你的 `AppDelegate` 尚未自定义，Flutter CLI 会自动迁移你的应用程序。


1. Build or run your app

  构建或运行你的应用程序


```console
flutter run
```
or

或者


```console
flutter build ios
```

If the migration succeeds,
you will see a log that says "Finished migration to UIScene lifecycle".
Otherwise, it warns you to migrate manually using the included instructions.
If the migration succeeds, no further action is required.

如果迁移成功，你将看到一条日志，显示“已完成迁移到 UIScene 生命周期”。否则，它会警告你使用随附的说明手动迁移。如果迁移成功，则无需采取进一步操作。


### Migrate AppDelegate

### 迁移 AppDelegate


Previously, Flutter plugins were registered in
`application:didFinishLaunchingWithOptions:`.
To accommodate the new app launch sequence,
plugin registration must now be handled in a new callback called
`didInitializeImplicitFlutterEngine`.

此前，Flutter 插件已在 `application:didFinishLaunchingWithOptions:` 中注册。为了适应新的应用程序启动顺序，现在必须在名为 `didInitializeImplicitFlutterEngine` 的新回调中处理插件注册。


1. Add `FlutterImplicitEngineDelegate` and move `GeneratedPluginRegistrant`.

  添加 `FlutterImplicitEngineDelegate` 并移动 `GeneratedPluginRegistrant`。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift  title="my_app/ios/Runner/AppDelegate.swift" diff
- @objc class AppDelegate: FlutterAppDelegate {
+ @objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
-     GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

+   func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
+     GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
+   }
  }
```

</Tab>
<Tab name="Objective-C">

```objc title="my_app/ios/Runner/AppDelegate.h" diff
- @interface AppDelegate : FlutterAppDelegate
+ @interface AppDelegate : FlutterAppDelegate <FlutterImplicitEngineDelegate>
```
```objc title="my_app/ios/Runner/AppDelegate.m" diff
  - (BOOL)application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
-    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
  }

+ - (void)didInitializeImplicitFlutterEngine:(NSObject<FlutterImplicitEngineBridge>*)engineBridge {
+   [GeneratedPluginRegistrant registerWithRegistry:engineBridge.pluginRegistry];
+ }
```

</Tab>
</Tabs>

2. Create method channels and platform views in

  在中创建方法通道和平台视图

   `didInitializeImplicitFlutterEngine`, if applicable.

`didInitializeImplicitFlutterEngine`，如果适用。


If you previously created [method channels][method-channels-docs] or
[platform views][platform-views-docs] in
`application:didFinishLaunchingWithOptions:`,
move that logic to `didInitializeImplicitFlutterEngine`.

如果你之前在 `application:didFinishLaunchingWithOptions:` 中创建了 [方法通道][method-channels-docs] 或 [平台视图][platform-views-docs]，请将该逻辑移至 `didInitializeImplicitFlutterEngine`。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift
  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    // Register plugins with `engineBridge.pluginRegistry`
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Create method channels with `engineBridge.applicationRegistrar.messenger()`
    let batteryChannel = FlutterMethodChannel(
      name: "samples.flutter.dev/battery",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )

    // Create platform views with `engineBridge.applicationRegistrar.messenger()`
    let factory = FLNativeViewFactory(messenger: engineBridge.applicationRegistrar.messenger())
  }
```

</Tab>
<Tab name="Objective-C">

```objc
  func didInitializeImplicitFlutterEngine:(NSObject<FlutterImplicitEngineBridge>*)engineBridge {
    // Register plugins with `engineBridge.pluginRegistry`
    [GeneratedPluginRegistrant registerWithRegistry:engineBridge.pluginRegistry];

    // Create method channels with `engineBridge.applicationRegistrar.messenger`
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                          methodChannelWithName:@"samples.flutter.dev/battery"
                                          binaryMessenger:engineBridge.applicationRegistrar.messenger];

    // Create platform views with `engineBridge.applicationRegistrar.messenger`
    FLNativeViewFactory* factory =
      [[FLNativeViewFactory alloc] initWithMessenger:engineBridge.applicationRegistrar.messenger];
  }
```

</Tab>
</Tabs>

:::warning
If you try to access the `FlutterViewController` in
`application:didFinishLaunchingWithOptions:`, it might result in a crash.
Use the `FlutterImplicitEngineDelegate` protocol instead.

如果你尝试访问 `application:didFinishLaunchingWithOptions:` 中的 `FlutterViewController`，可能会导致崩溃。请改用 `FlutterImplicitEngineDelegate` 协议。


```swift
// BAD
let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
```

To access the `FlutterViewController` directly, visit
[Bespoke FlutterViewController
usage](/release/breaking-changes/uiscenedelegate/#bespoke-flutterviewcontroller-usage).

要直接访问 `FlutterViewController`，请访问[Bespoke FlutterViewController usage](/release/breaking-changes/uiscenedelegate/#bespoke-flutterviewcontroller-usage).

:::

3. Migrate any custom logic within application life cycle events.

  迁移应用程序生命周期事件中的任何自定义逻辑。


Apple has deprecated application life cycle events related to UI state.
After migrating to UIScene lifecycle, UIKit will no longer call these events.

Apple 已弃用与 UI 状态相关的应用程序生命周期事件。迁移到 UIScene 生命周期后，UIKit 将不再调用这些事件。


If you were using one of these deprecated APIs, such as [`applicationDidBecomeActive`],
you will likely need to create a `SceneDelegate` and migrate to scene life cycle events.
Check out [Apple's documentation] on migrating.

如果你使用的是这些已弃用的 API 之一，例如 [`applicationDidBecomeActive`]，你可能需要创建 `SceneDelegate` 并迁移到场景生命周期事件。查看有关迁移的 [Apple 文档]。


If you implement your own `SceneDelegate`,
you must subclass it with `FlutterSceneDelegate` or
conform to the `FlutterSceneLifeCycleProvider` protocol.
Visit the [following examples][].

如果你实现自己的 `SceneDelegate`，则必须使用 `FlutterSceneDelegate` 对其进行子类化或符合 `FlutterSceneLifeCycleProvider` 协议。参观[following examples][].


[Apple's documentation]: {{site.apple-dev}}/documentation/technotes/tn3187-migrating-to-the-uikit-scene-based-life-cycle
[`applicationDidBecomeActive`]: {{site.apple-dev}}/documentation/uikit/uiapplicationdelegate/applicationdidbecomeactive
[following examples]: /release/breaking-changes/uiscenedelegate/#createupdate-a-scenedelegate

### Migrate Info.plist

### 迁移 Info.plist


To complete the migration to the `UIScene` lifecycle,
add an `Application Scene Manifest` to your `Info.plist`.

要完成到 `UIScene` 生命周期的迁移，请将 `Application Scene Manifest` 添加到 `Info.plist`。


As seen in Xcode's editor:

正如在 Xcode 编辑器中看到的：


![Xcode plist editor for
UIApplicationSceneManifest](/assets/images/docs/breaking-changes/uiscenedelegate-plist.png)

UIApplicationSceneManifest](/assets/images/docs/writing-changes/uiscenedelegate-plist.png)


As XML:

作为 XML：


```xml title="Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
 <key>UIApplicationSceneManifest</key>
 <dict>
  <key>UIApplicationSupportsMultipleScenes</key>
  <false/>
  <key>UISceneConfigurations</key>
  <dict>
  <key>UIWindowSceneSessionRoleApplication</key>
    <array>
      <dict>
        <key>UISceneClassName</key>
        <string>UIWindowScene</string>
        <key>UISceneDelegateClassName</key>
        <string>FlutterSceneDelegate</string>
        <key>UISceneConfigurationName</key>
        <string>flutter</string>
        <key>UISceneStoryboardFile</key>
        <string>Main</string>
      </dict>
    </array>
   </dict>
 </dict>
</dict>
```

### Create a SceneDelegate (Optional)

### 创建 SceneDelegate（可选）


If you need access to the `SceneDelegate`,
you can create one by subclassing `FlutterSceneDelegate`.

如果你需要访问 `SceneDelegate`，可以通过子类化 `FlutterSceneDelegate` 来创建一个。


1. Open your app in Xcode

  在 Xcode 中打开你的应用程序

2. Right click the **Runner** folder and select **New Empty File**

  右键单击 **Runner** 文件夹并选择 **新建空文件**


![New Empty File option in Xcode](/assets/images/docs/breaking-changes/uiscene-new-file.png)

<Tabs key="ios-language-switcher">
<Tab name="Swift">

For Swift projects, create a `SceneDelegate.swift`:

对于 Swift 项目，创建一个 `SceneDelegate.swift`：


```swift title=my_app/ios/Runner/SceneDelegate.swift
import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {

}
```

3. Change the "Delegate Class Name" (`UISceneDelegateClassName`) in the

  更改“委托类名称”(`UISceneDelegateClassName`)

`Info.plist` from `FlutterSceneDelegate` to `$(PRODUCT_MODULE_NAME).SceneDelegate`.

`Info.plist` 从 `FlutterSceneDelegate` 到 `$(PRODUCT_MODULE_NAME).SceneDelegate`。


</Tab>
<Tab name="Objective-C">

For Objective-C projects, create a `SceneDelegate.h` and `SceneDelegate.m`:

对于 Objective-C 项目，创建 `SceneDelegate.h` 和 `SceneDelegate.m`：


```objc title=my_app/ios/Runner/SceneDelegate.h
#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>

@interface SceneDelegate : FlutterSceneDelegate

@end
```

```objc title=my_app/ios/Runner/SceneDelegate.m
#import "SceneDelegate.h"

@implementation SceneDelegate

@end
```

3. Change the "Delegate Class Name" (`UISceneDelegateClassName`) in the

  更改“委托类名称”(`UISceneDelegateClassName`)

`Info.plist` from `FlutterSceneDelegate` to `SceneDelegate`.

`Info.plist` 从 `FlutterSceneDelegate` 到 `SceneDelegate`。


</Tab>
</Tabs>

## Migration guide for adding Flutter to existing app (Add to App)

## 将 Flutter 添加到现有应用程序的迁移指南（添加到应用程序）


Similar to the `FlutterAppDelegate`, the `FlutterSceneDelegate` is recommended
but not required. The `FlutterSceneDelegate` forwards scene callbacks, such as
[`openURL`][] to plugins such as [local_auth][].

与 `FlutterAppDelegate` 类似，建议使用 `FlutterSceneDelegate`，但不是必需的。 `FlutterSceneDelegate` 转发场景回调，例如[`openURL`][]插件，例如[local_auth][].


### Create/Update a SceneDelegate

### 创建/更新 SceneDelegate


<Tabs key="ios-framework-switcher">
<Tab name="UIKit-Swift">

```swift diff
  import UIKit
+ import Flutter

- class SceneDelegate: UIResponder, UIWindowSceneDelegate {
+ class SceneDelegate: FlutterSceneDelegate {
```

</Tab>
<Tab name="UIKit-ObjC">

```objc diff
- @interface SceneDelegate : UIResponder <UIWindowSceneDelegate>
+ @interface SceneDelegate : FlutterSceneDelegate
```

</Tab>
<Tab name="SwiftUI">

When using Flutter in a SwiftUI app,
you can [optionally use a FlutterAppDelegate][]
to receive application events.
To migrate that to use `UIScene` events,
you can make the following changes:

在 SwiftUI 应用程序中使用 Flutter 时，你可以[optionally use a FlutterAppDelegate][]接收应用程序事件。要将其迁移为使用 `UIScene` 事件，你可以进行以下更改：


1. Set the Scene Delegate to `FlutterSceneDelegate` in

  将场景委托设置为 `FlutterSceneDelegate`

`application:configurationForConnecting:options:`.

`application:configurationForConnecting:options:`。


```swift diff
  @Observable
  class AppDelegate: FlutterAppDelegate {
    ...
+   override func application(
+     _ application: UIApplication,
+     configurationForConnecting connectingSceneSession: UISceneSession,
+     options: UIScene.ConnectionOptions
+   ) -> UISceneConfiguration {
+     let configuration = UISceneConfiguration(
+       name: nil,
+       sessionRole: connectingSceneSession.role
+     )
+     configuration.delegateClass = FlutterSceneDelegate.self
+     return configuration
+   }
  }
```

[optionally use a FlutterAppDelegate]: /add-to-app/ios/add-flutter-screen#using-the-flutterappdelegate

2. If your app doesn't support multiple scenes, set `Enable Multiple Scenes`

  如果你的应用不支持多场景，请设置 `Enable Multiple Scenes`

   to `NO` under `Application Scene Manifest` in your target's Info properties.
   This is enabled by default for SwiftUI apps.

到目标信息属性中 `Application Scene Manifest` 下的 `NO`。默认情况下，SwiftUI 应用程序会启用此功能。


![Xcode plist editor for
UIApplicationSceneManifest](/assets/images/docs/breaking-changes/uiscenedelegate-swiftui-info-plist.png)

UIApplicationSceneManifest](/assets/images/docs/writing-changes/uiscenedelegate-swiftui-info-plist.png)


Otherwise, visit [if your app supports multiple scenes][] for further instructions.

否则，请访问[if your app supports multiple scenes][]以获得进一步说明。


</Tab>
</Tabs>

[if your app supports multiple scenes]: /release/breaking-changes/uiscenedelegate/#if-your-app-supports-multiple-scenes

### If you can't directly make FlutterSceneDelegate a subclass

### 如果不能直接使 FlutterSceneDelegate 成为子类


If you can't directly make `FlutterSceneDelegate` a subclass,
you can use the `FlutterSceneLifeCycleProvider` protocol and
`FlutterPluginSceneLifeCycleDelegate` object to forward scene life cycle events
to Flutter.

如果无法直接将`FlutterSceneDelegate`作为子类，可以使用`FlutterSceneLifeCycleProvider`协议和`FlutterPluginSceneLifeCycleDelegate`对象将场景生命周期事件转发给Flutter。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift title="SceneDelegate.swift" diff
  import Flutter
  import UIKit

- class SceneDelegate: UIResponder, UIWindowSceneDelegate
+ class SceneDelegate: UIResponder, UIWindowSceneDelegate, FlutterSceneLifeCycleProvider
  {
+   var sceneLifeCycleDelegate: FlutterPluginSceneLifeCycleDelegate =
+     FlutterPluginSceneLifeCycleDelegate()

    var window: UIWindow?

    func scene(
      _ scene: UIScene,
      willConnectTo session: UISceneSession,
      options connectionOptions: UIScene.ConnectionOptions
    ) {
+     sceneLifeCycleDelegate.scene(
+       scene,
+       willConnectTo: session,
+       options: connectionOptions
+     )
    }

    func sceneDidDisconnect(_ scene: UIScene) {
+     sceneLifeCycleDelegate.sceneDidDisconnect(scene)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
+     sceneLifeCycleDelegate.sceneWillEnterForeground(scene)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
+     sceneLifeCycleDelegate.sceneDidBecomeActive(scene)
    }

    func sceneWillResignActive(_ scene: UIScene) {
+     sceneLifeCycleDelegate.sceneWillResignActive(scene)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
+     sceneLifeCycleDelegate.sceneDidEnterBackground(scene)
    }

    func scene(
      _ scene: UIScene,
      openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
+     sceneLifeCycleDelegate.scene(scene, openURLContexts: URLContexts)
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
+     sceneLifeCycleDelegate.scene(scene, continue: userActivity)
    }

    func windowScene(
      _ windowScene: UIWindowScene,
      performActionFor shortcutItem: UIApplicationShortcutItem,
      completionHandler: @escaping (Bool) -> Void
    ) {
+     sceneLifeCycleDelegate.windowScene(
+       windowScene,
+       performActionFor: shortcutItem,
+       completionHandler: completionHandler
+     )
    }
  }
```

</Tab>
<Tab name="Objective-C">

```objc title="SceneDelegate.h" diff
- @interface SceneDelegate : UIResponder <UIWindowSceneDelegate>
+ @interface SceneDelegate : UIResponder <UIWindowSceneDelegate, FlutterSceneLifeCycleProvider>

  @property(strong, nonatomic) UIWindow* window;

+ @property (nonatomic,strong) FlutterPluginSceneLifeCycleDelegate *sceneLifeCycleDelegate;

  @end
```
```objc title="SceneDelegate.m" diff
  @implementation SceneDelegate

  - (instancetype)init {
      if (self = [super init]) {
+         _sceneLifeCycleDelegate = [[FlutterPluginSceneLifeCycleDelegate alloc] init];
      }
      return self;
  }

  - (void)scene:(UIScene*)scene
      willConnectToSession:(UISceneSession*)session
                  options:(UISceneConnectionOptions*)connectionOptions {
+   [self.sceneLifeCycleDelegate scene:scene willConnectToSession:session options:connectionOptions];
  }

  - (void)sceneDidDisconnect:(UIScene*)scene {
+   [self.sceneLifeCycleDelegate sceneDidDisconnect:scene];
  }

  - (void)sceneDidBecomeActive:(UIScene*)scene {
+   [self.sceneLifeCycleDelegate sceneDidBecomeActive:scene];
  }

  - (void)sceneWillResignActive:(UIScene*)scene {
+   [self.sceneLifeCycleDelegate sceneWillResignActive:scene];
  }

  - (void)sceneWillEnterForeground:(UIScene*)scene {
+   [self.sceneLifeCycleDelegate sceneWillEnterForeground:scene];
  }

  - (void)sceneDidEnterBackground:(UIScene*)scene {
+   [self.sceneLifeCycleDelegate sceneDidEnterBackground:scene];
  }

  - (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
+   [self.sceneLifeCycleDelegate scene:scene openURLContexts:URLContexts];
  }

  - (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity {
+   [self.sceneLifeCycleDelegate scene:scene continueUserActivity:userActivity];
  }

  - (void)windowScene:(UIWindowScene *)windowScene performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
+   [self.sceneLifeCycleDelegate windowScene:windowScene performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
  }
```

</Tab>
</Tabs>

### If your app supports multiple scenes

### 如果你的应用支持多场景


When multiple scenes are enabled (`UIApplicationSupportsMultipleScenes`),
Flutter can't automatically connect a `FlutterEngine` to its corresponding
`UIScene` during the initial scene connection phase.

当启用多个场景（`UIApplicationSupportsMultipleScenes`）时，Flutter 在初始场景连接阶段无法自动将 `FlutterEngine` 连接到其对应的 `UIScene`。


To ensure that Flutter plugins can receive the initial scene setup options
(such as deep link URLs or shortcut items passed inside the
`UIScene.ConnectionOptions` payload), you must manually register the
`FlutterEngine` with either your `FlutterSceneDelegate` or your
`FlutterPluginSceneLifeCycleDelegate` inside the
`scene:willConnectToSession:options:` method.

为了确保 Flutter 插件可以接收初始场景设置选项（例如在 `UIScene.ConnectionOptions` 负载中传递的深层链接 URL 或快捷方式项目），你必须在 `scene:willConnectToSession:options:` 中手动注册 `FlutterEngine` 到 `FlutterSceneDelegate` 或 `FlutterPluginSceneLifeCycleDelegate` 。方法。


If you don't perform this manual registration, the `FlutterEngine` still
automatically registers itself later once the view created by the
`FlutterViewController` is added to the active view hierarchy.
However, by that point, any launch connection events passed during
`willConnectToSession:` will have already been missed by the engine and its plugins.

如果你不执行此手动注册，则一旦 `FlutterViewController` 创建的视图添加到活动视图层次结构中，`FlutterEngine` 仍会自动注册。然而，到那时，引擎及其插件将已经错过在 `willConnectToSession:` 期间传递的任何启动连接事件。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift title="SceneDelegate.swift"
import Flutter
import FlutterPluginRegistrant
import UIKit

class SceneDelegate: FlutterSceneDelegate {
  let flutterEngine = FlutterEngine(name: "my flutter engine")

  override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }
    window = UIWindow(windowScene: windowScene)

    flutterEngine.run()
    GeneratedPluginRegistrant.register(with: flutterEngine)

    // If using FlutterSceneDelegate:
    self.registerSceneLifeCycle(with: flutterEngine)

    // If using FlutterSceneLifeCycleProvider:
    // sceneLifeCycleDelegate.registerSceneLifeCycle(with: flutterEngine)

    let viewController = ViewController(engine: flutterEngine)
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
    super.scene(scene, willConnectTo: session, options: connectionOptions)
  }
}
```

</Tab>
<Tab name="Objective-C">

```objc title="SceneDelegate.h"
#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface SceneDelegate : FlutterSceneDelegate
@property (nonatomic, strong) FlutterEngine *flutterEngine;
@end
```
```objc title="SceneDelegate.m"
#import "SceneDelegate.h"
#import "ViewController.h"

@implementation SceneDelegate

  - (instancetype)init {
      if (self = [super init]) {
         _flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
      }
      return self;
  }

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session
                                            options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];

    [self.flutterEngine run];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];

    // If using FlutterSceneDelegate:
    [self registerSceneLifeCycleWithFlutterEngine:self.flutterEngine];

    // If using FlutterSceneLifeCycleProvider:
    // [self.sceneLifeCycleDelegate registerSceneLifeCycleWithFlutterEngine:self.flutterEngine];

    ViewController *viewController = [[ViewController alloc] initWithEngine:self.flutterEngine];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    [super scene:scene willConnectToSession:session options:connectionOptions];
}
@end
```

</Tab>
</Tabs>

If you manually register a `FlutterEngine` with a scene, you must also
unregister it if the view created by the `FlutterEngine` changes scenes.

如果你手动将 `FlutterEngine` 注册到场景，则当 `FlutterEngine` 创建的视图更改场景时，你还必须取消注册它。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift
// If using FlutterSceneDelegate:
self.unregisterSceneLifeCycle(with: flutterEngine)

// If using FlutterSceneLifeCycleProvider:
sceneLifeCycleDelegate.unregisterSceneLifeCycle(with: flutterEngine)
```

</Tab>
<Tab name="Objective-C">

```objc
// If using FlutterSceneDelegate:
[self unregisterSceneLifeCycleWithFlutterEngine:self.flutterEngine];

// If using FlutterSceneLifeCycleProvider:
[self.sceneLifeCycleDelegate unregisterSceneLifeCycleWithFlutterEngine:self.flutterEngine];
```

</Tab>
</Tabs>

## Migration guide for Flutter plugins

## Flutter 插件的迁移指南


Not all plugins use lifecycle events. However, if your plugin does,
you need to migrate to UIKit's scene-based lifecycle, as follows:

并非所有插件都使用生命周期事件。但是，如果你的插件这样做，则需要迁移到 UIKit 基于场景的生命周期，如下所示：


1. Update the Dart and Flutter SDK versions in your `pubspec.yaml`.

  更新 `pubspec.yaml` 中的 Dart 和 Flutter SDK 版本。


The APIs required for this migration are available in Flutter 3.38.0.

此迁移所需的 API 在 Flutter 3.38.0 中提供。


```yaml
environment:
  sdk: ^3.10.0
  flutter: ">=3.38.0"
```

2. Adopt the `FlutterSceneLifeCycleDelegate` protocol.

  采用 `FlutterSceneLifeCycleDelegate` 协议。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift diff
- public final class MyPlugin: NSObject, FlutterPlugin {
+ public final class MyPlugin: NSObject, FlutterPlugin, FlutterSceneLifeCycleDelegate {
```

</Tab>
<Tab name="Objective-C">

```objc diff
- @interface MyPlugin : NSObject<FlutterPlugin>
+ @interface MyPlugin : NSObject<FlutterPlugin, FlutterSceneLifeCycleDelegate>
```

</Tab>
</Tabs>

3. Register the plugin as a receiver of `UISceneDelegate` calls.

  将插件注册为 `UISceneDelegate` 调用的接收者。


To continue supporting apps that haven't yet migrated to the `UIScene` lifecycle,
consider remaining registered to the App Delegate and keeping the
`AppDelegate` events as well.

要继续支持尚未迁移到 `UIScene` 生命周期的应用程序，请考虑继续注册到应用程序委托并保留 `AppDelegate` 事件。


<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift diff
  public static func register(with registrar: FlutterPluginRegistrar) {
    ...
    registrar.addApplicationDelegate(instance)
+   registrar.addSceneDelegate(instance)
  }
```

</Tab>
<Tab name="Objective-C">

```objc diff
  + (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    ...
    [registrar addApplicationDelegate:instance];
+   [registrar addSceneDelegate:instance];
  }
```

</Tab>
</Tabs>

4. Add one or more of the following scene events needed for your plugin.

  添加插件所需的以下一个或多个场景事件。


Most `AppDelegate` UI events have a 1-to-1 replacement.
To see details for each event, visit Apple's documentation on
[`UISceneDelegate`][] and [`UIWindowSceneDelegate`][].

大多数 `AppDelegate` UI 事件都有一对一的替换。要查看每个事件的详细信息，请访问 Apple 的文档：[`UISceneDelegate`][]和[`UIWindowSceneDelegate`][].


[`UISceneDelegate`]: {{site.apple-dev}}/documentation/uikit/uiscenedelegate
[`UIWindowSceneDelegate`]: {{site.apple-dev}}/documentation/uikit/uiwindowscenedelegate

| <t>App Delegate Method</t><t>应用程序委托方法</t> | <t>Scene Delegate Equivalent</t><t>场景委托等效项</t> |
| :--- |:-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`applicationDidBecomeActive`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622956-applicationdidbecomeactive) | [`sceneDidBecomeActive`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197915-scenedidbecomeactive)                                     |
| [`applicationWillResignActive`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622950-applicationwillresignactive) | [`sceneWillResignActive`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197919-scenewillresignactive)                                   |
| [`applicationWillEnterForeground`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623076-applicationwillenterforeground) | [`sceneWillEnterForeground`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197918-scenewillenterforeground)                             |
| [`applicationDidEnterBackground`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622997-applicationdidenterbackground) | [`sceneDidEnterBackground`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197917-scenedidenterbackground)                               |
| [`application:continueUserActivity:restorationHandler:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623072-application) | [`scene:continueUserActivity:`](https://developer.apple.com/documentation/uikit/uiscenedelegate/scene(_:continue:))                                             |
| [`application:performActionForShortcutItem:completionHandler:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/application(_:performactionfor:completionhandler:)) | [`windowScene:performActionForShortcutItem:completionHandler:`](https://developer.apple.com/documentation/uikit/uiwindowscenedelegate/3238088-windowscene) |
| [`application:openURL:options:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623112-application) | [`scene:openURLContexts:`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3238059-scene)                                                  |
| [`application:performFetchWithCompletionHandler:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623125-application) | [`BGAppRefreshTask`](https://developer.apple.com/documentation/backgroundtasks/bgapprefreshtask)                                                           |
| [`application:willFinishLaunchingWithOptions:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623032-application) | [`scene:willConnectToSession:options:`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197914-scene)                                     |
| [`application:didFinishLaunchingWithOptions:`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application) | [`scene:willConnectToSession:options:`](https://developer.apple.com/documentation/uikit/uiscenedelegate/3197914-scene)                                     |

<Tabs key="ios-language-switcher">
<Tab name="Swift">

```swift
public func scene(
  _ scene: UIScene,
  willConnectTo session: UISceneSession,
  options connectionOptions: UIScene.ConnectionOptions?
) -> Bool { }

public func sceneDidDisconnect(_ scene: UIScene) { }

public func sceneWillEnterForeground(_ scene: UIScene) { }

public func sceneDidBecomeActive(_ scene: UIScene) { }

public func sceneWillResignActive(_ scene: UIScene) { }

public func sceneDidEnterBackground(_ scene: UIScene) { }

public func scene(
    _ scene: UIScene,
    openURLContexts URLContexts: Set<UIOpenURLContext>
  ) -> Bool { }

public func scene(_ scene: UIScene, continue userActivity: NSUserActivity)
    -> Bool { }

public func windowScene(
    _ windowScene: UIWindowScene,
    performActionFor shortcutItem: UIApplicationShortcutItem,
    completionHandler: @escaping (Bool) -> Void
  ) -> Bool { }
```

</Tab>
<Tab name="Objective-C">

```objc
- (BOOL)scene:(UIScene*)scene
    willConnectToSession:(UISceneSession*)session
                 options:(nullable UISceneConnectionOptions*)connectionOptions { }

- (void)sceneDidDisconnect:(UIScene*)scene { }

- (void)sceneWillEnterForeground:(UIScene*)scene { }

- (void)sceneDidBecomeActive:(UIScene*)scene { }

- (void)sceneWillResignActive:(UIScene*)scene { }

- (void)sceneDidEnterBackground:(UIScene*)scene { }

- (BOOL)scene:(UIScene*)scene openURLContexts:(NSSet<UIOpenURLContext*>*)URLContexts { }

- (BOOL)scene:(UIScene*)scene continueUserActivity:(NSUserActivity*)userActivity { }

- (BOOL)windowScene:(UIWindowScene*)windowScene
    performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
               completionHandler:(void (^)(BOOL succeeded))completionHandler { }
```

</Tab>
</Tabs>

5. Move launch logic from `application:willFinishLaunchingWithOptions:` and

  将启动逻辑从 `application:willFinishLaunchingWithOptions:` 移至

   `application:didFinishLaunchingWithOptions:` to
   `scene:willConnectToSession:options:`.

`application:didFinishLaunchingWithOptions:` 至 `scene:willConnectToSession:options:`。


Despite `application:willFinishLaunchingWithOptions:` and
`application:didFinishLaunchingWithOptions:` not being deprecated,
after migrating to the `UIScene` lifecycle,
the launch options will be `nil`.
Any logic performed here related to the launch options should be
moved to the `scene:willConnectToSession:options:` event.

尽管 `application:willFinishLaunchingWithOptions:` 和 `application:didFinishLaunchingWithOptions:` 没有被弃用，但在迁移到 `UIScene` 生命周期后，启动选项将为 `nil`。此处执行的与启动选项相关的任何逻辑都应移至 `scene:willConnectToSession:options:` 事件。


6. [Optional] Migrate other deprecated APIs to support multiple scenes in the future.

  [可选] 迁移其他已弃用的API以支持未来的多场景。


| <t>Deprecated API</t><t>已弃用的 API</t> | <t>UIScene Replacement</t><t>UIScene 更换</t> |
|:---------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------|
| [`UIScreen mainScreen`](https://developer.apple.com/documentation/uikit/uiscreen/1617815-mainscreen)           | [`UIWindowScene screen`](https://developer.apple.com/documentation/uikit/uiwindowscene/screen?language=objc)       |
| [`UIApplication keyWindow`](https://developer.apple.com/documentation/uikit/uiapplication/1622924-keywindow)   | [`UIWindowScene keyWindow`](https://developer.apple.com/documentation/uikit/uiwindowscene/keywindow?language=objc) |
| [`UIApplication windows`](https://developer.apple.com/documentation/uikit/uiapplication/windows)       | [`UIWindowScene windows`](https://developer.apple.com/documentation/uikit/uiwindowscene/windows?language=objc)     |
| [`UIApplicationDelegate window`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/window) | [`UIView window`](https://developer.apple.com/documentation/uikit/uiview/window?language=objc)                     |

Instead of accessing these APIs,
you can access the `windowScene` through the `viewController`.
See the following examples.

你可以通过 `viewController` 访问 `windowScene`，而不是访问这些 API。请参阅以下示例。


<Tabs key="ios-language-switcher">
<Tab name="Objective-C">

```objc diff
  @interface MyPlugin ()
+   @property(nonatomic, weak) NSObject<FlutterPluginRegistrar> *registrar;
+    - (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
  @end

  @implementation MyPlugin

+  - (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
+    self = [super init];
+    if (self) {
+      _registrar = registrar;
+    }
+    return self;
+  }

  + (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
-    MyPlugin *instance = [[MyPlugin alloc] init];
+    MyPlugin *instance = [[MyPlugin alloc] initWithRegistrar:registrar];
  }

  - (void)someMethod {
-    UIScreen *screen = [UIScreen mainScreen];
+    UIScreen *screen = self.registrar.viewController.view.window.windowScene.screen;

-    UIWindow *window = [UIApplication sharedApplication].delegate.window;
+    UIWindow *window = self.registrar.viewController.view.window;

-    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
+    if (@available(iOS 15.0, *)) {
+      UIWindow *keyWindow = self.registrar.viewController.view.window.windowScene.keyWindow;
+    } else {
+      for (UIWindow *window in self.registrar.viewController.view.window.windowScene.windows) {
+        if (window.isKeyWindow) {
+          UIWindow *keyWindow = window;
+        }
+      }
+    }

-    NSArray<UIWindow *> *windows = [UIApplication sharedApplication].windows;
+    NSArray<UIWindow *> *windows = self.pluginRegistrar.viewController.view.window.windowScene.windows;
}
```

</Tab>
<Tab name="Swift">

```swift diff
  public class MyPlugin: NSObject, FlutterPlugin {
+  var registrar: FlutterPluginRegistrar

+  init(registrar: FlutterPluginRegistrar) {
+    self.registrar = registrar
+  }

  public static func register(with registrar: FlutterPluginRegistrar) {
-    let instance = MyPlugin()
+    let instance = MyPlugin(registrar: registrar)
  }

  func someMethod {
-    let screen = UIScreen.main;
+    let screen = self.registrar.viewController?.view.window?.windowScene?.screen;

-    let window = UIApplication.shared.delegate?.window;
+    let window = self.registrar.viewController?.view.window;

-    let keyWindow = UIApplication.shared.keyWindow;
+    if #available(iOS 15.0, *) {
+      let keyWindow = self.registrar.viewController?.view.window?.windowScene?.keyWindow
+    } else {
+      let keyWindow = self.registrar.viewController?.view.window?.windowScene?.windows.filter({ $0.isKeyWindow }).first
+    }
   
-    let windows = UIApplication.shared.windows;
+    let windows = self.registrar.viewController?.view.window?.windowScene?.windows;

}
```
</Tab>
</Tabs>

## Bespoke FlutterViewController usage

## 自定义 FlutterViewController 用法


For apps that use a `FlutterViewController` instantiated from Storyboards in
`application:didFinishLaunchingWithOptions:` for reasons other than
creating platform channels, it is their responsibility to
accommodate the new initialization order.

对于出于创建平台通道以外的原因而使用从 `application:didFinishLaunchingWithOptions:` 中的 Storyboard 实例化的 `FlutterViewController` 的应用程序，它们有责任适应新的初始化顺序。


Migration options:

迁移选项：


- Subclass `FlutterViewController` and put the logic in

  子类 `FlutterViewController` 并将逻辑放入

 the subclasses' `awakeFromNib`.

子类' `awakeFromNib`。

- Specify a `UISceneDelegate` in the `Info.plist` or

  在 `Info.plist` 中指定 `UISceneDelegate` 或

  in the `UIApplicationDelegate` and
  put the logic in `scene:willConnectToSession:options:`.
  For more information, check out [Apple's documentation][apple-delegate-docs].

并将逻辑放入 `UIApplicationDelegate` 中，并将逻辑放入 `scene:willConnectToSession:options:` 中。有关更多信息，请查看 [Apple 文档][apple-delegate-docs]。


[apple-delegate-docs]: {{site.apple-dev}}/documentation/uikit/specifying-the-scenes-your-app-supports

#### Example

#### 示例


```swift
@objc class MyViewController: FlutterViewController {
  override func awakeFromNib() {
    self.awakeFromNib()
    doSomethingWithFlutterViewController(self)
  }
}
```

## Hide migration warning

## 隐藏迁移警告


To hide the Flutter CLI warning about migrating to UIScene,
add the following to your pubspec.yaml:

要隐藏有关迁移到 UIScene 的 Flutter CLI 警告，请将以下内容添加到 pubspec.yaml 中：


```yaml file="pubspec.yaml" diff
  flutter:
    config:
+     enable-uiscene-migration: false
```

## Temporarily disable UIScene

## 临时禁用 UIScene


To _temporarily_ disable UIScene, add an underscore (`_`)
in front of **Application Scene Manifest** in your `Info.plist`:

要_暂时_禁用 UIScene，请在 `Info.plist` 中的 **应用程序场景清单** 前面添加下划线 (`_`)：


![Temporarily disable UIScene](/assets/images/docs/breaking-changes/disable-ui-scene.png)

When you are ready to re-enable, remove the underscore.

当你准备好重新启用时，请删除下划线。


## Timeline

## 时间线


- Landed in version: 3.38.0-0.1.pre

  登陆版本：3.38.0-0.1.pre

- Stable release: 3.38

  稳定版本：3.38

- Unknown: Apple changes their warning to an assert and Flutter apps that

  未知：Apple 将警告更改为断言和 Flutter 应用程序

  haven't adopted `UISceneDelegate` will start crashing on startup with the
  latest SDK.

尚未采用 `UISceneDelegate` 将在使用最新 SDK 启动时开始崩溃。


## References

## 参考资料


- [Issue 167267][] - The initial reported issue.

  [Issue 167267][]- 最初报告的 issue。


[Issue 167267]: {{site.github}}/flutter/flutter/issues/167267
[apple-delegate-docs]: {{site.apple-dev}}/documentation/uikit/specifying-the-scenes-your-app-supports
[method-channels-docs]: /platform-integration/platform-channels
[platform-views-docs]: /platform-integration/ios/platform-views
[`openURL`]: {{site.apple-dev}}/documentation/uikit/uiapplicationdelegate/1623112-application
[local_auth]: {{site.pub}}/packages/local_auth
