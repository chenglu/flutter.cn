---
# title: DevTools 2.21.1 release notes
title: DevTools 2.21.1 版本说明
# shortTitle: 2.21.1 release notes
shortTitle: 2.21.1 版本说明
breadcrumb: 2.22.1
# description: Release notes for Dart and Flutter DevTools version 2.21.1.
description: Dart 和 Flutter DevTools 2.21.1 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.21.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.21.1 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Performance updates

## 性能更新

* Replace the DevTools timeline trace viewer with
  the [Perfetto](https://perfetto.dev/) trace viewer -
  [#5142](https://github.com/flutter/devtools/pull/5142)

  将 DevTools 时间线追踪查看器替换为
  [Perfetto](https://perfetto.dev/) 追踪查看器 -
  [#5142](https://github.com/flutter/devtools/pull/5142)

  ![perfetto trace viewer](/assets/images/docs/tools/devtools/release-notes/images-2.21.1/image1.png "perfetto_trace_viewer")

* Fix several issues with loading a Performance snapshot into DevTools -
  [#5048](https://github.com/flutter/devtools/pull/5048),
  [#4929](https://github.com/flutter/devtools/pull/4929)

  修复了将 Performance 快照加载到 DevTools 时的多个问题 -
  [#5048](https://github.com/flutter/devtools/pull/5048),
  [#4929](https://github.com/flutter/devtools/pull/4929)
* UI polish and cleanup - [#4889](https://github.com/flutter/devtools/pull/4889)

  UI 优化和清理 - [#4889](https://github.com/flutter/devtools/pull/4889)

## Memory updates

## 内存更新

* Improve usability of snapshot diffing -
  [#5015](https://github.com/flutter/devtools/pull/5015)

  改进了快照差异对比的可用性 -
  [#5015](https://github.com/flutter/devtools/pull/5015)
* UI polish and cleanup -
  [#4855](https://github.com/flutter/devtools/pull/4855)

  UI 优化和清理 -
  [#4855](https://github.com/flutter/devtools/pull/4855)
* Color code classes based on where they are defined
  (SDK, your package, dependencies, etc.) -
  [#5030](https://github.com/flutter/devtools/pull/5030)

  根据类定义位置进行颜色编码
  （SDK、你的 package、依赖项等）-
  [#5030](https://github.com/flutter/devtools/pull/5030)
* Fix state management issue for tracing -
  [#5062](https://github.com/flutter/devtools/pull/5062)

  修复了追踪的状态管理问题 -
  [#5062](https://github.com/flutter/devtools/pull/5062)
* Improve the performance of taking a heap snapshot -
  [#5134](https://github.com/flutter/devtools/pull/5134)

  改进了获取堆快照的性能 -
  [#5134](https://github.com/flutter/devtools/pull/5134)
* Retire broken import/export feature -
  [#5135](https://github.com/flutter/devtools/pull/5135)

  移除了有问题的导入/导出功能 -
  [#5135](https://github.com/flutter/devtools/pull/5135)

## Debugger updates

## 调试器更新

* Added support for viewing profiler hits in
  the debugger script viewer -
  [#4831](https://github.com/flutter/devtools/pull/4831)

  添加了在调试器脚本查看器中查看性能分析器命中次数的支持 -
  [#4831](https://github.com/flutter/devtools/pull/4831)
* Added support for inspecting records -
  [#5084](https://github.com/flutter/devtools/pull/5084)

  添加了检查 record 的支持 -
  [#5084](https://github.com/flutter/devtools/pull/5084)

## General updates

## 常规更新

* Fix several issues in syntax highlighting that would
  color variable names that contain reserved words incorrectly and
  leave `extends`/`implements` clauses uncolored for some classes -
  [#4948](https://github.com/flutter/devtools/pull/4948)

  修复了语法高亮中的多个问题，
  这些问题会错误地为包含保留字的变量名着色，
  以及导致某些类的 `extends`/`implements` 子句未着色 -
  [#4948](https://github.com/flutter/devtools/pull/4948)
* Fix an issue in Safari, and
  other browsers that do not support RegExp negative lookbehind,
  that prevented DevTools from loading -
  [#4938](https://github.com/flutter/devtools/pull/4938)

  修复了 Safari 及其他不支持 RegExp 负向后查找的浏览器中
  导致 DevTools 无法加载的问题 -
  [#4938](https://github.com/flutter/devtools/pull/4938)
* Fix an issue that would prevent DevTools connecting to
  the backend server that would disable some functionality -
  [#5016](https://github.com/flutter/devtools/pull/5016)

  修复了阻止 DevTools 连接到后端服务器
  从而导致部分功能不可用的问题 -
  [#5016](https://github.com/flutter/devtools/pull/5016)
* Add a link to the DevTools
  [contribution guide](https://github.com/flutter/devtools/blob/master/CONTRIBUTING.md)
  to the About menu, and fixed the Discord link -
  [#4926](https://github.com/flutter/devtools/pull/4926)

  在「关于」菜单中添加了 DevTools
  [贡献指南](https://github.com/flutter/devtools/blob/master/CONTRIBUTING.md)
  的链接，并修复了 Discord 链接 -
  [#4926](https://github.com/flutter/devtools/pull/4926)
* Fix conflicting colors in light theme -
  [#5067](https://github.com/flutter/devtools/pull/5067)

  修复了浅色主题中的颜色冲突 -
  [#5067](https://github.com/flutter/devtools/pull/5067)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.20.0...v2.21.1).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.20.0...v2.21.1)。
