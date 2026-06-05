---
# title: Dry layout support for RenderBox
title: RenderBox 的干式布局支持
# description: >
#   The method `computeDryLayout` was added to the RenderBox protocol to
#   correctly calculate its intrinsic size in certain situations.
description: >
  RenderBox 协议中添加了“computeDryLayout”方法，以便在某些情况下正确计算其固有大小。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


A new method named `computeDryLayout` was added to the `RenderBox` protocol.
Subclasses of `RenderBox` are expected to implement it to correctly report
their desired size given a set of `BoxConstraints` during intrinsic
calculations. Subclasses that implement `computeDryLayout` no longer need to
override `performResize`.

名为“computeDryLayout”的新方法已添加到“RenderBox”协议中。 `RenderBox` 的子类预计会实现它，以便在内部计算期间给定一组 `BoxConstraints` 来正确报告其所需的大小。实现“computeDryLayout”的子类不再需要重写“performResize”。


## Context

## 背景


A new method, `computeDryLayout`, was added to the `RenderBox` protocol to
correctly calculate the intrinsic sizes of a `RenderParagraph` with `WidgetSpan`
children and a `RenderWrap`. The method receives a set of `BoxConstraints` and
is expected to calculate the resulting size of the `RenderBox` without changing
any internal state. It's essentially a dry run of `performLayout` that only
calculates the resulting size and doesn't place the children. The
`computeDryLayout` method is part of the intrinsics protocol (see also
[`RenderBox.computeMinIntrinsicWidth`][] and friends).

“RenderBox”协议中添加了一个新方法“computeDryLayout”，以正确计算具有“WidgetSpan”子项和“RenderWrap”的“RenderParagraph”的固有大小。该方法接收一组“BoxConstraints”，并预计在不更改任何内部状态的情况下计算“RenderBox”的结果大小。它本质上是“performLayout”的一次演练，仅计算结果大小，并不放置子元素。 `computeDryLayout` 方法是内在函数协议的一部分（另请参阅 [`RenderBox.computeMinIntrinsicWidth`][] 等）。


## Description of change

## 变更说明


Subclasses of `RenderBox` need to override the new `computeDryLayout` method
if they are used as a descendant of a `RenderObject` that may query the intrinsic
size of its children. Examples of widgets that do this are `IntrinsicHeight`
and `IntrinsicWidth`.

如果“RenderBox”的子类用作可能查询其子级的固有大小的“RenderObject”的后代，则它们需要重写新的“computeDryLayout”方法。执行此操作的 widget 的示例是“IntrinsicHeight”和“IntrinsicWidth”。


The default implementation of `RenderBox.performResize` also uses the size
computed by `computeDryLayout` to perform the resize. Overriding `performResize`
is therefore no longer necessary.

`RenderBox.performResize` 的默认实现也使用 `computeDryLayout` 计算的大小来执行调整大小。因此不再需要重写“performResize”。


## Migration guide

## 迁移指南


Subclasses that already override `performResize` can be migrated by simply
changing the function signature from `void performResize()` to
`Size computeDryLayout(BoxConstraints constraints)` and by returning the
calculated size instead of assigning it to the `size` setter. The old
implementation of `performResize` can be removed.

已经重写“performResize”的子类可以通过简单地将函数签名从“void PerformResize()”更改为“SizecomputeDryLayout(BoxConstraintsconstraints)”并返回计算的大小而不是将其分配给“size”设置器来迁移。旧的“performResize”实现可以被删除。


Code before migration:

迁移前的代码：


```dart
  @override
  void performResize() {
     size = constraints.biggest;
  }
```

Code after migration:

迁移后的代码：


```dart
  // This replaces the old performResize method.
  @override
  Size computeDryLayout(BoxConstraints constraints) {
     return constraints.biggest;
  }
```

If the subclass doesn't override `performResize`, the implementation of
`computeDryLayout` has to be extracted from the `performLayout` method.
Basically, `computeDryLayout` needs to do all the work `performLayout` is doing
to figure out the size of the `RenderBox`. However, instead of assigning it
to the `size` setter, it returns the computed size. If `computeDryLayout`
needs to know the size of its children, it must obtain that size by calling
`getDryLayout` on the child instead of calling `layout`.

如果子类没有重写“performResize”，则必须从“performLayout”方法中提取“computeDryLayout”的实现。基本上，“computeDryLayout”需要完成“performLayout”所做的所有工作来计算“RenderBox”的大小。但是，它不是将其分配给“size”设置器，而是返回计算出的大小。如果“computeDryLayout”需要知道其子级的大小，则必须通过在子级上调用“getDryLayout”而不是调用“layout”来获取该大小。


If for some reason it is impossible to calculate the dry layout, `computeDryLayout`
must call `debugCannotComputeDryLayout` from within an assert and return a dummy
size of `const Size(0, 0)`. Calculating a dry layout is, for example, impossible
if the size of a `RenderBox` depends on the baseline metrics of its children.

如果由于某种原因无法计算干布局，则“computeDryLayout”必须从断言内调用“debugCannotComputeDryLayout”并返回“const Size(0, 0)”的虚拟大小。例如，如果“RenderBox”的大小取决于其子级的基线指标，则计算干燥布局是不可能的。


```dart
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    assert(debugCannotComputeDryLayout(
      reason: 'Layout requires baseline metrics, which are only available after a full layout.'
    ));
    return const Size(0, 0);
  }
```

## Timeline

## 时间轴


Landed in version: 1.25.0-4.0.pre<br>
In stable release: 2.0.0

登陆版本：1.25.0-4.0.pre<br> 稳定版本：2.0.0


## References

## 参考


API documentation:

API 文档：


* [`RenderBox`][]


* [`computeMinIntrinsicWidth`][]

  [`computeMinIntrinsicWidth`][]

* [`computeDryLayout`][]

  [`computeDryLayout`][]

* [`getDryLayout`][]

  [`getDryLayout`][]

* [`performResize`][]


* [`RenderWrap`][]


* [`RenderParagraph`][]


Relevant issues:

相关问题：


* [Issue 48679][]

  [问题 48679][Issue 48679]


Relevant PRs:

相关 PR：


* [Fixes Intrinsics for RenderParagraph and RenderWrap][]

  [修复 RenderParagraph 和 RenderWrap 的内在函数][Fixes Intrinsics for RenderParagraph and RenderWrap]


[`RenderBox`]: {{site.api}}/flutter/rendering/RenderBox-class.html
[`RenderBox.computeMinIntrinsicWidth`]: {{site.api}}/flutter/rendering/RenderBox/computeMinIntrinsicWidth.html
[`computeMinIntrinsicWidth`]: {{site.api}}/flutter/rendering/RenderBox/computeMinIntrinsicWidth.html
[`computeDryLayout`]: {{site.api}}/flutter/rendering/RenderBox/computeDryLayout.html
[`getDryLayout`]: {{site.api}}/flutter/rendering/RenderBox/getDryLayout.html
[`performResize`]: {{site.api}}/flutter/rendering/RenderBox/performResize.html
[`RenderWrap`]: {{site.api}}/flutter/rendering/RenderWrap-class.html
[`RenderParagraph`]: {{site.api}}/flutter/rendering/RenderParagraph-class.html

[Issue 48679]: {{site.repo.flutter}}/issues/48679
[Fixes Intrinsics for RenderParagraph and RenderWrap]: {{site.repo.flutter}}/pull/70656
