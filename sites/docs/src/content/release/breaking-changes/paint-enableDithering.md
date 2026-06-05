---
# title: Paint.enableDithering is now true by default.
title: Paint.enableDithering 现在默认为 true。
# description: >-
#   Deprecation of user-configurable `Paint.enableDithering`.
description: >
  弃用用户可配置的“Paint.enableDithering”。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


[`Paint.enableDithering`][] is now `true` by default (previously, `false`),
and is _deprecated_ pending removal - Flutter no longer supports
user-configurable dithering settings.

[`Paint.enableDithering`][] 现在默认为“true”（之前为“false”），并且已_已弃用_待删除 - Flutter 不再支持用户可配置的抖动设置。


In addition, the dithering documentation states support is _only_ for gradients.

此外，抖动文档指出仅支持渐变。


## Background

## 背景


[`Paint.enableDithering`][] was added as a global option in [PR 13868][] as
a response to [Issue 44134][], which reported that gradients in Flutter had
visible banding artifacts:

[`Paint.enableDithering`][] 已作为全局选项添加到 [PR 13868][] 中，作为对 [问题 44134][Issue 44134] 的响应，该问题报告 Flutter 中的渐变具有可见的条带伪影：


> Gradients currently have a lot of color banding on all devices, and it looks
> very weird when using the pulse animation too. A solution is to make the
> gradients opaque, and to use dithered gradients with Skia. Dithered gradients
> aren't currently exposed, so adding a dither parameter to dart:ui's Paint
> class would be nice. We'd be able to manually draw our gradients with a
> CustomPainter.

> 目前，所有设备上的渐变都有很多色带，并且在使用脉冲动画时看起来也很奇怪。解决方案是使 > 渐变不透明，并使用 Skia 的抖动渐变。抖动渐变 > 目前尚未公开，因此向 dart:ui 的 Paint > 类添加抖动参数会很好。我们可以使用 > CustomPainter 手动绘制渐变。


