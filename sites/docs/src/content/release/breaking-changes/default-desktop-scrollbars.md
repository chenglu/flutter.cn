---
# title: Default Scrollbars on Desktop
title: 桌面上的默认滚动条
# description: >
#   ScrollBehaviors will now automatically build Scrollbars on Desktop platforms.
description: >-
  ScrollBehaviors 现在将在桌面平台上自动构建滚动条。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`ScrollBehavior`s now automatically apply `Scrollbar`s to
scrolling widgets on desktop platforms - Mac, Windows and Linux.

`ScrollBehavior`s 现在自动将 `Scrollbar`s 应用于桌面平台上的滚动 widgets - Mac、Windows 和 Linux。


## Context

## 背景


Prior to this change, `Scrollbar`s were applied to scrolling widgets
manually by the developer across all platforms. This did not match
developer expectations when executing Flutter applications on desktop platforms.

在此更改之前，开发人员在所有平台上手动应用 `Scrollbar`s 来滚动 widgets。这与开发人员在桌面平台上执行 Flutter 应用程序时的预期不符。


Now, the inherited `ScrollBehavior` applies a `Scrollbar` automatically
to most scrolling widgets. This is similar to how `GlowingOverscrollIndicator`
is created by `ScrollBehavior`. The few widgets that are exempt from this
behavior are listed below.

现在，继承的 `ScrollBehavior` 自动将 `Scrollbar` 应用于大多数滚动 widget。这类似于 `ScrollBehavior` 创建 `GlowingOverscrollIndicator` 的方式。下面列出了少数不受此行为影响的 widget。


To provide better management and control of this feature, `ScrollBehavior`
has also been updated. The `buildViewportChrome` method, which applied
a `GlowingOverscrollIndicator`, has been deprecated. Instead, `ScrollBehavior`
now supports individual methods for decorating the viewport, `buildScrollbar`
and `buildOverscrollIndicator`. These methods can be overridden to control
what is built around the scrollable.

为了更好地管理和控制此功能，`ScrollBehavior` 也已更新。应用 `GlowingOverscrollIndicator` 的 `buildViewportChrome` 方法已被弃用。相反，`ScrollBehavior` 现在支持装饰视口的单独方法，`buildScrollbar` 和 `buildOverscrollIndicator`。可以重写这些方法来控制围绕可滚动构建的内容。


Furthermore, `ScrollBehavior` subclasses `MaterialScrollBehavior` and
`CupertinoScrollBehavior` have been made public, allowing developers to extend
and build upon the other existing `ScrollBehavior`s in the framework. These
subclasses were previously private.

此外，`ScrollBehavior` 子类 `MaterialScrollBehavior` 和 `CupertinoScrollBehavior` 已公开，允许开发人员扩展和构建框架中其他现有的 `ScrollBehavior`。这些子类以前是私有的。



## Description of change

## 变更说明


The previous approach called on developers to create their own `Scrollbar`s on
all platforms. In some use cases, a `ScrollController` would need to be provided
to the `Scrollbar` and the scrollable widget.

之前的方法要求开发人员在所有平台上创建自己的 `Scrollbar`。在某些用例中，需要将 `ScrollController` 提供给 `Scrollbar` 和可滚动 widget。


```dart
final ScrollController controller = ScrollController();
Scrollbar(
  controller: controller,
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    }
  )
);
```

The `ScrollBehavior` now applies the `Scrollbar` automatically
when executing on desktop, and handles providing the `ScrollController`
to the `Scrollbar` for you.

`ScrollBehavior` 现在在桌面上执行时自动应用 `Scrollbar`，并为你提供 `ScrollController` 到 `Scrollbar`。


```dart
final ScrollController controller = ScrollController();
ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
   return Text('Item $index');
 }
);
```

Some widgets in the framework are exempt from
this automatic `Scrollbar` application.
They are:

框架中的一些 widget 不受此自动 `Scrollbar` 应用程序的约束。他们是：


- `EditableText`, when `maxLines` is 1.

  `EditableText`，当 `maxLines` 为 1 时。

- `ListWheelScrollView`

  `ListWheelScrollView`

- `PageView`

  `PageView`

- `NestedScrollView`

  `NestedScrollView`


Since these widgets manually override the inherited `ScrollBehavior`
to remove `Scrollbar`s, all of these widgets now have a `scrollBehavior`
parameter so that one can be provided to use instead of the override.

由于这些 widget 手动覆盖继承的 `ScrollBehavior` 以删除 `Scrollbar`s，所有这些 widget 现在都有一个 `scrollBehavior` 参数，以便可以提供一个参数来使用而不是覆盖。


This change did not cause any test failures, crashes, or error messages
in the course of development, but it may result in two `Scrollbar`s
being rendered in your application if you are manually adding `Scrollbar`s
on desktop platforms.

此更改不会在开发过程中导致任何测试失败、崩溃或错误消息，但如果你在桌面平台上手动添加 `Scrollbar`s，则可能会导致应用程序中呈现两个 `Scrollbar`s。


If you are seeing this in your application, there are several ways to
control and configure this feature.

如果你在应用程序中看到此情况，则有多种方法可以控制和配置此功能。


- Remove the manually applied `Scrollbar`s in your

  删除你的手动应用的 `Scrollbar`s

  application when running on desktop.

在桌面上运行时的应用程序。


- Extend `ScrollBehavior`, `MaterialScrollBehavior`,

  扩展 `ScrollBehavior`、`MaterialScrollBehavior`、

  or `CupertinoScrollBehavior` to modify the default behavior.

