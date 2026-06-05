---
# title: Material Chip button semantics
title: Material Chip 按钮语义
# description: Interactive Material Chips are now semantically marked as buttons.
description: 交互式 Material Chip 现在在语义上被标记为按钮。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Flutter now applies the semantic label of `button` to
all interactive [Material Chips][] for accessibility purposes.

Flutter 现在为无障碍目的将所有交互式 [Material Chips][] 应用 `button` 语义标签。

## Context

## 背景

Interactive Material Chips (namely [`ActionChip`][],
[`ChoiceChip`][], [`FilterChip`][], and [`InputChip`][])
are now semantically marked as being buttons.
However, the non-interactive information [`Chip`][] is not.

交互式 Material Chip（即 [`ActionChip`][]、
[`ChoiceChip`][]、[`FilterChip`][] 和 [`InputChip`][]）
现在在语义上被标记为按钮。
然而，非交互式信息 [`Chip`][] 则不是。

Marking Chips as buttons helps accessibility tools,
search engines, and other semantic analysis software
understand the meaning of an app. For example, it
allows screen readers (such as TalkBack on Android
and VoiceOver on iOS) to announce a tappable Chip
as a "button", which can assist users in navigating
your app. Prior to this change, users of accessibility
tools may have had a subpar experience,
unless you implemented a workaround by manually adding the
missing semantics to the Chip widgets in your app.

将 Chip 标记为按钮有助于无障碍工具、
搜索引擎和其他语义分析软件理解应用的含义。
例如，它让屏幕阅读器（如 Android 上的 TalkBack
和 iOS 上的 VoiceOver）将可点击的 Chip 播报为"按钮"，
可以帮助用户导航你的应用。在此变更之前，
无障碍工具用户可能体验不佳，
除非你通过手动为应用中的 Chip widget 添加缺失的语义来实现变通方案。

## Description of change

## 变更说明

The outermost [`Semantics`][] widget that wraps all
Chip classes to describe their semantic properties
is modified.

包裹所有 Chip 类以描述其语义属性的最外层 [`Semantics`][] widget 已修改。

The following changes apply to
[`ActionChip`][], [`ChoiceChip`][], [`FilterChip`][],
and [`InputChip`][]:

以下变更适用于
[`ActionChip`][]、[`ChoiceChip`][]、[`FilterChip`][] 和 [`InputChip`][]：

* The [`button`][`SemanticsProperties.button`] property
  is set to `true`.
* The [`enabled`][`SemanticsProperties.enabled`] property
  reflects whether the Chip is _currently_ tappable
  (by having a callback set).

* [`button`][`SemanticsProperties.button`] 属性设为 `true`。
* [`enabled`][`SemanticsProperties.enabled`] 属性反映 Chip _当前_ 是否可点击
  （通过是否设置了回调）。

These property changes bring interactive Chips' semantic
behavior in-line with that of other [Material Buttons][].

这些属性变更使交互式 Chip 的语义行为
与其他 [Material 按钮][Material Buttons] 保持一致。

For the non-interactive information [`Chip`][]:

对于非交互式信息 [`Chip`][]：

* The [`button`][`SemanticsProperties.button`] property
  is set to `false`.
* The [`enabled`][`SemanticsProperties.enabled`] property
  is set to `null`.

* [`button`][`SemanticsProperties.button`] 属性设为 `false`。
* [`enabled`][`SemanticsProperties.enabled`] 属性设为 `null`。

## Migration guide

## 迁移指南

**You might not need to perform any migration.**
This change only affects you if you worked around
the issue of Material Chips missing `button` semantics by
wrapping the widget given to the `label` field of a
`Chip` with a `Semantics` widget marked as
`button: true`. **In this case, the inner and outer `button`
semantics conflict, resulting in the tappable area
of the button shrinking down to the size of the label
after this change is introduced.** Fix this issue
either by deleting that `Semantics` widget and replacing
it with its child, or by removing the `button: true`
property if other semantic properties still
need to be applied to the `label` widget of the Chip.

