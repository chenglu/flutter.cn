---
# title: AnnotatedRegionLayers return local position relative to clipping region
title: AnnotatedRegionLayers 返回相对于剪切区域的本地位置
# description: >
#   Provide annotation searches with reliable and meaningful local positions.
description: >-
  提供具有可靠且有意义的本地位置的注释搜索。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The local position returned by `AnnotatedRegionLayers` in an
annotation search has been changed to be relative to the clipping
region instead of the layer. This makes the local position more
meaningful and reliable, but breaks code that directly performs
annotation searches and uses the local position.

注释搜索中 `AnnotatedRegionLayers` 返回的本地位置已更改为相对于剪切区域而不是图层。这使得本地位置更有意义和可靠，但破坏了直接执行注释搜索和使用本地位置的代码。


## Context

## 背景


Annotations are metadata that are assigned during the
rendering phase to regions on the screen.
Searching the annotations with a location gives the
contextual information that contains that location.
They are used to detect mouse events and the theme of app bars.

注释是在渲染阶段分配给屏幕上区域的元数据。搜索带有位置的注释会给出包含该位置的上下文信息。它们用于检测鼠标事件和应用栏的主题。


When `localPosition` was first added to the search result,
it was defined as relative to the layer that owned the annotation,
which turned out to be a design mistake.
The offset from the layer is meaningless and unreliable.
For example, a `Transform` widget draws on the same layer
with an offset if the transform matrix is a simple translation,
or push a dedicated `TransformLayer` if the matrix is non-trivial.
The former case keeps the previous coordinate origin
(for example, the top left corner of the app),
while the latter case moves the position origin since
it's on a new layer. The two cases might not produce noticeable
visual differences, since the extra layer might just be a scale of
99%, despite that the annotation search returns different results.
In order to make this local position reliable, we have to choose
one of the results to stick to.

当 `localPosition` 首次添加到搜索结果时，它被定义为相对于拥有注释的图层，结果证明这是一个设计错误。与图层的偏移是无意义且不可靠的。例如，如果变换矩阵是简单平移，则 `Transform` widget 在具有偏移的同一层上绘制，或者如果矩阵不平凡，则推送专用 `TransformLayer` 。前一种情况保留先前的坐标原点（例如应用程序的左上角），而后一种情况则移动位置原点，因为它位于新图层上。这两种情况可能不会产生明显的视觉差异，因为尽管注释搜索返回不同的结果，但额外的层可能只是 99% 的比例。为了使这个局部位置可靠，我们必须选择一个结果来坚持。


## Description of change

## 变更说明


The `localPosition` returned by an `AnnotatedRegionLayer`
is now the local position it received subtracted by `offset`,
where `offset` is the location of the clipping area relative
to the layer.

`AnnotatedRegionLayer` 返回的 `localPosition` 现在是它收到的本地位置减去 `offset`，其中 `offset` 是剪切区域相对于图层的位置。


```dart
class AnnotatedRegionLayer<T> extends ContainerLayer {
  @override
  bool findAnnotations<S>(AnnotationResult<S> result, Offset localPosition, { required bool onlyFirst }) {
    ...
    if (/* shouldAddAnnotation */) {
      result.add(AnnotationEntry<S>(
        annotation: typedValue,
        // Used to be:
        // localPosition: localPosition,
        localPosition: localPosition - offset,
      ));
    }
    ...
  }
}
```

Conceptually, this has changed how `AnnotatedRegionLayer.offset`
and `size` are defined. They used to mean
"the clipping rectangle that restricts the annotation search",
while they now jointly represent
"the region of the annotation object".

从概念上讲，这改变了 `AnnotatedRegionLayer.offset` 和 `size` 的定义方式。它们曾经表示“限制注释搜索的剪切矩形”，而现在它们共同表示“注释对象的区域”。


## Migration guide

## 迁移指南


Code that is actively using this local position is probably
directly interacting with layers, since using render objects or
widgets have already made this result unreliable. In order to
preserve the previous behavior, you can reimplement
`AnnotatedRegionLayer` to return a local position without
subtracting the offset.

主动使用此本地位置的代码可能直接与图层交互，因为使用渲染对象或 widgets 已经使此结果不可靠。为了保留以前的行为，你可以重新实现 `AnnotatedRegionLayer` 以返回本地位置而不减去偏移量。


## Timeline

## 时间线


Landed in version: 1.15.2<br>
登陆版本：1.15.2
In stable release: 1.17
稳定版本：1.17

## References

## 参考资料


API documentation:

API 文档：


* [`AnnotatedRegionLayer`][]
* [`AnnotationEntry`][]

Relevant issues:

相关 issue：


* [Issue #49568][]

  [问题#49568][Issue #49568]


Relevant PR:

相关 PR：


* [Make Annotation's localPosition relative to object][]

  [使Annotation的localPosition相对于对象][Make Annotation's localPosition relative to object]


[`AnnotatedRegionLayer`]: {{site.api}}/flutter/rendering/AnnotatedRegionLayer-class.html
[`AnnotationEntry`]: {{site.api}}/flutter/rendering/AnnotationEntry-class.html
[Issue #49568]: {{site.repo.flutter}}/issues/49568
[Make Annotation's localPosition relative to object]: {{site.repo.flutter}}/pull/50157