或 `CupertinoScrollBehavior` 修改默认行为。


  - With your own `ScrollBehavior`, you can apply it app-wide by setting

    使用你自己的 `ScrollBehavior`，你可以通过设置在应用程序范围内应用它

    `MaterialApp.scrollBehavior` or `CupertinoApp.scrollBehavior`.

`MaterialApp.scrollBehavior` 或 `CupertinoApp.scrollBehavior`。

  - Or, if you wish to only apply it to specific widgets, add a

    或者，如果你只想将其应用于特定的 widget，请添加

    `ScrollConfiguration` above the widget in question with your
    custom `ScrollBehavior`.

`ScrollConfiguration` 位于你的自定义 `ScrollBehavior` 有问题的 widget 之上。


Your scrollable widgets then inherits this and reflects this behavior.

然后，你的可滚动 widgets 继承此行为并反映此行为。


- Instead of creating your own `ScrollBehavior`, another option for changing

  除了创建自己的 `ScrollBehavior` 之外，还有另一种更改选项

  the default behavior is to copy the existing `ScrollBehavior`, and toggle the
  desired feature.

默认行为是复制现有的 `ScrollBehavior`，并切换所需的功能。

  - Create a `ScrollConfiguration` in your widget tree, and

    在 widget 树中创建一个 `ScrollConfiguration` ，然后

    provide a modified copy of the existing `ScrollBehavior` in
    the current context using `copyWith`.

使用 `copyWith` 在当前上下文中提供现有 `ScrollBehavior` 的修改副本。


## Migration guide

## 迁移指南


### Removing manual `Scrollbar`s on desktop

### 删除桌面上的手册 `Scrollbar`s


Code before migration:

迁移前的代码：


```dart
final ScrollController controller = ScrollController();
Scrollbar(
  controller: controller,
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return Text('Item $index');
    }
  )
);
```

Code after migration:

迁移后的代码：


```dart
final ScrollController controller = ScrollController();
final Widget child = ListView.builder(
  controller: controller,
  itemBuilder: (BuildContext context, int index) {
    return Text('Item $index');
  }
);
// Only manually add a `Scrollbar` when not on desktop platforms.
// Or, see other migrations for changing `ScrollBehavior`.
switch (currentPlatform) {
  case TargetPlatform.linux:
  case TargetPlatform.macOS:
  case TargetPlatform.windows:
    return child;
  case TargetPlatform.android:
  case TargetPlatform.fuchsia:
  case TargetPlatform.iOS:
    return Scrollbar(
      controller: controller,
      child: child;
    );
}
```

### Setting a custom `ScrollBehavior` for your application

### 为你的应用程序设置自定义 `ScrollBehavior`


Code before migration:

迁移前的代码：


```dart
// MaterialApps previously had a private ScrollBehavior.
MaterialApp(
  // ...
);
```

Code after migration:

迁移后的代码：


```dart
// MaterialApps previously had a private ScrollBehavior.
// This is available to extend now.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods like buildOverscrollIndicator and buildScrollbar
}

// ScrollBehavior can now be configured for an entire application.
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
// MaterialApps previously had a private ScrollBehavior.
// This is available to extend now.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods like buildOverscrollIndicator and buildScrollbar
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
  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
  child: ListView.builder(
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
     return Text('Item $index');
    }
  ),
);
```

## Timeline

## 时间线


Landed in version: 2.2.0-10.0.pre<br>
登陆版本：2.2.0-10.0.pre
In stable release: 2.2.0
稳定版本：2.2.0

## References

## 参考资料


API documentation:

API 文档：


* [`ScrollConfiguration`][]
* [`ScrollBehavior`][]
* [`MaterialScrollBehavior`][]
* [`CupertinoScrollBehavior`][]
* [`Scrollbar`][]
* [`CupertinoScrollbar`][]

Relevant issues:

相关 issue：


* [Issue #40107][]

  [问题#40107][Issue #40107]

* [Issue #70866][]

  [问题#70866][Issue #70866]


Relevant PRs:

相关 PR：


* [Exposing ScrollBehaviors for app-wide settings][]

  [公开应用程序范围设置的 ScrollBehaviors][Exposing ScrollBehaviors for app-wide settings]

* [Automatically applying Scrollbars on desktop platforms with configurable ScrollBehaviors][]

  [通过可配置的 ScrollBehaviors 在桌面平台上自动应用滚动条][Automatically applying Scrollbars on desktop platforms with configurable ScrollBehaviors]



[`ScrollConfiguration`]: {{site.api}}/flutter/widgets/ScrollConfiguration-class.html
[`ScrollBehavior`]: {{site.api}}/flutter/widgets/ScrollBehavior-class.html
[`MaterialScrollBehavior`]: {{site.api}}/flutter/material/MaterialScrollBehavior-class.html
[`CupertinoScrollBehavior`]: {{site.api}}/flutter/cupertino/CupertinoScrollBehavior-class.html
[`Scrollbar`]: {{site.api}}/flutter/material/Scrollbar-class.html
[`CupertinoScrollbar`]: {{site.api}}/flutter/cupertino/CupertinoScrollbar-class.html
[Issue #40107]: {{site.repo.flutter}}/issues/40107
[Issue #70866]: {{site.repo.flutter}}/issues/70866
[Exposing ScrollBehaviors for app-wide settings]: {{site.repo.flutter}}/pull/76739
[Automatically applying Scrollbars on desktop platforms with configurable ScrollBehaviors]: {{site.repo.flutter}}/pull/78588
