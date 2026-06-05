---
# title: DevTools 2.17.0 release notes
title: DevTools 2.17.0 版本说明
# shortTitle: 2.17.0 release notes
shortTitle: 2.17.0 版本说明
breadcrumb: 2.17.0
# description: Release notes for Dart and Flutter DevTools version 2.17.0.
description: Dart 和 Flutter DevTools 2.17.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.17.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.17.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Inspector updates

## 检查器更新

* Added support for manually setting the package directories for your app.
  If you've ever loaded the Inspector and noticed that
  some of your widgets aren't present in the widget tree, this might
  indicate that the package directories for your app
  haven't been set or detected properly.
  Your package directories determine which widgets
  the Inspector considers to be from _your_ application.
  If you see an empty Inspector widget tree,
  or if you develop widgets across multiple packages,
  and want widgets from all these locations to show up in your tree,
  check the **Inspector Settings** dialog to ensure that your package
  directories are properly configured -
  [#4306](https://github.com/flutter/devtools/pull/4306)

  添加了手动设置应用 package 目录的支持。
  如果你曾加载检查器并注意到某些 widget 未出现在 widget 树中，
  这可能表明应用的 package 目录未正确设置或检测。
  package 目录决定了检查器将哪些 widget 视为来自*你的*应用。
  如果你看到空的检查器 widget 树，
  或者你在多个 package 中开发 widget，
  并希望所有这些位置的 widget 都显示在树中，
  请检查 **Inspector Settings** 对话框，确保 package 目录配置正确 -
  [#4306](https://github.com/flutter/devtools/pull/4306)

  ![frame_analysis](/assets/images/docs/tools/devtools/release-notes/images-2.17.0/package_directories.png "package directories")

## Performance updates

## 性能更新

* Added a **Frame Analysis** tab to the Performance page.
  When analyzing a janky Flutter frame,
  this view provides hints for how to diagnose the jank and
  detects expensive operations that might have
  contributed to the slow frame time.
  This view also shows a breakdown of your Flutter frame time
  per phase (**Build**, **Layout**, **Paint**, and **Raster**)
  to try to guide you in the right direction -
  [#4339](https://github.com/flutter/devtools/pull/4339)

  在 Performance 页面添加了 **Frame Analysis** 标签页。
  分析卡顿的 Flutter 帧时，
  此视图提供诊断卡顿的提示，
  并检测可能导致帧时间变慢的昂贵操作。
  此视图还按阶段（**Build**、**Layout**、**Paint** 和 **Raster**）
  分解 Flutter 帧时间，
  帮助你找到正确的方向 -
  [#4339](https://github.com/flutter/devtools/pull/4339)

  ![frame_analysis](/assets/images/docs/tools/devtools/release-notes/images-2.17.0/frame_analysis.png "frame analysis")

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.16.0...v2.17.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.16.0...v2.17.0)。
