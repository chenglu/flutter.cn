---
# title: DevTools 2.37.2 release notes
title: DevTools 2.37.2 发布说明
# shortTitle: 2.37.2 release notes
shortTitle: 2.37.2 发布说明
breadcrumb: 2.37.2
# description: Release notes for Dart and Flutter DevTools version 2.37.2.
description: Dart 和 Flutter DevTools 2.37.2 版本发布说明。
showToc: false
ai-translated: true
---

The 2.37.2 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.37.2 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Improved messaging when a screen is unavailable for the
  platform of the connected app. - [#7958](https://github.com/flutter/devtools/pull/7958)

  改进了当屏幕对连接应用的平台不可用时显示的消息。- [#7958](https://github.com/flutter/devtools/pull/7958)
* Fixed a bug where an infinite spinner was shown upon
  app disconnect. - [#7992](https://github.com/flutter/devtools/pull/7992)

  修复了应用断开连接时显示无限加载旋转器的 bug。- [#7992](https://github.com/flutter/devtools/pull/7992)
* Fixed a bug where trying to reuse a disconnected DevTools instance would
  fail. - [#8009](https://github.com/flutter/devtools/pull/8009)

  修复了尝试重用已断开连接的 DevTools 实例会失败的 bug。- [#8009](https://github.com/flutter/devtools/pull/8009)

## Performance updates

## 性能更新

* Removed the "Raster Stats" feature.
  This tool did not work for the Impeller rendering engine, and
  the information it gave for the SKIA rendering engine was
  often misleading and unactionable. Users should follow the
  official Flutter guidance for [Performance and optimization](/perf) when
  debugging the rendering performance of their Flutter apps. - [#7981](https://github.com/flutter/devtools/pull/7981).

  移除了「Raster Stats」功能。
  此工具不适用于 Impeller 渲染引擎，
  并且它为 SKIA 渲染引擎提供的信息通常具有误导性且无法采取行动。
  在调试 Flutter 应用的渲染性能时，用户应遵循
  [性能和优化](/perf) 的官方 Flutter 指南。- [#7981](https://github.com/flutter/devtools/pull/7981).

## Network profiler updates

## 网络分析器更新

* Fixed an issue where socket statistics were being reported as web sockets. - [#8061](https://github.com/flutter/devtools/pull/8061)

  修复了 socket 统计信息被报告为 web socket 的问题。- [#8061](https://github.com/flutter/devtools/pull/8061)

  ![Network profiler correctly displaying socket statistics](/assets/images/docs/tools/devtools/release-notes/images-2.37.2/socket-profiling.png "Network profiler correctly displaying socket statistics")

* Added query parameters to the request details view. - [#7825](https://github.com/flutter/devtools/pull/7825)

  在请求详情视图中添加了查询参数。- [#7825](https://github.com/flutter/devtools/pull/7825)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* Added buttons for all DevTools tools in the sidebar by default, even when
  there are no debug sessions available. - [#7947](https://github.com/flutter/devtools/pull/7947)

  默认在侧边栏中为所有 DevTools 工具添加按钮，即使没有可用的调试会话。- [#7947](https://github.com/flutter/devtools/pull/7947)

  ![DevTools tools in the sidebar](/assets/images/docs/tools/devtools/release-notes/images-2.37.2/devtools_in_sidebar.png)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.37.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.37.0)。
