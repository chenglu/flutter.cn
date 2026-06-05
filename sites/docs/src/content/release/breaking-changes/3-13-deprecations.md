---
# title: Deprecated API removed after v3.13
title: v3.13 后删除了已弃用的 API
# description: >-
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
3.13 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 3.13 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration.
To further aid your migration, check out this
[quick reference sheet][].

所有受影响的 API 均已编译到此主要源中以帮助迁移。为了进一步帮助你的迁移，请查看此[quick reference sheet][].


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-3-13

## Changes

## Changes


This section lists the deprecations by the package and affected class.

本节列出了包和受影响的类的弃用。


### Chip classes' useDeleteButtonTooltip

### 芯片类的useDeleteButtonTooltip


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The `useDeleteButtonTooltip` property of the following classes was deprecated
in v2.10:

以下类的 `useDeleteButtonTooltip` 属性在 v2.10 中已弃用：


* `DeletableChipAttributes`

  `DeletableChipAttributes`

* `Chip`

  `Chip`

* `RawChip`

  `RawChip`

* `InputChip`

  `InputChip`


`deleteButtonTooltipMessage` replaces `useDeleteButtonTooltip`. This change simplified the
API, as providing an empty String to `deleteButtonTooltipMessage` achieves the
same result as setting the original property `useDeleteButtonTooltip` to false.
When `deleteButtonTooltipMessage` is unset, the
`MaterialLocalizations.deleteButtonTooltip` is used by default.

`deleteButtonTooltipMessage` 替换 `useDeleteButtonTooltip`。此更改简化了 API，因为向 `deleteButtonTooltipMessage` 提供空字符串可实现与将原始属性 `useDeleteButtonTooltip` 设置为 false 相同的结果。当 `deleteButtonTooltipMessage` 未设置时，默认使用 `MaterialLocalizations.deleteButtonTooltip`。


The [Deprecate `useDeleteButtonTooltip` for Chips][] design document
covers this update to chips and tooltips in greater depth.
To learn more, check out the [chips and tooltips migration guide][].

这[Deprecate `useDeleteButtonTooltip` for Chips][]设计文档更深入地涵盖了芯片和工具提示的更新。要了解更多信息，请查看[chips and tooltips migration guide][].


[Deprecate `useDeleteButtonTooltip` for Chips]: https://docs.google.com/document/d/1wc9ot7T2E7hJubYxEWMX230a79wYSiFey4BHxnEzHtw/edit?usp=sharing&resourcekey=0-Bo7KPqEtkWgZcSuRCqwQ5w
[chips and tooltips migration guide]: /release/breaking-changes/chip-usedeletebuttontooltip-migration

**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
Chip(useDeleteButtonTooltip: false);
InputChip(useDeleteButtonTooltip: true);
RawChip rawChip = RawChip();
rawChip.useDeleteButtonTooltip;
```

Code after migration:

迁移后的代码：


```dart
Chip(deleteButtonTooltipMessage: '');
InputChip();
RawChip rawChip = RawChip();
rawChip.deleteButtonTooltipMessage;
```

**References**

**参考**


API documentation:

API 文档：


* [`DeletableChipAttributes`][]
* [`Chip`][]
* [`RawChip`][]
* [`InputChip`][]
* [`MaterialLocalizations.deleteButtonTooltip`][]

Relevant PRs:

相关 PR：


* Deprecated in [#96174][]

  已弃用于[#96174][]

* Removed in [#134486][]

  删除于[#134486][]


[`DeletableChipAttributes`]: {{site.api}}/flutter/material/DeletableChipAttributes-class.html
[`Chip`]: {{site.api}}/flutter/material/Chip-class.html
[`RawChip`]: {{site.api}}/flutter/material/RawChip-class.html
[`InputChip`]: {{site.api}}/flutter/material/InputChip-class.html
[`MaterialLocalizations.deleteButtonTooltip`]: {{site.api}}/flutter/material/MaterialLocalizations/deleteButtonTooltip.html

[#96174]: {{site.repo.flutter}}/pull/96174
[#134486]: {{site.repo.flutter}}/pull/134486

---

### MaterialButtonWithIconMixin

### MaterialButtonWithIconMixin


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


The `MaterialButtonWithIconMixin` property was deprecated in v2.11.

`MaterialButtonWithIconMixin` 属性在 v2.11 中已弃用。


With the introduction of new button classes `TextButton`, `OutlinedButton` and `ElevatedButton`,
this mixin is no longer used.
An earlier release removed old button classes that used this mixin.
As a result, this mixin no longer affects any classes that might mix it in.

随着新按钮类 `TextButton`、`OutlinedButton` 和 `ElevatedButton` 的引入，不再使用此 mixin。早期版本删除了使用此 mixin 的旧按钮类。因此，这个 mixin 不再影响任何可能混合它的类。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
class MyButtonClass extends StatelessWidget with MaterialButtonWithIconMixin {
  // ...
}
```

