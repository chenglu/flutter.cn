---
# title: DevTools 2.32.0 release notes
title: DevTools 2.32.0 发布说明
# shortTitle: 2.32.0 release notes
shortTitle: 2.32.0 发布说明
breadcrumb: 2.32.0
# description: Release notes for Dart and Flutter DevTools version 2.32.0.
description: Dart 和 Flutter DevTools 2.32.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.32.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 的 2.32.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Improved overall usability by making the DevTools UI more dense.
  This significantly improves the user experience when using
  DevTools embedded in an IDE. - [#7030](https://github.com/flutter/devtools/pull/7030)

  通过让 DevTools UI 更加紧凑来提升整体可用性。
  这显著改善了在 IDE 中嵌入使用 DevTools 时的用户体验。- [#7030](https://github.com/flutter/devtools/pull/7030)
* Removed the "Dense mode" setting. - [#7086](https://github.com/flutter/devtools/pull/7086)

  移除了「Dense mode」设置。- [#7086](https://github.com/flutter/devtools/pull/7086)
* Added support for filtering with regular expressions in the
  Logging, Network, and CPU profiler pages - [#7027](https://github.com/flutter/devtools/pull/7027)

  在 Logging、Network 和 CPU profiler 页面中添加了使用正则表达式进行过滤的支持 - [#7027](https://github.com/flutter/devtools/pull/7027)
* Add a DevTools server interaction for getting the DTD uri. - [#7054](https://github.com/flutter/devtools/pull/7054)

  添加了用于获取 DTD uri 的 DevTools 服务器交互。- [#7054](https://github.com/flutter/devtools/pull/7054)

## Memory updates

## 内存更新

* Supported allocation tracing for Flutter profile builds and
  Dart AOT compiled applications. - [#7058](https://github.com/flutter/devtools/pull/7058)

  支持对 Flutter profile 构建和 Dart AOT 编译应用程序进行分配跟踪。- [#7058](https://github.com/flutter/devtools/pull/7058)
* Supported import of memory snapshots. - [#6974](https://github.com/flutter/devtools/pull/6974)

  支持导入内存快照。- [#6974](https://github.com/flutter/devtools/pull/6974)

## Debugger updates

## 调试器更新

* Highlighted `extension type` as a declaration keyword,
  highlight the `$` in identifier interpolation as part of the interpolation,
  and properly highlight comments within type arguments. - [#6837](https://github.com/flutter/devtools/pull/6837)

  将 `extension type` 高亮为声明关键字，
  将标识符插值中的 `$` 高亮为插值的一部分，
  并正确高亮类型参数中的注释。- [#6837](https://github.com/flutter/devtools/pull/6837)

## Logging updates

## 日志更新

* Added toggle filters to filter out noisy Flutter and Dart logs - [#7026](https://github.com/flutter/devtools/pull/7026)

  添加了切换过滤器，用于过滤嘈杂的 Flutter 和 Dart 日志 - [#7026](https://github.com/flutter/devtools/pull/7026)

  ![Logging view filters](/assets/images/docs/tools/devtools/release-notes/images-2.32.0/logging_toggle_filters.png "Toggle filters for logging screen")

* Added a scrollbar to the details pane. - [#6917](https://github.com/flutter/devtools/pull/6917)

  在详细信息面板中添加了滚动条。- [#6917](https://github.com/flutter/devtools/pull/6917)

## DevTools extension updates

## DevTools 扩展更新

* Added a description and documentation link to the `devtools_options.yaml` file
  that is created in a user's project. - [#7052](https://github.com/flutter/devtools/pull/7052)

  为用户项目中创建的 `devtools_options.yaml` 文件添加了描述和文档链接。- [#7052](https://github.com/flutter/devtools/pull/7052)
* Updated the Simulated DevTools Environment Panel to be collapsible
  (thanks to @victoreronmosele!) - [#7062](https://github.com/flutter/devtools/pull/7062)

  更新了 Simulated DevTools Environment Panel，使其可折叠
  （感谢 @victoreronmosele！）- [#7062](https://github.com/flutter/devtools/pull/7062)
* Integrated DevTools extensions with the new Dart Tooling Daemon.
  This will allow DevTools extensions to access public methods registered by
  other DTD clients, such as an IDE, as well as access a minimal file system API
  for interacting with the development project. - [#7108](https://github.com/flutter/devtools/pull/7108)

  将 DevTools 扩展与新的 Dart Tooling Daemon 集成。
  这让 DevTools 扩展可以访问由其他 DTD 客户端（例如 IDE）注册的公共方法，
  以及访问用于与开发项目交互的最小文件系统 API。- [#7108](https://github.com/flutter/devtools/pull/7108)

## VS Code sidebar updates

## VS Code 侧边栏更新

* Fixed an issue that prevented the VS code sidebar from
  loading in recent `beta` and `main` builds. - [#6984](https://github.com/flutter/devtools/pull/6984)

  修复了阻止 VS Code 侧边栏在最近的 `beta` 和 `main` 构建中加载的问题。- [#6984](https://github.com/flutter/devtools/pull/6984)
* Showed DevTools extensions as an option from the
  debug sessions DevTools dropdown, when available. [#6709](https://github.com/flutter/devtools/pull/6709)

  在可用时，从调试会话的 DevTools 下拉菜单中将 DevTools 扩展显示为一个选项。[#6709](https://github.com/flutter/devtools/pull/6709)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.32.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.32.0)。
