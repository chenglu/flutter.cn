---
# title: DevTools 2.28.1 release notes
title: DevTools 2.28.1 版本说明
# shortTitle: 2.28.1 release notes
shortTitle: 2.28.1 版本说明
breadcrumb: 2.28.1
# description: Release notes for Dart and Flutter DevTools version 2.28.1.
description: Dart 和 Flutter DevTools 2.28.1 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.28.1 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.28.1 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Added support for DevTools extensions.
  This means if you are debugging an app that depends on `package:foo`,
  and `package:foo` provides a DevTools extension,
  you will see a "Foo" tab display in DevTools
  that you can use to debug your app.
  To provide a DevTools extension for your pub package,
  check out the getting started guide for
  [package:devtools_extensions](https://pub.dev/packages/devtools_extensions)!

  添加了 DevTools 扩展支持。
  这意味着如果你正在调试依赖 `package:foo` 的应用，
  且 `package:foo` 提供了 DevTools 扩展，
  你将在 DevTools 中看到显示的「Foo」标签页，
  可以用它来调试你的应用。
  要为你的 pub package 提供 DevTools 扩展，
  请查看
  [package:devtools_extensions](https://pub.dev/packages/devtools_extensions)
  的入门指南！

![Example DevTools extension](/assets/images/docs/tools/devtools/release-notes/images-2.28.1/example_devtools_extension.png "Example DevTools extension for package:foo_package")

* Fixed theming bug in isolate selector -
  [#6403](https://github.com/flutter/devtools/pull/6403)

  修复了 isolate 选择器中的主题 bug -
  [#6403](https://github.com/flutter/devtools/pull/6403)
* Fixed isolate bug where main isolate was not reselecting on hot restart -
  [#6436](https://github.com/flutter/devtools/pull/6436)

  修复了热重启时 main isolate 未重新选择的 bug -
  [#6436](https://github.com/flutter/devtools/pull/6436)
* Show the hot reload button for Dart server apps that support hot reload -
  [#6341](https://github.com/flutter/devtools/pull/6341)

  为支持热重载的 Dart server 应用显示热重载按钮 -
  [#6341](https://github.com/flutter/devtools/pull/6341)
* Fixed exceptions on hot restart -
  [#6451](https://github.com/flutter/devtools/pull/6451),
  [#6450](https://github.com/flutter/devtools/pull/6450)

  修复了热重启时的异常 -
  [#6451](https://github.com/flutter/devtools/pull/6451),
  [#6450](https://github.com/flutter/devtools/pull/6450)

## Inspector updates

## 检查器更新

* Fixed bug where inspector service calls were done on the selected isolate,
  instead of the main isolate -
  [#6434](https://github.com/flutter/devtools/pull/6434)

  修复了检查器服务调用在选定的 isolate 而非 main isolate 上执行的 bug -
  [#6434](https://github.com/flutter/devtools/pull/6434)

## Logging updates

## 日志更新

* Improved responsiveness of the top bar on the Logging view -
  [#6281](https://github.com/flutter/devtools/pull/6281)

  改进了 Logging 视图顶部栏的响应速度 -
  [#6281](https://github.com/flutter/devtools/pull/6281)

* Added the ability to copy filtered logs -
  [#6260](https://github.com/flutter/devtools/pull/6260)

  添加了复制已过滤日志的功能 -
  [#6260](https://github.com/flutter/devtools/pull/6260)

  ![The copy button on the Logging view to the right of the filter tool](/assets/images/docs/tools/devtools/release-notes/images-2.28.1/logger_copy.png "The Logging view copy button")

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.1).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.1)。
