---
# title: DevTools 2.8.0 release notes
title: DevTools 2.8.0 发布说明
# shortTitle: 2.8.0 release notes
shortTitle: 2.8.0 发布说明
breadcrumb: 2.8.0
# description: Release notes for Dart and Flutter DevTools version 2.8.0.
description: Dart 和 Flutter DevTools 2.8.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.8.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 的 2.8.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Improvements for initial page load time -
  [#3325](https://github.com/flutter/devtools/pull/3325)

  改进了初始页面加载时间 -
  [#3325](https://github.com/flutter/devtools/pull/3325)
* Performance improvements for connecting DevTools to a device,
  particularly impactful for low-memory devices -
  [#3468](https://github.com/flutter/devtools/pull/3468)

  改进了将 DevTools 连接到设备的性能，
  对低内存设备尤其有效 -
  [#3468](https://github.com/flutter/devtools/pull/3468)
* For users on Flutter 2.8.0 or greater (or Dart 2.15.0 or greater),
  DevTools should now be launched via the `dart devtools` command
  instead of running `pub global activate devtools`.
  DevTools 2.8.0 will be the last version of DevTools shipped on pub,
  and all future versions of DevTools will be shipped as part of the Dart SDK.
  If you see this warning,
  be sure to open DevTools via `dart devtools` instead of from pub:

  对于使用 Flutter 2.8.0 或更高版本（或 Dart 2.15.0 或更高版本）的用户，
  现在应通过 `dart devtools` 命令启动 DevTools，
  而不是运行 `pub global activate devtools`。
  DevTools 2.8.0 将是通过 pub 发布的最后一个 DevTools 版本，
  未来所有版本的 DevTools 都将作为 Dart SDK 的一部分发布。
  如果你看到此警告，
  请务必通过 `dart devtools` 而不是从 pub 打开 DevTools：

  ![dart devtools warning dialog](/assets/images/docs/tools/devtools/release-notes/images-2.8.0/image1.png "dart devtools warning dialog")

## Performance updates

## 性能更新

* Added a new "Enhance Tracing" feature to help users diagnose UI jank
  stemming from expensive Build, Layout, and Paint operations.

  添加了新的「Enhance Tracing」功能，帮助用户诊断
  源于昂贵的 Build、Layout 和 Paint 操作的 UI 卡顿。

  ![Enhance tracing](/assets/images/docs/tools/devtools/release-notes/images-2.8.0/image2.png "Enhance tracing")

  The expected workflow is as such:

  预期工作流程如下：

  1. User is investigating UI jank in the performance page
  2. User notices a long Build, Layout, and/or Paint event
  3. User turns on the respective tracking toggle in the "Enhance Tracing" feature
  4. User reproduces the UI jank in their app
  5. User looks at the new set of Timeline events, which should now have
     additional child events for widgets built, render objects laid out,
     and/or render objects painted

  1. 用户在性能页面调查 UI 卡顿
  2. 用户注意到较长的 Build、Layout 和/或 Paint 事件
  3. 用户在「Enhance Tracing」功能中打开相应的跟踪切换开关
  4. 用户在其应用中重现 UI 卡顿
  5. 用户查看新的一组 Timeline 事件，现在应该包含
     已构建 widget、已布局渲染对象
     和/或已绘制渲染对象的额外子事件

  ![Timeline events](/assets/images/docs/tools/devtools/release-notes/images-2.8.0/image3.png "Timeline events")

* Added new "More debugging options" feature to allow for disabling
  rendering layers for Clip, Opacity, and Physical Shapes.

  添加了新的「More debugging options」功能，允许禁用
  Clip、Opacity 和 Physical Shapes 的渲染层。

  ![More debugging options](/assets/images/docs/tools/devtools/release-notes/images-2.8.0/image4.png "More debugging options")

  The expected workflow is as such:

  预期工作流程如下：

  1. User is investigating UI jank in the performance page
  2. User notices a lot of janky frames and suspects it could be due to
     excessive use of clipping, opacity, or physical shapes.
  3. User turns off the respective render layer toggle in the "More
     debugging options" feature
  4. User reproduces the UI jank in their app
  5. If the UI jank is reduced with a rendering layer turned off,
     the user should try to optimize their app to use
     less clipping/opacity/physical shape effects.
     If the UI jank is not reduced,
     the user now knows that the performance problem
     is not due to these UI effects.

  1. 用户在性能页面调查 UI 卡顿
  2. 用户注意到大量卡顿帧，怀疑可能是由于
     过度使用裁剪、透明度或物理形状。
  3. 用户在「More debugging options」功能中
     关闭相应的渲染层切换开关
  4. 用户在其应用中重现 UI 卡顿
  5. 如果关闭渲染层后 UI 卡顿减少，
     用户应尝试优化应用以
     减少裁剪/透明度/物理形状效果的使用。
     如果 UI 卡顿没有减少，
     用户现在知道性能问题
     不是由这些 UI 效果引起的。

## Debugger updates

## 调试器更新

* Replaced the "Libraries" pane with a "File Explorer" pane -
  [#3448](https://github.com/flutter/devtools/pull/3448).
  The "File Explorer" pane has two components:

  将「Libraries」面板替换为「File Explorer」面板 -
  [#3448](https://github.com/flutter/devtools/pull/3448)。
  「File Explorer」面板有两个组件：

  1. A tree view of the libraries present in your application.
     You can use the File Explorer to find and open a library,
     or you can use the existing <kbd>Ctrl</kbd> / <kbd>Cmd</kbd> +
     <kbd>P</kbd> keyboard shortcut to search for a file.
  1. A new "Outline" view that shows the structure of the selected library.
     This view will show classes, members, methods, etc.,
     and when an item is selected,
     the source view will jump to the respective line of code
     for the selected item.

  1. 应用程序中现有库的树形视图。
     你可以使用 File Explorer 查找并打开库，
     或者你可以使用现有的 <kbd>Ctrl</kbd> / <kbd>Cmd</kbd> +
     <kbd>P</kbd> 键盘快捷键搜索文件。
  1. 新的「Outline」视图，显示所选库的结构。
     此视图将显示类、成员、方法等，
     当选中某项时，
     源代码视图将跳转到
     所选项对应的代码行。

  ![Outline view selected library](/assets/images/docs/tools/devtools/release-notes/images-2.8.0/image5.png "Outline view selected library")

* Performance improvements to expression evaluation auto complete -
  [#3463](https://github.com/flutter/devtools/pull/3463)

  改进了表达式求值自动完成的性能 -
  [#3463](https://github.com/flutter/devtools/pull/3463)
* Fixed a bug with keyboard shortcuts -
  [#3458](https://github.com/flutter/devtools/pull/3458)

  修复了键盘快捷键的 bug -
  [#3458](https://github.com/flutter/devtools/pull/3458)
* UI polish - [#3421](https://github.com/flutter/devtools/pull/3421),
  [#3449](https://github.com/flutter/devtools/pull/3449)

  UI 优化 - [#3421](https://github.com/flutter/devtools/pull/3421),
  [#3449](https://github.com/flutter/devtools/pull/3449)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.7.0...v2.8.0).

要查看自上一版本以来的完整更改列表，请查看
[GitHub 上的差异](https://github.com/flutter/devtools/compare/v2.7.0...v2.8.0)。
