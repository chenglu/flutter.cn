---
# title: Clip Behavior
title: 剪辑行为
# description: >
#   Flutter unifies clipBehavior and defaults to not clip in most cases.
description: >-
  Flutter 统一了clipBehavior，默认在大多数情况下不剪辑。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Flutter now defaults to _not_ clip except for a few specialized widgets
(such as `ClipRect`). To override the no-clip default,
explicitly set `clipBehavior` in widgets constructions.

Flutter 现在默认为 _not_ 剪辑，除了一些专门的 widget（例如 `ClipRect`）。要覆盖无剪辑默认值，请在 widgets 构造中显式设置 `clipBehavior` 。


## Context

## 背景


Flutter used to be slow because of clips. For example,
the Flutter gallery app benchmark had an average frame
rasterization time of about 35ms in May 2018,
where the budget for smooth 60fps rendering is 16ms.
By removing unnecessary clips and their related operations,
we saw an almost 2x speedup from 35ms/frame to 17.5ms/frame.

由于剪辑的原因，Flutter 过去很慢。例如，Flutter 画廊应用基准测试在 2018 年 5 月的平均帧光栅化时间约为 35 毫秒，其中平滑 60fps 渲染的预算为 16 毫秒。通过删除不必要的剪辑及其相关操作，我们看到速度几乎提高了 2 倍，从 35 毫秒/帧提高到 17.5 毫秒/帧。


{% comment %}
The following two images are not visible.

下面两张图是看不到的。

