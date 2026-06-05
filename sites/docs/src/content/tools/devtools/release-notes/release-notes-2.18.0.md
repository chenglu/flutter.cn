---
# title: DevTools 2.18.0 release notes
title: DevTools 2.18.0 版本说明
# shortTitle: 2.18.0 release notes
shortTitle: 2.18.0 版本说明
breadcrumb: 2.18.0
# description: Release notes for Dart and Flutter DevTools version 2.18.0.
description: Dart 和 Flutter DevTools 2.18.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.18.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.18.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Inspector updates

## 检查器更新

- Auto scrolling behavior improved when snapping a widget into focus -
  [#4283](https://github.com/flutter/devtools/pull/4283)

  改进了将 widget 聚焦时的自动滚动行为 -
  [#4283](https://github.com/flutter/devtools/pull/4283)
- Fix issue where widget inspector wouldn't load when
  connecting to a paused app -
  [#4527](https://github.com/flutter/devtools/pull/4527)

  修复了连接到已暂停应用时 widget 检查器无法加载的问题 -
  [#4527](https://github.com/flutter/devtools/pull/4527)
- Improve widget inspector hover cards to show progress while waiting for data -
  [#4488](https://github.com/flutter/devtools/pull/4488)

  改进了 widget 检查器悬停卡片，在等待数据时显示进度 -
  [#4488](https://github.com/flutter/devtools/pull/4488)

## Performance updates

## 性能更新

- Fix issue where scrollbar would go out of sync with the frame content -
  [#4503](https://github.com/flutter/devtools/pull/4503)

  修复了滚动条与帧内容不同步的问题 -
  [#4503](https://github.com/flutter/devtools/pull/4503)
- Add offline support for raster stats -
  [#4491](https://github.com/flutter/devtools/pull/4491)

  为光栅统计添加了离线支持 -
  [#4491](https://github.com/flutter/devtools/pull/4491)
- Add 'Rendering time' column to Raster Metrics tab -
  [#4474](https://github.com/flutter/devtools/pull/4474)

  在 Raster Metrics 标签页中添加了「Rendering time」列 -
  [#4474](https://github.com/flutter/devtools/pull/4474)

  ![render-time-column](/assets/images/docs/tools/devtools/release-notes/images-2.18.0/render-time-column.png "Rendering time column in the Raster Metrics tab")

## CPU profiler updates

## CPU 性能分析器更新

- Fix crash when an empty frame is filtered -
  [#4502](https://github.com/flutter/devtools/pull/4502)

  修复了过滤空帧时的崩溃问题 -
  [#4502](https://github.com/flutter/devtools/pull/4502)
- Fix bugs in CPU profile trees -
  [#4413](https://github.com/flutter/devtools/pull/4413)

  修复了 CPU 性能分析树中的 bug -
  [#4413](https://github.com/flutter/devtools/pull/4413)
- UI Cleanup - [#4404](https://github.com/flutter/devtools/pull/4404)

  UI 清理 - [#4404](https://github.com/flutter/devtools/pull/4404)

## Memory updates

## 内存更新

- Add Profile and Allocation Tracing sub-tabs -
  [#4523](https://github.com/flutter/devtools/pull/4523)

  添加了 Profile 和 Allocation Tracing 子标签页 -
  [#4523](https://github.com/flutter/devtools/pull/4523)

  ![profile](/assets/images/docs/tools/devtools/release-notes/images-2.18.0/profile.png "Profile in Memory tab")

  ![allocation-tracing](/assets/images/docs/tools/devtools/release-notes/images-2.18.0/allocation-tracing.png "Allocation Tracing in Memory tab")

- Implement snapshot visualization -
  [#4473](https://github.com/flutter/devtools/pull/4473)

  实现了快照可视化 -
  [#4473](https://github.com/flutter/devtools/pull/4473)

## Debugger updates

## 调试器更新

- Fix bug for file opener and search -
  [#4525](https://github.com/flutter/devtools/pull/4525)

  修复了文件打开器和搜索的 bug -
  [#4525](https://github.com/flutter/devtools/pull/4525)
- Fix the code view's scrollable area -
  [#4448](https://github.com/flutter/devtools/pull/4448)

  修复了代码视图的可滚动区域 -
  [#4448](https://github.com/flutter/devtools/pull/4448)
- Allow syntax highlighting on nested captures in parser -
  [#4427](https://github.com/flutter/devtools/pull/4427)

  允许解析器对嵌套捕获进行语法高亮 -
  [#4427](https://github.com/flutter/devtools/pull/4427)

## Network profiler updates

## 网络性能分析器更新

- When on the Network tab, network recordings now continue working
  after the app hot restarts -
  [#4438](https://github.com/flutter/devtools/pull/4438)

  在 Network 标签页上，应用热重启后网络录制现在可以继续工作 -
  [#4438](https://github.com/flutter/devtools/pull/4438)

## Logging updates

## 日志更新

- Log messages from non-stdout sources are now shown -
  [#4487](https://github.com/flutter/devtools/pull/4487)

  现在会显示来自非 stdout 源的日志消息 -
  [#4487](https://github.com/flutter/devtools/pull/4487)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.17.0...v2.18.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.17.0...v2.18.0)。
