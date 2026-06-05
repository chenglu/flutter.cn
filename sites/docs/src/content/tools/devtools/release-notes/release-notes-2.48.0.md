---
# title: DevTools 2.48.0 release notes
title: DevTools 2.48.0 发布说明
# shortTitle: 2.48.0 release notes
shortTitle: 2.48.0 发布说明
breadcrumb: 2.48.0
# description: Release notes for Dart and Flutter DevTools version 2.48.0.
description: Dart 和 Flutter DevTools 2.48.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.48.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.48.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## Network profiler updates

## 网络分析器更新

* Fixed network logging after a hot restart. -
  [#9271](https://github.com/flutter/devtools/pull/9271).

  修复了热重启后的网络日志记录问题。-
  [#9271](https://github.com/flutter/devtools/pull/9271).

## Logging updates

## 日志更新

* Started displaying events related to timers in the Logging View. -
  [#9238](https://github.com/flutter/devtools/pull/9238).

  开始在 Logging View 中显示与 timer 相关的事件。-
  [#9238](https://github.com/flutter/devtools/pull/9238).

## Advanced developer mode updates

## 高级开发者模式更新

* Added a Queued Microtasks tab to the VM Tools screen, which allows a user to
  see details about the microtasks scheduled in an isolate's microtask queue.
  This tab currently only appears when DevTools is connected to a Flutter or
  Dart app started with `--profile-microtasks`. -
  [#9239](https://github.com/flutter/devtools/pull/9239).

  在 VM Tools 屏幕中添加了 Queued Microtasks 标签页，让你可以
  查看在 isolate 的微任务队列中调度的微任务详情。
  此标签页目前仅在 DevTools 连接到使用 `--profile-microtasks` 启动的
  Flutter 或 Dart 应用时出现。-
  [#9239](https://github.com/flutter/devtools/pull/9239).

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.48.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.48.0)。
