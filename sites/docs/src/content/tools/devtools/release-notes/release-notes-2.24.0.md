---
# title: DevTools 2.24.0 release notes
title: DevTools 2.24.0 版本说明
# shortTitle: 2.24.0 release notes
shortTitle: 2.24.0 版本说明
breadcrumb: 2.24.0
# description: Release notes for Dart and Flutter DevTools version 2.24.0.
description: Dart 和 Flutter DevTools 2.24.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.24.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.24.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Improve the overall performance of DevTools tables -
  [#5664](https://github.com/flutter/devtools/pull/5664),
  [#5696](https://github.com/flutter/devtools/pull/5696)

  改进了 DevTools 表格的整体性能 -
  [#5664](https://github.com/flutter/devtools/pull/5664),
  [#5696](https://github.com/flutter/devtools/pull/5696)

## CPU profiler updates

## CPU 性能分析器更新

* Fix bug with CPU flame chart selection and tooltips -
  [#5676](https://github.com/flutter/devtools/pull/5676)

  修复了 CPU 火焰图选择和工具提示的 bug -
  [#5676](https://github.com/flutter/devtools/pull/5676)

## Debugger updates

## 调试器更新

* Improve support for inspecting
  `UserTag` and `MirrorReferent` instances -
  [#5490](https://github.com/flutter/devtools/pull/5490)

  改进了检查 `UserTag` 和 `MirrorReferent` 实例的支持 -
  [#5490](https://github.com/flutter/devtools/pull/5490)
* Fix expression evaluation bug where
  selecting an autocomplete result for a field would clear the current input -
  [#5717](https://github.com/flutter/devtools/pull/5717)

  修复了表达式求值 bug：选择字段的自动补全结果会清除当前输入 -
  [#5717](https://github.com/flutter/devtools/pull/5717)
* Make selection of a stack frame
  scroll to the frame location in the source code -
  [#5722](https://github.com/flutter/devtools/pull/5722)

  选择堆栈帧时自动滚动到源代码中的帧位置 -
  [#5722](https://github.com/flutter/devtools/pull/5722)
* Improve performance of searching for a file and searching in a file -
  [#5733](https://github.com/flutter/devtools/pull/5733)

  改进了搜索文件和在文件中搜索的性能 -
  [#5733](https://github.com/flutter/devtools/pull/5733)
* Disable syntax highlighting for files with more than 100,000 characters
  due to performance constraints -
  [#5743](https://github.com/flutter/devtools/pull/5743)

  由于性能限制，对超过 100,000 个字符的文件禁用语法高亮 -
  [#5743](https://github.com/flutter/devtools/pull/5743)
* Fix bug where source code wasn't visible if
  syntax highlighting for a file was disabled -
  [#5743](https://github.com/flutter/devtools/pull/5743)

  修复了文件语法高亮被禁用时源代码不可见的 bug -
  [#5743](https://github.com/flutter/devtools/pull/5743)
* Prevent file names and source code from getting out of sync -
  [#5827](https://github.com/flutter/devtools/pull/5827)

  防止文件名和源代码不同步 -
  [#5827](https://github.com/flutter/devtools/pull/5827)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.23.1...v2.24.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.23.1...v2.24.0)。
