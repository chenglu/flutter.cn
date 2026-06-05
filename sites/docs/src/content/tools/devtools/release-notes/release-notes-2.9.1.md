---
# title: DevTools 2.9.1 release notes
title: DevTools 2.9.1 发布说明
# shortTitle: 2.9.1 release notes
shortTitle: 2.9.1 发布说明
breadcrumb: 2.9.1
# description: Release notes for Dart and Flutter DevTools version 2.9.1.
description: Dart 和 Flutter DevTools 2.9.1 版本发布说明。
showToc: false
ai-translated: true
---

The 2.9.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 的 2.9.1 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## Debugger updates

## 调试器更新

* Improve support for inspecting large lists and maps in
  the Debugger variables pane - [#3497](https://github.com/flutter/devtools/pull/3497)

  改进了在调试器变量面板中
  检查大型列表和 map 的支持 - [#3497](https://github.com/flutter/devtools/pull/3497)

  ![Inspection before](/assets/images/docs/tools/devtools/release-notes/images-2.9.1/image1.png "Inspection before")

  ![Inspection after](/assets/images/docs/tools/devtools/release-notes/images-2.9.1/image2.png "Inspection after")

* Added support for selecting objects in the program explorer outline view.
  Selecting an object will automatically scroll the source code
  in the debugger to the selected object -
  [#3480](https://github.com/flutter/devtools/pull/3480)

  添加了在程序资源管理器大纲视图中选择对象的支持。
  选择对象将自动滚动调试器中的源代码
  到所选对象 -
  [#3480](https://github.com/flutter/devtools/pull/3480)

## Performance updates

## 性能更新

* Fix bugs with performance page search and improve performance -
  [#3515](https://github.com/flutter/devtools/pull/3515)

  修复了性能页面搜索的 bug 并改进了性能 -
  [#3515](https://github.com/flutter/devtools/pull/3515)
* Added an enhanced tooltip for flutter frames -
  [#3493](https://github.com/flutter/devtools/pull/3493)

  为 Flutter 帧添加了增强的工具提示 -
  [#3493](https://github.com/flutter/devtools/pull/3493)

  ![Flutter frame tooltips](/assets/images/docs/tools/devtools/release-notes/images-2.9.1/image3.png "Flutter frame tooltips")

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.8.0...v2.9.1).

要查看自上一版本以来的完整更改列表，请查看
[GitHub 上的差异](https://github.com/flutter/devtools/compare/v2.8.0...v2.9.1)。