![](https://lh5.googleusercontent.com/Pn8FxuW2W3Cgvw9kIUvLLenrwXti7WRm_zPif3VJILa325d1Njm8aP47DXfK1r2Du-FwLKhI9umw5nMG6eNqn5fLnQBIt6VIPZ7Q2ETiCuXgQPD1cUYOeA-2Ph_DpvL27fK7m_Af)

Here's a comparison of transition with and without clips.

这是有剪辑和没有剪辑的过渡的比较。


![](https://lh5.googleusercontent.com/gSFKigrEoekji0juxTVjj29PlIizjuxJsetHsIegLt85zCHknRIUOeICjMdEBjBhPZDZXcEzFh1WCOrdmZa9KZ5vghgS7Uo9IDAKyBtEJ7h3tKfIHXf6A4vxrHfj1a_0kuT6f4r2)
{% endcomment %}

The biggest cost associated with clipping at that time is that Flutter
used to add a `saveLayer` call after each clip (unless it was a simple
axis-aligned rectangle clip) to avoid the bleeding edge artifacts
as described in [Issue 18057][]. Such behaviors were universal to
material apps through widgets like `Card`, `Chip`, `Button`, and so on,
which resulted in `PhysicalShape` and `PhysicalModel` clipping their content.

当时与剪辑相关的最大成本是 Flutter 用于在每个剪辑之后添加 `saveLayer` 调用（除非它是一个简单的轴对齐矩形剪辑），以避免出现边缘伪影，如[Issue 18057][]。这种行为对于通过 widget 的材料应用程序来说是普遍存在的，例如 `Card`、`Chip`、`Button` 等，这导致 `PhysicalShape` 和 `PhysicalModel` 剪辑其内容。


A `saveLayer` call is especially expensive in older devices because
it creates an offscreen render target, and a render target switch
can sometimes cost about 1ms.

`saveLayer` 调用在较旧的设备中尤其昂贵，因为它会创建离屏渲染目标，并且渲染目标切换有时可能需要大约 1 毫秒的时间。


Even without `saveLayer` call, a clip is still expensive
because it applies to all subsequent draws until it's restored.
Therefore a single clip may slow down the performance on
hundreds of draw operations.

即使没有 `saveLayer` 调用，剪辑仍然很昂贵，因为它适用于所有后续绘制，直到恢复为止。因此，单个剪辑可能会降低数百个绘制操作的性能。


In addition to performance issues, Flutter also suffered from
some correctness issues as the clip was not managed and implemented
in a single place. In several places, `saveLayer` was inserted
in the wrong place and it therefore only increased the performance
cost without fixing any bleeding edge artifacts.

除了性能 issues 之外，Flutter 还受到一些正确性 issues 的影响，因为剪辑不是在单个位置进行管理和实现的。在几个地方，`saveLayer` 被插入到错误的位置，因此它只会增加性能成本，而不会修复任何前沿工件。


So, we unified the `clipBehavior` control and its implementation in
this breaking change. The default `clipBehavior` is `Clip.none`
for most widgets to save performance, except the following:

因此，我们在此重大更改中统一了 `clipBehavior` 控件及其实现。大多数 widget 的默认 `clipBehavior` 是 `Clip.none` 以节省性能，但以下情况除外：


* `ClipPath` defaults to `Clip.antiAlias`

  `ClipPath` 默认为 `Clip.antiAlias`

* `ClipRRect` defaults to `Clip.antiAlias`

  `ClipRRect` 默认为 `Clip.antiAlias`

* `ClipRect` defaults to `Clip.hardEdge`

  `ClipRect` 默认为 `Clip.hardEdge`

* `Stack` defaults to `Clip.hardEdge`

  `Stack` 默认为 `Clip.hardEdge`

* `EditableText` defaults to `Clip.hardEdge`

  `EditableText` 默认为 `Clip.hardEdge`

* `ListWheelScrollView` defaults to `Clip.hardEdge`

  `ListWheelScrollView` 默认为 `Clip.hardEdge`

* `SingleChildScrollView` defaults to `Clip.hardEdge`

  `SingleChildScrollView` 默认为 `Clip.hardEdge`

* `NestedScrollView` defaults to `Clip.hardEdge`

  `NestedScrollView` 默认为 `Clip.hardEdge`

* `ShrinkWrappingViewport` defaults to `Clip.hardEdge`

  `ShrinkWrappingViewport` 默认为 `Clip.hardEdge`


## Migration guide

## 迁移指南


You have 4 choices for migrating your code:

你有 4 种迁移代码的选择：


1. Leave your code as is if your content does not need

  如果你的内容不需要，请保留你的代码

   to be clipped (for example, none of the widgets' children
   expand outside their parent's boundary).
   This will likely have a positive impact on your app's
   overall performance.

被剪裁（例如，widget 的子级都不会扩展到其父级边界之外）。这可能会对你的应用程序的整体性能产生积极影响。

2. Add `clipBehavior: Clip.hardEdge` if you need clipping,

  如果需要裁剪，请添加 `clipBehavior: Clip.hardEdge`，

   and clipping without anti-alias is good enough for your
   (and your clients') eyes. This is the common case
   when you clip rectangles or shapes with very small curved areas
   (such as the corners of rounded rectangles).

没有抗锯齿的剪辑对于你（和你的客户）的眼睛来说已经足够好了。当你剪切具有非常小的弯曲区域（例如圆角矩形的角）的矩形或形状时，这是常见的情况。

3. Add `clipBehavior: Clip.antiAlias` if you need

  如果需要，添加 `clipBehavior: Clip.antiAlias`

   anti-aliased clipping. This gives you smoother edges
   at a slightly higher cost. This is the common case when
   dealing with circles and arcs.

抗锯齿剪切。这可以让你以稍高的成本获得更平滑的边缘。这是处理圆和圆弧时的常见情况。

4. Add `clip.antiAliasWithSaveLayer` if you want the exact

  如果你想要确切的值，请添加 `clip.antiAliasWithSaveLayer`

   same behavior as before (May 2018). Be aware that it's
   very costly in performance. This is likely to be only
   rarely needed. One case where you might need this is if
   you have an image overlaid on a very different background color.
   In these cases, consider whether you can avoid overlapping
   multiple colors in one spot (for example, by having the
   background color only present where the image is absent).

与之前（2018 年 5 月）相同的行为。请注意，它的性能成本非常高。这可能只是很少需要。你可能需要此功能的一种情况是，如果你的图像覆盖在非常不同的背景颜色上。在这些情况下，请考虑是否可以避免在一个点上重叠多种颜色（例如，仅在图像不存在的位置显示背景颜色）。


For the `Stack` widget specifically, if you previously used
`overflow: Overflow.visible`, replace it with `clipBehavior: Clip.none`.

特别是对于 `Stack` widget，如果你之前使用过 `overflow: Overflow.visible`，请将其替换为 `clipBehavior: Clip.none`。


For the `ListWheelViewport` widget, if you previously specified
`clipToSize`, replace it with the corresponding `clipBehavior`:
`Clip.none` for `clipToSize = false` and
`Clip.hardEdge` for `clipToSize = true`.

对于 `ListWheelViewport` widget，如果你之前指定了 `clipToSize`，请将其替换为相应的 `clipBehavior`：对于 `clipToSize = false` 为 `Clip.none`，对于 `clipToSize = false` 为 `Clip.hardEdge` `clipToSize = true`。


Code before migration:

迁移前的代码：


```dart
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: const <Widget>[
              SizedBox(
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
```

Code after migration:

迁移后的代码：


```dart
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: const <Widget>[
              SizedBox(
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
```

## Timeline

## 时间线


Landed in version: _various_<br>
登陆版本：_各种_
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


API documentation:

API 文档：


* [`Clip`][]

Relevant issues:

相关 issue：


* [Issue 13736][]

  [问题 13736][Issue 13736]

* [Issue 18057][]

  [问题 18057][Issue 18057]

* [Issue 21830][]

  [问题 21830][Issue 21830]


Relevant PRs:

相关 PR：


* [PR 5420][]: Remove unnecessary saveLayer

  [PR 5420][]: 删除不必要的 saveLayer

* [PR 18576][]: Add Clip enum to Material and related widgets

  [PR 18576][]: 将 Clip 枚举添加到 Material 及相关 widgets

* [PR 18616][]: Remove saveLayer after clip from dart

  [PR 18616][]：从 dart 中删除剪辑后的 saveLayer

* [PR 5647][]: Add ClipMode to ClipPath/ClipRRect and PhysicalShape layers

  [PR 5647][]: 将 ClipMode 添加到 ClipPath/ClipRRect 和 PhysicalShape 图层

* [PR 5670][]: Add anti-alias switch to canvas clip calls

  [PR 5670][]：画布剪辑调用添加抗锯齿开关

* [PR 5853][]: Rename clip mode to clip behavior

  [PR 5853][]：将剪辑模式重命名为剪辑行为

* [PR 5868][]: Rename clip to clipBehavior in compositing.dart

  [PR 5868][]: 在 compositing.dart 中将 clip 重命名为 clipBehavior

* [PR 5973][]: Call drawPaint instead of drawPath if there's clip

  [PR 5973][]: 如果有 clip 则调用 drawPaint 而不是 drawPath

* [PR 5952][]: Call drawPath without clip if possible

  [PR 5952][]：如果可能的话，调用不带剪辑的 drawPath

* [PR 20205][]: Set default clipBehavior to Clip.none and update tests

  [PR 20205][]：将默认的 clipBehavior 设置为 Clip.none 并更新测试

* [PR 20538][]: Expose clipBehavior to more Material Buttons

  [PR 20538][]：将 clipBehavior 暴露给更多材质按钮

* [PR 20751][]: Add customBorder to InkWell so it can clip ShapeBorder

  [PR 20751][]：将 customBorder 添加到 InkWell 中，以便它可以剪辑 ShapeBorder

* [PR 20752][]: Set the default clip to Clip.none again

  [PR 20752][]：再次将默认剪辑设置为 Clip.none

* [PR 21012][]: Add default-no-clip tests to more buttons

  [PR 21012][]：为更多按钮添加默认无剪辑测试

* [PR 21703][]: Default clipBehavior of ClipRect to hardEdge

  [PR 21703][]：ClipRect 的默认 clipBehavior 为 hardEdge

* [PR 21826][]: Missing default hardEdge clip for ClipRectLayer

  [PR 21826][]：缺少 ClipRectLayer 的默认硬边剪辑


[PR 5420]:  {{site.repo.engine}}/pull/5420
[PR 5647]:  {{site.repo.engine}}/pull/5647
[PR 5670]:  {{site.repo.engine}}/pull/5670
[PR 5853]:  {{site.repo.engine}}/pull/5853
[PR 5868]:  {{site.repo.engine}}/pull/5868
[PR 5952]:  {{site.repo.engine}}/pull/5952
[PR 5973]:  {{site.repo.engine}}/pull/5937
[PR 18576]: {{site.repo.flutter}}/pull/18576
[PR 18616]: {{site.repo.flutter}}/pull/18616
[PR 20205]: {{site.repo.flutter}}/pull/20205
[PR 20538]: {{site.repo.flutter}}/pull/20538
[PR 20751]: {{site.repo.flutter}}/pull/20751
[PR 20752]: {{site.repo.flutter}}/pull/20752
[PR 21012]: {{site.repo.flutter}}/pull/21012
[PR 21703]: {{site.repo.flutter}}/pull/21703
[PR 21826]: {{site.repo.flutter}}/pull/21826

[`Clip`]: {{site.api}}/flutter/dart-ui/Clip.html
[Issue 13736]: {{site.repo.flutter}}/issues/13736
[Issue 18057]: {{site.repo.flutter}}/issues/18057
[Issue 21830]: {{site.repo.flutter}}/issues/21830
