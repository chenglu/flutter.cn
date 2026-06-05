---
# title: DevTools 2.14.0 release notes
title: DevTools 2.14.0 版本说明
# shortTitle: 2.14.0 release notes
shortTitle: 2.14.0 版本说明
breadcrumb: 2.14.0
# description: Release notes for Dart and Flutter DevTools version 2.14.0.
description: Dart 和 Flutter DevTools 2.14.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.14.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.14.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Added a link to the new DevTools
  [Discord channel](https://discord.com/channels/608014603317936148/958862085297672282)
  in the About DevTools dialog -
  [#4102](https://github.com/flutter/devtools/pull/4102)

  在「关于 DevTools」对话框中添加了指向新 DevTools
  [Discord 频道](https://discord.com/channels/608014603317936148/958862085297672282)
  的链接 -
  [#4102](https://github.com/flutter/devtools/pull/4102)

  ![about-devtools](/assets/images/docs/tools/devtools/release-notes/images-2.14.0/image1.png "about devtools")

## Network updates

## 网络更新

* Added "Copy as URL" and "Copy as cURL" actions for
  selected requests in the network profiler
  (special thanks to [@jankuss](https://github.com/jankuss)!) -
  [#4113](https://github.com/flutter/devtools/pull/4113)

  为网络性能分析器中所选请求添加了
  「Copy as URL」和「Copy as cURL」操作
  （特别感谢 [@jankuss](https://github.com/jankuss)！）-
  [#4113](https://github.com/flutter/devtools/pull/4113)

  ![network-request-copy-actions](/assets/images/docs/tools/devtools/release-notes/images-2.14.0/image2.png "network request copy actions")

## Flutter inspector updates

## Flutter 检查器更新

* Added a setting to control whether hovering over a widget
  in the inspector displays its properties and values in a hover card -
  [#4090](https://github.com/flutter/devtools/pull/4090)

  添加了一项设置，用于控制悬停在检查器中的 widget 上时
  是否在悬停卡片中显示其属性和值 -
  [#4090](https://github.com/flutter/devtools/pull/4090)

## Debugger updates

## 调试器更新

* Added auto complete suggestions in the console
  (special thanks to [@jankuss](https://github.com/jankuss)!) -
  [#4062](https://github.com/flutter/devtools/pull/4062)

  在控制台中添加了自动补全建议
  （特别感谢 [@jankuss](https://github.com/jankuss)！）-
  [#4062](https://github.com/flutter/devtools/pull/4062)

  ![auto-complete-suggestions](/assets/images/docs/tools/devtools/release-notes/images-2.14.0/image3.png "auto complete suggestions")

* Added the option to copy the full file path for a selected library -
  [#4147](https://github.com/flutter/devtools/pull/4147)

  添加了复制所选库完整文件路径的选项 -
  [#4147](https://github.com/flutter/devtools/pull/4147)
* Fixed formatting in the debugger exception menu -
  [#4066](https://github.com/flutter/devtools/pull/4066)

  修复了调试器异常菜单中的格式问题 -
  [#4066](https://github.com/flutter/devtools/pull/4066)

## Memory updates

## 内存更新

* Fixed formatting for memory values in the heap tree view -
  [#4153](https://github.com/flutter/devtools/pull/4153)

  修复了堆树视图中内存值的格式问题 -
  [#4153](https://github.com/flutter/devtools/pull/4153)
* Fixed a bug that was preventing GC events from
  showing up in the memory chart -
  [#4131](https://github.com/flutter/devtools/pull/4131)

  修复了一个阻止 GC 事件在内存图表中显示的 bug -
  [#4131](https://github.com/flutter/devtools/pull/4131)

## Performance updates

## 性能更新

* Warn users that the rendering layer toggles in the
  "More Debugging Options" menu are not available for profile mode apps -
  [#4075](https://github.com/flutter/devtools/pull/4075)

  警告用户「More Debugging Options」菜单中的渲染层切换
  不适用于 profile 模式应用 -
  [#4075](https://github.com/flutter/devtools/pull/4075)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.13.1...v2.14.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.13.1...v2.14.0)。
