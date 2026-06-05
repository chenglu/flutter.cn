---
# title: DevTools 2.20.0 release notes
title: DevTools 2.20.0 版本说明
# shortTitle: 2.20.0 release notes
shortTitle: 2.20.0 版本说明
breadcrumb: 2.20.0
# description: Release notes for Dart and Flutter DevTools version 2.20.0.
description: Dart 和 Flutter DevTools 2.20.0 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.20.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.20.0 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## CPU profiler updates

## CPU 性能分析器更新

* Add support for grouping samples by tag -
  [#4693](https://github.com/flutter/devtools/pull/4693)

  添加了按标签对样本进行分组的支持 -
  [#4693](https://github.com/flutter/devtools/pull/4693)

  ![samples by tag](/assets/images/docs/tools/devtools/release-notes/images-2.20.0/4693.png "samples by tag")

* Enable guidelines for tree view -
  [#4722](https://github.com/flutter/devtools/pull/4722)

  为树形视图启用了参考线 -
  [#4722](https://github.com/flutter/devtools/pull/4722)

  ![guidelines](/assets/images/docs/tools/devtools/release-notes/images-2.20.0/4722.png "guidelines")

* Rename "Profile granularity" to "CPU sampling rate"
  and move down to the area it relates to -
  [#4803](https://github.com/flutter/devtools/pull/4722)

  将「Profile granularity」重命名为「CPU sampling rate」
  并移至相关区域 -
  [#4803](https://github.com/flutter/devtools/pull/4722)

  ![sampling rate](/assets/images/docs/tools/devtools/release-notes/images-2.20.0/4803.png "sampling rate")


## Memory updates

## 内存更新

* Retire the **Analysis** tab -
  [#4714](https://github.com/flutter/devtools/pull/4714)

  移除了 **Analysis** 标签页 -
  [#4714](https://github.com/flutter/devtools/pull/4714)

* Add a new tab, **Diff**, to enable memory leak detection
  and troubleshooting by comparing heap snapshots,
  providing insights about the number of instances,
  shallow size, retained size, and retaining paths -
  [#4714](https://github.com/flutter/devtools/pull/4714)

  添加了新标签页 **Diff**，通过比较堆快照
  实现内存泄漏检测和故障排除，
  提供实例数量、浅层大小、保留大小和保留路径的洞察 -
  [#4714](https://github.com/flutter/devtools/pull/4714)

  ![diff](/assets/images/docs/tools/devtools/release-notes/images-2.20.0/4714.png "Diff in Memory tab")

## Debugger updates

## 调试器更新

* Support for inspecting more types of instances in the variables viewer
  (Expandos, Types, TypeArguments, Parameters, Closures + closure Contexts,
  WeakProperty, Function, FunctionType, ReceivePort, Closure, RegExp) -
  [#4760](https://github.com/flutter/devtools/pull/4760)

  在变量查看器中支持检查更多类型的实例
  （Expandos、Types、TypeArguments、Parameters、Closures + closure Contexts、
  WeakProperty、Function、FunctionType、ReceivePort、Closure、RegExp）-
  [#4760](https://github.com/flutter/devtools/pull/4760)

* Add support for displaying coverage in CodeView -
  [#4700](https://github.com/flutter/devtools/pull/4700)

  添加了在 CodeView 中显示覆盖率的支持 -
  [#4700](https://github.com/flutter/devtools/pull/4700)

  ![coverage](/assets/images/docs/tools/devtools/release-notes/images-2.20.0/4700.png "coverage in CodeView")

## Network updates

## 网络更新

* Display request data if content type is not json
  (thanks to @leungpuikuen!) -
  [#4602](https://github.com/flutter/devtools/pull/4602)

  当内容类型不是 json 时显示请求数据
  （感谢 @leungpuikuen！）-
  [#4602](https://github.com/flutter/devtools/pull/4602)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.19.0...v2.20.0).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.19.0...v2.20.0)。
