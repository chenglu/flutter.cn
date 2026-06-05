---
# title: Default drag scrolling devices
title: 默认拖动滚动设备
# description: >
#   ScrollBehaviors will now configure what
#   PointerDeviceKinds can drag Scrollables.
description: >-
  ScrollBehaviors 现在将配置哪些 PointerDeviceKinds 可以拖动 Scrollables。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`ScrollBehavior`s now allow or disallow drag scrolling from specified
`PointerDeviceKind`s. `ScrollBehavior.dragDevices`, by default,
allows scrolling widgets to be dragged by all `PointerDeviceKind`s
except for `PointerDeviceKind.mouse`.

`ScrollBehavior`s 现在允许或禁止从指定的 `PointerDeviceKind`s 拖动滚动。默认情况下，`ScrollBehavior.dragDevices` 允许滚动 widgets 被除 `PointerDeviceKind.mouse` 之外的所有 `PointerDeviceKind`s 拖动。


## Context

## 背景


Prior to this change, all `PointerDeviceKind`s could drag a `Scrollable` widget.
This did not match developer expectations when interacting with Flutter
applications using mouse input devices. This also made it difficult to execute
other mouse gestures, like selecting text that was contained in a `Scrollable` widget.

在此更改之前，所有 `PointerDeviceKind` 都可以拖动 `Scrollable` widget。当使用鼠标输入设备与 Flutter 应用程序交互时，这不符合开发人员的预期。这也使得执行其他鼠标手势变得困难，例如选择 `Scrollable` widget 中包含的文本。


Now, the inherited `ScrollBehavior` manages which devices can drag scrolling widgets
as specified by `ScrollBehavior.dragDevices`. This set of `PointerDeviceKind`s are
allowed to drag.

现在，继承的 `ScrollBehavior` 管理哪些设备可以按照 `ScrollBehavior.dragDevices` 的指定拖动滚动 widgets。这组 `PointerDeviceKind` 是允许拖动的。


## Description of change

## 变更说明


This change fixed the unexpected ability to scroll by dragging with a mouse.

此更改修复了通过鼠标拖动进行滚动的意外能力。


If you have relied on the previous behavior in your application, there are several ways to
control and configure this feature.

如果你依赖应用程序中的先前行为，则有多种方法可以控制和配置此功能。


- Extend `ScrollBehavior`, `MaterialScrollBehavior`, or `CupertinoScrollBehavior`

  扩展 `ScrollBehavior`、`MaterialScrollBehavior` 或 `CupertinoScrollBehavior`

to modify the default behavior, overriding `ScrollBehavior.dragDevices`.

修改默认行为，覆盖 `ScrollBehavior.dragDevices`。


  - With your own `ScrollBehavior`, you can apply it app-wide by setting

    使用你自己的 `ScrollBehavior`，你可以通过设置在应用程序范围内应用它

    `MaterialApp.scrollBehavior` or `CupertinoApp.scrollBehavior`.

`MaterialApp.scrollBehavior` 或 `CupertinoApp.scrollBehavior`。

  - Or, if you wish to only apply it to specific widgets, add a

    或者，如果你只想将其应用于特定的 widget，请添加

    `ScrollConfiguration` above the widget in question with your
    custom `ScrollBehavior`.

`ScrollConfiguration` 位于 widget 上方，与你的自定义 `ScrollBehavior` 相关。


Your scrollable widgets then inherit and reflect this behavior.

然后，你的可滚动 widget 继承并反映此行为。


- Instead of creating your own `ScrollBehavior`, another option for changing

  除了创建自己的 `ScrollBehavior` 之外，还有另一种更改选项

the default behavior is to copy the existing `ScrollBehavior`, and set different
`dragDevices`.

默认行为是复制现有的 `ScrollBehavior`，并设置不同的 `dragDevices`。

  - Create a `ScrollConfiguration` in your widget tree, and provide a modified copy

    在 widget 树中创建 `ScrollConfiguration` 并提供修改后的副本

    of the existing `ScrollBehavior` in the current context using `copyWith`.

使用 `copyWith` 在当前上下文中现有的 `ScrollBehavior` 。


To accommodate the new configuration of drag devices in `ScrollBehavior`,
`GestureDetector.kind` has been deprecated along with
all subclassed instances of the parameter.
A flutter fix is available to migrate existing code
for all gesture detectors from `kind` to `supportedDevices`.
The previous parameter `kind` only allowed one `PointerDeviceKind` to
be used to filter gestures.
The introduction of `supportedDevices` makes it possible for more
than one valid `PointerDeviceKind`.

