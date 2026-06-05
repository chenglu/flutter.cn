---
# title: DevTools 2.23.1 release notes
title: DevTools 2.23.1 版本说明
# shortTitle: 2.23.1 release notes
shortTitle: 2.23.1 版本说明
breadcrumb: 2.23.1
# description: Release notes for Dart and Flutter DevTools version 2.23.1.
description: Dart 和 Flutter DevTools 2.23.1 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.23.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.23.1 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Update DevTools to the new Material 3 design -
  [#5429](https://github.com/flutter/devtools/pull/5429)

  将 DevTools 更新为新的 Material 3 设计 -
  [#5429](https://github.com/flutter/devtools/pull/5429)
* Use the default Flutter service worker -
  [#5331](https://github.com/flutter/devtools/pull/5331)

  使用默认的 Flutter service worker -
  [#5331](https://github.com/flutter/devtools/pull/5331)
* Added the new verbose logging feature for helping us debug user issues -
  [#5404](https://github.com/flutter/devtools/pull/5404)

  添加了新的详细日志功能，帮助我们调试用户问题 -
  [#5404](https://github.com/flutter/devtools/pull/5404)

  ![verbose logging](/assets/images/docs/tools/devtools/release-notes/images-2.23.1/verbose-logging.png "verbose_logging")

* Fix a bug where some asynchronous errors were not being reported -
  [#5456](https://github.com/flutter/devtools/pull/5456)

  修复了部分异步错误未被报告的 bug -
  [#5456](https://github.com/flutter/devtools/pull/5456)
* Added support for viewing data after an app disconnects for
  screens that support offline viewing
  (currently only the Performance and CPU profiler pages) -
  [#5509](https://github.com/flutter/devtools/pull/5509)

  为支持离线查看的页面添加了应用断开后查看数据的支持
  （目前仅 Performance 和 CPU 性能分析器页面）-
  [#5509](https://github.com/flutter/devtools/pull/5509)
* Include settings button in the footer of the embedded view -
  [#5528](https://github.com/flutter/devtools/pull/5528)

  在嵌入式视图的页脚中包含设置按钮 -
  [#5528](https://github.com/flutter/devtools/pull/5528)

## Performance updates

## 性能更新

* Fix a performance regression in timeline event processing -
  [#5460](https://github.com/flutter/devtools/pull/5460)

  修复了时间线事件处理中的性能回退 -
  [#5460](https://github.com/flutter/devtools/pull/5460)
* Persist a user's preference for whether the
  Flutter Frames chart should be shown by default -
  [#5339](https://github.com/flutter/devtools/pull/5339)

  持久化用户对 Flutter Frames 图表是否默认显示的首选项 -
  [#5339](https://github.com/flutter/devtools/pull/5339)
* Point users to [Impeller](https://docs.flutter.dev/perf/impeller) when
  shader compilation jank is detected on an iOS device -
  [#5455](https://github.com/flutter/devtools/pull/5455)

  在 iOS 设备上检测到着色器编译卡顿时，
  引导用户查看 [Impeller](https://docs.flutter.dev/perf/impeller) -
  [#5455](https://github.com/flutter/devtools/pull/5455)
* Remove the CPU profiler from the legacy trace viewer -
  [#5539](https://github.com/flutter/devtools/pull/5539)

  从旧版追踪查看器中移除了 CPU 性能分析器 -
  [#5539](https://github.com/flutter/devtools/pull/5539)

## CPU profiler updates

## CPU 性能分析器更新

* Add a Method Table to the CPU profiler -
  [#5366](https://github.com/flutter/devtools/pull/5366)

  为 CPU 性能分析器添加了 Method Table -
  [#5366](https://github.com/flutter/devtools/pull/5366)

  ![Method table](/assets/images/docs/tools/devtools/release-notes/images-2.23.1/cpu-method-table.png "method_table")

* Improve the performance of data processing in the CPU profiler -
  [#5468](https://github.com/flutter/devtools/pull/5468),
  [#5533](https://github.com/flutter/devtools/pull/5533),
  [#5535](https://github.com/flutter/devtools/pull/5535)

  改进了 CPU 性能分析器中数据处理的性能 -
  [#5468](https://github.com/flutter/devtools/pull/5468),
  [#5533](https://github.com/flutter/devtools/pull/5533),
  [#5535](https://github.com/flutter/devtools/pull/5535)
* Polish and performance improvements for the CPU profile flame chart -
  [#5529](https://github.com/flutter/devtools/pull/5529)

  优化了 CPU 性能分析火焰图并改进了性能 -
  [#5529](https://github.com/flutter/devtools/pull/5529)
* Add ability to inspect statistics for a CPU profile -
  [#5340](https://github.com/flutter/devtools/pull/5340)

  添加了查看 CPU 性能分析统计信息的功能 -
  [#5340](https://github.com/flutter/devtools/pull/5340)
* Fix a bug where Native stack frames were missing their name -
  [#5344](https://github.com/flutter/devtools/pull/5344)

  修复了 Native 堆栈帧缺少名称的 bug -
  [#5344](https://github.com/flutter/devtools/pull/5344)
* Fix an error in total and self time calculations for the bottom up tree -
  [#5348](https://github.com/flutter/devtools/pull/5348)

  修复了 bottom up 树中总时间和自身时间计算的错误 -
  [#5348](https://github.com/flutter/devtools/pull/5348)
* Add support for zooming and navigating the flame chart
  with ,AOE keys (helpful for Dvorak users) -
  [#5545](https://github.com/flutter/devtools/pull/5545)

  添加了使用 ,AOE 键缩放和导航火焰图的支持
  （对 Dvorak 键盘用户很有帮助）-
  [#5545](https://github.com/flutter/devtools/pull/5545)

## Memory updates

## 内存更新

* Fix filtering bug in the "Trace Instances" view -
  [#5406](https://github.com/flutter/devtools/pull/5406)

  修复了「Trace Instances」视图中的过滤 bug -
  [#5406](https://github.com/flutter/devtools/pull/5406)
* Enabled evaluation and browsing for instances in heap snapshot -
  [#5542](https://github.com/flutter/devtools/pull/5542)

  在堆快照中启用了实例的求值和浏览 -
  [#5542](https://github.com/flutter/devtools/pull/5542)
* Fix heap snapshot failure -
  [#5520](https://github.com/flutter/devtools/pull/5520)

  修复了堆快照失败的问题 -
  [#5520](https://github.com/flutter/devtools/pull/5520)
* Stop displaying external sizes in the allocation profile -
  [#5555](https://github.com/flutter/devtools/pull/5555)

  停止在 allocation profile 中显示 external sizes -
  [#5555](https://github.com/flutter/devtools/pull/5555)
* Expose totals for memory in heap snapshot -
  [#5593](https://github.com/flutter/devtools/pull/5593)

  在堆快照中显示内存总计 -
  [#5593](https://github.com/flutter/devtools/pull/5593)

## Debugger updates

## 调试器更新

* Fix a bug where variable inspection
  for instances sometimes showed no children -
  [#5356](https://github.com/flutter/devtools/pull/5356)

  修复了实例变量检查有时不显示子项的 bug -
  [#5356](https://github.com/flutter/devtools/pull/5356)
* Hide "search in file" dialog if the "file search" dialog is open -
  [#5393](https://github.com/flutter/devtools/pull/5393)

  如果「file search」对话框已打开，则隐藏「search in file」对话框 -
  [#5393](https://github.com/flutter/devtools/pull/5393)
* Fix file search bug where last letter disappeared when
  searching at end of file name -
  [#5397](https://github.com/flutter/devtools/pull/5397)

  修复了在文件名末尾搜索时最后一个字母消失的 bug -
  [#5397](https://github.com/flutter/devtools/pull/5397)
* Add search icon in file bar to make file search more discoverable -
  [#5351](https://github.com/flutter/devtools/issues/5351)

  在文件栏中添加搜索图标，使文件搜索更容易被发现 -
  [#5351](https://github.com/flutter/devtools/issues/5351)
* Allow expression evaluation when pausing in JS for web apps -
  [#5427](https://github.com/flutter/devtools/pull/5427)

  允许在 Web 应用的 JS 中暂停时进行表达式求值 -
  [#5427](https://github.com/flutter/devtools/pull/5427)
* Update syntax highlighting to
  [dart-lang/dart-syntax-highlight v1.2.0](https://github.com/dart-lang/dart-syntax-highlight/blob/master/CHANGELOG.md#120-2023-01-30) -
  [#5477](https://github.com/flutter/devtools/pull/5477)

  将语法高亮更新为
  [dart-lang/dart-syntax-highlight v1.2.0](https://github.com/dart-lang/dart-syntax-highlight/blob/master/CHANGELOG.md#120-2023-01-30) -
  [#5477](https://github.com/flutter/devtools/pull/5477)
* Debugger panel respects "dense mode" -
  [#5517](https://github.com/flutter/devtools/pull/5517)

  调试器面板遵循「dense mode」-
  [#5517](https://github.com/flutter/devtools/pull/5517)

## Network profiler updates

## 网络性能分析器更新

* Fix a bug viewing JSON responses with null values -
  [#5424](https://github.com/flutter/devtools/pull/5424)

  修复了查看包含 null 值的 JSON 响应的 bug -
  [#5424](https://github.com/flutter/devtools/pull/5424)
* Fix a bug where JSON requests were shown in plain text,
  instead of the formatted JSON viewer -
  [#5463](https://github.com/flutter/devtools/pull/5463)

  修复了 JSON 请求以纯文本而非格式化 JSON 查看器显示的 bug -
  [#5463](https://github.com/flutter/devtools/pull/5463)
* Fix a UI issue where the copy button on the response or request tab
  would let you copy while still loading the data -
  [#5476](https://github.com/flutter/devtools/pull/5476)

  修复了响应或请求标签页上的复制按钮
  在数据仍在加载时即可复制的 UI 问题 -
  [#5476](https://github.com/flutter/devtools/pull/5476)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.22.2...v2.23.1).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.22.2...v2.23.1)。
