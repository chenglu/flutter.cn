---
# title: SystemContextMenuController.show Deprecated
title: SystemContextMenuController.show 已弃用
# description: >-
#   `SystemContextMenuController`'s `show` method is deprecated and replaced by
#   its `showWithItems` method.
description: >
  `SystemContextMenuController` 的 `show` 方法已弃用，并由其 `showWithItems` 方法取代。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


`SystemContextMenuController.show` is deprecated. The same functionality can be
achieved by passing the result of calling `SystemContextMenu.getDefaultItems` to
`SystemContextMenuController.showWithItems`.

`SystemContextMenuController.show` 已弃用。通过将调用 `SystemContextMenu.getDefaultItems` 的结果传递给 `SystemContextMenuController.showWithItems` 可以实现相同的功能。


## Background

## 背景


The iOS-drawn `SystemContextMenu` feature was originally added without the
ability to control which items are shown in the menu. The platform would decide
which items to show based on the active `TextInputConnection`.

iOS 绘制的“SystemContextMenu”功能最初是在无法控制菜单中显示哪些项目的情况下添加的。平台将根据活动的“TextInputConnection”决定显示哪些项目。


The problem with this approach is that an `Autofill` button is often shown, but
Flutter does not have the ability to respond to this button. So in many cases,
users see an `Autofill` button that does nothing when tapped, and Flutter app
developers have no way to hide the button.

这种方法的问题是经常会显示一个“自动填充”按钮，但 Flutter 没有能力响应这个按钮。因此，在许多情况下，用户会看到一个“自动填充”按钮，点击后不会执行任何操作，而 Flutter 应用程序开发人员无法隐藏该按钮。


This problem is solved by introducing a new method,
`SystemContextMenuController.showWithItems`, which requires a list of `items` to
be passed.

这个问题是通过引入一个新方法“SystemContextMenuController.showWithItems”来解决的，该方法需要传递一个“items”列表。


Developers that have no preference which items are shown can call the new method
`SystemContextMenu.getDefaultItems` to get the default items based on the given
`EditableTextState`. For example, if the `EditableTextState` indicates that
there is nothing selected, then the **Copy** button won't be included, since it
requires a selection to copy.

对显示哪些项目没有偏好的开发人员可以调用新方法“SystemContextMenu.getDefaultItems”来根据给定的“EditableTextState”获取默认项目。例如，如果“EditableTextState”指示没有选择任何内容，则不会包含**复制**按钮，因为它需要进行选择才能复制。


## Migration guide

## 迁移指南


Most users use the system context menu through the `SystemContextMenu` widget,
and in this case there will be no change required. The `SystemContextMenu`
widget automatically gets the default items under the hood.

大多数用户通过“SystemContextMenu”widget 使用系统上下文菜单，在这种情况下，不需要进行任何更改。 `SystemContextMenu` widget 会自动获取后台的默认项目。


No migration is needed:

无需迁移：


```dart
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    TextField(
      contextMenuBuilder: (BuildContext context, EditableTextState editableTextState) {
        return SystemContextMenu.editableText(
          editableTextState: editableTextState,
        );
      }
    );
  }
}
```

For advanced users that directly work with `SystemContextMenuController`,
migrate to the new method `SystemContextMenuController.showWithItems`. The
default can be obtained from `SystemContextMenu.getDefaultItems` as a list of
`IOSSystemContextMenuItem`s, which can be converted to the format required by
`showWithItems` through `IOSSystemContextMenuItem.getData`.

对于直接使用“SystemContextMenuController”的高级用户，请迁移到新方法“SystemContextMenuController.showWithItems”。默认值可以从 SystemContextMenu.getDefaultItems 获取为 IOSSystemContextMenuItem 的列表，可以通过 IOSSystemContextMenuItem.getData 转换为 showWithItems 所需的格式。


Code before migration:

迁移前的代码：


```dart
_controller.show(selectionRect);
```

Code after migration:

迁移后的代码：


```dart
final List<IOSSystemContextMenuItem> defaultItems =
    SystemContextMenu.getDefaultItems(editableTextState);
final WidgetsLocalizations localizations =
    WidgetsLocalizations.of(context);
final List<IOSSystemContextMenuItemData> defaultItemData =
    defaultItems
        .map((IOSSystemContextMenuItem item) =>
            item.getData(localizations))
        .toList();
_controller.showWithItems(selectionRect, defaultItemData);
```

## Timeline

## 时间轴


Landed in version: 3.29.0-0.3.pre<br>
In stable release: 3.32

登陆版本：3.29.0-0.3.pre<br> 稳定版本：3.32


## References

## 参考


API documentation:

API 文档：


* [`TextInputConnection`][]


* [`SystemContextMenuController.show`][]

  [`SystemContextMenuController.show`][]

* [`SystemContextMenuController.showWithItems`][]

  [`SystemContextMenuController.showWithItems`][]

* [`SystemContextMenu`][]


Relevant issues:

相关问题：


* [Flutter should support iOS 15's Secure Paste feature][]

  [Flutter 应该支持 iOS 15 的安全粘贴功能][Flutter should support iOS 15's Secure Paste feature]


Relevant PRs:

相关 PR：


* [Secure paste milestone 2][]


* [ios secure_paste show menu item based on info sent from framework][]

  [ios secure_paste 根据从框架发送的信息显示菜单项][Secure paste milestone 2]

* [Native ios context menu][]


* [ios_edit_menu add native edit menu][]

  [ios_edit_menu 添加原生编辑菜单][ios_edit_menu add native edit menu]


[`TextInputConnection`]: {{site.api}}/flutter/services/TextInputConnection-class.html
[`SystemContextMenuController.show`]: {{site.api}}/flutter/services/SystemContextMenuController/show.html
[`SystemContextMenuController.showWithItems`]: {{site.api}}/flutter/services/SystemContextMenuController/showWithItems.html
[`SystemContextMenu`]: {{site.api}}/flutter/services/SystemContextMenu.html

[Secure paste milestone 2]: {{site.repo.flutter}}/pull/159013
[ios secure_paste show menu item based on info sent from framework]: {{site.repo.engine}}/pull/161103
[Native ios context menu]: {{site.repo.flutter}}/pull/143002
[ios_edit_menu add native edit menu]: {{site.repo.flutter}}/pull/50095
[Flutter should support iOS 15's Secure Paste feature]: {{site.repo.flutter}}/issues/103163
