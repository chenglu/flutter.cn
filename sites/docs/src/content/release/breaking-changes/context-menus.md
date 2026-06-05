---
# title: A new way to customize context menus
title: 自定义上下文菜单的新方法
# description: >
#   Several hard-coded parameters for customizing context menus have
#   now been replaced by a generic widget builder.
description: >-
  用于自定义上下文菜单的几个硬编码参数现已被通用 widget 构建器取代。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Context menus, or text selection toolbars, are the menus that show up when long
pressing or right clicking on text in Flutter, and they show options like
**Cut**, **Copy**, **Paste**, and **Select all**. Previously, it was only
possible to narrowly customize them using `ToolbarOptions` and
`TextSelectionControls`. Now, they have been made composable using widgets, just
like everything else in Flutter, and the specific configuration parameters have
been deprecated.

上下文菜单或文本选择工具栏是长按或右键单击 Flutter 中的文本时显示的菜单，它们显示诸如**剪切**、**复制**、**粘贴**和**全选**等选项。以前，只能使用 `ToolbarOptions` 和 `TextSelectionControls` 进行狭义自定义。现在，它们可以使用 widgets 进行组合，就像 Flutter 中的其他所有内容一样，并且特定的配置参数已被弃用。


## Context

## 背景


Previously, it was possible to disable buttons from the context menus using
`TextSelectionControls`, but any customization beyond that required copying and
editing hundreds of lines of custom classes in the framework. Now, all of this
has been replaced by a simple builder function, `contextMenuBuilder`, which
allows any Flutter widget to be used as a context menu.

以前，可以使用 `TextSelectionControls` 从上下文菜单中禁用按钮，但除此之外的任何自定义都需要复制和编辑框架中的数百行自定义类。现在，所有这些都已被一个简单的构建器函数 `contextMenuBuilder` 所取代，该函数允许将任何 Flutter widget 用作上下文菜单。


## Description of change

## 变更说明


Context menus are now built from the `contextMenuBuilder` parameter, which has
been added to all text-editing and text-selection widgets. If one is not
provided, then Flutter just sets it to a default that builds the correct context
menu for the given platform. All of these default widgets are exposed to users
for re-use. Customizing context menus now consists of using `contextMenuBuilder`
to return whatever widget you want, possibly including reusing the built-in
context menu widgets.

上下文菜单现在是从 `contextMenuBuilder` 参数构建的，该参数已添加到所有文本编辑和文本选择 widgets 中。如果未提供，则 Flutter 只是将其设置为默认值，为给定平台构建正确的上下文菜单。所有这些默认的 widget 都会暴露给用户以供重复使用。自定义上下文菜单现在包括使用 `contextMenuBuilder` 返回你想要的任何 widget，可能包括重用内置上下文菜单 widgets。


Here's an example that shows how to add a **Send email** button to the default
context menus whenever an email address is selected. The full code can be found
in the samples repository in
[email_button_page.dart]({{site.repo.samples}}/blob/main/context_menus/lib/email_button_page.dart)
on GitHub.

以下示例展示了如何在选择电子邮件地址时将 **发送电子邮件** 按钮添加到默认上下文菜单中。完整的代码可以在示例存储库中找到[email_button_page.dart]({{site.repo.samples}}/blob/main/context_menus/lib/email_button_page.dart)在 GitHub 上。


```dart
TextField(
  contextMenuBuilder: (context, editableTextState) {
    final TextEditingValue value = editableTextState.textEditingValue;
    final List<ContextMenuButtonItem> buttonItems =
        editableTextState.contextMenuButtonItems;
    if (isValidEmail(value.selection.textInside(value.text))) {
      buttonItems.insert(
          0,
          ContextMenuButtonItem(
            label: 'Send email',
            onPressed: () {
              ContextMenuController.removeAny();
              Navigator.of(context).push(_showDialog(context));
            },
          ));
    }
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  },
)
```

