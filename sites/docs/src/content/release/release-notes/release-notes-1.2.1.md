---
# title: Flutter 1.2.1 release notes
title: Flutter 1.2.1 发行说明
# shortTitle: 1.2.1 release notes
shortTitle: 1.2.1 发行说明
# description: Release notes for Flutter 1.2.1.
description: Flutter 1.2.1 的发行说明。
skipTemplateRendering: true
ai-translated: true
---

Our #1 priority since the Flutter v1.0 release has been to
continue to address high priority issues reported both by
Flutter developers and the Flutter team itself.
This includes committing 672 pull requests in the Flutter
engine and framework since December (we've been busy!).
We've called out the new features and breaking changes
that we think are noteworthy below. The biggest ones came
from our Framework and Tool tags, but we also found and
fixed a couple of Severe issues as well.

自 Flutter v1.0 版本以来，我们的第一要务是继续解决 Flutter 开发人员和 Flutter 团队本身报告的高优先级 issue。这包括自 12 月以来在 Flutter 引擎和框架中提交 672 个拉取请求（我们一直很忙！）。我们在下面列出了我们认为值得注意的新功能和重大更改。最大的问题来自我们的 Framework 和 Tool 标签，但我们也发现并修复了几个严重的 issue。


## Framework

## 框架


To more fully round-out Flutter's animation support,
this release adds several more of the standard easing functions:

为了更全面地完善 Flutter 的动画支持，此版本添加了更多标准缓动函数：


[#25788](https://github.com/flutter/flutter/pull/25788) Add Robert Penner's easing functions

To integrate more fully with Android,
this release adds support for [Android App Bundles][],
a new packaging format that helps in reducing app size
and enables new features like dynamic delivery for Android apps:

为了与 Android 更全面地集成，此版本添加了对[Android App Bundles][]，一种新的打包格式，有助于减小应用程序大小并启用新功能，例如 Android 应用程序的动态交付：


[#24440](https://github.com/flutter/flutter/pull/24440) Adding support for android app bundle

To integrate more fully with iOS, this release adds several new features and fixes for iOS, including a new CupertinoTheme:

为了与 iOS 更全面地集成，此版本为 iOS 添加了多项新功能和修复，包括新的 Cupertino 主题：


[#25183](https://github.com/flutter/flutter/pull/25183) Add navigatorKey to CupertinoTabView

[#25593](https://github.com/flutter/flutter/pull/25593) Let CupertinoTabScaffold handle keyboard insets too

[#24876](https://github.com/flutter/flutter/pull/24876) Adds a fade in and out, rounds corners, fixes offset and fixes height of cursor on iOS

[#23759](https://github.com/flutter/flutter/pull/23759) Adds CupertinoTheme

In addition to the iOS Cupertino theme support, this release continues to enhance the Material theme as well:

除了 iOS Cupertino 主题支持之外，此版本还继续增强了 Material 主题：


[#24169](https://github.com/flutter/flutter/pull/24169) [Material] Theme-able elevation on dialogs

[#25339](https://github.com/flutter/flutter/pull/25339) [Material] Theme-able TextStyles for AlertDialog

To integrate more fully with desktop form-factors like Android tablets and ChromeOS as well as desktop web and desktop OS support, this release builds more support for keyboard and mouse as first class input devices:

为了更全面地与 Android 平板电脑和 ChromeOS 等桌面外形尺寸以及桌面 Web 和桌面操作系统支持集成，此版本为键盘和鼠标作为一流输入设备提供了更多支持：


[#7758](https://github.com/flutter/engine/pull/7758) Recommended implementation of combining characters implementation

[#27853](https://github.com/flutter/flutter/pull/27853) Hook up character events and unmodified code points to Android raw key event handling

[#27620](https://github.com/flutter/flutter/pull/27620) Add a keyboard key code generator

[#27627](https://github.com/flutter/flutter/pull/27627) Adding support for logical and physical key events

[#6961](https://github.com/flutter/engine/pull/6961) Add hover event support to the engine

[#24830](https://github.com/flutter/flutter/pull/24830) Implement hover support for mouse pointers

As widgets are the core way to interact with users in Flutter, this release continues to add features and fixes to the Flutter widget set with particular attention paid to the [SliverAppBar](https://api.flutter.dev/flutter/material/SliverAppBar-class.html):

由于 widgets 是 Flutter 中与用户交互的核心方式，因此此版本继续添加功能并修复 Flutter widget 集，特别关注[SliverAppBar](https://api.flutter.dev/flutter/material/SliverAppBar-class.html):


[#26021](https://github.com/flutter/flutter/pull/26021) Fix SliverAppBar title opacity and test all cases

[#26101](https://github.com/flutter/flutter/pull/26101) Fix a floating snapping SliverAppBar crash

[#25091](https://github.com/flutter/flutter/pull/25091) Add animations to SliverAppBar doc

[#24736](https://github.com/flutter/flutter/pull/24736) Provide some more locations for the FAB

[#25585](https://github.com/flutter/flutter/pull/25585) Expose font fallback API in TextStyle, Roll engine 54a3577c0139..215ca1560088

[#24457](https://github.com/flutter/flutter/pull/24457) Revise Android and iOS gestures on Material TextField

[#24554](https://github.com/flutter/flutter/pull/24554) Adds force press gesture detector and recognizer

[#23919](https://github.com/flutter/flutter/pull/23919) Allow detection of taps on TabBar

[#25384](https://github.com/flutter/flutter/pull/25384) Adds support for floating cursor

[#24976](https://github.com/flutter/flutter/pull/24976) Support TextField multi-line hint text

[#26332](https://github.com/flutter/flutter/pull/26332) Strut: fine tuned control over text minimum line heights, allows forcing the line height to be a specified height

And finally, as Flutter usage continues to grow world-wide, we continue to enhance support for localizations across several languages, including Ukrainian, Polish, Swahili and Galician in this release.

最后，随着 Flutter 在全球范围内的使用量持续增长，我们将继续增强对多种语言本地化的支持，包括本版本中的乌克兰语、波兰语、斯瓦希里语和加利西亚语。


[#25394](https://github.com/flutter/flutter/pull/25394) Update localizations

[#27506](https://github.com/flutter/flutter/pull/27506) Added support for Swahili (material_sw.arb)

[#27352](https://github.com/flutter/flutter/pull/24876) Including Galician language


## Plug-Ins

## 插件


As in the framework and engine itself, we're continuing to focus on plugin quality as well:

与框架和引擎本身一样，我们也继续关注插件质量：


[flutter/engine#7317](https://github.com/flutter/engine/pull/7317) Fix stale GrContext for iOS platform views

[flutter/engine#7558](https://github.com/flutter/engine/pull/7558) Fix lost touch events for iOS platform views

[flutter/plugins#1157](https://github.com/flutter/plugins/pull/1157) [google_maps_flutter] Fix camera positioning issue on iOS

[flutter/plugins#1176](https://github.com/flutter/plugins/pull/1176) [firebase_auth] Fix Firebase phone auth on Android

[flutter/plugins#1037](https://github.com/flutter/plugins/pull/1037) [camera] Save photo orientation on iOS

[flutter/plugins#1129](https://github.com/flutter/plugins/pull/1129) [android_alarm_manager] Fix "background start not allowed" issues, queue events that are received too early

[flutter/plugins#1051 ](https://github.com/flutter/plugins/pull/1051)[image_picker] Fix crash on iOS when the picker is tapped multiple times

The webview_flutter plugin got a communication channel between Dart and JavaScript:

webview_flutter 插件在 Dart 和 JavaScript 之间建立了通信通道：


[flutter/plugins#1116](https://github.com/flutter/plugins/pull/1116) Add WebView JavaScript channels (Dart side)

[flutter/plugins#1130](https://github.com/flutter/plugins/pull/1130) WebView JavasScript channels Android implementation

[flutter/plugins#1139](https://github.com/flutter/plugins/pull/1139) WebView JavaScript channels - iOS implementation

[lutter/plugins1021](https://github.com/flutter/plugins/pull/1021) javascript evaluation ios/android

We've made progress building the In App Purchase plugin (which is still pre-release):

我们在构建应用内购买插件（仍处于预发布阶段）方面取得了进展：


[#1057](https://github.com/flutter/plugins/pull/1057) [IAP] Check if the payment processor is available

[#1084](https://github.com/flutter/plugins/pull/1084) [IAP] Fetch SkuDetails from Google Play

[#1068](https://github.com/flutter/plugins/pull/1068) IAP productlist ios

[#1172](https://github.com/flutter/plugins/pull/1172) [In_app_purchase] add payment objc translators


## Dart

## Dart


The release contains a new Dart SDK which provides support for a new set literals syntax and increases AOT performance 10-20% by reducing the overhead of calling constructors or static methods:

该版本包含一个新的 Dart SDK，它提供对新的集合文字语法的支持，并通过减少调用构造函数或静态方法的开销将 AOT 性能提高 10-20%：


[#37](https://github.com/dart-lang/language/issues/37) Set Literal

[#33274](https://github.com/dart-lang/sdk/issues/33274) Add support for "naked" instructions: global object pool, pc-relative static calls, faster indirect calls, potential code sharing


## Tool

## 工具


We've added a number of new tools and new features to existing tools in this release.

在此版本中，我们向现有工具添加了许多新工具和新功能。


This release continues to improve error messages across a range of tools:

此版本继续改进一系列工具的错误消息：


[#26107](https://github.com/flutter/flutter/pull/26107) Better error messages for flutter tool --dynamic flag

[#26084](https://github.com/flutter/flutter/pull/26084) Improve message when saving compilation training data

[#25863](https://github.com/flutter/flutter/pull/25863) Friendlier messages when using dynamic patching

This release also adds support for Java 1.8:

此版本还增加了对 Java 1.8 的支持：


[#25470](https://github.com/flutter/flutter/pull/25470) Support Java 1.8


## Severe

## 严重


In this release, we've found and fixed a few severe issues from the previous release, including two crashes and one performance degradation.

在此版本中，我们发现并修复了上一版本中的一些严重的 issue，包括两次崩溃和一次性能下降。


Crashes

崩溃


[#7314](https://github.com/flutter/flutter/issues/7314) Flutter crash on startup (metabug)

Performance

表现


[#25381](https://github.com/flutter/flutter/pull/25381) Add cull opacity perf test to device lab


## Breaking Changes

## 重大变化


In an effort to continue to improve Flutter since 1.0 to meet customer needs, we have had to make a few breaking changes:

为了自 1.0 起继续改进 Flutter 以满足客户需求，我们不得不做出一些重大更改：


### [#8769](https://github.com/flutter/flutter/pull/8769) Rename ListItem to ListTile, document ListTile fixed height geometry

### [#8769](https://github.com/flutter/flutter/pull/8769)将 ListItem 重命名为 ListTile，文档 ListTile 固定高度几何体


Many developers were confused by the fact that ListItem was fixed height. We've renamed it to ListTile, to indicate that (like other tiles) its height is fixed, and the documentation has been updated to clearly say that about ListTile. You'll need to rename instances of the ListItem class to ListTile in your code.

许多开发人员对 ListItem 的高度固定这一事实感到困惑。我们已将其重命名为 ListTile，以表明（与其他图块一样）其高度是固定的，并且文档已更新以清楚说明有关 ListTile 的情况。你需要在代码中将 ListItem 类的实例重命名为 ListTile。


### [#7518](https://github.com/flutter/engine/pull/7518) Update default flutter_assets path for iOS embedding

### [#7518](https://github.com/flutter/engine/pull/7518)更新 iOS 嵌入的默认 flutter_assets 路径


Flutter assets for iOS applications are now found in Frameworks/App.framework/flutter_assets instead of flutter_assets. The flutter command line tool should take care of this difference, but if you are writing an AddToApp application for iOS that shares assets with Flutter, you'll need to be aware of this change.

iOS 应用程序的 Flutter 资产现在位于 Frameworks/App.framework/flutter_assets 中，而不是 flutter_assets 中。 flutter 命令行工具应该处理这种差异，但如果你正在为 iOS 编写与 Flutter 共享资产的 AddToApp 应用程序，则需要注意此更改。



### [#27697](https://github.com/flutter/flutter/pull/27697) Cupertino TextField Cursor Fix

### [#27697](https://github.com/flutter/flutter/pull/27697)Cupertino TextField 光标修复


CupertinoTextField's cursorColor default now matches the app's theme. If this is undesirable, developers can use the cupertinoOverrideTheme property of ThemeData to provide a Cupertino-specific override using a CupertinoThemeData object, e.g:

CupertinoTextField 的光标颜色默认值现在与应用程序的主题匹配。如果这是不可取的，开发人员可以使用 ThemeData 的 cupertinoOverrideTheme 属性，使用 CupertinoThemeData 对象提供 Cupertino 特定的覆盖，例如：


```dart
Widget build(BuildContext context) {
  // Set theme data for override in the CupertinoThemeData's constructor
  Theme.of(context).cupertinoOverrideTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF42A5F5)
  );
  return Text(
    'Example',
    style: Theme.of(context).textTheme.title,
  );
}
```


### [#23424](https://github.com/flutter/flutter/pull/23424) Teach drag start behaviors to DragGestureRecognizer

### [#23424](https://github.com/flutter/flutter/pull/23424)向 DragGestureRecognizer 教授拖动开始行为


By default, a drag gesture detector's onStart callback will be called with the location of where a drag gesture is detected (i.e. after dragging a certain number of pixels) instead of at the touch down location. To use the old functionality with a given drag gesture recognizer, the dragStartBehavior variable of the recognizer should be set DragStartBehavior.down, e.g., include the bolded line below when declaring your GestureDecorator:

默认情况下，拖动手势检测器的 onStart 回调将在检测到拖动手势的位置（即拖动一定数量的像素后）而不是在触摸位置调用。要使用给定拖动手势识别器的旧功能，识别器的 DragStartBehavior 变量应设置为 DragStartBehavior.down，例如，在声明 GestureDecorator 时包含下面的粗体线：


```dart
GestureDectector(
  dragStartBehavior: DragStartBehavior.down,
  onVerticalDragDown: myDragDown
  onVerticalDragEnd: myDragEnd,
  onVerticalDragStart: myDragStart,
  onVerticalDragUpdate: myDragUpdate,
  onVerticalDragCancel: myDragCancel,
  onHorizontalDragDown: myDragDown
  onHorizontalDragEnd: myDragEnd,
  onHorizontalDragStart: myDragStart,
  onHorizontalDragUpdate: myDragUpdate,
  onHorizontalDragCancel: myDragCancel,
// Other fields…
```


### [#26238](https://github.com/flutter/flutter/pull/26238) Remove long-deprecated TwoLevelList

### [#26238](https://github.com/flutter/flutter/pull/26238)删除长期弃用的 TwoLevelList


Removed the long-deprecated TwoLevelList widget; use ListView with ExpansionTile instead. See [this example](https://github.com/flutter/flutter/blob/v1.2.1/examples/catalog/lib/expansion_tile_sample.dart) for a sample that uses ExpansionTile.

删除了长期弃用的 TwoLevelList widget；请使用 ListView 和 ExpansionTile 代替。看[this example](https://github.com/flutter/flutter/blob/v1.2.1/examples/catalog/lib/expansion_tile_sample.dart)对于使用 ExpansionTile 的示例。



###[#7442](https://github.com/flutter/engine/pull/7442) Move Picture.toImage rasterization to the GPU thread

###[#7442](https://github.com/flutter/engine/pull/7442)将 Picture.toImage 光栅化移至 GPU 线程


Picture.toImage now returns a `Future<Image>` instead. This permits image rasterization to occur on the GPU thread, improving performance in many cases and ensuring correct results. At a minimum, you'll need to declare methods invoking on Picture instances as async, and use await, like this:

Picture.toImage 现在返回 `Future<Image>` 。这允许在 GPU 线程上进行图像光栅化，从而在许多情况下提高性能并确保正确的结果。至少，你需要将调用 Picture 实例的方法声明为异步，并使用等待，如下所示：


```dart
void usePictureImage(Picture p) async {
  var image = await p.toImage();
  // Do something with the pixels in image….
}
```

However, your application may well be performing other asynchronous actions, and you should consider how you want to handle image processing in that light. For more on Dart's support for asynchronous programming and the Future class, see [https://www.dartlang.org/tutorials/language/futures.](https://www.dartlang.org/tutorials/language/futures)

但是，你的应用程序很可能正在执行其他异步操作，你应该考虑如何从这个角度处理图像处理。有关 Dart 对异步编程和 Future 类的支持的更多信息，请参阅[https://www.dartlang.org/tutorials/language/futures.](https://www.dartlang.org/tutorials/language/futures)



### [#7567](https://github.com/flutter/engine/pull/7567) Rename FlutterResult in embedder.h

### [#7567](https://github.com/flutter/engine/pull/7567)重命名 FlutterResult 在 embedder.h 中


In the Embedder API, the FlutterResult type has been renamed to FlutterEngineResult to better explain its purpose. You'll need to rename any instances of the former to the latter.

在 Embedder API 中，FlutterResult 类型已重命名为 FlutterEngineResult，以更好地解释其用途。你需要将前者的任何实例重命名为后者。



### [#7414](https://github.com/flutter/engine/pull/7414) Strut implementation

### [#7414](https://github.com/flutter/engine/pull/7414)支柱实施


Rename dart:ui ParagraphStyle.lineHeight to ParagraphStyle.height. The ParagraphStyle.lineHeight property previously did not do anything and was renamed to stay consistent with TextStyle.height. You'll need to rename any instances of the former to the latter.

将 dart:ui ParagraphStyle.lineHeight 重命名为 ParagraphStyle.height。 ParagraphStyle.lineHeight 属性以前没有执行任何操作，已重命名以与 TextStyle.height 保持一致。你需要将前者的任何实例重命名为后者。



## Regressions

## 回归


Soon after our 1.2 release, we found two regressions:

1.2 版本发布后不久，我们发现了两个回归：



* [#28640](https://github.com/flutter/flutter/issues/28640) NoSuchMethodError: android.view.MotionEvent.isFromSource

  [#28640](https://github.com/flutter/flutter/issues/28640)NoSuchMethodError：android.view.MotionEvent.isFromSource


[flutter/flutter#24830](https://github.com/flutter/flutter/pull/24830) ("Implement hover support for mouse pointers.") is using an Android API that doesn't exist on older devices. This can cause a crash on Android 4.1 (Jellybean) and 4.1 (Jellybean MR1).


* [#28484](https://github.com/flutter/flutter/issues/28484) Widget rendering strange since Flutter update

  [#28484](https://github.com/flutter/flutter/issues/28484)自 Flutter 更新以来 Widget 呈现奇怪


This can cause rendering issues when loading certain images on physical iOS devices.

在物理 iOS 设备上加载某些图像时，这可能会导致渲染 issues。


To get a fix for these regressions, once beta 1.3 lands in March,  you can switch to the beta channel and perform a "flutter upgrade" at the command line. At the time of this writing, that will update you to at least version 1.3.8, which includes [flutter/engine#8006](https://github.com/flutter/engine/pull/8006) ("Guard against using Android API not defined in API level 16 & 17") and the Skia commit that fixes the rendering issue. For the crashing issue, the two affected versions of Android are more than ten years old and represent at most 2.5% of Android users, few of which are likely to be installing new Android applications, whether they're Flutter or not. Even so, we hate to leave known regressions in a stable release, but after much internal debate, we decided it was the best way to proceed for Flutter developers and their app users.

为了修复这些回归问题，一旦 beta 1.3 在 3 月份发布，你可以切换到 beta 通道并在命令行执行“flutter 升级”。在撰写本文时，你将至少更新到版本 1.3.8，其中包括[flutter/engine#8006](https://github.com/flutter/engine/pull/8006)（“防止使用 API 级别 16 和 17 中未定义的 Android API”）以及修复渲染 issue 的 Skia 提交。对于崩溃的 issue，两个受影响的 Android 版本已有十多年历史，最多占 Android 用户的 2.5%，其中很少有人可能会安装新的 Android 应用程序，无论它们是否是 Flutter。即便如此，我们不愿意在稳定版本中留下已知的回归，但经过多次内部辩论，我们认为这是 Flutter 开发人员及其应用程序用户继续进行的最佳方式。


Our ideal fix for any serious issue is to create a "hotfix" release by taking an existing release and "cherry picking" the fixes that we'd like to apply. The ability to hotfix an existing stable release is something that we implemented for 1.2 but have not quite gotten to production quality. The consequence of this is that if we had created a new stable "1.2.1-a" release with the fix for the regressions, we'd have stranded all of our users at that branch; updating to future branches would've required users to remove and reinstall Flutter from scratch, which was clearly unacceptable. We are working hard to validate our ability to hotfix in 1.3+ so that we don't have this problem again.

对于任何严重的 issue ，我们的理想修复是通过采用现有版本并“挑选”我们想要应用的修复来创建“修补程序”版本。我们在 1.2 中实现了对现有稳定版本进行热修复的功能，但尚未完全达到生产质量。这样做的结果是，如果我们创建了一个新的稳定的“1.2.1-a”版本并修复了回归问题，我们就会将所有用户困在该分支；更新到未来的分支将需要用户从头开始删除并重新安装 Flutter ，这显然是不可接受的。我们正在努力验证我们在 1.3+ 中进行修补的能力，以便我们不会再次遇到此问题。


Another option would have been to bring 1.3 to a stable release. Our current policy is to only bring out a new stable release once per quarter to reduce churn for Flutter developers. As of this writing, the pre-stable 1.3 release contains 104 framework commits (and even more engine, Dart, and Skia commits), any of which is a risk to how your current apps are running. To reduce that risk, we leave releases in beta for a month, let developers test them, and only promote releases to the stable channel when we're confident in them. That's how we maintain stability in the quarterly releases.

另一种选择是将 1.3 引入稳定版本。我们当前的政策是每季度仅发布一次新的稳定版本，以减少 Flutter 开发人员的流失。截至撰写本文时，预稳定版 1.3 版本包含 104 个框架提交（甚至更多的引擎、Dart 和 Skia 提交），其中任何一个都会对当前应用程序的运行方式带来风险。为了降低这种风险，我们将测试版本保留一个月，让开发人员对其进行测试，并且仅在我们对它们有信心时才将版本推广到稳定渠道。这就是我们保持季度发布稳定性的方式。


Our next stable release is currently planned for May, 2019, which is the first stable release that will include the fix for this regression. If you are affected by [#28640](https://github.com/flutter/flutter/issues/28640) and feel like the workaround to use the pre-release 1.3 is not an option for you, please let us know by on [flutter/flutter#29235](https://github.com/flutter/flutter/issues/29235) itself. Similarly, if you are affected by [#28484](https://github.com/flutter/flutter/issues/28484), et us know on [flutter/flutter/#29360](https://github.com/flutter/flutter/issues/29360). If we find that there's a lot of feedback from the Flutter community that we made the wrong decision here, we'll use your feedback to reevaluate. Flutter is, after all, a community effort, and your opinions matter.

我们的下一个稳定版本目前计划于 2019 年 5 月发布，这是第一个包含此回归修复的稳定版本。如果你受到影响[#28640](https://github.com/flutter/flutter/issues/28640)并且觉得使用预发行版 1.3 的解决方法不适合你，请通过 on 让我们知道[flutter/flutter#29235](https://github.com/flutter/flutter/issues/29235)本身。同样，如果你受到以下影响[#28484](https://github.com/flutter/flutter/issues/28484)，让我们知道[flutter/flutter/#29360](https://github.com/flutter/flutter/issues/29360)。如果我们发现 Flutter 社区的大量反馈表明我们在此做出了错误的决定，我们将根据你的反馈进行重新评估。毕竟，Flutter 是社区的努力，你的意见很重要。



## Tooling Releases

## 工具发布


In addition to Flutter framework changes in the 1.2 release, we've made a number of tooling releases in the same timeframe, which you can read about here:

除了 1.2 版本中的 Flutter 框架更改之外，我们还在同一时间范围内发布了许多工具版本，你可以在此处阅读：




*   Dart & Flutter support for Visual Studio Code: versions [2.21](https://dartcode.org/releases/v2-21/), [2.22](https://dartcode.org/releases/v2-22/), [2.23](https://dartcode.org/releases/v2-23/) and [2.24](https://dartcode.org/releases/v2-24/).

  Dart 和 Flutter 对 Visual Studio Code 的支持：版本[2.21](https://dartcode.org/releases/v2-21/),[2.22](https://dartcode.org/releases/v2-22/),[2.23](https://dartcode.org/releases/v2-23/)和[2.24](https://dartcode.org/releases/v2-24/).

*   Dart & Flutter support for IntelliJ & Android Studio: [January, 2019](https://groups.google.com/forum/#!searchin/flutter-dev/nilay%7Csort:date/flutter-dev/VCfGRhDsHgs/JcYKxkxHBAAJ) and [February, 2019](https://groups.google.com/forum/#!searchin/flutter-dev/nilay%7Csort:date/flutter-dev/VCfGRhDsHgs/JcYKxkxHBAAJ) releases.

  Dart 和 Flutter 对 IntelliJ 和 Android Studio 的支持：[January, 2019](https://groups.google.com/forum/#!searchin/flutter-dev/nilay%7Csort:date/flutter-dev/VCfGRhDsHgs/JcYKxkxHBAAJ)和[February, 2019](https://groups.google.com/forum/#!searchin/flutter-dev/nilay%7Csort:date/flutter-dev/VCfGRhDsHgs/JcYKxkxHBAAJ)发布。

*   Dart DevTools [alpha release](/tools/devtools).

  Dart 开发工具[alpha release](/tools/devtools).


## Full Issue List

## 完整问题列表


You can see [the full list of PRs committed in this release](/release/release-notes/changelogs/changelog-1.2.1).

你可以看到[the full list of PRs committed in this release](/release/release-notes/changelogs/changelog-1.2.1).


[Android App Bundles]: https://developer.android.com/guide/app-bundle/
