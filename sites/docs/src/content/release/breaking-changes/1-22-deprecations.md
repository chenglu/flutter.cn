---
# title: Deprecated API removed after v1.22
title: v1.22 后已删除已弃用的 API
# description: >
#   After reaching end of life,
#   the following deprecated APIs were removed from Flutter.
description: >-
  达到生命周期结束后，以下已弃用的 API 已从 Flutter 中删除。
ai-translated: true
---

## Summary

## 摘要


In accordance with Flutter's [Deprecation Policy][],
deprecated APIs that reached end of life after the
1.22 stable release have been removed.
This is the first time that deprecated APIs
have been removed from Flutter,
and some of these deprecations predate our
migration guide policy.

符合 Flutter 的[Deprecation Policy][]，在 1.22 稳定版发布后已达到生命周期的已弃用 API 已被删除。这是首次从 Flutter 中删除已弃用的 API，其中一些弃用早于我们的迁移指南政策。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。


A [design document][] and [article][] are available
for more context on Flutter's deprecation policy.

A [design document][]和[article][]有关 Flutter 弃用政策的更多背景信息。


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-1-22
[design document]: /go/deprecation-lifetime
[article]: {{site.flutter-blog}}/deprecation-lifetime-in-flutter-e4d76ee738ad

## Changes

## Changes


This section lists the deprecations, listed by the affected class.

本节列出了弃用的内容，按受影响的类列出。


### `CupertinoDialog`

### `CupertinoDialog`


Supported by fix tool: IDE fix only.

修复工具支持：仅 IDE 修复。


`CupertinoDialog` was deprecated in v0.2.3.
Use `CupertinoAlertDialog` or `CupertinoPopupSurface` instead.

`CupertinoDialog` 在 v0.2.3 中已弃用。请改用 `CupertinoAlertDialog` 或 `CupertinoPopupSurface` 。


**Migration guide**

**迁移指南**


*CupertinoAlertDialog*

Code before migration:

迁移前的代码：


```dart
CupertinoDialog(child: myWidget);
```

Code after migration:

迁移后的代码：


```dart
CupertinoAlertDialog(content: myWidget);
```

*CupertinoPopupSurface*

Code before migration:

迁移前的代码：


```dart
CupertinoDialog(child: myWidget);
```

Code after migration:

迁移后的代码：


```dart
CupertinoPopupSurface(child: myWidget);
```

**References**

**参考**


API documentation:

API 文档：


* [`CupertinoAlertDialog`][]
* [`CupertinoPopupSurface`][]

Relevant issues:

相关 issue：


* [Deprecate CupertinoDialog class][]

  [弃用 CupertinoDialog 类][Deprecate CupertinoDialog class]


Relevant PRs:

相关 PR：


