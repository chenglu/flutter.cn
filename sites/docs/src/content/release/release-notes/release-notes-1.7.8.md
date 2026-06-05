---
# title: Flutter 1.7.8 release notes
title: Flutter 1.7.8 发行说明
# shortTitle: 1.7.8 release notes
shortTitle: 1.7.8 发行说明
# description: Release notes for Flutter 1.7.8.
description: Flutter 1.7.8 的发行说明。
skipTemplateRendering: true
ai-translated: true
---

The 1.7.8 release is a follow-on to the 1.5.4 stable release in May,
providing 1289 merged PRs and closing 184 issues.
The major themes of this release are:

1.7.8 版本是 5 月份 1.5.4 稳定版本的后续版本，提供 1289 个合并 PR 和关闭 184 个 issue。此版本的主要主题是：


*   Support for 32-bit and 64-bit bundles on Android

  支持 Android 上的 32 位和 64 位捆绑包

*   Large number of iOS features and fixes,

  大量 iOS 功能和修复，

    including improved text editing and localization

包括改进的文本编辑和本地化

*   [AndroidX support](https://github.com/flutter/flutter/pull/31028)
    for new projects via the --androidx flag of 'flutter create'

对于新项目，通过“flutter create”的 --androidx 标志

*   A new widget: the

  一个新的 widget：

    [RangeSlider](https://api.flutter.dev/flutter/material/RangeSlider-class.html)

As detailed in our
[roadmap](https://github.com/flutter/flutter/blob/main/docs/roadmap/Roadmap.md),
we're also continuing the ongoing work in the Flutter engine
and framework to support turning on web and desktop targets;
however, this is not yet ready for general usage.

正如我们详细介绍的[roadmap](https://github.com/flutter/flutter/blob/main/docs/roadmap/Roadmap.md)，我们还将继续进行 Flutter 引擎和框架方面的工作，以支持打开 Web 和桌面目标；然而，这还没有准备好用于一般用途。



## Support for 32-bit and 64-bit Android Bundles

## 支持 32 位和 64 位 Android 捆绑包


From August 1st, 2019, Android apps that use native code and target Android 9 Pie will[ be required to provide a 64-bit version](https://android-developers.googleblog.com/2019/01/get-your-apps-ready-for-64-bit.html) in addition to the 32-bit version when publishing to the Google Play Store. Since all Flutter apps include native code, this requirement will affect new Flutter apps submitted to the store, as well as updates to existing Flutter apps. This does not affect existing app versions published to the store.

从 2019 年 8 月 1 日起，使用本机代码并面向 Android 9 Pie 的 Android 应用程序将[ be required to provide a 64-bit version](https://android-developers.googleblog.com/2019/01/get-your-apps-ready-for-64-bit.html)除了发布到 Google Play 商店时的 32 位版本之外。由于所有 Flutter 应用程序都包含本机代码，因此此要求将影响提交到商店的新 Flutter 应用程序，以及对现有 Flutter 应用程序的更新。这不会影响发布到商店的现有应用程序版本。


This release includes support for building app bundles and APKs that support both 32-bit and 64-bit binaries, completing our work on [https://github.com/flutter/flutter/issues/31922](https://github.com/flutter/flutter/issues/31922). By using this release when building an Android application, your App Bundle or APK now supports both 32-bit and 64-bit CPU architectures by default.

此版本包括对构建同时支持 32 位和 64 位二进制文​​件的应用程序包和 APK 的支持，完成了我们的工作[https://github.com/flutter/flutter/issues/31922](https://github.com/flutter/flutter/issues/31922)。通过在构建 Android 应用程序时使用此版本，你的 App Bundle 或 APK 现在默认支持 32 位和 64 位 CPU 架构。



## Breaking Changes

## 重大变化


The following are the list of breaking changes in this release along with descriptions of each change and how to handle it in your Flutter code.

以下是此版本中的重大更改列表以及每个更改的描述以及如何在 Flutter 代码中处理它。


*   [#29188](https://github.com/flutter/flutter/pull/29188) Fix 25807: implement move in sliver multibox widget

  [#29188](https://github.com/flutter/flutter/pull/29188)修复 25807：在 sliver multibox widget 中实现移动

*   [#29683](https://github.com/flutter/flutter/pull/29683) [Show/hide toolbar and handles based on device kind](https://groups.google.com/d/msgid/flutter-announce/CAAzQ467mb_7ZC4-djDeWLiYEmAH815-R5eums2cWmo2ND%3Dz%3DOw%40mail.gmail.com.)

  [#29683](https://github.com/flutter/flutter/pull/29683)[Show/hide toolbar and handles based on device kind](https://groups.google.com/d/msgid/flutter-announce/CAAzQ467mb_7ZC4-djDeWLiYEmAH815-R5eums2cWmo2ND%3Dz%3DOw%40mail.gmail.com.)

*   [#30040](https://github.com/flutter/flutter/pull/30040) Implement focus traversal for desktop platforms, shoehorn edition.

  [#30040](https://github.com/flutter/flutter/pull/30040)实现桌面平台的焦点遍历，鞋拔子版。

*   [#30579](https://github.com/flutter/flutter/pull/30579) [PointerDownEvent and PointerMoveEvent default buttons to 1](https://groups.google.com/d/msgid/flutter-announce/9ed026a5-f6e3-438d-b4fd-303ae444323d%40googlegroups.com.)

  [#30579](https://github.com/flutter/flutter/pull/30579)[PointerDownEvent and PointerMoveEvent default buttons to 1](https://groups.google.com/d/msgid/flutter-announce/9ed026a5-f6e3-438d-b4fd-303ae444323d%40googlegroups.com.)

*   [#30874](https://github.com/flutter/flutter/pull/30874) Redo "Remove pressure customization from some pointer events"

  [#30874](https://github.com/flutter/flutter/pull/30874)重做“从某些指针事件中删除压力自定义”

*   [#31227](https://github.com/flutter/flutter/pull/31227) [Adding CupertinoTabController](https://groups.google.com/d/msgid/flutter-announce/a1e7e4df-0310-4083-93b6-12ffd150dad0%40googlegroups.com.)

  [#31227](https://github.com/flutter/flutter/pull/31227)[Adding CupertinoTabController](https://groups.google.com/d/msgid/flutter-announce/a1e7e4df-0310-4083-93b6-12ffd150dad0%40googlegroups.com.)

*   [#31574](https://github.com/flutter/flutter/pull/31574) Improve RadioListTile Callback Behavior Consistency

  [#31574](https://github.com/flutter/flutter/pull/31574)提高 RadioListTile 回调行为的一致性

*   [#32059](https://github.com/flutter/flutter/pull/32059) fix issue 14014 read only text field

  [#32059](https://github.com/flutter/flutter/pull/32059)修复 issue 14014 只读文本字段

*   [#32842](https://github.com/flutter/flutter/pull/32842) Allow "from" hero state to survive hero animation in a push transition

  [#32842](https://github.com/flutter/flutter/pull/32842)允许“来自”英雄状态在推送过渡中保留英雄动画

*   [#33148](https://github.com/flutter/flutter/pull/33148) ExpandIcon Custom Colors

  [#33148](https://github.com/flutter/flutter/pull/33148)展开图标自定义颜色

*   [#33164](https://github.com/flutter/flutter/pull/33164) [remove Layer.replaceWith due to no usage and no tests](https://groups.google.com/d/msgid/flutter-announce/f9823aec-676a-41e9-a9ff-b6598c63b7fe%40googlegroups.com)

  [#33164](https://github.com/flutter/flutter/pull/33164)[remove Layer.replaceWith due to no usage and no tests](https://groups.google.com/d/msgid/flutter-announce/f9823aec-676a-41e9-a9ff-b6598c63b7fe%40googlegroups.com)

*   [#33370](https://github.com/flutter/flutter/pull/33370) [Update FadeInImage to use new Image APIs]( https://groups.google.com/d/msgid/flutter-announce/CAA8mi4cGh6BVXS5u0g_7Kep6LOL6gO5htViMTgS%2BkMJ08oAjAQ%40mail.gmail.com.)

  [#33370](https://github.com/flutter/flutter/pull/33370)[Update FadeInImage to use new Image APIs]( https://groups.google.com/d/msgid/flutter-announce/CAA8mi4cGh6BVXS5u0g_7Kep6LOL6gO5htViMTgS%2BkMJ08oAjAQ%40mail.gmail.com.)

*   [#34051](https://github.com/flutter/flutter/pull/34051) [Text inline widgets, TextSpan rework (#30069)" with improved backwards compatibility](https://groups.google.com/d/msgid/flutter-announce/CAN87bmyu29-ikjeSouVFNcpR7OEL95NPLnb7DN-F8bVLsnzkzQ%40mail.gmail.com.)

  [#34051](https://github.com/flutter/flutter/pull/34051)[Text inline widgets, TextSpan rework (#30069)with improved backwards compatibility](https://groups.google.com/d/msgid/flutter-announce/CAN87bmyu29-ikjeSouVFNcpR7OEL95NPLnb7DN-F8bVLsnzkzQ%40mail.gmail.com.)

*   [#34095](https://github.com/flutter/flutter/pull/34095) [Cupertino text edit to oltip, reworked](https://groups.google.com/d/msgid/flutter-announce/f7cc747a-c812-4bab-a97c-4adb4ce04084%40googlegroups.com.)

  [#34095](https://github.com/flutter/flutter/pull/34095)[Cupertino text edit to oltip, reworked](https://groups.google.com/d/msgid/flutter-announce/f7cc747a-c812-4bab-a97c-4adb4ce04084%40googlegroups.com.)

*   [#34501](https://github.com/flutter/flutter/pull/34501) [Material] Fix TextDirection and selected thumb for RangeSliderThumbShape and RangeSliderValueIndicatorShape

  [#34501](https://github.com/flutter/flutter/pull/34501)[材质] 修复 RangeSliderThumbShape 和 RangeSliderValueIndicatorShape 的 TextDirection 和选定拇指

*   [#33946](https://github.com/flutter/flutter/pull/33946) Reland "Text inline widgets, TextSpan rework"

  [#33946](https://github.com/flutter/flutter/pull/33946)重新放置“文本内联 widgets，TextSpan 返工”



## Severe Crash Changes

## 严重崩溃变化


We've also fixed several crashing issues in this release.

我们还在此版本中修复了几个崩溃的 issue。


*   [#31228](https://github.com/flutter/flutter/pull/31228) Fix ExpansionPanelList Duplicate Global Keys Exception

  [#31228](https://github.com/flutter/flutter/pull/31228)修复 ExpansionPanelList 重复全局键异常

*   [#31581](https://github.com/flutter/flutter/pull/31581) Fix Exception on Nested TabBarView disposal

  [#31581](https://github.com/flutter/flutter/pull/31581)修复嵌套 TabBarView 处置上的异常

*   [#34460](https://github.com/flutter/flutter/pull/34460) Add back ability to override the local engine in Gradle

  [#34460](https://github.com/flutter/flutter/pull/34460)在 Gradle 中重新添加覆盖本地引擎的功能



## iOS

## iOS


We continue to focus heavily on the iOS support in Flutter, including enhanced text editing and localization in this release.

我们继续重点关注 Flutter 中的 iOS 支持，包括此版本中增强的文本编辑和本地化。


*   [#29809](https://github.com/flutter/flutter/pull/29809) Fix text selection toolbar appearing under obstructions

  [#29809](https://github.com/flutter/flutter/pull/29809)修复文本选择工具栏出现在障碍物下方的问题

*   [#29824](https://github.com/flutter/flutter/pull/29824) Cupertino localization step 8: create a gen_cupertino_localizations and generate one for cupertino english and french

  [#29824](https://github.com/flutter/flutter/pull/29824)Cupertino 本地化第 8 步：创建一个 gen_cupertino_localizations 并为 cupertino 英语和法语生成一个

*   [#29954](https://github.com/flutter/flutter/pull/29954) Cupertino localization step 9: add tests

  [#29954](https://github.com/flutter/flutter/pull/29954)Cupertino 本地化步骤 9：添加测试

*   [#30129](https://github.com/flutter/flutter/pull/30129) Fix refresh control in the gallery demo, update comments

  [#30129](https://github.com/flutter/flutter/pull/30129)修复图库演示中的刷新控制，更新评论

*   [#30224](https://github.com/flutter/flutter/pull/30224) Cupertino localization step 10: update the flutter_localizations README

  [#30224](https://github.com/flutter/flutter/pull/30224)Cupertino 本地化步骤 10：更新 flutter_localizations README

*   [#31039](https://github.com/flutter/flutter/pull/31039) Fix bundle id on iOS launch using flutter run

  [#31039](https://github.com/flutter/flutter/pull/31039)使用 flutter run 修复 iOS 启动时的包 ID

*   [#31308](https://github.com/flutter/flutter/pull/31308) Added font bold when isDefaultAction is true in CupertinoDialogAction

  [#31308](https://github.com/flutter/flutter/pull/31308)当 CupertinoDialogAction 中 isDefaultAction 为 true 时添加粗体字体

*   [#31326](https://github.com/flutter/flutter/pull/31326) Add more shuffle cupertino icons

  [#31326](https://github.com/flutter/flutter/pull/31326)添加更多随机播放库比蒂诺图标

*   [#31332](https://github.com/flutter/flutter/pull/31332) iOS selection handles are invisible

  [#31332](https://github.com/flutter/flutter/pull/31332)iOS 选择手柄不可见

*   [#31464](https://github.com/flutter/flutter/pull/31464) CupertinoPicker fidelity revision

  [#31464](https://github.com/flutter/flutter/pull/31464)CupertinoPicker 保真度修订版

*   [#31623](https://github.com/flutter/flutter/pull/31623) fix edge swiping and dropping back at starting point

  [#31623](https://github.com/flutter/flutter/pull/31623)修复边缘滑动和回落到起点的问题

*   [#31644](https://github.com/flutter/flutter/pull/31644) Cupertino localization step 12: push translation for all supported languages

  [#31644](https://github.com/flutter/flutter/pull/31644)Cupertino 本地化步骤 12：推送所有支持语言的翻译

*   [#31687](https://github.com/flutter/flutter/pull/31687) Center iOS caret, remove constant offsets that do not scale

  [#31687](https://github.com/flutter/flutter/pull/31687)居中 iOS 插入符，删除不缩放的常量偏移量

*   [#31763](https://github.com/flutter/flutter/pull/31763) Fix ScrollbarPainter thumbExtent calculation and add padding

  [#31763](https://github.com/flutter/flutter/pull/31763)修复 ScrollbarPainter 的 thumbExtent 计算并添加 padding

*   [#31852](https://github.com/flutter/flutter/pull/31852) Text selection handles are sometimes not interactive

  [#31852](https://github.com/flutter/flutter/pull/31852)文本选择手柄有时不具有交互性

*   [#32013](https://github.com/flutter/flutter/pull/32013) Cupertino Turkish Translation

  [#32013](https://github.com/flutter/flutter/pull/32013)Cupertino 土耳其语翻译

*   [#32086](https://github.com/flutter/flutter/pull/32086) Fix CupertinoSliverRefreshControl onRefresh callback

  [#32086](https://github.com/flutter/flutter/pull/32086)修复 CupertinoSliverRefreshControl onRefresh 回调

*   [#32469](https://github.com/flutter/flutter/pull/32469) Let CupertinoNavigationBarBackButton take a custom onPressed

  [#32469](https://github.com/flutter/flutter/pull/32469)让 CupertinoNavigationBarBackButton 采取自定义 onPressed

*   [#32513](https://github.com/flutter/flutter/pull/32513) Cupertino localization step 12 try 2: push translation for all supported languages

  [#32513](https://github.com/flutter/flutter/pull/32513)Cupertino 本地化步骤 12 尝试 2：推送所有支持语言的翻译

*   [#32620](https://github.com/flutter/flutter/pull/32620) Added ScrollController to TextField

  [#32620](https://github.com/flutter/flutter/pull/32620)将 ScrollController 添加到 TextField

*   [#32823](https://github.com/flutter/flutter/pull/32823) Add enableInteractiveSelection to CupertinoTextField

  [#32823](https://github.com/flutter/flutter/pull/32823)将 enableInteractiveSelection 添加到 CupertinoTextField

*   [#32974](https://github.com/flutter/flutter/pull/32974) Fix disabled CupertinoTextField style

  [#32974](https://github.com/flutter/flutter/pull/32974)修复禁用的 CupertinoTextField 样式

*   [#33450](https://github.com/flutter/flutter/pull/33450) Do not return null from IosProject.isSwift

  [#33450](https://github.com/flutter/flutter/pull/33450)不要从 IosProject.isSwift 返回 null

*   [#33624](https://github.com/flutter/flutter/pull/33624) CupertinoTabScaffold crash fix

  [#33624](https://github.com/flutter/flutter/pull/33624)CupertinoTabScaffold 崩溃修复

*   [#33634](https://github.com/flutter/flutter/pull/33634) Let there be scroll bars

  [#33634](https://github.com/flutter/flutter/pull/33634)要有滚动条

*   [#33653](https://github.com/flutter/flutter/pull/33653) Include advice about dispose in TextEditingController api

  [#33653](https://github.com/flutter/flutter/pull/33653)在 TextEditingController api 中包含有关处置的建议

*   [#33684](https://github.com/flutter/flutter/pull/33684) Disable CocoaPods input and output paths in Xcode build phase and adopt new Xcode build system

  [#33684](https://github.com/flutter/flutter/pull/33684)在 Xcode 构建阶段禁用 CocoaPods 输入和输出路径并采用新的 Xcode 构建系统

*   [#33739](https://github.com/flutter/flutter/pull/33739) fixed cupertinoTextField placeholder textAlign

  [#33739](https://github.com/flutter/flutter/pull/33739)修复了 cupertinoTextField 占位符文本对齐

*   [#33852](https://github.com/flutter/flutter/pull/33852) Disable CocoaPods input and output paths in Xcode build phase and adopt new Xcode build system

  [#33852](https://github.com/flutter/flutter/pull/33852)在 Xcode 构建阶段禁用 CocoaPods 输入和输出路径并采用新的 Xcode 构建系统

*   [#34293](https://github.com/flutter/flutter/pull/34293) Change Xcode developmentRegion to 'en' and CFBundleDevelopmentRegion to DEVELOPMENT_LANGUAGE

  [#34293](https://github.com/flutter/flutter/pull/34293)将 Xcode developmentRegion 更改为“en”，将 CFBundleDevelopmentRegion 更改为 DEVELOPMENT_LANGUAGE

*   [#34964](https://github.com/flutter/flutter/pull/34964) CupertinoTextField.onTap

  [#34964](https://github.com/flutter/flutter/pull/34964)CupertinoTextField.onTap



## Android

## Android


In this release, we've improved support for Android with new support for AndroidX from an external contributor (Thanks, [Josh](https://github.com/athornz)!) and supporting 64-bit and 32-bit APK bundles in compliance with [the Google Play Store's updated policy](https://developer.android.com/distribute/best-practices/develop/64-bit).

在此版本中，我们改进了对 Android 的支持，并添加了来自外部贡献者的对 AndroidX 的新支持（谢谢，[Josh](https://github.com/athornz)！）并支持 64 位和 32 位 APK 捆绑包，符合[the Google Play Store's updated policy](https://developer.android.com/distribute/best-practices/develop/64-bit).




*   [#31028](https://github.com/flutter/flutter/pull/31028) Adds support for generating projects that use AndroidX support libraries

  [#31028](https://github.com/flutter/flutter/pull/31028)添加对生成使用 AndroidX 支持库的项目的支持

*   [#31359](https://github.com/flutter/flutter/pull/31359) Remove support for building dynamic patches on Android

  [#31359](https://github.com/flutter/flutter/pull/31359)删除对在 Android 上构建动态补丁的支持

*   [#31491](https://github.com/flutter/flutter/pull/31491) Allow adb stdout to contain the port number without failing

  [#31491](https://github.com/flutter/flutter/pull/31491)允许 adb stdout 包含端口号而不会失败

*   [#31835](https://github.com/flutter/flutter/pull/31835) Cherry-pick ADB CrOS fix to beta

  [#31835](https://github.com/flutter/flutter/pull/31835)精选 ADB CrOS 修复测试版

*   [#32787](https://github.com/flutter/flutter/pull/32787) Support 32 and 64 bit

  [#32787](https://github.com/flutter/flutter/pull/32787)支持 32 位和 64 位

*   [#33191](https://github.com/flutter/flutter/pull/33191) Remove colon from Gradle task name since it's deprecated

  [#33191](https://github.com/flutter/flutter/pull/33191)从 Gradle 任务名称中删除冒号，因为它已被弃用

*   [#33611](https://github.com/flutter/flutter/pull/33611) Use Dart's new direct ELF generator to package AOT blobs as shared libraries in Android APKs

  [#33611](https://github.com/flutter/flutter/pull/33611)使用 Dart 的新直接 ELF 生成器将 AOT blob 打包为 Android APK 中的共享库

*   [#33696](https://github.com/flutter/flutter/pull/33696) Generate ELF shared libraries and allow multi-abi libs in APKs and App bundles

  [#33696](https://github.com/flutter/flutter/pull/33696)生成 ELF 共享库并允许 APK 和应用程序包中的多 abi 库

*   [#33901](https://github.com/flutter/flutter/pull/33901) Respond to AndroidView focus events.

  [#33901](https://github.com/flutter/flutter/pull/33901)响应 AndroidView 焦点事件。

*   [#33923](https://github.com/flutter/flutter/pull/33923) [flutter_tool] Track APK sha calculation time

  [#33923](https://github.com/flutter/flutter/pull/33923)[flutter_tool] 追踪 APK sha 计算时间

*   [#33951](https://github.com/flutter/flutter/pull/33951) Whitelist adb.exe heap corruption exit code.

  [#33951](https://github.com/flutter/flutter/pull/33951)白名单 adb.exe 堆损坏退出代码。

*   [#34066](https://github.com/flutter/flutter/pull/34066) Adds the androidX flag to a modules pubspec.yaml template so it is se…

  [#34066](https://github.com/flutter/flutter/pull/34066)将 androidX 标志添加到模块 pubspec.yaml 模板中，因此它是...

*   [#34123](https://github.com/flutter/flutter/pull/34123) Generate ELF shared libraries and allow multi-abi libs in APKs and App bundles

  [#34123](https://github.com/flutter/flutter/pull/34123)生成 ELF 共享库并允许 APK 和应用程序包中的多 abi 库



## Material

## 材料


This release includes a number of improvements to existing Material components, including the DatePicker, SnackBar and TimePicker, as well as a new component: the [RangeSlider](https://api.flutter.dev/flutter/material/RangeSlider-class.html).

此版本包括对现有 Material 组件的许多改进，包括 DatePicker、SnackBar 和 TimePicker，以及一个新组件：[RangeSlider](https://api.flutter.dev/flutter/material/RangeSlider-class.html).




*   [#30572](https://github.com/flutter/flutter/pull/30572) [Material] Adaptive Slider constructor

  [#30572](https://github.com/flutter/flutter/pull/30572)[素材] 自适应 Slider 构造函数

*   [#30884](https://github.com/flutter/flutter/pull/30884) [Material] Update TabController to support dynamic Tabs

  [#30884](https://github.com/flutter/flutter/pull/30884)[Material] 更新 TabController 以支持动态 Tabs

*   [#31018](https://github.com/flutter/flutter/pull/31018) [Material] selected/unselected label styles + icon themes on BottomNavigationBar

  [#31018](https://github.com/flutter/flutter/pull/31018)[材质] BottomNavigationBar 上选定/未选定的标签样式 + 图标主题

*   [#31025](https://github.com/flutter/flutter/pull/31025) added scrimColor property in Scaffold widget

  [#31025](https://github.com/flutter/flutter/pull/31025)在 Scaffold widget 中添加了 scrimColor 属性

*   [#31275](https://github.com/flutter/flutter/pull/31275) Update SnackBar to allow for support of the new style from Material spec

  [#31275](https://github.com/flutter/flutter/pull/31275)更新 SnackBar 以支持 Material 规范中的新样式

*   [#31295](https://github.com/flutter/flutter/pull/31295) Improve ThemeData.accentColor connection to secondary color

  [#31295](https://github.com/flutter/flutter/pull/31295)改进 ThemeData.accentColor 与辅助颜色的连接

*   [#31318](https://github.com/flutter/flutter/pull/31318) Add BottomSheetTheme to enable theming color, elevation, shape of BottomSheet

  [#31318](https://github.com/flutter/flutter/pull/31318)添加 BottomSheetTheme 以启用 BottomSheet 的主题颜色、高度、形状

*   [#31438](https://github.com/flutter/flutter/pull/31438) Implements focus handling and hover for Material buttons.

  [#31438](https://github.com/flutter/flutter/pull/31438)实现材质按钮的焦点处理和悬停。

*   [#31514](https://github.com/flutter/flutter/pull/31514) Date picker layout exceptions

  [#31514](https://github.com/flutter/flutter/pull/31514)日期选择器布局例外

*   [#31566](https://github.com/flutter/flutter/pull/31566) TimePicker moves to minute mode after hour selection

  [#31566](https://github.com/flutter/flutter/pull/31566)选择小时后，TimePicker 转至分钟模式

*   [#31662](https://github.com/flutter/flutter/pull/31662) added shape property to SliverAppBar

  [#31662](https://github.com/flutter/flutter/pull/31662)为 SliverAppBar 添加了 shape 属性

*   [#31681](https://github.com/flutter/flutter/pull/31681) [Material] Create a themable Range Slider (continuous and discrete)

  [#31681](https://github.com/flutter/flutter/pull/31681)[材质] 创建主题范围 Slider（连续和离散）

*   [#31693](https://github.com/flutter/flutter/pull/31693) Adds a note to Radio's/RadioListTile's onChange

  [#31693](https://github.com/flutter/flutter/pull/31693)向 Radio/RadioListTile 的 onChange 添加注释

*   [#31902](https://github.com/flutter/flutter/pull/31902) Updated primaryColor docs to refer to colorScheme properties

  [#31902](https://github.com/flutter/flutter/pull/31902)更新了 primaryColor 文档以引用 colorScheme 属性

*   [#31938](https://github.com/flutter/flutter/pull/31938) Update scrimDrawerColor with proper const format

  [#31938](https://github.com/flutter/flutter/pull/31938)使用正确的 const 格式更新 scrimDrawerColor

*   [#32053](https://github.com/flutter/flutter/pull/32053) Increase TimePicker touch targets

  [#32053](https://github.com/flutter/flutter/pull/32053)增加 TimePicker 触摸目标

*   [#32070](https://github.com/flutter/flutter/pull/32070) rename foreground and background to light and dark [#32527](https://github.com/flutter/flutter/pull/32527) Added 'enabled' property to the PopupMenuButton

  [#32070](https://github.com/flutter/flutter/pull/32070)将前景和背景重命名为浅色和深色[#32527](https://github.com/flutter/flutter/pull/32527)向 PopupMenuButton 添加了“enabled”属性

*   [#32726](https://github.com/flutter/flutter/pull/32726) Material should not prevent ScrollNotifications from bubbling upwards

  [#32726](https://github.com/flutter/flutter/pull/32726)材料不应阻止 ScrollNotifications 向上冒泡

*   [#32904](https://github.com/flutter/flutter/pull/32904) Use reverseDuration on Tooltip and InkWell

  [#32904](https://github.com/flutter/flutter/pull/32904)在 Tooltip 和 InkWell 上使用 reverseDuration

*   [#32911](https://github.com/flutter/flutter/pull/32911) Material Long Press Text Handle Flash

  [#32911](https://github.com/flutter/flutter/pull/32911)材质 长按文字手柄 Flash

*   [#33073](https://github.com/flutter/flutter/pull/33073) SliverAppBar shape property

  [#33073](https://github.com/flutter/flutter/pull/33073)SliverAppBar 形状属性

*   [#34869](https://github.com/flutter/flutter/pull/34869) [Material] Properly call onChangeStart and onChangeEnd in Range Slider

  [#34869](https://github.com/flutter/flutter/pull/34869)[素材] 在 Range Slider 中正确调用 onChangeStart 和 onChangeEnd

*   [#32950](https://github.com/flutter/flutter/pull/32950) Material allows "select all" when not collapsed

  [#32950](https://github.com/flutter/flutter/pull/32950)材料在未折叠时允许“全选”



## Web

## Web


The work on web functionality continues with merging of the code from the flutter_web repo
into the main flutter repo, providing a simpler developer experience for this pre-release
technology. We've already
[compiled many of the existing Flutter samples for web]({{site.github}}/flutter/samples/).
Enjoy!

Web 功能方面的工作仍在继续，将 flutter_web 存储库中的代码合并到主 flutter 存储库中，为该预发布技术提供了更简单的开发人员体验。我们已经[compiled many of the existing Flutter samples for web]({{site.github}}/flutter/samples/)。享受！




*   [#32360](https://github.com/flutter/flutter/pull/32360) Allow flutter web to be compiled with flutter

  [#32360](https://github.com/flutter/flutter/pull/32360)允许使用 flutter 编译 flutter web

*   [#33197](https://github.com/flutter/flutter/pull/33197) Wire up hot restart and incremental rebuilds for web

  [#33197](https://github.com/flutter/flutter/pull/33197)连接网络的热重启和增量重建

*   [#33406](https://github.com/flutter/flutter/pull/33406) Add web safe indirection to Platform.isPlatform getters

  [#33406](https://github.com/flutter/flutter/pull/33406)将 Web 安全间接添加到 Platform.isPlatform getters

*   [#33525](https://github.com/flutter/flutter/pull/33525) Add capability to flutter test –platform=chrome

  [#33525](https://github.com/flutter/flutter/pull/33525)添加颤动测试功能 –platform=chrome

*   [#33533](https://github.com/flutter/flutter/pull/33533) Reland - Wire up hot restart and incremental rebuilds for web

  [#33533](https://github.com/flutter/flutter/pull/33533)Reland - 连接热重启和增量重建网络

*   [#33629](https://github.com/flutter/flutter/pull/33629) Add real-er restart for web using webkit inspection protocol

  [#33629](https://github.com/flutter/flutter/pull/33629)使用 webkit 检查协议为 Web 添加真正的重启

*   [#33859](https://github.com/flutter/flutter/pull/33859) Reland support flutter test on platform chrome

  [#33859](https://github.com/flutter/flutter/pull/33859)Reland 支持 chrome 平台上的 flutter 测试

*   [#33892](https://github.com/flutter/flutter/pull/33892) add benchmarks to track web size

  [#33892](https://github.com/flutter/flutter/pull/33892)添加基准来跟踪网页大小

*   [#33956](https://github.com/flutter/flutter/pull/33956) Codegen an entrypoint for flutter web applications

  [#33956](https://github.com/flutter/flutter/pull/33956)Codegen 是 Fl​​utter Web 应用程序的入口点

*   [#34018](https://github.com/flutter/flutter/pull/34018) Add flutter create for the web

  [#34018](https://github.com/flutter/flutter/pull/34018)添加 flutter create for web

*   [#34084](https://github.com/flutter/flutter/pull/34084) make running on web spooky

  [#34084](https://github.com/flutter/flutter/pull/34084)让在网络上运行变得怪异

*   [#34112](https://github.com/flutter/flutter/pull/34112) Separate web and io implementations of network image

  [#34112](https://github.com/flutter/flutter/pull/34112)网络镜像的独立 web 和 io 实现

*   [#34159](https://github.com/flutter/flutter/pull/34159) Use product define for flutter web and remove extra asset server

  [#34159](https://github.com/flutter/flutter/pull/34159)使用 flutter web 的产品定义并删除额外的资产服务器

*   [#34589](https://github.com/flutter/flutter/pull/34589) Remove most of the target logic for build web, cleanup rules

  [#34589](https://github.com/flutter/flutter/pull/34589)删除构建 Web 的大部分目标逻辑、清理规则

*   [#34856](https://github.com/flutter/flutter/pull/34856) set device name to Chrome

  [#34856](https://github.com/flutter/flutter/pull/34856)将设备名称设置为 Chrome

*   [#34885](https://github.com/flutter/flutter/pull/34885) Reland: rename web device

  [#34885](https://github.com/flutter/flutter/pull/34885)Reland：重命名网络设备



## Desktop

## 桌面


The experimental support for desktop in Flutter continues as well, with many improvements to the basics needed on desktop like hover, focus traversal, shortcuts, actions and even game controllers! We've also continued to simplify the developer experience, which you can read about [here](http://github.com/google/flutter-desktop-embedding). This is very early, but if you are trying desktop support in Flutter, please [log issues](https://github.com/google/flutter-desktop-embedding/issues) when you find them!

Flutter 对桌面的实验性支持也在继续，对桌面所需的基础功能进行了许多改进，如悬停、焦点遍历、快捷方式、操作甚至游戏控制器！我们还继续简化开发者体验，你可以阅读[here](http://github.com/google/flutter-desktop-embedding)。现在还为时过早，但如果你正在尝试 Flutter 中的桌面支持，请[log issues](https://github.com/google/flutter-desktop-embedding/issues)当你找到他们的时候！




*   [#30076](https://github.com/flutter/flutter/pull/30076) Implements FocusTraversalPolicy and DefaultFocusTraversal features.

  [#30076](https://github.com/flutter/flutter/pull/30076)实现 FocusTraversalPolicy 和 DefaultFocusTraversal 功能。

*   [#30339](https://github.com/flutter/flutter/pull/30339) Add buttons to gestures

  [#30339](https://github.com/flutter/flutter/pull/30339)向手势添加按钮

*   [#31329](https://github.com/flutter/flutter/pull/31329) Add Xcode build script for macOS target

  [#31329](https://github.com/flutter/flutter/pull/31329)为 macOS 目标添加 Xcode 构建脚本

*   [#31515](https://github.com/flutter/flutter/pull/31515) Support local engine and asset sync for macOS

  [#31515](https://github.com/flutter/flutter/pull/31515)支持 macOS 的本地引擎和资源同步

*   [#31567](https://github.com/flutter/flutter/pull/31567) Remove need for build/name scripts on Linux desktop

  [#31567](https://github.com/flutter/flutter/pull/31567)不再需要 Linux 桌面上的构建/命名脚本

*   [#31631](https://github.com/flutter/flutter/pull/31631) Teach Linux to use local engine

  [#31631](https://github.com/flutter/flutter/pull/31631)教 Linux 使用本地引擎

*   [#31699](https://github.com/flutter/flutter/pull/31699) Re-land: Add support for Tooltip hover

  [#31699](https://github.com/flutter/flutter/pull/31699)重新着陆：添加对工具提示悬停的支持

*   [#31802](https://github.com/flutter/flutter/pull/31802) Reland "Fix text field selection toolbar under Opacity (#31097)"

  [#31802](https://github.com/flutter/flutter/pull/31802)重新放置“修复不透明度下的文本字段选择工具栏（#31097）”

*   [#31819](https://github.com/flutter/flutter/pull/31819) Redo: Add buttons to gestures

  [#31819](https://github.com/flutter/flutter/pull/31819)重做：向手势添加按钮

*   [#31873](https://github.com/flutter/flutter/pull/31873) Add basic desktop linux checks

  [#31873](https://github.com/flutter/flutter/pull/31873)添加基本​​桌面 Linux 检查

*   [#31935](https://github.com/flutter/flutter/pull/31935) Redo#2: Add buttons to gestures

  [#31935](https://github.com/flutter/flutter/pull/31935)Redo#2：向手势添加按钮

*   [#32025](https://github.com/flutter/flutter/pull/32025) Make Hover Listener respect transforms

  [#32025](https://github.com/flutter/flutter/pull/32025)使 Hover Listener 尊重变换

*   [#32142](https://github.com/flutter/flutter/pull/32142) Fix RenderPointerListener so that callbacks aren't called at the wrong time.

  [#32142](https://github.com/flutter/flutter/pull/32142)修复 RenderPointerListener 以便不会在错误的时间调用回调。

*   [#32335](https://github.com/flutter/flutter/pull/32335) Teach flutter msbuild for Windows

  [#32335](https://github.com/flutter/flutter/pull/32335)为 Windows 教授 flutter msbuild

*   [#32776](https://github.com/flutter/flutter/pull/32776) Text field focus and hover support.

  [#32776](https://github.com/flutter/flutter/pull/32776)文本字段焦点和悬停支持。

*   [#32838](https://github.com/flutter/flutter/pull/32838) Handles hidden by keyboard

  [#32838](https://github.com/flutter/flutter/pull/32838)手柄被键盘隐藏

*   [#32914](https://github.com/flutter/flutter/pull/32914) Make hover and focus not respond when buttons and fields are disabled.

  [#32914](https://github.com/flutter/flutter/pull/32914)当按钮和字段被禁用时，使悬停和焦点不响应。

*   [#33090](https://github.com/flutter/flutter/pull/33090) [Material] Add support for hovered, pressed, and focused text color on Buttons.

  [#33090](https://github.com/flutter/flutter/pull/33090)[材质] 添加对按钮上悬停、按下和聚焦文本颜色的支持。

*   [#33277](https://github.com/flutter/flutter/pull/33277) Implement macOS support in flutter doctor

  [#33277](https://github.com/flutter/flutter/pull/33277)在 flutter doctor 中实现 macOS 支持

*   [#33279](https://github.com/flutter/flutter/pull/33279) Fix a problem in first focus determination.

  [#33279](https://github.com/flutter/flutter/pull/33279)修复首次焦点确定的问题。

*   [#33298](https://github.com/flutter/flutter/pull/33298) Add actions and keyboard shortcut map support

  [#33298](https://github.com/flutter/flutter/pull/33298)添加操作和键盘快捷键映射支持

*   [#33443](https://github.com/flutter/flutter/pull/33443) Wrap Windows build invocation in a batch script

  [#33443](https://github.com/flutter/flutter/pull/33443)将 Windows 构建调用包装在批处理脚本中

*   [#33454](https://github.com/flutter/flutter/pull/33454) ensure unpack declares required artifacts

  [#33454](https://github.com/flutter/flutter/pull/33454)确保 unpack 声明了所需的工件

*   [#33477](https://github.com/flutter/flutter/pull/33477) Fix onExit calling when the mouse is removed.

  [#33477](https://github.com/flutter/flutter/pull/33477)修复鼠标移开时 onExit 调用的问题。

*   [#33540](https://github.com/flutter/flutter/pull/33540) Pass local engine variables to Windows build

  [#33540](https://github.com/flutter/flutter/pull/33540)将本地引擎变量传递给 Windows 构建

*   [#33608](https://github.com/flutter/flutter/pull/33608) Restructure macOS project files

  [#33608](https://github.com/flutter/flutter/pull/33608)重组 macOS 项目文件

*   [#33632](https://github.com/flutter/flutter/pull/33632) Update the keycodes from source

  [#33632](https://github.com/flutter/flutter/pull/33632)从源代码更新密钥代码

*   [#33636](https://github.com/flutter/flutter/pull/33636) Implement plugin tooling support for macOS

  [#33636](https://github.com/flutter/flutter/pull/33636)实现对 macOS 的插件工具支持

*   [#33695](https://github.com/flutter/flutter/pull/33695) Add pseudo-key synonyms for keys like shift, meta, alt, and control.

  [#33695](https://github.com/flutter/flutter/pull/33695)为 Shift、Meta、Alt 和 Control 等键添加伪键同义词。

*   [#33868](https://github.com/flutter/flutter/pull/33868) Game controller button support

  [#33868](https://github.com/flutter/flutter/pull/33868)游戏控制器按钮支持

*   [#33872](https://github.com/flutter/flutter/pull/33872) Add 'doctor' support for Windows

  [#33872](https://github.com/flutter/flutter/pull/33872)添加对 Windows 的“医生”支持

*   [#33874](https://github.com/flutter/flutter/pull/33874) Prevent windows web doctor from launching chrome

  [#33874](https://github.com/flutter/flutter/pull/33874)阻止 Windows Web Doctor 启动 chrome

*   [#34050](https://github.com/flutter/flutter/pull/34050) limit open files on macOS when copying assets

  [#34050](https://github.com/flutter/flutter/pull/34050)复制资源时限制 macOS 上打开的文件

*   [#34376](https://github.com/flutter/flutter/pull/34376) Add missing pieces for 'driver' support on macOS

  [#34376](https://github.com/flutter/flutter/pull/34376)在 macOS 上添加“驱动程序”支持缺失的部分

*   [#34755](https://github.com/flutter/flutter/pull/34755) Add linux doctor implementation

  [#34755](https://github.com/flutter/flutter/pull/34755)添加 linux doctor 实现



## Animation, Scrolling & Images

## 动画、滚动和图像


In this release, we continue to polish animations, scrolling and image support.

在此版本中，我们继续完善动画、滚动和图像支持。




*   [#21896](https://github.com/flutter/flutter/pull/21896) Bottom sheet scrolling

  [#21896](https://github.com/flutter/flutter/pull/21896)底部表单滚动

*   [#28834](https://github.com/flutter/flutter/pull/28834) Sliver animated list [#29677](https://github.com/flutter/flutter/pull/29677) Fix calculation of hero rectTween when Navigator isn't fullscreen

  [#28834](https://github.com/flutter/flutter/pull/28834)银条动画列表[#29677](https://github.com/flutter/flutter/pull/29677)修复导航器非全屏时英雄 rectTween 的计算

*   [#32730](https://github.com/flutter/flutter/pull/32730) Add reverseDuration to AnimationController

  [#32730](https://github.com/flutter/flutter/pull/32730)将 reverseDuration 添加到 AnimationController

*   [#32843](https://github.com/flutter/flutter/pull/32843) Added a missing dispose of an AnimationController that was leaking a ticker.

  [#32843](https://github.com/flutter/flutter/pull/32843)添加了对泄漏股票的 AnimationController 的缺失处理。

*   [#31832](https://github.com/flutter/flutter/pull/31832) Allow DSS to be dragged when its children do not fill extent

  [#31832](https://github.com/flutter/flutter/pull/31832)当 DSS 的子级未填满范围时允许拖动 DSS

*   [#33627](https://github.com/flutter/flutter/pull/33627) SliverFillRemaining flag for different use cases

  [#33627](https://github.com/flutter/flutter/pull/33627)不同用例的 SliverFillRemaining 标志

*   [#32853](https://github.com/flutter/flutter/pull/32853) Add onBytesReceived callback to consolidateHttpClientResponseBytes()

  [#32853](https://github.com/flutter/flutter/pull/32853)添加 onBytesReceived 回调以 consolidateHttpClientResponseBytes()

*   [#32857](https://github.com/flutter/flutter/pull/32857) Add debugNetworkImageHttpClientProvider

  [#32857](https://github.com/flutter/flutter/pull/32857)添加 debugNetworkImageHttpClientProvider

*   [#32936](https://github.com/flutter/flutter/pull/32936) Add clarity to the ImageStream listener API

  [#32936](https://github.com/flutter/flutter/pull/32936)让 ImageStream 侦听器 API 更加清晰

*   [#33729](https://github.com/flutter/flutter/pull/33729) Update consolidateHttpClientResponseBytes() to use compressionState

  [#33729](https://github.com/flutter/flutter/pull/33729)更新 consolidateHttpClientResponseBytes() 以使用压缩状态

*   [#33369](https://github.com/flutter/flutter/pull/33369) Add loading support to Image

  [#33369](https://github.com/flutter/flutter/pull/33369)添加对图像的加载支持



## Typography & Accessibility

## 版式和辅助功能


We're also continuing to push towards excellent typography and accessibility, including support for accessing OpenType font-specific features, as demonstrated in [this sample](https://github.com/timsneath/typography).

我们还继续致力于实现出色的排版和可访问性，包括支持访问 OpenType 字体特定功能，如[this sample](https://github.com/timsneath/typography).




*   [#31987](https://github.com/flutter/flutter/pull/31987) Text wrap width

  [#31987](https://github.com/flutter/flutter/pull/31987)文字换行宽度

*   [#33230](https://github.com/flutter/flutter/pull/33230) Framework support for font features in text styles

  [#33230](https://github.com/flutter/flutter/pull/33230)文本样式中字体功能的框架支持

*   [#33808](https://github.com/flutter/flutter/pull/33808) fix ExpansionPanelList merge the header semantics when it is not necessary

  [#33808](https://github.com/flutter/flutter/pull/33808)修复 ExpansionPanelList 在不需要时合并标头语义

*   [#34368](https://github.com/flutter/flutter/pull/34368) Fix semantics_tester

  [#34368](https://github.com/flutter/flutter/pull/34368)修复语义测试器

*   [#34434](https://github.com/flutter/flutter/pull/34434) Semantics fixes

  [#34434](https://github.com/flutter/flutter/pull/34434)语义修复



## Fundamentals

## 基础知识


As always, we continue to polish the fundamentals.

一如既往，我们继续完善基础知识。




*   [#30388](https://github.com/flutter/flutter/pull/30388) Add hintStyle in SearchDelegate

  [#30388](https://github.com/flutter/flutter/pull/30388)在 SearchDelegate 中添加 hintStyle

*   [#30406](https://github.com/flutter/flutter/pull/30406) Add binaryMessenger constructor argument to platform channels

  [#30406](https://github.com/flutter/flutter/pull/30406)将 binaryMessenger 构造函数参数添加到平台通道

*   [#30612](https://github.com/flutter/flutter/pull/30612) Added required parameters to FlexibleSpaceBarSettings

  [#30612](https://github.com/flutter/flutter/pull/30612)向 FlexibleSpaceBarSettings 添加了必需的参数

*   [#30796](https://github.com/flutter/flutter/pull/30796) Unbounded TextField width error

  [#30796](https://github.com/flutter/flutter/pull/30796)无界 TextField 宽度错误

*   [#30942](https://github.com/flutter/flutter/pull/30942) rectMoreOrLess equals, prep for 64bit rects

  [#30942](https://github.com/flutter/flutter/pull/30942)rectMoreOrLess 等于，准备 64 位矩形

*   [#31282](https://github.com/flutter/flutter/pull/31282) Stop precaching the artifacts for dynamic mode.

  [#31282](https://github.com/flutter/flutter/pull/31282)停止预缓存动态模式的工件。

*   [#31485](https://github.com/flutter/flutter/pull/31485) Prevent exception being thrown on hasScrolledBody

  [#31485](https://github.com/flutter/flutter/pull/31485)防止在 hasScrolledBody 上引发异常

*   [#31520](https://github.com/flutter/flutter/pull/31520) Don't add empty OpacityLayer to the engine

  [#31520](https://github.com/flutter/flutter/pull/31520)不要将空的 OpacityLayer 添加到引擎中

*   [#31526](https://github.com/flutter/flutter/pull/31526) replace no-op log reader with real implementation

  [#31526](https://github.com/flutter/flutter/pull/31526)用实际实现替换无操作日志读取器

*   [#31757](https://github.com/flutter/flutter/pull/31757) Make FlutterProject factories synchronous

  [#31757](https://github.com/flutter/flutter/pull/31757)使 Flutter 项目工厂同步

*   [#31807](https://github.com/flutter/flutter/pull/31807) Make const available for classes that override AssetBundle

  [#31807](https://github.com/flutter/flutter/pull/31807)使 const 可用于覆盖 AssetBundle 的类

*   [#31825](https://github.com/flutter/flutter/pull/31825) Fix missing return statements on function literals

  [#31825](https://github.com/flutter/flutter/pull/31825)修复函数文字上缺少的 return 语句

*   [#31861](https://github.com/flutter/flutter/pull/31861) Add Horizontal Padding to Constrained Chip Label Calculations

  [#31861](https://github.com/flutter/flutter/pull/31861)为受限芯片标签计算添加水平填充

*   [#31868](https://github.com/flutter/flutter/pull/31868) Handle notification errors

  [#31868](https://github.com/flutter/flutter/pull/31868)处理通知错误

*   [#31889](https://github.com/flutter/flutter/pull/31889) Start abstracting platform logic builds behind a shared interface

  [#31889](https://github.com/flutter/flutter/pull/31889)开始抽象共享接口背后的平台逻辑构建

*   [#32126](https://github.com/flutter/flutter/pull/32126) Bump multicast_dns version

  [#32126](https://github.com/flutter/flutter/pull/32126)修改 multicast_dns 版本

*   [#32192](https://github.com/flutter/flutter/pull/32192) Transform PointerEvents to the local coordinate system of the event receiver

  [#32192](https://github.com/flutter/flutter/pull/32192)将 PointerEvents 转换到事件接收者的本地坐标系

*   [#32328](https://github.com/flutter/flutter/pull/32328) Add breadcrumbs to TextOverflow

  [#32328](https://github.com/flutter/flutter/pull/32328)将面包屑添加到 TextOverflow

*   [#32434](https://github.com/flutter/flutter/pull/32434) Support for replacing the TabController, after disposing the old one

  [#32434](https://github.com/flutter/flutter/pull/32434)支持在废弃旧的 TabController 后更换 TabController

*   [#32528](https://github.com/flutter/flutter/pull/32528) Tapping a modal bottom sheet should not dismiss it by default

  [#32528](https://github.com/flutter/flutter/pull/32528)默认情况下，点击模态底部工作表不应将其关闭

*   [#33152](https://github.com/flutter/flutter/pull/33152) ModalRoute resumes previous focus on didPopNext

  [#33152](https://github.com/flutter/flutter/pull/33152)ModalRoute 恢复之前对 didPopNext 的关注

*   [#33297](https://github.com/flutter/flutter/pull/33297) Instrument add to app flows

  [#33297](https://github.com/flutter/flutter/pull/33297)仪器添加到应用程序流程

*   [#33458](https://github.com/flutter/flutter/pull/33458) Add to app measurement

  [#33458](https://github.com/flutter/flutter/pull/33458)添加到应用程序测量

*   [#33462](https://github.com/flutter/flutter/pull/33462) Fix text scaling of strut style

  [#33462](https://github.com/flutter/flutter/pull/33462)修复 strut 样式的文本缩放

*   [#33473](https://github.com/flutter/flutter/pull/33473) fix 23723 rounding error

  [#33473](https://github.com/flutter/flutter/pull/33473)修复 23723 舍入错误

*   [#33474](https://github.com/flutter/flutter/pull/33474) Fixed for DropdownButton crashing when a style was used that didn't include a fontSize

  [#33474](https://github.com/flutter/flutter/pull/33474)修复了使用不包含 fontSize 的样式时 DropdownButton 崩溃的问题

*   [#33475](https://github.com/flutter/flutter/pull/33475) Move declaration of semantic handlers from detectors to recognizers

  [#33475](https://github.com/flutter/flutter/pull/33475)将语义处理程序的声明从检测器移至识别器

*   [#33488](https://github.com/flutter/flutter/pull/33488) use toFixedAsString and DoubleProperty in diagnosticProperties

  [#33488](https://github.com/flutter/flutter/pull/33488)在 diagnosticProperties 中使用 toFixedAsString 和 DoubleProperty

*   [#33802](https://github.com/flutter/flutter/pull/33802) Double double tap toggles instead of error

  [#33802](https://github.com/flutter/flutter/pull/33802)双击切换而不是错误

*   [#33876](https://github.com/flutter/flutter/pull/33876) Reland "Framework support for font features in text styles"

  [#33876](https://github.com/flutter/flutter/pull/33876)Reland“框架对文本样式中字体功能的支持”

*   [#33886](https://github.com/flutter/flutter/pull/33886) Add currentSystemFrameTimeStamp to SchedulerBinding

  [#33886](https://github.com/flutter/flutter/pull/33886)将 currentSystemFrameTimeStamp 添加到 SchedulerBinding

*   [#33955](https://github.com/flutter/flutter/pull/33955) Add localFocalPoint to ScaleDetector

  [#33955](https://github.com/flutter/flutter/pull/33955)将 localFocalPoint 添加到 ScaleDetector

*   [#33999](https://github.com/flutter/flutter/pull/33999) Updating MediaQuery with viewPadding

  [#33999](https://github.com/flutter/flutter/pull/33999)使用 viewPadding 更新 MediaQuery

*   [#34055](https://github.com/flutter/flutter/pull/34055) Toggle toolbar exception fix

  [#34055](https://github.com/flutter/flutter/pull/34055)切换工具栏异常修复

*   [#34057](https://github.com/flutter/flutter/pull/34057) Add endIndent property to Divider and VerticalDivider

  [#34057](https://github.com/flutter/flutter/pull/34057)将 endIndent 属性添加到 Divider 和 VerticalDivider

*   [#34068](https://github.com/flutter/flutter/pull/34068) fix empty selection arrow when double clicked on empty read only text…

  [#34068](https://github.com/flutter/flutter/pull/34068)修复双击空只读文本时空选择箭头的问题...

*   [#34081](https://github.com/flutter/flutter/pull/34081) Report async callback errors that currently go unreported.

  [#34081](https://github.com/flutter/flutter/pull/34081)报告当前未报告的异步回调错误。

*   [#34175](https://github.com/flutter/flutter/pull/34175) Don't show scrollbar if there isn't enough content

  [#34175](https://github.com/flutter/flutter/pull/34175)如果内容不足，不显示滚动条

*   [#34243](https://github.com/flutter/flutter/pull/34243) update the Flutter.Frame event to use new engine APIs

  [#34243](https://github.com/flutter/flutter/pull/34243)更新 Flutter.Frame 事件以使用新的引擎 API

*   [#34295](https://github.com/flutter/flutter/pull/34295) Prepare for Uint8List SDK breaking changes

  [#34295](https://github.com/flutter/flutter/pull/34295)为 Uint8List SDK 重大变更做好准备

*   [#34298](https://github.com/flutter/flutter/pull/34298) Preserving SafeArea : Part 2

  [#34298](https://github.com/flutter/flutter/pull/34298)保护 SafeArea：第 2 部分

*   [#34355](https://github.com/flutter/flutter/pull/34355) Text field vertical align

  [#34355](https://github.com/flutter/flutter/pull/34355)文本字段垂直对齐

*   [#34365](https://github.com/flutter/flutter/pull/34365) redux of a change to use new engine APIs for Flutter.Frame events

  [#34365](https://github.com/flutter/flutter/pull/34365)进行了更改以将新引擎 API 用于 Flutter.Frame 事件

*   [#34508](https://github.com/flutter/flutter/pull/34508) add route information to Flutter.Navigation events

  [#34508](https://github.com/flutter/flutter/pull/34508)将路线信息添加到 Flutter.Navigation 事件

*   [#34512](https://github.com/flutter/flutter/pull/34512) Make sure fab semantics end up on top

  [#34512](https://github.com/flutter/flutter/pull/34512)确保 fab 语义最终位于顶部

*   [#34515](https://github.com/flutter/flutter/pull/34515) OutlineInputBorder adjusts for borderRadius that is too large

  [#34515](https://github.com/flutter/flutter/pull/34515)OutlineInputBorder 针对太大的 borderRadius 进行调整

*   [#34519](https://github.com/flutter/flutter/pull/34519) fix page scroll position rounding error

  [#34519](https://github.com/flutter/flutter/pull/34519)修复页面滚动位置舍入错误

*   [#34526](https://github.com/flutter/flutter/pull/34526) retry on HttpException during cache download

  [#34526](https://github.com/flutter/flutter/pull/34526)在缓存下载期间重试 HttpException

*   [#34529](https://github.com/flutter/flutter/pull/34529) Remove compilation trace and dynamic support code

  [#34529](https://github.com/flutter/flutter/pull/34529)删除编译跟踪和动态支持代码

*   [#34573](https://github.com/flutter/flutter/pull/34573) Ensures flutter jar is added to all build types on plugin projects

  [#34573](https://github.com/flutter/flutter/pull/34573)确保将 flutter jar 添加到插件项目的所有构建类型中

*   [#34587](https://github.com/flutter/flutter/pull/34587) Do not copy paths, rects, and rrects when layer offset is zero

  [#34587](https://github.com/flutter/flutter/pull/34587)当图层偏移为零时，不复制路径、矩形和矩形

*   [#34932](https://github.com/flutter/flutter/pull/34932) Added onChanged property to TextFormField

  [#34932](https://github.com/flutter/flutter/pull/34932)将 onChanged 属性添加到 TextFormField

*   [#35092](https://github.com/flutter/flutter/pull/35092) Add FlutterProjectFactory so that it can be overridden internally.

  [#35092](https://github.com/flutter/flutter/pull/35092)添加 FlutterProjectFactory 以便可以在内部覆盖它。

*   [#33272](https://github.com/flutter/flutter/pull/33272) Add mustRunAfter on mergeAssets task to force task ordering

  [#33272](https://github.com/flutter/flutter/pull/33272)在 mergeAssets 任务上添加 MustRunAfter 以强制任务排序

*   [#33535](https://github.com/flutter/flutter/pull/33535) Custom height parameters for DataTable header and data rows

  [#33535](https://github.com/flutter/flutter/pull/33535)DataTable 标题和数据行的自定义高度参数

*   [#33628](https://github.com/flutter/flutter/pull/33628) DataTable Custom Horizontal Padding

  [#33628](https://github.com/flutter/flutter/pull/33628)数据表自定义水平填充



## Tooling

## 工装


Last but not least, we continue to polish and simplify our tooling as well, including providing a much clearer error message when the flutter tooling finds itself in a read-only directory (a common problem for Flutter developers that we're hoping this helps address).

最后但并非最不重要的一点是，我们还继续完善和简化我们的工具，包括当 flutter 工具发现自己位于只读目录时提供更清晰的错误消息（这是 Flutter 开发人员的常见问题，我们希望这有助于解决）。




*   [#31342](https://github.com/flutter/flutter/pull/31342) check if project exists before regenerating platform specific tooling

  [#31342](https://github.com/flutter/flutter/pull/31342)在重新生成平台特定工具之前检查项目是否存在

*   [#31399](https://github.com/flutter/flutter/pull/31399) add ignorable track-widget-creation flag to build aot

  [#31399](https://github.com/flutter/flutter/pull/31399)添加可忽略的 track-widget-creation 标志来构建 aot

*   [#31406](https://github.com/flutter/flutter/pull/31406) if there is no .ios or ios sub-project, don't attempt building for iOS

  [#31406](https://github.com/flutter/flutter/pull/31406)如果没有 .ios 或 ios 子项目，请勿尝试构建 iOS

*   [#31446](https://github.com/flutter/flutter/pull/31446) Allow filtering devices to only those supported by current project

  [#31446](https://github.com/flutter/flutter/pull/31446)允许仅过滤当前项目支持的设备

*   [#31591](https://github.com/flutter/flutter/pull/31591) make sure we exit early if the Runner.xcodeproj file is missing

  [#31591](https://github.com/flutter/flutter/pull/31591)如果 Runner.xcodeproj 文件丢失，请确保我们提前退出

*   [#31804](https://github.com/flutter/flutter/pull/31804) only build asset when there is asset declared in pubspec

  [#31804](https://github.com/flutter/flutter/pull/31804)仅当 pubspec 中声明了资产时才构建资产

*   [#31812](https://github.com/flutter/flutter/pull/31812) Fix #31764: Show appropriate error message when fonts pubspec.yaml isn't iterable

  [#31812](https://github.com/flutter/flutter/pull/31812)修复 #31764：当字体 pubspec.yaml 不可迭代时显示适当的错误消息

*   [#32072](https://github.com/flutter/flutter/pull/32072) don't NPE with empty pubspec

  [#32072](https://github.com/flutter/flutter/pull/32072)不要使用空的 pubspec 进行 NPE

*   [#33041](https://github.com/flutter/flutter/pull/33041) Rename flutter packages to flutter pub

  [#33041](https://github.com/flutter/flutter/pull/33041)将 flutter 包重命名为 flutter pub

*   [#33448](https://github.com/flutter/flutter/pull/33448) Use vswhere to find Visual Studio

  [#33448](https://github.com/flutter/flutter/pull/33448)使用 vswhere 找到 Visual Studio

*   [#33472](https://github.com/flutter/flutter/pull/33472) add daemon command to enumerate supported platforms

  [#33472](https://github.com/flutter/flutter/pull/33472)添加守护程序命令以枚举支持的平台

*   [#33924](https://github.com/flutter/flutter/pull/33924) Added –dart-flags option to flutter run

  [#33924](https://github.com/flutter/flutter/pull/33924)为 flutter run 添加了 –dart-flags 选项

*   [#33980](https://github.com/flutter/flutter/pull/33980) Increase daemon protocol version for getSupportedPlatforms

  [#33980](https://github.com/flutter/flutter/pull/33980)增加 getSupportedPlatforms 的守护程序协议版本

*   [#33990](https://github.com/flutter/flutter/pull/33990) Add device category for daemon

  [#33990](https://github.com/flutter/flutter/pull/33990)为守护进程添加设备类别

*   [#34181](https://github.com/flutter/flutter/pull/34181) Reland "Added –dart-flags option to flutter run (#33924)"

  [#34181](https://github.com/flutter/flutter/pull/34181)Reland“为 flutter run 添加了 –dart-flags 选项（#​​33924）”

*   [#34291](https://github.com/flutter/flutter/pull/34291) Check whether FLUTTER_ROOT and FLUTTER_ROOT/bin are writable.

  [#34291](https://github.com/flutter/flutter/pull/34291)检查 FLUTTER_ROOT 和 FLUTTER_ROOT/bin 是否可写。

*   [#34353](https://github.com/flutter/flutter/pull/34353) Refactor Gradle plugin

  [#34353](https://github.com/flutter/flutter/pull/34353)重构 Gradle 插件

*   [#34517](https://github.com/flutter/flutter/pull/34517) pass .packages path to snapshot invocation

  [#34517](https://github.com/flutter/flutter/pull/34517)将 .packages 路径传递给快照调用

*   [#34527](https://github.com/flutter/flutter/pull/34527) Don't crash on invalid .packages file

  [#34527](https://github.com/flutter/flutter/pull/34527)不要因无效的 .packages 文件而崩溃

*   [#34606](https://github.com/flutter/flutter/pull/34606) Remove portions of the Gradle script related to dynamic patching

  [#34606](https://github.com/flutter/flutter/pull/34606)删除 Gradle 脚本中与动态修补相关的部分

*   [#34616](https://github.com/flutter/flutter/pull/34616) Kill compiler process when test does not exit cleanly

  [#34616](https://github.com/flutter/flutter/pull/34616)当测试未完全退出时终止编译器进程

*   [#34624](https://github.com/flutter/flutter/pull/34624) Break down flutter doctor validations and results

  [#34624](https://github.com/flutter/flutter/pull/34624)分解 flutter doctor 验证和结果

*   [#34683](https://github.com/flutter/flutter/pull/34683) add read only semantics flag

  [#34683](https://github.com/flutter/flutter/pull/34683)添加只读语义标志

*   [#34684](https://github.com/flutter/flutter/pull/34684) Add more structure to errors.

  [#34684](https://github.com/flutter/flutter/pull/34684)为错误添加更多结构。

*   [#34685](https://github.com/flutter/flutter/pull/34685) Close platform when tests are complete (dispose compiler and delete font files)

  [#34685](https://github.com/flutter/flutter/pull/34685)测试完成后关闭平台（处置编译器并删除字体文件）

*   [#34725](https://github.com/flutter/flutter/pull/34725) Fix NPE in flutter tools

  [#34725](https://github.com/flutter/flutter/pull/34725)修复 flutter 工具中的 NPE

*   [#34736](https://github.com/flutter/flutter/pull/34736) Remove flags related to dynamic patching

  [#34736](https://github.com/flutter/flutter/pull/34736)删除与动态修补相关的标志

*   [#34785](https://github.com/flutter/flutter/pull/34785) Tweak the display name of emulators

  [#34785](https://github.com/flutter/flutter/pull/34785)调整模拟器的显示名称

*   [#34794](https://github.com/flutter/flutter/pull/34794) Add emulatorID field to devices in daemon

  [#34794](https://github.com/flutter/flutter/pull/34794)将 emulatorID 字段添加到守护程序中的设备

*   [#34802](https://github.com/flutter/flutter/pull/34802) Prefer ephemeral devices from command line run

  [#34802](https://github.com/flutter/flutter/pull/34802)首选通过命令行运行的临时设备

*   [#34859](https://github.com/flutter/flutter/pull/34859) Fix Vertical Alignment Regression

  [#34859](https://github.com/flutter/flutter/pull/34859)修复垂直对齐回归

*   [#35074](https://github.com/flutter/flutter/pull/35074) Attempt to enable tool coverage redux

  [#35074](https://github.com/flutter/flutter/pull/35074)尝试启用工具覆盖率还原

*   [#35084](https://github.com/flutter/flutter/pull/35084) Move findTargetDevices to DeviceManager

  [#35084](https://github.com/flutter/flutter/pull/35084)将 findTargetDevices 移至 DeviceManager

*   [#33284](https://github.com/flutter/flutter/pull/33284) make sure we build test targets too

  [#33284](https://github.com/flutter/flutter/pull/33284)确保我们也构建测试目标

*   [#33867](https://github.com/flutter/flutter/pull/33867) Remove environment variable guards for command line desktop and web

  [#33867](https://github.com/flutter/flutter/pull/33867)删除命令行桌面和 Web 的环境变量保护

*   [#33283](https://github.com/flutter/flutter/pull/33283) Fix relative paths and snapshot logic in tool

  [#33283](https://github.com/flutter/flutter/pull/33283)修复工具中的相对路径和快照逻辑



## Full Issue List

## 完整问题列表


You can see the full list of issues addressed in this release [here](/release/release-notes/changelogs/changelog-1.7.8).

你可以查看此版本中解决的 issue 的完整列表[here](/release/release-notes/changelogs/changelog-1.7.8).

