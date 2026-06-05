---
# title: DevTools 2.45.0 release notes
title: DevTools 2.45.0 发布说明
# shortTitle: 2.45.0 release notes
shortTitle: 2.45.0 发布说明
breadcrumb: 2.45.0
# description: Release notes for Dart and Flutter DevTools version 2.45.0.
description: Dart 和 Flutter DevTools 2.45.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.45.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.45.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Added a memory pressure warning that allows you to reduce the memory usage of
  DevTools in order to avoid an OOM crash. -
  [#8989](https://github.com/flutter/devtools/pull/8989),
  [#8997](https://github.com/flutter/devtools/pull/8997),
  [#8998](https://github.com/flutter/devtools/pull/8998)

  添加了内存压力警告，让你可以减少
  DevTools 的内存使用量以避免 OOM 崩溃。-
  [#8989](https://github.com/flutter/devtools/pull/8989),
  [#8997](https://github.com/flutter/devtools/pull/8997),
  [#8998](https://github.com/flutter/devtools/pull/8998)

* Fix a bug with the review history on disconnect experience. -
  [#8985](https://github.com/flutter/devtools/pull/8985)

  修复了断开连接时查看历史记录的 bug。-
  [#8985](https://github.com/flutter/devtools/pull/8985)

* Fixed bug where DevTools would automatically resume instead of
  pausing on breakpoint on connection. -
  [#8991](https://github.com/flutter/devtools/pull/8991)

  修复了 DevTools 在连接时自动恢复而不是在断点处暂停的 bug。-
  [#8991](https://github.com/flutter/devtools/pull/8991)

* Prevented text inputs from stealing focus from the IDE. -
  [#9091](https://github.com/flutter/devtools/pull/9091)

  防止文本输入从 IDE 窃取焦点。-
  [#9091](https://github.com/flutter/devtools/pull/9091)

## Inspector updates

## 检查器更新

* Fixed bug where errors in the inspector tree (e.g. RenderFlex overflow
  errors) were not removed after a hot-reload. -
  [#9106](https://github.com/flutter/devtools/pull/9106)

  修复了检查器树中的错误（例如 RenderFlex overflow
  错误）在热重载后未被移除的 bug。-
  [#9106](https://github.com/flutter/devtools/pull/9106)

## Debugger updates

## 调试器更新

* Combine the Pause and Resume buttons into a single button. -
  [#9095](https://github.com/flutter/devtools/pull/9095)

  将 Pause 和 Resume 按钮合并为单个按钮。-
  [#9095](https://github.com/flutter/devtools/pull/9095)

## Deep links tool updates

## 深层链接工具更新

* Fixed an issue with Windows file paths showing incorrectly in the Deep Links
  page [#9027](https://github.com/flutter/devtools/pull/9027).

  修复了 Deep Links 页面中 Windows 文件路径显示不正确的问题
  [#9027](https://github.com/flutter/devtools/pull/9027).

* Fixed an issue with the Deep Links page crashing when no iOS configuration is
  present [#9027](https://github.com/flutter/devtools/pull/9027).

  修复了没有 iOS 配置时 Deep Links 页面崩溃的问题
  [#9027](https://github.com/flutter/devtools/pull/9027).

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.45.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.45.0)。
