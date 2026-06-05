---
# title: DevTools 2.40.2 release notes
title: DevTools 2.40.2 发布说明
# shortTitle: 2.40.2 release notes
shortTitle: 2.40.2 发布说明
breadcrumb: 2.40.2
# description: Release notes for Dart and Flutter DevTools version 2.40.2.
description: Dart 和 Flutter DevTools 2.40.2 版本发布说明。
showToc: false
ai-translated: true
---

The 2.40.2 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.40.2 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Add a setting that allows users to opt in to loading DevTools
  with WebAssembly. - [#8270](https://github.com/flutter/devtools/pull/8270)

  添加了让用户选择使用 WebAssembly 加载 DevTools 的设置。- [#8270](https://github.com/flutter/devtools/pull/8270)

  ![Wasm opt-in setting](/assets/images/docs/tools/devtools/release-notes/images-2.40.2/wasm_setting.png "DevTools setting to opt into wasm.")

* Removed the legacy Provider screen from DevTools.
  The `package:provider` tool is now distributed as a
  DevTools extension from `package:provider`.
  Upgrade your `package:provider` dependency to
  use the extension. - [#8364](https://github.com/flutter/devtools/pull/8364)

  从 DevTools 中移除了旧版 Provider 屏幕。
  `package:provider` 工具现在作为来自 `package:provider` 的 DevTools 扩展分发。
  升级你的 `package:provider` 依赖以使用该扩展。- [#8364](https://github.com/flutter/devtools/pull/8364)

* Fixed a bug that was causing the DevTools release notes to
  always show. - [#8277](https://github.com/flutter/devtools/pull/8277)

  修复了导致 DevTools 发布说明始终显示的 bug。- [#8277](https://github.com/flutter/devtools/pull/8277)

* Added support for loading extensions in pub workspaces
  [8347](https://github.com/flutter/devtools/pull/8347).

  添加了在 pub workspaces 中加载扩展的支持
  [8347](https://github.com/flutter/devtools/pull/8347)。

* Mapped error stack traces to use the Dart source code locations so
  that they are human-readable. - [#8385](https://github.com/flutter/devtools/pull/8385)

  将错误堆栈跟踪映射为使用 Dart 源代码位置，使其易于阅读。- [#8385](https://github.com/flutter/devtools/pull/8385)

* Added handling for IDE theme change events to
  update embedded DevTools UI. - [#8336](https://github.com/flutter/devtools/pull/8336)

  添加了对 IDE 主题更改事件的处理，以更新嵌入的 DevTools UI。- [#8336](https://github.com/flutter/devtools/pull/8336)

* Fixed a bug that was causing data filters to be cleared when clearing data
  on the Network and Logging screens. - [#8407](https://github.com/flutter/devtools/pull/8407)

  修复了在 Network 和 Logging 屏幕上清除数据时导致数据过滤器被清除的 bug。- [#8407](https://github.com/flutter/devtools/pull/8407)

* Fixed a bug that was causing the navigator to lose state when opening the VM
  Flags dialog. - [#8413](https://github.com/flutter/devtools/pull/8413)

  修复了打开 VM Flags 对话框时导致导航器丢失状态的 bug。- [#8413](https://github.com/flutter/devtools/pull/8413)

* Tables match IDE theme when embedded in an IDE. - [#8498](https://github.com/flutter/devtools/pull/8498)

  嵌入在 IDE 中时，表格与 IDE 主题匹配。- [#8498](https://github.com/flutter/devtools/pull/8498)

## Inspector updates

## 检查器更新

- Added a setting to the Flutter Inspector controls that
  allows users to opt in to the newly redesigned Flutter Inspector. - [#8342](https://github.com/flutter/devtools/pull/8342)

  在 Flutter Inspector 控件中添加了设置，
  让用户可以选择使用全新设计的 Flutter Inspector。- [#8342](https://github.com/flutter/devtools/pull/8342)

  ![New inspector opt-in setting](/assets/images/docs/tools/devtools/release-notes/images-2.40.2/new_inspector.png "DevTools setting to opt into the new Flutter Inspector.")

## Performance updates

## 性能更新

* Fixed an issue with the "Refreshing timeline" overlay that was getting shown
  when it should not have been. - [#8318](https://github.com/flutter/devtools/pull/8318)

  修复了「Refreshing timeline」叠加层在不应当显示时被显示的问题。- [#8318](https://github.com/flutter/devtools/pull/8318)

## Network profiler updates

## 网络分析器更新

* Resolved an issue in `.har` export where
  response content was sometimes missing in the data. - [#8333](https://github.com/flutter/devtools/pull/8333)

  解决了 `.har` 导出中响应内容有时在数据中缺失的问题。- [#8333](https://github.com/flutter/devtools/pull/8333)

## Deep links tool updates

## 深层链接工具更新

- Added support for validating iOS deep link settings. - [#8394](https://github.com/flutter/devtools/pull/8394)

  添加了验证 iOS 深层链接设置的支持。- [#8394](https://github.com/flutter/devtools/pull/8394)

  ![Deep link validator for iOS](/assets/images/docs/tools/devtools/release-notes/images-2.40.2/deep_link_ios.png "DevTools Deep link validator Page")

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.40.2).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.40.2)。