A large number of examples of different custom context menus are available
[in the samples repo]({{site.repo.samples}}/tree/main/context_menus)
on GitHub.

提供大量不同自定义上下文菜单的示例[in the samples repo]({{site.repo.samples}}/tree/main/context_menus)在 GitHub 上。


All related deprecated features were flagged with the deprecation warning "Use
`contextMenuBuilder` instead."

所有相关的已弃用功能均标有弃用警告“改为使用 `contextMenuBuilder`”。


## Migration guide

## 迁移指南


In general, any previous changes to context menus that have been deprecated now
require the use of the `contextMenuBuilder` parameter on the relevant
text-editing or text-selection widget (
[on `TextField`]({{site.api}}/flutter/material/TextField/contextMenuBuilder.html),
for example). Return a built-in context menu widget like
[`AdaptiveTextSelectionToolbar`]({{site.api}}/flutter/material/AdaptiveTextSelectionToolbar-class.html)
to use Flutter's built-in context menus, or return your own widget for something
totally custom.

一般来说，以前对上下文菜单所做的任何更改现在都需要在相关文本编辑或文本选择 widget 上使用 `contextMenuBuilder` 参数（[on `TextField`]({{site.api}}/flutter/material/TextField/contextMenuBuilder.html)， 例如）。返回内置上下文菜单 widget 就像[`AdaptiveTextSelectionToolbar`]({{site.api}}/flutter/material/AdaptiveTextSelectionToolbar-class.html)使用 Flutter 的内置上下文菜单，或者返回你自己的 widget 以获得完全自定义的内容。


To transition to `contextMenuBuilder`, the following parameters and classes have
been deprecated.

为了转换到 `contextMenuBuilder`，以下参数和类已被弃用。


### [`ToolbarOptions`]({{site.api}}/flutter/widgets/ToolbarOptions-class.html)

### [`ToolbarOptions`]({{site.api}}/flutter/widgets/ToolbarOptions-class.html)


This class was previously used to explicitly enable or disable certain buttons
in a context menu. Before this change, you might have passed it into `TextField`
or other widgets like this:

此类以前用于显式启用或禁用上下文菜单中的某些按钮。在此更改之前，你可能已将其传递到 `TextField` 或其他 widget 中，如下所示：


```dart
// Deprecated.
TextField(
  toolbarOptions: ToolbarOptions(
    copy: true,
  ),
)
```

Now, you can achieve the same effect by adjusting the `buttonItems` passed into
`AdaptiveTextSelectionToolbar`. For example, you could ensure that the **Cut**
button never appears, but the other buttons do appear as usual:

现在，你可以通过调整传递到 `AdaptiveTextSelectionToolbar` 的 `buttonItems` 来实现相同的效果。例如，你可以确保 **剪切** 按钮永远不会出现，但其他按钮会照常出现：


```dart
TextField(
  contextMenuBuilder: (context, editableTextState) {
    final List<ContextMenuButtonItem> buttonItems =
        editableTextState.contextMenuButtonItems;
    buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
      return buttonItem.type == ContextMenuButtonType.cut;
    });
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  },
)
```

Or, you could ensure that the **Cut** button appears exclusively and always:

或者，你可以确保 **剪切** 按钮始终独占显示：


```dart
TextField(
  contextMenuBuilder: (context, editableTextState) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: <ContextMenuButtonItem>[
        ContextMenuButtonItem(
          onPressed: () {
            editableTextState.cutSelection(SelectionChangedCause.toolbar);
          },
          type: ContextMenuButtonType.cut,
        ),
      ],
    );
  },
)
```

### [`TextSelectionControls.canCut`]({{site.api}}/flutter/widgets/TextSelectionControls/canCut.html) and other button booleans

### [`TextSelectionControls.canCut`]({{site.api}}/flutter/widgets/TextSelectionControls/canCut.html)和其他按钮布尔值


These booleans previously had the same effect of enabling and disabling certain
buttons as `ToolbarOptions.cut`, and so on had. Before this change, you might
have been hiding and showing buttons by overriding `TextSelectionControls` and
setting these booleans like this:

