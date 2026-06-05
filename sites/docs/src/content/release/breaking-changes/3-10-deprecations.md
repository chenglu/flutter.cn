---
# title: Deprecated API removed after v3.10
title: v3.10 后删除了已弃用的 API
# description: >
#   After reaching end of life, the following deprecated APIs
#   were removed from Flutter.
description: >-
  生命周期结束后，以下已弃用的 API 已从 Flutter 中删除。
ai-translated: true
---

## Summary

## 摘要


In accordance with Flutter's [Deprecation Policy][],
deprecated APIs that reached end of life after the
3.10 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 3.10 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-3-10

## Changes

## Changes


This section lists the deprecations, listed by the package and affected class.

本节列出了弃用的内容，按包和受影响的类列出。


### ThemeData.fixTextFieldOutlineLabel

### ThemeData.fixTextFieldOutlineLabel


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


`ThemeData.fixTextFieldOutlineLabel` was deprecated in v2.5.
References to this property can be removed.

`ThemeData.fixTextFieldOutlineLabel` 在 v2.5 中已弃用。可以删除对此属性的引用。


The `fixTextFieldOutlineLabel` was a temporary migration flag that allowed users
to gracefully migrate to a new behavior rather than experiencing a hard break.
Before deprecating, this property was transitioned to the new default from the
fix to the label for text fields.

`fixTextFieldOutlineLabel` 是一个临时迁移标志，允许用户优雅地迁移到新行为，而不是经历硬中断。在弃用之前，此属性已从修复文本字段的标签转换为新的默认值。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
var themeData = ThemeData(
  fixTextFieldOutlineLabel: true,
);
```

Code after migration:

迁移后的代码：


```dart
var themeData = ThemeData(
);
```

**References**

**参考**


API documentation:

API 文档：


* [`ThemeData`][]

Relevant PRs:

相关 PR：


* Deprecated in [#87281][]

  已弃用于[#87281][]

* Removed in [#125893][]

  删除于[#125893][]


[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html

[#87281]: {{site.repo.flutter}}/pull/87281
[#125893]: {{site.repo.flutter}}/pull/125893

---

### OverscrollIndicatorNotification.disallowGlow

### OverscrollIndicatorNotification.disallowGlow


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


`OverscrollIndicatorNotification.disallowGlow` was deprecated in v2.5.
The replacement is the `disallowIndicator` method.

`OverscrollIndicatorNotification.disallowGlow` 在 v2.5 中已弃用。替代方法是 `disallowIndicator` 方法。


The `disallowIndicator` was created as a replacement for the original method
with the introduction of the `StretchingOverscrollIndicator`. Previously,
the `GlowingOverscrollIndicator` was the only kind to dispatch
`OverscrollIndicatorNotification`s, and so the method was updated to better
reflect multiple kinds of indicators.

通过引入 `StretchingOverscrollIndicator`，创建 `disallowIndicator` 作为原始方法的替代。此前，`GlowingOverscrollIndicator`是唯一调度`OverscrollIndicatorNotification`的类型，因此更新了方法以更好地反映多种指标。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
bool _handleOverscrollIndicatorNotification(OverscrollIndicatorNotification notification) {
  notification.disallowGlow();
  return false;
}
```

Code after migration:

迁移后的代码：


```dart
bool _handleOverscrollIndicatorNotification(OverscrollIndicatorNotification notification) {
  notification.disallowIndicator();
  return false;
}
```

**References**

**参考**


API documentation:

API 文档：


* [`OverscrollIndicatorNotification`][]
* [`StretchingOverscrollIndicator`][]
* [`GlowingOverscrollIndicator`][]

Relevant PRs:

相关 PR：