* Deprecated in [#20649][]

  已弃用于[#20649][]

* Removed in [#73604][]

  删除于[#73604][]


[`CupertinoAlertDialog`]: {{site.api}}/flutter/cupertino/CupertinoAlertDialog-class.html
[`CupertinoPopupSurface`]: {{site.api}}/flutter/cupertino/CupertinoPopupSurface-class.html
[Deprecate CupertinoDialog class]: {{site.repo.flutter}}/issues/20397
[#20649]: {{site.repo.flutter}}/pull/20649
[#73604]: {{site.repo.flutter}}/pull/73604

---

### Cupertino navigation bars' `actionsForegroundColor`

### Cupertino 导航栏' `actionsForegroundColor`


Supported by fix tool: No

修复工具支持： 否


`CupertinoNavigationBar.actionsForegroundColor`
and `CupertinoSliverNavigationBar.actionsForegroundColor`
were deprecated in v1.1.2.
Setting `primaryColor` in your `CupertinoTheme` propagates this instead.
To access the `primaryColor`,
call `CupertinoTheme.of(context).primaryColor`.

`CupertinoNavigationBar.actionsForegroundColor` 和 `CupertinoSliverNavigationBar.actionsForegroundColor` 在 v1.1.2 中已弃用。在 `CupertinoTheme` 中设置 `primaryColor` 会传播此内容。要访问 `primaryColor`，请调用 `CupertinoTheme.of(context).primaryColor`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
CupertinoNavigationBar(
  actionsForegroundColor: CupertinoColors.systemBlue,
);
CupertinoSliverNavigationBar(
  actionsForegroundColor: CupertinoColors.systemBlue,
);
```

Code after migration:

迁移后的代码：


```dart
CupertinoTheme(
  data: CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue
  ),
  child: ...
);

// To access the color from the `CupertinoTheme`
CupertinoTheme.of(context).primaryColor;
```

**References**

**参考**


API documentation:

API 文档：


* [`CupertinoNavigationBar`][]
* [`CupertinoSliverNavigationBar`][]
* [`CupertinoTheme`][]
* [`CupertinoThemeData`][]

Relevant issues:

相关 issue：


* [Create a CupertinoApp and a CupertinoTheme][]

  [创建 CupertinoApp 和 CupertinoTheme][Create a CupertinoApp and a CupertinoTheme]


Relevant PRs:

相关 PR：


* Deprecated in [#23759][]

  已弃用于[#23759][]

* Removed in [#73745][]

  删除于[#73745][]


[`CupertinoNavigationBar`]: {{site.api}}/flutter/cupertino/CupertinoNavigationBar-class.html
[`CupertinoSliverNavigationBar`]: {{site.api}}/flutter/cupertino/CupertinoSliverNavigationBar-class.html
[`CupertinoTheme`]: {{site.api}}/flutter/cupertino/CupertinoTheme-class.html
[`CupertinoThemeData`]: {{site.api}}/flutter/cupertino/CupertinoThemeData-class.html
[Create a CupertinoApp and a CupertinoTheme]: {{site.repo.flutter}}/issues/18037
[#23759]: {{site.repo.flutter}}/pull/23759
[#73745]: {{site.repo.flutter}}/pull/73745

---

### `CupertinoTextThemeData.brightness`

### `CupertinoTextThemeData.brightness`


Supported by fix tool: Yes

修复工具支持：是


`CupertinoTextThemeData.brightness` was deprecated in v1.10.14.
This field member was made ineffective at the time of deprecation.
There is no replacement for this
parameter, references should be removed.

`CupertinoTextThemeData.brightness` 在 v1.10.14 中已弃用。该字段成员在弃用时无效。此参数没有替代品，应删除引用。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
const CupertinoTextThemeData themeData = CupertinoTextThemeData(brightness: Brightness.dark);
themeData.copyWith(brightness: Brightness.light);
```

Code after migration:

迁移后的代码：


```dart
const CupertinoTextThemeData themeData = CupertinoTextThemeData();
themeData.copyWith();
```

**References**

**参考**


API documentation:

API 文档：


* [`CupertinoTextThemeData`][]

Relevant issues:

相关 issue：


* [Revise CupertinoColors and CupertinoTheme for dynamic colors][]

  [修改 CupertinoColors 和 CupertinoTheme 以获取动态颜色][Revise CupertinoColors and CupertinoTheme for dynamic colors]


Relevant PRs:

相关 PR：


* Deprecated in [#41859][]

  已弃用于[#41859][]

* Removed in [#72017][]

  删除于[#72017][]


[`CupertinoTextThemeData`]: {{site.api}}/flutter/cupertino/CupertinoTextThemeData-class.html
[Revise CupertinoColors and CupertinoTheme for dynamic colors]: {{site.repo.flutter}}/issues/35541
[#41859]: {{site.repo.flutter}}/pull/41859
[#72017]: {{site.repo.flutter}}/pull/72017

---

### Pointer events constructed `fromHoverEvent`

### 构造指针事件 `fromHoverEvent`


Supported by fix tool: Yes

修复工具支持：是


The `fromHoverEvent` constructors for `PointerEnterEvent`
and `PointerExitEvent` were deprecated in v1.4.3.
The `fromMouseEvent` constructor should be used instead.

`PointerEnterEvent` 和 `PointerExitEvent` 的 `fromHoverEvent` 构造函数在 v1.4.3 中已弃用。应改用 `fromMouseEvent` 构造函数。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
final PointerEnterEvent enterEvent = PointerEnterEvent.fromHoverEvent(PointerHoverEvent());
final PointerExitEvent exitEvent = PointerExitEvent.fromHoverEvent(PointerHoverEvent());
```

Code after migration:

迁移后的代码：


```dart
final PointerEnterEvent enterEvent = PointerEnterEvent.fromMouseEvent(PointerHoverEvent());
final PointerExitEvent exitEvent = PointerExitEvent.fromMouseEvent(PointerHoverEvent());
```

**References**

**参考**


API documentation:

API 文档：


* [`PointerEnterEvent`][]
* [`PointerExitEvent`][]

Relevant issues:

相关 issue：


* [PointerEnterEvent and PointerExitEvent can only

  [PointerEnterEvent 和 PointerExitEvent 只能

  be created from hover events][PointerEnterEvent and PointerExitEvent can only be created from hover events]

由悬停事件创建][]


Relevant PRs:

相关 PR：


* Deprecated in [#28602][]

  已弃用于[#28602][]

* Removed in [#72395][]

  删除于[#72395][]


[`PointerEnterEvent`]: {{site.api}}/flutter/gestures/PointerEnterEvent-class.html
[`PointerExitEvent`]: {{site.api}}/flutter/gestures/PointerExitEvent-class.html
[PointerEnterEvent and PointerExitEvent can only be created from hover events]: {{site.repo.flutter}}/issues/29696
[#28602]: {{site.repo.flutter}}/pull/28602
[#72395]: {{site.repo.flutter}}/pull/72395

---

### `showDialog` uses `builder`

### `showDialog` 使用 `builder`


Supported by fix tool: Yes

修复工具支持：是


The `child` parameter of `showDialog` was deprecated in v0.2.3.
The `builder` parameter should be used instead.

`showDialog` 的 `child` 参数在 v0.2.3 中已弃用。应改用 `builder` 参数。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
showDialog(child: myWidget);
```

Code after migration:

迁移后的代码：

```dart
showDialog(builder: (context) => myWidget);
```

**References**

**参考**


API documentation:

API 文档：


* [`showDialog`][]

Relevant issues:

相关 issue：


* [showDialog should take a builder rather than a child][]

  [showDialog 应该采用构建器而不是子级][showDialog should take a builder rather than a child]


Relevant PRs:

相关 PR：


* Deprecated in [#15303][]

  已弃用于[#15303][]

* Removed in [#72532][]

  删除于[#72532][]


[`showDialog`]: {{site.api}}/flutter/material/showDialog.html
[showDialog should take a builder rather than a child]: {{site.repo.flutter}}/issues/14341
[#15303]: {{site.repo.flutter}}/pull/15303
[#72532]: {{site.repo.flutter}}/pull/72532

---

### `Scaffold.resizeToAvoidBottomPadding`

### `Scaffold.resizeToAvoidBottomPadding`


Supported by fix tool: Yes

修复工具支持：是


The `resizeToAvoidBottomPadding` parameter of `Scaffold` was deprecated in v1.1.9.
The `resizeToAvoidBottomInset` parameter should be used instead.

`Scaffold` 的 `resizeToAvoidBottomPadding` 参数在 v1.1.9 中已弃用。应改用 `resizeToAvoidBottomInset` 参数。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
Scaffold(resizeToAvoidBottomPadding: true);
```

Code after migration:

迁移后的代码：


```dart
Scaffold(resizeToAvoidBottomInset: true);
```

**References**

**参考**


API documentation:

API 文档：


* [`Scaffold`][]

Relevant issues:

相关 issue：


* [Show warning when nesting Scaffolds][]

  [嵌套脚手架时显示警告][Show warning when nesting Scaffolds]

* [SafeArea with keyboard][]

  [带键盘的安全区][SafeArea with keyboard]

* [Double stacked material scaffolds shouldn't double resizeToAvoidBottomPadding][]

  [双层堆叠材质脚手架不应双重 resizeToAvoidBottomPadding][Double stacked material scaffolds shouldn't double resizeToAvoidBottomPadding]

* [viewInsets and padding on Window and MediaQueryData should define how they interact][]

  [Window 和 MediaQueryData 上的 viewInsets 和 padding 应该定义它们的交互方式][viewInsets and padding on Window and MediaQueryData should define how they interact]

* [bottom overflow issue, when using textfields inside tabbarview][]

  [在 tabbarview 中使用文本字段时，底部溢出 issue][bottom overflow issue, when using textfields inside tabbarview]


Relevant PRs:

相关 PR：


* Deprecated in [#26259][]

  已弃用于[#26259][]

* Removed in [#72890][]

  删除于[#72890][]


[`Scaffold`]: {{site.api}}/flutter/material/Scaffold-class.html
[Show warning when nesting Scaffolds]: {{site.repo.flutter}}/issues/23106
[SafeArea with keyboard]: {{site.repo.flutter}}/issues/25758
[Double stacked material scaffolds shouldn't double resizeToAvoidBottomPadding]: {{site.repo.flutter}}/issues/12084
[viewInsets and padding on Window and MediaQueryData should define how they interact]: {{site.repo.flutter}}/issues/15424
[bottom overflow issue, when using textfields inside tabbarview]: {{site.repo.flutter}}/issues/20295
[#26259]: {{site.repo.flutter}}/pull/26259
[#72890]: {{site.repo.flutter}}/pull/72890

---

### `ButtonTheme.bar`

### `ButtonTheme.bar`


Supported by fix tool: No

修复工具支持： 否


The `bar` constructor of `ButtonTheme` was deprecated in v1.9.1.
`ButtonBarTheme` can be used instead for `ButtonBar`s,
or use another constructor of `ButtonTheme`
if the use is not specific to `ButtonBar`.

`ButtonTheme` 的 `bar` 构造函数在 v1.9.1 中已弃用。 `ButtonBarTheme` 可以代替 `ButtonBar`s 使用，或者如果使用不是特定于 `ButtonBar`，则使用 `ButtonTheme` 的另一个构造函数。


Button-specific theming is also available with the `TextButtonTheme`,
`ElevatedButtonTheme`, and `OutlinedButtonTheme` classes,
each corresponding with the appropriate button class,
`TextButton`, `ElevatedButton` and `OutlinedButton`.

`TextButtonTheme`、`ElevatedButtonTheme` 和 `OutlinedButtonTheme` 类还提供特定于按钮的主题，每个类都与相应的按钮类 `TextButton`、`ElevatedButton` 和 `OutlinedButton` 相对应。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
ButtonTheme.bar(
  minWidth: 10.0,
  alignedDropdown: true,
  height: 40.0,
);
```

Code after migration, using `ButtonTheme`:

迁移后的代码，使用 `ButtonTheme`：


```dart
ButtonTheme(
  minWidth: 10.0,
  alignedDropdown: true,
  height: 40.0,
);
```

Code after migration, using `ButtonBarTheme`:

迁移后的代码，使用 `ButtonBarTheme`：


```dart
ButtonBarTheme(
  data: ButtonBarThemeData(
    buttonMinWidth: 10.0,
    buttonAlignedDropdown: true,
    buttonHeight: 40.0,
  )
);
```

**References**

**参考**


API documentation:

API 文档：


* [`ButtonTheme`][]
* [`ButtonBarTheme`][]
* [`ButtonBar`][]
* [`TextButtonTheme`][]
* [`TextButton`][]
* [`ElevatedButtonTheme`][]
* [`ElevatedButton`][]
* [`OutlinedButtonTheme`][]
* [`OutlinedButton`][]

Relevant issues:

相关 issue：


* [ButtonTheme.bar uses accent color when it should be using primary color][]

  [ButtonTheme.bar 在应该使用原色时使用强调色][ButtonTheme.bar uses accent color when it should be using primary color]

* [ThemeData.accentColor has insufficient contrast for text][]

  [ThemeData.accentColor 的文本对比度不足][ThemeData.accentColor has insufficient contrast for text]

* [Increased height as a result of changes to materialTapTargetSize affecting AlertDialog/ButtonBar heights][]

  [由于材质TapTargetSize 的更改影响了 AlertDialog/ButtonBar 的高度而增加了高度][Increased height as a result of changes to materialTapTargetSize affecting AlertDialog/ButtonBar heights]


Relevant PRs:

相关 PR：


* Deprecated in [#37544][]

  已弃用于[#37544][]

* Removed in [#73746][]

  删除于[#73746][]


[`ButtonTheme`]: {{site.api}}/flutter/material/ButtonTheme-class.html
[`ButtonBarTheme`]: {{site.api}}/flutter/material/ButtonBarTheme-class.html
[`ButtonBar`]: {{site.api}}/flutter/material/ButtonBar-class.html
[`TextButtonTheme`]: {{site.api}}/flutter/material/TextButtonTheme-class.html
[`TextButton`]: {{site.api}}/flutter/material/TextButton-class.html
[`ElevatedButtonTheme`]: {{site.api}}/flutter/material/ElevatedButtonTheme-class.html
[`ElevatedButton`]: {{site.api}}/flutter/material/ElevatedButton-class.html
[`OutlinedButtonTheme`]: {{site.api}}/flutter/material/OutlinedButtonTheme-class.html
[`OutlinedButton`]: {{site.api}}/flutter/material/OutlinedButton-class.html
[ButtonTheme.bar uses accent color when it should be using primary color]: {{site.repo.flutter}}/issues/31333
[ThemeData.accentColor has insufficient contrast for text]: {{site.repo.flutter}}/issues/19946
[Increased height as a result of changes to materialTapTargetSize affecting AlertDialog/ButtonBar heights]: {{site.repo.flutter}}/issues/20585
[#37544]: {{site.repo.flutter}}/pull/37544
[#73746]: {{site.repo.flutter}}/pull/73746

---

### `InlineSpan`, `TextSpan`, `PlaceholderSpan`

### `InlineSpan`、`TextSpan`、`PlaceholderSpan`


Supported by fix tool: No

修复工具支持： 否


The following methods were deprecated in the
`InlineSpan`, `TextSpan` and `PlaceholderSpan` in order
to enable embedding widgets inline into paragraphs, like images.

`InlineSpan`、`TextSpan` 和 `PlaceholderSpan` 中已弃用以下方法，以便能够将 widgets 内嵌到段落（如图像）中。


**Migration guide**

**迁移指南**


Code before migration | Code after migration
-- | --
`InlineSpan.text` | `TextSpan.text`
`InlineSpan.children` | `TextSpan.children`
`InlineSpan.visitTextSpan` | `InlineSpan.visitChildren`
`InlineSpan.recognizer` | `TextSpan.recognizer`
`InlineSpan.describeSemantics` | `InlineSpan.computeSemanticsInformation`
`PlaceholderSpan.visitTextSpan` | `PlaceHolderSpan.visitChildren`
`TextSpan.visitTextSpan` |  `TextSpan.visitChildren`

迁移前的代码 |迁移后的代码--| -- `InlineSpan.text` | `TextSpan.text` `InlineSpan.children` | `TextSpan.children` `InlineSpan.visitTextSpan` | `InlineSpan.visitChildren` `InlineSpan.recognizer` | `TextSpan.recognizer` `InlineSpan.describeSemantics` | `InlineSpan.computeSemanticsInformation` `PlaceholderSpan.visitTextSpan` | `PlaceHolderSpan.visitChildren` `TextSpan.visitTextSpan` |  `TextSpan.visitChildren`


**References**

**参考**


API documentation:

API 文档：


* [`InlineSpan`][]
* [`TextSpan`][]
* [`PlaceholderSpan`][]
* [`WidgetSpan`][]

Relevant issues:

相关 issue：


* [Text: support inline images][]

  [文本：支持内嵌图像][Text: support inline images]


Relevant PRs:

相关 PR：


* Development history:

  发展历程：

  * [#30069][]

    [#30069][#30069]

  * [#33946][]

    [#33946][#33946]

  * [#33794][]

    [#33794][#33794]

* Deprecated in [#34051][]

  已弃用于[#34051][]

* Removed in [#73747][]

  删除于[#73747][]


[`InlineSpan`]: {{site.api}}/flutter/painting/InlineSpan-class.html
[`TextSpan`]: {{site.api}}/flutter/painting/TextSpan-class.html
[`PlaceholderSpan`]: {{site.api}}/flutter/painting/PlaceholderSpan-class.html
[`WidgetSpan`]: {{site.api}}/flutter/widgets/WidgetSpan-class.html
[Text: support inline images]: {{site.repo.flutter}}/issues/2022
[#30069]: {{site.repo.flutter}}/pull/30069
[#33946]: {{site.repo.flutter}}/pull/33946
[#33794]: {{site.repo.flutter}}/pull/33794
[#34051]: {{site.repo.flutter}}/pull/34051
[#73747]: {{site.repo.flutter}}/pull/73747

---

### `RenderView.scheduleInitialFrame`

### `RenderView.scheduleInitialFrame`


Supported by fix tool: No

修复工具支持： 否


The `RenderView.scheduleInitialFrame` method was deprecated and removed in
order to prevent splash screens from being taken down too early,
resulting in a black screen.
This would happen when `WidgetsFlutterBinding.ensureInitialized` was called.
Instead, replace calls to this method with `RenderView.prepareInitialFrame`,
followed by `RenderView.owner.requestVisualUpdate`.

`RenderView.scheduleInitialFrame` 方法已被弃用并删除，以防止启动画面过早关闭，导致黑屏。当调用 `WidgetsFlutterBinding.ensureInitialized` 时就会发生这种情况。相反，请用 `RenderView.prepareInitialFrame` 替换对此方法的调用，后跟 `RenderView.owner.requestVisualUpdate`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
scheduleInitialFrame();
```

Code after migration:

迁移后的代码：


```dart
prepareInitialFrame();
owner.requestVisualUpdate();
```

**References**

**参考**


API documentation:

API 文档：


* [`RenderView`][]
* [`WidgetsFlutterBinding`][]

Relevant issues:

相关 issue：


* [WidgetsFlutterBinding.ensureInitialized() takes down splash screen too early][]

  [WidgetsFlutterBinding.ensureInitialized() 过早关闭启动屏幕][WidgetsFlutterBinding.ensureInitialized() takes down splash screen too early]


Relevant PRs:

相关 PR：


* Deprecated in [#39535][]

  已弃用于[#39535][]

* Removed in [#73748][]

  删除于[#73748][]


[`RenderView`]: {{site.api}}/flutter/rendering/RenderView-class.html
[`TextSpan`]: {{site.api}}/flutter/widgets/WidgetsFlutterBinding-class.html
[`WidgetsFlutterBinding`]: {{site.api}}/flutter/widgets/WidgetsFlutterBinding-class.html
[WidgetsFlutterBinding.ensureInitialized() takes down splash screen too early]: {{site.repo.flutter}}/issues/39494
[#39535]: {{site.repo.flutter}}/pull/39535
[#73748]: {{site.repo.flutter}}/pull/73748

---

### `Layer.findAll`

### `Layer.findAll`


Supported by fix tool: No

修复工具支持： 否


The `Layer.findAll` method was deprecated with the
introduction of `Layer.findAnnotations` in order to unify
the implementations of `find` and `findAll`.
To migrate affected code, call `findAllAnnotations` instead.
This method returns an `AnnotationResult`, containing the former
return value of `findAll` in `AnnotationResult.annotations`.

为了统一 `find` 和 `findAll` 的实现，引入 `Layer.findAnnotations` 后，已弃用 `Layer.findAll` 方法。要迁移受影响的代码，请改为调用 `findAllAnnotations`。该方法返回一个 `AnnotationResult`，其中包含 `AnnotationResult.annotations` 中 `findAll` 的前一个返回值。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
findAll(offset);
```

Code after migration:

迁移后的代码：


```dart
findAllAnnotations(offset).annotations;
```

**References**

**参考**


API documentation:

API 文档：


* [`Layer`][]
* [`MouseRegion`][]
* [`RenderMouseRegion`][]
* [`AnnotatedRegionLayer`][]
* [`AnnotationResult`][]

Relevant issues:

相关 issue：


* [Breaking Proposal: MouseRegion defaults to opaque; Layers are required to implement findAnnotations][]

  [突破提案：MouseRegion 默认为不透明；需要层来实现 findAnnotations][Breaking Proposal: MouseRegion defaults to opaque; Layers are required to implement findAnnotations]


Relevant PRs:

相关 PR：


* Initially changed in [#37896][]

  最初改变于[#37896][]

* Deprecated in [#42953][]

  已弃用于[#42953][]

* Removed in [#73749][]

  删除于[#73749][]


[`Layer`]: {{site.api}}/flutter/rendering/Layer-class.html
[`MouseRegion`]: {{site.api}}/flutter/widgets/MouseRegion-class.html
[`RenderMouseRegion`]: {{site.api}}/flutter/rendering/RenderMouseRegion-class.html
[`AnnotatedRegionLayer`]: {{site.api}}/flutter/rendering/AnnotatedRegionLayer-class.html
[`AnnotationResult`]: {{site.api}}/flutter/rendering/AnnotationResult-class.html
[Breaking Proposal: MouseRegion defaults to opaque; Layers are required to implement findAnnotations]: {{site.repo.flutter}}/issues/38488
[#37896]: {{site.repo.flutter}}/pull/37896
[#42953]: {{site.repo.flutter}}/pull/42953
[#73749]: {{site.repo.flutter}}/pull/73749

---

### `BinaryMessages`

### `BinaryMessages`


Supported by fix tool: No

修复工具支持： 否


The `BinaryMessages` class, its associated static methods and the `defaultBinaryMessenger` getter
were deprecated and removed. The `defaultBinaryMessenger` instance was moved to `ServicesBinding`.
This made it possible to register a different default `BinaryMessenger` under testing environment,
by creating a `ServicesBinding` subclass for testing. Doing so allows you to track the number of
pending platform messages for synchronization purposes.

`BinaryMessages` 类、其关联的静态方法和 `defaultBinaryMessenger` getter 已弃用并删除。 `defaultBinaryMessenger` 实例已移至 `ServicesBinding`。这使得通过创建 `ServicesBinding` 子类进行测试，可以在测试环境下注册不同的默认 `BinaryMessenger` 。这样做可以让你跟踪待处理的平台消息数量以进行同步。


**Migration guide**

**迁移指南**


Code before migration: | Code after migration:
-- | --
`defaultBinaryMessenger` | `ServicesBinding.instance.defaultBinaryMessenger`
`BinaryMessages` | `BinaryMessenger`
`BinaryMessages.handlePlatformMessage` | `ServicesBinding.instance.defaultBinaryMessenger.handlePlatformMessage`
`BinaryMessages.send` | `ServicesBinding.instance.defaultBinaryMessenger.send`
`BinaryMessages.setMessageHandler` | `ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler`
`BinaryMessages.setMockMessageHandler` | `ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler`

迁移前的代码： |迁移后的代码： -- | -- `defaultBinaryMessenger` | `ServicesBinding.instance.defaultBinaryMessenger` `BinaryMessages` | `BinaryMessenger` `BinaryMessages.handlePlatformMessage` | `ServicesBinding.instance.defaultBinaryMessenger.handlePlatformMessage` `BinaryMessages.send` | `ServicesBinding.instance.defaultBinaryMessenger.send` `BinaryMessages.setMessageHandler` | `ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler` `BinaryMessages.setMockMessageHandler` | `ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler`


**References**

**参考**


API documentation:

API 文档：


* [`ServicesBinding`][]
* [`BinaryMessenger`][]

Relevant issues:

相关 issue：


* [Flutter synchronization support for Espresso/EarlGrey][]

  [Flutter Espresso/EarlGrey 同步支持][Flutter synchronization support for Espresso/EarlGrey]


Relevant PRs:

相关 PR：


* Initially changed in [#37489][]

  最初改变于[#37489][]

* Deprecated in [#38464][]

  已弃用于[#38464][]

* Removed in [#73750][]

  删除于[#73750][]


[`ServicesBinding`]: {{site.api}}/flutter/services/ServicesBinding-mixin.html
[`BinaryMessenger`]: {{site.api}}/flutter/services/BinaryMessenger-class.html
[Flutter synchronization support for Espresso/EarlGrey]: {{site.repo.flutter}}/issues/37409
[#37489]: {{site.repo.flutter}}/pull/37489
[#38464]: {{site.repo.flutter}}/pull/38464
[#73750]: {{site.repo.flutter}}/pull/73750

---

### Generic methods for `BuildContext`

### `BuildContext` 的通用方法


Supported by fix tool: Yes

修复工具支持：是


Several methods in `BuildContext` were using `Type` to search for ancestors.
Most of those methods implied a cast at call site because
their return type was a parent type.
Moreover the type provided was not checked at analysis time
even if the type is actually constrained.
Making these methods generics improves type safety and requires less code.

`BuildContext` 中的多个方法使用 `Type` 来搜索祖先。这些方法中的大多数都暗示在调用站点进行强制转换，因为它们的返回类型是父类型。此外，即使类型实际上受到限制，在分析时也不会检查所提供的类型。使这些方法泛型可以提高类型安全性并且需要更少的代码。


These method changes affect
the `BuildContext`, `Element`, and `StatefulElement` classes.
The `TypeMatcher` class was also removed.

这些方法更改会影响 `BuildContext`、`Element` 和 `StatefulElement` 类。 `TypeMatcher` 类也被删除。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
ComplexLayoutState state = context.ancestorStateOfType(const TypeMatcher<ComplexLayoutState>()) as ComplexLayoutState;
```

Code after migration:

迁移后的代码：


```dart
ComplexLayoutState state = context.ancestorStateOfType<ComplexLayoutState>();
```

`BuildContext`

Code before migration: | Code after migration:
--  | --
`inheritFromElement` | `dependOnInheritedElement`
`inheritFromWidgetOfExactType` | `dependOnInheritedWidgetOfExactType`
`ancestorInheritedElementForWidgetOfExactType` | `getElementForInheritedWidgetOfExactType`
`ancestorWidgetOfExactType` | `findAncestorWidgetOfExactType`
`ancestorStateOfType` | `findAncestorStateOfType`
`rootAncestorStateOfType` | `findRootAncestorStateOfType`
`ancestorRenderObjectOfType` | `findAncestorRenderObjectOfType`

迁移前的代码： |迁移后的代码： -- | -- `inheritFromElement` | `dependOnInheritedElement` `inheritFromWidgetOfExactType` | `dependOnInheritedWidgetOfExactType` `ancestorInheritedElementForWidgetOfExactType` | `getElementForInheritedWidgetOfExactType` `ancestorWidgetOfExactType` | `findAncestorWidgetOfExactType` `ancestorStateOfType` | `findAncestorStateOfType` `rootAncestorStateOfType` | `findRootAncestorStateOfType` `ancestorRenderObjectOfType` | `findAncestorRenderObjectOfType`


`Element`

Code before migration: | Code after migration:
--  | --
`inheritFromElement` | `dependOnInheritedElement`
`inheritFromWidgetOfExactType` | `dependOnInheritedWidgetOfExactType`
`ancestorInheritedElementForWidgetOfExactType` | `getElementForInheritedWidgetOfExactType`
`ancestorWidgetOfExactType` | `findAncestorWidgetOfExactType`
`ancestorStateOfType` | `findAncestorStateOfType`
`rootAncestorStateOfType` | `findRootAncestorStateOfType`
`ancestorRenderObjectOfType` | `findAncestorRenderObjectOfType`

迁移前的代码： |迁移后的代码： -- | -- `inheritFromElement` | `dependOnInheritedElement` `inheritFromWidgetOfExactType` | `dependOnInheritedWidgetOfExactType` `ancestorInheritedElementForWidgetOfExactType` | `getElementForInheritedWidgetOfExactType` `ancestorWidgetOfExactType` | `findAncestorWidgetOfExactType` `ancestorStateOfType` | `findAncestorStateOfType` `rootAncestorStateOfType` | `findRootAncestorStateOfType` `ancestorRenderObjectOfType` | `findAncestorRenderObjectOfType`


`StatefulElement`

Code before migration: | Code after migration:
--  | --
`inheritFromElement` | `dependOnInheritedElement`

迁移前的代码： |迁移后的代码： -- | -- `inheritFromElement` | `dependOnInheritedElement`


**References**

**参考**


API documentation:

API 文档：


* [`Type`][]
* [`BuildContext`][]
* [`Element`][]
* [`StatefulElement`][]

Relevant PRs:

相关 PR：


* Deprecated in [#44189][]

  已弃用于[#44189][]

* Removed in:

  删除于：

  * [#69620][]

    [#69620][#69620]

  * [#72903][]

    [#72903][#72903]

  * [#72901][]

    [#72901][#72901]

  * [#73751][]

    [#73751][#73751]


[`Type`]: {{site.api}}/flutter/dart-core/Type-class.html
[`BuildContext`]: {{site.api}}/flutter/widgets/BuildContext-class.html
[`Element`]: {{site.api}}/flutter/widgets/Element-class.html
[`StatefulElement`]: {{site.api}}/flutter/widgets/StatefulElement-class.html
[#44189]: {{site.repo.flutter}}/pull/44189
[#69620]: {{site.repo.flutter}}/pull/69620
[#72903]: {{site.repo.flutter}}/pull/72903
[#72901]: {{site.repo.flutter}}/pull/72901
[#73751]: {{site.repo.flutter}}/pull/73751

---

### `WidgetsBinding.deferFirstFrameReport` & `WidgetsBinding.allowFirstFrameReport`

### `WidgetsBinding.deferFirstFrameReport` 和 `WidgetsBinding.allowFirstFrameReport`


Supported by fix tool: Yes

修复工具支持：是


The `deferFirstFrameReport` and `allowFirstFrameReport` methods
of `WidgetsBinding` were deprecated and removed in order to
provide the option to delay rendering the first frame.
This is useful for widgets that need to obtain initialization
information asynchronously and while they are waiting for
that information no frame should render as that would take
down the splash screen pre-maturely.
The `deferFirstFrame` and `allowFirstFrame` methods
should be used respectively instead.

`WidgetsBinding` 的 `deferFirstFrameReport` 和 `allowFirstFrameReport` 方法已弃用并删除，以便提供延迟渲染第一帧的选项。这对于需要异步获取初始化信息的 widget 很有用，并且在等待该信息时，不应渲染任何帧，因为这会过早地关闭启动屏幕。应分别使用 `deferFirstFrame` 和 `allowFirstFrame` 方法。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
final WidgetsBinding binding = WidgetsBinding.instance;
binding.deferFirstFrameReport();
binding.allowFirstFrameReport();
```

Code after migration:

迁移后的代码：


```dart
final WidgetsBinding binding = WidgetsBinding.instance;
binding.deferFirstFrame();
binding.allowFirstFrame();
```

**References**

**参考**


API documentation:

API 文档：


* [`WidgetsBinding`][]

Relevant PRs:

相关 PR：


* Initially changed in

  最初改变于

  * [#45135][]

    [#45135][#45135]

  * [#45588][]

    [#45588][#45588]

* Deprecated in [#45941][]

  已弃用于[#45941][]

* Removed in [#72893][]

  删除于[#72893][]


[`WidgetsBinding`]: {{site.api}}/flutter/widgets/WidgetsBinding-mixin.html
[#45135]: {{site.repo.flutter}}/pull/45135
[#45588]: {{site.repo.flutter}}/pull/45588
[#45941]: {{site.repo.flutter}}/pull/45941
[#72893]: {{site.repo.flutter}}/pull/72893

---

### `WaitUntilNoTransientCallbacks`, `WaitUntilNoPendingFrame`, & `WaitUntilFirstFrameRasterized`

### `WaitUntilNoTransientCallbacks`、`WaitUntilNoPendingFrame` 和 `WaitUntilFirstFrameRasterized`


Supported by fix tool: No

修复工具支持： 否


The `WaitUntilNoTransientCallbacks`, `WaitUntilNoPendingFrame`, and `WaitUntilFirstFrameRasterized`
methods from the `flutter_driver` packages were deprecated and removed in order to provide a more
composable `waitForCondition` API that can be used to compose conditions that the client would like
to wait for.

`flutter_driver` 包中的 `WaitUntilNoTransientCallbacks`、`WaitUntilNoPendingFrame` 和 `WaitUntilFirstFrameRasterized` 方法已被弃用并删除，以便提供更可组合的 `waitForCondition` API，可用于组合客户端想要等待的条件。


**Migration guide**

**迁移指南**


Code before migration: | Code after migration:
-- | --
`WaitUntilNoTransientCallbacks` | `WaitForCondition(NoTransientCallbacks())`
`WaitUntilNoPendingFrame` | `WaitForCondition(NoPendingFrame())`
`WaitUntilFirstFrameRasterized` | `WaitForCondition(FirstFrameRasterized))`

迁移前的代码： |迁移后的代码： -- | -- `WaitUntilNoTransientCallbacks` | `WaitForCondition(NoTransientCallbacks())` `WaitUntilNoPendingFrame` | `WaitForCondition(NoPendingFrame())` `WaitUntilFirstFrameRasterized` | `WaitForCondition(FirstFrameRasterized))`


**References**

**参考**


API documentation:

API 文档：


* [`WaitForCondition`][]

Relevant issues:

相关 issue：


* [Flutter synchronization support for Espresso/EarlGrey][]

  [Flutter Espresso/EarlGrey 同步支持][Flutter synchronization support for Espresso/EarlGrey]


Relevant PRs:

相关 PR：


* Initially changed in [#37736][]

  最初改变于[#37736][]

* Deprecated in [#38836][]

  已弃用于[#38836][]

* Removed in [#73754][]

  删除于[#73754][]


[`WaitForCondition`]: {{site.api}}/flutter/flutter_driver/WaitForCondition-class.html
[#37736]: {{site.repo.flutter}}/pull/37736
[#38836]: {{site.repo.flutter}}/pull/38836
[#73754]: {{site.repo.flutter}}/pull/73754

---

## Timeline

## 时间线


In stable release: 2.0.0
稳定版本：2.0.0