这些布尔值以前具有与 `ToolbarOptions.cut` 等启用和禁用某些按钮相同的效果。在此更改之前，你可能通过覆盖 `TextSelectionControls` 并设置这些布尔值来隐藏和显示按钮，如下所示：


```dart
// Deprecated.
class _MyMaterialTextSelectionControls extends MaterialTextSelectionControls {
  @override
  bool canCut() => false,
}
```

See the previous section on `ToolbarOptions` for how to achieve a similar effect
with `contextMenuBuilder`.

请参阅前面关于 `ToolbarOptions` 的部分，了解如何使用 `contextMenuBuilder` 实现类似的效果。


### [`TextSelectionControls.handleCut`]({{site.api}}/flutter/widgets/TextSelectionControls/handleCut.html) and other button callbacks

### [`TextSelectionControls.handleCut`]({{site.api}}/flutter/widgets/TextSelectionControls/handleCut.html)和其他按钮回调


These functions allowed the modification of the callback called when the buttons
were pressed. Before this change, you might have been modifying context menu
button callbacks by overriding these handler methods like this:

这些函数允许修改按下按钮时调用的回调。在此更改之前，你可能已经通过重写这些处理程序方法来修改上下文菜单按钮回调，如下所示：


```dart
// Deprecated.
class _MyMaterialTextSelectionControls extends MaterialTextSelectionControls {
  @override
  bool handleCut() {
    // My custom cut implementation here.
  },
}
```

This is still possible using `contextMenuBuilder`, including calling
out to the original buttons' actions in the custom handler, using toolbar
widgets like `AdaptiveTextSelectionToolbar.buttonItems`.

使用 `contextMenuBuilder` 仍然可以实现这一点，包括在自定义处理程序中调用原始按钮的操作，使用工具栏 widgets（如 `AdaptiveTextSelectionToolbar.buttonItems`）。


This example shows modifying the **Copy** button to show a dialog in addition to
doing its usual copy logic.

此示例展示了除了执行通常的复制逻辑之外，还修改 **复制** 按钮以显示对话框。


```dart
TextField(
  contextMenuBuilder: (BuildContext context, EditableTextState editableTextState) {
    final List<ContextMenuButtonItem> buttonItems =
        editableTextState.contextMenuButtonItems;
    final int copyButtonIndex = buttonItems.indexWhere(
      (ContextMenuButtonItem buttonItem) {
        return buttonItem.type == ContextMenuButtonType.copy;
      },
    );
    if (copyButtonIndex >= 0) {
      final ContextMenuButtonItem copyButtonItem =
          buttonItems[copyButtonIndex];
      buttonItems[copyButtonIndex] = copyButtonItem.copyWith(
        onPressed: () {
          copyButtonItem.onPressed();
          Navigator.of(context).push(
            DialogRoute<void>(
              context: context,
              builder: (BuildContext context) =>
                const AlertDialog(
                  title: Text('Copied, but also showed this dialog.'),
                ),
            );
          )
        },
      );
    }
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  },
)
```

A full example of modifying a built-in context menu action can be found in the
samples repository in
[modified_action_page.dart]({{site.repo.samples}}/blob/main/context_menus/lib/modified_action_page.dart)
on GitHub.

修改内置上下文菜单操作的完整示例可以在示例存储库中找到[modified_action_page.dart]({{site.repo.samples}}/blob/main/context_menus/lib/modified_action_page.dart)在 GitHub 上。


### [`buildToolbar`]({{site.api}}/flutter/widgets/TextSelectionControls/buildToolbar.html)

### [`buildToolbar`]({{site.api}}/flutter/widgets/TextSelectionControls/buildToolbar.html)


This function generated the context menu widget similarly to
`contextMenuBuilder`, but required more setup to use. Before this change, you
might have been overriding `buildToolbar` as a part of `TextSelectionControls`,
like this:

