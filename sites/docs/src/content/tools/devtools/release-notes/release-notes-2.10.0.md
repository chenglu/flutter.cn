---
# title: DevTools 2.10.0 release notes
title: DevTools 2.10.0 版本说明
# shortTitle: 2.10.0 release notes
shortTitle: 2.10.0 版本说明
breadcrumb: 2.10.0
# description: Release notes for Dart and Flutter DevTools version 2.10.0.
description: Dart 和 Flutter DevTools 2.10.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.10.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.10.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Flutter inspector updates

## Flutter 检查器更新

* Added search support to the Widget Tree, and
  added a breadcrumb navigator to the Widget Details Tree to
  allow for quickly navigating through the tree hierarchy -
  [#3525](https://github.com/flutter/devtools/pull/3525)

  为 Widget Tree 添加了搜索支持，
  并为 Widget Details Tree 添加了面包屑导航器，
  让你可以快速浏览树形层级结构 -
  [#3525](https://github.com/flutter/devtools/pull/3525)

  ![inspector search](/assets/images/docs/tools/devtools/release-notes/images-2.10.0/image1.png "inspector_search")

## CPU profiler updates

## CPU 性能分析器更新

* Fix a null reference in the CPU profiler
  when loading an offline snapshot -
  [#3596](https://github.com/flutter/devtools/pull/3596)

  修复了加载离线快照时 CPU 性能分析器中的空引用问题 -
  [#3596](https://github.com/flutter/devtools/pull/3596)

## Debugger updates

## 调试器更新

* Added support for multi-token file search, and
  improved search match prioritization to
  rank file name matches over full path matches -
  [#3582](https://github.com/flutter/devtools/pull/3582)

  添加了多词元文件搜索支持，
  并改进了搜索匹配优先级，
  使文件名匹配优先于完整路径匹配 -
  [#3582](https://github.com/flutter/devtools/pull/3582)
* Fix some focus-related issues -
  [#3602](https://github.com/flutter/devtools/pull/3602)

  修复了一些与焦点相关的问题 -
  [#3602](https://github.com/flutter/devtools/pull/3602)

## Logging view updates

## 日志视图更新

* Fix a fatal error that occurred when
  filtering logs more than once -
  [#3588](https://github.com/flutter/devtools/pull/3588)

  修复了多次过滤日志时发生的致命错误 -
  [#3588](https://github.com/flutter/devtools/pull/3588)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.9.2...v2.10.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.9.2...v2.10.0)。
