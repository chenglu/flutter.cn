---
# title: Deprecated API removed after v2.10
title: v2.10 后删除了已弃用的 API
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
2.10 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 2.10 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。



[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-2-10

## Changes

## Changes


This section lists the deprecations by affected class.

本节列出了受影响类的弃用内容。


---

### `maxLengthEnforced` of `TextField` & related classes

### `TextField` 的 `maxLengthEnforced` 及相关类


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


`maxLengthEnforced` was deprecated in v1.25.

`maxLengthEnforced` 在 v1.25 中已弃用。


Use `maxLengthEnforcement` instead.
Where `maxLengthEnforced` was true, replace with `MaxLengthEnforcement.enforce`.
Where `maxLengthEnforced` was false, replace with `MaxLengthEnforcement.none`.
This change allows more behaviors to be specified beyond the original binary
choice, adding `MaxLengthEnforcement.truncateAfterCompositionEnds` as an
additional option.

请改用 `maxLengthEnforcement` 。如果 `maxLengthEnforced` 为 true，则替换为 `MaxLengthEnforcement.enforce`。如果 `maxLengthEnforced` 为 false，则替换为 `MaxLengthEnforcement.none`。此更改允许指定超出原始二进制选择的更多行为，添加 `MaxLengthEnforcement.truncateAfterCompositionEnds` 作为附加选项。


The following classes all have the same change of API:

以下类都具有相同的 API 更改：


- `TextField`

  `TextField`

- `TextFormField`

  `TextFormField`

- `CupertinoTextField`

  `CupertinoTextField`


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
const TextField textField = TextField(maxLengthEnforced: true);
const TextField textField = TextField(maxLengthEnforced: false);
final lengthEnforced = textField.maxLengthEnforced;

const TextFormField textFormField = TextFormField(maxLengthEnforced: true);
const TextFormField textFormField = TextFormField(maxLengthEnforced: false);
final lengthEnforced = textFormField.maxLengthEnforced;

const CupertinoTextField cupertinoTextField = CupertinoTextField(maxLengthEnforced: true);
const CupertinoTextField cupertinoTextField = CupertinoTextField(maxLengthEnforced: false);
final lengthEnforced = cupertinoTextField.maxLengthEnforced;
```

Code after migration:

迁移后的代码：


```dart
const TextField textField = TextField(maxLengthEnforcement: MaxLengthEnforcement.enforce);
const TextField textField = TextField(maxLengthEnforcement: MaxLengthEnforcement.none);
final lengthEnforced = textField.maxLengthEnforcement;

const TextFormField textFormField = TextFormField(maxLengthEnforcement: MaxLengthEnforcement.enforce);
const TextFormField textFormField = TextFormField(maxLengthEnforcement: MaxLengthEnforcement.none);
final lengthEnforced = textFormField.maxLengthEnforcement;

const CupertinoTextField cupertinoTextField = CupertinoTextField(maxLengthEnforcement: MaxLengthEnforcement.enforce);
const CupertinoTextField cupertinoTextField = CupertinoTextField(maxLengthEnforcement: MaxLengthEnforcement.none);
final lengthEnforced = cupertinoTextField.maxLengthEnforcement;
```

**References**

**参考**


API documentation:

API 文档：


* [`TextField`][]
* [`TextFormField`][]
* [`CupertinoTextField`][]

Relevant issues:

相关 issue：


* [Issue 67898]({{site.repo.flutter}}/issues/67898)

Relevant PRs:

相关 PR：


* Deprecated in [#68086]({{site.repo.flutter}}/pull/68086)

  已弃用于[#68086]({{site.repo.flutter}}/pull/68086)

* Removed in [#98539]({{site.repo.flutter}}/pull/98539)

  删除于[#98539]({{site.repo.flutter}}/pull/98539)


[In-depth migration guide available]: /release/breaking-changes/use-maxLengthEnforcement-instead-of-maxLengthEnforced
[`TextField`]: {{site.api}}/flutter/material/TextField-class.html
[`TextFormField`]: {{site.api}}/flutter/material/TextFormField-class.html
[`CupertinoTextField`]: {{site.api}}/flutter/cupertino/CupertinoTextField-class.html

---

### `VelocityTracker` constructor

### `VelocityTracker` 构造函数


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The default constructor for `VelocityTracker`was deprecated in v1.22.

`VelocityTracker` 的默认构造函数在 v1.22 中已弃用。


The `VelocityTracker.withKind()` should be used instead. This allows for a
`PointerDeviceKind` to be specified for the tracker. The previous default for
`VelocityTracker.kind` was `PointerDeviceKind.touch`.

应改用 `VelocityTracker.withKind()`。这允许为跟踪器指定 `PointerDeviceKind`。 `VelocityTracker.kind` 之前的默认值是 `PointerDeviceKind.touch`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
final VelocityTracker tracker = VelocityTracker();
```

Code after migration:

迁移后的代码：


```dart
final VelocityTracker tracker = VelocityTracker.withKind(PointerDeviceKind.touch);
```

**References**

**参考**


API documentation:

API 文档：


* [`VelocityTracker`][]
* [`PointerDeviceKind`][]

Relevant PRs:

相关 PR：


* Deprecated in [#66043]({{site.repo.flutter}}/pull/66043)

  已弃用于[#66043]({{site.repo.flutter}}/pull/66043)

* Removed in [#98541]({{site.repo.flutter}}/pull/98541)

  删除于[#98541]({{site.repo.flutter}}/pull/98541)


[`VelocityTracker`]: {{site.api}}/flutter/gestures/VelocityTracker-class.html
[`PointerDeviceKind`]: {{site.api}}/flutter/dart-ui/PointerDeviceKind.html

---

### `DayPicker` & `MonthPicker`

### `DayPicker` 和 `MonthPicker`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The `DayPicker` and `MonthPicker` widgets were first deprecated in v1.15, and
then extended in v1.26.

`DayPicker` 和 `MonthPicker` widget 首先在 v1.15 中弃用，然后在 v1.26 中扩展。


They have been replaced by one comprehensive widget, `CalendarDatePicker`.

它们已被一种全面的 widget、`CalendarDatePicker` 所取代。


These widgets were displayed using the `showDatePicker` method. This method was
migrated to present the new `CalendarDatePicker` before this release, and so
their final removal should not necessitate further action.

这些 widget 是使用 `showDatePicker` 方法显示的。此方法在此版本之前已迁移以呈现新的 `CalendarDatePicker`，因此最终删除它们不需要采取进一步的操作。


**References**

**参考**


Design document:

设计文档：


* [Material Date Picker Redesign][]

  [材料日期选择器重新设计][Material Date Picker Redesign]


API documentation:

API 文档：


* [`CalendarDatePicker`][]
* [`showDatePicker`][]

Relevant issues:

相关 issue：


* [Issue 50133]({{site.repo.flutter}}/issues/50133)

Relevant PRs:

相关 PR：


* Deprecated in [#50546]({{site.repo.flutter}}/issues/50546)

  已弃用于[#50546]({{site.repo.flutter}}/issues/50546)

* Removed in [#98543]({{site.repo.flutter}}/issues/98543)

  删除于[#98543]({{site.repo.flutter}}/issues/98543)


[Material Date Picker Redesign]: /go/material-date-picker-redesign
[`CalendarDatePicker`]: {{site.api}}/flutter/material/CalendarDatePicker-class.html
[`showDatePicker`]: {{site.api}}/flutter/material/showDatePicker.html

---

### `FlatButton`, `RaisedButton`, & `OutlineButton`

### `FlatButton`、`RaisedButton` 和 `OutlineButton`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The `FlatButton`, `RaisedButton`, and `OutlineButton` widgets were first
deprecated in v1.20, and then extended in v1.26.

`FlatButton`、`RaisedButton` 和 `OutlineButton` widgets 首先在 v1.20 中弃用，然后在 v1.26 中扩展。


They are replaced by new buttons, `TextButton`, `ElevatedButton`, and
`OutlinedButton`. These new widgets also use new associated themes, rather than
the generic `ButtonTheme`.

它们被新按钮 `TextButton`、`ElevatedButton` 和 `OutlinedButton` 取代。这些新的 widget 还使用新的关联主题，而不是通用的 `ButtonTheme`。


| <t>Old Widget</t><t>旧 Widget</t> | <t>Old Theme</t><t>旧主题</t> | <t>New Widget</t><t>新Widget</t> | <t>New Theme</t><t>新主题</t> |
|-----------------|---------------|------------------|-----------------------|
| `FlatButton`    | `ButtonTheme` | `TextButton`     | `TextButtonTheme`     |
| `RaisedButton`  | `ButtonTheme` | `ElevatedButton` | `ElevatedButtonTheme` |
| `OutlineButton` | `ButtonTheme` | `OutlinedButton` | `OutlinedButtonTheme` |

{:.table .table-striped .nowrap}

**Migration guide**

**迁移指南**


[In-depth migration guide available for detailed styling][]

Code before migration:

迁移前的代码：


```dart
FlatButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);

RaisedButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);

OutlineButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);
```

Code after migration:

迁移后的代码：


```dart
TextButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);

ElevatedButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);

OutlinedButton(
  onPressed: onPressed,
  child: Text('Button'),
  // ...
);
```

**References**

**参考**


Design document:

设计文档：


* [New Material buttons and themes][]

  [新材质按钮和主题][New Material buttons and themes]


API documentation:

API 文档：


* [`ButtonStyle`][]
* [`ButtonStyleButton`][]
* [`ElevatedButton`][]
* [`ElevatedButtonTheme`][]
* [`ElevatedButtonThemeData`][]
* [`OutlinedButton`][]
* [`OutlinedButtonTheme`][]
* [`OutlinedButtonThemeData`][]
* [`TextButton`][]
* [`TextButtonTheme`][]
* [`TextButtonThemeData`][]

Relevant PRs:

相关 PR：


* New API added in [#59702]({{site.repo.flutter}}/issues/59702)

  添加了新的 API [#59702]({{site.repo.flutter}}/issues/59702)

* Deprecated in [#73352]({{site.repo.flutter}}/issues/73352)

  已弃用于[#73352]({{site.repo.flutter}}/issues/73352)

* Removed in [#98546]({{site.repo.flutter}}/issues/98546)

  删除于[#98546]({{site.repo.flutter}}/issues/98546)


[In-depth migration guide available for detailed styling]: /release/breaking-changes/buttons
[New Material buttons and themes]: /go/material-button-migration-guide
[`ButtonStyle`]: {{site.api}}/flutter/material/ButtonStyle-class.html
[`ButtonStyleButton`]: {{site.api}}/flutter/material/ButtonStyleButton-class.html
[`ElevatedButton`]: {{site.api}}/flutter/material/ElevatedButton-class.html
[`ElevatedButtonTheme`]: {{site.api}}/flutter/material/ElevatedButtonTheme-class.html
[`ElevatedButtonThemeData`]: {{site.api}}/flutter/material/ElevatedButtonThemeData-class.html
[`OutlinedButton`]: {{site.api}}/flutter/material/OutlinedButton-class.html
[`OutlinedButtonTheme`]: {{site.api}}/flutter/material/OutlinedButtonTheme-class.html
[`OutlinedButtonThemeData`]: {{site.api}}/flutter/material/OutlinedButtonThemeData-class.html
[`TextButton`]: {{site.api}}/flutter/material/TextButton-class.html
[`TextButtonTheme`]: {{site.api}}/flutter/material/TextButtonTheme-class.html
[`TextButtonThemeData`]: {{site.api}}/flutter/material/TextButtonThemeData-class.html

---

### `Scaffold` `SnackBar` methods

### `Scaffold` `SnackBar` 方法


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The following `Scaffold` `SnackBar` methods were deprecated in v1.23.

以下 `Scaffold` `SnackBar` 方法在 v1.23 中已弃用。


- `showSnackBar`

  `showSnackBar`

- `removeCurrentSnackBar`

  `removeCurrentSnackBar`

- `hideCurrentSnackBar`

  `hideCurrentSnackBar`


The same named methods of the `ScaffoldMessenger` should be used instead. A
default `ScaffoldMessenger` is already created in every `MaterialApp`.

应改用 `ScaffoldMessenger` 的相同命名方法。每个 `MaterialApp` 中已创建默认的 `ScaffoldMessenger`。


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
Scaffold.of(context).showSnackBar(mySnackBar);
Scaffold.of(context).removeCurrentSnackBar(mySnackBar);
Scaffold.of(context).hideCurrentSnackBar(mySnackBar);
```

Code after migration:

迁移后的代码：


```dart
ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
ScaffoldMessenger.of(context).removeCurrentSnackBar(mySnackBar);
ScaffoldMessenger.of(context).hideCurrentSnackBar(mySnackBar);
```

**References**

**参考**


Design document:

设计文档：

* [ScaffoldMessenger Design][]

  [脚手架信使设计][ScaffoldMessenger Design]


Video content:

视频内容：


* [SnackBar Delivery][]

  [小吃店配送][SnackBar Delivery]

* [Widget of the Week][]

  [本周Widget][Widget of the Week]


API documentation:

API 文档：


* [`ScaffoldMessenger`][]
* [`SnackBar`][]

Relevant issues:

相关 issue：


* [Issue 57218]({{site.repo.flutter}}/issues/57218)
* [Issue 62921]({{site.repo.flutter}}/issues/62921)

Relevant PRs:

相关 PR：


* New API added in [#64101]({{site.repo.flutter}}/issues/64101)

  添加了新的 API [#64101]({{site.repo.flutter}}/issues/64101)

* Deprecated in [#67947]({{site.repo.flutter}}/issues/67947)

  已弃用于[#67947]({{site.repo.flutter}}/issues/67947)

* Removed in [#98549]({{site.repo.flutter}}/issues/98549)

  删除于[#98549]({{site.repo.flutter}}/issues/98549)


[In-depth migration guide available]: /release/breaking-changes/scaffold-messenger
[ScaffoldMessenger Design]: /go/scaffold-messenger
[SnackBar Delivery]: https://youtu.be/sYG7HAGu_Eg?t=10271
[Widget of the Week]: https://youtu.be/lytQi-slT5Y
[`ScaffoldMessenger`]: {{site.api}}/flutter/material/ScaffoldMessenger-class.html
[`SnackBar`]: {{site.api}}/flutter/material/SnackBar-class.html

---

### `RectangularSliderTrackShape.disabledThumbGapWidth`

### `RectangularSliderTrackShape.disabledThumbGapWidth`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The `RectangularSliderTrackShape.disabledThumbGapWidth` was first deprecated in
v1.5, and then extended in v1.26.

`RectangularSliderTrackShape.disabledThumbGapWidth` 首先在 v1.5 中被弃用，然后在 v1.26 中扩展。


This was no longer used by the framework, as the animation of the slider thumb
no longer occurs when disabled.

框架不再使用它，因为禁用时滑块拇指的动画不再出现。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
RectangularSliderTrackShape(disabledThumbGapWidth: 2.0);
```

Code after migration:

迁移后的代码：


```dart
RectangularSliderTrackShape();
```

**References**

**参考**


API documentation:

API 文档：

* [`RectangularSliderTrackShape`][]

Relevant PRs:

相关 PR：

* Animation changed in [#30390]({{site.repo.flutter}}/issues/30390)

  动画更改于[#30390]({{site.repo.flutter}}/issues/30390)

* Deprecated in [#65246]({{site.repo.flutter}}/issues/65246)

  已弃用于[#65246]({{site.repo.flutter}}/issues/65246)

* Removed in [#98613]({{site.repo.flutter}}/issues/98613)

  删除于[#98613]({{site.repo.flutter}}/issues/98613)


[`RectangularSliderTrackShape`]: {{site.api}}/flutter/material/RectangularSliderTrackShape-class.html

---

### Text selection of `ThemeData` to `TextSelectionThemeData`

### 文本选择 `ThemeData` 到 `TextSelectionThemeData`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The following `ThemeData` members were first deprecated in v1.23, and extended
in v1.26.

以下 `ThemeData` 成员首先在 v1.23 中弃用，并在 v1.26 中扩展。


- `useTextSelectionTheme`

  `useTextSelectionTheme`

- `textSelectionColor`

  `textSelectionColor`

- `cursorColor`

  `cursorColor`

- `textSelectionHandleColor`

  `textSelectionHandleColor`


These should be replaced by a more comprehensive `TextSelectionThemeData`,
which is now specified in `ThemeData` itself.

这些应该被更全面的 `TextSelectionThemeData` 取代，它现在在 `ThemeData` 本身中指定。


The `useTextSelectionTheme` flag served as a temporary migration flag to
distinguish the two APIs, it can be removed now.

`useTextSelectionTheme` 标志作为临时迁移标志来区分这两个 API，现在可以将其删除。


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
ThemeData(
  useTextSelectionTheme: false,
  textSelectionColor: Colors.blue,
  cursorColor: Colors.green,
  textSelectionHandleColor: Colors.red,
);
```

Code after migration:

迁移后的代码：


```dart
ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blue,
    cursorColor: Colors.green,
    selectionHandleColor: Colors.red,
  ),
);
```

**References**

**参考**


Design document:

设计文档：


* [Text Selection Theme][]

  [文本选择主题][Text Selection Theme]


API documentation:

API 文档：


* [`ThemeData`][]
* [`TextSelectionThemeData`][]

Relevant issues:

相关 issue：


* [Issue 17635]({{site.repo.flutter}}/issues/17635)
* [Issue 56082]({{site.repo.flutter}}/issues/56082)
* [Issue 61227]({{site.repo.flutter}}/issues/61227)

Relevant PRs:

相关 PR：


* New API added in [#62014]({{site.repo.flutter}}/issues/62014)

  添加了新的 API [#62014]({{site.repo.flutter}}/issues/62014)

* Deprecated in [#66485]({{site.repo.flutter}}/issues/66482)

  已弃用于[#66485]({{site.repo.flutter}}/issues/66482)

* Removed in [#98578]({{site.repo.flutter}}/issues/98578)

  删除于[#98578]({{site.repo.flutter}}/issues/98578)


[In-depth migration guide available]: /release/breaking-changes/text-selection-theme
[Text Selection Theme]: /go/text-selection-theme
[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html
[`TextSelectionThemeData`]: {{site.api}}/flutter/material/TextSelectionThemeData-class.html

---

### `RenderEditable.onSelectionChanged` to `TextSelectionDelegate.textEditingValue`

### `RenderEditable.onSelectionChanged` 至 `TextSelectionDelegate.textEditingValue`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


`RenderEditable.onSelectionChanged` and `TextSelectionDelegate.textEditingValue`
were deprecated in v1.26.

`RenderEditable.onSelectionChanged` 和 `TextSelectionDelegate.textEditingValue` 在 v1.26 中已弃用。


Instead of calling one or both of these methods, call
`TextSelectionDelegate.userUpdateTextEditingValue`. This fixed a bug where the
`TextInputFormatter` would receive the wrong selection value.

不要调用其中一个或两个方法，而是调用 `TextSelectionDelegate.userUpdateTextEditingValue`。这修复了 `TextInputFormatter` 会收到错误选择值的错误。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
renderEditable.onSelectionChanged(selection, renderObject, cause);
textSelectionDelegate.textEditingValue = value;
```

Code after migration:

迁移后的代码：


```dart
textSelectionDelegate.userUpdateTextEditingValue(value, cause);
```

**References**

**参考**


API documentation:

API 文档：


* [`RenderEditable`][]
* [`TextSelectionDelegate`][]

Relevant issues:

相关 issue：


* Resolved [#75505]({{site.repo.flutter}}/issues/75502)

  已解决[#75505]({{site.repo.flutter}}/issues/75502)


Relevant PRs:

相关 PR：


* Deprecated in [#75541]({{site.repo.flutter}}/issues/75541)

  已弃用于[#75541]({{site.repo.flutter}}/issues/75541)

* Removed in [#98582]({{site.repo.flutter}}/issues/98582)

  删除于[#98582]({{site.repo.flutter}}/issues/98582)


[`RenderEditable`]: {{site.api}}/flutter/rendering/RenderEditable-class.html
[`TextSelectionDelegate`]: {{site.api}}/flutter/services/TextSelectionDelegate-mixin.html

---

### `Stack.overflow`

### `Stack.overflow`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


`Stack.overflow`, as well as the `Overflow` enum were deprecated in v1.22.

`Stack.overflow` 以及 `Overflow` 枚举在 v1.22 中已弃用。


The replacement is `Stack.clipBehavior`, a change made as part of unifying clip
behaviors and semantics across the framework. Where `Overflow.visible` was used,
use `Clip.none`. Where `Overflow.clip` was used, use `Clip.hardEdge`.

替代品是 `Stack.clipBehavior`，这是统一整个框架的剪辑行为和语义的一部分而进行的更改。在使用 `Overflow.visible` 的地方，使用 `Clip.none`。在使用 `Overflow.clip` 的地方，使用 `Clip.hardEdge`。


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
const Stack stack = Stack(overflow: Overflow.visible);
const Stack stack = Stack(overflow: Overflow.clip);
```

Code after migration:

迁移后的代码：


```dart
const Stack stack = Stack(clipBehavior: Clip.none);
const Stack stack = Stack(clipBehavior: Clip.hardEdge);
```

**References**

**参考**


API documentation:

API 文档：


* [`Stack`][]
* [`Clip`][]

Relevant issues:

相关 issue：


* Resolved [#66030]({{site.repo.flutter}}/issues/66030)

  已解决[#66030]({{site.repo.flutter}}/issues/66030)


Relevant PRs:

相关 PR：


* Deprecated in [#66305]({{site.repo.flutter}}/issues/66305)

  已弃用于[#66305]({{site.repo.flutter}}/issues/66305)

* Removed in [#98583]({{site.repo.flutter}}/issues/98583)

  删除于[#98583]({{site.repo.flutter}}/issues/98583)


[In-depth migration guide available]: /release/breaking-changes/clip-behavior
[`Stack`]: {{site.api}}/flutter/widgets/Stack-class.html
[`Clip`]: {{site.api}}/flutter/dart-ui/Clip.html

---

### `UpdateLiveRegionEvent`

### `UpdateLiveRegionEvent`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The `SemanticsEvent` `UpdateLiveRegionEvent`, was first deprecated in v1.12, and
then extended in v1.26.

`SemanticsEvent` `UpdateLiveRegionEvent` 首先在 v1.12 中弃用，然后在 v1.26 中扩展。


This was never implemented by the framework, and any references should be
removed.

框架从未实现过这一点，因此应删除任何引用。


**References**

**参考**


API documentation:

API 文档：


* [`SemanticsEvent`][]

Relevant PRs:

相关 PR：


* Deprecated in [#45940]({{site.repo.flutter}}/issues/45940)

  已弃用于[#45940]({{site.repo.flutter}}/issues/45940)

* Removed in [#98615]({{site.repo.flutter}}/issues/98615)

  删除于[#98615]({{site.repo.flutter}}/issues/98615)


[`SemanticsEvent`]: {{site.api}}/flutter/semantics/SemanticsEvent-class.html

---

### `RenderObjectElement` methods

### `RenderObjectElement` 方法


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The following `RenderObjectElement` methods were deprecated in v1.21.

以下 `RenderObjectElement` 方法在 v1.21 中已弃用。


- `insertChildRenderObject`

  `insertChildRenderObject`

- `moveChildRenderObject`

  `moveChildRenderObject`

- `removeChildRenderObject`

  `removeChildRenderObject`


These methods are replaced, respectively, by:

这些方法分别替换为：


- `insertRenderObjectChild`

  `insertRenderObjectChild`

- `moveRenderObjectChild`

  `moveRenderObjectChild`

- `removeRenderObjectChild`

  `removeRenderObjectChild`


These changes were made as a soft breaking deprecation in order to change the
function signature.

这些更改是为了更改函数签名而进行的软中断弃用。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
element.insertChildRenderObject(child, slot);
element.moveChildRenderObject(child, slot);
element.removeChildRenderObject(child);
```

Code after migration:

迁移后的代码：


```dart
element.insertRenderObjectChild(child, slot);
element.moveRenderObjectChild(child, oldSlot, newSlot);
element.removeRenderObjectChild(child, slot);
```

**References**

**参考**


API documentation:

API 文档：


* [`RenderObjectElement`][]

Relevant issues:

相关 issue：


* [Issue 63269]({{site.repo.flutter}}/issues/63269)

Relevant PRs:

相关 PR：


* Deprecated in [#64254]({{site.repo.flutter}}/issues/64254)

  已弃用于[#64254]({{site.repo.flutter}}/issues/64254)

* Removed in [#98616]({{site.repo.flutter}}/issues/98616)

  删除于[#98616]({{site.repo.flutter}}/issues/98616)


[`RenderObjectElement`]: {{site.api}}/flutter/widgets/RenderObjectElement-class.html

---

## Timeline

## 时间线


In stable release: 3.0.0
稳定版本：3.0.0