**你可能不需要执行任何迁移。**
此变更仅在你通过将 `Chip` 的 `label` 字段提供的 widget
包裹在标记为 `button: true` 的 `Semantics` widget 中
来解决 Material Chip 缺少 `button` 语义的问题时影响你。
**在这种情况下，内外 `button` 语义冲突，
导致此变更引入后按钮的可点击区域缩小到标签大小。**
通过删除该 `Semantics` widget 并用其子组件替换，
或如果仍需将其他语义属性应用于 Chip 的 `label` widget 则移除 `button: true` 属性来修复此问题。

The following snippets use [`InputChip`][] as an example,
but the same process applies to [`ActionChip`][],
[`ChoiceChip`][], and [`FilterChip`][] as well.

以下代码片段以 [`InputChip`][] 为例，
但相同流程也适用于 [`ActionChip`][]、
[`ChoiceChip`][] 和 [`FilterChip`][]。

**Case 1: Remove the `Semantics` widget.**

**情况 1：移除 `Semantics` widget。**

Code before migration:

迁移前的代码：

```dart
Widget myInputChip = InputChip(
  onPressed: () {},
  label: Semantics(
    button: true,
    child: Text('My Input Chip'),
  ),
);
```

Code after migration:

迁移后的代码：

```dart
Widget myInputChip = InputChip(
  onPressed: () {},
  label: Text('My Input Chip'),
);
```

**Case 2: Remove `button:true` from the `Semantics` widget.**

**情况 2：从 `Semantics` widget 中移除 `button:true`。**

Code before migration:

迁移前的代码：

```dart
Widget myInputChip = InputChip(
  onPressed: () {},
  label: Semantics(
    button: true,
    hint: 'Example Hint',
    child: Text('My Input Chip'),
  ),
);
```

Code after migration:

迁移后的代码：

```dart
Widget myInputChip = InputChip(
  onPressed: () {},
  label: Semantics(
    hint: 'Example Hint',
    child: Text('My Input Chip'),
  ),
);
```

## Timeline

## 时间线

Landed in version: 1.23.0-7.0.pre<br>
In stable release: 2.0.0

合入版本：1.23.0-7.0.pre<br>
稳定版发布：2.0.0

## References

## 参考资料

API documentation:

API 文档：

* [`ActionChip`][]
* [`Chip`][]
* [`ChoiceChip`][]
* [`FilterChip`][]
* [`InputChip`][]
* [Material Buttons][]
* [Material Chips][]
* [`Semantics`][]
* [`SemanticsProperties.button`][]
* [`SemanticsProperties.enabled`][]

Relevant issue:

相关 issue：

* [Issue 58010][]: InputChip doesn't announce any
  action for a11y on iOS
* [Issue 58010][]：InputChip 在 iOS 上不为 a11y 播报任何操作

Relevant PRs:

相关 PR：

* [PR 60141][]: Tweaking Material Chip a11y semantics
  to match buttons
* [PR 60141][]：调整 Material Chip a11y 语义以匹配按钮
* [PR 60645][]: Revert "Tweaking Material Chip a11y
  semantics to match buttons" (#60141)
* [PR 60645][]：还原"调整 Material Chip a11y 语义以匹配按钮"（#60141）
* [PR 61048][]: Re-land "Tweaking Material Chip a11y
  semantics to match buttons" (#60141)
* [PR 61048][]：重新合入"调整 Material Chip a11y 语义以匹配按钮"（#60141）

[`ActionChip`]: {{site.api}}/flutter/material/ActionChip-class.html
[`Chip`]: {{site.api}}/flutter/material/Chip-class.html
[`ChoiceChip`]: {{site.api}}/flutter/material/ChoiceChip-class.html
[`FilterChip`]: {{site.api}}/flutter/material/FilterChip-class.html
[`InputChip`]: {{site.api}}/flutter/material/InputChip-class.html
[Material Buttons]: {{site.material}}/components/all-buttons
[Material Chips]: {{site.material}}/components/chips
[`Semantics`]: {{site.api}}/flutter/widgets/Semantics-class.html
[`SemanticsProperties.button`]: {{site.api}}/flutter/semantics/SemanticsProperties/button.html
[`SemanticsProperties.enabled`]: {{site.api}}/flutter/semantics/SemanticsProperties/enabled.html

[Issue 58010]: {{site.repo.flutter}}/issues/58010

[PR 60141]: {{site.repo.flutter}}/pull/60141
[PR 60645]: {{site.repo.flutter}}/pull/60645
[PR 61048]: {{site.repo.flutter}}/pull/61048
