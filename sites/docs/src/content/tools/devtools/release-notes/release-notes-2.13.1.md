---
# title: DevTools 2.13.1 release notes
title: DevTools 2.13.1 版本说明
# shortTitle: 2.13.1 release notes
shortTitle: 2.13.1 版本说明
breadcrumb: 2.13.1
# description: Release notes for Dart and Flutter DevTools version 2.13.1.
description: Dart 和 Flutter DevTools 2.13.1 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.13.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.13.1 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* This release included a lot of cleanup and reduction in technical debt.
  The most notable is the completion of our migration to sound null safety.

  此版本包含大量清理工作和技术债务的削减。
  最值得注意的是完成了向健全空安全的迁移。
* Show release notes in IDE embedded versions of DevTools -
  [#4053](https://github.com/flutter/devtools/pull/4053)

  在 IDE 嵌入式版本的 DevTools 中显示版本说明 -
  [#4053](https://github.com/flutter/devtools/pull/4053)
* Polish to the DevTools footer -
  [#3989](https://github.com/flutter/devtools/pull/3989),
  [#4026](https://github.com/flutter/devtools/pull/4026),
  [#4041](https://github.com/flutter/devtools/pull/4041),
  [#4076](https://github.com/flutter/devtools/pull/4076)

  优化了 DevTools 页脚 -
  [#3989](https://github.com/flutter/devtools/pull/3989),
  [#4026](https://github.com/flutter/devtools/pull/4026),
  [#4041](https://github.com/flutter/devtools/pull/4041),
  [#4076](https://github.com/flutter/devtools/pull/4076)

## Performance updates

## 性能更新

* Added a new feature to help you debug raster jank in your Flutter app.
  This feature allows you to take a snapshot of the
  current screen shown in your app, and then
  break down rendering time for that scene by layer.
  This can help you identify parts of a scene that are expensive to rasterize -
  [#4046](https://github.com/flutter/devtools/pull/4046)

  添加了一项新功能，帮助你调试 Flutter 应用中的光栅化卡顿。
  此功能让你可以对应用中当前显示的屏幕进行快照，
  然后按图层分解该场景的渲染时间。
  这可以帮助你识别场景中光栅化开销较大的部分 -
  [#4046](https://github.com/flutter/devtools/pull/4046)

  ![raster-metrics-feature](/assets/images/docs/tools/devtools/release-notes/images-2.13.1/image1.png "raster metrics feature")

* Added a scope setting for "Track Widget Builds", allowing
  you to specify whether widget builds should be tracked in
  your code only or in all code -
  [#4010](https://github.com/flutter/devtools/pull/4010)

  为「Track Widget Builds」添加了作用域设置，
  让你可以指定是仅追踪你的代码中的 widget 构建，
  还是追踪所有代码中的 widget 构建 -
  [#4010](https://github.com/flutter/devtools/pull/4010)

  ![track-widget-builds-scope-setting](/assets/images/docs/tools/devtools/release-notes/images-2.13.1/image2.png "track widget builds scope setting")

## CPU profiler updates

## CPU 性能分析器更新

* Use package uris instead of file uris in the CPU profiler "Source" column -
  [#3932](https://github.com/flutter/devtools/pull/3932)

  在 CPU 性能分析器的「Source」列中使用 package URI 而非 file URI -
  [#3932](https://github.com/flutter/devtools/pull/3932)

## Debugger updates

## 调试器更新

* Fix scrolling bug with debugger breakpoints -
  [#4074](https://github.com/flutter/devtools/pull/4074)

  修复了调试器断点的滚动 bug -
  [#4074](https://github.com/flutter/devtools/pull/4074)

## Flutter inspector updates

## Flutter 检查器更新

* Add support for displaying flex values larger than 5 in the Layout Explorer -
  [#4055](https://github.com/flutter/devtools/pull/4055)

  在 Layout Explorer 中添加了对显示大于 5 的 flex 值的支持 -
  [#4055](https://github.com/flutter/devtools/pull/4055)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.12.2...v2.13.1).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.12.2...v2.13.1)。
