---
# title: DevTools 2.44.0 release notes
title: DevTools 2.44.0 发布说明
# shortTitle: 2.44.0 release notes
shortTitle: 2.44.0 发布说明
breadcrumb: 2.44.0
# description: Release notes for Dart and Flutter DevTools version 2.44.0.
description: Dart 和 Flutter DevTools 2.44.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.44.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.44.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Fixed various memory leaks and lifecycle issues. -
  [#8901](https://github.com/flutter/devtools/pull/8901),
  [#8902](https://github.com/flutter/devtools/pull/8902),
  [#8907](https://github.com/flutter/devtools/pull/8907),
  [#8917](https://github.com/flutter/devtools/pull/8917),
  [#8932](https://github.com/flutter/devtools/pull/8932),
  [#8933](https://github.com/flutter/devtools/pull/8933),
  [#8934](https://github.com/flutter/devtools/pull/8934),
  [#8935](https://github.com/flutter/devtools/pull/8935),
  [#8937](https://github.com/flutter/devtools/pull/8937),
  [#8953](https://github.com/flutter/devtools/pull/8953),
  [#8969](https://github.com/flutter/devtools/pull/8969),
  [#8970](https://github.com/flutter/devtools/pull/8970),
  [#8975](https://github.com/flutter/devtools/pull/8975)

  修复了各种内存泄漏和生命周期问题。-
  [#8901](https://github.com/flutter/devtools/pull/8901),
  [#8902](https://github.com/flutter/devtools/pull/8902),
  [#8907](https://github.com/flutter/devtools/pull/8907),
  [#8917](https://github.com/flutter/devtools/pull/8917),
  [#8932](https://github.com/flutter/devtools/pull/8932),
  [#8933](https://github.com/flutter/devtools/pull/8933),
  [#8934](https://github.com/flutter/devtools/pull/8934),
  [#8935](https://github.com/flutter/devtools/pull/8935),
  [#8937](https://github.com/flutter/devtools/pull/8937),
  [#8953](https://github.com/flutter/devtools/pull/8953),
  [#8969](https://github.com/flutter/devtools/pull/8969),
  [#8970](https://github.com/flutter/devtools/pull/8970),
  [#8975](https://github.com/flutter/devtools/pull/8975)

## CPU profiler updates

## CPU 分析器更新

* Improved the load time and memory usage of CPU profiles.
  * [#8892](https://github.com/flutter/devtools/pull/8892)
  * [#8878](https://github.com/flutter/devtools/pull/8878)
  * [#8839](https://github.com/flutter/devtools/pull/8839)

  改进了 CPU 配置文件的加载时间和内存使用量。
  * [#8892](https://github.com/flutter/devtools/pull/8892)
  * [#8878](https://github.com/flutter/devtools/pull/8878)
  * [#8839](https://github.com/flutter/devtools/pull/8839)
* Fixed incorrect duration calculations when there is time during which no
  samples were taken - [#8941](https://github.com/flutter/devtools/pull/8941).

  修复了在没有采集样本的时间段内持续时间计算不正确的问题 - [#8941](https://github.com/flutter/devtools/pull/8941).

## Memory updates

## 内存更新

* Changed the memory heap snapshot tool so that references are
  included in snapshots by default. -
  [#8899](https://github.com/flutter/devtools/pull/8899)

  更改了内存堆快照工具，使引用默认包含在快照中。-
  [#8899](https://github.com/flutter/devtools/pull/8899)

## Debugger updates

## 调试器更新

* Added a tooltip to describe the exception mode drop-down. -
  [#8849](https://github.com/flutter/devtools/pull/8849)

  添加了工具提示来描述异常模式下拉菜单。-
  [#8849](https://github.com/flutter/devtools/pull/8849)
* Updated syntax highlighting with support for digit separators
  and improved comment and string interpolation handling. -
  [#8861](https://github.com/flutter/devtools/pull/8861)

  更新了语法高亮，支持数字分隔符，
  并改进了注释和字符串插值处理。-
  [#8861](https://github.com/flutter/devtools/pull/8861)
* Updated `string_scanner` dependency to avoid some syntax highlighting issues
  when source contains `\r\n` in certain positions on Windows. -
  [#8904](https://github.com/flutter/devtools/pull/8904)

  更新了 `string_scanner` 依赖，以避免在 Windows 上
  源文件在某些位置包含 `\r\n` 时出现一些语法高亮问题。-
  [#8904](https://github.com/flutter/devtools/pull/8904)
* Added soft line wrapping in the debugger console.
  [#8855](https://github.com/flutter/devtools/pull/8855).

  在调试器控制台中添加了软换行。
  [#8855](https://github.com/flutter/devtools/pull/8855).

## Network profiler updates

## 网络分析器更新

* Added offline support for the network screen (thanks to @hrajwade96!) -
  [#8332](https://github.com/flutter/devtools/pull/8332)

  为网络屏幕添加了离线支持（感谢 @hrajwade96！）-
  [#8332](https://github.com/flutter/devtools/pull/8332)

  ![Network profiler controls](/assets/images/docs/tools/devtools/release-notes/images-2.44.0/network_controls.png "Network profiler controls")

  ![Network profiler open / save button](/assets/images/docs/tools/devtools/release-notes/images-2.44.0/network_open_save_button.png "Network profiler open / save button")

* Changed the context menu style to be consistent with other screens
  [#8859](https://github.com/flutter/devtools/pull/8859).

  更改了上下文菜单样式，使其与其他屏幕保持一致
  [#8859](https://github.com/flutter/devtools/pull/8859).

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.44.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.44.0)。
