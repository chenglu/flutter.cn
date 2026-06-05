---
# title: Flutter 3.0.0 release notes
title: Flutter 3.0.0 发行说明
# shortTitle: 3.0.0 release notes
shortTitle: 3.0.0 发行说明
# description: Release notes for Flutter 3.0.0.
description: Flutter 3.0.0 的发行说明。
skipTemplateRendering: true
ai-translated: true
---

This page has release notes for 3.0.0.
For information about subsequent bug-fix releases,
see our [CHANGELOG][].

此页面包含 3.0.0 的发行说明。有关后续错误修复版本的信息，请参阅我们的[CHANGELOG][].


[CHANGELOG]: https://github.com/flutter/flutter/blob/main/CHANGELOG.md

## If you see warnings about bindings

## 如果你看到有关绑定的警告


When migrating to Flutter 3,
you might see warnings like the following:

迁移到 Flutter 3 时，你可能会看到如下警告：


```plaintext
Warning: Operand of null-aware operation '!' has type 'SchedulerBinding' which excludes null.
```

These are caused by a simplification of the API
(the `instance` property on bindings is now non-nullable),
combined with an eager compiler that wants to report
any case where redundant null-aware operators
(such as `!` and `?.`) that are used when
they're not necessary.

这些问题是由于 API 的简化（绑定上的 `instance` 属性现在不可为空）以及急切的编译器所导致的，该编译器希望报告在不需要时使用冗余空感知运算符（例如 `!` 和 `?.`）的任何情况。


If this happens,
there might be several causes with different solutions:

如果发生这种情况，可能有多种原因，并有不同的解决方案：


### Dependencies

### 依赖关系


If your dependencies use bindings,
they might need updating to silence the warnings.
Your builds should be unaffected except for
the verbose warnings.
You can ignore the warnings for now
(maybe reach out to your dependency's
developers to convince them to update).

如果你的依赖项使用绑定，它们可能需要更新以消除警告。除了详细警告之外，你的构建应该不受影响。你现在可以忽略这些警告（也许可以联系你的依赖项的开发人员以说服他们进行更新）。


### Your code

### 你的代码


If the problem refers to your own code,
you can update it by running `dart fix --apply`.
This should resolve all the warnings.

如果问题涉及你自己的代码，你可以通过运行 `dart fix --apply` 来更新它。这应该可以解决所有警告。


If you need your code to support both
Flutter 3 and earlier versions
(maybe because your code is a library),
then you can wrap calls to `binding.instance`
with calls to a method such as the following:

如果你需要代码支持 Flutter 3 及更早版本（可能因为你的代码是一个库），那么你可以通过调用如下方法来包装对 `binding.instance` 的调用：


```dart
/// This allows a value of type T or T?
/// to be treated as a value of type T?.
///
/// We use this so that APIs that have become
/// non-nullable can still be used with `!` and `?`
/// to support older versions of the API as well.
T? _ambiguate<T>(T? value) => value;
```

For example, instead of the following:

例如，而不是以下内容：


```dart
SchedulerBinding.instance!.addPostFrameCallback(...);
```

You can use:

你可以使用：


```dart
_ambiguate(SchedulerBinding.instance)!.addPostFrameCallback(...);
```

When you no longer need to support versions of
Flutter before 3.0.0, you can remove this and
replace it with the following:

当你不再需要支持 3.0.0 之前的 Flutter 版本时，可以将其删除并替换为以下内容：


```dart
SchedulerBinding.instance.addPostFrameCallback(...);
```

### Framework issues

### 框架issues


If the error messages do not point to one of your dependencies,
and `dart fix --apply` doesn't fix the issue,
or if the warnings are fatal
(for example, your application refuses to run), please
[file a bug]({{site.repo.flutter}}/issues/new/choose).

如果错误消息未指向你的依赖项之一，并且 `dart fix --apply` 未修复 issue，或者警告是致命的（例如，你的应用程序拒绝运行），请[file a bug]({{site.repo.flutter}}/issues/new/choose).


## What's Changed

## 发生了什么变化


The following changes happened in this release:

此版本中发生了以下更改：


### Framework

### 框架


* Revert "[Fonts] Update icons" by @guidezpl in https://github.com/flutter/flutter/pull/95966

  恢复 https://github.com/flutter/flutter/pull/95966 中 @guidezpl 的“[字体]更新图标”

* Improve iOS fidelity of `barrierColor`s and edge decorations for full-screen Cupertino page transitions by @willlockwood in https://github.com/flutter/flutter/pull/95537

  通过 https://github.com/flutter/flutter/pull/95537 中的 @willlockwood 提高 `barrierColor`s 的 iOS 保真度和全屏 Cupertino 页面转换的边缘装饰

* [Fonts] Update icons by @guidezpl in https://github.com/flutter/flutter/pull/96115

  [字体] 通过 https://github.com/flutter/flutter/pull/96115 中的 @guidezpl 更新图标

* Allow `Checkbox`es in `DataTable`s to inherit colors from `CheckboxTheme` by @willlockwood in https://github.com/flutter/flutter/pull/96007

  允许 `DataTable`s 中的 `Checkbox`es 通过 https://github.com/flutter/flutter/pull/96007 中的 @willlockwood 从 `CheckboxTheme` 继承颜色

* Fix autofill eligibility check by @LongCatIsLooong in https://github.com/flutter/flutter/pull/95210

  通过 https://github.com/flutter/flutter/pull/95210 中的 @LongCatIsLooong 修复自动填充资格检查

* [DropdownButtonFormField] Add borderRadius property by @dheerajv09 in https://github.com/flutter/flutter/pull/95944

  [DropdownButtonFormField] 通过 https://github.com/flutter/flutter/pull/95944 中的 @dheerajv09 添加 borderRadius 属性

* Fix `DataTable` `_SortArrow` changing orientation when state is updated by @markusaksli-nc in https://github.com/flutter/flutter/pull/94455

  修复 https://github.com/flutter/flutter/pull/94455 中的 @markusaksli-nc 更新状态时 `DataTable` `_SortArrow` 改变方向

* Fix typo by @goderbauer in https://github.com/flutter/flutter/pull/96195

  修复 https://github.com/flutter/flutter/pull/96195 中的 @goderbauer 的拼写错误

* RawKeyboard repeat events, and SingleActivator.includeRepeats by @dkwingsmt in https://github.com/flutter/flutter/pull/96154

  RawKeyboard 重复事件，以及 https://github.com/flutter/flutter/pull/96154 中的 @dkwingsmt 的 SingleActivator.includeRepeats

* InteractiveViewer scaleFactor by @justinmc in https://github.com/flutter/flutter/pull/95224

  InteractiveViewer scaleFactor 由 @justinmc 在 https://github.com/flutter/flutter/pull/95224

* Reland "Ensure the engineLayer is disposed when an OpacityLayer is disabled"" by @dnfield in https://github.com/flutter/flutter/pull/96295

  重新登陆“确保在禁用 OpacityLayer 时处理 engineLayer”，作者：https://github.com/flutter/flutter/pull/96295 中的 @dnfield

* Disallow copy and cut when `obscureText` is set on `TextField` by @gspencergoog in https://github.com/flutter/flutter/pull/96233

  当 https://github.com/flutter/flutter/pull/96233 中的 @gspencergoog 在 `TextField` 上设置 `obscureText` 时，禁止复制和剪切

* Revert "Disallow copy and cut when `obscureText` is set on `TextField` (#96233)" by @gspencergoog in https://github.com/flutter/flutter/pull/96308

  恢复 https://github.com/flutter/flutter/pull/96308 中 @gspencergoog 的“在 `TextField` (#96233) 上设置 `obscureText` 时禁止复制和剪切”

* Fix `paints..something` and `paints..everything` succeeding when they should fail by @willlockwood in https://github.com/flutter/flutter/pull/95993

  修复 `paints..something` 和 `paints..everything` 在 https://github.com/flutter/flutter/pull/95993 中的 @willlockwood 应该失败时成功的问题

* Fixes `RangeError` bug when length of `TabBar.tabs` is changed by @werainkhatri in https://github.com/flutter/flutter/pull/94623

  修复了 https://github.com/flutter/flutter/pull/94623 中 `TabBar.tabs` 的长度被 @werainkhatri 更改时的 `RangeError` 错误

* Make `FocusNode.traversalChildren` not be affected by parent's `canRequestFocus` by @gspencergoog in https://github.com/flutter/flutter/pull/95061

  通过 https://github.com/flutter/flutter/pull/95061 中的 @gspencergoog 使 `FocusNode.traversalChildren` 不受父级 `canRequestFocus` 的影响

* fix a scrollbar bug by @xu-baolin in https://github.com/flutter/flutter/pull/95894

  修复了 https://github.com/flutter/flutter/pull/95894 中的 @xu-baolin 的滚动条错误

* Do not crash on LeaderLayer.applyTransform after retained rendering by @goderbauer in https://github.com/flutter/flutter/pull/96144

  在 https://github.com/flutter/flutter/pull/96144 中的 @goderbauer 保留渲染后，不要在 LeaderLayer.applyTransform 上崩溃

* LayerLink can temporary allow multiple leaders by @chunhtai in https://github.com/flutter/flutter/pull/95977

  LayerLink 可以通过 https://github.com/flutter/flutter/pull/95977 中的 @chunhtai 暂时允许多个领导者

* TextEditingValue default selection docs by @justinmc in https://github.com/flutter/flutter/pull/96245

  TextEditingValue 默认选择文档由 @justinmc 在 https://github.com/flutter/flutter/pull/96245 中提供

* Adds ability to mark a subtree as not traversable by @werainkhatri in https://github.com/flutter/flutter/pull/94626

  添加了将子树标记为不可通过 https://github.com/flutter/flutter/pull/94626 中的 @werainkhatri 遍历的功能

* InkResponse enable if onTapDown is not null by @markusaksli-nc in https://github.com/flutter/flutter/pull/96224

  如果 onTapDown 不为空，则 InkResponse 启用 https://github.com/flutter/flutter/pull/96224 中的 @markusaksli-nc

* InkWell.overlayColor is now resolved against MaterialState.pressed by @HansMuller in https://github.com/flutter/flutter/pull/96435

  InkWell.overlayColor 现在已通过 https://github.com/flutter/flutter/pull/96435 中的 @HansMuller 针对 MaterialState.pressed 进行解析

* Support Scribble Handwriting by @fbcouch in https://github.com/flutter/flutter/pull/75472

  支持 https://github.com/flutter/flutter/pull/75472 中的 @fbcouch 手写书写

* [RenderListWheelViewport] Update content dimensions to prevent scroll offset changes by @xu-baolin in https://github.com/flutter/flutter/pull/96102

  [RenderListWheelViewport] 通过 https://github.com/flutter/flutter/pull/96102 中的 @xu-baolin 更新内容尺寸以防止滚动偏移更改

* Fix Dialog alignment doc by @TahaTesser in https://github.com/flutter/flutter/pull/96388

  通过 https://github.com/flutter/flutter/pull/96388 中的 @TahaTesser 修复对话框对齐文档

* Enable no_leading_underscores_for_library_prefixes by @goderbauer in https://github.com/flutter/flutter/pull/96420

  通过 https://github.com/flutter/flutter/pull/96420 中的 @goderbauer 启用 no_leading_underscores_for_library_prefixes

* Expose keyCode field in RawKeyEventDataWeb. by @b-luk in https://github.com/flutter/flutter/pull/96483

  公开 RawKeyEventDataWeb 中的 keyCode 字段。通过 @b-luk 在 https://github.com/flutter/flutter/pull/96483

* enable more retained rendering opportunities for LeaderLayer by @goderbauer in https://github.com/flutter/flutter/pull/96486

  通过 https://github.com/flutter/flutter/pull/96486 中的 @goderbauer 为 LeaderLayer 提供更多保留的渲染机会

* Migrate FloatingActionButton to Material 3 by @darrenaustin in https://github.com/flutter/flutter/pull/94486

  通过 https://github.com/flutter/flutter/pull/94486 中的 @darrenaustin 将 FloatingActionButton 迁移到 Material 3

* Make `DraggableScrollableController` a `ChangeNotifier` by @caseycrogers in https://github.com/flutter/flutter/pull/96089

  通过 https://github.com/flutter/flutter/pull/96089 中的 @caseycrogers 将 `DraggableScrollableController` 设为 `ChangeNotifier`

* enable unnecessary_late by @goderbauer in https://github.com/flutter/flutter/pull/96417

  通过 https://github.com/flutter/flutter/pull/96417 中的 @goderbauer 启用necessary_late

* Correct scroll notifications for NestedScrollView by @Piinks in https://github.com/flutter/flutter/pull/96482

  https://github.com/flutter/flutter/pull/96482 中的 @Piinks 纠正 NestedScrollView 的滚动通知

* MaterialStateProperty Docs by @Piinks in https://github.com/flutter/flutter/pull/96532

  MaterialStateProperty 文档，作者：@Piinks，位于 https://github.com/flutter/flutter/pull/96532

* Add debug property for onPointerHover by @WasserEsser in https://github.com/flutter/flutter/pull/96555

  通过 https://github.com/flutter/flutter/pull/96555 中的 @WasserEsser 添加 onPointerHover 的调试属性

* Date Picker year selectors should announce as 'buttons' to accessibility framework. by @darrenaustin in https://github.com/flutter/flutter/pull/96546

  日期选择器年份选择器应作为可访问性框架的“按钮”宣布。通过 @darrenaustin 在 https://github.com/flutter/flutter/pull/96546

* Revert "Support Scribble Handwriting" by @LongCatIsLooong in https://github.com/flutter/flutter/pull/96615

  恢复 https://github.com/flutter/flutter/pull/96615 中 @LongCatIsLooong 的“支持涂鸦手写”

* Add Supported devices to the TapGestureRecognizer by @chunhtai in https://github.com/flutter/flutter/pull/96560

  通过 https://github.com/flutter/flutter/pull/96560 中的 @chunhtai 将支持的设备添加到 TapGestureRecognizer

* Fix UNUSED_ELEMENT_PARAMETER for field formal initializers. by @scheglov in https://github.com/flutter/flutter/pull/96553

  修复字段形式初始值设定项的 UNUSED_ELEMENT_PARAMETER。通过 https://github.com/flutter/flutter/pull/96553 中的 @scheglov

* Mac cmd + shift + left/right by @justinmc in https://github.com/flutter/flutter/pull/95948

  Mac cmd + shift + 左/右按 @justinmc 在 https://github.com/flutter/flutter/pull/95948

* Modularize ReorderableListView auto scrolling logic by @chunhtai in https://github.com/flutter/flutter/pull/96563

  通过 https://github.com/flutter/flutter/pull/96563 中的 @chunhtai 模块化 ReorderableListView 自动滚动逻辑

* Slider: add themeable mouse cursor v2 by @HansMuller in https://github.com/flutter/flutter/pull/96623

  Slider：通过 https://github.com/flutter/flutter/pull/96623 中的 @HansMuller 添加主题鼠标光标 v2

* Land Set "basic" mouse cursor for disabled buttons, PR #89346 by @HansMuller in https://github.com/flutter/flutter/pull/96561

  为禁用按钮设置“基本”鼠标光标，PR #89346，作者：@HansMuller，位于 https://github.com/flutter/flutter/pull/96561

* Fix a [_ViewportElement] RenderObjectChild update bug by @xu-baolin in https://github.com/flutter/flutter/pull/96377

  修复了 https://github.com/flutter/flutter/pull/96377 中的 @xu-baolin 的 [_ViewportElement] RenderObjectChild 更新错误

* Provide Appbar's `foregroundColor` to package license page titles by @TahaTesser in https://github.com/flutter/flutter/pull/95685

  提供Appbar的`foregroundColor`，通过https://github.com/flutter/flutter/pull/95685中的@TahaTesser来打包许可页面标题

* Add example for CustomMultiChildLayout by @gspencergoog in https://github.com/flutter/flutter/pull/96632

  在 https://github.com/flutter/flutter/pull/96632 中添加 @gspencergoog 的 CustomMultiChildLayout 示例

* PopupMenu: add themeable mouse cursor v2 by @HansMuller in https://github.com/flutter/flutter/pull/96567

  PopupMenu：通过 https://github.com/flutter/flutter/pull/96567 中的 @HansMuller 添加主题鼠标光标 v2

* Added TabBar.splashFactory, TabBarTheme.splashFactory,overlayColor by @HansMuller in https://github.com/flutter/flutter/pull/96252

  由 @HansMuller 在 https://github.com/flutter/flutter/pull/96252 添加 TabBar.splashFactory、TabBarTheme.splashFactory、overlayColor

* [framework] dont null assert in _debugVerifyIllFatedPopulation by @jonahwilliams in https://github.com/flutter/flutter/pull/96551

  [框架] 不要在 https://github.com/flutter/flutter/pull/96551 中的 @jonahwilliams 在 _debugVerifyIllFatedPopulation 中进行 null 断言

* Disallow copy and cut when text field is obscured. by @gspencergoog in https://github.com/flutter/flutter/pull/96309

  当文本字段被遮挡时禁止复制和剪切。通过 https://github.com/flutter/flutter/pull/96309 中的 @gspencergoog

* feat: Added more youtube refs to widgets docstrings by @albertodev01 in https://github.com/flutter/flutter/pull/96484

  壮举：https://github.com/flutter/flutter/pull/96484 中的 @albertodev01 在 widgets 文档字符串中添加了更多 YouTube 参考

* update adaptive slider docs by @maheshmnj in https://github.com/flutter/flutter/pull/96599

  通过 https://github.com/flutter/flutter/pull/96599 中的 @maheshmnj 更新自适应滑块文档

* Fix UNUSED_ELEMENT_PARAMETER for unused field formal parameter. by @scheglov in https://github.com/flutter/flutter/pull/96684

  修复未使用的字段形式参数的 UNUSED_ELEMENT_PARAMETER。通过 @scheglov 在 https://github.com/flutter/flutter/pull/96684

* feat: added custom padding in PopupMenuButton by @arafaysaleem in https://github.com/flutter/flutter/pull/96657

  壮举：https://github.com/flutter/flutter/pull/96657 中的 @arafaysaleem 在 PopupMenuButton 中添加了自定义填充

