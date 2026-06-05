---
# title: Default `PrimaryScrollController` on Desktop
title: 桌面上的默认“PrimaryScrollController”
# description: >
#   The `PrimaryScrollController` will no longer attach to
#   vertical `ScrollView`s automatically on Desktop.
description: >
  “PrimaryScrollController”将不再自动附加到桌面上的垂直“ScrollView”。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The `PrimaryScrollController` API has been updated to no longer automatically
attach to vertical `ScrollView`s on desktop platforms.

“PrimaryScrollController” API 已更新，不再自动附加到桌面平台上的垂直“ScrollView”。


## Context

## 背景


Prior to this change, `ScrollView.primary` would default to true if a
`ScrollView` had an `Axis.vertical` scroll direction and a `ScrollController`
had not already been provided. This allowed for common UI patterns, like the
scroll-to-top function on iOS to work out of the box for Flutter apps.
On desktop however, this default would often cause the following assertion error:

在此更改之前，如果“ScrollView”具有“Axis.vertical”滚动方向并且尚未提供“ScrollController”，则“ScrollView.primary”将默认为 true。这允许常见的 UI 模式，例如 iOS 上的滚动到顶部功能，可以在 Flutter 应用程序中开箱即用。然而，在桌面上，此默认设置通常会导致以下断言错误：


```plaintext
ScrollController attached to multiple ScrollViews.
```

While it is common for a mobile application to display one `ScrollView` at a time,
desktop UI patterns are more likely to display multiple `ScrollView`s
side-by-side. The prior implementation of `PrimaryScrollController` conflicted
with this pattern, resulting in an often unhelpful error message. To remedy this,
the `PrimaryScrollController` has been updated with additional parameters as
well as better error messaging across multiple widgets that depend on it.

虽然移动应用程序一次显示一个“ScrollView”是很常见的，但桌面 UI 模式更有可能并排显示多个“ScrollView”。 `PrimaryScrollController` 的先前实现与此模式冲突，导致通常出现无用的错误消息。为了解决这个问题，“PrimaryScrollController”已更新为附加参数以及跨依赖于它的多个 widget 的更好的错误消息传递。


## Description of change

## 变更说明


The previous implementation of `ScrollView` resulted in `primary` being true by
default for all vertical `ScrollView`s that did not already have a
`ScrollController`, on all platforms. This default behavior was not always clear,
particularly because it is separate from the `PrimaryScrollController` itself.

之前的“ScrollView”实现导致在所有平台上，对于所有尚未具有“ScrollController”的垂直“ScrollView”，“primary”默认为 true。这种默认行为并不总是很清楚，特别是因为它与“PrimaryScrollController”本身是分开的。


```dart
// Previously, this ListView would always result in primary being true,
// and attached to the PrimaryScrollController on all platforms.
Scaffold(
  body: ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    }
  ),
);
```

The implementation changes `ScrollView.primary` to be nullable, with the fallback
decision-making being relocated to the `PrimaryScrollController`.
When `primary` is null, and no `ScrollController` has been provided, the `ScrollView`
will look up the `PrimaryScrollController` and instead call `shouldInherit` to
determine if the given `ScrollView` should use the `PrimaryScrollController`.

该实现将“ScrollView.primary”更改为可为空，并将后备决策重新定位到“PrimaryScrollController”。当“primary”为 null，并且没有提供“ScrollController”时，“ScrollView”将查找“PrimaryScrollController”，然后调用“shouldInherit”来确定给定的“ScrollView”是否应该使用“PrimaryScrollController”。


The new members of the `PrimaryScrollController` class,
`automaticallyInheritForPlatforms` and `scrollDirection`, are evaluated in
`shouldInherit`, allowing users clarity and control over the
`PrimaryScrollController`'s behavior.

“PrimaryScrollController”类的新成员“automaticallyInheritForPlatforms”和“scrollDirection”在“shouldInherit”中进行评估，允许用户清晰地控制“PrimaryScrollController”的行为。


By default, backwards compatibility is maintained for mobile platforms.
`PrimaryScrollController.shouldInherit` returns true for vertical
`ScrollView`s. On desktop, this returns false by default.

默认情况下，保持移动平台的向后兼容性。对于垂直的 ScrollView，“PrimaryScrollController.shouldInherit”返回 true。在桌面上，默认情况下返回 false。


```dart
// Only on mobile platforms will this attach to the PrimaryScrollController by
// default.
Scaffold(
  body: ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    }
  ),
);
```

To change the default, users can set `ScrollView.primary` true or false to
explicitly manage the `PrimaryScrollController` for an individual `ScrollView`.
For behavior across multiple `ScrollView`s, the `PrimaryScrollController` is now
configurable by setting the specific platform, as well as the scroll direction
that is preferred for inheritance.

要更改默认值，用户可以将“ScrollView.primary”设置为 true 或 false，以显式管理单个“ScrollView”的“PrimaryScrollController”。对于跨多个“ScrollView”的行为，现在可以通过设置特定平台以及继承的首选滚动方向来配置“PrimaryScrollController”。


