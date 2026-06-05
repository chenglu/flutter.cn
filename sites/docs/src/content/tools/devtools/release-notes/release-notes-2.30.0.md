---
# title: DevTools 2.30.0 release notes
title: DevTools 2.30.0 版本说明
# shortTitle: 2.30.0 release notes
shortTitle: 2.30.0 版本说明
breadcrumb: 2.30.0
# description: Release notes for Dart and Flutter DevTools version 2.30.0.
description: Dart 和 Flutter DevTools 2.30.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.30.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.30.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Performance updates

## 性能更新

* Add an indicator of the rendering engine to the Flutter Frames chart. -
  [#6771](https://github.com/flutter/devtools/pull/6771)

  在 Flutter Frames 图表中添加了渲染引擎指示器。-
  [#6771](https://github.com/flutter/devtools/pull/6771)

  ![Flutter rendering engine text](/assets/images/docs/tools/devtools/release-notes/images-2.30.0/flutter_frames_engine_text.png "Text describing the current flutter rendering engine")

* Improve messaging when we do not have analysis data available for a
  Flutter frame. - [#6768](https://github.com/flutter/devtools/pull/6768)

  改进了 Flutter 帧没有可用分析数据时的提示信息。- [#6768](https://github.com/flutter/devtools/pull/6768)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* The Flutter Sidebar provided to VS Code now has the ability to enable new
  platforms if a device is available for a platform that is not enabled for
  the current project. This also requires a corresponding Dart extension for
  VS Code update to appear. - [#6688](https://github.com/flutter/devtools/pull/6688)

  提供给 VS Code 的 Flutter 侧边栏现在可以在
  当前项目未启用的平台有可用设备时启用新平台。
  这也需要相应的 VS Code Dart 扩展更新才能显示。- [#6688](https://github.com/flutter/devtools/pull/6688)

* The DevTools menu in the sidebar now has an entry "Open in Browser"
  that opens DevTools in an external browser window even when VS Code settings
  are set to usually use embedded DevTools. - [#6736](https://github.com/flutter/devtools/pull/6736)

  侧边栏中的 DevTools 菜单现在有一个「Open in Browser」条目，
  即使 VS Code 设置通常使用嵌入式 DevTools，
  也会在外部浏览器窗口中打开 DevTools。- [#6736](https://github.com/flutter/devtools/pull/6736)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.30.0).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.30.0)。
