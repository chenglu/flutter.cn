---
# title: DevTools 2.31.0 release notes
title: DevTools 2.31.0 版本说明
# shortTitle: 2.31.0 release notes
shortTitle: 2.31.0 版本说明
breadcrumb: 2.31.0
# description: Release notes for Dart and Flutter DevTools version 2.31.0.
description: Dart 和 Flutter DevTools 2.31.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.31.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.31.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Added a new feature for deep link validation,
  supporting deep link web checks on Android. - [#6935](https://github.com/flutter/devtools/pull/6935)

  添加了深度链接验证的新功能，
  支持在 Android 上进行深度链接 Web 检查。- [#6935](https://github.com/flutter/devtools/pull/6935)
* Added the basic plumbing to allow connections to a Dart Tooling Daemon. - [#7009](https://github.com/flutter/devtools/pull/7009)

  添加了连接到 Dart Tooling Daemon 的基本基础架构。- [#7009](https://github.com/flutter/devtools/pull/7009)
* Made table text selectable [#6919](https://github.com/flutter/devtools/pull/6919)

  使表格文本可选择 [#6919](https://github.com/flutter/devtools/pull/6919)

## Inspector updates

## 检查器更新

* When done typing in the search field, the
  next selection is now automatically selected - [#6677](https://github.com/flutter/devtools/pull/6677)

  在搜索字段中输入完成后，
  现在会自动选择下一项 - [#6677](https://github.com/flutter/devtools/pull/6677)
* Added link to package directory documentation,
  from the inspect settings dialog - [#6825](https://github.com/flutter/devtools/pull/6825)

  从检查器设置对话框中添加了指向 package 目录文档的链接 - [#6825](https://github.com/flutter/devtools/pull/6825)

  ![Link to documentation](/assets/images/docs/tools/devtools/release-notes/images-2.31.0/link-to-doc.png "Link to documentation")

* Fix bug where widgets owned by the Flutter framework were
  showing up in the widget tree view - [#6857](https://github.com/flutter/devtools/pull/6857)

  修复了 Flutter 框架拥有的 widget 出现在 widget 树视图中的 bug - [#6857](https://github.com/flutter/devtools/pull/6857)
* Only cache pub root directories added by the user - [#6897](https://github.com/flutter/devtools/pull/6897)

  仅缓存用户添加的 pub 根目录 - [#6897](https://github.com/flutter/devtools/pull/6897)
* Remove Flutter pub root if it was accidentally cached - [#6911](https://github.com/flutter/devtools/pull/6911)

  如果 Flutter pub 根目录被意外缓存，则将其移除 - [#6911](https://github.com/flutter/devtools/pull/6911)

## Performance updates

## 性能更新

* Changed raster layer preview background to a checkerboard. - [#6827](https://github.com/flutter/devtools/pull/6827)

  将光栅图层预览背景更改为棋盘格。- [#6827](https://github.com/flutter/devtools/pull/6827)

## CPU profiler updates

## CPU 性能分析器更新

* Added hover cards to show sampling rate for the item in drop down. - [#7010](https://github.com/flutter/devtools/pull/7010)

  添加了悬停卡片，显示下拉列表中项目的采样率。- [#7010](https://github.com/flutter/devtools/pull/7010)

  ![Sampling rate for dropdown](/assets/images/docs/tools/devtools/release-notes/images-2.31.0/hover-for-dropdown.png "Sampling rate for dropdown")

## Debugger updates

## 调试器更新

* Highlight `extension type` as a declaration keyword,
  highlight the `$` in identifier interpolation as part of the interpolation,
  and properly highlight comments within type arguments. - [6837](https://github.com/flutter/devtools/pull/6837)

  将 `extension type` 高亮为声明关键字，
  将标识符插值中的 `$` 高亮为插值的一部分，
  并正确高亮类型参数中的注释。- [6837](https://github.com/flutter/devtools/pull/6837)

## Logging updates

## 日志更新

* Added scrollbar to details pane. - [#6917](https://github.com/flutter/devtools/pull/6917)

  为详细信息窗格添加了滚动条。- [#6917](https://github.com/flutter/devtools/pull/6917)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* Fixed an issue that prevented the VS code sidebar from
  loading in recent beta/master builds. - [#6984](https://github.com/flutter/devtools/pull/6984)

  修复了阻止 VS Code 侧边栏在最近的 beta/master 构建中加载的问题。- [#6984](https://github.com/flutter/devtools/pull/6984)

## DevTools Extension updates

## DevTools 扩展更新

* Fixed a couple bugs preventing Dart server apps from
  connecting to DevTools extensions. - [#6982](https://github.com/flutter/devtools/pull/6982), [#6993](https://github.com/flutter/devtools/pull/6993)

  修复了阻止 Dart server 应用连接到 DevTools 扩展的几个 bug。- [#6982](https://github.com/flutter/devtools/pull/6982), [#6993](https://github.com/flutter/devtools/pull/6993)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.31.0).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.31.0)。
