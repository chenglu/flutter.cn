---
# title: DevTools 2.41.0 release notes
title: DevTools 2.41.0 发布说明
# shortTitle: 2.41.0 release notes
shortTitle: 2.41.0 发布说明
breadcrumb: 2.41.0
# description: Release notes for Dart and Flutter DevTools version 2.41.0.
description: Dart 和 Flutter DevTools 2.41.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.41.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.41.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

* Persist filter settings across sessions. - [#8447](https://github.com/flutter/devtools/pull/8447),
  [#8456](https://github.com/flutter/devtools/pull/8456)
  [#8470](https://github.com/flutter/devtools/pull/8470)

  在会话之间持久化过滤器设置。- [#8447](https://github.com/flutter/devtools/pull/8447),
  [#8456](https://github.com/flutter/devtools/pull/8456)
  [#8470](https://github.com/flutter/devtools/pull/8470)

## Inspector updates

## 检查器更新

* Added an option to the new Inspector's settings to allow
  auto-refreshing the widget tree after a hot-reload. -
  [#8483](https://github.com/flutter/devtools/pull/8483)

  在新 Inspector 的设置中添加了选项，
  让你在热重载后自动刷新 widget 树。-
  [#8483](https://github.com/flutter/devtools/pull/8483)

## Network profiler updates

## 网络分析器更新

* Added a filter text field to the top-level Network profiler controls. -
  [#8469](https://github.com/flutter/devtools/pull/8469)

  在顶层 Network profiler 控件中添加了过滤文本字段。-
  [#8469](https://github.com/flutter/devtools/pull/8469)
  ![Network filter field](/assets/images/docs/tools/devtools/release-notes/images-2.41.0/network_filter.png "Network filter field")

## Logging updates

## 日志更新

* Fetch log details immediately upon receiving logs so that log data is not lost
  due to lazy loading. - [#8421](https://github.com/flutter/devtools/pull/8421)

  在收到日志时立即获取日志详情，以免因延迟加载而丢失日志数据。- [#8421](https://github.com/flutter/devtools/pull/8421)
* Reduce initial page load time. - [#8500](https://github.com/flutter/devtools/pull/8500)

  减少了初始页面加载时间。- [#8500](https://github.com/flutter/devtools/pull/8500)
* Added support for displaying metadata, such as log
  severity, category, zone, and isolate -
  [#8419](https://github.com/flutter/devtools/pull/8419),
  [#8439](https://github.com/flutter/devtools/pull/8439),
  [#8441](https://github.com/flutter/devtools/pull/8441). It is now also possible to
  search and filter by these metadata values. - [#8473](https://github.com/flutter/devtools/pull/8473)

  添加了显示元数据的支持，例如日志
  严重性、类别、zone 和 isolate -
  [#8419](https://github.com/flutter/devtools/pull/8419),
  [#8439](https://github.com/flutter/devtools/pull/8439),
  [#8441](https://github.com/flutter/devtools/pull/8441)。现在还可以
  按这些元数据值进行搜索和过滤。- [#8473](https://github.com/flutter/devtools/pull/8473)
  ![Logging metadata display](/assets/images/docs/tools/devtools/release-notes/images-2.41.0/log_metadata.png "Logging metadata display")
* Add a filter text field to the top-level Logging controls. -
  [#8427](https://github.com/flutter/devtools/pull/8427)

  在顶层 Logging 控件中添加了过滤文本字段。-
  [#8427](https://github.com/flutter/devtools/pull/8427)
  ![Logging filter](/assets/images/docs/tools/devtools/release-notes/images-2.41.0/log_filter.png "Logging filter")
* Added support for filtering by log severity / levels. -
  [#8433](https://github.com/flutter/devtools/pull/8433)

  添加了按日志严重性/级别过滤的支持。-
  [#8433](https://github.com/flutter/devtools/pull/8433)
  ![Log level filter](/assets/images/docs/tools/devtools/release-notes/images-2.41.0/log_level_filter.png "Log level filter")
* Added a setting to set the log retention limit. - [#8493](https://github.com/flutter/devtools/pull/8493)

  添加了设置日志保留限制的配置。- [#8493](https://github.com/flutter/devtools/pull/8493)
* Added a button to toggle the log details display between raw text and JSON. -
  [#8445](https://github.com/flutter/devtools/pull/8445)

  添加了在原始文本和 JSON 之间切换日志详情显示的按钮。-
  [#8445](https://github.com/flutter/devtools/pull/8445)
* Fixed a bug where logs would get out of order after midnight. -
  [#8420](https://github.com/flutter/devtools/pull/8420)

  修复了午夜后日志顺序错乱的 bug。-
  [#8420](https://github.com/flutter/devtools/pull/8420)
* Automatically scroll logs table to the bottom on the initial load. -
  [#8437](https://github.com/flutter/devtools/pull/8437)

  在初始加载时自动将日志表格滚动到底部。-
  [#8437](https://github.com/flutter/devtools/pull/8437)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* The legacy `postMessage` version of the VS Code sidebar has been removed in
  favor of the DTD-powered version. Trying to access the legacy sidebar will
  show a message advising to update your Dart VS Code extension. The Dart VS
  Code extension was the only user of the legacy sidebar and migrated off in
  v3.96.

  旧版基于 `postMessage` 的 VS Code 侧边栏已被移除，
  改用基于 DTD 的版本。尝试访问旧版侧边栏将
  显示一条消息，建议更新你的 Dart VS Code 扩展。
  Dart VS Code 扩展是旧版侧边栏的唯一用户，并已在
  v3.96 中完成迁移。

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.41.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.41.0)。
