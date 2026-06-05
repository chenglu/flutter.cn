---
# title: Flutter Changelog 0.0.21 - 1.0.0
title: Flutter 变更日志 0.0.21 - 1.0.0
# shortTitle: Flutter Changelog up to 1.0.0
shortTitle: Flutter 更新日志至 1.0.0
# description: Archived Changelog wiki page, containing release information between Flutter 0.0.21 and 1.0.0.
description: 存档的 Changelog wiki 页面，包含 Flutter 0.0.21 和 1.0.0 之间的发行信息。
skipTemplateRendering: true
ai-translated: true
---

_This page is a dump of the old Changelog page from the Flutter wiki up until
[Flutter release notes](./) were published in flutter.dev._

_此页面是 Flutter wiki 中旧变更日志页面的转储，直到[Flutter release notes](./)发表在 flutter.dev._


## Changes through and including 1.0.0

## 1.0.0 前后的更改（包括 1.0.0）


* Skia and engine rolls to address the following:

  Skia 和发动机滚动可解决以下问题：

  * [video_player image distortion problem after last flutter update 0.11.3](https://github.com/flutter/flutter/issues/24402)
  * [Green, flickering bar over camera preview](https://github.com/flutter/flutter/issues/24289)
  * [Image rendering issues on Adreno 3xx devices after upgrade from 0.9.4 to 0.10.2](https://github.com/flutter/flutter/issues/24517)
* Engine rolls to fix

  发动机滚动修复

  * [Prepend [NSLocale currentLocale] for first locale on iOS to ensure countryCode exists. Allow language-only locales.](https://github.com/flutter/engine/issues/6995)

    [在 iOS 上为第一个区域设置添加 [NSLocale currentLocale] 以确保国家代码存在。允许仅语言区域设置。](https://github.com/flutter/engine/issues/6995)

  * [Changes to unblock Fuchsia roll](https://github.com/flutter/engine/issues/6949)
* Various fixes to tooling for documentation, documentation, and documentation accompanying the templates.

  对文档工具、文档以及模板附带的文档进行了各种修复。


## Changes since v0.10.2

## 自 v0.10.2 以来的变化

* [flutter/engine#6883](https://github.com/flutter/engine/pull/6883) - FlutterViewController will no longer load your app's splash screen by default.  The implementation of that has been moved to a new method `loadDefaultSplashScreenView`.

  [flutter/engine#6883](https://github.com/flutter/engine/pull/6883)- FlutterViewController 默认情况下将不再加载应用程序的启动屏幕。  其实现已移至新方法 `loadDefaultSplashScreenView`。

* [#23755](https://github.com/flutter/flutter/pull/23755) Removed direct dependency of flutter_test on `package:test`. Flutter now requires test version 1.5.1 and mockito version 4.0.0.

  [#23755](https://github.com/flutter/flutter/pull/23755)删除了 flutter_test 对 `package:test` 的直接依赖。 Flutter 现在需要测试版本 1.5.1 和 mockito 版本 4.0.0。


  ### Breaking change:
  This requires adding an explicit dependency to your pubspec.yaml:

### 重大更改：这需要向你的 pubspec.yaml 添加显式依赖项：

  ```yaml
  dev_dependencies:
    test: ^1.5.1
  ```
* [#24024](https://github.com/flutter/flutter/pull/24024) and [flutter/engine#6760](https://github.com/flutter/engine/pull/6760) Upgraded harfbuzz to 2.1.0, Significantly improved text layout, and zero-width-joiner (zwj) support for better emojis on iOS.

  [#24024](https://github.com/flutter/flutter/pull/24024)和[flutter/engine#6760](https://github.com/flutter/engine/pull/6760)将 harfbuzz 升级到 2.1.0，显着改进了文本布局，并支持零宽度连接器 (zwj)，以在 iOS 上提供更好的表情符号。

* [#23417](https://github.com/flutter/flutter/pull/23417) provide `null` when locale is unavailable or invalid instead of `_`.

  [#23417](https://github.com/flutter/flutter/pull/23417)当区域设置不可用或无效时提供 `null` 而不是 `_`。

* [#23583](https://github.com/flutter/flutter/pull/23583) Improved localization algorithm with scriptCodes and full preferred locales list support, breaking changes to callbacks when locales are changed (pass list instead of single locale).

  [#23583](https://github.com/flutter/flutter/pull/23583)通过 scriptCodes 和完整的首选区域设置列表支持改进了本地化算法，在区域设置更改时破坏了回调的更改（传递列表而不是单个区域设置）。


### v0.11.0

### v0.11.0

* [#23320](https://github.com/flutter/flutter/pull/23320) Adds back swipe gesture support for Cupertino navigation bars' cross-page transitions.

  [#23320](https://github.com/flutter/flutter/pull/23320)为 Cupertino 导航栏的跨页面转换添加向后滑动手势支持。

* [#23320](https://github.com/flutter/flutter/pull/23322) Adds support for Hero transitions across multiple Navigators.

  [#23320](https://github.com/flutter/flutter/pull/23322)添加了对跨多个导航器的英雄转换的支持。


## Changes in v0.10.2 (since v0.9.4) - beta 10

## v0.10.2 中的更改（自 v0.9.4 起）- beta 10


### v0.10.2

### v0.10.2

* [#23194](https://github.com/flutter/flutter/pull/23194) Adds CupertinoTextField, an iOS styled text entry field.

  [#23194](https://github.com/flutter/flutter/pull/23194)添加 CupertinoTextField，一个 iOS 样式的文本输入字段。

* [#23221](https://github.com/flutter/flutter/pull/23221) Adds RTL support for Cupertino navigation bars' cross-page transitions.

  [#23221](https://github.com/flutter/flutter/pull/23221)添加对 Cupertino 导航栏跨页面转换的 RTL 支持。


### v0.10.1

### v0.10.1

* [#22977](https://github.com/flutter/flutter/pull/22977) replaces most of `Null` by `void`. See [the mail proposing this change](https://groups.google.com/forum/#!topic/flutter-dev/b7TKGqERNTM).

  [#22977](https://github.com/flutter/flutter/pull/22977)将 `Null` 的大部分替换为 `void`。看[the mail proposing this change](https://groups.google.com/forum/#!topic/flutter-dev/b7TKGqERNTM).

* [#22985](https://github.com/flutter/flutter/pull/22985) Implement correct orthographic projection

  [#22985](https://github.com/flutter/flutter/pull/22985)实施正确的正投影

* [#23104](https://github.com/flutter/flutter/pull/23104) Update wrapping message

  [#23104](https://github.com/flutter/flutter/pull/23104)更新包装消息

* [#22924](https://github.com/flutter/flutter/pull/22924) Support for disabling interactive TextField caret and selection

  [#22924](https://github.com/flutter/flutter/pull/22924)支持禁用交互式 TextField 插入符和选择

* [#22870](https://github.com/flutter/flutter/pull/22870) Use new `mixin` syntax for super-mixins

  [#22870](https://github.com/flutter/flutter/pull/22870)对超级混合使用新的 `mixin` 语法

* [#22022](https://github.com/flutter/flutter/pull/22022) allow command line option "--project-name" in flutter create

  [#22022](https://github.com/flutter/flutter/pull/22022)在 flutter create 中允许命令行选项“--project-name”

* [#23126](https://github.com/flutter/flutter/pull/23126) Dispatch a Flutter.Navigation event each time navigation occurs.

  [#23126](https://github.com/flutter/flutter/pull/23126)每次发生导航时调度 Flutter.Navigation 事件。

* [#23183](https://github.com/flutter/flutter/pull/23183) Fix bug where gradle build rule would rerun on switching from

  [#23183](https://github.com/flutter/flutter/pull/23183)修复 gradle 构建规则在切换时重新运行的错误

* [#22394](https://github.com/flutter/flutter/pull/22394) Fix out of range spring simulation in ClampingScrollSimulation

  [#22394](https://github.com/flutter/flutter/pull/22394)修复 ClampingScrollSimulation 中超出范围的弹簧模拟

* [#23174](https://github.com/flutter/flutter/pull/23174) enable lint prefer_void_to_null

  [#23174](https://github.com/flutter/flutter/pull/23174)启用 lint Preferred_void_to_null

* [#23184](https://github.com/flutter/flutter/pull/23184) TextTheme.apply() should not assume non-null TextStyle fields

  [#23184](https://github.com/flutter/flutter/pull/23184)TextTheme.apply() 不应假定非空 TextStyle 字段

* [#23168](https://github.com/flutter/flutter/pull/23168) Added Mongolian (mn) translations

  [#23168](https://github.com/flutter/flutter/pull/23168)添加了蒙古语（百万）翻译

* [#23167](https://github.com/flutter/flutter/pull/23167) Fix disabled formfield validation

  [#23167](https://github.com/flutter/flutter/pull/23167)修复禁用的表单字段验证

* [#23015](https://github.com/flutter/flutter/pull/23015) Finalize editing when hitting the enter key on a single line TextField

  [#23015](https://github.com/flutter/flutter/pull/23015)在单行上按 Enter 键时完成编辑 TextField

* [#23021](https://github.com/flutter/flutter/pull/23021) Make it easier to use CocoaPods to Add2App for iOS

  [#23021](https://github.com/flutter/flutter/pull/23021)使使用 CocoaPods 更轻松地为 iOS 添加 2App

* [#22825](https://github.com/flutter/flutter/pull/22825) fix Curves.bounceInOut math

  [#22825](https://github.com/flutter/flutter/pull/22825)修复 Curves.bounceInOut 数学

* [#22977](https://github.com/flutter/flutter/pull/22977) Prefer void to null

  [#22977](https://github.com/flutter/flutter/pull/22977)优先选择 void 而非 null

* [#22822](https://github.com/flutter/flutter/pull/22822) Adds callback for Long Press Up

  [#22822](https://github.com/flutter/flutter/pull/22822)添加长按向上的回调

* [#18770](https://github.com/flutter/flutter/pull/18770) Add `disabledHint` to DropdownButton

  [#18770](https://github.com/flutter/flutter/pull/18770)将 `disabledHint` 添加到 DropdownButton

* [#21657](https://github.com/flutter/flutter/pull/21657) Make AndroidView take gesture recognizer factories.

  [#21657](https://github.com/flutter/flutter/pull/21657)制作 AndroidView 获取手势识别器工厂。

* [#22449](https://github.com/flutter/flutter/pull/22449) Add support for text shadows

  [#22449](https://github.com/flutter/flutter/pull/22449)添加对文本阴影的支持

* [flutter/engine#6644](https://github.com/flutter/engine/pull/6644) Add BoxHeightStyle and BoxWidthStyle as arguments to Paragraph.getBoxesForRange() to obtain various styles of enclosing boxes.

  [flutter/engine#6644](https://github.com/flutter/engine/pull/6644)将 BoxHeightStyle 和 BoxWidthStyle 作为参数添加到 Paragraph.getBoxesForRange() 中，以获取各种样式的封闭框。

* Skia update that changes the low level implementation of blurs and anti aliasing, which may break golden tests.

  Skia 更新改变了模糊和抗锯齿的低级实现，这可能会破坏黄金测试。


### v0.9.7

### v0.9.7

* [flutter/engine#6393](https://github.com/flutter/engine/pull/6393) adds nullability annotations to Android MethodChannel/MethodCall.

  [flutter/engine#6393](https://github.com/flutter/engine/pull/6393)向 Android MethodChannel/MethodCall 添加可空性注释。


### v0.9.6

### v0.9.6

* [#21251](https://github.com/flutter/flutter/pull/21251) adds CupertinoDatePicker, an iOS-style picker control that supports a date mode and a date + time mode.

  [#21251](https://github.com/flutter/flutter/pull/21251)添加 CupertinoDatePicker，一个 iOS 风格的选择器控件，支持日期模式和日期+时间模式。


## Changes in v0.9.4 (since v0.8.2 ) - beta 9

## v0.9.4 中的更改（自 v0.8.2 以来）- beta 9


### v0.9.4

### v0.9.4


* [#21715](https://github.com/flutter/flutter/pull/21715), The default MaterialPageRoute transition is now defined by the Theme. Added (optional) support for Android P style page transitions. The MaterialPageRoute support for "hosting" another route to reuse its buildTransitions() method was removed because PageTransitionsBuilders, including CupertinoPageTransitionBuilder, are standalone objects.

  [#21715](https://github.com/flutter/flutter/pull/21715)，默认的 MaterialPageRoute 过渡现在由主题定义。添加了（可选）对 Android P 样式页面转换的支持。 MaterialPageRoute 对“托管”另一个路由以重用其 buildTransitions() 方法的支持已被删除，因为 PageTransitionsBuilders（包括 CupertinoPageTransitionBuilder）是独立对象。


### v0.9.3

### v0.9.3


* [#22108](https://github.com/flutter/flutter/pull/22108) changed the output of `flutter doctor` slightly, which may affect automated scripts that depended on the exact output.

  [#22108](https://github.com/flutter/flutter/pull/22108)稍微更改了 `flutter doctor` 的输出，这可能会影响依赖于确切输出的自动化脚本。


### v0.9.2

### v0.9.2


* [#21540](https://github.com/flutter/flutter/pull/21540) added a `transform()` method to [`Animatable`](https://api.flutter.dev/flutter/animation/Animatable-class.html). It is implemented by `Tween` (the main subclass of `Animatable`) but classes that subclass `Animatable` directly will need to implement it. Typically the existing `evaluate()` method can be changed to implement `transform()` instead, using the value given by the argument to `transform()` rather than the current value of the animation provided to `evaluate()`. `evaluate()` now has a default implementation that defers to `transform()`.

  [#21540](https://github.com/flutter/flutter/pull/21540)添加了 `transform()` 方法[`Animatable`](https://api.flutter.dev/flutter/animation/Animatable-class.html)。它由 `Tween` （`Animatable` 的主要子类）实现，但直接子类 `Animatable` 的类需要实现它。通常，可以更改现有的 `evaluate()` 方法来实现 `transform()` ，使用 `transform()` 参数给出的值而不是提供给 `evaluate()` 的动画的当前值。 `evaluate()` 现在有一个遵循 `transform()` 的默认实现。


## Changes in v0.8.2 (since v0.7.3) - beta 8

## v0.8.2 中的更改（自 v0.7.3 起）- beta 8


### v0.7.4

### v0.7.4

* [#20322](https://github.com/flutter/flutter/pull/20322) performs parallax transitions between `CupertinoNavigationBar`s and `CupertinoSliverNavigationBar`s when navigating between pages.

  [#20322](https://github.com/flutter/flutter/pull/20322)在页面之间导航时，在 `CupertinoNavigationBar`s 和 `CupertinoSliverNavigationBar`s 之间执行视差过渡。


## Changes in v0.7.3 (since v0.6.0) - beta 7

## v0.7.3 中的更改（自 v0.6.0 起）- beta 7


### v0.7.3

### v0.7.3

* [#20966](https://github.com/flutter/flutter/pull/20966) adds `CupertinoTimerPicker`.

  [#20966](https://github.com/flutter/flutter/pull/20966)添加 `CupertinoTimerPicker`。


### v0.7.2

### v0.7.2

* [#20929](https://github.com/flutter/flutter/pull/20929) fixes bug where `CupertinoPageScaffold` wasn't insetting its content when the keyboard is shown.

  [#20929](https://github.com/flutter/flutter/pull/20929)修复了显示键盘时 `CupertinoPageScaffold` 未插入其内容的错误。


### v0.7.1

### v0.7.1

* [#19637](https://github.com/flutter/flutter/pull/19637) `CupertinoNavigationBar` and `CupertinoSliverNavigationBar` now auto-populate their title and back button labels based on their `CupertinoPageRoute.title`.

  [#19637](https://github.com/flutter/flutter/pull/19637)`CupertinoNavigationBar` 和 `CupertinoSliverNavigationBar` 现在会根据 `CupertinoPageRoute.title` 自动填充其标题和后退按钮标签。


## Changes in v0.6.0 (since v0.5.1) - beta 6

## v0.6.0 中的更改（自 v0.5.1 起）- beta 6


### v0.6.0

### v0.6.0

* Dart SDK updated to a Dart 2 build (2.1.0-dev.0.0). Package and plugin authors should ensure their `pubspec.yaml` files include a Dart SDK constraint with an upper bound of `<3.0.0`. See the [Getting ready for Dart 2 post](https://blog.dart.dev/getting-ready-for-dart-2-and-making-your-packages-look-great-on-the-pub-site-118464d7f59d) for details.

  Dart SDK 更新至 Dart 2 版本 (2.1.0-dev.0.0)。包和插件作者应确保其 `pubspec.yaml` 文件包含 Dart SDK 约束，上限为 `<3.0.0`。请参阅[Getting ready for Dart 2 post](https://blog.dart.dev/getting-ready-for-dart-2-and-making-your-packages-look-great-on-the-pub-site-118464d7f59d)了解详情。

* [#19025](https://github.com/flutter/flutter/pull/19025) renamed `CupertinoRefreshControl` to `CupertinoSliverRefreshControl` for consistency.

  [#19025](https://github.com/flutter/flutter/pull/19025)为了保持一致性，将 `CupertinoRefreshControl` 重命名为 `CupertinoSliverRefreshControl`。

* [#19317](https://github.com/flutter/flutter/pull/19317) Add cursorWidth and cursorRadius to TextField (Material) cursor.

  [#19317](https://github.com/flutter/flutter/pull/19317)将 cursorWidth 和 cursorRadius 添加到 TextField（材质）光标。

* [#20116](https://github.com/flutter/flutter/pull/20116) reduced release binary sizes by ~2MB

  [#20116](https://github.com/flutter/flutter/pull/20116)将发布二进制文件大小减少约 2MB

* [#20267](https://github.com/flutter/flutter/pull/20267) adds `CupertinoSegmentedControl'.

  [#20267](https://github.com/flutter/flutter/pull/20267)添加“CupertinoSegmentedControl”。

* [#19232](https://github.com/flutter/flutter/pull/19232) adds `CupertinoActionSheet` for iOS-style bottom pop-up sheets.

  [#19232](https://github.com/flutter/flutter/pull/19232)为 iOS 样式底部弹出表单添加 `CupertinoActionSheet`。

* [#20101](https://github.com/flutter/flutter/pull/20101) improves `CupertinoScrollbar` visual fidelity during overscrolls.

  [#20101](https://github.com/flutter/flutter/pull/20101)提高了过度滚动期间的 `CupertinoScrollbar` 视觉保真度。

* [#19789](https://github.com/flutter/flutter/pull/19789) adds support for infinite scrolling and looped scrolling for `CupertinoPicker`.

  [#19789](https://github.com/flutter/flutter/pull/19789)添加了对 `CupertinoPicker` 无限滚动和循环滚动的支持。

* [#18381](https://github.com/flutter/flutter/pull/18381) improves visual fidelity of `CupertinoAlertDialog`.

  [#18381](https://github.com/flutter/flutter/pull/18381)提高了 `CupertinoAlertDialog` 的视觉保真度。


### v0.5.8

### v0.5.8

* [#19284](https://github.com/flutter/flutter/pull/19284) adds multi-column `CupertinoPicker` support for off-axis cylindrical projection.

  [#19284](https://github.com/flutter/flutter/pull/19284)添加了对离轴圆柱投影的多列 `CupertinoPicker` 支持。


### v0.5.7

### v0.5.7

* [#18469](https://github.com/flutter/flutter/pull/18469) added a `CupertinoApp` for creating iOS styled apps.

  [#18469](https://github.com/flutter/flutter/pull/18469)添加了 `CupertinoApp` 用于创建 iOS 风格的应用程序。


### v0.5.6

### v0.5.6

* [#18614](https://github.com/flutter/flutter/pull/18614) added `isInstanceOf` as a function exported from Flutter, because package:matcher has deprecated its implementation of `isInstanceOf`.

  [#18614](https://github.com/flutter/flutter/pull/18614)添加 `isInstanceOf` 作为从 Flutter 导出的函数，因为 package:matcher 已弃用其 `isInstanceOf` 的实现。

* [flutter/engine#5517](https://github.com/flutter/engine/pull/5517) enabled the `--sync-async` Dart flag.

  [flutter/engine#5517](https://github.com/flutter/engine/pull/5517)启用 `--sync-async` Dart 标志。


### v0.5.5

### v0.5.5


* [#18488](https://github.com/flutter/flutter/pull/18488) made the `--debug-port` argument to `flutter trace` required, because the previous behaviour was unreliable and caused flaky tests.

  [#18488](https://github.com/flutter/flutter/pull/18488)使 `flutter trace` 的 `--debug-port` 参数成为必需的，因为以前的行为不可靠并导致不稳定的测试。


### v0.5.2

### v0.5.2


* [#18096](https://github.com/flutter/flutter/pull/18096) changed the rendering of the character counter in text fields to more closely match the Material design specifications.

  [#18096](https://github.com/flutter/flutter/pull/18096)更改了文本字段中字符计数器的呈现，以更紧密地匹配 Material 设计规范。


## Changes in v0.5.1 (since v0.3.2) - beta 5

## v0.5.1 中的更改（自 v0.3.2 起）- beta 5


### v0.5.0

### v0.5.0


* [#17661](https://github.com/flutter/flutter/pull/17661) changed the layout and size of `ListTile` to better conform to the latest Material design specs.

  [#17661](https://github.com/flutter/flutter/pull/17661)更改了 `ListTile` 的布局和大小，以更好地符合最新的 Material 设计规范。


* [#17620](https://github.com/flutter/flutter/pull/17620) slightly reduces the default dimensions of `Checkbox`, `Radio`, and `Switch` to better conform to the latest Material design specs.

  [#17620](https://github.com/flutter/flutter/pull/17620)稍微减小 `Checkbox`、`Radio` 和 `Switch` 的默认尺寸，以更好地符合最新的 Material 设计规范。


* [#17637](https://github.com/flutter/flutter/pull/17637) updates `Checkbox`, `Radio`, and `Switch` to use the `ThemeData` `toggleableActiveColor`. If you are using a light theme and are not specifying an `accentColor` in your `ThemeData`, these controls will now use a higher contrast shade from the primary swatch.

  [#17637](https://github.com/flutter/flutter/pull/17637)更新 `Checkbox`、`Radio` 和 `Switch` 以使用 `ThemeData` `toggleableActiveColor`。如果你使用浅色主题并且未在 `ThemeData` 中指定 `accentColor`，则这些控件现在将使用主样本中的更高对比度阴影。


* [#17586](https://github.com/flutter/flutter/pull/17586) added a new `background` property to `TextStyle`. Subclasses must ensure that this property is handled in constructors and `copyWith`.

  [#17586](https://github.com/flutter/flutter/pull/17586)向 `TextStyle` 添加了新的 `background` 属性。子类必须确保在构造函数和 `copyWith` 中处理此属性。


## Changes in v0.4.4 (since v0.3.2) - beta 4

## v0.4.4 中的更改（自 v0.3.2 起）- beta 4


### v0.4.0

### v0.4.0

* [#17021](https://github.com/flutter/flutter/pull/17021) added implicit a11y scrolling for iOS. For this, viewports define a cache extend before the leading as well as after the trailing edge and slivers are expected to provide semantics information if they fall into the cache extent.

  [#17021](https://github.com/flutter/flutter/pull/17021)为 iOS 添加了隐式 a11y 滚动。为此，视口在前缘之前和后缘之后定义缓存扩展，并且如果条落入缓存范围，则期望条片提供语义信息。


  ### Breaking change
  With this change, children of a viewport that are currently not visible in the viewport are now considered off-stage. To find them in a test, specify `skipOffstage: false` on the Finder.

### 重大更改 通过此更改，当前在视口中不可见的视口子项现在被视为在舞台外。要在测试中找到它们，请在 Finder 上指定 `skipOffstage: false`。


### v0.3.6

### v0.3.6


* [#17094](https://github.com/flutter/flutter/pull/17094) introduced the ability to do golden image testing in widget tests.  Within a widget test, you can now use the following matcher to ensure that your widget's rasterized image matches a golden file (e.g. `foo.png`):

  [#17094](https://github.com/flutter/flutter/pull/17094)引入了在 widget 测试中进行黄金图像测试的功能。  在 widget 测试中，你现在可以使用以下匹配器来确保 widget 的光栅化图像与黄金文件匹配（例如 `foo.png`）：


  ```dart
  await expectLater(find.byType(MyWidget), matchesGoldenFile('foo.png'));
  ```

  ### Breaking change

### 重大改变


  One of the consequences of this change is that all tests run through `flutter test` now explicitly depend on `package:flutter_test`.  Users of `flutter test` will need to update their `pubspec.yaml` file to include the following if it does not already exist:

此更改的后果之一是，通过 `flutter test` 运行的所有测试现在都明确依赖于 `package:flutter_test`。  `flutter test` 的用户需要更新其 `pubspec.yaml` 文件以包含以下内容（如果尚不存在）：


  ```yaml
  dev_dependencies:
    flutter_test:
      sdk: flutter
  ```

  If your `pubspec.yaml` does not contain the requisite dependency, and you run `flutter test`, you will see errors of the following form:

如果你的 `pubspec.yaml` 不包含必要的依赖项，并且你运行 `flutter test`，你将看到以下形式的错误：


  ```console
  compiler message: Error: Could not resolve the package 'flutter_test' in 'package:flutter_test/flutter_test.dart'.
  ```

### v0.3.3

### v0.3.3


* [flutter/engine#5060](https://github.com/flutter/engine/pull/5060) introduced the ability to encode a `dart:ui Image` into a PNG via `Image.toByteData()`.  Callers wishing to get encoded bytes may pass the `format` argument, like so:

  [flutter/engine#5060](https://github.com/flutter/engine/pull/5060)引入了通过 `Image.toByteData()` 将 `dart:ui Image` 编码为 PNG 的功能。  希望获得编码字节的调用者可以传递 `format` 参数，如下所示：


  ```dart
  image.toByteData(format: ui.ImageByteFormat.png);
  ```

## Changes in v0.3.2 (since v0.3.1) - beta 3

## v0.3.2 中的更改（自 v0.3.1 起）- beta 3


## Changes in v0.3.1 (since v0.2.8) - beta 2 update

## v0.3.1 中的更改（自 v0.2.8 起） - beta 2 更新


We are aware of a potential problem with certificate validation in the `HttpClient` implementation.
To follow our investigation, see [Dart issue 32936](https://github.com/dart-lang/sdk/issues/32936).

我们意识到 `HttpClient` 实现中的证书验证存在潜在问题。要关注我们的调查，请参阅[Dart issue 32936](https://github.com/dart-lang/sdk/issues/32936).


### v0.3.1

### v0.3.1


* [flutter/engine#4932](https://github.com/flutter/engine/pull/4932) introduced a new shell embedding API with numerous new features.  In particular, a single process can now host multiple Flutter shells.

  [flutter/engine#4932](https://github.com/flutter/engine/pull/4932)引入了具有许多新功能的新 shell 嵌入 API。  特别是，单个进程现在可以托管多个 Flutter shell。


* [flutter/engine#4762](https://github.com/flutter/engine/pull/4762) and [flutter/engine#5008](https://github.com/flutter/engine/pull/5008) introduced `Image.toByteData()`, which is used to get the raw RGBA bytes of an `Image` instance in `dart:ui`.

  [flutter/engine#4762](https://github.com/flutter/engine/pull/4762)和[flutter/engine#5008](https://github.com/flutter/engine/pull/5008)引入了 `Image.toByteData()`，它用于获取 `dart:ui` 中 `Image` 实例的原始 RGBA 字节。


* [#16721](https://github.com/flutter/flutter/pull/16721) scroll motion starts on iOS has been fine tuned to avoid a jump when the scroll first starts moving and to more closely mirror native behavior.

  [#16721](https://github.com/flutter/flutter/pull/16721)滚动运动从 iOS 开始进行了微调，以避免滚动首次开始移动时发生跳跃，并更接近地反映本机行为。


### v0.2.11

### v0.2.11


* [#16039](https://github.com/flutter/flutter/pull/16039) and [#16447](https://github.com/flutter/flutter/pull/16447) substantially revised the `Chip` implementation, added new chip types: `InputChip`, `ChoiceChip`, `FilterChip`, `ActionChip`, and updated the appearance of chips.

  [#16039](https://github.com/flutter/flutter/pull/16039)和[#16447](https://github.com/flutter/flutter/pull/16447)大幅修改了 `Chip` 实现，添加了新的芯片类型：`InputChip`、`ChoiceChip`、`FilterChip`、`ActionChip`，并更新了芯片的外观。


### v0.2.9

### v0.2.9


* [#16187](https://github.com/flutter/flutter/pull/16187) updated the `Card` widget's shape and elevation.

  [#16187](https://github.com/flutter/flutter/pull/16187)更新了 `Card` widget 的形状和高度。


### Dart changes since Flutter v0.2.8

### Dart 自 Flutter v0.2.8 起发生变化


* `dart:async`: Removed the deprecated `defaultValue` parameter on `Stream.firstWhere` and `Stream.lastWhere`.

  `dart:async`：删除了 `Stream.firstWhere` 和 `Stream.lastWhere` 上已弃用的 `defaultValue` 参数。

* `dart:core`: Added `tryParse` static method to `int`, `double`, `num`, `BigInt`, `Uri` and `DateTime`, and deprecated `onError` parameter on `int.parse`, `double.parse`, and `num.parse`.

  `dart:core`：向 `int`、`double`、`num`、`BigInt`、`Uri` 和 `DateTime` 添加了 `tryParse` 静态方法，并已弃用`int.parse`、`double.parse` 和 `num.parse` 上的 `onError` 参数。

* The `new` keyword can now always be omitted. The `const` keyword is required to create a constant expression, although within the expression, further `const` keywords can also be omitted.

  现在可以始终省略 `new` 关键字。创建常量表达式需要 `const` 关键字，但在表达式中，还可以省略更多 `const` 关键字。


## Changes in v0.2.8 (since v0.2.3) - beta 2

## v0.2.8 中的更改（自 v0.2.3 起）- beta 2


### v0.2.8

### v0.2.8


* [#16040](https://github.com/flutter/flutter/pull/16040) adds an API to let `CupertinoTabScaffold`'s current tab be programmatically changed via its `CupertinoTabBar`'s `currentIndex`.

  [#16040](https://github.com/flutter/flutter/pull/16040)添加了一个 API，允许通过 `CupertinoTabBar` 的 `currentIndex` 以编程方式更改 `CupertinoTabScaffold` 的当前选项卡。


### v0.2.5

### v0.2.5


* [#15416](https://github.com/flutter/flutter/pull/15416) removed `package:http` from Flutter and replaced all usages with the `HttpClient` from `dart:io`. If you use `package:http` you must add it as a dependency in your `pubspec.yaml` to continue using it.

  [#15416](https://github.com/flutter/flutter/pull/15416)从 Flutter 中删除了 `package:http` ，并将所有用法替换为 `dart:io` 中的 `HttpClient` 。如果你使用 `package:http` ，则必须将其添加为 `pubspec.yaml` 中的依赖项才能继续使用它。


  `createHttpClient()` was also removed after being marked deprecated. To change how the framework creates http clients, you can use [HttpOverrides](https://api.flutter.dev/flutter/dart-io/HttpOverrides-class.html) from `dart:io` to provide your own `createHttpClient()` callback globally or per zone.

`createHttpClient()` 在被标记为已弃用后也被删除。要更改框架创建 http 客户端的方式，你可以使用[HttpOverrides](https://api.flutter.dev/flutter/dart-io/HttpOverrides-class.html)从 `dart:io` 提供你自己的全局或每个区域的 `createHttpClient()` 回调。


  More details are available [in the announcement](https://groups.google.com/forum/#!topic/flutter-dev/AnqDqgQ6vus).

有更多详细信息[in the announcement](https://groups.google.com/forum/#!topic/flutter-dev/AnqDqgQ6vus).


* [#15871](https://github.com/flutter/flutter/pull/15871) changed the default configuration of the `AndroidManifest.xml` created by `flutter create`.  "screenLayout" and "density" are now included by default in the configChanges attribute, preventing flutter apps from restarting when these change.

  [#15871](https://github.com/flutter/flutter/pull/15871)更改了 `flutter create` 创建的 `AndroidManifest.xml` 的默认配置。  “screenLayout”和“密度”现在默认包含在 configChanges 属性中，防止 flutter 应用程序在这些更改时重新启动。


* [#15324](https://github.com/flutter/flutter/pull/15324) adds a new CupertinoRefreshControl widget styled after the iOS pull-to-refresh pattern. Demo available in the Flutter Gallery.

  [#15324](https://github.com/flutter/flutter/pull/15324)添加了一个新的 CupertinoRefreshControl widget，其样式遵循 iOS 下拉刷新模式。演示可在 Flutter 库中找到。


### v0.2.4

### v0.2.4


* [#15565](https://github.com/flutter/flutter/pull/15565) turned Dart 2 mode on by default.  To run in Dart 1 mode, you can still use `--no-preview-dart-2`.

  [#15565](https://github.com/flutter/flutter/pull/15565)默认情况下打开 Dart 2 模式。  要在 Dart 1 模式下运行，你仍然可以使用 `--no-preview-dart-2`。


  More details are available [in the announcement](https://groups.google.com/d/msg/flutter-dev/H8dDhWg_c8I/_Ql78q_6AgAJ).

有更多详细信息[in the announcement](https://groups.google.com/d/msg/flutter-dev/H8dDhWg_c8I/_Ql78q_6AgAJ).


* [#15537](https://github.com/flutter/flutter/pull/15537) removed SemanticsSortOrder. From now on traversal sorting is done among sibling nodes only.

  [#15537](https://github.com/flutter/flutter/pull/15537)删除了 SemanticsSortOrder。从现在开始，遍历排序仅在兄弟节点之间进行。


  More details available [in the announcement](https://groups.google.com/forum/#!topic/flutter-dev/iCoLnW31heE).

提供更多详细信息[in the announcement](https://groups.google.com/forum/#!topic/flutter-dev/iCoLnW31heE).


* [#15484](https://github.com/flutter/flutter/pull/15484) changed the meaning of the `TextFormField` `initialValue` constructor parameter.

  [#15484](https://github.com/flutter/flutter/pull/15484)更改了 `TextFormField` `initialValue` 构造函数参数的含义。


  The TextFormField initialValue parameter no longer unconditionally initializes the text property of its TextEditingController. If you create a TextFormField and provide a controller, the initialValue must be null, which is now the default. If you're providing a controller you can specify it's initial text value with the TextEditingController text property.

TextFormFieldinitialValue 参数不再无条件初始化其 TextEditingController 的文本属性。如果你创建 TextFormField 并提供控制器，则初始值必须为 null，这是现在的默认值。如果你提供控制器，则可以使用 TextEditingController 文本属性指定其初始文本值。


  > #### Before
  >     new TextFormField(
  >       initialValue: 'Hello World',
  >       controller: _myTextEditingController,
  >     );
  >
  > #### After
  >     new TextFormField(
  >       controller: _myTextEditingController ..text = 'Hello World',
  >     )
  >     // Or more typically:
  >     _myTextEditingController = new TextEditingController(
  >       text: 'Hello World',
  >     );
  >     new TextFormField(
  >       controller: _myTextEditingController,
  >     );

> #### 之前 > new TextFormField( > initialValue: 'Hello World', > 控制器: _myTextEditingController, > ); > > #### > new TextFormField( > controller: _myTextEditingController ..text = 'Hello World', > ) > // 或者更典型的是： > _myTextEditingController = new TextEditingController( > text: 'Hello World', > ); > 新 TextFormField( > 控制器: _myTextEditingController, > );


* [#15303](https://github.com/flutter/flutter/pull/15303) updated the `showDialog` function to take a builder and deprecated the `widget` parameter.

  [#15303](https://github.com/flutter/flutter/pull/15303)更新了 `showDialog` 函数以采用构建器并弃用了 `widget` 参数。


  > #### Before
  >     showDialog(context: context, child: new Text('hello'))
  >
  > #### After
  >     showDialog(context: context, builder: (BuildContext context) => new Text('hello'))

> #### 之前 > showDialog(context: context, child: new Text('hello')) > > #### 之后 > showDialog(context: context, builder: (BuildContext context) => new Text('hello'))


* [#15265](https://github.com/flutter/flutter/pull/15265) updated `ThemeData` to use the primary color of a `MaterialColor` instead of unconditionally using the 500 shade for light themes.  The color values remain unchanged.

  [#15265](https://github.com/flutter/flutter/pull/15265)更新了 `ThemeData` 以使用 `MaterialColor` 的原色，而不是无条件地使用 500 色度的浅色主题。  颜色值保持不变。


  > #### Before
  >     expect(widget.color, Colors.blue.shade500) // primary color
  >
  > #### After
  >     expect(widget.color, Colors.blue) // primary color

> #### 之前 > Expect(widget.color, Colors.blue.shade500) // 原色 > > #### 之后 > Expect(widget.color, Colors.blue) // 原色


* [#15548](https://github.com/flutter/flutter/pull/15548) adds debugging flags `debugDisableClipLayers`, `debugDisablePhysicalShapeLayers` and `debugDisableOpacityLayers` to help with performance diagnosis of rasterizing speed.

  [#15548](https://github.com/flutter/flutter/pull/15548)添加了调试标志 `debugDisableClipLayers`、`debugDisablePhysicalShapeLayers` 和 `debugDisableOpacityLayers` 以帮助进行光栅化速度的性能诊断。


## Changes in v0.2.3 (since v0.1.5) - beta 1 update

## v0.2.3 中的更改（自 v0.1.5 起）- beta 1 更新


### v0.2.0

### v0.2.0


* [flutter/engine#4742](https://github.com/flutter/engine/pull/4742) updated assets to be read directly out of the APK on Android. As a result, leading slashes are no longer supported in image asset paths:

  [flutter/engine#4742](https://github.com/flutter/engine/pull/4742)更新后的资产可直接从 Android 上的 APK 中读取。因此，图像资源路径中不再支持前导斜杠：


  > #### Before
  >     new Image.asset('/foo/bar.png')
  >
  > #### After:
  >     new Image.asset('foo/bar.png')

> #### 之前 > new Image.asset('/foo/bar.png') > > #### 之后： > new Image.asset('foo/bar.png')


### v0.1.9

### v0.1.9


* [#14901](https://github.com/flutter/flutter/pull/14901) A [Slider](https://api.flutter.dev/flutter/material/Slider-class.html) visual update changed the colors, opacities, and the value indicator shape and behavior. It also removed the "`thumbOpenAtMin`" flag from the Slider class, which is no longer needed, and can be emulated by the custom thumb shape support.

  [#14901](https://github.com/flutter/flutter/pull/14901)A[Slider](https://api.flutter.dev/flutter/material/Slider-class.html)视觉更新改变了颜色、不透明度以及值指示器的形状和行为。它还从 Slider 类中删除了不再需要的“`thumbOpenAtMin`”标志，并且可以通过自定义拇指形状支持来模拟。


## Changes in v0.1.5 (since v0.1.4) - beta 1.1

## v0.1.5 中的更改（自 v0.1.4 起）- beta 1.1


### v0.1.5

### v0.1.5


* [#14714](https://github.com/flutter/flutter/pull/14714) fixed the groovy script for the Flutter Gallery, thus fixing [#14912](https://github.com/flutter/flutter/issues/14912).

  [#14714](https://github.com/flutter/flutter/pull/14714)修复了 Flutter 画廊的常规脚本，从而修复[#14912](https://github.com/flutter/flutter/issues/14912).


## Changes in v0.1.4 (since v0.0.20) - beta 1

## v0.1.4 中的更改（自 v0.0.20 起）- beta 1


### v0.1.3

### v0.1.3


* [#14702](https://github.com/flutter/flutter/pull/14702) removed the `engineDartVersion` getter from the flutter tool's `Version` class.

  [#14702](https://github.com/flutter/flutter/pull/14702)从 flutter 工具的 `Version` 类中删除了 `engineDartVersion` getter。


### v0.1.1

### v0.1.1


* [flutter/engine#4607](https://github.com/flutter/engine/pull/4607) and [#14601](https://github.com/flutter/flutter/pull/14601) removed default constructors from the following `dart:ui` classes:

  [flutter/engine#4607](https://github.com/flutter/engine/pull/4607)和[#14601](https://github.com/flutter/flutter/pull/14601)从以下 `dart:ui` 类中删除了默认构造函数：


  * `Codec`

    `Codec`

  * `FrameInfo`

    `FrameInfo`

  * `Gradient`

    `Gradient`

  * `Image`

    `Image`

  * `Paragraph`

    `Paragraph`

  * `Picture`

    `Picture`

  * `Scene`

    __PH_9f7aa6​​4b__

  * `SemanticsUpdate`

    `SemanticsUpdate`

  * `Shader`

    `Shader`


  The default constructors were removed to prevent the creation of uninitialized instances of these classes (and in certain cases to prevent extending these classes). These classes should be instantiated only by the Flutter engine or through named constructors (if provided).

删除默认构造函数是为了防止创建这些类的未初始化实例（并且在某些情况下是为了防止扩展这些类）。这些类只能由 Flutter 引擎或通过命名构造函数（如果提供）实例化。


### v0.0.24

### v0.0.24


* [#14410](https://github.com/flutter/flutter/pull/14410) contained a breaking API change to `ButtonTheme`:

  [#14410](https://github.com/flutter/flutter/pull/14410)包含对 `ButtonTheme` 的重大 API 更改：


  * The constructors `ButtonTheme()` and `ButtonTheme.bar()` are no longer `const` constructible

    构造函数 `ButtonTheme()` 和 `ButtonTheme.bar()` 不再是 `const` 可构造的

  * `ButtonTheme.textTheme` is now `ButtonTheme.data.textTheme`

    `ButtonTheme.textTheme` 现在是 `ButtonTheme.data.textTheme`

  * `ButtonTheme.minWidth` is now `ButtonTheme.data.minWidth`

    `ButtonTheme.minWidth` 现在是 `ButtonTheme.data.minWidth`

  * `ButtonTheme.height` is now `ButtonTheme.data.height`

    `ButtonTheme.height` 现在是 `ButtonTheme.data.height`

  * `ButtonTheme.padding` is now `ButtonTheme.data.padding`

    `ButtonTheme.padding` 现在是 `ButtonTheme.data.padding`


* [#14410](https://github.com/flutter/flutter/pull/14410) changed the hierarchy of `FlatButton` and `RaisedButton` - they both inherit from `RawMaterialButton` now rather than from `MaterialButton`.

  [#14410](https://github.com/flutter/flutter/pull/14410)更改了 `FlatButton` 和 `RaisedButton` 的层次结构 - 它们现在都从 `RawMaterialButton` 继承，而不是从 `MaterialButton` 继承。


* [#14410](https://github.com/flutter/flutter/pull/14410) changed `RaisedButton` to no longer cast a shadow when disabled.

  [#14410](https://github.com/flutter/flutter/pull/14410)更改了 `RaisedButton` 以在禁用时不再投射阴影。


### v0.0.23

### v0.0.23


* [#14343](https://github.com/flutter/flutter/pull/14343) revised how copy, cut, and paste works for EditableText: The abstract class TextSelectionControls has new methods canCopy, canCut, etc. to determine if those actions are available. The TextSelectionDelegate interface now requires an additional method bringIntoView(TextPosition position) to scroll a TextPosition into the visible part of a TextField. Furthermore, that interface is no longer implemented by TextSelectionOverlay. In its place EditableTextState should be used, which implements that interface. See also: [flutter-dev/IHPndyUDy0M](https://groups.google.com/forum/#!topic/flutter-dev/IHPndyUDy0M)

  [#14343](https://github.com/flutter/flutter/pull/14343)修改了 EditableText 的复制、剪切和粘贴工作方式：抽象类 TextSelectionControls 具有新方法 canCopy、canCut 等来确定这些操作是否可用。 TextSelectionDelegate 接口现在需要一个额外的方法 BringIntoView(TextPositionposition) 将 TextPosition 滚动到 TextField 的可见部分。此外，TextSelectionOverlay 不再实现该接口。应该使用 EditableTextState 来代替它，它实现了该接口。参见：[flutter-dev/IHPndyUDy0M](https://groups.google.com/forum/#!topic/flutter-dev/IHPndyUDy0M)


#### Sliver APIs

#### 银条API


* [#14449](https://github.com/flutter/flutter/pull/14449) replaces the `SliverGridLayout.estimateMaxScrollOffset` method by the `SliverGridLayout.computeMaxScrollOffset` method. This new method must report an accurate value, not just an estimate. This was necessary to fix a bug where a finite `SliverGrid` could not handle being scrolled off the top of the screen (because we had no way to determine how much content it had).

  [#14449](https://github.com/flutter/flutter/pull/14449)将 `SliverGridLayout.estimateMaxScrollOffset` 方法替换为 `SliverGridLayout.computeMaxScrollOffset` 方法。这种新方法必须报告准确的值，而不仅仅是估计值。这是修复有限 `SliverGrid` 无法处理从屏幕顶部滚动的错误所必需的（因为我们无法确定它有多少内容）。


  For similar reasons, the `RenderSliverBoxChildManager` interface has a new getter, `childCount`, which must return a non-null value if `createChild` can return null. In practice, it is unusual to implement this interface, so this should have no effect. It is more common to implement the widgets-layer equivalent, `SliverChildDelegate`. This interface already had an `estimatedChildCount` getter. The getter continues to exist, though its semantics have been adjusted a little to require that the returned value be accurate if the `build` method on the delegate ever returns null.

出于类似的原因，`RenderSliverBoxChildManager` 接口有一个新的 getter `childCount`，如果 `createChild` 可以返回 null，则它必须返回非 null 值。在实践中，实现此接口的情况并不常见，因此这应该没有效果。更常见的是实现 widgets 层等效项 `SliverChildDelegate`。该接口已经有一个 `estimatedChildCount` getter。 getter 仍然存在，尽管它的语义已进行了一些调整，要求如果委托上的 `build` 方法返回 null，则返回值必须准确。


### v0.0.21

### v0.0.21


* [#13734](https://github.com/flutter/flutter/pull/13734), [#14055](https://github.com/flutter/flutter/pull/14055), and [#14177](https://github.com/flutter/flutter/pull/14177) substantially revised the InputDecorator et al. widgets. The layout of the input decorator's parts has changed a little, which means that the internal layout of text fields has changed as well. Tests that depend on the internal geometry of text fields will need to be updated.

  [#13734](https://github.com/flutter/flutter/pull/13734),[#14055](https://github.com/flutter/flutter/pull/14055)， 和[#14177](https://github.com/flutter/flutter/pull/14177)大幅修改了 InputDecorator 等。 widgets。输入装饰器部分的布局发生了一些变化，这意味着文本字段的内部布局也发生了变化。依赖于文本字段内部几何形状的测试需要更新。


  In addition, `hideDivider: true` must be replaced by the new `border: InputBorder.none`. This is part of our making it easier to customize how inputs are rendered; you can now also provide a custom InputBorder subclass if you have particularly novel desires for your input decoration.

此外，`hideDivider: true` 必须替换为新的 `border: InputBorder.none`。这是我们让自定义输入呈现方式变得更容易的一部分；如果你对输入装饰有特别新颖的需求，你现在还可以提供自定义的 InputBorder 子类。


* [#4528](https://github.com/flutter/engine/pull/4528) and [#14011](https://github.com/flutter/flutter/pull/14011) deprecated support for big integers in the standard platform channel message/method codecs, to be made unavailable following a four week grace period. This change is a consequence of the transition to Dart

  [#4528](https://github.com/flutter/engine/pull/4528)和[#14011](https://github.com/flutter/flutter/pull/14011)已弃用标准平台通道消息/方法编解码器中对大整数的支持，在四个星期的宽限期后将不可用。此更改是过渡到 Dart 的结果

2.0 where the `int` type is no longer unlimited size.

2.0 其中 `int` 类型不再是无限大小。


* [#4487](https://github.com/flutter/engine/pull/4487) replaces all uses of the `RequestPermissionResult` callback concept in `io.flutter.plugin.common.PluginRegistry` with `RequestPermissionsResult`, adding a missing `s` to align with the corresponding Android SDK concept.

  [#4487](https://github.com/flutter/engine/pull/4487)将 `io.flutter.plugin.common.PluginRegistry` 中 `RequestPermissionResult` 回调概念的所有使用替换为 `RequestPermissionsResult`，添加缺失的 `s` 以与相应的 Android SDK 概念保持一致。


  The old API has been deprecated and will be made unavailable in a later release. There will be a grace period of at least four weeks between the release that introduces the deprecation and the release that makes the old API unavailable.

旧的 API 已被弃用，并将在以后的版本中不可用。在引入弃用的版本和使旧 API 不可用的版本之间将有至少四个星期的宽限期。

