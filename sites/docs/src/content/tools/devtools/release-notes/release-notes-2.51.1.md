---
# title: DevTools 2.51.1 release notes
title: DevTools 2.51.1 发布说明
# shortTitle: 2.51.1 release notes
shortTitle: 2.51.1 发布说明
breadcrumb: 2.51.1
showToc: false
ai-translated: true
---

The 2.51.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.51.1 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

- Flutter beta channel users were opted into the DevTools-on-Wasm experiment.
  All other users can still enable the Wasm-compiled DevTools from the settings
  dialog. - [#9455](https://github.com/flutter/devtools/pull/9455)

  Flutter beta 渠道用户已默认加入 DevTools-on-Wasm 实验。
  所有其他用户仍可以从设置
  对话框中启用 Wasm 编译的 DevTools。- [#9455](https://github.com/flutter/devtools/pull/9455)
- Added a horizontal scrollbar to data tables to help with navigation. -
  [#9482](https://github.com/flutter/devtools/pull/9482)

  在数据表格中添加了水平滚动条以帮助导航。-
  [#9482](https://github.com/flutter/devtools/pull/9482)
- Made it possible to resize data table columns by dragging the header separators. -
  [#9485](https://github.com/flutter/devtools/pull/9485)

  可以通过拖动标题分隔符来调整数据表格列的大小。-
  [#9485](https://github.com/flutter/devtools/pull/9485)

## Inspector updates

## 检查器更新

- Fixed an issue where selecting a widget with the Inspector would open the
  widget definition file instead of the user's project file. -
  [#176530](https://github.com/flutter/flutter/pull/176530)

  修复了使用 Inspector 选择 widget 时会打开
  widget 定义文件而不是用户项目文件的问题。-
  [#176530](https://github.com/flutter/flutter/pull/176530)

## Network profiler updates

## 网络分析器更新

- Fixed layout of the "error count" badge in the tab name. -
  [#9470](https://github.com/flutter/devtools/pull/9470)

  修复了标签页名称中「error count」徽章的布局。-
  [#9470](https://github.com/flutter/devtools/pull/9470)
- Fixed display of "Response Headers" and "Request Headers" when there are no
  headers. - [#9492](https://github.com/flutter/devtools/pull/9492)

  修复了没有
  标头时「Response Headers」和「Request Headers」的显示。- [#9492](https://github.com/flutter/devtools/pull/9492)
- Added a banner to clearly indicate when DevTools is not logging network
  requests. - [#9495](https://github.com/flutter/devtools/pull/9495)

  添加了横幅，用于清楚地指示 DevTools 未记录网络
  请求时的情况。- [#9495](https://github.com/flutter/devtools/pull/9495)

## VS Code updates

## VS Code 更新

- Fixed issue preventing shortcuts like `Cmd`+`C` and `Cmd`+`V` from working when DevTools was
  embedded inside VS Code on macOS. -
  [#9472](https://github.com/flutter/devtools/pull/9472)

  修复了在 macOS 上将 DevTools 嵌入
  VS Code 内部时 `Cmd`+`C` 和 `Cmd`+`V` 等快捷键无法使用的问题。-
  [#9472](https://github.com/flutter/devtools/pull/9472)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.51.1).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.51.1)。
