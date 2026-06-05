---
# title: DevTools 2.39.0 release notes
title: DevTools 2.39.0 发布说明
# shortTitle: 2.39.0 release notes
shortTitle: 2.39.0 发布说明
breadcrumb: 2.39.0
# description: Release notes for Dart and Flutter DevTools version 2.39.0.
description: Dart 和 Flutter DevTools 2.39.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.39.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.39.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Changed table columns to be sortable by default. - [#8175](https://github.com/flutter/devtools/pull/8175)

  将表格列默认改为可排序。- [#8175](https://github.com/flutter/devtools/pull/8175)
* Updated DevTools screen icons to match what is used in the Flutter-supported IDEs. - [#8181](https://github.com/flutter/devtools/pull/8181)

  更新了 DevTools 屏幕图标，以匹配 Flutter 支持的 IDE 中使用的图标。- [#8181](https://github.com/flutter/devtools/pull/8181)

## Memory updates

## 内存更新

* Enabled offline analysis of memory snapshots, as well as support for viewing memory
  data when an app disconnects. For example, this may happen when an app unexpectedly
  crashes or hits an out-of-memory issue. - [#7843](https://github.com/flutter/devtools/pull/7843),
  [#8093](https://github.com/flutter/devtools/pull/8093),
  [#8096](https://github.com/flutter/devtools/pull/8096)

  启用了内存快照的离线分析，以及应用断开连接时查看内存数据的支持。
  例如，当应用意外崩溃或遇到内存不足问题时可能会发生这种情况。-
  [#7843](https://github.com/flutter/devtools/pull/7843),
  [#8093](https://github.com/flutter/devtools/pull/8093),
  [#8096](https://github.com/flutter/devtools/pull/8096)

* Fixed issue where the memory chart could cause the connected application to hit an
  out of memory exception while allocating large, short-lived objects repeatedly. - [#8209](https://github.com/flutter/devtools/pull/8209)

  修复了内存图表可能导致连接的应用在反复分配大型短生命周期对象时
  遇到内存不足异常的问题。- [#8209](https://github.com/flutter/devtools/pull/8209)

## App size tool updates

## 应用大小工具更新

* Added UI polish to the file import views. [#8232](https://github.com/flutter/devtools/pull/8232)

  对文件导入视图进行了 UI 优化。[#8232](https://github.com/flutter/devtools/pull/8232)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.39.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.39.0)。
