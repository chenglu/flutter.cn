---
# title: Deprecate textScaleFactor in favor of TextScaler
# description: >-
#   The new class, TextScaler, replaces the textScaleFactor scalar in
#   preparation for Android 14 nonlinear text scaling support.
title: 弃用 textScaleFactor，改用 TextScaler
description: 新类 TextScaler 取代 textScaleFactor 标量，为 Android 14 非线性文本缩放做准备。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

In preparation for adopting the [Android 14 nonlinear font scaling][] feature,
all occurrences of `textScaleFactor` in the Flutter framework have been
deprecated and replaced by `TextScaler`.

为采用 [Android 14 非线性字体缩放][Android 14 nonlinear font scaling] 功能做准备，
Flutter 框架中所有 `textScaleFactor` 的出现
已被弃用并由 `TextScaler` 取代。

## Context

## 背景

Many platforms allow users to scale textual contents up or down globally in
system preferences. In the past, the scaling strategy was captured as a single
`double` value named `textScaleFactor`, as text scaling was proportional:
`scaledFontSize = textScaleFactor x unScaledFontSize`. For example, when
`textScaleFactor` is 2.0 and the developer-specified font size is 14.0, the
actual font size is 2.0 x 14.0 = 28.0.

许多平台允许用户在系统偏好设置中全局放大或缩小文本内容。
过去，缩放策略以名为 `textScaleFactor` 的单个 `double` 值表示，
因为文本缩放是成比例的：
`scaledFontSize = textScaleFactor x unScaledFontSize`。例如，当
`textScaleFactor` 为 2.0 且开发者指定的字体大小为 14.0 时，
实际字体大小为 2.0 x 14.0 = 28.0。

With the introduction of [Android 14 nonlinear font scaling][], larger text gets
scaled at a lesser rate as compared to smaller text, to prevent excessive scaling
of text that is already large. The `textScaleFactor` scalar value used by
"proportional" scaling is not enough to represent this new scaling strategy.
The [Replaces `textScaleFactor` with `TextScaler`][] pull request introduced a
new class `TextScaler` to replace `textScaleFactor` in preparation for this new
feature. Nonlinear text scaling is introduced in a different pull request.

随着 [Android 14 非线性字体缩放][Android 14 nonlinear font scaling] 的引入，
较大文本的缩放速率比较小的文本更低，
以防止已经较大的文本被过度缩放。
"成比例"缩放使用的 `textScaleFactor` 标量值
不足以表示这一新的缩放策略。
[用 `TextScaler` 取代 `textScaleFactor`][Replaces `textScaleFactor` with `TextScaler`] PR 引入了
新类 `TextScaler` 以取代 `textScaleFactor`，为这一新功能做准备。
非线性文本缩放在另一个 PR 中引入。

## Description of change

## 变更说明

Introducing a new interface `TextScaler`, which
represents a text scaling strategy.

引入新接口 `TextScaler`，
表示文本缩放策略。

```dart
abstract class TextScaler {
  double scale(double fontSize);
  double get textScaleFactor; // Deprecated.
}
```

Use the `scale` method to scale font sizes instead of `textScaleFactor`.
The `textScaleFactor` getter provides an estimated `textScaleFactor` value, it
is for backward compatibility purposes and is already marked as deprecated, and
will be removed in a future version of Flutter.

使用 `scale` 方法缩放字体大小，而非 `textScaleFactor`。
`textScaleFactor` getter 提供估计的 `textScaleFactor` 值，
用于向后兼容，已标记为弃用，
并将在未来版本的 Flutter 中移除。

The new class has replaced
`double textScaleFactor` (`double textScaleFactor` -> `TextScaler textScaler`),
in the following APIs:

新类已取代
`double textScaleFactor`（`double textScaleFactor` -> `TextScaler textScaler`），
在以下 API 中：

### Painting library

### Painting 库