* Deprecated in [#87839][]

  已弃用于[#87839][]

* Removed in [#127042][]

  删除于[#127042][]


[`OverscrollIndicatorNotification`]: {{site.api}}/flutter/widgets/OverscrollIndicatorNotification-class.html
[`StretchingOverscrollIndicator`]: {{site.api}}/flutter/widgets/StretchingOverscrollIndicator-class.html
[`GlowingOverscrollIndicator`]: {{site.api}}/flutter/widgets/GlowingOverscrollIndicator-class.html

[#87839]: {{site.repo.flutter}}/pull/87839
[#127042]: {{site.repo.flutter}}/pull/127042

---

### ColorScheme primaryVariant & secondaryVariant

### 颜色方案主要变体和次要变体


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


`ColorScheme.primaryVariant` and `ColorScheme.secondaryVariant` were deprecated
in v2.6. The replacements are the `ColorScheme.primaryContainer` and
`ColorScheme.secondaryContainer`, respectively.

`ColorScheme.primaryVariant` 和 `ColorScheme.secondaryVariant` 在 v2.6 中已弃用。替代品分别是 `ColorScheme.primaryContainer` 和 `ColorScheme.secondaryContainer`。


These changes were made to align with the updated Material Design specification
for `ColorScheme`. The updates to `ColorScheme` are covered more extensively in
the [ColorScheme for Material 3][] design document.

这些更改是为了与 `ColorScheme` 更新的材料设计规范保持一致。 `ColorScheme` 的更新在[ColorScheme for Material 3][]设计文件。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
var colorScheme = ColorScheme(
  primaryVariant: Colors.blue,
  secondaryVariant: Colors.amber,
);
var primaryColor = colorScheme.primaryVariant;
var secondaryColor = colorScheme.secondaryVariant;
```

Code after migration:

迁移后的代码：


```dart
var colorScheme = ColorScheme(
  primaryContainer: Colors.blue,
  secondaryContainer: Colors.amber,
);
var primaryColor = colorScheme.primaryContainer;
var secondaryColor = colorScheme.secondaryContainer;
```

**References**

**参考**


Design Document:

设计文件：


* [ColorScheme for Material 3][]

  [Material 3 的颜色方案][ColorScheme for Material 3]


API documentation:

API 文档：


* [`ColorScheme`][]

Relevant PRs:

相关 PR：


* Deprecated in [#93427][]

  已弃用于[#93427][]

* Removed in [#127124][]

  删除于[#127124][]


[ColorScheme for Material 3]: /go/colorscheme-m3

[`ColorScheme`]: {{site.api}}/flutter/material/ColorScheme-class.html

[#93427]: {{site.repo.flutter}}/pull/93427
[#127124]: {{site.repo.flutter}}/pull/127124

---

### ThemeData.primaryColorBrightness

### ThemeData.primaryColorBrightness


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


`ThemeData.primaryColorBrightness` was deprecated in v2.6, and has not been used
by the framework since then. References should be removed. The `Brightness` is
now extrapolated from the `ThemeData.primaryColor` if `ThemeData.brightness` has
not been explicitly provided.

`ThemeData.primaryColorBrightness` 在 v2.6 中已弃用，从那时起框架就不再使用它。应删除参考文献。如果尚未明确提供 `ThemeData.brightness`，则现在从 `ThemeData.primaryColor` 推断出 `Brightness`。


This change was made as part of the update to `Theme` to match new Material
Design guidelines. The overall update to the theming system, including the
removal of `primaryColorBrightness` is discussed more extensively in the
[Material Theme System Updates][] design document.

此更改是 `Theme` 更新的一部分，以符合新的材料设计指南。主题系统的整体更新，包括删除 `primaryColorBrightness` 在[Material Theme System Updates][]设计文件。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
var themeData = ThemeData(
  primaryColorBrightness: Brightness.dark,
);
```

Code after migration:

迁移后的代码：


```dart
var themeData = ThemeData(
);
```

**References**

**参考**


Design Document:

设计文件：


* [Material Theme System Updates][]

  [材质主题系统更新][Material Theme System Updates]


API documentation:

API 文档：


* [`Theme`][]
* [`ThemeData`][]
* [`Brightness`][]

Relevant PRs:

相关 PR：


* Deprecated in [#93396][]

  已弃用于[#93396][]

* Removed in [#127238][]

  删除于[#127238][]


[Material Theme System Updates]: /go/material-theme-system-updates

[`Theme`]: {{site.api}}/flutter/material/Theme-class.html
[`ThemeData`]: {{site.api}}/flutter/material/Theme-class.html
[`Brightness`]: {{site.api}}/flutter/dart-ui/Brightness.html

[#93396]: {{site.repo.flutter}}/pull/93396
[#127238]: {{site.repo.flutter}}/pull/127238

---

### RawScrollbar & subclasses updates

### RawScrollbar 和子类更新


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


The `isAlwaysShown` property of `RawScrollbar`, `Scrollbar`,
`ScrollbarThemeData` and `CupertinoScrollbar` was deprecated in v2.9. The
replacement in all cases is `thumbVisibility`.

`RawScrollbar`、`Scrollbar`、`ScrollbarThemeData` 和 `CupertinoScrollbar` 的 `isAlwaysShown` 属性在 v2.9 中已弃用。所有情况下的替换都是 `thumbVisibility`。


This change was made since `isAlwaysShown` always referred to the scrollbar
thumb. With the addition of a scrollbar track, and varying configurations for
its visibility in response to mouse hovering and dragging, we renamed this
property for a clearer API.

进行此更改是因为 `isAlwaysShown` 始终引用滚动条拇指。通过添加滚动条轨道，并根据鼠标悬停和拖动来改变其可见性配置，我们重命名了此属性以获得更清晰的 API。


Additionally, `Scrollbar.hoverThickness` was also deprecated in v2.9. Its
replacement is the `MaterialStateProperty` `ScrollbarThemeData.thickness`.

此外，`Scrollbar.hoverThickness` 在 v2.9 中也被弃用。它的替代品是 `MaterialStateProperty` `ScrollbarThemeData.thickness`。


This change was made to allow the thickness of a `Scrollbar` to respond to all
kind of states, including and beyond just hovering. The use of
`MaterialStateProperties` also matches the convention in the material library of
configuring widgets based on their state, rather than enumerating properties for
every permutation of interactive states.

进行此更改是为了允许 `Scrollbar` 的厚度响应所有类型的状态，包括悬停。 `MaterialStateProperties` 的使用也符合材质库中根据状态配置 widget 的约定，而不是枚举交互状态的每个排列的属性。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
var rawScrollbar = RawScrollbar(
  isAlwaysShown: true,
);
var scrollbar = Scrollbar(
  isAlwaysShown: true,
  hoverThickness: 15.0,
);
var cupertinoScrollbar = CupertinoScrollbar(
  isAlwaysShown: true,
);
var scrollbarThemeData = ScrollbarThemeData(
  isAlwaysShown: true,
);
```

Code after migration:

迁移后的代码：


```dart
var rawScrollbar = RawScrollbar(
  thumbVisibility: true,
);
var scrollbar = Scrollbar(
  thumbVisibility: true,
);
var cupertinoScrollbar = CupertinoScrollbar(
  thumbVisibility: true,
);
var scrollbarThemeData = ScrollbarThemeData(
  thumbVisibility: true,
  thickness: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
    return states.contains(MaterialState.hovered) ? null : 15.0;
  }),
);
```

**References**

**参考**


API documentation:

API 文档：


* [`RawScrollbar`][]
* [`Scrollbar`][]
* [`CupertinoScrollbar`][]
* [`ScrollbarThemeData`][]
* [`MaterialStateProperty`][]
* [`MaterialState`][]

Relevant PRs:

相关 PR：


* Deprecated in [#96957][]

  已弃用于[#96957][]

* Deprecated in [#97173][]

  已弃用于[#97173][]

* Removed in [#127351][]

  删除于[#127351][]



[`RawScrollbar`]: {{site.api}}/flutter/widgets/RawScrollbar-class.html
[`Scrollbar`]: {{site.api}}/flutter/material/Scrollbar-class.html
[`CupertinoScrollbar`]: {{site.api}}/flutter/cupertino/CupertinoScrollbar-class.html
[`ScrollbarThemeData`]: {{site.api}}/flutter/material/ScrollbarThemeData-class.html
[`MaterialStateProperty`]: {{site.api}}/flutter/material/MaterialStateProperty-class.html
[`MaterialState`]: {{site.api}}/flutter/material/MaterialState.html

[#96957]: {{site.repo.flutter}}/pull/96957
[#97173]: {{site.repo.flutter}}/pull/97173
[#127351]: {{site.repo.flutter}}/pull/127351

---

### AnimationSheetBuilder display & sheetSize

### AnimationSheetBuilder 显示和sheetSize


Package: flutter_test
Supported by Flutter Fix: yes

软件包：flutter_test 由 Flutter 支持 修复：是


The `display` and `sheetSize` methods of `AnimationSheetBuilder` were deprecated
in v2.3. The replacement is the `collate` method.

`AnimationSheetBuilder` 的 `display` 和 `sheetSize` 方法在 v2.3 中已弃用。替代方法是 `collate` 方法。


`AnimationSheetBuilder`'s output step previously required these two methods to
be called, but is now streamlined through a single call to `collate`.

`AnimationSheetBuilder` 的输出步骤以前需要调用这两个方法，但现在通过对 `collate` 的单个调用进行了简化。


The `collate` function directly puts the images together and asynchronously
returns an image. It requires less boilerplate, and outputs smaller images
without any compromise to quality.

`collate` 函数直接将图像放在一起并异步返回图像。它需要更少的样板，并输出更小的图像，而不会影响质量。


**Migration guide**

**迁移指南**


[In-depth migration guide available]

Code before migration:

迁移前的代码：


```dart
final AnimationSheetBuilder animationSheet = AnimationSheetBuilder(
    frameSize: const Size(40, 40)
);

await tester.pumpFrames(animationSheet.record(
  const Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: EdgeInsets.all(4),
      child: CircularProgressIndicator(),
    ),
  ),
), const Duration(seconds: 2));

tester.binding.setSurfaceSize(animationSheet.sheetSize());

final Widget display = await animationSheet.display();
await tester.pumpWidget(display);

await expectLater(
  find.byWidget(display),
  matchesGoldenFile('material.circular_progress_indicator.indeterminate.png'),
);
```

Code after migration:

迁移后的代码：


```dart
final AnimationSheetBuilder animationSheet = AnimationSheetBuilder(
    frameSize: const Size(40, 40)
);

await tester.pumpFrames(animationSheet.record(
  const Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: EdgeInsets.all(4),
      child: CircularProgressIndicator(),
    ),
  ),
), const Duration(seconds: 2));

await expectLater(
  animationSheet.collate(20),
  matchesGoldenFile('material.circular_progress_indicator.indeterminate.png'),
);
```

[In-depth migration guide available]: /release/breaking-changes/animation-sheet-builder-display

**References**

**参考**


API documentation:

API 文档：


* [`AnimationSheetBuilder`][]

Relevant PRs:

相关 PR：


* Deprecated in [#83337][]

  已弃用于[#83337][]

* Removed in [#129657][]

  删除于[#129657][]


[`AnimationSheetBuilder`]: {{site.api}}/flutter/flutter_test/AnimationSheetBuilder-class.html

[#83337]: {{site.repo.flutter}}/pull/83337
[#129657]: {{site.repo.flutter}}/pull/129657

---

---

### flutter_test timeout logic

### flutter_test超时逻辑


Package: flutter_test
Supported by Flutter Fix: no

软件包：flutter_test 由 Flutter 支持 修复：无


The following APIs related to timeout logic in tests were deprecated
in v2.6. There are no replacements, and references should be removed, except for
the `initialTimeout` parameter of `testWidgets`, which is replaced by using
`timeout`.

以下与测试中超时逻辑相关的 API 在 v2.6 中已弃用。没有替换项，并且应删除引用，但 `testWidgets` 的 `initialTimeout` 参数除外，该参数已使用 `timeout` 替换。


* `TestWidgetsFlutterBinding.addTime`

  `TestWidgetsFlutterBinding.addTime`

* `TestWidgetsFlutterBinding.runAsync` method - `additionalTime` parameter

  `TestWidgetsFlutterBinding.runAsync` 方法 - `additionalTime` 参数

* `TestWidgetsFlutterBinding.runTest` method - `timeout` parameter

  `TestWidgetsFlutterBinding.runTest` 方法 - `timeout` 参数

* `AutomatedTestWidgetsFlutterBinding.runTest` method - `timeout` parameter

  `AutomatedTestWidgetsFlutterBinding.runTest` 方法 - `timeout` 参数

* `LiveTestWidgetsFlutterBinding.runTest` method - `timeout` parameter

  `LiveTestWidgetsFlutterBinding.runTest` 方法 - `timeout` 参数

* `testWidgets` method - `initialTime` parameter

  `testWidgets` 方法 - `initialTime` 参数


These were found to cause flakiness in testing, and were not in use by tested
customers.

这些在测试中被发现会导致不稳定，并且没有被测试客户使用。


Since being deprecated, use of these parameters have had no effect on tests, so
removing references should have no effect on existing code bases.

自从被弃用以来，使用这些参数对测试没有影响，因此删除引用应该不会对现有代码库产生影响。


**Migration guide**

**迁移指南**



Code before migration:

迁移前的代码：


```dart
testWidgets('Test', (_) {}, initialTimeout:  Duration(seconds: 5));
```

Code after migration:

迁移后的代码：


```dart
testWidgets('Test', (_) {}, timeout:  Timeout(Duration(seconds: 5)));
```

**References**

**参考**


API documentation:

API 文档：


* [`testWidgets`][]
* [`TestWidgetsFlutterBinding`][]
* [`AutomatedTestWidgetsFlutterBinding`][]
* [`LiveTestWidgetsFlutterBinding`][]

Relevant PRs:

相关 PR：


* Deprecated in [#89952][]

  已弃用于[#89952][]

* Removed in [#129663][]

  删除于[#129663][]


[`testWidgets`]: {{site.api}}/flutter/flutter_test/testWidgets.html
[`TestWidgetsFlutterBinding`]: {{site.api}}/flutter/flutter_test/TestWidgetsFlutterBinding-class.html
[`AutomatedTestWidgetsFlutterBinding`]: {{site.api}}/flutter/flutter_test/AutomatedTestWidgetsFlutterBinding-class.html
[`LiveTestWidgetsFlutterBinding`]: {{site.api}}/flutter/flutter_test/LiveTestWidgetsFlutterBinding-class.html

[#89952]: {{site.repo.flutter}}/pull/89952
[#129663]: {{site.repo.flutter}}/pull/129663

---

## Timeline

## 时间线


In stable release: 3.13.0
稳定版本：3.13.0
