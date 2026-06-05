---
# title: DevTools 2.42.3 release notes
title: DevTools 2.42.3 发布说明
# shortTitle: 2.42.3 release notes
shortTitle: 2.42.3 发布说明
breadcrumb: 2.42.3
# description: Release notes for Dart and Flutter DevTools version 2.42.3.
description: Dart 和 Flutter DevTools 2.42.3 版本发布说明。
showToc: false
ai-translated: true
---

The 2.42.3 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.42.3 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Added "View licenses" shortcut to the About dialog. - [#8610](https://github.com/flutter/devtools/pull/8610)

  在「关于」对话框中添加了「View licenses」快捷方式。- [#8610](https://github.com/flutter/devtools/pull/8610)

* Lower the wasm optimization level to resolve crashes on the dart2wasm build. - [#8814](https://github.com/flutter/devtools/pull/8814)

  降低 wasm 优化级别以解决 dart2wasm 构建中的崩溃问题。- [#8814](https://github.com/flutter/devtools/pull/8814)

## Inspector updates

## 检查器更新

* Enabled the new inspector by default. This can be disabled in the inspector settings. - [#8650](https://github.com/flutter/devtools/pull/8650)

  默认启用了新检查器。可以在检查器设置中禁用。- [#8650](https://github.com/flutter/devtools/pull/8650)
  ![Legacy inspector setting](/assets/images/docs/tools/devtools/release-notes/images-2.42.3/legacy_inspector_setting.png "Legacy inspector setting")
* Fixed an issue where selecting an implementation widget on the device while implementation widgets were hidden in the new inspector showed an error. - [#8625](https://github.com/flutter/devtools/pull/8625)

  修复了在新检查器中隐藏实现 widget 时，
  在设备上选择实现 widget 会显示错误的问题。- [#8625](https://github.com/flutter/devtools/pull/8625)
* Enabled auto-refreshes of the widget tree on hot-reloads and navigation events by default. This can be disabled in the inspector settings. - [#8646](https://github.com/flutter/devtools/pull/8646)

  默认启用了在热重载和导航事件时自动刷新 widget 树。
  可以在检查器设置中禁用。- [#8646](https://github.com/flutter/devtools/pull/8646)
  ![Auto-refresh setting](/assets/images/docs/tools/devtools/release-notes/images-2.42.3/inspector_auto_refresh_setting.png "Inspector auto-refresh setting")

## Network profiler updates

## 网络分析器更新

* Fixed an issue where the HTTP requests would sometimes not be displayed properly, particularly when DevTools is communicating
  with an application over a slow network connection. - [#8860](https://github.com/flutter/devtools/pull/8860)

  修复了 HTTP 请求有时无法正确显示的问题，
  尤其是在 DevTools 通过慢速网络连接与应用程序通信时。- [#8860](https://github.com/flutter/devtools/pull/8860)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.42.3).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.42.3)。
