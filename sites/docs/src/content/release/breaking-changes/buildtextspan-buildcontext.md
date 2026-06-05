---
# title: Added BuildContext parameter to TextEditingController.buildTextSpan
title: 向 TextEditingController.buildTextSpan 添加了 BuildContext 参数
# description: >
#   A BuildContext parameter is added to TextEditingController.buildTextSpan so
#   inheritors that override buildTextSpan can access inherited widgets.
description: >-
  将 BuildContext 参数添加到 TextEditingController.buildTextSpan 中，以便覆盖 buildTextSpan 的继承者可以访问继承的 widgets。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


A `BuildContext` parameter was added to `TextEditingController.buildTextSpan`.

`BuildContext` 参数已添加到 `TextEditingController.buildTextSpan` 中。


Classes that extend or implement `TextEditingController`
and override `buildTextSpan` need to add the `BuildContext`
parameter to the signature to make it a valid override.

扩展或实现 `TextEditingController` 并覆盖 `buildTextSpan` 的类需要将 `BuildContext` 参数添加到签名中，以使其成为有效的覆盖。


Callers of `TextEditingController.buildTextSpan`
need to pass a `BuildContext` to the call.

`TextEditingController.buildTextSpan` 的调用者需要将 `BuildContext` 传递给调用。


## Context

## 背景


`TextEditingController.buildTextSpan` is called by `EditableText`
on its controller to create the `TextSpan` that it renders.
`buildTextSpan` can be overridden in custom classes that extend
`TextEditingController`. This allows classes extending
`TextEditingController` override `buildTextSpan` to change
the style of parts of the text, for example, for rich text editing.

`TextEditingController.buildTextSpan` 由其控制器上的 `EditableText` 调用，以创建它呈现的 `TextSpan` 。 `buildTextSpan` 可以在扩展 `TextEditingController` 的自定义类中重写。这允许扩展 `TextEditingController` 的类覆盖 `buildTextSpan` 来更改文本部分的样式，例如，用于富文本编辑。


Any state that is required by `buildTextSpan`
(other than the `TextStyle` and `withComposing` arguments)
needed to be passed into the class that extends
`TextEditingController`.

`buildTextSpan` 所需的任何状态（`TextStyle` 和 `withComposing` 参数除外）需要传递到扩展 `TextEditingController` 的类中。


## Description of change

## 变更说明


With the `BuildContext` available, users can access
`InheritedWidgets` inside `buildTextSpan`
to retrieve state required to style the text,
or otherwise manipulate the created `TextSpan`.

使用 `BuildContext` 可用时，用户可以访问 `buildTextSpan` 内的 `InheritedWidgets` 来检索设置文本样式所需的状态，或以其他方式操作创建的 `TextSpan`。


Consider the example where we have a
`HighlightTextEditingController` that wants to
highlight text by setting its color to `Theme.accentColor`.

考虑以下示例：我们有一个 `HighlightTextEditingController`，想要通过将其颜色设置为 `Theme.accentColor` 来突出显示文本。


Before this change the controller implementation would look like this:

在此更改之前，控制器实现将如下所示：


```dart
class HighlightTextEditingController extends TextEditingController {
  HighlightTextEditingController(this.highlightColor);

  final Color highlightColor;

  @override
  TextSpan buildTextSpan({TextStyle? style, required bool withComposing}) {
    return super.buildTextSpan(style: TextStyle(color: highlightColor), withComposing: withComposing);
  }
```

And users of the controller would need to pass the color
when creating the controller.

控制器的用户在创建控制器时需要传递颜色。


With the `BuildContext` parameter available,
the `HighlightTextEditingController` can directly access
`Theme.accentColor` using `Theme.of(BuildContext)`:

当`BuildContext`参数可用时，`HighlightTextEditingController`可以使用`Theme.of(BuildContext)`直接访问`Theme.accentColor`：


```dart
class HighlightTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final Color color = Theme.of(context).accentColor;
    return super.buildTextSpan(context: context, style: TextStyle(color: color), withComposing: withComposing);
  }
}
```

## Migration guide

## 迁移指南


### Overriding `TextEditingController.buildTextSpan`

### 覆盖 `TextEditingController.buildTextSpan`


Add a `required BuildContext context` parameter to the
signature of the `buildTextSpan` override.

将 `required BuildContext context` 参数添加到 `buildTextSpan` 覆盖的签名中。


Code before migration:

迁移前的代码：


```dart
class MyTextEditingController {
  @override
  TextSpan buildTextSpan({TextStyle? style, required bool withComposing}) {
    /* ... */
  }
}
```

Example error message before migration:

迁移前的错误消息示例：


```plaintext
'MyTextEditingController.buildTextSpan' ('TextSpan Function({TextStyle? style, required bool withComposing})') isn't a valid override of 'TextEditingController.buildTextSpan' ('TextSpan Function({required BuildContext context, TextStyle? style, required bool withComposing})').
```

Code after migration:

迁移后的代码：


```dart
class MyTextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    /* ... */
  }
}
```

### Calling `TextEditingController.buildTextSpan`

### 呼叫 `TextEditingController.buildTextSpan`


Pass a named parameter 'context' of type
`BuildContext` to the call.

将 `BuildContext` 类型的命名参数“context”传递给调用。


Code before migration:

迁移前的代码：


```dart
TextEditingController controller = /* ... */;
TextSpan span = controller.buildTextSpan(withComposing: false);
```

Error message before migration:

迁移前的错误信息：


```plaintext
The named parameter 'context' is required, but there's no corresponding argument.
Try adding the required argument.
```

Code after migration:

迁移后的代码：


```dart
BuildContext context = /* ... */;
TextEditingController controller = /* ... */;
TextSpan span = controller.buildTextSpan(context: context, withComposing: false);
```

## Timeline

## 时间线


Landed in version: 1.26.0<br>
登陆版本：1.26.0
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


API documentation:

API 文档：


* [`TextEditingController.buildTextSpan`][]

Relevant issues:

相关 issue：


* [Issue #72343][]

  [问题#72343][Issue #72343]


Relevant PRs:

相关 PR：


* [Reland "Add BuildContext parameter to TextEditingController.buildTextSpan" #73510][]

  [重新登陆“将 BuildContext 参数添加到 TextEditingController.buildTextSpan”#73510][Reland "Add BuildContext parameter to TextEditingController.buildTextSpan" #73510]

* [Revert "Add BuildContext parameter to TextEditingController.buildTextSpan" #73503][]

  [恢复“将 BuildContext 参数添加到 TextEditingController.buildTextSpan”#73503][Revert "Add BuildContext parameter to TextEditingController.buildTextSpan" #73503]

* [Add BuildContext parameter to TextEditingController.buildTextSpan #72344][]

  [将 BuildContext 参数添加到 TextEditingController.buildTextSpan #72344][Add BuildContext parameter to TextEditingController.buildTextSpan #72344]


[Add BuildContext parameter to TextEditingController.buildTextSpan #72344]: {{site.repo.flutter}}/pull/72344
[Issue #72343]: {{site.repo.flutter}}/issues/72343
[Reland "Add BuildContext parameter to TextEditingController.buildTextSpan" #73510]: {{site.repo.flutter}}/pull/73510
[Revert "Add BuildContext parameter to TextEditingController.buildTextSpan" #73503]: {{site.repo.flutter}}/pull/73503
[`TextEditingController.buildTextSpan`]: {{site.api}}/flutter/widgets/TextEditingController/buildTextSpan.html
