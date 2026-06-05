---
# title: DevTools 2.34.1 release notes
title: DevTools 2.34.1 发布说明
# shortTitle: 2.34.1 release notes
shortTitle: 2.34.1 发布说明
breadcrumb: 2.34.1
# description: Release notes for Dart and Flutter DevTools version 2.34.1.
description: Dart 和 Flutter DevTools 2.34.1 版本发布说明。
showToc: false
ai-translated: true
---

The 2.34.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.34.1 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## General updates

## 常规更新

* Fixed an issue preventing DevTools from connecting to Flutter apps that
  are not launched from Flutter Tools. - [#6848](https://github.com/flutter/devtools/issues/6848)

  修复了阻止 DevTools 连接到非通过 Flutter Tools 启动的 Flutter 应用的问题。- [#6848](https://github.com/flutter/devtools/issues/6848)
* Improved performance of the FlatTable. -
  [#7391](https://github.com/flutter/devtools/pull/7391)

  改进了 FlatTable 的性能。-
  [#7391](https://github.com/flutter/devtools/pull/7391)

## Inspector updates

## 检查器更新

- Fixes an edge case where widgets from other packages could
  show up in the inspector tree. - [#7353](https://github.com/flutter/devtools/pull/7353)

  修复了一个边缘情况，即来自其他包的 widget 可能出现在检查器树中。- [#7353](https://github.com/flutter/devtools/pull/7353)

## Performance updates

## 性能更新

* Add a setting to include CPU samples in the Timeline. -
  [#7333](https://github.com/flutter/devtools/pull/7333), [#7369](https://github.com/flutter/devtools/pull/7369)

  添加了在 Timeline 中包含 CPU 样本的设置。-
  [#7333](https://github.com/flutter/devtools/pull/7333), [#7369](https://github.com/flutter/devtools/pull/7369)

  ![Timeline settings](/assets/images/docs/tools/devtools/release-notes/images-2.34.1/7369-timeline-settings.png "Timeline settings")

* Removed the legacy trace viewer.
  The legacy trace viewer was replaced with the
  embedded Perfetto trace viewer in DevTools version 2.21.1, but was
  available behind a setting to ensure a smooth rollout.
  This release of DevTools removes the legacy trace viewer entirely. - [#7316](https://github.com/flutter/devtools/pull/7316)

  移除了旧版跟踪查看器。
  旧版跟踪查看器在 DevTools 2.21.1 版本中已被嵌入式 Perfetto 跟踪查看器取代，
  但可通过设置使用以确保平稳过渡。
  此版本的 DevTools 完全移除了旧版跟踪查看器。- [#7316](https://github.com/flutter/devtools/pull/7316)
* Updated the Perfetto trace viewer build. -
  [#7445](https://github.com/flutter/devtools/pull/7445),
  [#7456](https://github.com/flutter/devtools/pull/7456),
  [#7480](https://github.com/flutter/devtools/pull/7480)

  更新了 Perfetto 跟踪查看器构建。-
  [#7445](https://github.com/flutter/devtools/pull/7445),
  [#7456](https://github.com/flutter/devtools/pull/7456),
  [#7480](https://github.com/flutter/devtools/pull/7480)
* Added a loading message to show when refreshing the timeline. - [#7463](https://github.com/flutter/devtools/pull/7463)

  添加了在刷新时间线时显示的加载消息。- [#7463](https://github.com/flutter/devtools/pull/7463)

  ![Loading message](/assets/images/docs/tools/devtools/release-notes/images-2.34.1/7463-overlay.png "Loading message")

## Memory updates

## 内存更新

* Enabled export of snapshots and improved snapshotting performance. -
  [#7197](https://github.com/flutter/devtools/pull/7197),
  [#7439](https://github.com/flutter/devtools/pull/7439),
  [#7449](https://github.com/flutter/devtools/pull/7449)

  启用了快照导出并改进了快照性能。-
  [#7197](https://github.com/flutter/devtools/pull/7197),
  [#7439](https://github.com/flutter/devtools/pull/7439),
  [#7449](https://github.com/flutter/devtools/pull/7449)

  ![Export snapshot](/assets/images/docs/tools/devtools/release-notes/images-2.34.1/7197-export.png "Export snapshot")

* Fixed failures during disconnect in tracing. - [#7440](https://github.com/flutter/devtools/pull/7440)

  修复了跟踪期间断开连接时的失败问题。- [#7440](https://github.com/flutter/devtools/pull/7440)

* Made class filter shared between
  the panes `Profile Memory` and `Diff Snapshots`. - [#7462](https://github.com/flutter/devtools/pull/7462)

  使 `Profile Memory` 和 `Diff Snapshots` 面板之间共享类过滤器。- [#7462](https://github.com/flutter/devtools/pull/7462)

## Network profiler updates

## 网络分析器更新

* Improved Network profiler performance. - [#7266](https://github.com/flutter/devtools/pull/7266)

  改进了 Network profiler 性能。- [#7266](https://github.com/flutter/devtools/pull/7266)
* Fixed a bug where selected pending requests weren't
  refreshing the tab once updated. - [#7266](https://github.com/flutter/devtools/pull/7266)

  修复了一个 bug，即选中的待处理请求在更新后不会刷新标签页。- [#7266](https://github.com/flutter/devtools/pull/7266)
* Fixed the JSON viewer so multiline strings are visible in their row, and
  through a tooltip. - [#7389](https://github.com/flutter/devtools/pull/7389)

  修复了 JSON 查看器，使多行字符串在其行中以及通过工具提示可见。- [#7389](https://github.com/flutter/devtools/pull/7389)
* Fixed JsonViewer where all of the
  expanded sections would snap closed. [#7367](https://github.com/flutter/devtools/pull/7367)

  修复了 JsonViewer 中所有展开部分会突然关闭的问题。[#7367](https://github.com/flutter/devtools/pull/7367)

## Deep Links tool updates

## 深层链接工具更新

* Automatically populate a list of Flutter projects from
  the connected IDE. - [#7415](https://github.com/flutter/devtools/pull/7415), [#7431](https://github.com/flutter/devtools/pull/7431)

  从已连接的 IDE 自动填充 Flutter 项目列表。- [#7415](https://github.com/flutter/devtools/pull/7415), [#7431](https://github.com/flutter/devtools/pull/7431)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.34.1).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.34.1)。