此函数生成与 `contextMenuBuilder` 类似的上下文菜单 widget，但需要更多设置才能使用。在此更改之前，你可能已经覆盖 `buildToolbar` 作为 `TextSelectionControls` 的一部分，如下所示：


```dart
// Deprecated.
class _MyMaterialTextSelectionControls extends MaterialTextSelectionControls {
  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ClipboardStatusNotifier clipboardStatus,
    Offset lastSecondaryTapDownPosition,
  ) {
    return _MyCustomToolbar();
  },
}
```

Now you can simply use `contextMenuBuilder` directly as a parameter to
`TextField` (and others). The information provided in the parameters to
`buildToolbar` can be obtained from the `EditableTextState` that is passed to
`contextMenuBuilder`.

现在你可以直接使用 `contextMenuBuilder` 作为 `TextField` （和其他）的参数。 `buildToolbar` 参数中提供的信息可以从传递给 `contextMenuBuilder` 的 `EditableTextState` 中获取。


The following example shows how to build a fully-custom toolbar from scratch
while still using the default buttons.

以下示例展示了如何从头开始构建完全自定义的工具栏，同时仍使用默认按钮。


```dart
class _MyContextMenu extends StatelessWidget {
  const _MyContextMenu({
    required this.anchor,
    required this.children,
  });

  final Offset anchor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: anchor.dy,
          left: anchor.dx,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amberAccent,
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}

class _MyTextField extends StatelessWidget {
  const _MyTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 4,
      minLines: 2,
      contextMenuBuilder: (context, editableTextState) {
        return _MyContextMenu(
          anchor: editableTextState.contextMenuAnchors.primaryAnchor,
          children: AdaptiveTextSelectionToolbar.getAdaptiveButtons(
            context,
            editableTextState.contextMenuButtonItems,
          ).toList(),
        );
      },
    );
  }
}
```

A full example of building a custom context menu can be found in the samples
repository in
[`custom_menu_page.dart`]({{site.repo.samples}}/blob/main/context_menus/lib/custom_menu_page.dart)
on GitHub.

构建自定义上下文菜单的完整示例可以在示例存储库中找到[`custom_menu_page.dart`]({{site.repo.samples}}/blob/main/context_menus/lib/custom_menu_page.dart)在 GitHub 上。


## Timeline

## 时间线


Landed in version: 3.6.0-0.0.pre<br>
登陆版本：3.6.0-0.0.pre
In stable release: 3.7.0
稳定版本：3.7.0

## References

## 参考资料


API documentation:

API 文档：


* [`TextField.contextMenuBuilder`]({{site.api}}/flutter/material/TextField/contextMenuBuilder.html)
* [`AdaptiveTextSelectionToolbar`]({{site.api}}/flutter/material/AdaptiveTextSelectionToolbar-class.html)

Relevant issues:

相关 issue：


* [Simple custom text selection toolbars]({{site.repo.flutter}}/issues/73574)
* [Right click menu outside of text fields]({{site.repo.flutter}}/issues/98272)
* [Text editing for desktop - stable]({{site.repo.flutter}}/issues/90563)
* [Ability to disable context menu on TextFields]({{site.repo.flutter}}/issues/79796)
* [Missing APIs for text selection toolbar styling]({{site.repo.flutter}}/issues/22210)
* [Enable copy toolbar in all widgets]({{site.repo.flutter}}/issues/49996)
* [Disable context menu from browser]({{site.repo.flutter}}/issues/78671)
* [Custom context menus don't show up for Flutter web]({{site.repo.flutter}}/issues/84219)

Relevant PRs:

相关 PR：


* [ContextMenus]({{site.repo.flutter}}/pull/107193)
* [Ability to disable the browser's context menu on web]({{site.repo.flutter}}/pull/118194)
* [Ability to disable the browser's context menu on web (engine)]({{site.repo.engine}}/pull/38682)
* [Custom context menus in SelectableRegion on web]({{site.repo.flutter}}/pull/121653)
