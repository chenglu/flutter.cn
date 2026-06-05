---
# title: Default multitouch scrolling
title: 默认多点触控滚动
# description: >
#   ScrollBehaviors will now configure how Scrollables respond to
#   multitouch gestures.
description: >
  ScrollBehaviors 现在将配置 Scrollables 如何响应多点触控手势。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


`ScrollBehavior`s now allow or disallow scrolling speeds to be affected by the
number of pointers on the screen. `ScrollBehavior.multitouchDragStrategy`, by
default, prevents multiple pointers interacting with the scrollable at the same
time from affecting the speed of scrolling.

“ScrollBehavior”现在允许或不允许滚动速度受到屏幕上指针数量的影响。默认情况下，“ScrollBehavior.multitouchDragStrategy”可防止多个指针同时与可滚动对象交互，从而影响滚动速度。


## Context

## 背景


Prior to this change, for each pointer dragging a `Scrollable` widget, the
scroll speed would increase. This did not match platform expectations when
interacting with Flutter applications.

在此更改之前，对于拖动“可滚动”widget 的每个指针，滚动速度都会增加。这与与 Flutter 应用程序交互时的平台期望不符。


Now, the inherited `ScrollBehavior` manages how multiple pointers affect
scrolling widgets as specified by `ScrollBehavior.multitouchDragStrategy`. This
enum, `MultitouchDragStrategy`, can also be configured for the prior behavior.

现在，继承的“ScrollBehavior”管理多个指针如何影响由“ScrollBehavior.multitouchDragStrategy”指定的滚动 widget。该枚举“MultitouchDragStrategy”也可以针对先前的行为进行配置。


## Description of change

## 变更说明


This change fixed the unexpected ability to increase scroll speeds by dragging
with more than one finger.

这一更改修复了通过用多个手指拖动来提高滚动速度的意外能力。


If you have relied on the previous behavior in your application, there are
several ways to control and configure this feature.

如果你依赖应用程序中的先前行为，则有多种方法可以控制和配置此功能。


- Extend `ScrollBehavior`, `MaterialScrollBehavior`, or `CupertinoScrollBehavior`

  扩展 `ScrollBehavior`、`MaterialScrollBehavior` 或 `CupertinoScrollBehavior`

to modify the default behavior, overriding
`ScrollBehavior.multitouchDragStrategy`.

修改默认行为，覆盖 `ScrollBehavior.multitouchDragStrategy`。


    - With your own `ScrollBehavior`, you can apply it app-wide by setting

      使用你自己的“ScrollBehavior”，你可以通过设置在应用程序范围内应用它

`MaterialApp.scrollBehavior` or `CupertinoApp.scrollBehavior`.

`MaterialApp.scrollBehavior` 或 `CupertinoApp.scrollBehavior`。

    - Or, if you wish to only apply it to specific widgets, add a

      或者，如果你只想将其应用于特定 widget，请添加

`ScrollConfiguration` above the widget in question with your
custom `ScrollBehavior`.

使用你的自定义“ScrollBehavior”在相关 widget 上方的“ScrollConfiguration”。


Your scrollable widgets then inherit and reflect this behavior.

然后，你的可滚动 widget 将继承并反映此行为。


- Instead of creating your own `ScrollBehavior`, another option for changing

  除了创建自己的“ScrollBehavior”之外，还有另一种更改选项

the default behavior is to copy the existing `ScrollBehavior`, and set different
`multitouchDragStrategy`.

默认行为是复制现有的“ScrollBehavior”，并设置不同的“multitouchDragStrategy”。

    - Create a `ScrollConfiguration` in your widget tree, and provide a modified copy

      在你的 widget 树中创建一个“ScrollConfiguration”，并提供修改后的副本

of the existing `ScrollBehavior` in the current context using `copyWith`.

使用“copyWith”在当前上下文中现有的“ScrollBehavior”。


