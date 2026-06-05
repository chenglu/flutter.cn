---
# title: DevTools 2.11.2 release notes
title: DevTools 2.11.2 版本说明
# shortTitle: 2.11.2 release notes
shortTitle: 2.11.2 版本说明
breadcrumb: 2.11.2
# description: Release notes for Dart and Flutter DevTools version 2.11.2.
description: Dart 和 Flutter DevTools 2.11.2 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.11.2 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.11.2 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* This release included a lot of cleanup and reduction in technical debt.

  此版本包含大量清理工作和技术债务的削减。

## CPU profiler updates

## CPU 性能分析器更新

* Added the source line number to file uris in CPU profiles -
  [#3718](https://github.com/flutter/devtools/pull/3718)

  在 CPU 性能分析配置中为文件 URI 添加了源代码行号 -
  [#3718](https://github.com/flutter/devtools/pull/3718)

  ![cpu stack frame line numbers](/assets/images/docs/tools/devtools/release-notes/images-2.11.2/image1.png "cpu stack frame line numbers")

## Debugger updates

## 调试器更新

* File opener UX improvements, including support for clicking
  the source file name to open the file search window -
  [#3612](https://github.com/flutter/devtools/pull/3612),
  [#3758](https://github.com/flutter/devtools/pull/3758)

  改进了文件打开器的用户体验，包括支持点击
  源文件名以打开文件搜索窗口 -
  [#3612](https://github.com/flutter/devtools/pull/3612),
  [#3758](https://github.com/flutter/devtools/pull/3758)
* Added support for auto-scrolling the File Explorer to the selected file -
  [#3786](https://github.com/flutter/devtools/pull/3786),
  [#3794](https://github.com/flutter/devtools/pull/3794)

  添加了自动滚动 File Explorer 至所选文件的支持 -
  [#3786](https://github.com/flutter/devtools/pull/3786),
  [#3794](https://github.com/flutter/devtools/pull/3794)

  ![debugger file explorer scrolling](/assets/images/docs/tools/devtools/release-notes/images-2.11.2/image2.gif "debugger file explorer scrolling")

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.10.0...v2.11.2).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.10.0...v2.11.2)。
