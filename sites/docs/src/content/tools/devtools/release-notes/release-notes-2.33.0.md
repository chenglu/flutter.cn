---
# title: DevTools 2.33.0 release notes
title: DevTools 2.33.0 发布说明
# shortTitle: 2.33.0 release notes
shortTitle: 2.33.0 发布说明
breadcrumb: 2.33.0
# description: Release notes for Dart and Flutter DevTools version 2.33.0.
description: Dart 和 Flutter DevTools 2.33.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.33.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.33.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## General updates

## 常规更新

* Improved overall usability by making the DevTools UI more dense.
  This significantly improves the user experience when using
  DevTools embedded in an IDE. - [#7030](https://github.com/flutter/devtools/pull/7030)

  通过让 DevTools UI 更加紧凑来提升整体可用性。
  这显著改善了在 IDE 中嵌入使用 DevTools 时的用户体验。- [#7030](https://github.com/flutter/devtools/pull/7030)
* Removed the "Dense mode" setting. - [#7086](https://github.com/flutter/devtools/pull/7086)

  移除了「Dense mode」设置。- [#7086](https://github.com/flutter/devtools/pull/7086)
* Added support for filtering with regular expressions in
  the Logging, Network, and CPU profiler pages. - [#7027](https://github.com/flutter/devtools/pull/7027)

  在 Logging、Network 和 CPU profiler 页面中添加了使用正则表达式进行过滤的支持。- [#7027](https://github.com/flutter/devtools/pull/7027)
* Add a DevTools server interaction for getting the DTD URI. - [#7054](https://github.com/flutter/devtools/pull/7054), [#7164](https://github.com/flutter/devtools/pull/7164)

  添加了用于获取 DTD URI 的 DevTools 服务器交互。- [#7054](https://github.com/flutter/devtools/pull/7054), [#7164](https://github.com/flutter/devtools/pull/7164)
* Enabled expression evaluation with scope for the web,
  allowing evaluation of inspected widgets. - [#7144](https://github.com/flutter/devtools/pull/7144)

  为 Web 启用了带作用域的表达式求值，
  让你可以求值已检查的 widget。- [#7144](https://github.com/flutter/devtools/pull/7144)
* Update `package:vm_service` constraint to `^14.0.0`. - [#6953](https://github.com/flutter/devtools/pull/6953)

  将 `package:vm_service` 约束更新为 `^14.0.0`。- [#6953](https://github.com/flutter/devtools/pull/6953)
* Onboarding DevTools to [`package:unified_analytics`](https://pub.dev/packages/unified_analytics) for
  unified telemetry logging across Flutter and Dart tooling. - [#7084](https://github.com/flutter/devtools/pull/7084)

  将 DevTools 接入 [`package:unified_analytics`](https://pub.dev/packages/unified_analytics)，
  以在 Flutter 和 Dart 工具中实现统一的遥测日志记录。- [#7084](https://github.com/flutter/devtools/pull/7084)

## Debugger updates

## 调试器更新

* Fixed off by one error causing profiler hits to be
  rendered on the wrong lines. - [#7178](https://github.com/flutter/devtools/pull/7178)

  修复了差一错误，该错误导致 profiler 命中显示在错误的行上。- [#7178](https://github.com/flutter/devtools/pull/7178)
* Improved contrast of line numbers when
  displaying code coverage hits in dark mode. - [#7178](https://github.com/flutter/devtools/pull/7178)

  改进了在深色模式下显示代码覆盖率命中时的行号对比度。- [#7178](https://github.com/flutter/devtools/pull/7178)
* Improved contrast of profiling details when
  displaying profiler hits in dark mode. - [#7178](https://github.com/flutter/devtools/pull/7178)

  改进了在深色模式下显示 profiler 命中时的分析详情对比度。- [#7178](https://github.com/flutter/devtools/pull/7178)
* Fixed syntax highlighting for comments when
  the source file uses `\r\n` line endings [#7190](https://github.com/flutter/devtools/pull/7190)

  修复了源文件使用 `\r\n` 行尾时注释的语法高亮问题 [#7190](https://github.com/flutter/devtools/pull/7190)
* Re-establish breakpoints after a hot-restart. - [#7205](https://github.com/flutter/devtools/pull/7205)

  在热重启后重新建立断点。- [#7205](https://github.com/flutter/devtools/pull/7205)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* Do not show DevTools release notes in the Flutter sidebar. - [#7166](https://github.com/flutter/devtools/pull/7166)

  不在 Flutter 侧边栏中显示 DevTools 发布说明。- [#7166](https://github.com/flutter/devtools/pull/7166)

## DevTools Extension updates

## DevTools 扩展更新

* Added support for connecting to the Dart Tooling Daemon from
  the simulated DevTools environment. - [#7133](https://github.com/flutter/devtools/pull/7133)

  添加了从模拟 DevTools 环境连接到 Dart Tooling Daemon 的支持。- [#7133](https://github.com/flutter/devtools/pull/7133)
* Added help buttons to the VM Service and DTD connection text fields in
  the simulated DevTools environment. - [#7133](https://github.com/flutter/devtools/pull/7133)

  在模拟 DevTools 环境中的 VM Service 和 DTD 连接文本字段中添加了帮助按钮。- [#7133](https://github.com/flutter/devtools/pull/7133)
* Fixed an issue with not detecting extensions for
  test files in subdirectories. - [#7174](https://github.com/flutter/devtools/pull/7174)

  修复了无法检测子目录中测试文件的扩展的问题。- [#7174](https://github.com/flutter/devtools/pull/7174)
* Added an example of creating an extension for a pure Dart package. - [#7196](https://github.com/flutter/devtools/pull/7196)

  添加了为纯 Dart 包创建扩展的示例。- [#7196](https://github.com/flutter/devtools/pull/7196)
* Updated the `README.md` and `example/README.md` with
  more complete documentation. - [#7237](https://github.com/flutter/devtools/pull/7237), [#7261](https://github.com/flutter/devtools/pull/7261)

  更新了 `README.md` 和 `example/README.md`，提供更完整的文档。- [#7237](https://github.com/flutter/devtools/pull/7237), [#7261](https://github.com/flutter/devtools/pull/7261)
* Added a `devtools_extensions validate` command to
  validate extension requirements during development. - [#7257](https://github.com/flutter/devtools/pull/7257)

  添加了 `devtools_extensions validate` 命令，
  用于在开发期间验证扩展要求。- [#7257](https://github.com/flutter/devtools/pull/7257)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.33.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.33.0)。