* [framework] remove hashcode override for Element by @jonahwilliams in https://github.com/flutter/flutter/pull/96644

  [框架] 通过 https://github.com/flutter/flutter/pull/96644 中的 @jonahwilliams 删除元素的哈希码覆盖

* Do not eagerly allocate inherited widget caches when initializing element tree by @jonahwilliams in https://github.com/flutter/flutter/pull/95596

  在 https://github.com/flutter/flutter/pull/95596 中通过 @jonahwilliams 初始化元素树时，不要急切地分配继承的 widget 缓存

* Revert "feat: added custom padding in PopupMenuButton (#96657)" by @gspencergoog in https://github.com/flutter/flutter/pull/96781

  恢复 https://github.com/flutter/flutter/pull/96781 中的 @gspencergoog 的“壮举：在 PopupMenuButton 中添加自定义填充 (#96657)”

* Fix animate to curve argument by @caseycrogers in https://github.com/flutter/flutter/pull/96627

  通过 https://github.com/flutter/flutter/pull/96627 中的 @caseycrogers 修复动画到曲线参数

* Clean up mouse region code by @chunhtai in https://github.com/flutter/flutter/pull/96636

  通过 https://github.com/flutter/flutter/pull/96636 中的 @chunhtai 清理鼠标区域代码

* Prevents DropdownButton from applying borderRadius property to first and last element of the list. by @chinmoy12c in https://github.com/flutter/flutter/pull/96695

  防止 DropdownButton 将 borderRadius 属性应用于列表的第一个和最后一个元素。通过 https://github.com/flutter/flutter/pull/96695 中的 @chinmoy12c

* Adds BorderStyle property to TabPageSelector by @chinmoy12c in https://github.com/flutter/flutter/pull/92436

  通过 https://github.com/flutter/flutter/pull/92436 中的 @chinmoy12c 将 BorderStyle 属性添加到 TabPageSelector

* Remove duplicate hashCode values & add missing commas  by @TahaTesser in https://github.com/flutter/flutter/pull/96844

  删除重复的 hashCode 值并通过 https://github.com/flutter/flutter/pull/96844 中的 @TahaTesser 添加缺少的逗号

* Removed the date from the Next/Previous month button's semantics for the Date Picker. by @darrenaustin in https://github.com/flutter/flutter/pull/96876

  从日期选择器的下一个月/上个月按钮的语义中删除了日期。通过 https://github.com/flutter/flutter/pull/96876 中的 @darrenaustin

* chore: added YouTube ref to docstring by @albertodev01 in https://github.com/flutter/flutter/pull/96880

  杂务：将 YouTube 引用添加到 https://github.com/flutter/flutter/pull/96880 中的 @albertodev01 的文档字符串中

* chore(flutter_test): updated 'matchesGoldenFile' documentation by @albertodev01 in https://github.com/flutter/flutter/pull/96194

  Chore(flutter_test)：由 @albertodev01 在 https://github.com/flutter/flutter/pull/96194 更新了“matchesGoldenFile”文档

* Use strict-raw-types analysis instead of no-implicit-dynamic by @srawlins in https://github.com/flutter/flutter/pull/96296

  通过 https://github.com/flutter/flutter/pull/96296 中的 @srawlins 使用 strict-raw-types 分析而不是 no-implicit-dynamic

* [Keyboard] Dispatch solitary synthesized `KeyEvent`s by @dkwingsmt in https://github.com/flutter/flutter/pull/96874

  [键盘] 在 https://github.com/flutter/flutter/pull/96874 中调度 @dkwingsmt 单独合成的 `KeyEvent`s

* [web] validate WebDriver responses by @yjbanov in https://github.com/flutter/flutter/pull/96884

  [web] 通过 https://github.com/flutter/flutter/pull/96884 中的 @yjbanov 验证 Web 驱动程序响应

* Call image stream listeners asynchronously if added asynchronously by @WasserEsser in https://github.com/flutter/flutter/pull/95525

  如果通过 https://github.com/flutter/flutter/pull/95525 中的 @WasserEsser 异步添加，则异步调用图像流监听器

* chore: Moved didUpdateWidget calls first by @albertodev01 in https://github.com/flutter/flutter/pull/96944

  杂务：在 https://github.com/flutter/flutter/pull/96944 中首先通过 @albertodev01 移动 didUpdateWidget 调用

* Explain how MaterialApp renders text style in absence of Material Widget by @TahaTesser in https://github.com/flutter/flutter/pull/96530

  通过 https://github.com/flutter/flutter/pull/96530 中的 @TahaTesser 解释 MaterialApp 在没有材质 Widget 的情况下如何渲染文本样式

* Enable no_leading_underscores_for_local_identifiers by @goderbauer in https://github.com/flutter/flutter/pull/96422

  通过 https://github.com/flutter/flutter/pull/96422 中的 @goderbauer 启用 no_leading_underscores_for_local_identifiers

* Add ability to control if bottom child focus can be excluded in `AnimatedCrossFade` by @TahaTesser in https://github.com/flutter/flutter/pull/96593

  添加控制是否可以通过 https://github.com/flutter/flutter/pull/96593 中的 @TahaTesser 在 `AnimatedCrossFade` 中排除底部子焦点的功能

* Add closeDrawer and closeEndDrawer in ScaffoldState by @pedromassango in https://github.com/flutter/flutter/pull/96960

  通过 https://github.com/flutter/flutter/pull/96960 中的 @pedromassango 在 ScaffoldState 中添加 closeDrawer 和 closeEndDrawer

* PageView scroll physics to match Android by @nt4f04uNd in https://github.com/flutter/flutter/pull/95423

  PageView 滚动物理以匹配 https://github.com/flutter/flutter/pull/95423 中的 @nt4f04uNd 的 Android

* ListTile: add themeable mouse cursor  by @TahaTesser in https://github.com/flutter/flutter/pull/96740

  ListTile：通过 https://github.com/flutter/flutter/pull/96740 中的 @TahaTesser 添加主题鼠标光标

* Adds `CheckboxListTile.checkboxShape` by @werainkhatri in https://github.com/flutter/flutter/pull/95714

  在 https://github.com/flutter/flutter/pull/95714 中通过 @werainkhatri 添加 `CheckboxListTile.checkboxShape`

* Allow current leader of layerlink to detach before the previous leade… by @chunhtai in https://github.com/flutter/flutter/pull/96810

  允许当前层链接的领导者在前一个领导者之前分离...由 @chunhtai in https://github.com/flutter/flutter/pull/96810

* Export shadows to `Icon` API by @mateusfccp in https://github.com/flutter/flutter/pull/83638

  通过 https://github.com/flutter/flutter/pull/83638 中的 @mateusfccp 将阴影导出到 `Icon` API

* Deprecate Scrollbar isAlwaysShown -> thumbVisibility by @Piinks in https://github.com/flutter/flutter/pull/96957

  通过 https://github.com/flutter/flutter/pull/96957 中的 @Piinks 弃用滚动条 isAlwaysShown ->thumbVisibility

* Show keyboard after text input connection restarts by @LongCatIsLooong in https://github.com/flutter/flutter/pull/96541

  在 https://github.com/flutter/flutter/pull/96541 中的 @LongCatIsLooong 重新启动文本输入连接后显示键盘

* Revert "PageView scroll physics to match Android" by @Piinks in https://github.com/flutter/flutter/pull/97150

  在 https://github.com/flutter/flutter/pull/97150 中恢复 @Piinks 的“PageView 滚动物理以匹配 Android”

* [framework] remove extra casts by @jonahwilliams in https://github.com/flutter/flutter/pull/97155

  [框架] 通过 https://github.com/flutter/flutter/pull/97155 中的 @jonahwilliams 删除额外的转换

* add direction to CupertinoPickerDefaultSelectionOverlay by @Dan-Crane in https://github.com/flutter/flutter/pull/92959

  通过 https://github.com/flutter/flutter/pull/92959 中的 @Dan-Crane 添加到 CupertinoPickerDefaultSelectionOverlay 的方向

* relax routerReportsNewRouteInformation function signature by @chunhtai in https://github.com/flutter/flutter/pull/97154

  通过 https://github.com/flutter/flutter/pull/97154 中的 @chunhtai 放松 routerReportsNewRouteInformation 函数签名

* Adds `CommonFinders.bySubtype<T extends Widget>()` finder. by @lrhn in https://github.com/flutter/flutter/pull/91415

  添加 `CommonFinders.bySubtype<T extends Widget>()` 查找器。通过 https://github.com/flutter/flutter/pull/91415 中的 @lrhn

* Use a more appropriate curve on ScrollsToTop by @SuhwanCha in https://github.com/flutter/flutter/pull/96574

  在 https://github.com/flutter/flutter/pull/96574 中的 @SuhwanCha 在 ScrollsToTop 上使用更合适的曲线

* Deprecate Scrollbar hoverThickness and showTrackOnHover by @Piinks in https://github.com/flutter/flutter/pull/97173

  通过 https://github.com/flutter/flutter/pull/97173 中的 @Piinks 弃用滚动条悬停厚度和 showTrackOnHover

* Add splashRadius to PopupMenuButton by @Moluram in https://github.com/flutter/flutter/pull/91148

  通过https://github.com/flutter/flutter/pull/91148中的@Moluram将splashRadius添加到PopupMenuButton

* [framework] make HitTestEntry generic by @jonahwilliams in https://github.com/flutter/flutter/pull/97175

  [框架] 通过 https://github.com/flutter/flutter/pull/97175 中的 @jonahwilliams 使 HitTestEntry 通用

* Mirror before scaling in _AnimatedIconPainter by @Amir-P in https://github.com/flutter/flutter/pull/93312

  在 https://github.com/flutter/flutter/pull/93312 中的 @Amir-P 在 _AnimatedIconPainter 中缩放之前进行镜像

* Flutter web add support for NetworkImage headers by @jonas-martinez in https://github.com/flutter/flutter/pull/85954

  Flutter web 通过 @jonas-martinez 在 https://github.com/flutter/flutter/pull/85954 添加对 NetworkImage 标头的支持

