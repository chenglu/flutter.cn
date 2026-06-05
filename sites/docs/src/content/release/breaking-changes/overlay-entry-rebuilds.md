---
# title: Rebuild optimization for OverlayEntries and Routes
title: OverlayEntries 和 Routes 的重建优化
# description: OverlayEntries only rebuild on explicit state changes.
description: OverlayEntries 仅在显式状态更改时重建。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


This optimization improves performance for route transitions,
but it may uncover missing calls to `setState` in your app.

此优化提高了路由转换的性能，但它可能会发现应用程序中丢失的对“setState”的调用。


## Context

## 背景


Prior to this change, an `OverlayEntry` would rebuild when
a new opaque entry was added on top of it or removed above it.
These rebuilds were unnecessary because they were not triggered
by a change in state of the affected `OverlayEntry`. This
breaking change optimized how we handle the addition and removal of
`OverlayEntry`s, and removes unnecessary rebuilds
to improve performance.

在此更改之前，当在其顶部添加新的不透明条目或在其上方删除新的不透明条目时，“OverlayEntry”将重建。这些重建是不必要的，因为它们不是由受影响的“OverlayEntry”状态变化触发的。这一重大更改优化了我们处理“OverlayEntry”的添加和删除的方式，并删除了不必要的重建以提高性能。


Since the `Navigator` internally puts each `Route` into an
`OverlayEntry` this change also applies to `Route` transitions:
If an opaque `Route` is pushed on top or removed from above another
`Route`, the `Route`s below the opaque `Route`
no longer rebuilds unnecessarily.

由于“Navigator”在内部将每个“Route”放入“OverlayEntry”中，因此此更改也适用于“Route”转换：如果不透明“Route”被推到顶部或从另一个“Route”上方移除，则不透明“Route”下方的“Route”不再不必要地重建。


## Description of change

## 变更说明


In most cases, this change doesn't require any changes to your code.
However, if your app was erroneously relying on the implicit
rebuilds you may see issues, which can be resolved by wrapping
any state change in a `setState` call.

在大多数情况下，此更改不需要对你的代码进行任何更改。但是，如果你的应用程序错误地依赖隐式重建，你可能会遇到问题，这可以通过将任何状态更改包装在“setState”调用中来解决。


Furthermore, this change slightly modified the shape of the
widget tree: Prior to this change,
the `OverlayEntry`s were wrapped in a `Stack` widget.
The explicit `Stack` widget was removed from the widget hierarchy.

此外，此更改稍微修改了 widget 树的形状：在此更改之前，“OverlayEntry”被包装在“Stack”widget 中。显式的“Stack”widget 已从 widget 层次结构中删除。


## Migration guide

## 迁移指南


If you're seeing issues after upgrading to a Flutter version
that included this change, audit your code for missing calls to
`setState`. In the example below, assigning the return value of
`Navigator.pushNamed` to `buttonLabel` is
implicitly modifying the state and it should be wrapped in an
explicit `setState` call.

如果你在升级到包含此更改的 Flutter 版本后遇到问题，请审核你的代码是否缺少对“setState”的调用。在下面的示例中，将“Navigator.pushNamed”的返回值分配给“buttonLabel”会隐式修改状态，并且应将其包装在显式的“setState”调用中。


Code before migration:

迁移前的代码：


```dart
class FooState extends State<Foo> {
  String buttonLabel = 'Click Me';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Illegal state modification that should be wrapped in setState.
        buttonLabel = await Navigator.pushNamed(context, '/bar');
      },
      child: Text(buttonLabel),
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
class FooState extends State<Foo> {
  String buttonLabel = 'Click Me';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final newLabel = await Navigator.pushNamed(context, '/bar');
        setState(() {
          buttonLabel = newLabel;
        });
      },
      child: Text(buttonLabel),
    );
  }
}
```

## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


API documentation:

API 文档：


* [`setState`][]


* [`OverlayEntry`][]


* [`Overlay`][]

  [` 覆盖 `][`Route`]

* [`Navigator`][]


* [`Route`][]

  [` 路线 `][`Route`]

* [`OverlayRoute`][]


Relevant issues:

相关问题：


* [Issue 45797][]

  [问题 45797][Issue 45797]


Relevant PRs:

相关 PR：


* [Do not rebuild Routes when a new opaque Route is pushed on top][]


* [Reland "Do not rebuild Routes when a new opaque Route is pushed on top"][]


[Do not rebuild Routes when a new opaque Route is pushed on top]: {{site.repo.flutter}}/pull/48900
[Issue 45797]: {{site.repo.flutter}}/issues/45797
[`Navigator`]: {{site.api}}/flutter/widgets/Navigator-class.html
[`Overlay`]: {{site.api}}/flutter/widgets/Overlay-class.html
[`OverlayEntry`]: {{site.api}}/flutter/widgets/OverlayEntry-class.html
[`OverlayRoute`]: {{site.api}}/flutter/widgets/OverlayRoute-class.html
[`Route`]: {{site.api}}/flutter/widgets/Route-class.html
[`setState`]: {{site.api}}/flutter/widgets/State/setState.html
[Reland "Do not rebuild Routes when a new opaque Route is pushed on top"]: {{site.repo.flutter}}/pull/49376