| Affected APIs                                                                     | Error Message                                          |
|-----------------------------------------------------------------------------------|--------------------------------------------------------|
| `InlineSpan.build({ double textScaleFactor = 1.0 })` argument                     | The named parameter 'textScaleFactor' isn't defined.   |
| `TextStyle.getParagraphStyle({ double TextScaleFactor = 1.0 })` argument          | The named parameter 'textScaleFactor' isn't defined.   |
| `TextStyle.getTextStyle({ double TextScaleFactor = 1.0 })`  argument              | 'textScaleFactor' is deprecated and shouldn't be used. |
| `TextPainter({ double TextScaleFactor = 1.0 })` constructor argument              | 'textScaleFactor' is deprecated and shouldn't be used. |
| `TextPainter.textScaleFactor` getter and setter                                   | 'textScaleFactor' is deprecated and shouldn't be used. |
| `TextPainter.computeWidth({ double TextScaleFactor = 1.0 })` argument             | 'textScaleFactor' is deprecated and shouldn't be used. |
| `TextPainter.computeMaxIntrinsicWidth({ double TextScaleFactor = 1.0 })` argument | 'textScaleFactor' is deprecated and shouldn't be used. |

### Rendering library

### Rendering 库

| Affected APIs                                                            | Error Message                                          |
|--------------------------------------------------------------------------|--------------------------------------------------------|
| `RenderEditable({ double TextScaleFactor = 1.0 })` constructor argument  | 'textScaleFactor' is deprecated and shouldn't be used. |
| `RenderEditable.textScaleFactor` getter and setter                       | 'textScaleFactor' is deprecated and shouldn't be used. |
| `RenderParagraph({ double TextScaleFactor = 1.0 })` constructor argument | 'textScaleFactor' is deprecated and shouldn't be used. |
| `RenderParagraph.textScaleFactor` getter and setter                      | 'textScaleFactor' is deprecated and shouldn't be used. |

### Widgets library

### Widgets 库

| Affected APIs                                                           | Error Message                                                 |
|-------------------------------------------------------------------------|---------------------------------------------------------------|
| `MediaQueryData({ double TextScaleFactor = 1.0 })` constructor argument | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `MediaQueryData.textScaleFactor` getter                                 | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `MediaQueryData.copyWith({ double? TextScaleFactor })` argument         | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `MediaQuery.maybeTextScaleFactorOf(BuildContext context)` static method | 'maybeTextScaleFactorOf' is deprecated and shouldn't be used. |
| `MediaQuery.textScaleFactorOf(BuildContext context)` static method      | 'textScaleFactorOf' is deprecated and shouldn't be used.      |
| `RichText({ double TextScaleFactor = 1.0 })` constructor argument       | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `RichText.textScaleFactor` getter                                       | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `Text({ double? TextScaleFactor = 1.0 })` constructor argument          | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `Text.rich({ double? TextScaleFactor = 1.0 })` constructor argument     | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `Text.textScaleFactor` getter                                           | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `EditableText({ double? TextScaleFactor = 1.0 })` constructor argument  | 'textScaleFactor' is deprecated and shouldn't be used.        |
| `EditableText.textScaleFactor` getter                                   | 'textScaleFactor' is deprecated and shouldn't be used.        |

### Material library

### Material 库

| Affected APIs                                                                 | Error Message                                          |
|-------------------------------------------------------------------------------|--------------------------------------------------------|
| `SelectableText({ double? TextScaleFactor = 1.0 })` constructor argument      | 'textScaleFactor' is deprecated and shouldn't be used. |
| `SelectableText.rich({ double? TextScaleFactor = 1.0 })` constructor argument | 'textScaleFactor' is deprecated and shouldn't be used. |
| `SelectableText.textScaleFactor` getter                                       | 'textScaleFactor' is deprecated and shouldn't be used. |

## Migration guide

## 迁移指南

Widgets provided by the Flutter framework are already migrated.
Migration is needed only if you're using any of the
deprecated symbols listed in the previous tables.

Flutter 框架提供的 widget 已迁移。
仅当你使用前面表格中列出的任何已弃用符号时才需要迁移。

### Migrating your APIs that expose `textScaleFactor`

