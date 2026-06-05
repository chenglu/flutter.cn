---
# title: DevTools 2.26.1 release notes
title: DevTools 2.26.1 版本说明
# shortTitle: 2.26.1 release notes
shortTitle: 2.26.1 版本说明
breadcrumb: 2.26.1
# description: Release notes for Dart and Flutter DevTools version 2.26.1.
description: Dart 和 Flutter DevTools 2.26.1 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.26.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.26.1 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

- Added a new "Home" screen in DevTools that either shows the "Connect" dialog
  or a summary of your connected app, depending on
  the connection status in DevTools.
  Keep an eye on this screen for cool new features in the future.
  This change also enables support for static tooling
  (tools that don't require a connected app) in DevTools -
  [#6010](https://github.com/flutter/devtools/pull/6010)

  在 DevTools 中添加了新的「Home」屏幕，
  根据 DevTools 中的连接状态，
  显示「Connect」对话框或已连接应用的摘要。
  请关注此屏幕，未来将有更多酷炫的新功能。
  此更改还启用了对静态工具
  （不需要连接应用的工具）的支持 -
  [#6010](https://github.com/flutter/devtools/pull/6010)

  ![home screen](/assets/images/docs/tools/devtools/release-notes/images-2.26.1/home_screen.png "DevTools home screen")

- Fixed overlay notifications so that they
  cover the area that their background blocks -
  [#5975](https://github.com/flutter/devtools/pull/5975)

  修复了叠加通知，使其覆盖背景遮挡的区域 -
  [#5975](https://github.com/flutter/devtools/pull/5975)

## Memory updates

## 内存更新

- Added a context menu to rename or delete a heap snapshot from the list -
  [#5997](https://github.com/flutter/devtools/pull/5997)

  添加了上下文菜单，用于从列表中重命名或删除堆快照 -
  [#5997](https://github.com/flutter/devtools/pull/5997)
- Warn users when HTTP logging may be affecting their app's memory consumption -
  [#5998](https://github.com/flutter/devtools/pull/5998)

  当 HTTP 日志记录可能影响应用内存消耗时警告用户 -
  [#5998](https://github.com/flutter/devtools/pull/5998)

## Debugger updates

## 调试器更新

- Improvements to text selection and copy behavior in
  the code view, console, and variables windows -
  [#6020](https://github.com/flutter/devtools/pull/6020)

  改进了代码视图、控制台和变量窗口中的文本选择和复制行为 -
  [#6020](https://github.com/flutter/devtools/pull/6020)

## Network profiler updates

## 网络性能分析器更新

- Added a selector to customize the display type
  of text and json responses (thanks to @hhacker1999!) -
  [#5816](https://github.com/flutter/devtools/pull/5816)

  添加了选择器，用于自定义文本和 json 响应的显示类型
  （感谢 @hhacker1999！）-
  [#5816](https://github.com/flutter/devtools/pull/5816)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.25.0...v2.26.1).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.25.0...v2.26.1)。
