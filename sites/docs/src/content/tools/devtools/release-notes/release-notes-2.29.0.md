---
# title: DevTools 2.29.0 release notes
title: DevTools 2.29.0 版本说明
# shortTitle: 2.29.0 release notes
shortTitle: 2.29.0 版本说明
breadcrumb: 2.29.0
# description: Release notes for Dart and Flutter DevTools version 2.29.0.
description: Dart 和 Flutter DevTools 2.29.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.29.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.29.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Fix a bug with service extension states not
  being cleared on app disconnect. - [#6547](https://github.com/flutter/devtools/pull/6547)

  修复了应用断开连接时服务扩展状态未清除的 bug。- [#6547](https://github.com/flutter/devtools/pull/6547)

* Improved styling of bottom status bar when connected to an app. - [#6525](https://github.com/flutter/devtools/pull/6525)

  改进了连接到应用时底部状态栏的样式。- [#6525](https://github.com/flutter/devtools/pull/6525)

* Added a workaround to fix copy button functionality in VSCode. - [#6598](https://github.com/flutter/devtools/pull/6598)

  添加了变通方案以修复 VSCode 中的复制按钮功能。- [#6598](https://github.com/flutter/devtools/pull/6598)

## Performance updates

## 性能更新

* Added an option in the "Enhance Tracing" menu for tracking platform channel
  activity. This is useful for apps with plugins. - [#6515](https://github.com/flutter/devtools/pull/6515)

  在「Enhance Tracing」菜单中添加了追踪 platform channel
  活动的选项。这对使用插件的应用很有用。- [#6515](https://github.com/flutter/devtools/pull/6515)

  ![Track platform channels setting](/assets/images/docs/tools/devtools/release-notes/images-2.29.0/track_platform_channels.png "Track platform channels setting")

* Made the Performance screen available when there is no connected app.
  Performance data that was previously saved from DevTools can be
  reloaded for viewing from this screen. - [#6567](https://github.com/flutter/devtools/pull/6567)

  在没有连接应用时也可使用 Performance 屏幕。
  之前从 DevTools 保存的性能数据可以
  从此屏幕重新加载查看。- [#6567](https://github.com/flutter/devtools/pull/6567)

* Added an "Open" button to the Performance controls for
  loading data that was previously saved from DevTools. - [#6567](https://github.com/flutter/devtools/pull/6567)

  在 Performance 控件中添加了「Open」按钮，
  用于加载之前从 DevTools 保存的数据。- [#6567](https://github.com/flutter/devtools/pull/6567)

  ![Open file button on the performance screen](/assets/images/docs/tools/devtools/release-notes/images-2.29.0/open_file_performance_screen.png "Open file button on the performance screen")

## CPU profiler updates

## CPU 性能分析器更新

* Tree guidelines are now always enabled for the
  "Bottom Up" and "Call Tree" tabs. - [#6534](https://github.com/flutter/devtools/pull/6534)

  「Bottom Up」和「Call Tree」标签页现在始终启用树形参考线。- [#6534](https://github.com/flutter/devtools/pull/6534)

* Made the CPU profiler screen available when there is no connected app.
  CPU profiles that were previously saved from DevTools can be
  reloaded for viewing from this screen. - [#6567](https://github.com/flutter/devtools/pull/6567)

  在没有连接应用时也可使用 CPU 性能分析器屏幕。
  之前从 DevTools 保存的 CPU 性能分析配置可以
  从此屏幕重新加载查看。- [#6567](https://github.com/flutter/devtools/pull/6567)

* Added an "Open" button to the CPU profiler controls for loading data that
  was previously saved from DevTools. - [#6567](https://github.com/flutter/devtools/pull/6567)

  在 CPU 性能分析器控件中添加了「Open」按钮，
  用于加载之前从 DevTools 保存的数据。- [#6567](https://github.com/flutter/devtools/pull/6567)

## Network profiler updates

## 网络性能分析器更新

* Network statuses now show with an error color when the request failed. - [#6527](https://github.com/flutter/devtools/pull/6527)

  请求失败时，网络状态现在以错误颜色显示。- [#6527](https://github.com/flutter/devtools/pull/6527)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.29.0).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.29.0)。