### 迁移暴露 `textScaleFactor` 的 API

Before:

迁移前：

```dart
abstract class _MyCustomPaintDelegate {
  void paint(PaintingContext context, Offset offset, double textScaleFactor) {
  }
}
```

After:

迁移后：

```dart
abstract class _MyCustomPaintDelegate {
  void paint(PaintingContext context, Offset offset, TextScaler textScaler) {
  }
}
```

### Migrating code that consumes `textScaleFactor`

### 迁移消费 `textScaleFactor` 的代码

If you're not currently using `textScaleFactor` directly, but rather passing it
to a different API that receives a `textScaleFactor`, and the receiver API has
already been migrated, then it's relatively straightforward:

如果你当前未直接使用 `textScaleFactor`，而是将其传递给
接收 `textScaleFactor` 的不同 API，且接收方 API 已迁移，
则相对简单：

Before:

迁移前：

```dart
RichText(
  textScaleFactor: MediaQuery.textScaleFactorOf(context),
  ...
)
```

After:

迁移后：

```dart
RichText(
  textScaler: MediaQuery.textScalerOf(context),
  ...
)
```

If the API that provides `textScaleFactor` hasn't been migrated, consider
waiting for the migrated version.

如果提供 `textScaleFactor` 的 API 尚未迁移，
请考虑等待迁移后的版本。

If you wish to compute the scaled font size yourself, use `TextScaler.scale`
instead of the `*` binary operator:

如果你希望自行计算缩放后的字体大小，请使用 `TextScaler.scale`
而非 `*` 二元运算符：

Before:

迁移前：

```dart
final scaledFontSize = textStyle.fontSize * MediaQuery.textScaleFactorOf(context);
```

After:

迁移后：

```dart
final scaledFontSize = MediaQuery.textScalerOf(context).scale(textStyle.fontSize);
```

If you are using `textScaleFactor` to scale dimensions that are not font sizes,
there are no generic rules for migrating the code to nonlinear scaling, and it
might require the UI to be implemented differently.
Reusing the `MyTooltipBox`example:

如果你使用 `textScaleFactor` 缩放非字体大小的尺寸，
没有通用的规则将代码迁移到非线性缩放，
可能需要以不同方式实现 UI。
复用 `MyTooltipBox` 示例：

```dart
MyTooltipBox(
  size: chatBoxSize * textScaleFactor,
  child: RichText(..., style: TextStyle(fontSize: 20)),
)
```

You could choose to use the "effective" text scale factor by applying the
`TextScaler` on the font size 20: `chatBoxSize * textScaler.scale(20) / 20`, or
redesign the UI and let the widget assume its own intrinsic size.

你可以选择通过对字体大小 20 应用 `TextScaler` 使用"有效"文本缩放因子：
`chatBoxSize * textScaler.scale(20) / 20`，
或重新设计 UI 让 widget 采用其自身的固有大小。

### Overriding the text scaling strategy in a widget subtree

### 在 widget 子树中覆盖文本缩放策略

To override the existing `TextScaler` used in a widget subtree, override
the `MediaQuery` like so:

要覆盖 widget 子树中使用的现有 `TextScaler`，
像这样覆盖 `MediaQuery`：

Before:

迁移前：

```dart
MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaleFactor: 2.0),
  child: child,
)
```

After:

迁移后：

```dart
MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaler: _myCustomTextScaler),
  child: child,
)
```

However, it's rarely needed to create a custom `TextScaler` subclass.
`MediaQuery.withNoTextScaling` (which creates a widget that disables text scaling
altogether for its child subtree), and `MediaQuery.withClampedTextScaling` (which
creates a widget that restricts the scaled font size to within the range
`[minScaleFactor * fontSize, maxScaleFactor * fontSize]`), are convenience methods
that cover common cases where the text scaling strategy needs to be overridden.

