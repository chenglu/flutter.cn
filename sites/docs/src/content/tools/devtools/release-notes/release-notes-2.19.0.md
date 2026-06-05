---
# title: DevTools 2.19.0 release notes
title: DevTools 2.19.0 版本说明
# shortTitle: 2.19.0 release notes
shortTitle: 2.19.0 版本说明
breadcrumb: 2.19.0
# description: Release notes for Dart and Flutter DevTools version 2.19.0.
description: Dart 和 Flutter DevTools 2.19.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.19.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.19.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Performance updates

## 性能更新

* Added a button to toggle the visibility of the Flutter Frames chart -
  [#4577](https://github.com/flutter/devtools/pull/4577)

  添加了切换 Flutter Frames 图表可见性的按钮 -
  [#4577](https://github.com/flutter/devtools/pull/4577)

  ![diff](/assets/images/docs/tools/devtools/release-notes/images-2.19.0/4577.png "Flutter Frames")

* Polish the debug mode warning to better describe which data is
  accurate in debug mode and which data may be misleading -
  [#3537](https://github.com/flutter/devtools/pull/3537)

  优化了 debug 模式警告，更好地描述哪些数据在 debug 模式下准确，
  哪些数据可能具有误导性 -
  [#3537](https://github.com/flutter/devtools/pull/3537)
* Reorder performance tool tabs and only show the CPU profiler
  for the "Timeline Events" tab -
  [#4629](https://github.com/flutter/devtools/pull/4629)

  重新排列了性能工具标签页，并仅在「Timeline Events」标签页中
  显示 CPU 性能分析器 -
  [#4629](https://github.com/flutter/devtools/pull/4629)

## Memory updates

## 内存更新

* Improvements to the memory Profile tab -
  [#4583](https://github.com/flutter/devtools/pull/4583)

  改进了内存 Profile 标签页 -
  [#4583](https://github.com/flutter/devtools/pull/4583)

## Debugger updates

## 调试器更新

* Fix an issue with hover cards where they were appearing
  but never disappearing -
  [#4627](https://github.com/flutter/devtools/pull/4627)

  修复了悬停卡片出现后永不消失的问题 -
  [#4627](https://github.com/flutter/devtools/pull/4627)
* Fix a bug with the file search autocomplete dialog -
  [#4409](https://github.com/flutter/devtools/pull/4409)

  修复了文件搜索自动补全对话框的 bug -
  [#4409](https://github.com/flutter/devtools/pull/4409)

## Network profiler updates

## 网络性能分析器更新

* Added a "Copy" button in the Network Request view
  (thanks to @netos23) -
  [#4509](https://github.com/flutter/devtools/pull/4509)

  在 Network Request 视图中添加了「Copy」按钮
  （感谢 @netos23）-
  [#4509](https://github.com/flutter/devtools/pull/4509)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.18.0...v2.19.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.18.0...v2.19.0)。