为了适应 `ScrollBehavior` 中拖动设备的新配置，`GestureDetector.kind` 以及参数的所有子类实例已被弃用。颤动修复可用于将所有手势检测器的现有代码从 `kind` 迁移到 `supportedDevices`。前一个参数 `kind` 只允许使用一个 `PointerDeviceKind` 来过滤手势。 `supportedDevices` 的引入使得多个有效的 `PointerDeviceKind` 成为可能。


## Migration guide

## 迁移指南


### Setting a custom `ScrollBehavior` for your application

### 为你的应用程序设置自定义 `ScrollBehavior`


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
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

// Set ScrollBehavior for an entire application.
MaterialApp(
  scrollBehavior: MyCustomScrollBehavior(),
  // ...
);
```

### Setting a custom `ScrollBehavior` for a specific widget

### 为特定 widget 设置自定义 `ScrollBehavior`


Code before migration:

迁移前的代码：


```dart
final ScrollController controller = ScrollController();
ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
   return Text('Item $index');
 }
);
```

Code after migration:

迁移后的代码：


```dart
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

// ScrollBehavior can be set for a specific widget.
final ScrollController controller = ScrollController();
ScrollConfiguration(
  behavior: MyCustomScrollBehavior(),
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
     return Text('Item $index');
    }
  ),
);
```

### Copy and modify existing `ScrollBehavior`

### 复制并修改现有的 `ScrollBehavior`


Code before migration:

迁移前的代码：


```dart
final ScrollController controller = ScrollController();
ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
   return Text('Item $index');
 }
);
```

Code after migration:

迁移后的代码：


```dart
// ScrollBehavior can be copied and adjusted.
final ScrollController controller = ScrollController();
ScrollConfiguration(
  behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  }),
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
     return Text('Item $index');
    }
  ),
);
```

### Migrate `GestureDetector`s from `kind` to `supportedDevices`

### 将 `GestureDetector`s 从 `kind` 迁移到 `supportedDevices`


Code before migration:

迁移前的代码：


```dart
VerticalDragGestureRecognizer(
  kind: PointerDeviceKind.touch,
);
```

Code after migration:

迁移后的代码：


```dart
VerticalDragGestureRecognizer(
  supportedDevices: <PointerDeviceKind>{ PointerDeviceKind.touch },
);
```

## Timeline

## 时间线


Landed in version: 2.3.0-12.0.pre<br>
登陆版本：2.3.0-12.0.pre
In stable release: 2.5
稳定版本：2.5

## References

## 参考资料


API documentation:

API 文档：


* [`ScrollConfiguration`][]
* [`ScrollBehavior`][]
* [`MaterialScrollBehavior`][]
* [`CupertinoScrollBehavior`][]
* [`PointerDeviceKind`][]
* [`GestureDetector`][]

Relevant issue:

相关issue：


* [Issue #71322][]

  [问题#71322][Issue #71322]


Relevant PRs:

相关 PR：


* [Reject mouse drags by default in scrollables][]

  [默认情况下拒绝滚动项中的鼠标拖动][Reject mouse drags by default in scrollables]

* [Deprecate GestureDetector.kind in favor of new supportedDevices][]

  [弃用 GestureDetector.kind 以支持新的受支持设备][Deprecate GestureDetector.kind in favor of new supportedDevices]



[`ScrollConfiguration`]: {{site.api}}/flutter/widgets/ScrollConfiguration-class.html
[`ScrollBehavior`]: {{site.api}}/flutter/widgets/ScrollBehavior-class.html
[`MaterialScrollBehavior`]: {{site.api}}/flutter/material/MaterialScrollBehavior-class.html
[`CupertinoScrollBehavior`]: {{site.api}}/flutter/cupertino/CupertinoScrollBehavior-class.html
[`PointerDeviceKind`]: {{site.api}}/flutter/dart-ui/PointerDeviceKind-class.html
[`GestureDetector`]: {{site.api}}/flutter/widgets/GestureDetector-class.html
[Issue #71322]: {{site.repo.flutter}}/issues/71322
[Reject mouse drags by default in scrollables]: {{site.repo.flutter}}/pull/81569
[Deprecate GestureDetector.kind in favor of new supportedDevices]: {{site.repo.flutter}}/pull/81858