* Re-land "Support Scribble Handwriting" (#96615) by @fbcouch in https://github.com/flutter/flutter/pull/96881

  重新登陆 https://github.com/flutter/flutter/pull/96881 中的 @fbcouch 的“支持涂鸦手写”（#96615）

* Revert the Scribble reland by @justinmc in https://github.com/flutter/flutter/pull/97405

  恢复 https://github.com/flutter/flutter/pull/97405 中 @justinmc 的 Scribble 重新登陆

* Update RawScrollbar to support the track by @Piinks in https://github.com/flutter/flutter/pull/97335

  更新 RawScrollbar 以支持 https://github.com/flutter/flutter/pull/97335 中 @Piinks 的轨道

* Deprecate `useDeleteButtonTooltip` for Chips by @RoyARG02 in https://github.com/flutter/flutter/pull/96174

  通过 https://github.com/flutter/flutter/pull/96174 中的 @RoyARG02 弃用芯片的 `useDeleteButtonTooltip`

* `RefreshIndicator`: Add an interactive example by @TahaTesser in https://github.com/flutter/flutter/pull/97254

  `RefreshIndicator`：在 https://github.com/flutter/flutter/pull/97254 中添加 @TahaTesser 的交互式示例

* Add `CupertinoTimerPicker` Interactive Example by @TahaTesser in https://github.com/flutter/flutter/pull/93621

  在 https://github.com/flutter/flutter/pull/93621 中添加 @TahaTesser 的 `CupertinoTimerPicker` 交互示例

* Fix tappable area for `DropdownButtonFormField` & add `InkWell` to `DropdownButton` by @TahaTesser in https://github.com/flutter/flutter/pull/95906

  修复 `DropdownButtonFormField` 的可点击区域，并通过 https://github.com/flutter/flutter/pull/95906 中的 @TahaTesser 将 `InkWell` 添加到 `DropdownButton`

* fixes navigator to be able to handle route with duplicate page key in… by @chunhtai in https://github.com/flutter/flutter/pull/97394

  修复导航器，使其能够处理具有重复页面键的路由…，作者：https://github.com/flutter/flutter/pull/97394 中的 @chunhtai

* Update `PopupMenuButton` example by @TahaTesser in https://github.com/flutter/flutter/pull/96681

  通过 https://github.com/flutter/flutter/pull/96681 中的 @TahaTesser 更新 `PopupMenuButton` 示例

* [Icons] Prevent double underscores after replacement by @guidezpl in https://github.com/flutter/flutter/pull/96904

  [图标] https://github.com/flutter/flutter/pull/96904 中替换为 @guidezpl 后防止双下划线

* improve docs for testing dart fix by @werainkhatri in https://github.com/flutter/flutter/pull/97493

  通过 https://github.com/flutter/flutter/pull/97493 中的 @werainkhatri 改进用于测试 dart 修复的文档

* PointerDeviceKind and ui.PointerChange forwards-compatibility by @moffatman in https://github.com/flutter/flutter/pull/97350

  PointerDeviceKind 和 ui.PointerChange 向前兼容性由 @moffatman 在 https://github.com/flutter/flutter/pull/97350 中实现

* Re-land "Support Scribble Handwriting" (#96615) by @fbcouch in https://github.com/flutter/flutter/pull/97437

  重新登陆 https://github.com/flutter/flutter/pull/97437 中的 @fbcouch 的“支持涂鸦手写”（#96615）

* BottomNavigationBar: add themeable mouse cursor by @TahaTesser in https://github.com/flutter/flutter/pull/96736

  BottomNavigationBar：通过 https://github.com/flutter/flutter/pull/96736 中的 @TahaTesser 添加主题鼠标光标

* Fix VisualDensity's vertical lerp implementation by @WasserEsser in https://github.com/flutter/flutter/pull/96597

  通过 https://github.com/flutter/flutter/pull/96597 中的 @WasserEsser 修复 VisualDensity 的垂直 lerp 实现

* chore: Updated AutofillContextAction documentation by @albertodev01 in https://github.com/flutter/flutter/pull/97245

  杂务：https://github.com/flutter/flutter/pull/97245 中的 @albertodev01 更新了 AutofillContextAction 文档

* Updated gen_defaults to use new JSON output from the Material token database. by @darrenaustin in https://github.com/flutter/flutter/pull/97596

  更新了 gen_defaults 以使用 Material 令牌数据库中的新 JSON 输出。通过 https://github.com/flutter/flutter/pull/97596 中的 @darrenaustin

* Allow Clip.none as a valid clipBehavior by @Piinks in https://github.com/flutter/flutter/pull/95593

  通过 https://github.com/flutter/flutter/pull/95593 中的 @Piinks 允许 Clip.none 作为有效的 ClipBehavior

* Add DisplayFeatureSubScreen widget by @andreidiaconu in https://github.com/flutter/flutter/pull/92907

  在 https://github.com/flutter/flutter/pull/92907 中添加 DisplayFeatureSubScreen widget by @andreidiaconu

* Updated the FAB defaults to only use function overrides for computed values. by @darrenaustin in https://github.com/flutter/flutter/pull/97677

  更新了 FAB 默认值，仅对计算值使用函数覆盖。通过 https://github.com/flutter/flutter/pull/97677 中的 @darrenaustin

* Add docs about horizontal scrollbars by @Piinks in https://github.com/flutter/flutter/pull/97673

  通过 @Piinks 在 https://github.com/flutter/flutter/pull/97673 添加有关水平滚动条的文档

* Update SliverChildDelegate docs by @Piinks in https://github.com/flutter/flutter/pull/97674

  通过 https://github.com/flutter/flutter/pull/97674 中的 @Piinks 更新 SliverChildDelegate 文档

* Add splashBorderRadius to TabBar by @nayeemtby in https://github.com/flutter/flutter/pull/97204

  通过https://github.com/flutter/flutter/pull/97204中的@nayeemtby将splashBorderRadius添加到TabBar

* Invalidate the TextPainter line metrics cache when redoing text layout by @jason-simmons in https://github.com/flutter/flutter/pull/97446

  通过 https://github.com/flutter/flutter/pull/97446 中的 @jason-simmons 重做文本布局时，使 TextPainter 行指标缓存无效

* Fix RouterObserver didPop is not called when reverseTransitionDuratio… by @chunhtai in https://github.com/flutter/flutter/pull/97171

  修复在 https://github.com/flutter/flutter/pull/97171 中的 @chunhtai 时，reverseTransitionDuratio 时不会调用 RouterObserver didPop...

* Fix Local `SwitchTheme` not being inherited by `Switch` Widget by @TahaTesser in https://github.com/flutter/flutter/pull/97705

  修复 https://github.com/flutter/flutter/pull/97705 中的 `Switch` Widget 不被 @TahaTesser 继承的本地 `SwitchTheme`

* Clean up the bindings APIs. by @Hixie in https://github.com/flutter/flutter/pull/89451

  清理绑定 API。通过 https://github.com/flutter/flutter/pull/89451 中的 @Hixie

* Fix Local `CheckBoxTheme` not being inherited by `CheckBox` Widget by @TahaTesser in https://github.com/flutter/flutter/pull/97715

  修复 https://github.com/flutter/flutter/pull/97715 中的 `CheckBox` Widget 不被 @TahaTesser 继承的本地 `CheckBoxTheme`

* Fix Local `RadioTheme` not being inherited by `Radio` Widget by @TahaTesser in https://github.com/flutter/flutter/pull/97713

  修复 https://github.com/flutter/flutter/pull/97713 中的 `Radio` Widget 不被 @TahaTesser 继承的本地 `RadioTheme`

* Fix `PopupMenuButton` example tag by @TahaTesser in https://github.com/flutter/flutter/pull/97763

  通过 https://github.com/flutter/flutter/pull/97763 中的 @TahaTesser 修复 `PopupMenuButton` 示例标记

* Prepare the flutter.material.RawMaterialButton.mouseCursor doc template for themeable mouse cursors by @jpnurmi in https://github.com/flutter/flutter/pull/88470

  通过 https://github.com/flutter/flutter/pull/88470 中的 @jpnurmi 为主题鼠标光标准备 flutter.material.RawMaterialButton.mouseCursor 文档模板

* Text editing shift + tap + drag interaction by @justinmc in https://github.com/flutter/flutter/pull/95213

  文本编辑 Shift + 点击 + 拖动交互，由 @justinmc 在 https://github.com/flutter/flutter/pull/95213 中实现

* Make the application lifecycle does not affect `SchedulerBinding.scheduleForcedFrame`. by @ColdPaleLight in https://github.com/flutter/flutter/pull/97468

  使应用程序生命周期不影响`SchedulerBinding.scheduleForcedFrame`。通过 https://github.com/flutter/flutter/pull/97468 中的 @ColdPaleLight

* Report progress on Dismissible update callback by @cachapa in https://github.com/flutter/flutter/pull/95504

  通过 https://github.com/flutter/flutter/pull/95504 中的 @cachapa 报告可拒绝更新回调的进度

* RenderIndexedStack - Mark invisible children as offstage in debugDescribeProperties by @WasserEsser in https://github.com/flutter/flutter/pull/96639

  RenderIndexedStack - 在 https://github.com/flutter/flutter/pull/96639 中的 @WasserEsser 在 debugDescribeProperties 中将不可见的子项标记为后台

* TabBar: add themeable mouse cursor  by @TahaTesser in https://github.com/flutter/flutter/pull/96737

  TabBar：通过 https://github.com/flutter/flutter/pull/96737 中的 @TahaTesser 添加主题鼠标光标

* removes `Material` from tests of `FooButton`s that implement it internally by @werainkhatri in https://github.com/flutter/flutter/pull/96899

  从 https://github.com/flutter/flutter/pull/96899 中的 @werainkhatri 在内部实现的 `FooButton`s 测试中删除 `Material`

* Update default `ThemeData.textTheme` styles to Material 3 typography by @darrenaustin in https://github.com/flutter/flutter/pull/97829

  通过 https://github.com/flutter/flutter/pull/97829 中的 @darrenaustin 将默认 `ThemeData.textTheme` 样式更新为 Material 3 排版

* Undo/redo by @justinmc in https://github.com/flutter/flutter/pull/96968

  通过 https://github.com/flutter/flutter/pull/96968 中的 @justinmc 撤消/重做

* Remove RenderEditable dependency from TextSelectionHandleOverlay by @chunhtai in https://github.com/flutter/flutter/pull/97967

  通过 https://github.com/flutter/flutter/pull/97967 中的 @chunhtai 从 TextSelectionHandleOverlay 中删除 RenderEditable 依赖项

* [framework] don't hit test for system nav bar or system chrome on desktop by @jonahwilliams in https://github.com/flutter/flutter/pull/97883

  [框架] 不要在桌面上通过 @jonahwilliams 在 https://github.com/flutter/flutter/pull/97883 中进行系统导航栏或系统镶边的测试

* [framework] inline casts on Element.widget getter to improve web performance by @jonahwilliams in https://github.com/flutter/flutter/pull/97822

  [框架] 对 Element.widget getter 进行内联转换，通过 https://github.com/flutter/flutter/pull/97822 中的 @jonahwilliams 提高 Web 性能

* [EditableText] honor the "brieflyShowPassword" system setting by @LongCatIsLooong in https://github.com/flutter/flutter/pull/97769

  [EditableText] 遵循 https://github.com/flutter/flutter/pull/97769 中 @LongCatIsLooong 的“brieflyShowPassword”系统设置

* Revert "[EditableText] honor the "brieflyShowPassword" system setting" by @godofredoc in https://github.com/flutter/flutter/pull/98089

  恢复“[EditableText] 遵循 https://github.com/flutter/flutter/pull/98089 中 @godofredoc 的“brieflyShowPassword”系统设置”

* implemented TapUp within InkResponse and InkWell by @gslender in https://github.com/flutter/flutter/pull/93833

  由 @gslender 在 https://github.com/flutter/flutter/pull/93833 中在 InkResponse 和 InkWell 中实现 TapUp

* Fix timer keeps active when resampling disabled in some cases by @wangying3426 in https://github.com/flutter/flutter/pull/97197

  修复了 https://github.com/flutter/flutter/pull/97197 中的 @wangying3426 在某些情况下禁用重采样时计时器保持活动状态的问题

* Unify Text selection API by @chunhtai in https://github.com/flutter/flutter/pull/98073

  通过 https://github.com/flutter/flutter/pull/98073 中的 @chunhtai 统一文本选择 API

* Allow remove listener on disposed change notifier by @chunhtai in https://github.com/flutter/flutter/pull/97988

  允许通过 https://github.com/flutter/flutter/pull/97988 中的 @chunhtai 删除已处置更改通知程序上的侦听器

* [flutter_driver] show refresh rate status in timeline summary by @cyanglaz in https://github.com/flutter/flutter/pull/95699

  [flutter_driver] 在 https://github.com/flutter/flutter/pull/95699 中的 @cyanglaz 的时间线摘要中显示刷新率状态

* Shift tap on an unfocused field by @justinmc in https://github.com/flutter/flutter/pull/97543

  通过 https://github.com/flutter/flutter/pull/97543 中的 @justinmc 在未聚焦的字段上按住 Shift 键

* Windows/Linux keyboard shortcuts at a wordwrap by @justinmc in https://github.com/flutter/flutter/pull/96323

  https://github.com/flutter/flutter/pull/96323 中 @justinmc 的自动换行中的 Windows/Linux 键盘快捷键

* PointerDeviceKind forwards-compatibility in flutter_test by @moffatman in https://github.com/flutter/flutter/pull/98202

  https://github.com/flutter/flutter/pull/98202 中的 @moffatman 在 flutter_test 中的 PointerDeviceKind 向前兼容性

* EditableText does not request focus on autofill by @LongCatIsLooong in https://github.com/flutter/flutter/pull/97846

  EditableText 不请求 https://github.com/flutter/flutter/pull/97846 中的 @LongCatIsLooong 关注自动填充

* [framework] use platform touchslop on Android by @jonahwilliams in https://github.com/flutter/flutter/pull/97971

  [框架] 在 https://github.com/flutter/flutter/pull/97971 中的 @jonahwilliams 在 Android 上使用平台 touchslop

* Fix NavigationRail Indicator alignment for `NavigationRailLabelType.none` by @TahaTesser in https://github.com/flutter/flutter/pull/98028

  通过 https://github.com/flutter/flutter/pull/98028 中的 @TahaTesser 修复 `NavigationRailLabelType.none` 的 NavigationRail 指示器对齐

* Update Material tokens to v0.81. by @darrenaustin in https://github.com/flutter/flutter/pull/98149

  将 Material 令牌更新至 v0.81。通过 https://github.com/flutter/flutter/pull/98149 中的 @darrenaustin

* Add `keyLog` and `connectionFactory` to HttpClient implementations by @brianquinlan in https://github.com/flutter/flutter/pull/98045

  通过 https://github.com/flutter/flutter/pull/98045 中的 @brianquinlan 将 `keyLog` 和 `connectionFactory` 添加到 HttpClient 实现

* Reland "[EditableText] honor the "brieflyShowPassword" system setting #97769 " by @LongCatIsLooong in https://github.com/flutter/flutter/pull/98150

  Reland“[EditableText] 遵循 https://github.com/flutter/flutter/pull/98150 中的 @LongCatIsLooong 的“brieflyShowPassword”系统设置 #97769 ”

* [performance] Process dirty nodes from top to bottom during paint to avoid unnecessary layer tree walks by @goderbauer in https://github.com/flutter/flutter/pull/98219

  [性能] 在绘制期间从上到下处理脏节点，以避免不必要的层树遍历 https://github.com/flutter/flutter/pull/98219 中的 @goderbauer

* Refactor TextSelectionOverlay by @chunhtai in https://github.com/flutter/flutter/pull/98153

  由 @chunhtai 在 https://github.com/flutter/flutter/pull/98153 中重构 TextSelectionOverlay

* [performance] Trace direct calls to inflateWidget by @goderbauer in https://github.com/flutter/flutter/pull/98277

  [性能] 在 https://github.com/flutter/flutter/pull/98277 中跟踪 @goderbauer 对 inflateWidget 的直接调用

* Add a BindingBase.debugBindingType() method to enable asserts that want to verify that the binding isn't initialized by @Hixie in https://github.com/flutter/flutter/pull/98226

  添加 BindingBase.debugBindingType() 方法以启用想要验证绑定是否未由 https://github.com/flutter/flutter/pull/98226 中的 @Hixie 初始化的断言

* Fix `fooTheme.of(context);` usage docs by @TahaTesser in https://github.com/flutter/flutter/pull/98402

  通过 https://github.com/flutter/flutter/pull/98402 中的 @TahaTesser 修复 `fooTheme.of(context);` 使用文档

* Add `CupertinoSlider` example by @TahaTesser in https://github.com/flutter/flutter/pull/93633

  在 https://github.com/flutter/flutter/pull/93633 中添加 @TahaTesser 的 `CupertinoSlider` 示例

* CupertinoActionSheet: Update sample by @TahaTesser in https://github.com/flutter/flutter/pull/98356

  CupertinoActionSheet：通过 https://github.com/flutter/flutter/pull/98356 中的 @TahaTesser 更新示例

* CupertinoAlertDialog: Update sample by @TahaTesser in https://github.com/flutter/flutter/pull/98357

  CupertinoAlertDialog：通过 https://github.com/flutter/flutter/pull/98357 中的 @TahaTesser 更新示例

* Add custom size constraints parameter to `PopupMenu` by @TahaTesser in https://github.com/flutter/flutter/pull/97798

  通过 https://github.com/flutter/flutter/pull/97798 中的 @TahaTesser 将自定义大小约束参数添加到 `PopupMenu`

* Update `NavigationBar` to support Material 3 token by @darrenaustin in https://github.com/flutter/flutter/pull/98285

  通过 https://github.com/flutter/flutter/pull/98285 中的 @darrenaustin 更新 `NavigationBar` 以支持 Material 3 令牌

* Add `CupertinoPicker` interactive example by @TahaTesser in https://github.com/flutter/flutter/pull/93622

  在 https://github.com/flutter/flutter/pull/93622 中添加 @TahaTesser 的 `CupertinoPicker` 交互式示例

* Add `ExpansionTileTheme` by @TahaTesser in https://github.com/flutter/flutter/pull/98405

  在 https://github.com/flutter/flutter/pull/98405 中添加 @TahaTesser 的 `ExpansionTileTheme`

* Update `CupertinoTextField` example  by @TahaTesser in https://github.com/flutter/flutter/pull/93738

  通过 https://github.com/flutter/flutter/pull/93738 中的 @TahaTesser 更新 `CupertinoTextField` 示例

* CupertinoSegmentedControl: Add an interactive example by @TahaTesser in https://github.com/flutter/flutter/pull/98154

  CupertinoSegmentedControl：在 https://github.com/flutter/flutter/pull/98154 中添加 @TahaTesser 的交互式示例

* CupertinoSlidingSegmentedControl: Add an interactive example by @TahaTesser in https://github.com/flutter/flutter/pull/98156

  CupertinoSlidingSegmentedControl：在 https://github.com/flutter/flutter/pull/98156 中添加 @TahaTesser 的交互式示例

* Added a NavgationBar example with nested Navigators by @HansMuller in https://github.com/flutter/flutter/pull/98440

  在 https://github.com/flutter/flutter/pull/98440 中添加了 @HansMuller 带有嵌套导航器的 NavgationBar 示例

* Revert "[performance] Process dirty nodes from top to bottom during paint to avoid unnecessary layer tree walks" by @goderbauer in https://github.com/flutter/flutter/pull/98520

  恢复“[性能]在绘制过程中从上到下处理脏节点，以避免不必要的层树遍历”，作者：@goderbauer，位于 https://github.com/flutter/flutter/pull/98520

* Hide toolbar when selection is out of view by @Renzo-Olivares in https://github.com/flutter/flutter/pull/98152

  当选择不在视图中时隐藏工具栏，作者为 https://github.com/flutter/flutter/pull/98152 中的 @Renzo-Olivares

* Add explanation to ChangeNotifier by @chunhtai in https://github.com/flutter/flutter/pull/98295

  在 https://github.com/flutter/flutter/pull/98295 中通过 @chunhtai 添加对 ChangeNotifier 的解释

* Dismiss text selection toolbar with ESC by @markusaksli-nc in https://github.com/flutter/flutter/pull/98511

  通过 https://github.com/flutter/flutter/pull/98511 中的 @markusaksli-nc 使用 ESC 关闭文本选择工具栏

* Dismiss Autocomplete with ESC by @markusaksli-nc in https://github.com/flutter/flutter/pull/97790

  通过 @markusaksli-nc 在 https://github.com/flutter/flutter/pull/97790 中使用 ESC 取消自动完成

* Revert "Dismiss text selection toolbar with ESC" by @markusaksli-nc in https://github.com/flutter/flutter/pull/98600

  恢复 https://github.com/flutter/flutter/pull/98600 中的 @markusaksli-nc 的“使用 ESC 关闭文本选择工具栏”

* Dismiss Modal Barrier on `handleTapCancel`  by @TahaTesser in https://github.com/flutter/flutter/pull/98191

  通过 https://github.com/flutter/flutter/pull/98191 中的 @TahaTesser 消除 `handleTapCancel` 上的模态障碍

* Remove unused parameter and consequently unused variable by @mateusfccp in https://github.com/flutter/flutter/pull/98428

  通过 https://github.com/flutter/flutter/pull/98428 中的 @mateusfccp 删除未使用的参数以及因此未使用的变量

* Update example code and docs for InteractiveViewer.builder by @goderbauer in https://github.com/flutter/flutter/pull/98623

  通过 https://github.com/flutter/flutter/pull/98623 中的 @goderbauer 更新 InteractiveViewer.builder 的示例代码和文档

* Remove deprecated RectangularSliderTrackShape.disabledThumbGapWidth by @Piinks in https://github.com/flutter/flutter/pull/98613

  在 https://github.com/flutter/flutter/pull/98613 中通过 @Piinks 删除已弃用的 RectangleSliderTrackShape.disabledThumbGapWidth

* Update stretching overscroll clip behavior by @Piinks in https://github.com/flutter/flutter/pull/97678

  通过 https://github.com/flutter/flutter/pull/97678 中的 @Piinks 更新拉伸过度滚动剪辑行为

* Remove deprecated UpdateLiveRegionEvent by @Piinks in https://github.com/flutter/flutter/pull/98615

  通过 https://github.com/flutter/flutter/pull/98615 中的 @Piinks 删除已弃用的 UpdateLiveRegionEvent

* Remove `clipBehavior == Clip.none` conditions by @TahaTesser in https://github.com/flutter/flutter/pull/98503

  通过 https://github.com/flutter/flutter/pull/98503 中的 @TahaTesser 删除 `clipBehavior == Clip.none` 条件

* Show `RefreshIndicator` on top when scroll's axis direction is up (matching native behaviour) by @TahaTesser in https://github.com/flutter/flutter/pull/93779

  当滚动轴方向向上时，通过 https://github.com/flutter/flutter/pull/93779 中的 @TahaTesser 显示 `RefreshIndicator` 在顶部（匹配本机行为）

* Remove deprecated VelocityTracker constructor by @Piinks in https://github.com/flutter/flutter/pull/98541

  通过 https://github.com/flutter/flutter/pull/98541 中的 @Piinks 删除已弃用的 VelocityTracker 构造函数

* Add more tests to slider to avoid future breakages by @goderbauer in https://github.com/flutter/flutter/pull/98772

  通过 https://github.com/flutter/flutter/pull/98772 中的 @goderbauer 添加更多测试到滑块以避免将来的损坏

* Revert "Add more tests to slider to avoid future breakages" by @zanderso in https://github.com/flutter/flutter/pull/98783

  恢复 https://github.com/flutter/flutter/pull/98783 中 @zanderso 的“向滑块添加更多测试以避免将来损坏”

* Spacebar and enter in EditableText work with Inkwells by @justinmc in https://github.com/flutter/flutter/pull/98469

  空格键并输入 EditableText，通过 @justinmc 在 https://github.com/flutter/flutter/pull/98469 中使用 Inkwells

* Avoid unnecessary lambdas in SelectionOverlay.showHandles() by @tgucio in https://github.com/flutter/flutter/pull/98912

  避免 https://github.com/flutter/flutter/pull/98912 中的 @tgucio 在 SelectionOverlay.showHandles() 中使用不必要的 lambda

* Update comments for chip tests by @RoyARG02 in https://github.com/flutter/flutter/pull/97476

  更新 https://github.com/flutter/flutter/pull/97476 中 @RoyARG02 的芯片测试注释

* Added optional parameter keyboardType to showDatePicker by @kirolous-nashaat in https://github.com/flutter/flutter/pull/93439

  通过 https://github.com/flutter/flutter/pull/93439 中的 @kirolous-nashaat 添加可选参数 KeyboardType 到 showDatePicker

* Fix getOffsetForCaret to return correct value if contains widget span by @chunhtai in https://github.com/flutter/flutter/pull/98542

  修复 getOffsetForCaret 以在 https://github.com/flutter/flutter/pull/98542 中包含 widget span by @chunhtai 时返回正确的值

* Reland "Add more tests to slider to avoid future breakages (#98772)" by @goderbauer in https://github.com/flutter/flutter/pull/98936

  Reland“向滑块添加更多测试以避免将来损坏（#98772）”，作者：@goderbauer，位于 https://github.com/flutter/flutter/pull/98936

* Enable use_if_null_to_convert_nulls_to_bools lint by @tgucio in https://github.com/flutter/flutter/pull/98753

  通过 https://github.com/flutter/flutter/pull/98753 中的 @tgucio 启用 use_if_null_to_convert_nulls_to_bools lint

* Remove redundant hide handles API from TextSelectionDelegate by @chunhtai in https://github.com/flutter/flutter/pull/98944

  通过 https://github.com/flutter/flutter/pull/98944 中的 @chunhtai 从 TextSelectionDelegate 中删除多余的隐藏句柄 API

* Test that render object changed its visual appearance after texture is create by @blasten in https://github.com/flutter/flutter/pull/98622

  测试渲染对象在 https://github.com/flutter/flutter/pull/98622 中的 @blasten 创建纹理后更改其视觉外观

* Add actionsOverflowAlignment parameter to dialog by @himamis in https://github.com/flutter/flutter/pull/95995

  通过 https://github.com/flutter/flutter/pull/95995 中的 @himamis 将 actionsOverflowAlignment 参数添加到对话框

* Fixed some issues and clarified the docs for ReorderableListView. by @darrenaustin in https://github.com/flutter/flutter/pull/98954

  修复了一些 issue 并澄清了 ReorderableListView 的文档。通过 @darrenaustin 在 https://github.com/flutter/flutter/pull/98954

* Remove deprecated DayPicker and MonthPicker by @Piinks in https://github.com/flutter/flutter/pull/98543

  通过 https://github.com/flutter/flutter/pull/98543 中的 @Piinks 删除已弃用的 DayPicker 和 MonthPicker

* Adds `onReorderStart` and `onReorderEnd` arguments to `ReorderableList`. by @werainkhatri in https://github.com/flutter/flutter/pull/96049

  将 `onReorderStart` 和 `onReorderEnd` 参数添加到 `ReorderableList`。通过 @werainkhatri 在 https://github.com/flutter/flutter/pull/96049

* Correct the MediaQuery test name by @nt4f04uNd in https://github.com/flutter/flutter/pull/98984

  在 https://github.com/flutter/flutter/pull/98984 中通过 @nt4f04uNd 更正 MediaQuery 测试名称

* Revert "Remove redundant hide handles API from TextSelectionDelegate … by @chunhtai in https://github.com/flutter/flutter/pull/99008

  恢复“从 TextSelectionDelegate 中删除多余的隐藏句柄 API …，作者为 https://github.com/flutter/flutter/pull/99008 中的 @chunhtai

* Clean up ClipboardStatusNotifier by @chunhtai in https://github.com/flutter/flutter/pull/98951

  通过 https://github.com/flutter/flutter/pull/98951 中的 @chunhtai 清理 ClipboardStatusNotifier

* Use int for PlaceholderSpan.placeholderCodeUnit by @tgucio in https://github.com/flutter/flutter/pull/98971

  通过 https://github.com/flutter/flutter/pull/98971 中的 @tgucio 使用 int 表示 PlaceholderSpan.placeholderCodeUnit

* Draggable can be accepted when the data is null by @xu-baolin in https://github.com/flutter/flutter/pull/97355

  https://github.com/flutter/flutter/pull/97355 中的 @xu-baolin 可以在数据为 null 时接受 Draggable

* Call bringIntoView after RenderEditable updates on paste by @tgucio in https://github.com/flutter/flutter/pull/98604

  在 https://github.com/flutter/flutter/pull/98604 中的 @tgucio 粘贴后，在 RenderEditable 更新后调用 BringIntoView

* Assert golden files use the right extension by @Piinks in https://github.com/flutter/flutter/pull/99016

  断言黄金文件使用 https://github.com/flutter/flutter/pull/99016 中的 @Piinks 正确的扩展名

* Revert "Assert golden files use the right extension" by @hterkelsen in https://github.com/flutter/flutter/pull/99075

  恢复 https://github.com/flutter/flutter/pull/99075 中 @hterkelsen 的“断言黄金文件使用正确的扩展名”

* Pasting collapses the selection and puts it after the pasted content by @justinmc in https://github.com/flutter/flutter/pull/98679

  粘贴会折叠所选内容，并将其放在 https://github.com/flutter/flutter/pull/98679 中的 @justinmc 粘贴的内容之后

* Correct font weight for Cupertino tab label by @SimonHausdorf in https://github.com/flutter/flutter/pull/90109

  https://github.com/flutter/flutter/pull/90109 中 @SimonHausdorf 的 Cupertino 选项卡标签的正确字体粗细

* adds `trackRadius` to `ScrollbarPainter` and `RawScrollbar` by @werainkhatri in https://github.com/flutter/flutter/pull/98018

  通过 https://github.com/flutter/flutter/pull/98018 中的 @werainkhatri 将 `trackRadius` 添加到 `ScrollbarPainter` 和 `RawScrollbar`

* Fix a Tabs crash when change the TabControllers by @xu-baolin in https://github.com/flutter/flutter/pull/98242

  修复 https://github.com/flutter/flutter/pull/98242 中的 @xu-baolin 更改 TabController 时 Tabs 崩溃的问题

* Re-land Assert golden files use the right extension by @Piinks in https://github.com/flutter/flutter/pull/99082

  重新登陆断言黄金文件使用 https://github.com/flutter/flutter/pull/99082 中的 @Piinks 的正确扩展名

* Do not crash if dispatch the mouse events before the tooltip overlay detached by @xu-baolin in https://github.com/flutter/flutter/pull/97268

  如果在 https://github.com/flutter/flutter/pull/97268 中的 @xu-baolin 分离的工具提示覆盖层之前分派鼠标事件，则不会崩溃

* [ReorderableListView] Add `footer` by @TahaTesser in https://github.com/flutter/flutter/pull/92086

  [ReorderableListView] 在 https://github.com/flutter/flutter/pull/92086 中通过 @TahaTesser 添加 `footer`

* Add `clipBehavior` to `Snackbar` by @TahaTesser in https://github.com/flutter/flutter/pull/98252

  通过 https://github.com/flutter/flutter/pull/98252 中的 @TahaTesser 将 `clipBehavior` 添加到 `Snackbar`

* Add Widget of the Week links by @craiglabenz in https://github.com/flutter/flutter/pull/99178

  在 https://github.com/flutter/flutter/pull/99178 中添加 @craiglabenz 的本周链接 Widget

* feat: Added docstring examples to AnimatedBuilder and ChangeNotifier by @albertodev01 in https://github.com/flutter/flutter/pull/98628

  壮举：通过 https://github.com/flutter/flutter/pull/98628 中的 @albertodev01 将文档字符串示例添加到 AnimatedBuilder 和 ChangeNotifier

* [Keyboard] Correctly convert down events that are immediately synthesized released by @dkwingsmt in https://github.com/flutter/flutter/pull/99200

  [键盘] 正确转换https://github.com/flutter/flutter/pull/99200中@dkwingsmt发布的立即合成的向下事件

* Updated to v0.86 of the Material Design tokens. by @darrenaustin in https://github.com/flutter/flutter/pull/99292

  更新至 Material Design 令牌 v0.86。通过 https://github.com/flutter/flutter/pull/99292 中的 @darrenaustin

* Add NavigationBar dartpad example  by @maheshmnj in https://github.com/flutter/flutter/pull/97046

  通过 https://github.com/flutter/flutter/pull/97046 中的 @maheshmnj 添加 NavigationBar dartpad 示例

* Migrates packages/flutter to from `hashValues` to `Object.hash` by @werainkhatri in https://github.com/flutter/flutter/pull/96109

  通过 https://github.com/flutter/flutter/pull/96109 中的 @werainkhatri 将包/flutter 从 `hashValues` 迁移到 `Object.hash`

* Added viewport fraction parameter to tabView by @Hari-07 in https://github.com/flutter/flutter/pull/98512

  通过 https://github.com/flutter/flutter/pull/98512 中的 @Hari-07 将视口分数参数添加到 tabView

* [framework] improve Notification API performance by skipping full Element tree traversal by @jonahwilliams in https://github.com/flutter/flutter/pull/98451

  [框架] 通过 https://github.com/flutter/flutter/pull/98451 中的 @jonahwilliams 跳过完整的元素树遍历来提高通知 API 性能

* Remove redundant properties passed to _Editable by @Renzo-Olivares in https://github.com/flutter/flutter/pull/99192

  删除 https://github.com/flutter/flutter/pull/99192 中的 @Renzo-Olivares 传递给 _Editable 的冗余属性

* Revert "Clean up ClipboardStatusNotifier (#98951)" by @chunhtai in https://github.com/flutter/flutter/pull/99361

  恢复 https://github.com/flutter/flutter/pull/99361 中 @chunhtai 的“清理 ClipboardStatusNotifier (#98951)”

* Reland "Dismiss text selection toolbar with ESC" by @markusaksli-nc in https://github.com/flutter/flutter/pull/98995

  重新登陆 https://github.com/flutter/flutter/pull/98995 中的 @markusaksli-nc 的“使用 ESC 关闭文本选择工具栏”

* Fix a Scrollbar hittest penetration issue by @xu-baolin in https://github.com/flutter/flutter/pull/99328

  修复了 https://github.com/flutter/flutter/pull/99328 中的 @xu-baolin 的滚动条命中测试渗透 issue

* Revert "Draggable can be accepted when the data is null" by @Piinks in https://github.com/flutter/flutter/pull/99419

  恢复 https://github.com/flutter/flutter/pull/99419 中的 @Piinks 的“当数据为空时可以接受 Draggable”

* Limit overscroll stretching by @Piinks in https://github.com/flutter/flutter/pull/99364

  通过 https://github.com/flutter/flutter/pull/99364 中的 @Piinks 限制过度滚动拉伸

* Simplify SafeArea test for maintainBottomViewPadding to ensure maintainBottomViewPadding is always respected by @joellurcook in https://github.com/flutter/flutter/pull/97646

  简化维护BottomViewPadding 的 SafeArea 测试，以确保 https://github.com/flutter/flutter/pull/97646 中的 @joellurcook 始终遵循维护BottomViewPadding

* Specify widget height in EditableText shortcuts tests by @tgucio in https://github.com/flutter/flutter/pull/98607

  在 https://github.com/flutter/flutter/pull/98607 中的 @tgucio 的 EditableText 快捷方式测试中指定 widget 高度

* More beautiful linear_gradient sample by @goderbauer in https://github.com/flutter/flutter/pull/99298

  https://github.com/flutter/flutter/pull/99298 中 @goderbauer 提供的更漂亮的 Linear_gradient 示例

* `CupertinoSliverNavigationBar`: Add example by @TahaTesser in https://github.com/flutter/flutter/pull/99384

  `CupertinoSliverNavigationBar`：在 https://github.com/flutter/flutter/pull/99384 中添加 @TahaTesser 的示例

* Add material localizations for keyboard keys used for shortcut descriptions in menus. by @gspencergoog in https://github.com/flutter/flutter/pull/99020

  添加用于菜单中快捷方式描述的键盘按键的材质本地化。通过 https://github.com/flutter/flutter/pull/99020 中的 @gspencergoog

* Deprecate MaterialButtonWithIconMixin by @Piinks in https://github.com/flutter/flutter/pull/99088

  在 https://github.com/flutter/flutter/pull/99088 中通过 @Piinks 弃用 MaterialButtonWithIconMixin

* Use `PlatformDispatcher.instance` over `window` where possible by @goderbauer in https://github.com/flutter/flutter/pull/99496

  尽可能通过 https://github.com/flutter/flutter/pull/99496 中的 @goderbauer 使用 `PlatformDispatcher.instance` 而不是 `window`

* Reland clean up clipboard. by @chunhtai in https://github.com/flutter/flutter/pull/99363

  重新兰清理剪贴板。通过 @chunhtai 在 https://github.com/flutter/flutter/pull/99363

* Use `BindingBase.platformDispatcher` over `BindingBase.window` where possible by @goderbauer in https://github.com/flutter/flutter/pull/99443

  尽可能通过 https://github.com/flutter/flutter/pull/99443 中的 @goderbauer 使用 `BindingBase.platformDispatcher` 而不是 `BindingBase.window`

* Improve documentation of  `EditableText`/`TextField` callbacks by @TahaTesser in https://github.com/flutter/flutter/pull/98414

  通过 https://github.com/flutter/flutter/pull/98414 中的 @TahaTesser 改进 `EditableText`/`TextField` 回调的文档

* complete migration of flutter repo to Object.hash* by @werainkhatri in https://github.com/flutter/flutter/pull/99505

  https://github.com/flutter/flutter/pull/99505 中的 @werainkhatri 将 flutter 存储库完全迁移到 Object.hash*

* Migrate `Dialog` to Material 3 by @TahaTesser in https://github.com/flutter/flutter/pull/98919

  通过 https://github.com/flutter/flutter/pull/98919 中的 @TahaTesser 将 `Dialog` 迁移到 Material 3

* Improve container widget by @r-mzy47 in https://github.com/flutter/flutter/pull/98389

  通过 https://github.com/flutter/flutter/pull/98389 中的 @r-mzy47 改进容器 widget

* CupertinoButton: Add clickable cursor on web by @TahaTesser in https://github.com/flutter/flutter/pull/96863

  CupertinoButton：通过 @TahaTesser 在 https://github.com/flutter/flutter/pull/96863 中添加可点击的光标

* [framework] add gesture settings to draggable by @jonahwilliams in https://github.com/flutter/flutter/pull/99567

  [框架] https://github.com/flutter/flutter/pull/99567 中的 @jonahwilliams 添加手势设置以拖动

* Make popup menu position configurable by @TahaTesser in https://github.com/flutter/flutter/pull/98979

  通过 https://github.com/flutter/flutter/pull/98979 中的 @TahaTesser 来配置弹出菜单位置

* Re-invoke DismissIntent in Autocomplete if ignored by @markusaksli-nc in https://github.com/flutter/flutter/pull/99403

  如果被 https://github.com/flutter/flutter/pull/99403 中的 @markusaksli-nc 忽略，则重新调用 Autocomplete 中的 DismissIntent

* Remove package:typed_data from package:flutter dependencies by @jonahwilliams in https://github.com/flutter/flutter/pull/99604

  通过 https://github.com/flutter/flutter/pull/99604 中的 @jonahwilliams 从 package:flutter 依赖项中删除 package:typed_data

* Remove deprecated RenderObjectElement methods by @Piinks in https://github.com/flutter/flutter/pull/98616

  通过 https://github.com/flutter/flutter/pull/98616 中的 @Piinks 删除已弃用的 RenderObjectElement 方法

* CupertinoTabBar: Add clickable cursor on web by @TahaTesser in https://github.com/flutter/flutter/pull/96996

  CupertinoTabBar：通过https://github.com/flutter/flutter/pull/96996中的@TahaTesser在网络上添加可点击光标

* Remove deprecated Overflow and Stack.overflow by @Piinks in https://github.com/flutter/flutter/pull/98583

  通过 https://github.com/flutter/flutter/pull/98583 中的 @Piinks 删除已弃用的 Overflow 和 Stack.overflow

* Remove deprecated CupertinoTextField, TextField, TextFormField maxLengthEnforced by @Piinks in https://github.com/flutter/flutter/pull/98539

  删除 https://github.com/flutter/flutter/pull/98539 中 @Piinks 已弃用的 CupertinoTextField、TextField、TextFormField maxLengthEnforced

* Fix: Date picker interactive sample not loading  by @maheshmnj in https://github.com/flutter/flutter/pull/99401

  修复：https://github.com/flutter/flutter/pull/99401 中的 @maheshmnj 未加载日期选择器交互式示例

* Add Foldable support for modal routes by @andreidiaconu in https://github.com/flutter/flutter/pull/92909

  通过 https://github.com/flutter/flutter/pull/92909 中的 @andreidiaconu 添加对模态路由的可折叠支持

* Revert "Remove deprecated CupertinoTextField, TextField, TextFormField maxLengthEnforced" by @Piinks in https://github.com/flutter/flutter/pull/99768

  恢复 https://github.com/flutter/flutter/pull/99768 中 @Piinks 的“删除已弃用的 CupertinoTextField、TextField、TextFormField maxLengthEnforced”

* Update Material tokens to v0.88 by @darrenaustin in https://github.com/flutter/flutter/pull/99568

  通过 https://github.com/flutter/flutter/pull/99568 中的 @darrenaustin 将 Material 令牌更新到 v0.88

* Remove deprecated OutlineButton by @Piinks in https://github.com/flutter/flutter/pull/98546

  通过 https://github.com/flutter/flutter/pull/98546 中的 @Piinks 删除已弃用的 OutlineButton

* Add the refresh rate fields to perf_test by @cyanglaz in https://github.com/flutter/flutter/pull/99710

  通过 https://github.com/flutter/flutter/pull/99710 中的 @cyanglaz 将刷新率字段添加到 perf_test

* Re-land removal of maxLengthEnforced deprecation by @Piinks in https://github.com/flutter/flutter/pull/99787

  由 @Piinks 在 https://github.com/flutter/flutter/pull/99787 中重新删除 maxLengthEnforced 弃用

* Revert "Add the refresh rate fields to perf_test" by @zanderso in https://github.com/flutter/flutter/pull/99801

  恢复 https://github.com/flutter/flutter/pull/99801 中 @zanderso 的“将刷新率字段添加到 perf_test”

* Avoid calling `performLayout` when only the relayout boundary is different by @LongCatIsLooong in https://github.com/flutter/flutter/pull/99056

  当只有重新布局边界与 https://github.com/flutter/flutter/pull/99056 中的 @LongCatIsLooong 不同时，避免调用 `performLayout`

* remove unnecessary null check by @a14n in https://github.com/flutter/flutter/pull/99507

  通过 https://github.com/flutter/flutter/pull/99507 中的 @a14n 删除不必要的空检查

* updateEditingValueWithDeltas snippet docs fix by @justinmc in https://github.com/flutter/flutter/pull/99570

  updateEditingValueWithDeltas 片段文档由 https://github.com/flutter/flutter/pull/99570 中的 @justinmc 修复

* Updated tokens to v0.90. by @darrenaustin in https://github.com/flutter/flutter/pull/99782

  将令牌更新至 v0.90。通过 @darrenaustin 在 https://github.com/flutter/flutter/pull/99782

* Fix `ColorScheme.shadow` to default to black even for dark themes. by @darrenaustin in https://github.com/flutter/flutter/pull/99722

  将 `ColorScheme.shadow` 修复为默认为黑色，即使对于深色主题也是如此。通过 @darrenaustin 在 https://github.com/flutter/flutter/pull/99722

* Remove deprecated RenderEditable.onSelectionChanged by @Piinks in https://github.com/flutter/flutter/pull/98582

  删除 https://github.com/flutter/flutter/pull/98582 中 @Piinks 已弃用的 RenderEditable.onSelectionChanged

* [Material] Create an InkSparkle splash effect that matches the Material 3 ripple effect by @clocksmith in https://github.com/flutter/flutter/pull/99731

  [材质] 创建一个 InkSparkle 飞溅效果，与 https://github.com/flutter/flutter/pull/99731 中的 @clocksmith 的 Material 3 波纹效果相匹配

* Remove expired ThemeData deprecations by @Piinks in https://github.com/flutter/flutter/pull/98578

  删除 https://github.com/flutter/flutter/pull/98578 中 @Piinks 过期的 ThemeData 弃用

* Update `NavigationRail` to support Material 3 tokens by @darrenaustin in https://github.com/flutter/flutter/pull/99171

  通过 https://github.com/flutter/flutter/pull/99171 中的 @darrenaustin 更新 `NavigationRail` 以支持 Material 3 代币

* Revert "Remove expired ThemeData deprecations" by @Piinks in https://github.com/flutter/flutter/pull/99920

  恢复 https://github.com/flutter/flutter/pull/99920 中 @Piinks 的“删除过期的 ThemeData 弃用”

* Revert "[web] roll Chromium dep to 96.2" by @zanderso in https://github.com/flutter/flutter/pull/99949

  将“[web] roll Chromium dep to 96.2”由 @zanderso 在 https://github.com/flutter/flutter/pull/99949 中恢复

* Fix/text containing finder work with rich texts by @valentinmarq in https://github.com/flutter/flutter/pull/99682

  修复/文本包含由 @valentinmarq 在 https://github.com/flutter/flutter/pull/99682 中处理富文本的查找器

* Update semantics live region documentation by @jjoelson in https://github.com/flutter/flutter/pull/99987

  通过 https://github.com/flutter/flutter/pull/99987 中的 @jjoelson 更新语义实时区域文档

* Fix AndroidView offset and resize by @blasten in https://github.com/flutter/flutter/pull/99888

  在 https://github.com/flutter/flutter/pull/99888 中修复 AndroidView 偏移并通过 @blasten 调整大小

* Revert "Avoid calling `performLayout` when only the relayout boundary is different" by @LongCatIsLooong in https://github.com/flutter/flutter/pull/100068

  恢复 https://github.com/flutter/flutter/pull/100068 中 @LongCatIsLooong 的“当只有重新布局边界不同时避免调用 `performLayout`”

* Make NavigationRail.selectedIndex nullable by @Jjagg in https://github.com/flutter/flutter/pull/95336

  通过 https://github.com/flutter/flutter/pull/95336 中的 @Jjagg 使 NavigationRail.selectedIndex 可为空

* Revert "Do not eagerly allocate inherited widget caches when initializing element tree" by @jonahwilliams in https://github.com/flutter/flutter/pull/100152

  恢复 https://github.com/flutter/flutter/pull/100152 中的 @jonahwilliams 的“初始化元素树时不要急切分配继承的 widget 缓存”

* Add 'mouseCursor' to TextFormField by @SahajRana in https://github.com/flutter/flutter/pull/99822

  通过 https://github.com/flutter/flutter/pull/99822 中的 @SahajRana 将“mouseCursor”添加到 TextFormField

* Web: treat modifier key without location by @moko256 in https://github.com/flutter/flutter/pull/98460

  Web：在 https://github.com/flutter/flutter/pull/98460 中通过 @moko256 处理没有位置的修饰键

* Always use texture layer when displaying an Android view by @blasten in https://github.com/flutter/flutter/pull/100091

  在 https://github.com/flutter/flutter/pull/100091 中显示 @blasten 的 Android 视图时，始终使用纹理层

* Revert "Always use texture layer when displaying an Android view" by @zanderso in https://github.com/flutter/flutter/pull/100222

  恢复 https://github.com/flutter/flutter/pull/100222 中 @zanderso 的“显示 Android 视图时始终使用纹理层”

* Add missing `expansionTileTheme` theme copyWith test by @TahaTesser in https://github.com/flutter/flutter/pull/100165

  在 https://github.com/flutter/flutter/pull/100165 中添加缺少的 `expansionTileTheme` 主题 copyWith 测试 @TahaTesser

* docs(flutter_test): fix mention of non-existing `matchesSemanticsNode` by @daadu in https://github.com/flutter/flutter/pull/99659

  文档（flutter_test）：修复 https://github.com/flutter/flutter/pull/99659 中 @daadu 对不存在的 `matchesSemanticsNode` 的提及

* Remove unnecessary ignore: override_on_non_overriding_member by @brianquinlan in https://github.com/flutter/flutter/pull/99793

  删除不必要的忽略： https://github.com/flutter/flutter/pull/99793 中的 @brianquinlan 的 override_on_non_overriding_member

* Disable Gold post-submit failures by @Piinks in https://github.com/flutter/flutter/pull/100308

  通过 https://github.com/flutter/flutter/pull/100308 中的 @Piinks 禁用 Gold 提交后失败

* Reland: "Always use texture layer when displaying an Android view" by @blasten in https://github.com/flutter/flutter/pull/100237

  重新兰：“显示 Android 视图时始终使用纹理层”，作者：@blasten，位于 https://github.com/flutter/flutter/pull/100237

* Roll chrome 96 attempt 2 by @yjbanov in https://github.com/flutter/flutter/pull/100073

  由 @yjbanov 在 https://github.com/flutter/flutter/pull/100073 中滚动 chrome 96 尝试 2

* Refractor `compute` by @jellynoone in https://github.com/flutter/flutter/pull/99527

  https://github.com/flutter/flutter/pull/99527 中的 @jellynoone 折射器 `compute`

* Disable post-submit Gold failures entirely by @Piinks in https://github.com/flutter/flutter/pull/100332

  通过 https://github.com/flutter/flutter/pull/100332 中的 @Piinks 完全禁用提交后 Gold 失败

* Add support for surface tint color overlays to `Material` widget. by @darrenaustin in https://github.com/flutter/flutter/pull/100036

  向 `Material` widget 添加对表面色调颜色叠加的支持。通过 https://github.com/flutter/flutter/pull/100036 中的 @darrenaustin

* Material text selection menu should not show pointer cursor by @justinmc in https://github.com/flutter/flutter/pull/100248

  材质文本选择菜单不应通过 https://github.com/flutter/flutter/pull/100248 中的 @justinmc 显示指针光标

* Revert "[framework] don't hit test for system nav bar or system chrome on desktop" by @jonahwilliams in https://github.com/flutter/flutter/pull/100263

  恢复 https://github.com/flutter/flutter/pull/100263 中的 @jonahwilliams 的“[框架]不要在桌面上进行系统导航栏或系统镶边的测试”

* [Material] Use InkSparkle for splashFactory in ThemeData when useMaterial3 is true for Android non-web runtimes by @clocksmith in https://github.com/flutter/flutter/pull/99882

  [Material] 当 https://github.com/flutter/flutter/pull/99882 中的 @clocksmith 对于 Android 非 Web 运行时 useMaterial3 为 true 时，在 ThemeData 中使用 InkSparkle 进行 flashFactory

* Reorganize compute docs and add sample code by @goderbauer in https://github.com/flutter/flutter/pull/100253

  重新组织计算文档并通过 https://github.com/flutter/flutter/pull/100253 中的 @goderbauer 添加示例代码

* Fix `PopupMenuButton`'s `IconButton` not inheriting `IconTheme` size by @TahaTesser in https://github.com/flutter/flutter/pull/100199

  修复 `PopupMenuButton` 的 `IconButton` 不通过 @TahaTesser 继承 `IconTheme` 大小 https://github.com/flutter/flutter/pull/100199

* Hide toolbar after select all on desktop by @justinmc in https://github.com/flutter/flutter/pull/100261

  通过 https://github.com/flutter/flutter/pull/100261 中的 @justinmc 选择桌面上的所有内容后隐藏工具栏

* [framework] Remove danger zone  by @jonahwilliams in https://github.com/flutter/flutter/pull/100246

  [框架] 通过 https://github.com/flutter/flutter/pull/100246 中的 @jonahwilliams 删除危险区域

* Add fadeDuration back to TextSelectionOverlay by @chunhtai in https://github.com/flutter/flutter/pull/100381

  通过 https://github.com/flutter/flutter/pull/100381 中的 @chunhtai 将 fadeDuration 添加回 TextSelectionOverlay

* Fix wrong documentation: There is no `LeaderLayer._lastOffset` anymore by @fzyzcjy in https://github.com/flutter/flutter/pull/100300

  修复错误的文档： https://github.com/flutter/flutter/pull/100300 中的 @fzyzcjy 不再有 `LeaderLayer._lastOffset`

* Introduce Theme extensions by @guidezpl in https://github.com/flutter/flutter/pull/98033

  在 https://github.com/flutter/flutter/pull/98033 中引入 @guidezpl 的主题扩展

* `CupertinoSwitch`: Add clickable cursor for web by @TahaTesser in https://github.com/flutter/flutter/pull/99554

  `CupertinoSwitch`：通过 https://github.com/flutter/flutter/pull/99554 中的 @TahaTesser 添加可点击的网页光标

* Typo in EditableText strutStyle by @MrBirb in https://github.com/flutter/flutter/pull/100474

  https://github.com/flutter/flutter/pull/100474 中 @MrBirb 的 EditableText strutStyle 中的拼写错误

* Fix `deprecated_new_in_comment_reference` for `material` library by @guidezpl in https://github.com/flutter/flutter/pull/100289

  通过 https://github.com/flutter/flutter/pull/100289 中的 @guidezpl 修复 `material` 库的 `deprecated_new_in_comment_reference`

* Fix stretch edge case by @Piinks in https://github.com/flutter/flutter/pull/99365

  通过 https://github.com/flutter/flutter/pull/99365 中的 @Piinks 修复拉伸边缘情况

* Reland "Add the refresh rate fields to perf_test #99710" by @cyanglaz in https://github.com/flutter/flutter/pull/99854

  重新登陆 https://github.com/flutter/flutter/pull/99854 中的 @cyanglaz 的“将刷新率字段添加到 perf_test #99710”

* Put stretch indicator behind m3 flag by @Piinks in https://github.com/flutter/flutter/pull/100234

  将拉伸指示器置于 https://github.com/flutter/flutter/pull/100234 中的 @Piinks 后面的 m3 标志后面

* Re-land text selection theme clean up by @Piinks in https://github.com/flutter/flutter/pull/99927

  通过 https://github.com/flutter/flutter/pull/99927 中的 @Piinks 重新着陆文本选择主题清理

* Hide autocomplete menu on select. by @LongCatIsLooong in https://github.com/flutter/flutter/pull/100251

  选择时隐藏自动完成菜单。通过 @LongCatIsLooong 在 https://github.com/flutter/flutter/pull/100251

* Add `surfaceTint` color to the ColorScheme. by @darrenaustin in https://github.com/flutter/flutter/pull/100153

  将 `surfaceTint` 颜色添加到 ColorScheme。通过 https://github.com/flutter/flutter/pull/100153 中的 @darrenaustin

* Revert "Re-land text selection theme clean up" by @Piinks in https://github.com/flutter/flutter/pull/100564

  恢复 https://github.com/flutter/flutter/pull/100564 中 @Piinks 的“重新着陆文本选择主题清理”

* Make `Tooltip` state class public by @TahaTesser in https://github.com/flutter/flutter/pull/100553

  通过 https://github.com/flutter/flutter/pull/100553 中的 @TahaTesser 将 `Tooltip` 状态类公开

* [RenderAnimatedSize] Resume interrupted resizing animation on attach by @LongCatIsLooong in https://github.com/flutter/flutter/pull/100519

  [RenderAnimatedSize] 在 https://github.com/flutter/flutter/pull/100519 中通过 @LongCatIsLooong 恢复附加时中断的调整大小动画

* Migrate `Card` widget to support Material 3 by @darrenaustin in https://github.com/flutter/flutter/pull/100532

  通过 https://github.com/flutter/flutter/pull/100532 中的 @darrenaustin 迁移 `Card` widget 以支持 Material 3

* Add back Gold `passfail` by @Piinks in https://github.com/flutter/flutter/pull/100576

  在 https://github.com/flutter/flutter/pull/100576 中添加 @Piinks 的 Gold `passfail`

* [framework] use Uint8List for SMC by @jonahwilliams in https://github.com/flutter/flutter/pull/100582

  [框架] https://github.com/flutter/flutter/pull/100582 中的 @jonahwilliams 使用 Uint8List 进行 SMC

* Fix a ModalbottomSheet bug by @xu-baolin in https://github.com/flutter/flutter/pull/99970

  通过 https://github.com/flutter/flutter/pull/99970 中的 @xu-baolin 修复 ModalbottomSheet 错误

* Add `HitTestBehavior` property to `MouseRegion` by @xu-baolin in https://github.com/flutter/flutter/pull/100405

  通过 https://github.com/flutter/flutter/pull/100405 中的 @xu-baolin 将 `HitTestBehavior` 属性添加到 `MouseRegion`

* Fix: fix the delay of showOnScreen animation when keyboard comes up. by @luckysmg in https://github.com/flutter/flutter/pull/99546

  修复：修复键盘出现时showOnScreen动画的延迟问题。通过 https://github.com/flutter/flutter/pull/99546 中的 @luckysmg

* Fix crash after paste and unmount by @justinmc in https://github.com/flutter/flutter/pull/100589

  修复 https://github.com/flutter/flutter/pull/100589 中的 @justinmc 粘贴和卸载后崩溃的问题

* Fix `compute` in unsound null safety debug mode by @jellynoone in https://github.com/flutter/flutter/pull/100544

  通过 https://github.com/flutter/flutter/pull/100544 中的 @jellynoone 修复 `compute` 处于不健全的空安全调试模式

* Updated tokens to v0.92. by @darrenaustin in https://github.com/flutter/flutter/pull/100599

  将令牌更新至 v0.92。通过 https://github.com/flutter/flutter/pull/100599 中的 @darrenaustin

* Add child for placeholder widget by @M97Chahboun in https://github.com/flutter/flutter/pull/100372

  通过 https://github.com/flutter/flutter/pull/100372 中的 @M97Chahboun 添加占位符 widget 的子项

* Move `ListTileTheme` and its tests into separate classes and  add `visualDensity` to the `ListTileTheme` by @TahaTesser in https://github.com/flutter/flutter/pull/100622

  将 `ListTileTheme` 及其测试移动到单独的类中，并通过 https://github.com/flutter/flutter/pull/100622 中的 @TahaTesser 将 `visualDensity` 添加到 `ListTileTheme`

* Revert "Reland: "Always use texture layer when displaying an Android view"" by @blasten in https://github.com/flutter/flutter/pull/100660

  恢复 https://github.com/flutter/flutter/pull/100660 中 @blasten 的“Reland：“显示 Android 视图时始终使用纹理层””

* fix hidden TextSpan with recognizer does not auto scroll by @chunhtai in https://github.com/flutter/flutter/pull/100494

  修复带有识别器的隐藏 TextSpan 不会自动滚动 https://github.com/flutter/flutter/pull/100494 中的 @chunhtai

* Fix typo (again) by @fzyzcjy in https://github.com/flutter/flutter/pull/100684

  （再次）修复 https://github.com/flutter/flutter/pull/100684 中的 @fzyzcjy 的拼写错误

* Fixes some widgets(`ListView.builder`, `GridView.builder` etc.) state-lose issue by @xu-baolin in https://github.com/flutter/flutter/pull/100547

  修复了 https://github.com/flutter/flutter/pull/100547 中 @xu-baolin 的一些 widgets(`ListView.builder`, `GridView.builder` 等) 状态丢失 issue

* Revert "Dismiss Modal Barrier on `handleTapCancel`  (#98191)" by @chunhtai in https://github.com/flutter/flutter/pull/100784

  恢复 https://github.com/flutter/flutter/pull/100784 中 @chunhtai 的“解除 `handleTapCancel` (#98191) 上的模态屏障”

* Check for mount after cut postframecallback by @justinmc in https://github.com/flutter/flutter/pull/100776

  检查 https://github.com/flutter/flutter/pull/100776 中 @justinmc 剪切后帧回调后的安装

* Editable text sends enableInteractiveSelection to text input client by @chunhtai in https://github.com/flutter/flutter/pull/100649

  可编辑文本通过 https://github.com/flutter/flutter/pull/100649 中的 @chunhtai 将enableInteractiveSelection发送到文本输入客户端

* Allow Drawer width to be customized by @TytaniumDev in https://github.com/flutter/flutter/pull/99777

  允许通过 https://github.com/flutter/flutter/pull/99777 中的 @TytaniumDev 自定义抽屉宽度

* Android Q transition by default by @AlexV525 in https://github.com/flutter/flutter/pull/98559

  Android Q 转换默认由 @AlexV525 在 https://github.com/flutter/flutter/pull/98559 中实现

* Revert "Android Q transition by default" by @zanderso in https://github.com/flutter/flutter/pull/100799

  在 https://github.com/flutter/flutter/pull/100799 中恢复 @zanderso 的“默认情况下 Android Q 转换”

* `Tooltip`: Add an example for `TooltipTriggerMode.manual` and add tests for existing `Tooltip` examples by @TahaTesser in https://github.com/flutter/flutter/pull/100554

  `Tooltip`：为 `TooltipTriggerMode.manual` 添加示例，并通过 @TahaTesser 在 https://github.com/flutter/flutter/pull/100554 中添加对现有 `Tooltip` 示例的测试

* Reland "Avoid calling `performLayout` when only the relayout boundary is different" by @LongCatIsLooong in https://github.com/flutter/flutter/pull/100581

  重新登陆 https://github.com/flutter/flutter/pull/100581 中的 @LongCatIsLooong 的“当只有重新布局边界不同时避免调用 `performLayout`”

* Fix `FollowerLayer` (`CompositedTransformFollower`) has null pointer error when using with some kinds of `Layer`s by @fzyzcjy in https://github.com/flutter/flutter/pull/100672

  修复 `FollowerLayer` (`CompositedTransformFollower`) 在与 https://github.com/flutter/flutter/pull/100672 中的 @fzyzcjy 的某些类型的 `Layer` 一起使用时出现空指针错误

* Consider backgroundBlendMode in equality of BoxDecoration by @goderbauer in https://github.com/flutter/flutter/pull/100788

  考虑 https://github.com/flutter/flutter/pull/100788 中的 @goderbauer 与 BoxDecoration 相等的 backgroundBlendMode

* ✨ Android Q transition by default by @AlexV525 in https://github.com/flutter/flutter/pull/100812

  ✨ Android Q 过渡默认由 @AlexV525 在 https://github.com/flutter/flutter/pull/100812 中实现

* `CupertinoActionSheet`/`CupertinoAlertDialog`: Add clickable cursor for web by @TahaTesser in https://github.com/flutter/flutter/pull/99548

  `CupertinoActionSheet`/`CupertinoAlertDialog`：通过 https://github.com/flutter/flutter/pull/99548 中的 @TahaTesser 添加可点击的网页光标

* `CupertinoSegmentedControl`/`CupertinoSlidingSegmentedControl`: Add clickable cursor for web by @TahaTesser in https://github.com/flutter/flutter/pull/99551

  `CupertinoSegmentedControl`/`CupertinoSlidingSegmentedControl`：通过 https://github.com/flutter/flutter/pull/99551 中的 @TahaTesser 添加可点击的网页光标

* Make popup menus avoid display features by @andreidiaconu in https://github.com/flutter/flutter/pull/98981

  通过 https://github.com/flutter/flutter/pull/98981 中的 @andreidiaconu 使弹出菜单避免显示功能

* Update performanceOverlay links  by @danagbemava-nc in https://github.com/flutter/flutter/pull/100894

  通过 https://github.com/flutter/flutter/pull/100894 中的 @danagbemava-nc 更新 PerformanceOverlay 链接

* Relands "Starts using the --source flag to compile the dart registrant. (#98046)" by @gaaclarke in https://github.com/flutter/flutter/pull/100572

  重新登陆“开始使用 --source 标志来编译 dart 注册者。(#98046)”，作者：@gaaclarke，位于 https://github.com/flutter/flutter/pull/100572

* Reland: "Use texture layer when displaying an Android view"  by @blasten in https://github.com/flutter/flutter/pull/100934

  重新兰：“显示 Android 视图时使用纹理层”，作者：@blasten，位于 https://github.com/flutter/flutter/pull/100934

* Revert "Reland: "Use texture layer when displaying an Android view" " by @zanderso in https://github.com/flutter/flutter/pull/100950

  恢复 https://github.com/flutter/flutter/pull/100950 中的 @zanderso 的“Reland：“显示 Android 视图时使用纹理层””

* Allow unknown device kind to scroll scrollables by @chunhtai in https://github.com/flutter/flutter/pull/100800

  允许未知设备类型通过 https://github.com/flutter/flutter/pull/100800 中的 @chunhtai 滚动可滚动项

* Reland: "Use texture layer when displaying an Android view" by @blasten in https://github.com/flutter/flutter/pull/100990

  重新兰：“显示 Android 视图时使用纹理层”，作者：@blasten，位于 https://github.com/flutter/flutter/pull/100990

* Add isActivatedBy to ShortcutActivator by @gspencergoog in https://github.com/flutter/flutter/pull/100167

  通过 https://github.com/flutter/flutter/pull/100167 中的 @gspencergoog 将 isActivatedBy 添加到 ShortcutActivator

* [Fonts] Update icons by @guidezpl in https://github.com/flutter/flutter/pull/100885

  [字体] 通过 https://github.com/flutter/flutter/pull/100885 中的 @guidezpl 更新图标

* Fix `IconTheme` is not inherited when `Icon` is provided to `ListTile.title` and `ListTile.subtitle` by @TahaTesser in https://github.com/flutter/flutter/pull/100757

  修复 https://github.com/flutter/flutter/pull/100757 中的 @TahaTesser 将 `Icon` 提供给 `ListTile.title` 和 `ListTile.subtitle` 时，不继承 `IconTheme`

* Minor improvements to `ThemeExtension` example by @guidezpl in https://github.com/flutter/flutter/pull/100693

  https://github.com/flutter/flutter/pull/100693 中的 @guidezpl 对 `ThemeExtension` 示例进行了小幅改进

* Fix `LicensePage` too much spacing padding when `applicationVersion` and  `applicationLegalese` are empty by @TahaTesser in https://github.com/flutter/flutter/pull/101030

  修复 https://github.com/flutter/flutter/pull/101030 中 `applicationVersion` 和 `applicationLegalese` 为 @TahaTesser 为空时 `LicensePage` 间距填充过多的问题

* Fix constructor doc for ScrollView.primary by @goderbauer in https://github.com/flutter/flutter/pull/100935

  通过 https://github.com/flutter/flutter/pull/100935 中的 @goderbauer 修复 ScrollView.primary 的构造函数文档

* Prepare `packages` (minus tools,framework) for `use_super_parameters` by @goderbauer in https://github.com/flutter/flutter/pull/100510

  通过 https://github.com/flutter/flutter/pull/100510 中的 @goderbauer 为 `use_super_parameters` 准备 `packages` （减去工具、框架）

* Material 3 common buttons should use sparkle splash effect on Android. by @darrenaustin in https://github.com/flutter/flutter/pull/101075

  Material 3 常见按钮应在 Android 上使用闪光飞溅效果。通过 https://github.com/flutter/flutter/pull/101075 中的 @darrenaustin

* Revert "Allow unknown device kind to scroll scrollables (#100800)" by @chunhtai in https://github.com/flutter/flutter/pull/101129

  恢复 https://github.com/flutter/flutter/pull/101129 中 @chunhtai 的“允许未知设备类型滚动可滚动项 (#100800)”

* Fix Local `DataTableTheme` not being inherited by `DataTable` Widget by @TahaTesser in https://github.com/flutter/flutter/pull/101112

  修复 https://github.com/flutter/flutter/pull/101112 中的 `DataTable` Widget 不被 @TahaTesser 继承的本地 `DataTableTheme`

* Refactor `ToggleButtons` (remove `RawMaterialButton`) by @TahaTesser in https://github.com/flutter/flutter/pull/99493

  通过 https://github.com/flutter/flutter/pull/99493 中的 @TahaTesser 重构 `ToggleButtons` （删除 `RawMaterialButton`）

* Reland "Allow unknown device kind to scroll scrollables (#100800)" by @chunhtai in https://github.com/flutter/flutter/pull/101301

  重新登陆“允许未知设备类型滚动可滚动项 (#100800)”，作者：@chunhtai，位于 https://github.com/flutter/flutter/pull/101301

* Fix crashes when current route parsing transactions are discarded by @chunhtai in https://github.com/flutter/flutter/pull/100657

  修复当前路由解析事务被 https://github.com/flutter/flutter/pull/100657 中的 @chunhtai 丢弃时发生的崩溃

* Implements a PlatformMenuBar widget and associated data structures by @gspencergoog in https://github.com/flutter/flutter/pull/100274

  通过 https://github.com/flutter/flutter/pull/100274 中的 @gspencergoog 实现 PlatformMenuBar widget 和关联的数据结构

* Made flag for debugging build time of user created widgets by @gaaclarke in https://github.com/flutter/flutter/pull/100926

  在 https://github.com/flutter/flutter/pull/100926 中为 @gaaclarke 创建的用户创建 widgets 的调试构建时间制作了标志

* [Cherrypick] Revert "Refactor `ToggleButtons` (remove `RawMaterialButton`) (#99493)" by @CaseyHillers in https://github.com/flutter/flutter/pull/101538

  [Cherrypick] 在 https://github.com/flutter/flutter/pull/101538 中恢复 @CaseyHillers 的“重构 `ToggleButtons`（删除 `RawMaterialButton`）（#99493）”

* [flutter_releases] Flutter beta 2.13.0-0.2.pre Framework Cherrypicks by @CaseyHillers in https://github.com/flutter/flutter/pull/102193

  [flutter_releases] Flutter beta 2.13.0-0.2.pre Framework Cherrypicks by @CaseyHillers in https://github.com/flutter/flutter/pull/102193

* [flutter_releases] Upgrade dwds to 12.1.1 by @christopherfujino in https://github.com/flutter/flutter/pull/101546

  [flutter_releases] 通过 https://github.com/flutter/flutter/pull/101546 中的 @christopherfujino 将 dwds 升级到 12.1.1


### Tooling

### 工装


* FFI plugin by @dcharkes in https://github.com/flutter/flutter/pull/94101

  https://github.com/flutter/flutter/pull/94101 中的 @dcharkes 的 FFI 插件

* Revert "FFI plugin" by @zanderso in https://github.com/flutter/flutter/pull/96122

  在 https://github.com/flutter/flutter/pull/96122 中恢复 @zanderso 的“FFI 插件”

* Add a new PrebuiltFlutterApplicationPackage interface. by @chingjun in https://github.com/flutter/flutter/pull/95290

  添加新的 PrebuiltFlutterApplicationPackage 接口。通过 https://github.com/flutter/flutter/pull/95290 中的 @chingjun

* Do not show v1 Android embedding message for non-Android commands by @jmagman in https://github.com/flutter/flutter/pull/96148

  不显示 https://github.com/flutter/flutter/pull/96148 中 @jmagman 的非 Android 命令的 v1 Android 嵌入消息

* Migrate build commands to null safety by @jmagman in https://github.com/flutter/flutter/pull/95649

  通过 https://github.com/flutter/flutter/pull/95649 中的 @jmagman 将构建命令迁移到空安全

* Migrate emulators, packages, upgrade, and downgrade to null safety by @jmagman in https://github.com/flutter/flutter/pull/95712

  通过 https://github.com/flutter/flutter/pull/95712 中的 @jmagman 将模拟器、包、升级和降级迁移到空安全

* feat(flutter_tools): Added doctor path printing on verbose by @crisboarna in https://github.com/flutter/flutter/pull/95453

  feat(flutter_tools)：在 https://github.com/flutter/flutter/pull/95453 中通过 @crisboarna 添加了详细的医生路径打印

* feat(flutter_tools): Changed NoIdeValidator validation type from error to warning by @crisboarna in https://github.com/flutter/flutter/pull/95492

  feat(flutter_tools)：通过 https://github.com/flutter/flutter/pull/95492 中的 @crisboarna 将 NoIdeValidator 验证类型从错误更改为警告

* Fix analyze --watch command iterator by @jmagman in https://github.com/flutter/flutter/pull/96264

  通过 https://github.com/flutter/flutter/pull/96264 中的 @jmagman 修复分析 --watch 命令迭代器

* Warm cache with all transitive dependencies in `flutter update-packages` command by @gspencergoog in https://github.com/flutter/flutter/pull/96258

  https://github.com/flutter/flutter/pull/96258 中的 `flutter update-packages` 命令中的所有传递依赖项的热缓存，由 @gspencergoog 执行

* Hide PII from doctor validators for GitHub template by @jmagman in https://github.com/flutter/flutter/pull/96250

  通过 https://github.com/flutter/flutter/pull/96250 中的 @jmagman 对 GitHub 模板的医生验证程序隐藏 PII

* Revert "feat(flutter_tools): Added doctor path printing on verbose" by @zanderso in https://github.com/flutter/flutter/pull/96414

  恢复“feat(flutter_tools)：添加了详细的医生路径打印”，由 @zanderso 在 https://github.com/flutter/flutter/pull/96414 中实现

* Add suggestion for compileSdkVersion warning by @blasten in https://github.com/flutter/flutter/pull/95369

  在 https://github.com/flutter/flutter/pull/95369 中添加 @blasten 的compileSdkVersion警告建议

* Fix typo by @utibeabasi6 in https://github.com/flutter/flutter/pull/96058

  修复 https://github.com/flutter/flutter/pull/96058 中的 @utibeabasi6 拼写错误

* Update Flutter desktop doc URL in error message by @cbracken in https://github.com/flutter/flutter/pull/96559

  通过 https://github.com/flutter/flutter/pull/96559 中的 @cbracken 更新错误消息中的 Flutter 桌面文档 URL

* Bump Android dependencies that rely on Jcenter by @blasten in https://github.com/flutter/flutter/pull/96558

  通过 https://github.com/flutter/flutter/pull/96558 中的 @blasten 凹凸依赖于 Jcenter 的 Android 依赖项

* Fully support Dart-only mobile and macOS plugins by @stuartmorgan in https://github.com/flutter/flutter/pull/96183

  完全支持 https://github.com/flutter/flutter/pull/96183 中的 @stuartmorgan 提供的仅 Dart 移动和 macOS 插件

* fix rsync output utf8decode bug by @intspt in https://github.com/flutter/flutter/pull/95881

  通过 https://github.com/flutter/flutter/pull/95881 中的 @intspt 修复 rsync 输出 utf8decode 错误

* Fix wrong documentation URL for adding desktop support to existing app by @PoojaB26 in https://github.com/flutter/flutter/pull/94399

  修复了错误的文档 URL，以通过 https://github.com/flutter/flutter/pull/94399 中的 @PoojaB26 添加桌面支持到现有应用程序

* Document template CMake files by @stuartmorgan in https://github.com/flutter/flutter/pull/96534

  https://github.com/flutter/flutter/pull/96534 中的 @stuartmorgan 的文档模板 CMake 文件

* Migrate assemble and integration_test_device to null safety by @jmagman in https://github.com/flutter/flutter/pull/96630

  通过https://github.com/flutter/flutter/pull/96630中的@jmagman将assemble和integration_test_device迁移到null安全

* Skip flaky test: background_isolate_test.dart: Hot restart kills background isolates by @keyonghan in https://github.com/flutter/flutter/pull/96678

  跳过片状测试：background_isolate_test.dart：热重启会通过 https://github.com/flutter/flutter/pull/96678 中的 @keyonghan 杀死背景隔离

* feat: support configure a custom launch url for flutter web by @wangying3426 in https://github.com/flutter/flutter/pull/95002

  feat：支持通过 https://github.com/flutter/flutter/pull/95002 中的 @wangying3426 为 flutter web 配置自定义启动 url

* Add boxes around version freshness alerts by @jmagman in https://github.com/flutter/flutter/pull/96152

  在 https://github.com/flutter/flutter/pull/96152 中的 @jmagman 的版本新鲜度警报周围添加框

* Enable inline Dart plugin implementation on Desktop by @stuartmorgan in https://github.com/flutter/flutter/pull/96610

  通过 https://github.com/flutter/flutter/pull/96610 中的 @stuartmorgan 在桌面上启用内联 Dart 插件实现

* Pass 'build ios' device ID into xcodebuild by @jmagman in https://github.com/flutter/flutter/pull/96669

  通过 https://github.com/flutter/flutter/pull/96669 中的 @jmagman 将“build ios”设备 ID 传递到 xcodebuild

* Take screenshot when drive fails to start app or test by @jmagman in https://github.com/flutter/flutter/pull/96828

  当驱动器无法启动应用程序或通过 https://github.com/flutter/flutter/pull/96828 中的 @jmagman 进行测试时截屏

* Fix SDK versions for Flutter packages in analyze tests to enable null-safe mode by @DanTup in https://github.com/flutter/flutter/pull/96950

  修复分析测试中 Flutter 包的 SDK 版本，以通过 https://github.com/flutter/flutter/pull/96950 中的 @DanTup 启用空安全模式

* Remove unused code from android_device.dart by @swift-kim in https://github.com/flutter/flutter/pull/95450

  通过 https://github.com/flutter/flutter/pull/95450 中的 @swift-kim 从 android_device.dart 中删除未使用的代码

* Adjust lipo thinning input/output for macOS by @zanderso in https://github.com/flutter/flutter/pull/97111

  通过 https://github.com/flutter/flutter/pull/97111 中的 @zanderso 调整 macOS 的脂肪稀疏输入/输出

* Use frontend_server from the Dart SDK by @zanderso in https://github.com/flutter/flutter/pull/97078

  使用 https://github.com/flutter/flutter/pull/97078 中 @zanderso 的 Dart SDK 中的 frontend_server

* [flutter_tools] support files in flutter analyze #96231 by @Jasguerrero in https://github.com/flutter/flutter/pull/97021

  [flutter_tools] 在 https://github.com/flutter/flutter/pull/97021 中的 @Jasguerrero 的 flutter 分析 #96231 中支持文件

* Don't use example folder as a project type signal by @stuartmorgan in https://github.com/flutter/flutter/pull/97157

  不要使用 https://github.com/flutter/flutter/pull/97157 中的 @stuartmorgan 的示例文件夹作为项目类型信号

* [flutter_tools] Fix bug in background_isolate_test.dart by @christopherfujino in https://github.com/flutter/flutter/pull/97170

  [flutter_tools] 修复 https://github.com/flutter/flutter/pull/97170 中的 @christopherfujino 中的 background_isolate_test.dart 中的错误

* [flutter_tools] auto-migrate dev users to beta by @christopherfujino in https://github.com/flutter/flutter/pull/97028

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/97028 中的 @christopherfujino 自动将开发用户迁移到测试版

* Take drive screenshot on test failure before app is stopped by @jmagman in https://github.com/flutter/flutter/pull/96973

  在 https://github.com/flutter/flutter/pull/96973 中的 @jmagman 停止应用程序之前，拍摄测试失败的驱动器屏幕截图

* Fix hot-restart background-isolate-test test by ensuring updated timestamp is in the future. by @aam in https://github.com/flutter/flutter/pull/97247

  通过确保更新的时间戳是在未来修复热重启后台隔离测试测试。通过 https://github.com/flutter/flutter/pull/97247 中的 @aam

* [flutter_tools] add validation of paths of contained files to os_utils _unpackArchive() by @christopherfujino in https://github.com/flutter/flutter/pull/96565

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/96565 中的 @christopherfujino 添加对 os_utils _unpackArchive() 所包含文件的路径的验证

* ProxiedDevice, connection to a remotely connected device via flutter daemon. by @chingjun in https://github.com/flutter/flutter/pull/95738

  ProxiedDevice，通过 flutter 守护进程连接到远程连接的设备。通过 https://github.com/flutter/flutter/pull/95738 中的 @chingjun

* [tool] Use an arm64 Dart SDK on arm64 macOS by @zanderso in https://github.com/flutter/flutter/pull/97189

  [工具] 在 https://github.com/flutter/flutter/pull/97189 中的 @zanderso 在arm64 macOS上使用arm64 Dart SDK

* FFI plugins by @dcharkes in https://github.com/flutter/flutter/pull/96225

  https://github.com/flutter/flutter/pull/96225 中 @dcharkes 的 FFI 插件

* Make remaining DAP tests null-safe by @DanTup in https://github.com/flutter/flutter/pull/97368

  通过 https://github.com/flutter/flutter/pull/97368 中的 @DanTup 使剩余的 DAP 测试为空安全

* [flutter_tools] remove dummy implementation from abstract class .isEnabled() by @christopherfujino in https://github.com/flutter/flutter/pull/96888

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/96888 中的 @christopherfujino 从抽象类 .isEnabled() 中删除虚拟实现

* Make DAP tests more tolerant of output that didn't come from the app being tested by @DanTup in https://github.com/flutter/flutter/pull/97291

  使 DAP 测试更能容忍并非来自 https://github.com/flutter/flutter/pull/97291 中 @DanTup 测试的应用程序的输出

* Fix typo: recieve => receive by @caioagiani in https://github.com/flutter/flutter/pull/97488

  修复拼写错误：recieve => 通过 https://github.com/flutter/flutter/pull/97488 中的 @caioagiani 接收

* Disallow running on unsupported devices by @jmagman in https://github.com/flutter/flutter/pull/97338

  禁止在 https://github.com/flutter/flutter/pull/97338 中的 @jmagman 不支持的设备上运行

* Export an IPA for distribution via "flutter build ipa" without --export-options-plist by @jmagman in https://github.com/flutter/flutter/pull/97243

  通过 https://github.com/flutter/flutter/pull/97243 中的 @jmagman 导出 IPA 以通过“flutter build ipa”进行分发，无需使用 --export-options-plist

* Revert "Export an IPA for distribution via "flutter build ipa" without --export-options-plist" by @jmagman in https://github.com/flutter/flutter/pull/97616

  恢复 https://github.com/flutter/flutter/pull/97616 中的 @jmagman 的“通过“flutter build ipa”导出 IPA 进行分发，无需 --export-options-plist”

* [flutter_tools] Use proper project name in templates by @collinjackson in https://github.com/flutter/flutter/pull/96373

  [flutter_tools] 在 https://github.com/flutter/flutter/pull/96373 中的 @collinjackson 的模板中使用正确的项目名称

* [flutter_tool] Download gen_snapshot.zip for macOS desktop by @zanderso in https://github.com/flutter/flutter/pull/97627

  [flutter_tool] 通过 @zanderso 在 https://github.com/flutter/flutter/pull/97627 下载适用于 macOS 桌面的 gen_snapshot.zip

* Change all instance of throwing strings to throw specific error classes. by @chingjun in https://github.com/flutter/flutter/pull/97325

  更改抛出字符串的所有实例以抛出特定的错误类。通过 https://github.com/flutter/flutter/pull/97325 中的 @chingjun

* Revert "[flutter_tool] Download gen_snapshot.zip for macOS desktop (#97627) by @zanderso in https://github.com/flutter/flutter/pull/97664

  恢复“[flutter_tool] 通过 https://github.com/flutter/flutter/pull/97664 中的 @zanderso 下载适用于 macOS 桌面 (#97627) 的 gen_snapshot.zip

* Addresses the feedbacks in #95738 by @chingjun in https://github.com/flutter/flutter/pull/97457

  解决了 https://github.com/flutter/flutter/pull/97457 中 @chingjun 在 #95738 中的反馈

* Reland: [flutter_tool] Download gen_snapshot.zip for macOS desktop by @zanderso in https://github.com/flutter/flutter/pull/97671

  重新兰：[flutter_tool] 通过 @zanderso 在 https://github.com/flutter/flutter/pull/97671 下载适用于 macOS 桌面的 gen_snapshot.zip

* Exit the tool if a DevTools subprocess fails when running on a bot by @jason-simmons in https://github.com/flutter/flutter/pull/97613

  如果 DevTools 子进程在 https://github.com/flutter/flutter/pull/97613 中的 @jason-simmons 在机器人上运行时失败，请退出该工具

* [flutter_tool] allow disabling profile mode timeline traces by @jonahwilliams in https://github.com/flutter/flutter/pull/97622

  [flutter_tool] 允许通过 https://github.com/flutter/flutter/pull/97622 中的 @jonahwilliams 禁用配置文件模式时间轴跟踪

* Export an IPA for distribution via "flutter build ipa" without --export-options-plist by @jmagman in https://github.com/flutter/flutter/pull/97672

  通过 https://github.com/flutter/flutter/pull/97672 中的 @jmagman 导出 IPA 以通过“flutter build ipa”进行分发，无需使用 --export-options-plist

* Pin `package:ffi` in `plugin_ffi` template by @dcharkes in https://github.com/flutter/flutter/pull/97720

  通过 https://github.com/flutter/flutter/pull/97720 中的 @dcharkes 将 `package:ffi` 固定在 `plugin_ffi` 模板中

* Restructure Windows plugin template by @stuartmorgan in https://github.com/flutter/flutter/pull/93511

  通过 https://github.com/flutter/flutter/pull/93511 中的 @stuartmorgan 重构 Windows 插件模板

* [flutter_tools] Fix bundle file not found when flavor contains upperc… by @MichaelTamm in https://github.com/flutter/flutter/pull/92660

  [flutter_tools] 修复当风味包含 upperc 时找不到捆绑文件...由 https://github.com/flutter/flutter/pull/92660 中的 @MichaelTamm 提供

* Fix error in type cast. by @chingjun in https://github.com/flutter/flutter/pull/97778

  修复类型转换中的错误。通过 https://github.com/flutter/flutter/pull/97778 中的 @chingjun

* [flutter_tools] increment y instead of m when calling flutter --version on master by @christopherfujino in https://github.com/flutter/flutter/pull/97827

  [flutter_tools] 在 https://github.com/flutter/flutter/pull/97827 中通过 @christopherfujino 在 master 上调用 flutter --version 时增加 y 而不是 m

* Include -isysroot -arch and -miphoneos-version-min when creating dummy module App.framework by @jmagman in https://github.com/flutter/flutter/pull/97689

  在 https://github.com/flutter/flutter/pull/97689 中的 @jmagman 创建虚拟模块 App.framework 时，包括 -isysroot -arch 和 -miphoneos-version-min

* Add support for attachRequest in DAP, running "flutter attach" by @DanTup in https://github.com/flutter/flutter/pull/97652

  在 DAP 中添加对 AttachRequest 的支持，通过 https://github.com/flutter/flutter/pull/97652 中的 @DanTup 运行“flutter Attach”

* Fix how Gradle resolves Android plugin by @blasten in https://github.com/flutter/flutter/pull/97823

  修复 Gradle 如何通过 https://github.com/flutter/flutter/pull/97823 中的 @blasten 解析 Android 插件

* Fix typo FutterApplication -> FlutterApplication by @bannzai in https://github.com/flutter/flutter/pull/97897

  修复 https://github.com/flutter/flutter/pull/97897 中 @bannzai 的拼写错误 FutterApplication -> FlutterApplication

* Revert "Fix how Gradle resolves Android plugin" by @blasten in https://github.com/flutter/flutter/pull/98050

  恢复 https://github.com/flutter/flutter/pull/98050 中 @blasten 的“修复 Gradle 如何解析 Android 插件”

* Export activity for module in AndroidManifest.xml by @blasten in https://github.com/flutter/flutter/pull/98076

  https://github.com/flutter/flutter/pull/98076 中的 @blasten 导出 AndroidManifest.xml 中模块的活动

* Add debugging info to android_plugin_example_app_build_test by @dcharkes in https://github.com/flutter/flutter/pull/98107

  通过 https://github.com/flutter/flutter/pull/98107 中的 @dcharkes 将调试信息添加到 android_plugin_example_app_build_test

* [flutter_tools] Make variants of Pub have consistent method signatures by @swift-kim in https://github.com/flutter/flutter/pull/98119

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/98119 中的 @swift-kim 使 Pub 的变体具有一致的方法签名

* Fix flutter gen-l10n help message by @TahaTesser in https://github.com/flutter/flutter/pull/98147

  通过 https://github.com/flutter/flutter/pull/98147 中的 @TahaTesser 修复 flutter gen-l10n 帮助消息

* [flutter_tools] fix type error in flutter update-packages --jobs=n by @christopherfujino in https://github.com/flutter/flutter/pull/98283

  [flutter_tools] 修复 flutter update-packages --jobs=n 中的类型错误，作者为 https://github.com/flutter/flutter/pull/98283 中的 @christopherfujino

* flutter_build_null_unsafe_test print failed build output by @jmagman in https://github.com/flutter/flutter/pull/98310

  flutter_build_null_unsafe_test 在 https://github.com/flutter/flutter/pull/98310 中打印 @jmagman 失败的构建输出

* [flutter_tools] remove pub dependencies from universal by @Jasguerrero in https://github.com/flutter/flutter/pull/97722

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/97722 中的 @Jasguerrero 从通用中删除 pub 依赖项

* [flutter_tools] rename two unit tests that were not actually being run on CI by @christopherfujino in https://github.com/flutter/flutter/pull/98299

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/98299 中的 @christopherfujino 重命名实际上并未在 CI 上运行的两个单元测试

* Update flutter_tools to look for new VM service message by @bkonyi in https://github.com/flutter/flutter/pull/97683

  更新 flutter_tools 以通过 @bkonyi 在 https://github.com/flutter/flutter/pull/97683 中查找新的 VM 服务消息

* [flutter_tools] do not validate maven upstream if cloud storage override provided by @christopherfujino in https://github.com/flutter/flutter/pull/98293

  [flutter_tools] 如果 https://github.com/flutter/flutter/pull/98293 中的 @christopherfujino 提供的云存储覆盖，则不验证 Maven 上游

* Dump backtrace when cannot attach to observatory by @jmagman in https://github.com/flutter/flutter/pull/98550

  当无法通过 https://github.com/flutter/flutter/pull/98550 中的 @jmagman 附加到天文台时转储回溯

* Remove "beta-quality" for Windows by @timsneath in https://github.com/flutter/flutter/pull/98614

  在 https://github.com/flutter/flutter/pull/98614 中删除 Windows 的 @timsneath 的“beta 质量”

* [flutter_tools] remove flaky web vm service test by @christopherfujino in https://github.com/flutter/flutter/pull/98540

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/98540 中的 @christopherfujino 删除片状 Web 虚拟机服务测试

* Reland "Enable caching of CPU samples collected at application startup (#89600)" by @bkonyi in https://github.com/flutter/flutter/pull/98769

  Reland“启用应用程序启动时收集的 CPU 样本的缓存 (#89600)”，作者：@bkonyi，位于 https://github.com/flutter/flutter/pull/98769

* Improve Gradle retry logic by @blasten in https://github.com/flutter/flutter/pull/96554

  通过 https://github.com/flutter/flutter/pull/96554 中的 @blasten 改进 Gradle 重试逻辑

* [flutter_tools] deprecate the dev branch from the feature system by @christopherfujino in https://github.com/flutter/flutter/pull/98689

  [flutter_tools] 通过 https://github.com/flutter/flutter/pull/98689 中的 @christopherfujino 弃用功能系统中的 dev 分支

* Revert "Reland "Enable caching of CPU samples collected at application startup (#89600)"" by @zanderso in https://github.com/flutter/flutter/pull/98803

  恢复 https://github.com/flutter/flutter/pull/98803 中 @zanderso 的“Reland“启用应用程序启动时收集的 CPU 样本的缓存 (#89600)””

* Fixed order dependency and removed no-shuffle-tag in build_ios_framew… by @Swiftaxe in https://github.com/flutter/flutter/pull/94699

  修复了顺序依赖性并删除了 build_ios_framew 中的 no-shuffle-tag ...，作者为 https://github.com/flutter/flutter/pull/94699 中的 @Swiftaxe

* Add option in ProxiedDevice to only transfer the delta when deploying. by @chingjun in https://github.com/flutter/flutter/pull/97462

  在 ProxiedDevice 中添加选项以仅在部署时传输增量。通过 https://github.com/flutter/flutter/pull/97462 中的 @chingjun

* Removed no-shuffle tag and fixed order dependency in daemon_test.dart by @Swiftaxe in https://github.com/flutter/flutter/pull/98970

  通过 https://github.com/flutter/flutter/pull/98970 中的 @Swiftaxe 删除了 daemon_test.dart 中的 no-shuffle 标签和固定顺序依赖项

* Skip `can validate flutter version in parallel` test in `Linux web_tool_tests` by @keyonghan in https://github.com/flutter/flutter/pull/99017

  通过 https://github.com/flutter/flutter/pull/99017 中的 @keyonghan 跳过 `Linux web_tool_tests` 中的 `can validate flutter version in parallel` 测试

* Increase recommended CocoaPods version to 1.11 by @jmagman in https://github.com/flutter/flutter/pull/98621

  通过 https://github.com/flutter/flutter/pull/98621 中的 @jmagman 将推荐的 CocoaPods 版本增加到 1.11

* reads min/target sdk versions from localproperties by @brunotacca in https://github.com/flutter/flutter/pull/98450

  通过 https://github.com/flutter/flutter/pull/98450 中的 @brunotacca 从 localproperties 读取最小/目标 sdk 版本

* [dap] Don't use --start-paused when running in Profile/Release mode by @DanTup in https://github.com/flutter/flutter/pull/98926

  [dap] 在 https://github.com/flutter/flutter/pull/98926 中的 @DanTup 在 Profile/Release 模式下运行时不要使用 --start-paused

* Wait for ios-deploy stdout before closing logLine stream by @jmagman in https://github.com/flutter/flutter/pull/99041

  在 https://github.com/flutter/flutter/pull/99041 中的 @jmagman 关闭 logLine 流之前等待 ios-deploy stdout

* Work around VS CMake generation bug by @stuartmorgan in https://github.com/flutter/flutter/pull/98945

  解决 https://github.com/flutter/flutter/pull/98945 中的 @stuartmorgan 的 VS CMake 生成错误

* Print events and views when first frame is taking awhile during tracing by @jmagman in https://github.com/flutter/flutter/pull/98957

  当第一帧在 https://github.com/flutter/flutter/pull/98957 中的 @jmagman 跟踪期间花费一段时间时打印事件和视图

* Revert "reads min/target sdk versions from localproperties" by @blasten in https://github.com/flutter/flutter/pull/99191

  恢复 https://github.com/flutter/flutter/pull/99191 中的 @blasten 的“从 localproperties 读取最小/目标 sdk 版本”

* Starts using the `--source` flag to compile the dart registrant. by @gaaclarke in https://github.com/flutter/flutter/pull/98046

  开始使用 `--source` 标志来编译 dart 注册程序。通过 https://github.com/flutter/flutter/pull/98046 中的 @gaaclarke

* Update minimum required version to Xcode 13 by @jmagman in https://github.com/flutter/flutter/pull/97746

  通过 https://github.com/flutter/flutter/pull/97746 中的 @jmagman 将所需的最低版本更新为 Xcode 13

* Fix the race condition in cache_test.dart by @gspencergoog in https://github.com/flutter/flutter/pull/99423

  通过 https://github.com/flutter/flutter/pull/99423 中的 @gspencergoog 修复 cache_test.dart 中的竞争条件

* Fix custom-device default forwardPortSuccessRegex by @mbriand in https://github.com/flutter/flutter/pull/97719

  通过 https://github.com/flutter/flutter/pull/97719 中的 @mbriand 修复自定义设备默认的forwardPortSuccessRegex

* Add Windows performance benchmark by @jonahwilliams in https://github.com/flutter/flutter/pull/99564

  在 https://github.com/flutter/flutter/pull/99564 中通过 @jonahwilliams 添加 Windows 性能基准

* Add logging when first frame is not rendering by @jmagman in https://github.com/flutter/flutter/pull/99566

  在 https://github.com/flutter/flutter/pull/99566 中的 @jmagman 未渲染第一帧时添加日志记录

* [flutter_tools] Add timeout duration to error and handle exceptions for HttpHostValidator. by @RoyARG02 in https://github.com/flutter/flutter/pull/98290

  [flutter_tools] 为 HttpHostValidator 添加错误超时时间并处理异常。通过 @RoyARG02 在 https://github.com/flutter/flutter/pull/98290

* Support route on ios by @Jasguerrero in https://github.com/flutter/flutter/pull/99078

  通过 https://github.com/flutter/flutter/pull/99078 中的 @Jasguerrero 支持 ios 上的路由

* Check string size before Win32 MultiByte <-> WideChar conversions by @cbracken in https://github.com/flutter/flutter/pull/99729

  在 https://github.com/flutter/flutter/pull/99729 中的 @cbracken 检查 Win32 MultiByte <-> WideChar 转换之前的字符串大小

* Handle hidden dot files in iOS framework bundles by @jmagman in https://github.com/flutter/flutter/pull/99771

  通过 https://github.com/flutter/flutter/pull/99771 中的 @jmagman 处理 iOS 框架包中的隐藏点文件

* Fix Typo by @Phelicks in https://github.com/flutter/flutter/pull/97793

  通过 @Phelicks 修复拼写错误 https://github.com/flutter/flutter/pull/97793

* 95533 min sdk error msgs enhancements by @brunotacca in https://github.com/flutter/flutter/pull/99550

  https://github.com/flutter/flutter/pull/99550 中的 @brunotacca 增强了 95533 分钟 sdk 错误消息

* Remove tool crash git.io link shortener by @jmagman in https://github.com/flutter/flutter/pull/99574

  通过 https://github.com/flutter/flutter/pull/99574 中的 @jmagman 删除工具崩溃 git.io 链接缩短器

* Pass 'assume-initialize-from-dill-up-to-date' flag to the frontend server by @chingjun in https://github.com/flutter/flutter/pull/99791

  通过 https://github.com/flutter/flutter/pull/99791 中的 @chingjun 将 'assume-initialize-from-dill-up-to-date' 标志传递给前端服务器

* First pass at using platform abstraction for plugins by @fuzzybinary in https://github.com/flutter/flutter/pull/92672

  第一次通过 https://github.com/flutter/flutter/pull/92672 中的 @fuzzybinary 使用插件平台抽象

* [tool] Add CADisableMinimumFrameDurationOnPhone to iOS templates by @cyanglaz in https://github.com/flutter/flutter/pull/94509

  [工具] 通过 https://github.com/flutter/flutter/pull/94509 中的 @cyanglaz 将 CADisableMinimumFrameDurationOnPhone 添加到 iOS 模板

* Fix flutter web app not respecting assets path when in non-root folder by @nicolasvac in https://github.com/flutter/flutter/pull/96774

  通过 https://github.com/flutter/flutter/pull/96774 中的 @nicolasvac 修复 flutter Web 应用程序在非根文件夹中时不尊重资产路径的问题

* Fix route integration test on ios by @Jasguerrero in https://github.com/flutter/flutter/pull/99781

  通过 https://github.com/flutter/flutter/pull/99781 中的 @Jasguerrero 修复 ios 上的路由集成测试

* [flutter_tools] exec rather than spawn subprocess from bin/internal/shared.sh by @christopherfujino in https://github.com/flutter/flutter/pull/99871

  [flutter_tools] exec 而不是通过 https://github.com/flutter/flutter/pull/99871 中的 @christopherfujino 从 bin/internal/shared.sh 生成子进程

* Add portForwarder for ProxiedDevice. by @chingjun in https://github.com/flutter/flutter/pull/100111

  为 ProxiedDevice 添加 portForwarder。通过 https://github.com/flutter/flutter/pull/100111 中的 @chingjun

* Add more specific cause on web development tool error output by @yuseok in https://github.com/flutter/flutter/pull/98553

  在 https://github.com/flutter/flutter/pull/98553 中的 @yuseok 添加有关 Web 开发工具错误输出的更具体原因

* MigrateConfig and migrate integration testing base by @GaryQian in https://github.com/flutter/flutter/pull/99092

  MigrateConfig 并通过 https://github.com/flutter/flutter/pull/99092 中的 @GaryQian 迁移集成测试库

* [macOS] Enable universal binary builds by default by @cbracken in https://github.com/flutter/flutter/pull/100271

  [macOS] 默认情况下通过 https://github.com/flutter/flutter/pull/100271 中的 @cbracken 启用通用二进制构建

* [flutter_tools] Null safe update packages by @christopherfujino in https://github.com/flutter/flutter/pull/99357

  [flutter_tools] https://github.com/flutter/flutter/pull/99357 中的 @christopherfujino 提供的空安全更新包

* Reintroduce the ability to override the coverage formatter by @liamappelbe in https://github.com/flutter/flutter/pull/100320

  重新引入通过 https://github.com/flutter/flutter/pull/100320 中的 @liamappelbe 覆盖覆盖率格式化程序的功能

* [flutter_tools] check if stream is open before sending message in ios device by @christopherfujino in https://github.com/flutter/flutter/pull/99947

  [flutter_tools] 在 https://github.com/flutter/flutter/pull/99947 中的 @christopherfujino 在 ios 设备中发送消息之前检查流是否打开

* Handle Flutter.Error events and disable structure errors for noDebug mode by @DanTup in https://github.com/flutter/flutter/pull/100149

  通过 https://github.com/flutter/flutter/pull/100149 中的 @DanTup 处理 Flutter.Error 事件并禁用 noDebug 模式的结构错误

* [flutter_tools] process exception during linux_doctor is handled by @Jasguerrero in https://github.com/flutter/flutter/pull/100159

  [flutter_tools] linux_doctor 期间的进程异常由 https://github.com/flutter/flutter/pull/100159 中的 @Jasguerrero 处理

* Specify destination when building for macOS by @dnfield in https://github.com/flutter/flutter/pull/100315

  在 https://github.com/flutter/flutter/pull/100315 中通过 @dnfield 构建 macOS 时指定目标

* Revert "Starts using the `--source` flag to compile the dart registrant. (#98046) by @gaaclarke in https://github.com/flutter/flutter/pull/100493

  恢复“开始使用 `--source` 标志来编译 dart 注册者。（#98046）由 @gaaclarke in https://github.com/flutter/flutter/pull/100493

* Revert "[flutter_tools] remove pub dependencies from universal #97722" by @Jasguerrero in https://github.com/flutter/flutter/pull/100508

  通过 https://github.com/flutter/flutter/pull/100508 中的 @Jasguerrero 恢复“[flutter_tools] 从通用 #97722 中删除 pub 依赖项”

* [macOS] Use arm64 snapshot in arm64 App.framework by @cbracken in https://github.com/flutter/flutter/pull/100504

  [macOS] 在 https://github.com/flutter/flutter/pull/100504 中的 @cbracken 在arm64 App.framework中使用arm64快照

* Upgrade to flutter_lints 2.0 by @goderbauer in https://github.com/flutter/flutter/pull/99881

  通过 https://github.com/flutter/flutter/pull/99881 中的 @goderbauer 升级到 flutter_lints 2.0

* [flutter_tools] Skip version freshness check for non-standard remotes by @RoyARG02 in https://github.com/flutter/flutter/pull/97202

  [flutter_tools] 跳过 https://github.com/flutter/flutter/pull/97202 中的 @RoyARG02 对非标准遥控器进行版本新鲜度检查

* [dap] Remove some code that's not longer required by @DanTup in https://github.com/flutter/flutter/pull/98928

  [dap] 删除 https://github.com/flutter/flutter/pull/98928 中 @DanTup 不再需要的一些代码

* Don't terminate Dart process pids from VM Service, record flutter_tools VM pid by @DanTup in https://github.com/flutter/flutter/pull/100223

  不要终止 VM 服务中的 Dart 进程 pid，通过 https://github.com/flutter/flutter/pull/100223 中的 @DanTup 记录 flutter_tools VM pid

* Remove the end period of a URL in project template by @asashour in https://github.com/flutter/flutter/pull/99816

  通过 https://github.com/flutter/flutter/pull/99816 中的 @asashour 删除项目模板中 URL 的结束句点

* Filter out some stray Xcode logging during macOS builds by @jmagman in https://github.com/flutter/flutter/pull/100707

  在 https://github.com/flutter/flutter/pull/100707 中的 @jmagman 构建 macOS 期间过滤掉一些杂散的 Xcode 日志记录

* [flutter_tools] Fix VersionUpstreamValidator to respect FLUTTER_GIT_URL by @RoyARG02 in https://github.com/flutter/flutter/pull/100605

  [flutter_tools] 修复 VersionUpstreamValidator 以遵守 https://github.com/flutter/flutter/pull/100605 中的 @RoyARG02 的 FLUTTER_GIT_URL

* Add `CADisableMinimumFrameDurationOnPhone` migration by @cyanglaz in https://github.com/flutter/flutter/pull/100647

  在 https://github.com/flutter/flutter/pull/100647 中通过 @cyanglaz 添加 `CADisableMinimumFrameDurationOnPhone` 迁移

* [flutter_tool] Adds `--enable-impeller` flag to the run command by @zanderso in https://github.com/flutter/flutter/pull/100835

  [flutter_tool] 通过 https://github.com/flutter/flutter/pull/100835 中的 @zanderso 将 `--enable-impeller` 标志添加到运行命令中

* Pass ARCHS build setting to flutter assemble on macOS by @jmagman in https://github.com/flutter/flutter/pull/100811

  通过 ARCHS 构建设置，通过 https://github.com/flutter/flutter/pull/100811 中的 @jmagman 在 macOS 上进行 flutter 汇编

* [flutter_tools] warn when doctor takes long by @christopherfujino in https://github.com/flutter/flutter/pull/100805

  [flutter_tools] 当医生花费很长时间时发出警告 https://github.com/flutter/flutter/pull/100805

* [macOS] Remove beta-quality wording from messages by @cbracken in https://github.com/flutter/flutter/pull/99699

  [macOS] 从 https://github.com/flutter/flutter/pull/99699 中的 @cbracken 删除消息中的 beta 质量措辞

* [Linux] Remove beta-quality wording from messages by @cbracken in https://github.com/flutter/flutter/pull/99700

  [Linux] 从 https://github.com/flutter/flutter/pull/99700 中的 @cbracken 删除消息中的 beta 质量措辞

* Set ARCHS to single-arch for local engine macOS builds by @jmagman in https://github.com/flutter/flutter/pull/100917

  将 ARCHS 设置为单架构，用于 https://github.com/flutter/flutter/pull/100917 中的 @jmagman 构建的本地引擎 macOS

* [flutter_tool] Have long-running validators fail by @christopherfujino in https://github.com/flutter/flutter/pull/100936

  [flutter_tool] 长时间运行的验证器因 https://github.com/flutter/flutter/pull/100936 中的 @christopherfujino 失败

* [flutter_conductor] Extend timeout for codesign integration test by @christopherfujino in https://github.com/flutter/flutter/pull/100940

  [flutter_conductor] 通过 https://github.com/flutter/flutter/pull/100940 中的 @christopherfujino 延长协同设计集成测试的超时

* Migrate .packages -> package_config.json by @sigurdm in https://github.com/flutter/flutter/pull/99677

  通过 https://github.com/flutter/flutter/pull/99677 中的 @sigurdm 迁移 .packages -> package_config.json

* Reland "Enable caching of CPU samples collected at application startup (#89600)" by @bkonyi in https://github.com/flutter/flutter/pull/100995

  Reland“启用应用程序启动时收集的 CPU 样本的缓存 (#89600)”，作者：@bkonyi，位于 https://github.com/flutter/flutter/pull/100995

* Migrate AGP and Gradle versions to 7.1.2/7.4 by @blasten in https://github.com/flutter/flutter/pull/99723

  通过 https://github.com/flutter/flutter/pull/99723 中的 @blasten 将 AGP 和 Gradle 版本迁移到 7.1.2/7.4

* [web] flutter.js initialization with ui.webOnlyWarmupEngine by @ditman in https://github.com/flutter/flutter/pull/100177

  [web] flutter.js 使用 ui.webOnlyWarmupEngine 初始化，作者为 @ditman，位于 https://github.com/flutter/flutter/pull/100177

* [winuwp] Add removal warning in config help text by @cbracken in https://github.com/flutter/flutter/pull/101086

  [winuwp] 在 https://github.com/flutter/flutter/pull/101086 中的 @cbracken 在配置帮助文本中添加删除警告

* Retire v1 embedding compatibility from automatic multidex support by @GaryQian in https://github.com/flutter/flutter/pull/100685

  通过 https://github.com/flutter/flutter/pull/100685 中的 @GaryQian 从自动多重索引支持中取消 v1 嵌入兼容性

* Prepare `flutter_tools` for `use_super_parameters` by @goderbauer in https://github.com/flutter/flutter/pull/100509

  通过 https://github.com/flutter/flutter/pull/100509 中的 @goderbauer 为 `use_super_parameters` 准备 `flutter_tools`

* [Revert] Skip overall_experience_test.dart: flutter run writes and clears pidfile appropriately by @keyonghan in https://github.com/flutter/flutter/pull/101267

  [恢复]跳过overall_experience_test.dart：flutter run通过https://github.com/flutter/flutter/pull/101267中的@keyonghan适当写入和清除pidfile

* Add note to doctor validator if script is running Rosetta by @jmagman in https://github.com/flutter/flutter/pull/101309

  如果脚本正在 https://github.com/flutter/flutter/pull/101309 中的 @jmagman 运行 Rosetta，请向医生验证器添加注释

* [Cherrypick] Partial revert of super params in tools (#101436) by @CaseyHillers in https://github.com/flutter/flutter/pull/101527

  [Cherrypick] https://github.com/flutter/flutter/pull/101527 中的 @CaseyHillers 部分恢复工具中的超级参数 (#101436)

* [flutter_releases] Flutter beta 2.13.0-0.3.pre Framework Cherrypicks by @CaseyHillers in https://github.com/flutter/flutter/pull/102620

  [flutter_releases] Flutter beta 2.13.0-0.3.pre Framework Cherrypicks by @CaseyHillers in https://github.com/flutter/flutter/pull/102620


### MacOS

### 苹果系统


* [macOS] Add run release test in devicelab by @cbracken in https://github.com/flutter/flutter/pull/100526

  [macOS] 在 https://github.com/flutter/flutter/pull/100526 中的 @cbracken 在 devicelab 中添加运行发布测试


## New Contributors

## 新贡献者


Thanks to the following contributors in this release:

感谢此版本中的以下贡献者：


* @willlockwood made their first contribution in https://github.com/flutter/flutter/pull/95537

  @willlockwood 在 https://github.com/flutter/flutter/pull/95537 中做出了第一个贡献

* @utibeabasi6 made their first contribution in https://github.com/flutter/flutter/pull/96058

  @utibeabasi6 在 https://github.com/flutter/flutter/pull/96058 中做出了第一个贡献

* @fbcouch made their first contribution in https://github.com/flutter/flutter/pull/75472

  @fbcouch 在 https://github.com/flutter/flutter/pull/75472 中做出了第一个贡献

* @b-luk made their first contribution in https://github.com/flutter/flutter/pull/96483

  @b-luk 在 https://github.com/flutter/flutter/pull/96483 中做出了第一个贡献

* @WasserEsser made their first contribution in https://github.com/flutter/flutter/pull/96555

  @WasserEsser 在 https://github.com/flutter/flutter/pull/96555 中做出了第一个贡献

* @intspt made their first contribution in https://github.com/flutter/flutter/pull/95881

  @intspt 在 https://github.com/flutter/flutter/pull/95881 中做出了第一个贡献

* @PoojaB26 made their first contribution in https://github.com/flutter/flutter/pull/94399

  @PoojaB26 在 https://github.com/flutter/flutter/pull/94399 中做出了第一个贡献

* @ipowell made their first contribution in https://github.com/flutter/flutter/pull/91899

  @ipowell 在 https://github.com/flutter/flutter/pull/91899 中做出了第一个贡献

* @swift-kim made their first contribution in https://github.com/flutter/flutter/pull/95450

  @swift-kim 在 https://github.com/flutter/flutter/pull/95450 中做出了第一个贡献

* @Dan-Crane made their first contribution in https://github.com/flutter/flutter/pull/92959

  @Dan-Crane 在 https://github.com/flutter/flutter/pull/92959 中做出了第一个贡献

* @SuhwanCha made their first contribution in https://github.com/flutter/flutter/pull/96574

  @SuhwanCha 在 https://github.com/flutter/flutter/pull/96574 中做出了第一个贡献

* @Amir-P made their first contribution in https://github.com/flutter/flutter/pull/93312

  @Amir-P 在 https://github.com/flutter/flutter/pull/93312 中做出了第一个贡献

* @jonas-martinez made their first contribution in https://github.com/flutter/flutter/pull/85954

  @jonas-martinez 在 https://github.com/flutter/flutter/pull/85954 中做出了第一个贡献

* @caioagiani made their first contribution in https://github.com/flutter/flutter/pull/97488

  @caioagiani 在 https://github.com/flutter/flutter/pull/97488 中做出了第一个贡献

* @MichaelTamm made their first contribution in https://github.com/flutter/flutter/pull/92660

  @MichaelTamm 在 https://github.com/flutter/flutter/pull/92660 中做出了第一个贡献

* @cachapa made their first contribution in https://github.com/flutter/flutter/pull/95504

  @cachapa 在 https://github.com/flutter/flutter/pull/95504 中做出了第一个贡献

* @bannzai made their first contribution in https://github.com/flutter/flutter/pull/97897

  @bannzai 在 https://github.com/flutter/flutter/pull/97897 中做出了第一个贡献

* @gslender made their first contribution in https://github.com/flutter/flutter/pull/93833

  @gslender 在 https://github.com/flutter/flutter/pull/93833 中做出了第一个贡献

* @brianquinlan made their first contribution in https://github.com/flutter/flutter/pull/98045

  @brianquinlan 在 https://github.com/flutter/flutter/pull/98045 中做出了第一个贡献

* @KristinBi made their first contribution in https://github.com/flutter/flutter/pull/98159

  @KristinBi 在 https://github.com/flutter/flutter/pull/98159 中做出了第一个贡献

* @kirolous-nashaat made their first contribution in https://github.com/flutter/flutter/pull/93439

  @kirolous-nashaat 在 https://github.com/flutter/flutter/pull/93439 中做出了第一个贡献

* @himamis made their first contribution in https://github.com/flutter/flutter/pull/95995

  @himamis 在 https://github.com/flutter/flutter/pull/95995 中做出了第一个贡献

* @brunotacca made their first contribution in https://github.com/flutter/flutter/pull/98450

  @brunotacca 在 https://github.com/flutter/flutter/pull/98450 中做出了第一个贡献

* @SimonHausdorf made their first contribution in https://github.com/flutter/flutter/pull/90109

  @SimonHausdorf 在 https://github.com/flutter/flutter/pull/90109 中做出了第一个贡献

* @Hari-07 made their first contribution in https://github.com/flutter/flutter/pull/98512

  @Hari-07 在 https://github.com/flutter/flutter/pull/98512 中做出了第一个贡献

* @mbriand made their first contribution in https://github.com/flutter/flutter/pull/97719

  @mbriand 在 https://github.com/flutter/flutter/pull/97719 中做出了第一个贡献

* @r-mzy47 made their first contribution in https://github.com/flutter/flutter/pull/98389

  @r-mzy47 在 https://github.com/flutter/flutter/pull/98389 中做出了第一个贡献

* @Phelicks made their first contribution in https://github.com/flutter/flutter/pull/97793

  @Phelicks 在 https://github.com/flutter/flutter/pull/97793 中做出了第一个贡献

* @nicolasvac made their first contribution in https://github.com/flutter/flutter/pull/96774

  @nicolasvac 在 https://github.com/flutter/flutter/pull/96774 中做出了第一个贡献

* @valentinmarq made their first contribution in https://github.com/flutter/flutter/pull/99682

  @valentinmarq 在 https://github.com/flutter/flutter/pull/99682 中做出了第一个贡献

* @jjoelson made their first contribution in https://github.com/flutter/flutter/pull/99987

  @jjoelson 在 https://github.com/flutter/flutter/pull/99987 中做出了第一个贡献

* @SahajRana made their first contribution in https://github.com/flutter/flutter/pull/99822

  @SahajRana 在 https://github.com/flutter/flutter/pull/99822 中做出了第一个贡献

* @yuseok made their first contribution in https://github.com/flutter/flutter/pull/98553

  @yuseok 在 https://github.com/flutter/flutter/pull/98553 中做出了第一个贡献

* @jellynoone made their first contribution in https://github.com/flutter/flutter/pull/99527

  @jellynoone 在 https://github.com/flutter/flutter/pull/99527 中做出了第一个贡献

* @luckysmg made their first contribution in https://github.com/flutter/flutter/pull/99546

  @luckysmg 在 https://github.com/flutter/flutter/pull/99546 中做出了第一个贡献

* @M97Chahboun made their first contribution in https://github.com/flutter/flutter/pull/100372

  @M97Chahboun 在 https://github.com/flutter/flutter/pull/100372 中做出了第一个贡献

* @TytaniumDev made their first contribution in https://github.com/flutter/flutter/pull/99777

  @TytaniumDev 在 https://github.com/flutter/flutter/pull/99777 中做出了第一个贡献


**Full Changelog**: https://github.com/flutter/flutter/compare/2.10.0...2.13.0-0.4.pre

**完整变更日志**：https://github.com/flutter/flutter/compare/2.10.0...2.13.0-0.4.pre