然而，很少需要创建自定义 `TextScaler` 子类。
`MediaQuery.withNoTextScaling`（创建完全禁用其子树文本缩放的 widget）
和 `MediaQuery.withClampedTextScaling`（创建将缩放字体大小限制在
`[minScaleFactor * fontSize, maxScaleFactor * fontSize]` 范围内的 widget）
是涵盖需要覆盖文本缩放策略的常见情况的便捷方法。

#### Examples

#### 示例

**Disabling Text Scaling For Icon Fonts**

**禁用图标字体的文本缩放**

Before:

迁移前：

```dart
MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
  child: IconTheme(
    data: ..,
    child: icon,
  ),
)
```

After:

迁移后：

```dart
MediaQuery.withNoTextScaling(
  child: IconTheme(
    data: ...
    child: icon,
  ),
)
```

**Preventing Contents From Overscaling**

**防止内容过度缩放**

Before:

迁移前：

```dart
final mediaQueryData = MediaQuery.of(context);
MediaQuery(
  data: mediaQueryData.copyWith(textScaleFactor: math.min(mediaQueryData.textScaleFactor, _kMaxTitleTextScaleFactor),
  child: child,
)
```

After:

迁移后：

```dart
MediaQuery.withClampedTextScaling(
  maxScaleFactor: _kMaxTitleTextScaleFactor,
  child: title,
)
```

**Disabling Nonlinear Text Scaling**

**禁用非线性文本缩放**

If you want to temporarily opt-out of nonlinear text scaling on Android 14 until
your app is fully migrated, put a modified `MediaQuery` at the top of your app's
widget tree:

如果你想在应用完全迁移之前临时退出 Android 14 的非线性文本缩放，
在应用 widget 树顶部放置修改后的 `MediaQuery`：

```dart
runApp(
  Builder(builder: (context) {
    final mediaQueryData = MediaQuery.of(context);
    final mediaQueryDataWithLinearTextScaling = mediaQueryData
      .copyWith(textScaler: TextScaler.linear(mediaQueryData.textScaler.textScaleFactor));
    return MediaQuery(data: mediaQueryDataWithLinearTextScaling, child: realWidgetTree);
  }),
);
```

This trick uses the deprecated `textScaleFactor` API and will stop working once
it's removed from the Flutter API.

此技巧使用已弃用的 `textScaleFactor` API，
一旦从 Flutter API 中移除后将停止工作。

## Timeline

## 时间线

合入版本： 3.13.0-4.0.pre<br>
稳定版发布： 3.16

## References

## 参考资料

API documentation:

API 文档：

* [`TextScaler`][]
* [`MediaQuery.textScalerOf`][]
* [`MediaQuery.maybeTextScalerOf`][]
* [`MediaQuery.withNoTextScaling`][]
* [`MediaQuery.withClampedTextScaling`][]

Relevant issues:

相关 issue：

* [New font scaling system (Issue 116231)][]

* [新字体缩放系统（Issue 116231）][New font scaling system (Issue 116231)]

Relevant PRs:

相关 PR：

* [Replaces `textScaleFactor` with `TextScaler`][]

* [用 `TextScaler` 取代 `textScaleFactor`][Replaces `textScaleFactor` with `TextScaler`]


[Android 14 nonlinear font scaling]: {{site.android-dev}}/about/versions/14/features#non-linear-font-scaling
[`TextScaler`]: {{site.api}}/flutter/painting/TextScaler-class.html
[`MediaQuery.textScalerOf`]: {{site.api}}/flutter/widgets/MediaQuery/textScalerOf.html
[`MediaQuery.maybeTextScalerOf`]: {{site.api}}/flutter/widgets/MediaQuery/maybeTextScalerOf.html
[`MediaQuery.withNoTextScaling`]: {{site.api}}/flutter/widgets/MediaQuery/withNoTextScaling.html
[`MediaQuery.withClampedTextScaling`]: {{site.api}}/flutter/widgets/MediaQuery/withClampedTextScaling.html

[New font scaling system (Issue 116231)]: {{site.repo.flutter}}/issues/116231
[Replaces `textScaleFactor` with `TextScaler`]: {{site.repo.flutter}}/pull/128522