To accommodate the new configuration
`DragGestureRecognizer` was updated to support `MultitouchDragStrategy` as well
in other dragging contexts.

为了适应新配置，“DragGestureRecognizer”已更新，以支持“MultitouchDragStrategy”以及其他拖动上下文。


## Migration guide

## 迁移指南


### Setting a custom `ScrollBehavior` for your application

### 为你的应用程序设置自定义“ScrollBehavior”


Code before migration:

迁移前的代码：


```dart
MaterialApp(
  // ...
);
```

Code after migration:

迁移后的代码：


```dart
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like multitouchDragStrategy
  @override
  MultitouchDragStrategy getMultitouchDragStrategy(BuildContext context) => MultitouchDragStrategy.sumAllPointers;
}

// Set ScrollBehavior for an entire application.
MaterialApp(
  scrollBehavior: MyCustomScrollBehavior(),
  // ...
);
```

### Setting a custom `ScrollBehavior` for a specific widget

### 为特定 widget 设置自定义“ScrollBehavior”


Code before migration:

迁移前的代码：


```dart
final ScrollController controller = ScrollController();
ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
    return Text('Item $index');
  },
);
```

Code after migration:

迁移后的代码：


```dart
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like multitouchDragStrategy
  @override
  MultitouchDragStrategy getMultitouchDragStrategy(BuildContext context) => MultitouchDragStrategy.sumAllPointers;
}

// ScrollBehavior can be set for a specific widget.
final ScrollController controller = ScrollController();
ScrollConfiguration(
  behavior: MyCustomScrollBehavior(),
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    },
  ),
);
```

### Copy and modify existing `ScrollBehavior`

### 复制并修改现有的“ScrollBehavior”


Code before migration:

迁移前的代码：


```dart
final ScrollController controller = ScrollController();
ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
    return Text('Item $index');
  },
);
```

Code after migration:

迁移后的代码：


```dart
// ScrollBehavior can be copied and adjusted.
final ScrollController controller = ScrollController();
ScrollConfiguration(
  behavior: ScrollConfiguration.of(context).copyWith(
    multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
  ),
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    },
  ),
);
```

## Timeline

## 时间轴


Landed in version: 3.18.0-4.0.pre<br>
In stable release: 3.19.0

登陆版本：3.18.0-4.0.pre<br> 稳定版本：3.19.0


## References

## 参考


API documentation:

API 文档：


* [`ScrollConfiguration`][]


* [`ScrollBehavior`][]

  [`ScrollBehavior`][]

* [`MaterialScrollBehavior`][]


* [`CupertinoScrollBehavior`][]

  [`CupertinoScrollBehavior`][]

* [`MultitouchDragStrategy`][]


* [`DragGestureRecognizer`][]


Relevant issue:

相关问题：


* [Issue #11884][]

  [问题#11884][Issue #11884]


Relevant PRs:

相关 PR：


* [Introduce multi-touch drag strategies for DragGestureRecognizer][]

  [介绍 DragGestureRecognizer 的多点触摸拖动策略][`DragGestureRecognizer`]


[`ScrollConfiguration`]: {{site.api}}/flutter/widgets/ScrollConfiguration-class.html
[`ScrollBehavior`]: {{site.api}}/flutter/widgets/ScrollBehavior-class.html
[`MaterialScrollBehavior`]: {{site.api}}/flutter/material/MaterialScrollBehavior-class.html
[`CupertinoScrollBehavior`]: {{site.api}}/flutter/cupertino/CupertinoScrollBehavior-class.html
[`MultitouchDragStrategy`]: {{site.api}}/flutter/gestures/MultitouchDragStrategy.html
[`DragGestureRecognizer`]: {{site.api}}/flutter/gestures/DragGestureRecognizer-class.html
[Issue #11884]: {{site.repo.flutter}}/issues/11884
[Introduce multi-touch drag strategies for DragGestureRecognizer]: {{site.repo.flutter}}/pull/136708