Widgets that use the `PrimaryScrollController`, such as `NestedScrollView`,
`Scrollbar`, and `DropdownMenuButton` will experience no change to existing
functionality. Features like the iOS scroll-to-top will also continue to work as
expected without any migration.

使用“PrimaryScrollController”的 widget（例如“NestedScrollView”、“Scrollbar”和“DropdownMenuButton”）现有功能不会发生任何变化。 iOS 滚动到顶部等功能也将继续按预期工作，无需任何迁移。


`ScrollAction`s, and `ScrollIntent`s on desktop are the only classes affected by
this change, requiring migration. By default, the `PrimaryScrollController` is
used to execute fallback keyboard scrolling `Shortcuts` if the current `Focus` is
contained within a `Scrollable`. Since displaying more than one `ScrollView`
side-by-side is common on desktop platforms, it isn't possible for
Flutter to decide "Which `ScrollView` should be primary in this view and receive
the keyboard scroll action?"

桌面上的“ScrollAction”和“ScrollIntent”是唯一受此更改影响的类，需要迁移。默认情况下，如果当前“Focus”包含在“Scrollable”中，则“PrimaryScrollController”用于执行后备键盘滚动“Shortcuts”。由于并排显示多个“ScrollView”在桌面平台上很常见，因此 Flutter 不可能决定“哪个“ScrollView”应该是该视图中的主要视图并接收键盘滚动操作？”


If more than one `ScrollView` was present previous to this change, the same
assertion (`ScrollController attached to multiple ScrollViews.`) would be thrown.
Now, on desktop platforms, users need to specify `primary: true` to
designate which `ScrollView` is the fallback to receive unhandled keyboard
`Shortcuts`.

如果在此更改之前存在多个“ScrollView”，则会抛出相同的断言（“ScrollController 附加到多个 ScrollView”）。现在，在桌面平台上，用户需要指定“primary: true”来指定哪个“ScrollView”是接收未处理的键盘“快捷方式”的后备。


## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```dart
// These side-by-side ListViews would throw errors from Scrollbars and
// ScrollActions previously due to the PrimaryScrollController.
Scaffold(
  body: LayoutBuilder(
    builder: (context, constraints) {
      return Row(
        children: [
          SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth / 2,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text('List 1 - Item $index');
              }
            ),
          ),
          SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth / 2,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text('List 2 - Item $index');
              }
            ),
          ),
        ]
      );
    },
  ),
);
```

Code after migration:

迁移后的代码：


```dart
// These side-by-side ListViews will no longer throw errors, but for
// default ScrollActions, one will need to be designated as primary.
Scaffold(
  body: LayoutBuilder(
    builder: (context, constraints) {
      return Row(
        children: [
          SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth / 2,
            child: ListView.builder(
              // This ScrollView will use the PrimaryScrollController
              primary: true,
              itemBuilder: (BuildContext context, int index) {
                return Text('List 1 - Item $index');
              }
            ),
          ),
          SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth / 2,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Text('List 2 - Item $index');
              }
            ),
          ),
        ]
      );
    },
  ),
);
```

## Timeline

## 时间轴


Landed in version: 3.3.0-0.0.pre<br>
In stable release: 3.3

登陆版本：3.3.0-0.0.pre<br> 稳定版本：3.3


## References

## 参考


API documentation:

API 文档：


* [`PrimaryScrollController`][]

  [`PrimaryScrollController`][]

* [`ScrollView`][]


* [`ScrollAction`][]


* [`ScrollIntent`][]


* [`Scrollbar`][]


Design document:

设计文件：


* [Updating PrimaryScrollController][]

  [更新 PrimaryScrollController][`PrimaryScrollController`]


Relevant issues:

相关问题：


* [Issue #100264][]

  [问题#100264][Issue #100264]


Relevant PRs:

相关 PR：


* [Updating PrimaryScrollController for Desktop][]

  [更新桌面版 PrimaryScrollController][`PrimaryScrollController`]


[`PrimaryScrollController`]: {{site.api}}/flutter/widgets/PrimaryScrollController-class.html
[`ScrollView`]: {{site.api}}/flutter/widgets/ScrollView-class.html
[`ScrollAction`]: {{site.api}}/flutter/widgets/ScrollAction-class.html
[`ScrollIntent`]: {{site.api}}/flutter/widgets/ScrollIntent-class.html
[`Scrollbar`]: {{site.api}}/flutter/material/Scrollbar-class.html
[Updating PrimaryScrollController]: https://docs.google.com/document/d/12OQx7h8UQzzAi0Kxh-saDC2dg7h2fghCCzwJ0ysPmZE/edit?usp=sharing&resourcekey=0-ATO-1Er3HO2HITm59I0IdA
[Issue #100264]: {{site.repo.flutter}}/issues/100264
[Updating PrimaryScrollController for Desktop]: {{site.repo.flutter}}/pull/102099
