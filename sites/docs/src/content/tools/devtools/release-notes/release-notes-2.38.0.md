---
# title: DevTools 2.38.0 release notes
title: DevTools 2.38.0 发布说明
# shortTitle: 2.38.0 release notes
shortTitle: 2.38.0 发布说明
breadcrumb: 2.38.0
# description: Release notes for Dart and Flutter DevTools version 2.38.0.
description: Dart 和 Flutter DevTools 2.38.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.38.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.38.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## Performance updates

## 性能更新

* Renamed the "Track" builds, paints, and layouts settings to "Trace"
  builds, paints, and layouts. - [#8084](https://github.com/flutter/devtools/pull/8084)

  将「Track」builds、paints 和 layouts 设置重命名为「Trace」
  builds、paints 和 layouts。- [#8084](https://github.com/flutter/devtools/pull/8084)
* Renamed the "Track widget build counts" setting to "Count widget builds". - [#8084](https://github.com/flutter/devtools/pull/8084)

  将「Track widget build counts」设置重命名为「Count widget builds」。- [#8084](https://github.com/flutter/devtools/pull/8084)

## Debugger updates

## 调试器更新

* Added recommendation to debug code from an IDE, with links to IDE instructions. - [#8085](https://github.com/flutter/devtools/pull/8085)

  添加了从 IDE 调试代码的建议，并附有 IDE 说明链接。- [#8085](https://github.com/flutter/devtools/pull/8085)

## Network profiler updates

## 网络分析器更新

* Added support to export network requests as a HAR file (thanks to @hrajwade96!). - [#7970](https://github.com/flutter/devtools/pull/7970)

  添加了将网络请求导出为 HAR 文件的支持（感谢 @hrajwade96！）。- [#7970](https://github.com/flutter/devtools/pull/7970)

## DevTools Extension updates

## DevTools 扩展更新

* Fixed an issue where extensions did not load with the proper theme when
  embedded in an IDE. - [#8034](https://github.com/flutter/devtools/pull/8034)

  修复了扩展嵌入在 IDE 中时未以正确主题加载的问题。- [#8034](https://github.com/flutter/devtools/pull/8034)
* Added an API for copying text to clipboard by proxy of the parent DevTools web app, which has
  workarounds for copy issues when embedded inside an IDE. - [#8130](https://github.com/flutter/devtools/pull/8130)

  添加了通过父 DevTools Web 应用代理将文本复制到剪贴板的 API，
  其中包含嵌入 IDE 内部时复制问题的解决方法。- [#8130](https://github.com/flutter/devtools/pull/8130)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.38.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.38.0)。
