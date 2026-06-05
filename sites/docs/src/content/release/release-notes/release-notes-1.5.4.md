---
# title: Flutter 1.5.4 release notes
title: Flutter 1.5.4 发行说明
# shortTitle: 1.5.4 release notes
shortTitle: 1.5.4 发行说明
# description: Release notes for Flutter 1.5.4.
description: Flutter 1.5.4 的发行说明。
skipTemplateRendering: true
ai-translated: true
---

In addition to continuing to focus on quality and stability since the 1.2 release, the Flutter 1.5.4 stable release adds a set of new features as we approach the Google I/O conference. Further, [Apple has a deadline for building against the 12.1 version of their iOS SDK](https://developer.apple.com/news/?id=03202019a), which we now do in this update. You can meet Apple's requirements simply by pulling down the 1.5.4 stable release, building and updating your Flutter app in the Apple Store.

除了自 1.2 版本以来继续关注质量和稳定性之外，随着 Google I/O 大会的临近，Flutter 1.5.4 稳定版本还添加了一组新功能。更远，[Apple has a deadline for building against the 12.1 version of their iOS SDK](https://developer.apple.com/news/?id=03202019a)，我们现在在此更新中执行此操作。你只需下载 1.5.4 稳定版本，在 Apple Store 中构建和更新你的 Flutter 应用程序即可满足 Apple 的要求。


Also, this build sees fixes for the two regressions we saw in Flutter 1.2:

此外，此版本修复了我们在 Flutter 1.2 中看到的两个回归：


* [#28640](https://github.com/flutter/flutter/issues/28640) NoSuchMethodError: **android.view.MotionEvent.isFromSource was closed and fixed in all versions after 1.3.7

  [#28640](https://github.com/flutter/flutter/issues/28640)NoSuchMethodError: **android.view.MotionEvent.isFromSource 在 1.3.7 之后的所有版本中已关闭并修复

* [#28484](https://github.com/flutter/flutter/issues/28484) Widget rendering strange since Flutter update:** a change was made fixes this regression in 1.4.0

  [#28484](https://github.com/flutter/flutter/issues/28484)自 Flutter 更新以来 Widget 呈现奇怪：** 进行了更改修复了 1.4.0 中的此回归


Finally, for details about other fixes and new features, read on.

最后，有关其他修复和新功能的详细信息，请继续阅读。



## Breaking Changes

## 重大变化


Our recent survey showed that Flutter developers prefer a breaking change if it means that it improves the API and behavior of Flutter. Of course, we still make breaking changes sparingly. The following are the list of breaking changes in this release along with links to a full description of each change and how to handle it in your Flutter code.

我们最近的调查显示，Flutter 开发人员更喜欢重大更改，如果这意味着它可以改进 Flutter 的 API 和行为。当然，我们仍然会谨慎地做出重大改变。以下是此版本中的重大更改列表，以及每个更改的完整描述以及如何在 Flutter 代码中处理它的链接。




*   [flutter#26261](https://github.com/flutter/flutter/issues/26261): CupertinoTextField's cursorColor default now matches the app's theme ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/uJFi5sENr1g))

  [flutter#26261](https://github.com/flutter/flutter/issues/26261)：CupertinoTextField 的光标颜色默认值现在与应用程序的主题匹配（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/uJFi5sENr1g))

*   [flutter#26026](https://github.com/flutter/flutter/issues/26261): Need to manually trigger selection toolbars when using raw EditableText ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/uJFi5sENr1g))

  [flutter#26026](https://github.com/flutter/flutter/issues/26261)：使用 raw EditableText 时需要手动触发选择工具栏（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/uJFi5sENr1g))

*   [flutter#23148](https://github.com/flutter/flutter/issues/26261): Proposing a fix to unify Android and iOS response in the Firebase Messagng Plugin ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/v4dt7Zc-NGg))

  [flutter#23148](https://github.com/flutter/flutter/issues/26261)：提出修复方案以统一 Firebase Messagng 插件中的 Android 和 iOS 响应（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/v4dt7Zc-NGg))

*   [flutter#28014](https://github.com/flutter/flutter/issues/26261): Converting PointerEvent to Diagnosticable ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/ZPPRKV642Uk))

  [flutter#28014](https://github.com/flutter/flutter/issues/26261)：将 PointerEvent 转换为可诊断 ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/ZPPRKV642Uk))

*   [flutter#20183](https://github.com/flutter/flutter/issues/26261): CupertinoTextField: Merge provided TextStyle with Theme's TextStyle ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/3OV8J3GhO6U))

  [flutter#20183](https://github.com/flutter/flutter/issues/26261): CupertinoTextField: 将提供的 TextStyle 与主题的 TextStyle 合并 ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/3OV8J3GhO6U))

*   [flutter#20693](https://github.com/flutter/flutter/issues/26261): LongPressGestureRecognizer moving after long press no longer discards up event ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/kWT0J8Ii5Rw))

  [flutter#20693](https://github.com/flutter/flutter/issues/26261)：LongPressGestureRecognizer 长按后移动不再丢弃向上事件（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/kWT0J8Ii5Rw))

*   [flutter#20693](https://github.com/flutter/flutter/issues/26261): The GestureRecognizerState enum has a new 'accepted' value ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/YXNZ4OFL8Uo))

  [flutter#20693](https://github.com/flutter/flutter/issues/26261)：GestureRecognizerState 枚举有一个新的“接受”值（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/YXNZ4OFL8Uo))

*   [flutter#18314](https://github.com/flutter/flutter/issues/26261), [flutter#22830](https://github.com/flutter/flutter/issues/26261), [flutter#23424](https://github.com/flutter/flutter/issues/26261): Drag moveBy calls are broken in two and the default DragStartBehavior in all widgets with drag recognizers is changed to DragStartBehavior.start ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/iTZt49dP_pU))

  [flutter#18314](https://github.com/flutter/flutter/issues/26261),[flutter#22830](https://github.com/flutter/flutter/issues/26261),[flutter#23424](https://github.com/flutter/flutter/issues/26261)：拖动 moveBy 调用被分成两部分，所有带有拖动识别器的 widgets 中的默认 DragStartBehavior 更改为 DragStartBehavior.start ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/iTZt49dP_pU))

*   [flutter#27891](https://github.com/flutter/flutter/issues/26261): Composite layers for physical shapes on all platforms ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/8bAn-BPQPE8))

  [flutter#27891](https://github.com/flutter/flutter/issues/26261)：所有平台上物理形状的复合层（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/8bAn-BPQPE8))

*   [flutter#19418](https://github.com/flutter/flutter/issues/26261): Adding onPlatformViewCreated to AndroidViewController ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/LoAfcK5IJ9A))

  [flutter#19418](https://github.com/flutter/flutter/issues/26261): 将 onPlatformViewCreated 添加到 AndroidViewController ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/LoAfcK5IJ9A))

*   [flutter#29070](https://github.com/flutter/flutter/issues/26261): BackdropFilter will fill its parent/ancestor clip ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/AC4NDVh1h5k))

  [flutter#29070](https://github.com/flutter/flutter/issues/26261)：BackdropFilter 将填充其父/祖先剪辑（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/AC4NDVh1h5k))

*   [flutter#29816](https://github.com/flutter/flutter/issues/26261): FontWeight.lerp to return null if args are null ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/0uS_Hzq894I))

  [flutter#29816](https://github.com/flutter/flutter/issues/26261): FontWeight.lerp 如果 args 为 null ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/0uS_Hzq894I))

*   [flutter#29696](https://github.com/flutter/flutter/issues/26261): Proposal to rename PointerEnterEvent and PointerExitEvent fromHoverEvent to fromMouseEvent ([Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/ECoJc9LOs2M))

  [flutter#29696](https://github.com/flutter/flutter/issues/26261)：建议将 PointerEnterEvent 和 PointerExitEvent 从 HoverEvent 重命名为 fromMouseEvent（[Announcement & Mitigation](https://groups.google.com/forum/#!topic/flutter-announce/ECoJc9LOs2M))

*   [flutter#28602](https://github.com/flutter/flutter/pull/28602): Allow PointerEnterEvent and PointerExitEvents to be created from any PointerEvent

  [flutter#28602](https://github.com/flutter/flutter/pull/28602)：允许从任何 PointerEvent 创建 PointerEnterEvent 和 PointerExitEvents

*   [flutter#28953](https://github.com/flutter/flutter/pull/28953): Include platformViewId in semantics tree

  [flutter#28953](https://github.com/flutter/flutter/pull/28953): 在语义树中包含 platformViewId

*   [flutter#27612](https://github.com/flutter/flutter/pull/27612): Force line height in TextFields with strut

  [flutter#27612](https://github.com/flutter/flutter/pull/27612)：使用支柱强制行高度为 TextFields

*   [flutter#30991](https://github.com/flutter/flutter/pull/30991): Use full height of the glyph for caret height on Android

  [flutter#30991](https://github.com/flutter/flutter/pull/30991)：使用字形的完整高度作为 Android 上的插入符高度

*   [flutter#30414](https://github.com/flutter/flutter/pull/30414): Remove pressure customization from some pointer events

  [flutter#30414](https://github.com/flutter/flutter/pull/30414)：从一些指针事件中删除压力自定义

*   [engine#8274](https://github.com/flutter/engine/pull/8274): [ui] Add null check in FontWeight.lerp

  [engine#8274](https://github.com/flutter/engine/pull/8274): [ui] 在 FontWeight.lerp 中添加 null 检查



## Severe Performance and Crash Changes

## 严重的性能和崩溃变化


In this release, we fixed several severe performance and crash issues.

在此版本中，我们修复了几个严重的性能和崩溃 issues。




*   [flutter#30990](https://github.com/flutter/flutter/pull/30990): Allow profile widget builds in profile mode

  [flutter#30990](https://github.com/flutter/flutter/pull/30990)：允许配置文件 widget 在配置文件模式下构建

*   [flutter#30985](https://github.com/flutter/flutter/pull/30985): Add rrect contains microbenchmark

  [flutter#30985](https://github.com/flutter/flutter/pull/30985): 添加 rrect 包含 microbenchmark

*   [flutter#28651](https://github.com/flutter/flutter/pull/28651): Cannot execute operation because FlutterJNI is not attached to native.

  [flutter#28651](https://github.com/flutter/flutter/pull/28651)：无法执行操作，因为 FlutterJNI 未附加到本机。



## iOS Changes

## iOS 更改


Supporting iOS is just as important to the Flutter team as support Android, which you can see in the huge volume of changes we've made in this release to make the iOS experience even better.

支持 iOS 对于 Flutter 团队来说与支持 Android 一样重要，你可以从我们在此版本中所做的大量更改中看到这一点，以使 iOS 体验更好。




*   [flutter#29200](https://github.com/flutter/flutter/pull/29200): Cupertino localization step 1: add an English arb file

  [flutter#29200](https://github.com/flutter/flutter/pull/29200)：Cupertino 本地化步骤 1：添加英文 arb 文件

*   [flutter#29821](https://github.com/flutter/flutter/pull/29821): Cupertino localization step 1.5: fix a resource mismatch in cupertino_en.arb

  [flutter#29821](https://github.com/flutter/flutter/pull/29821)：Cupertino 本地化步骤 1.5：修复 cupertino_en.arb 中的资源不匹配问题

*   [flutter#30160](https://github.com/flutter/flutter/pull/30160): Cupertino localization 1.9: add needed singular resource for cupertino_en.arb

  [flutter#30160](https://github.com/flutter/flutter/pull/30160)：Cupertino 本地化 1.9：为 cupertino_en.arb 添加所需的单一资源

*   [flutter#29644](https://github.com/flutter/flutter/pull/29644): Cupertino localization step 3: in-place move some material tools around to make room for cupertino

  [flutter#29644](https://github.com/flutter/flutter/pull/29644)：Cupertino 本地化步骤 3：就地移动一些材质工具，为库比蒂诺腾出空间

*   [flutter#29650](https://github.com/flutter/flutter/pull/29650): Cupertino localization step 4: let generated date localization combine material and cupertino locales

  [flutter#29650](https://github.com/flutter/flutter/pull/29650)：Cupertino 本地化步骤 4：让生成的日期本地化结合材料和库比蒂诺语言环境

*   [flutter#29708](https://github.com/flutter/flutter/pull/29708) Cupertino localization step 5: add french arb as translated example

  [flutter#29708](https://github.com/flutter/flutter/pull/29708)Cupertino 本地化步骤 5：添加法语 arb 作为翻译示例

*   [flutter#29767](https://github.com/flutter/flutter/pull/29767): Cupertino localization step 6: add a GlobalCupertinoLocalizations base class with date time formatting

  [flutter#29767](https://github.com/flutter/flutter/pull/29767): Cupertino 本地化步骤 6：添加具有日期时间格式的 GlobalCupertinoLocalizations 基类

*   [flutter#30527](https://github.com/flutter/flutter/pull/30527): Cupertino localization step 11: add more translation clarifications in the instructions

  [flutter#30527](https://github.com/flutter/flutter/pull/30527): Cupertino 本地化第 11 步：在说明中添加更多翻译说明

*   [flutter#28629](https://github.com/flutter/flutter/pull/28629): Make sure everything in the Cupertino page transition can be linear when back swiping

  [flutter#28629](https://github.com/flutter/flutter/pull/28629)：确保向后滑动时 Cupertino 页面过渡中的所有内容都可以是线性的

*   [flutter#28001](https://github.com/flutter/flutter/pull/28001): CupertinoTextField: added ability to change placeholder color

  [flutter#28001](https://github.com/flutter/flutter/pull/28001)：CupertinoTextField：添加了更改占位符颜色的功能

*   [flutter#29304](https://github.com/flutter/flutter/pull/29304): Include platformViewId in semantics tree for iOS

  [flutter#29304](https://github.com/flutter/flutter/pull/29304)：在 iOS 的语义树中包含 platformViewId

*   [flutter#29946](https://github.com/flutter/flutter/pull/29946): Let CupertinoPageScaffold have tap status bar to scroll to top

  [flutter#29946](https://github.com/flutter/flutter/pull/29946)：让 CupertinoPageScaffold 有点击状态栏滚动到顶部

*   [flutter#29474](https://github.com/flutter/flutter/pull/29474): Let CupertinoTextField's clear button also call onChanged

  [flutter#29474](https://github.com/flutter/flutter/pull/29474): 让 CupertinoTextField 的清除按钮也调用 onChanged

*   [flutter#29008](https://github.com/flutter/flutter/pull/29008): Update CupertinoTextField

  [flutter#29008](https://github.com/flutter/flutter/pull/29008)：更新 CupertinoTextField

*   [flutter#29630](https://github.com/flutter/flutter/pull/29630): Add heart shapes to CupertinoIcons

  [flutter#29630](https://github.com/flutter/flutter/pull/29630)：将心形添加到 CupertinoIcons

*   [flutter#28597](https://github.com/flutter/flutter/pull/28597): Adjust remaining Cupertino route animations to match native

  [flutter#28597](https://github.com/flutter/flutter/pull/28597)：调整剩余的 Cupertino 路线动画以匹配原生

*   [flutter#29407](https://github.com/flutter/flutter/pull/29407): [cupertino_icons] Add circle and circle_filled, for radio buttons.

  [flutter#29407](https://github.com/flutter/flutter/pull/29407)：[cupertino_icons] 添加圆形和圆形填充，用于单选按钮。

*   [flutter#29024](https://github.com/flutter/flutter/pull/29024): Fix CupertinoTabView tree re-shape on view inset change

  [flutter#29024](https://github.com/flutter/flutter/pull/29024)：修复 CupertinoTabView 树在视图插入更改时重新形状

*   [flutter#28478](https://github.com/flutter/flutter/pull/28478): Support iOS devices reporting pressure data of 0

  [flutter#28478](https://github.com/flutter/flutter/pull/28478)：支持 iOS 设备上报压力数据为 0

*   [flutter#29987](https://github.com/flutter/flutter/pull/29987): update CupertinoSwitch documentation

  [flutter#29987](https://github.com/flutter/flutter/pull/29987)：更新 CupertinoSwitch 文档

*   [flutter#29943](https://github.com/flutter/flutter/pull/29943): Remove unwanted gap between navigation bar and safe area's child

  [flutter#29943](https://github.com/flutter/flutter/pull/29943)：删除导航栏和安全区域子项之间不需要的间隙

*   [flutter#28855](https://github.com/flutter/flutter/pull/28855): Move material iOS back swipe test to material

  [flutter#28855](https://github.com/flutter/flutter/pull/28855)：将材质 iOS 向后滑动测试移动到材质上

*   [flutter#28756](https://github.com/flutter/flutter/pull/28756): Handle Cupertino back gesture interrupted by Navigator push

  [flutter#28756](https://github.com/flutter/flutter/pull/28756)：处理 Cupertino 后退手势被导航器推送中断

*   [flutter#31088](https://github.com/flutter/flutter/pull/31088): Text field scroll physics

  [flutter#31088](https://github.com/flutter/flutter/pull/31088)：文本字段滚动物理

*   [flutter#30946](https://github.com/flutter/flutter/pull/30946): Add some more cupertino icons

  [flutter#30946](https://github.com/flutter/flutter/pull/30946)：添加更多库比蒂诺图标

*   [flutter#30521](https://github.com/flutter/flutter/pull/30521): Provide a default IconTheme in CupertinoTheme

  [flutter#30521](https://github.com/flutter/flutter/pull/30521): 在 CupertinoTheme 中提供一个默认的 IconTheme

*   [flutter#30475](https://github.com/flutter/flutter/pull/30475): Trackpad mode crash fix

  [flutter#30475](https://github.com/flutter/flutter/pull/30475)：修复触控板模式崩溃问题



## Material Changes

## 重大变化


Of course, Material continues to be a priority for the Flutter team as well.

当然，材质仍然是 Flutter 团队的首要任务。




*   [flutter#28290](https://github.com/flutter/flutter/pull/28290): [Material] Create a FloatingActionButton ThemeData and honor it within the FloatingActionButton ([#28735](https://github.com/flutter/flutter/pull/28735))

  [flutter#28290](https://github.com/flutter/flutter/pull/28290)：[材料] 创建一个 FloatingActionButton ThemeData 并在 FloatingActionButton 中使用它（[#28735](https://github.com/flutter/flutter/pull/28735))

*   [flutter#29980](https://github.com/flutter/flutter/pull/29980): Fix issue with account drawer header arrow rotating when setState is called

  [flutter#29980](https://github.com/flutter/flutter/pull/29980)：修复 issue 在调用 setState 时帐户抽屉标题箭头旋转的问题

*   [flutter#29563](https://github.com/flutter/flutter/pull/29563): Avoid flickering while dragging to select text

  [flutter#29563](https://github.com/flutter/flutter/pull/29563)：拖动选择文本时避免闪烁

*   [flutter#29138](https://github.com/flutter/flutter/pull/29138): Update DropdownButton underline to be customizable

  [flutter#29138](https://github.com/flutter/flutter/pull/29138)：更新 DropdownButton 下划线以可自定义

*   [flutter#29572](https://github.com/flutter/flutter/pull/29572): DropdownButton Icon customizability

  [flutter#29572](https://github.com/flutter/flutter/pull/29572)：DropdownButton 图标可定制性

*   [flutter#29183](https://github.com/flutter/flutter/pull/29183): Implement labelPadding configuration in TabBarTheme

  [flutter#29183](https://github.com/flutter/flutter/pull/29183): 在 TabBarTheme 中实现 labelPadding 配置

*   [flutter#21834](https://github.com/flutter/flutter/pull/21834): Add shapeBorder option on App Bar

  [flutter#21834](https://github.com/flutter/flutter/pull/21834): 在应用栏上添加 shapeBorder 选项

*   [flutter#28163](https://github.com/flutter/flutter/pull/28163): [Material] Add ability to set shadow color and selected shadow color for chips and for chip themes

  [flutter#28163](https://github.com/flutter/flutter/pull/28163)：[材质]添加为芯片和芯片主题设置阴影颜色和选定阴影颜色的功能

*   [flutter#27711](https://github.com/flutter/flutter/pull/27711): Make extended FAB's icon optional

  [flutter#27711](https://github.com/flutter/flutter/pull/27711): 使扩展 FAB 的图标可选

*   [flutter#28159](https://github.com/flutter/flutter/pull/28159): [Material] Expand BottomNavigationBar API (reprise)

  [flutter#28159](https://github.com/flutter/flutter/pull/28159): [素材] 展开 BottomNavigationBar API（重演）

*   [flutter#27973](https://github.com/flutter/flutter/pull/27973): Add extendBody parameter to Scaffold, body MediaQuery reflects BAB height

  [flutter#27973](https://github.com/flutter/flutter/pull/27973): Scaffold 中添加 extendBody 参数，body MediaQuery 反映 BAB 高度

*   [flutter#30390](https://github.com/flutter/flutter/pull/30390): [Material] Update slider and slider theme with new sizes, shapes, and color mappings

  [flutter#30390](https://github.com/flutter/flutter/pull/30390)：[材质]使用新的尺寸、形状和颜色映射更新滑块和滑块主题

*   [flutter#29390](https://github.com/flutter/flutter/pull/29390): Make expansion panel optionally toggle its state by tapping its header.

  [flutter#29390](https://github.com/flutter/flutter/pull/29390)：使扩展面板可以通过点击其标题来切换其状态。

*   [flutter#30754](https://github.com/flutter/flutter/pull/30754): [Material] Fix showDialog crasher caused by old contexts

  [flutter#30754](https://github.com/flutter/flutter/pull/30754): [Material] 修复旧上下文导致的 showDialog 崩溃问题

*   [flutter#30525](https://github.com/flutter/flutter/pull/30525): Fix cursor outside of input width

  [flutter#30525](https://github.com/flutter/flutter/pull/30525)：修复光标超出输入宽度的问题

*   [flutter#30805](https://github.com/flutter/flutter/pull/30805): Update ExpansionPanelList Samples with Scaffold Template

  [flutter#30805](https://github.com/flutter/flutter/pull/30805)：使用脚手架模板更新 ExpansionPanelList 示例

*   [flutter#30537](https://github.com/flutter/flutter/pull/30537): Embedded images and added variations to ListTile sample code

  [flutter#30537](https://github.com/flutter/flutter/pull/30537)：嵌入图像并添加了 ListTile 示例代码的变体

*   [flutter#30455](https://github.com/flutter/flutter/pull/30455): Prevent vertical scroll in shrine by ensuring card size fits the screen

  [flutter#30455](https://github.com/flutter/flutter/pull/30455)：通过确保卡片尺寸适合屏幕来防止神社中的垂直滚动

*   [flutter#29413](https://github.com/flutter/flutter/pull/29413): Fix MaterialApp's _navigatorObserver when only builder used

  [flutter#29413](https://github.com/flutter/flutter/pull/29413): 修复仅使用构建器时 MaterialApp 的 _navigatorObserver



## Desktop Changes

## 桌面变化


Flutter has been making progress on expanding support for desktop-class input mechanisms with keyboard mappings, text selection, mouse wheels and hover along with the beginnings of desktop support in our tooling.

Flutter 在扩展对桌面级输入机制的支持方面取得了进展，包括键盘映射、文本选择、鼠标滚轮和悬停以及我们工具中桌面支持的开始。




*   [flutter#29993](https://github.com/flutter/flutter/pull/29993): Adds the keyboard mapping for Linux

  [flutter#29993](https://github.com/flutter/flutter/pull/29993)：添加 Linux 的键盘映射

*   [flutter#29769](https://github.com/flutter/flutter/pull/29769): Add support for text selection via mouse to Cupertino text fields

  [flutter#29769](https://github.com/flutter/flutter/pull/29769): 添加对通过鼠标选择文本的支持到 Cupertino 文本字段

*   [flutter#22762](https://github.com/flutter/flutter/pull/22762): Add support for scrollwheels

  [flutter#22762](https://github.com/flutter/flutter/pull/22762): 添加对滚轮的支持

*   [flutter#28900](https://github.com/flutter/flutter/pull/28900): Add key support to cupertino button

  [flutter#28900](https://github.com/flutter/flutter/pull/28900)：为 Cupertino 按钮添加按键支持

*   [flutter#28290](https://github.com/flutter/flutter/pull/28290): Text selection via mouse

  [flutter#28290](https://github.com/flutter/flutter/pull/28290)：通过鼠标选择文本

*   [flutter#28602](https://github.com/flutter/flutter/pull/28602): Allow PointerEnterEvent and PointerExitEvents to be created from any PointerEvent

  [flutter#28602](https://github.com/flutter/flutter/pull/28602)：允许从任何 PointerEvent 创建 PointerEnterEvent 和 PointerExitEvents

*   [flutter#30829](https://github.com/flutter/flutter/pull/30829): Keep hover annotation layers in sync with the mouse detector.

  [flutter#30829](https://github.com/flutter/flutter/pull/30829)：保持悬停注释图层与鼠标检测器同步。

*   [flutter#30648](https://github.com/flutter/flutter/pull/30648): Allow downloading of desktop embedding artifacts

  [flutter#30648](https://github.com/flutter/flutter/pull/30648)：允许下载桌面嵌入工件

*   [flutter#31283](https://github.com/flutter/flutter/pull/31283): Add desktop workflows to doctor

  [flutter#31283](https://github.com/flutter/flutter/pull/31283)：为医生添加桌面工作流程

*   [flutter#31229](https://github.com/flutter/flutter/pull/31229): Add flutter run support for linux and windows

  [flutter#31229](https://github.com/flutter/flutter/pull/31229): 添加对 linux 和 windows 的 flutter 运行支持

*   [flutter#31277](https://github.com/flutter/flutter/pull/31277): pass track widget creation flag through to build script

  [flutter#31277](https://github.com/flutter/flutter/pull/31277)：传递轨道 widget 创建标志到构建脚本

*   [flutter#31218](https://github.com/flutter/flutter/pull/31218): Add run capability for macOS target

  [flutter#31218](https://github.com/flutter/flutter/pull/31218): 为 macOS 目标添加运行能力

*   [flutter#31205](https://github.com/flutter/flutter/pull/31205): Add desktop projects and build commands (experimental)

  [flutter#31205](https://github.com/flutter/flutter/pull/31205)：添加桌面项目和构建命令（实验性）

*   [flutter#30670](https://github.com/flutter/flutter/issues/30670): Implement StandardMethodCodec for C++ shells

  [flutter#30670](https://github.com/flutter/flutter/issues/30670)：为 C++ shell 实现 StandardMethodCodec



## Framework Changes

## 框架变化


In addition to platform specifics, we continue to push on the core of the Flutter framework.

除了平台细节之外，我们还继续推动 Flutter 框架的核心。




*   [engine#8402](https://github.com/flutter/engine/pull/8402): Enable shutting down all root isolates in a VM.

  [engine#8402](https://github.com/flutter/engine/pull/8402)：启用关闭虚拟机中的所有根隔离。

*   [flutter#31210](https://github.com/flutter/flutter/pull/31210): Use full height of the glyph for caret height on Android v2

  [flutter#31210](https://github.com/flutter/flutter/pull/31210)：在 Android v2 上使用字形的完整高度作为插入符高度

*   [flutter#30422](https://github.com/flutter/flutter/pull/30422): Commit a navigator.pop as soon as the back swipe is lifted

  [flutter#30422](https://github.com/flutter/flutter/pull/30422)：一旦向后滑动就提交 navigator.pop

*   [flutter#30792](https://github.com/flutter/flutter/pull/30792): Rename Border.uniform() -> Border.fromSide()

  [flutter#30792](https://github.com/flutter/flutter/pull/30792): 重命名 Border.uniform() -> Border.fromSide()

*   [flutter#31159](https://github.com/flutter/flutter/pull/31159): Revert "Use full height of the glyph for caret height on Android"

  [flutter#31159](https://github.com/flutter/flutter/pull/31159)：恢复“在 Android 上使用字形的完整高度作为插入符高度”

*   [flutter#30932](https://github.com/flutter/flutter/pull/30932): 2d transforms UX improvements

  [flutter#30932](https://github.com/flutter/flutter/pull/30932)：2d 转变 UX 改进

*   [flutter#30898](https://github.com/flutter/flutter/pull/30898): Check that ErrorWidget.builder is not modified after test

  [flutter#30898](https://github.com/flutter/flutter/pull/30898)：检查测试后 ErrorWidget.builder 没有被修改

*   [flutter#30809](https://github.com/flutter/flutter/pull/30809): Fix issue 23527: Exception: RenderViewport exceeded its maximum numb…

  [flutter#30809](https://github.com/flutter/flutter/pull/30809)：修复 issue 23527：异常：RenderViewport 超出其最大麻木...

*   [flutter#30880](https://github.com/flutter/flutter/pull/30880): Let sliver.dart _createErrorWidget work with other Widgets

  [flutter#30880](https://github.com/flutter/flutter/pull/30880)：让 sliver.dart _createErrorWidget 与其他 Widget 一起工作

*   [flutter#30876](https://github.com/flutter/flutter/pull/30876): Simplify toImage future handling

  [flutter#30876](https://github.com/flutter/flutter/pull/30876)：简化 toImage 未来处理

*   [flutter#30470](https://github.com/flutter/flutter/pull/30470): Fixed Table flex column layout error #30437

  [flutter#30470](https://github.com/flutter/flutter/pull/30470): 修复了 Table flex 列布局错误 #30437

*   [flutter#30215](https://github.com/flutter/flutter/pull/30215): Check for invalid elevations

  [flutter#30215](https://github.com/flutter/flutter/pull/30215)：检查无效标高

*   [flutter#30667](https://github.com/flutter/flutter/pull/30667): Fix additional @mustCallSuper indirect overrides and mixins

  [flutter#30667](https://github.com/flutter/flutter/pull/30667)：修复额外的 @mustCallSuper 间接覆盖和混合

*   [flutter#30814](https://github.com/flutter/flutter/pull/30814): Fix StatefulWidget and StatelessWidget Sample Documentation

  [flutter#30814](https://github.com/flutter/flutter/pull/30814)：修复 StatefulWidget 和 StatelessWidget 示例文档

*   [flutter#30760](https://github.com/flutter/flutter/pull/30760): fix cast NPE in invokeListMethod and invokeMapMethod

  [flutter#30760](https://github.com/flutter/flutter/pull/30760)：修复 invokeListMethod 和 invokeMapMethod 中的强制转换 NPE

*   [flutter#30640](https://github.com/flutter/flutter/pull/30640): Add const Border.uniformSide()

  [flutter#30640](https://github.com/flutter/flutter/pull/30640): 添加 const Border.uniformSide()

*   [flutter#30644](https://github.com/flutter/flutter/pull/30644): Make FormField._validate() return void

  [flutter#30644](https://github.com/flutter/flutter/pull/30644)：使 FormField._validate() 返回 void

*   [flutter#30645](https://github.com/flutter/flutter/pull/30645): Add docs to FormFieldValidator

  [flutter#30645](https://github.com/flutter/flutter/pull/30645): 将文档添加到 FormFieldValidator

*   [flutter#30563](https://github.com/flutter/flutter/pull/30563): Fixed a typo in the Expanded API doc

  [flutter#30563](https://github.com/flutter/flutter/pull/30563)：修复了扩展 API 文档中的拼写错误

*   [flutter#30513](https://github.com/flutter/flutter/pull/30513): Fix issue 21640: Assertion Error : '_listenerAttached': is not true

  [flutter#30513](https://github.com/flutter/flutter/pull/30513)：修复 issue 21640：断言错误：'_listenerAttached'：不是 true

*   [flutter#30305](https://github.com/flutter/flutter/pull/30305): shorter nullable list duplications

  [flutter#30305](https://github.com/flutter/flutter/pull/30305)：更短的可空列表重复项

*   [flutter#30468](https://github.com/flutter/flutter/pull/30468): Embedding diagram for BottomNavigationBar.

  [flutter#30468](https://github.com/flutter/flutter/pull/30468)：BottomNavigationBar 的嵌入图。



## Plugin Changes

## 插件变更


In this release, we also have a number of changes in the Flutter plugins, including camera, Google Maps, the Web View, the image picker, the Firebase plugins and, now for use in your apps, [the In-App Purchase plugin beta](https://pub.dartlang.org/packages/in_app_purchase).

在此版本中，我们还在 Flutter 插件中进行了许多更改，包括相机、Google 地图、Web 视图、图像选择器、Firebase 插件，现在可在你的应用程序中使用，[the In-App Purchase plugin beta](https://pub.dartlang.org/packages/in_app_purchase).




*   [plugins#1477](https://github.com/flutter/plugins/pull/1477): [camera] Remove activity lifecycle

  [plugins#1477](https://github.com/flutter/plugins/pull/1477): [camera] 删除 Activity 生命周期

*   [plugins#1022](https://github.com/flutter/plugins/pull/1022): [camera] Add serial dispatch_queue for camera plugin to avoid blocking the UI

  [plugins#1022](https://github.com/flutter/plugins/pull/1022): [camera] 为相机插件添加串行 dispatch_queue 以避免阻塞 UI

*   [plugins#1331](https://github.com/flutter/plugins/pull/1331): [connectivity] Enable fetching current Wi-Fi network's BSSID

  [plugins#1331](https://github.com/flutter/plugins/pull/1331): [连接] 启用获取当前 Wi-Fi 网络的 BSSID

*   [plugins#1455](https://github.com/flutter/plugins/pull/1455): [connectivity]Added integration test.

  [plugins#1455](https://github.com/flutter/plugins/pull/1455)：[连接]添加集成测试。

*   [plugins#1377](https://github.com/flutter/plugins/pull/1377): [firebase_admob] Update documentation to add iOS Admob ID & add iOS Admob ID in example project

  [plugins#1377](https://github.com/flutter/plugins/pull/1377)：[firebase_admob] 更新文档以在示例项目中添加 iOS Admob ID 并添加 iOS Admob ID

*   [plugins#1492](https://github.com/flutter/plugins/pull/1492): [firebase_analytics] Initial integration test

  [plugins#1492](https://github.com/flutter/plugins/pull/1492)：[firebase_analytics]初始集成测试

*   [plugins#896](https://github.com/flutter/plugins/pull/896): [firebase-analytics] Enable setAnalyticsCollectionEnabled support for iOS

  [plugins#896](https://github.com/flutter/plugins/pull/896): [firebase-analytics] 启用对 iOS 的 setAnalyticsCollectionEnabled 支持

*   [plugins#1159](https://github.com/flutter/plugins/pull/1159): [firebase_auth] Enable passwordless sign in

  [plugins#1159](https://github.com/flutter/plugins/pull/1159): [firebase_auth] 启用无密码登录

*   [plugins#1487](https://github.com/flutter/plugins/pull/1487): [firebase_auth] Migrate FlutterAuthPlugin from deprecated APIs

  [plugins#1487](https://github.com/flutter/plugins/pull/1487): [firebase_auth] 从已弃用的 API 迁移 FlutterAuthPlugin

*   [plugins#1443](https://github.com/flutter/plugins/pull/1443): [firebase_core] Use Gradle BoM with firebase_core

  [plugins#1443](https://github.com/flutter/plugins/pull/1443): [firebase_core] 将 Gradle BoM 与 firebase_core 结合使用

*   [plugins#1427](https://github.com/flutter/plugins/pull/1427): [firebase_crashlytics] Do not break debug log formatting.

  [plugins#1427](https://github.com/flutter/plugins/pull/1427)：[firebase_crashlytics] 不要破坏调试日志格式。

*   [plugins#1437](https://github.com/flutter/plugins/pull/1437): [firebase_crashlytics] Fix to Initialize Fabric

  [plugins#1437](https://github.com/flutter/plugins/pull/1437): [firebase_crashlytics] 修复初始化 Fabric

*   [plugins#1096](https://github.com/flutter/plugins/pull/1096) :[firebase_database]Return error message from DatabaseError#toString()

  [plugins#1096](https://github.com/flutter/plugins/pull/1096):[firebase_database]从 DatabaseError#toString()返回错误消息

*   [plugins#1532](https://github.com/flutter/plugins/pull/1532): [firebase_messaging] remove obsolete docs instruction

  [plugins#1532](https://github.com/flutter/plugins/pull/1532): [firebase_messaging] 删除过时的文档指令

*   [plugins#1405](https://github.com/flutter/plugins/pull/1405): [firebase_messaging] Additional step for iOS

  [plugins#1405](https://github.com/flutter/plugins/pull/1405)：[firebase_messaging] iOS 的附加步骤

*   [plugins#1353](https://github.com/flutter/plugins/pull/1353): [firebase_messaging] Update example

  [plugins#1353](https://github.com/flutter/plugins/pull/1353): [firebase_messaging] 更新示例

*   [plugins#1223](https://github.com/flutter/plugins/pull/1223): [firebase_ml_vision] Fix crash when scanning URL QR-code on iOS

  [plugins#1223](https://github.com/flutter/plugins/pull/1223): [firebase_ml_vision] 修复在 iOS 上扫描 URL 二维码时崩溃的问题

*   [plugins#1514](https://github.com/flutter/plugins/pull/1514): [firebase_remote_config] Initial integration tests

  [plugins#1514](https://github.com/flutter/plugins/pull/1514)：[firebase_remote_config]初始集成测试

*   [plugins#815](https://github.com/flutter/plugins/pull/815): [google_maps_flutter] adds support for custom icon from a byte array (PNG)

  [plugins#815](https://github.com/flutter/plugins/pull/815)：[google_maps_flutter] 添加了对字节数组 (PNG) 中的自定义图标的支持

*   [plugins#1229](https://github.com/flutter/plugins/pull/1229): [google_maps_flutter] Marker APIs are now widget based (Android)

  [plugins#1229](https://github.com/flutter/plugins/pull/1229)：[google_maps_flutter] 标记 API 现在基于 widget (Android)

*   [plugins#1421](https://github.com/flutter/plugins/pull/1421): [in_app_purchase]make payment unified APIs

  [plugins#1421](https://github.com/flutter/plugins/pull/1421): [in_app_purchase]统一支付 API

*   [plugins#1380](https://github.com/flutter/plugins/pull/1380): [in_app_purchase]load purchase

  [plugins#1380](https://github.com/flutter/plugins/pull/1380)：[in_app_purchase]加载购买

*   [flutter#26329](https://github.com/flutter/flutter/issues/26329): IAP: Purchase an auto-renewing subscription

  [flutter#26329](https://github.com/flutter/flutter/issues/26329)：IAP：购买自动续订订阅

*   [flutter#26331](https://github.com/flutter/flutter/issues/26331): IAP: Purchase a non-renewing subscription

  [flutter#26331](https://github.com/flutter/flutter/issues/26331)：IAP：购买非续订订阅

*   [flutter#26326](https://github.com/flutter/flutter/issues/26326): IAP: Load previous purchases

  [flutter#26326](https://github.com/flutter/flutter/issues/26326)：IAP：加载之前购买的商品

*   [plugins#1249](https://github.com/flutter/plugins/pull/1249): [in_app_purchase] payment queue dart ios

  [plugins#1249](https://github.com/flutter/plugins/pull/1249): [in_app_purchase] 支付队列 dart ios

*   [flutter#26327](https://github.com/flutter/flutter/pull/26327): IAP: Purchase an unlock

  [flutter#26327](https://github.com/flutter/flutter/pull/26327)：IAP：购买解锁

*   [flutter#26328](https://github.com/flutter/flutter/pull/26328): IAP: Purchase a consumable

  [flutter#26328](https://github.com/flutter/flutter/pull/26328)：IAP：购买消耗品

*   [flutter#29837](https://github.com/flutter/flutter/issues/29837): Image_picker flickers when barcode_scan and image_picker are used together

  [flutter#29837](https://github.com/flutter/flutter/issues/29837): 当 barcode_scan 和 image_picker 一起使用时，image_picker 闪烁

*   [flutter#17950](https://github.com/flutter/flutter/issues/17950): Image_picker plugin fails, if Flutter activity is killed while native one is shown

  [flutter#17950](https://github.com/flutter/flutter/issues/17950)：如果 Flutter 活动在显示本机活动时被终止，Image_picker 插件会失败

*   [flutter#18700](https://github.com/flutter/flutter/issues/18700): [image_picker] Crash on Galaxy S5 and Note 4 when attempting to use the camera

  [flutter#18700](https://github.com/flutter/flutter/issues/18700)：[image_picker] 尝试使用相机时 Galaxy S5 和 Note 4 崩溃

*   [plugins#1372](https://github.com/flutter/plugins/pull/1372): [image_picker] fix "Cancel button not visible in gallery, if camera was accessed first"

  [plugins#1372](https://github.com/flutter/plugins/pull/1372)：[image_picker]修复“如果首先访问相机，取消按钮在图库中不可见”

*   [plugins#1471](https://github.com/flutter/plugins/pull/1471): [image_picker] Fix invalid path being returned from Google Photos

  [plugins#1471](https://github.com/flutter/plugins/pull/1471): [image_picker] 修复从 Google Photos 返回的无效路径

*   [flutter#29422](https://github.com/flutter/flutter/issues/29422): image_picker error:Permission Denial

  [flutter#29422](https://github.com/flutter/flutter/issues/29422): image_picker 错误：权限被拒绝

*   [plugins#1237](https://github.com/flutter/plugins/pull/1237): [share] Changed compileSdkVersion of share plugin to 28

  [plugins#1237](https://github.com/flutter/plugins/pull/1237): [分享] 将分享插件的 compileSdkVersion 更改为 28

*   [plugins#1373](https://github.com/flutter/plugins/pull/1373): [shared_preferences] Add contains method

  [plugins#1373](https://github.com/flutter/plugins/pull/1373): [shared_preferences] 添加 contains 方法

*   [plugins#1470](https://github.com/flutter/plugins/pull/1470): [video_player] Android: Added missing event.put("event", "completed");

  [plugins#1470](https://github.com/flutter/plugins/pull/1470): [video_player] Android: 添加了缺少的 event.put(`event`, `completed`);

*   [flutter#25329](https://github.com/flutter/flutter/pull/25329): [WebView] Allow the webview to take control when a URL is about to be loaded

  [flutter#25329](https://github.com/flutter/flutter/pull/25329): [WebView] 当 URL 即将加载时允许 webview 进行控制



## Tool Changes

## 工具变更


Last but certainly not least, we made a number of tooling changes in the core Flutter repos to improve the developer experience, particularly when it comes to improving hot reload performance (and you thought it was fast before!).

最后但同样重要的是，我们在核心 Flutter 存储库中进行了许多工具更改，以改善开发人员体验，特别是在提高热重载性能方面（你之前认为它很快！）。




*   [flutter#29693](https://github.com/flutter/flutter/pull/29693): Use source list from the compiler to track invalidated files for hot reload.

  [flutter#29693](https://github.com/flutter/flutter/pull/29693)：使用编译器中的源列表来跟踪热重载的无效文件。

*   [flutter#28152](https://github.com/flutter/flutter/pull/28152): Improve hot reload performance

  [flutter#28152](https://github.com/flutter/flutter/pull/28152)：提高热重载性能

*   [flutter#29494](https://github.com/flutter/flutter/pull/29494): initial work on coverage generating script for tool

  [flutter#29494](https://github.com/flutter/flutter/pull/29494)：工具覆盖率生成脚本的初步工作

*   [flutter#31171](https://github.com/flutter/flutter/pull/31171): Allow disabling all fingerprint caches via environment variable

  [flutter#31171](https://github.com/flutter/flutter/pull/31171)：允许通过环境变量禁用所有指纹缓存

*   [flutter#31073](https://github.com/flutter/flutter/pull/31073): Fuchsia step 1: add SDK version file and artifact download

  [flutter#31073](https://github.com/flutter/flutter/pull/31073): Fuchsia 步骤 1：添加 SDK 版本文件和工件下载

*   [flutter#31064](https://github.com/flutter/flutter/pull/31064): Add sorting to flutter version command

  [flutter#31064](https://github.com/flutter/flutter/pull/31064): flutter 版本命令添加排序

*   [flutter#31063](https://github.com/flutter/flutter/pull/31063): Download and handle product version of flutter patched sdk

  [flutter#31063](https://github.com/flutter/flutter/pull/31063)：下载并处理 flutter 补丁 sdk 的产品版本

*   [flutter#31074](https://github.com/flutter/flutter/pull/31074): make flutterProject option of CoverageCollector optional

  [flutter#31074](https://github.com/flutter/flutter/pull/31074): 使 CoverageCollector 的 flutterProject 选项可选

*   [flutter#30818](https://github.com/flutter/flutter/pull/30818): New flag to flutter drive to skip installing fresh app on device

  [flutter#30818](https://github.com/flutter/flutter/pull/30818)：新标志可让驱动器跳过在设备上安装新应用程序

*   [flutter#30867](https://github.com/flutter/flutter/pull/30867): Add toggle for debugProfileWidgetBuilds

  [flutter#30867](https://github.com/flutter/flutter/pull/30867)：添加 debugProfileWidgetBuilds 的开关

*   [flutter#27034](https://github.com/flutter/flutter/pull/27034): Updated package template .gitignore file

  [flutter#27034](https://github.com/flutter/flutter/pull/27034)：更新了包模板.gitignore 文件

*   [flutter#30115](https://github.com/flutter/flutter/pull/30115): Forward missing pub commands

  [flutter#30115](https://github.com/flutter/flutter/pull/30115)：转发缺少的 pub 命令

*   [flutter#30254](https://github.com/flutter/flutter/pull/30254): Reland: Ensure that flutter run/drive/test/update_packages only downloads required artifacts

  [flutter#30254](https://github.com/flutter/flutter/pull/30254): 重新着陆：确保 flutter run/drive/test/update_packages 只下载所需的工件

*   [flutter#30153](https://github.com/flutter/flutter/pull/30153): Allow disabling experimental commands, devices on stable branch

  [flutter#30153](https://github.com/flutter/flutter/pull/30153)：允许禁用实验命令、稳定分支上的设备

*   [flutter#30428](https://github.com/flutter/flutter/pull/30428): Update repair command for Arch Linux

  [flutter#30428](https://github.com/flutter/flutter/pull/30428)：更新 Arch Linux 的修复命令


Further, the IDE plugins for Flutter have had a number of updates since the last stable release of Flutter.

此外，自上次稳定版本 Flutter 以来，Flutter 的 IDE 插件已进行了多次更新。




*   Visual Studio Code: [February 21, 2019 (2.23.1)](https://dartcode.org/releases/v2-23/)

  视觉工作室代码：[February 21, 2019 (2.23.1)](https://dartcode.org/releases/v2-23/)

*   Visual Studio Code: [February 27, 2019 (2.24.0)](https://dartcode.org/releases/v2-24/)

  视觉工作室代码：[February 27, 2019 (2.24.0)](https://dartcode.org/releases/v2-24/)

*   IntelliJ/Android Studio: [March 29, 2019 (M34)](https://groups.google.com/forum/#!msg/flutter-dev/-g7MlcL7u9s/VwZtnh-XAgAJ)

  IntelliJ/Android 工作室：[March 29, 2019 (M34)](https://groups.google.com/forum/#!msg/flutter-dev/-g7MlcL7u9s/VwZtnh-XAgAJ)

*   Visual Studio Code: [April 17, 2019 (2.25.1)](https://dartcode.org/releases/v2-25/)

  视觉工作室代码：[April 17, 2019 (2.25.1)](https://dartcode.org/releases/v2-25/)

*   IntelliJ/Android Studio: [April 26, 2019 (M35)](https://groups.google.com/forum/#!topic/flutter-dev/qZNjCI_2BLE)

  IntelliJ/Android 工作室：[April 26, 2019 (M35)](https://groups.google.com/forum/#!topic/flutter-dev/qZNjCI_2BLE)

*   Visual Studio Code: [May 1, 2019 (2.26.1)](https://dartcode.org/releases/v2-26/ )

  视觉工作室代码：[May 1, 2019 (2.26.1)](https://dartcode.org/releases/v2-26/ )



## Dynamic Update (aka Code Push)

## 动态更新（又名代码推送）


As a final note, we're nearly at the midpoint of the year, when it's time to reassess the areas where we can have the most important, we've decided to drop plans for dynamic updates (aka code push) from our 2019 roadmap. If you're interested in the reasons why, you can read [the detailed explanation](https://github.com/flutter/flutter/issues/14330#issuecomment-485565194). Dropping this work allows us to increase our focus on quality as well as our experiments in Flutter for web and Flutter for desktop.

最后一点，我们已接近今年年中，到了重新评估最重要领域的时候了，我们决定从 2019 年路线图中放弃动态更新（又称代码推送）计划。如果你对原因感兴趣，可以阅读[the detailed explanation](https://github.com/flutter/flutter/issues/14330#issuecomment-485565194)。放弃这项工作使我们能够更加关注质量以及我们在 Flutter（适用于网络）和 Flutter（适用于桌面）中的实验。



## Full Issue List

## 完整问题列表


You can see [the full list of PRs committed in this release](/release/release-notes/changelogs/changelog-1.5.4).

你可以看到[the full list of PRs committed in this release](/release/release-notes/changelogs/changelog-1.5.4).

