---
# title: DevTools 2.7.0 release notes
title: DevTools 2.7.0 发布说明
# shortTitle: 2.7.0 release notes
shortTitle: 2.7.0 发布说明
breadcrumb: 2.7.0
# description: Release notes for Dart and Flutter DevTools version 2.7.0.
description: Dart 和 Flutter DevTools 2.7.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.7.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.7.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## General updates

## 常规更新

* Improvements for initial page load time -
  [#3309](https://github.com/flutter/devtools/pull/3309)

  改进了初始页面加载时间 -
  [#3309](https://github.com/flutter/devtools/pull/3309)
* Fix a couple scrollbar-related issues -
  [#3393](https://github.com/flutter/devtools/pull/3393),
  [#3401](https://github.com/flutter/devtools/pull/3401)

  修复了几个与滚动条相关的问题 -
  [#3393](https://github.com/flutter/devtools/pull/3393),
  [#3401](https://github.com/flutter/devtools/pull/3401)

## Debugger updates

## 调试器更新

* Add an open file dialog (ctrl / cmd + p) -
  [#3342](https://github.com/flutter/devtools/pull/3342),
  [#3354](https://github.com/flutter/devtools/pull/3354),
  [#3371](https://github.com/flutter/devtools/pull/3371),
  [#3384](https://github.com/flutter/devtools/pull/3384)

  添加了打开文件对话框（ctrl / cmd + p）-
  [#3342](https://github.com/flutter/devtools/pull/3342),
  [#3354](https://github.com/flutter/devtools/pull/3354),
  [#3371](https://github.com/flutter/devtools/pull/3371),
  [#3384](https://github.com/flutter/devtools/pull/3384)

  ![Open file dialog](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image1.gif "Open file dialog")

* Add a copy button to the call stack view -
  [#3334](https://github.com/flutter/devtools/pull/3334)

  在调用堆栈视图中添加了复制按钮 -
  [#3334](https://github.com/flutter/devtools/pull/3334)

  ![Call stack view](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image2.png "Call stack view")

## CPU profiler updates

## CPU 分析器更新

* Added functionality to load an app startup profile for Flutter apps.
  This profile will contain CPU samples from the initialization
  of the Dart VM up until the first Flutter frame has been rendered -
  [#3357](https://github.com/flutter/devtools/pull/3357)

  添加了为 Flutter 应用加载应用启动配置文件的功能。
  此配置文件将包含从 Dart VM 初始化
  到渲染第一个 Flutter 帧之间的 CPU 样本 -
  [#3357](https://github.com/flutter/devtools/pull/3357)

  ![Profile button](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image3.png "Profile button")

  When the app startup profile has been loaded,
  you will see that the "AppStartUp" user tag is selected for the profile.
  You can also load the app startup profile
  by selecting this user tag filter, when present,
  in the list of available user tags.

  加载应用启动配置文件后，
  你会看到为配置文件选中了「AppStartUp」用户标签。
  你也可以在可用用户标签列表中
  选择此用户标签过滤器（如果存在）来
  加载应用启动配置文件。

  ![User tag example](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image4.png "User tag example")

* Added multi-isolate support.
  Select which isolate you want to profile
  from the isolate selector at the bottom of the page -
  [#3362](https://github.com/flutter/devtools/pull/3362)

  添加了多 isolate 支持。
  从页面底部的 isolate 选择器中选择
  你要分析的 isolate -
  [#3362](https://github.com/flutter/devtools/pull/3362)

  ![isolate selector](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image5.png "isolate selector")

* Add class names to CPU stack frames in the profiler -
  [#3385](https://github.com/flutter/devtools/pull/3385)

  在 profiler 中为 CPU 堆栈帧添加类名 -
  [#3385](https://github.com/flutter/devtools/pull/3385)

  ![Class names](/assets/images/docs/tools/devtools/release-notes/images-2.7.0/image6.png "Class names")

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.6.0...v2.7.0).

要查看自上一版本以来的完整更改列表，请查看
[GitHub 上的差异](https://github.com/flutter/devtools/compare/v2.6.0...v2.7.0)。
