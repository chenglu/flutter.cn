---
# title: DevTools 2.36.0 release notes
title: DevTools 2.36.0 发布说明
# shortTitle: 2.36.0 release notes
shortTitle: 2.36.0 发布说明
breadcrumb: 2.36.0
# description: Release notes for Dart and Flutter DevTools version 2.36.0.
description: Dart 和 Flutter DevTools 2.36.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.36.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.36.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## Performance updates

## 性能更新

* Added a feature for showing widget build counts.
  Enable this setting to see widget build counts for
  each Flutter frame in the "Frame Analysis" tool, or to see
  an aggregate summary of these counts in the new "Rebuild Stats" tool. -
  [#7838](https://github.com/flutter/devtools/pull/7838), [#7847](https://github.com/flutter/devtools/pull/7847)

  添加了显示 widget 构建次数的功能。
  启用此设置可在「Frame Analysis」工具中查看每个 Flutter 帧的 widget 构建次数，
  或在新的「Rebuild Stats」工具中查看这些次数的汇总摘要。-
  [#7838](https://github.com/flutter/devtools/pull/7838), [#7847](https://github.com/flutter/devtools/pull/7847)

  ![Track widget build counts setting](/assets/images/docs/tools/devtools/release-notes/images-2.36.0/track_build_counts_setting.png "Track widget build counts setting")

  ![Widget rebuild counts in the Frame Analysis view](/assets/images/docs/tools/devtools/release-notes/images-2.36.0/rebuild_counts_frame_analysis.png "Widget rebuilds counts for a flutter frame")

  ![Widget rebuild counts in the Rebuild Stats view](/assets/images/docs/tools/devtools/release-notes/images-2.36.0/rebuild_stats.png "Widget rebuilds counts aggregate stats")

## Network profiler updates

## 网络分析器更新

* Added better support for narrow viewing windows, like when
  this screen is embedded in an IDE. - [#7726](https://github.com/flutter/devtools/pull/7726)

  添加了对窄视窗的更好支持，例如当此屏幕嵌入在 IDE 中时。- [#7726](https://github.com/flutter/devtools/pull/7726)

## Deep links tool updates

## 深层链接工具更新

* Adds an error page to explain the issue when
  the tool fails to parse the project. - [#7767](https://github.com/flutter/devtools/pull/7767)

  添加了错误页面，用于在工具无法解析项目时说明问题。- [#7767](https://github.com/flutter/devtools/pull/7767)

## DevTools Extension updates

## DevTools 扩展更新

* Fixed an issue with detecting extensions for
  Dart or Flutter tests. - [#7717](https://github.com/flutter/devtools/pull/7717)

  修复了检测 Dart 或 Flutter 测试扩展的问题。- [#7717](https://github.com/flutter/devtools/pull/7717)
* Fixed an issue with detecting extensions for
  nested Dart or Flutter projects. - [#7742](https://github.com/flutter/devtools/pull/7742)

  修复了检测嵌套 Dart 或 Flutter 项目扩展的问题。- [#7742](https://github.com/flutter/devtools/pull/7742)
* Added an example to `package:devtools_extensions` that shows
  how to interact with the Dart Tooling Daemon from
  a DevTools extension. - [#7752](https://github.com/flutter/devtools/pull/7752)

  在 `package:devtools_extensions` 中添加了示例，
  展示如何从 DevTools 扩展与 Dart Tooling Daemon 交互。- [#7752](https://github.com/flutter/devtools/pull/7752)
* Fixed a DevTools routing bug related to
  disabling an extension. - [#7791](https://github.com/flutter/devtools/pull/7791)

  修复了与禁用扩展相关的 DevTools 路由 bug。- [#7791](https://github.com/flutter/devtools/pull/7791)
* Fixed a bug causing a "Page Not Found" error when
  refreshing DevTools from an extension screen. - [#7822](https://github.com/flutter/devtools/pull/7822)

  修复了从扩展屏幕刷新 DevTools 时出现「Page Not Found」错误的 bug。- [#7822](https://github.com/flutter/devtools/pull/7822)
* Fixed a theming issue when extensions are
  embedded in an IDE - [#7824](https://github.com/flutter/devtools/pull/7824)

  修复了扩展嵌入在 IDE 中时的主题问题 - [#7824](https://github.com/flutter/devtools/pull/7824)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.36.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.36.0)。