![Example of banding](https://user-images.githubusercontent.com/30870216/210907719-4f4a1a8d-e28a-4d39-9e99-3635a26a0c74.png)

[Issue 118073][] reported that gradients in our new [Impeller][]
backend displayed visible banding artifacts in some gradients.
It was later discovered that Impeller didn't support the (rarely used)
[`Paint.enableDithering`][] property.

[问题 118073][Issue 118073] 报告我们新的 [Impeller][] 后端中的梯度在某些梯度中显示出可见的条带伪影。后来发现 Impeller 不支持（很少使用）[`Paint.enableDithering`][] 属性。


After adding dithering support to Impeller ([PR 44181][], [PR 44331][],
[PR 44522][]), and reviewing the performance impact of dithering (negligible),
the following observations were made:

在向 Impeller 添加抖动支持（[PR 44181][]、[PR 44331][]、[PR 44522][]）并审查抖动对性能的影响（可忽略不计）后，得出以下观察结果：


1. Consensus that gradients look good by default: [Issue 112498][].
1. Having a global option was intended to be deprecated: [PR 13868][].

1.默认情况下渐变看起来不错的共识：[问题 112498][Issue 112498]。 1. 打算弃用全局选项：[PR 13868][]。


This resulted in the following decisions:

这导致了以下决定：


1. Make dithering enabled by default.
1. Deprecate the global option.
1. Remove the global option in a future release.

1. 默认启用抖动。 1. 弃用全局选项。 1. 在未来版本中删除全局选项。


As part of that process, the ability for dithering to affect anything
other than gradients was removed in [PR 44730][] and [PR 44912][].
That was done to ease the process of migrating, because
Impeller will never support dithering for anything but gradients.

作为该过程的一部分，[PR 44730][] 和 [PR 44912][] 中删除了抖动影响除梯度之外的任何内容的能力。这样做是为了简化迁移过程，因为 Impeller 永远不会支持除梯度之外的任何内容的抖动。


## Migration guide

## 迁移指南


Most users and libraries will not need to make any changes.

大多数用户和图书馆不需要进行任何更改。


For users that maintain golden tests, you might
need to update your golden images to reflect the new default.
For example, if you use [`matchesGoldenFile`][] to
test a widget that contains a gradient:

对于维护黄金测试的用户，你可能需要更新黄金映像以反映新的默认值。例如，如果你使用 [`matchesGoldenFile`][] 来测试包含渐变的 widget：


```console
$ flutter test --update-goldens
```

While this is not expected to be a common case, you can
disable dithering temporarily by setting the `enableDithering` property in
your `main()` method (either in an app or test):

虽然这不会是常见情况，但你可以通过在“main()”方法（在应用程序或测试中）中设置“enableDithering”属性来临时禁用抖动：


```dart diff
  void main() {
+   // TODO: Remove this after XYZ.
+   Paint.enableDithering = false;

    runApp(MyApp());
  }
```

As the plan is to _permanently_ remove the `enableDithering` property, please
provide feedback in [Issue 112498][] if you have a use case that requires
disabling dithering (due to performance, crashes).

由于计划是_永久_删除 `enableDithering` 属性，因此如果你有需要禁用抖动的用例（由于性能、崩溃），请在 [问题 112498][Issue 112498] 中提供反馈。


If for some reason you _must_ draw gradients without dithering, you'll need to
write your own custom shader. Describing that is out of the scope of this
migration guide, but you can find some resources and examples:

如果由于某种原因你_必须_在不抖动的情况下绘制渐变，则你需要编写自己的自定义着色器。对此进行描述超出了本迁移指南的范围，但你可以找到一些资源和示例：


- [Writing and using fragment shaders][]


- [`hsl_linear_gradient.frag`][]

  [`hsl_线性_梯度.frag`][`hsl_linear_gradient.frag`]


**NOTE**: Flutter web does not support dithering: [Issue 134250][].

**注意**：Flutter Web 不支持抖动：[问题 134250][Issue 134250]。


## Timeline

## 时间轴


Landed in version: 3.14.0-0.1.pre<br>
In stable release: 3.16

登陆版本：3.14.0-0.1.pre<br> 稳定版本：3.16


## References

## 参考


API documentation:

API 文档：


- [`Paint.enableDithering`][]

  [`Paint.enableDithering`][]

- [`matchesGoldenFile`]

  [` 匹配黄金文件 `]


Relevant issues:

相关问题：


- [Issue 44134][]

  [问题 44134][Issue 44134]

- [Issue 112498][]

  [问题 112498][Issue 112498]

- [Issue 118073][]

  [问题 118073][Issue 118073]


Relevant PRs:

相关 PR：


- [PR 13868][]

  [PR 13868][]

- [PR 44181][]

  [PR 44181][]

- [PR 44331][]

  [PR 44331][]

- [PR 44522][]

  [PR 44522][]

- [PR 44730][]

  [PR 44730][]

- [PR 44912][]

  [PR 44912][]


[`Paint.enableDithering`]: {{site.api}}/flutter/dart-ui/Paint/enableDithering.html
[`matchesGoldenFile`]: {{site.api}}/flutter_test/matchesGoldenFile.html
[Impeller]: /perf/impeller
[PR 13868]: {{site.repo.engine}}/pull/13868
[PR 44181]: {{site.repo.engine}}/pull/44181
[PR 44331]: {{site.repo.engine}}/pull/44331
[PR 44522]: {{site.repo.engine}}/pull/44522
[PR 44730]: {{site.repo.engine}}/pull/44730
[PR 44912]: {{site.repo.engine}}/pull/44912
[Issue 44134]: {{site.repo.flutter}}/issues/44134
[Issue 112498]: {{site.repo.flutter}}/issues/112498
[Issue 118073]: {{site.repo.flutter}}/issues/118073
[Issue 134250]: {{site.repo.flutter}}/issues/134250
[Writing and using fragment shaders]: /ui/design/graphics/fragment-shaders
[`hsl_linear_gradient.frag`]: https://github.com/jonahwilliams/awesome_gradients/blob/a4e09c47ef1760bd7073beb60f49dad8ede5bb2e/shaders/hsl_linear_gradient.frag
