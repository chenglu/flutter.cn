---
# title: DevTools 2.15.0 release notes
title: DevTools 2.15.0 版本说明
# shortTitle: 2.15.0 release notes
shortTitle: 2.15.0 版本说明
breadcrumb: 2.15.0
# description: Release notes for Dart and Flutter DevTools version 2.15.0.
description: Dart 和 Flutter DevTools 2.15.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.15.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.15.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* The DevTools 2.15 release includes improvements to all tables in
  DevTools (logging view, network profiler, CPU profiler, and so on) -
  [#4175](https://github.com/flutter/devtools/pull/4175)

  DevTools 2.15 版本改进了 DevTools 中的所有表格
  （日志视图、网络性能分析器、CPU 性能分析器等）-
  [#4175](https://github.com/flutter/devtools/pull/4175)

## Performance updates

## 性能更新

* Added outlines to each layer displayed in the Raster Metrics tool -
  [#4192](https://github.com/flutter/devtools/pull/4192)

  为 Raster Metrics 工具中显示的每个图层添加了轮廓 -
  [#4192](https://github.com/flutter/devtools/pull/4192)

  ![raster-metrics-layer-outlines](/assets/images/docs/tools/devtools/release-notes/images-2.15.0/image1.png "raster metrics layer outlines")

* Fix a bug with loading offline data -
  [#4189](https://github.com/flutter/devtools/pull/4189)

  修复了加载离线数据的 bug -
  [#4189](https://github.com/flutter/devtools/pull/4189)

## Network updates

## 网络更新

* Added a Json viewer with syntax highlighting for network responses -
  [#4167](https://github.com/flutter/devtools/pull/4167)

  为网络响应添加了带语法高亮的 Json 查看器 -
  [#4167](https://github.com/flutter/devtools/pull/4167)

  ![network-response-json-viewer](/assets/images/docs/tools/devtools/release-notes/images-2.15.0/image2.png "network response json viewer")

* Added the ability to copy network responses -
  [#4190](https://github.com/flutter/devtools/pull/4190)

  添加了复制网络响应的功能 -
  [#4190](https://github.com/flutter/devtools/pull/4190)

## Memory updates

## 内存更新

* Added the ability to select a different isolate from the DevTools footer -
  [#4173](https://github.com/flutter/devtools/pull/4173)

  添加了从 DevTools 页脚选择不同 isolate 的功能 -
  [#4173](https://github.com/flutter/devtools/pull/4173)
* Made the automatic snapshotting feature a configurable setting -
  [#4200](https://github.com/flutter/devtools/pull/4200)

  将自动快照功能设为可配置设置 -
  [#4200](https://github.com/flutter/devtools/pull/4200)

## CPU profiler

## CPU 性能分析器

* Stop manually truncating source URIs in the profiler tables -
  [#4166](https://github.com/flutter/devtools/pull/4166)

  停止在性能分析器表格中手动截断源 URI -
  [#4166](https://github.com/flutter/devtools/pull/4166)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.14.0...v2.15.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.14.0...v2.15.0)。