Code after migration:

迁移后的代码：


```dart
class MyButtonClass extends StatelessWidget {
  // ...
}
```

**References**

**参考**


Relevant PRs:

相关 PR：


* Deprecated in [#99088][]

  已弃用于[#99088][]

* Removed in [#133173][]

  删除于[#133173][]


[#99088]: {{site.repo.flutter}}/pull/99088
[#133173]: {{site.repo.flutter}}/pull/133173

---

### PlatformsViewsService.synchronizeToNativeViewHierarchy

### PlatformsViewsService.synchronizeToNativeViewHierarchy


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


The static method `synchronizeToNativeViewHierarchy` of `PlatformsViewsService`
was deprecated in v2.11.

`PlatformsViewsService` 的静态方法 `synchronizeToNativeViewHierarchy` 在 v2.11 中已弃用。


During the deprecation period, the method was a no-op function as it was no
longer required to call for performance improvements.
References to the method should be removed and won't impact the application.

在弃用期间，该方法是无操作函数，因为不再需要调用性能改进。应删除对该方法的引用，并且不会影响应用程序。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
await PlatformsViewsService.synchronizeToNativeViewHierarchy(false);
````

Code after migration:

迁移后的代码：


```dart
```

**References**

**参考**


API documentation:

API 文档：


* [`PlatformViewsService`][]

Relevant PRs:

相关 PR：


* Deprecated in [#100990][]

  已弃用于[#100990][]

* Removed in [#133175][]

  删除于[#133175][]


[`PlatformViewsService`]: {{site.api}}/flutter/services/PlatformViewsService-class.html

[#100990]: {{site.repo.flutter}}/pull/100990
[#133175]: {{site.repo.flutter}}/pull/133175

---

### TextSelectionOverlay.fadeDuration

### TextSelectionOverlay.fadeDuration


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The static `fadeDuration` property of `TextSelectionOverlay` was deprecated
in v2.12.

`TextSelectionOverlay` 的静态 `fadeDuration` 属性在 v2.12 中已弃用。


The `SelectionOverlay.fadeDuration` property replaces `TextSelectionOverlay.fadeDuration`.
With the `TextSelectionOverlay` refactor,
`SelectionOverlay` was added as a more generic widget without
the specific dependency on `RenderEditable`.

`SelectionOverlay.fadeDuration` 属性替换 `TextSelectionOverlay.fadeDuration`。通过 `TextSelectionOverlay` 重构，`SelectionOverlay` 作为更通用的 widget 添加，而不对 `RenderEditable` 具有特定依赖性。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
TextSelectionOverlay.fadeDuration;
```

Code after migration:

迁移后的代码：


```dart
SelectionOverlay.fadeDuration;
```

**References**

**参考**


API documentation:

API 文档：


* [`TextSelectionOverlay`][]
* [`SelectionOverlay`][]

Relevant PRs:

相关 PR：


* Deprecated in [#100381][]

  已弃用于[#100381][]

* Removed in [#134485][]

  删除于[#134485][]


[`TextSelectionOverlay`]: {{site.api}}/flutter/widgets/TextSelectionOverlay-class.html
[`SelectionOverlay`]: {{site.api}}/flutter/widgets/SelectionOverlay-class.html

[#100381]: {{site.repo.flutter}}/pull/100381
[#134485]: {{site.repo.flutter}}/pull/134485

---

### androidOverscrollIndicator

### androidOverscrollIndicator


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


The `androidOverscrollIndicator` property of the following classes was
deprecated in v2.13:

以下类的 `androidOverscrollIndicator` 属性在 v2.13 中已弃用：


* `ScrollBehavior`

  `ScrollBehavior`

* `MaterialScrollBehavior`

  `MaterialScrollBehavior`

* `ThemeData`

  `ThemeData`


This flag was introduced to allow users to configure scrolling widgets to use
the `GlowingOverscrollIndicator` or the `StretchingOvercrollIndicator`.
It was deprecated in favor of the `ThemeData.useMaterial3` flag
as the framework introduced more support for Material 3-styled widgets.

引入此标志是为了允许用户配置滚动 widgets 以使用 `GlowingOverscrollIndicator` 或 `StretchingOvercrollIndicator`。它已被弃用，取而代之的是 `ThemeData.useMaterial3` 标志，因为框架引入了对 Material 3 样式的 widgets 的更多支持。


Since `ThemeData.useMaterial3` is `true` by default,
the `StretchingOverscrollIndicator` is applied by default.
Setting this value to `false` will apply a `GlowingOverscrollIndicator` instead.

由于 `ThemeData.useMaterial3` 默认为 `true`，因此默认应用 `StretchingOverscrollIndicator`。将此值设置为 `false` 将改为应用 `GlowingOverscrollIndicator`。


Alternatively, the `buildOverscrollIndicator` method of `ScrollBehavior` or
`MaterialScrollBehavior` can be overridden to further alter the appearance of
overscroll indicators.

或者，可以重写 `ScrollBehavior` 或 `MaterialScrollBehavior` 的 `buildOverscrollIndicator` 方法，以进一步改变过度滚动指示器的外观。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
MaterialApp(
  scrollBehavior: MaterialScrollBehavior(
    androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
  ),
  //...
);

MaterialApp(
  scrollBehavior: ScrollBehavior(
    androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
  ),
  //...
);

MaterialApp(
  theme: Theme.light().copyWith(
    androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
  ),
  //...
);
```

Code after migration:

迁移后的代码：


```dart
MaterialApp(
  theme: Theme.light().copyWith(
    // defaults to true and stretching indicator,
    // false results in glowing indicator
    useMaterial3: false,
  ),
  //...
);
```

**References**

**参考**


API documentation:

API 文档：


* [`ScrollBehavior`][]
* [`MaterialScrollBehavior`][]
* [`ThemeData`][]
* [`GlowingOverscrollIndicator`][]
* [`StretchingOverscrollIndicator`][]

Relevant PRs:

相关 PR：


* Deprecated in [#100234][]

  已弃用于[#100234][]

* Removed in [#133181][]

  删除于[#133181][]


[`ScrollBehavior`]: {{site.api}}/flutter/widgets/ScrollBehavior-class.html
[`MaterialScrollBehavior`]: {{site.api}}/flutter/material/MaterialScrollBehavior-class.html
[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html
[`GlowingOverscrollIndicator`]: {{site.api}}/flutter/widgets/GlowingOverscrollIndicator-class.html
[`StretchingOverscrollIndicator`]: {{site.api}}/flutter/widgets/StretchingOverscrollIndicator-class.html

[#100234]: {{site.repo.flutter}}/pull/100234
[#133181]: {{site.repo.flutter}}/pull/133181

---

### Updates to ImageProvider and PaintingBinding

### ImageProvider 和 PaintingBinding 的更新


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


The `instantiateImageCodec` method of `PaintingBinding`, as well as the `load`
method of `ImageProvider` and the associated `DecoderCallback` were all
deprecated in v2.13.

`PaintingBinding` 的 `instantiateImageCodec` 方法、`ImageProvider` 的 `load` 方法以及相关的 `DecoderCallback` 在 v2.13 中均已弃用。


The respective replacements are:

各自的替代品是：


| <t>Deprecated Method</t><t>已弃用的方法</t> | <t>Current Method</t><t>当前方法</t> |
|-----------------------------------------|---------------------------------------------------|
| `PaintingBinding.instantiateImageCodec` | `PaintingBinding.instantiateImageCodecFromBuffer` |
| `ImageProvider.load`                    | `ImageProvider.loadBuffer`                        |
| `DecoderCallback`                       | `DecoderBufferCallback`                           |

This change enabled faster performance in image loading by using a buffer.

此更改通过使用缓冲区实现了更快的图像加载性能。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
PaintingBinding.instance.instantiateImageCodec
```

Code after migration:

迁移后的代码：


```dart
PaintingBinding.instance.instantiateImageCodecFromBuffer
```

**References**

**参考**


API documentation:

API 文档：


* [`PaintingBinding`][]
* [`ImageProvider`][]
* [`DecoderBufferCallback`][]

Relevant PRs:

相关 PR：


* Deprecated in [#103496][]

  已弃用于[#103496][]

* Removed in [#132679][]

  删除于[#132679][]


[`PaintingBinding`]: {{site.api}}/flutter/painting/PaintingBinding-mixin.html
[`ImageProvider`]: {{site.api}}/flutter/painting/ImageProvider-class.html
[`DecoderBufferCallback`]: {{site.api}}/flutter/painting/DecoderBufferCallback.html

[#103496]: {{site.repo.flutter}}/pull/103496
[#132679]: {{site.repo.flutter}}/pull/132679

---

### TestWindow properties

### 测试窗口属性


Package: flutter_test
Supported by Flutter Fix: no

软件包：flutter_test 由 Flutter 支持 修复：无


To prepare for multi-window support,
many deprecated properties of `TestWindow` have been removed.
While `TestWindow` has been deprecated, it does not qualify
for removal at this time.
Migrating the expired properties now will help in migrating from `TestWindow`.

为了准备多窗口支持，`TestWindow` 的许多已弃用的属性已被删除。虽然 `TestWindow` 已被弃用，但目前不符合删除条件。现在迁移过期的属性将有助于从 `TestWindow` 迁移。


The following properties were removed:

以下属性已被删除：


* `localeTestValue`

  `localeTestValue`

* `clearLocaleTestValue`

  `clearLocaleTestValue`

* `localesTestValue`

  `localesTestValue`

* `clearLocalesTestValue`

  `clearLocalesTestValue`

* `initialLifecycleStateTestValue`

  `initialLifecycleStateTestValue`

* `textScaleFactorTestValue`

  `textScaleFactorTestValue`

* `clearTextScaleFactorTestValue`

  `clearTextScaleFactorTestValue`

* `platformBrightnessTestValue`

  `platformBrightnessTestValue`

* `clearPlatformBrightnessTestValue`

  `clearPlatformBrightnessTestValue`

* `alwaysUse24HourFormatTestValue`

  `alwaysUse24HourFormatTestValue`

* `clearAlwaysUse24HourTestValue`

  `clearAlwaysUse24HourTestValue`

* `brieflyShowPasswordTestValue`

  `brieflyShowPasswordTestValue`

* `defaultRouteNameTestValue`

  `defaultRouteNameTestValue`

* `clearDefaultRouteNameTestValue`

  `clearDefaultRouteNameTestValue`

* `semanticsEnabledTestValue`

  `semanticsEnabledTestValue`

* `clearSemanticsEnabledTestValue`

  `clearSemanticsEnabledTestValue`

* `accessibilityFeaturesTestValue`

  `accessibilityFeaturesTestValue`

* `clearAccessibilityFeaturesTestValue`

  `clearAccessibilityFeaturesTestValue`


To learn more about this `TestWindow` update, check out
[`TestWindow` migration guide][].

要了解有关 `TestWindow` 更新的更多信息，请查看[`TestWindow` migration guide][].


[`TestWindow` migration guide]: /release/breaking-changes/window-singleton

**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
testWidgets('My test', (WidgetTester tester) async {
  // For all instances, replace window with platformDispatcher
  tester.binding.window.textScaleFactorTestValue = 42;
  addTearDown(tester.binding.window.clearTextScaleFactorTestValue);
  // ...
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('My test', (WidgetTester tester) async {
  // For all instances, replace window with platformDispatcher
  tester.binding.platformDispatcher.textScaleFactorTestValue = 42;
  addTearDown(tester.binding.platformDispatcher.clearTextScaleFactorTestValue);
  // ...
});
```

**References**

**参考**


API documentation:

API 文档：


* [`WidgetTester`][]
* [`TestWidgetsFlutterBinding`][]
* [`TestPlatformDispatcher`][]

Relevant PRs:

相关 PR：


* Deprecated in [#99443][]

  已弃用于[#99443][]

* Removed in [#131098][]

  删除于[#131098][]


[`WidgetTester`]: {{site.api}}/flutter/flutter_test/WidgetTester-class.html
[`TestWidgetsFlutterBinding`]: {{site.api}}/flutter/flutter_test/TestWidgetsFlutterBinding-class.html
[`TestPlatformDispatcher`]: {{site.api}}/flutter/flutter_test/TestPlatformDispatcher-class.html

[#99443]: {{site.repo.flutter}}/pull/99443
[#131098]: {{site.repo.flutter}}/pull/131098

---

## Timeline

## 时间线


In stable release: 3.16
稳定版本：3.16
