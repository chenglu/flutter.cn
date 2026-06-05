---
# title: TextInputClient currentTextEditingValue
title: TextInputClient 当前文本编辑值
# description: >
#   Add a new field to the TextInputClient interface to
#   get the current TextEditingValue from a client.
description: >
  向 TextInputClient 接口添加一个新字段，以从客户端获取当前的 TextEditingValue。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Add a field, `currentTextEditingValue`, to the `TextInputClient`
interface to get the current value of an editable text field
from a platform client.

将字段“currentTextEditingValue”添加到“TextInputClient”接口，以从平台客户端获取可编辑文本字段的当前值。


## Context

## 背景


The `TextInputClient` class is used by the Flutter framework to
communicate with platform code about the current state of text
input widgets like `EditableText`.

Flutter 框架使用 TextInputClient 类与平台代码进行通信，了解文本输入 widget（如 EditableText）的当前状态。


The platform side can lose its state when an Android app
moves to the background. As of this change,
the app can ask the framework for the last known state.
In order to obtain this information,
the `TextEditingValue` was surfaced for the `TextInputClient`.

当 Android 应用程序移至后台时，平台端可能会丢失其状态。自此更改以来，应用程序可以向框架询问最后的已知状态。为了获取此信息，为“TextInputClient”显示了“TextEditingValue”。


## Description of change

## 变更说明


On some supported platforms, the application can be moved into
the background where it is expected to consume fewer resources.
For example, a backgrounded application on Android should avoid consuming
unnecessary memory and has no need to retain references to views.
Before this change, the Android-specific platform code could
lose state information about editable text fields when
the app moved back to the foreground.
This is seen, for example,
when text entered in a `TextField` widget is lost to
the Java code, but is still remembered in the Dart code.

在某些支持的平台上，应用程序可以移至后台，从而消耗更少的资源。例如，Android 上的后台应用程序应避免消耗不必要的内存，并且无需保留对视图的引用。在此更改之前，当应用程序移回前台时，特定于 Android 的平台代码可能会丢失有关可编辑文本字段的状态信息。例如，当在“TextField”widget 中输入的文本在 Java 代码中丢失，但在 Dart 代码中仍然被记住时，就会出现这种情况。


As of this change,
the platform side now sends a `textInput` channel
message called `TextInput.requestExistingState`.
This notifies the Dart code that, when the app wakes up,
it should re-establish any text input connections
and notify the platform of its most
recently known editing state.

自此更改以来，平台端现在发送名为“TextInput.requestExistingState”的“textInput”通道消息。这会通知 Dart 代码，当应用程序唤醒时，它应该重新建立任何文本输入连接，并通知平台其最近已知的编辑状态。


The `TextInput` class interacts with client widgets using
the `TextInputClient` interface. This interface previously
provided no insight into the current value that a client had.
To allow the `TextInput` class to appropriately respond to
`TextInput.requestExistingState`, a new getter was added to
`TextInputClient` called `currentTextEditingValue`.
You cannot safely use the last value passed to
`TextInputConnection.setEditingState`, since the client
only calls that method under specific circumstances,
such as when Dart code directly modifies the value of a
`TextEditingController` in a way that does not directly mirror
the platform's native handling of a response to a key input event.
This is how a `TextInputFormatter` generally works,
or what happens when Dart code directly sets
`TextEditingController.value`.

“TextInput”类使用“TextInputClient”接口与客户端 widget 交互。该界面以前无法洞察客户当前的价值。为了让“TextInput”类正确响应“TextInput.requestExistingState”，在“TextInputClient”中添加了一个名为“currentTextEditingValue”的新 getter。你无法安全地使用传递给 `TextInputConnection.setEditingState` 的最后一个值，因为客户端仅在特定情况下调用该方法，例如当 Dart 代码以不直接镜像平台对按键输入事件响应的本机处理的方式直接修改 `TextEditingController` 的值时。这就是 `TextInputFormatter` 通常的工作方式，或者是 Dart 代码直接设置 `TextEditingController.value` 时发生的情况。


## Migration guide

## 迁移指南


If you previously implemented or extended `TextEditingClient`,
you must now add the appropriate override for `currentTextEditingValue`.

如果你之前实现或扩展了“TextEditingClient”，则现在必须为“currentTextEditingValue”添加适当的覆盖。


This value may be null.

该值可能为空。


If you want to migrate _before_ this change lands,
you can add a class to your class
similar to the following:

如果你想在更改发生之前迁移，你可以向你的类中添加一个类，类似于以下内容：


```dart
abstract class _TemporaryTextEditingClient {
  TextEditingValue get currentTextEditingValue;
}
```

This allows you to add the new member with an
`@override` annotation before the change lands
in the framework. Later, you can remove the
temporary interface definition.

这让你在更改进入框架之前添加带有“@override”注释的新成员。稍后，你可以删除临时接口定义。


Code before migration:

迁移前的代码：


```dart
class _MyCustomTextWidgetState extends State<MyCustomWidget> implements TextEditingClient {
  ...

  @override
  void updateEditingValue(TextEditingValue value) {
    ...
  }

  @override
  void performAction(TextInputAction action) {
    ...
  }

  @override
  void updateFloatingCursor(RawFloatingCursorPoint point) {
    ...
  }
}
```

Code after migration:

迁移后的代码：


```dart
class _MyCustomTextWidgetState extends State<MyCustomWidget> implements TextEditingClient {
  ...

  @override
  TextEditingValue get currentTextEditingValue => widget.textEditingController.value;

  @override
  void updateEditingValue(TextEditingValue value) {
    ...
  }

  @override
  void performAction(TextInputAction action) {
    ...
  }

  @override
  void updateFloatingCursor(RawFloatingCursorPoint point) {
    ...
  }
}
```

## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


API documentation:

API 文档：


* [`TextInput`][]


* [`TextInputClient`][]


* [`EditableText`][]


* [`SystemChannels.textInput`][]

  [`SystemChannels.textInput`][]


Relevant issue:

相关问题：


* [Issue 47137][]

  [问题 47137][Issue 47137]


Relevant PR:

相关公关：


* [Fix requestExistingInputState response][]

  [修复 requestExistingInputState 响应][Fix requestExistingInputState response]


[`EditableText`]: {{site.api}}/flutter/widgets/EditableText-class.html
[Fix requestExistingInputState response]: {{site.repo.flutter}}/pull/47472
[Issue 47137]: {{site.repo.flutter}}/issues/47137
[`TextInput`]: {{site.api}}/flutter/services/TextInput-class.html
[`TextInputClient`]: {{site.api}}/flutter/services/TextInputClient-class.html
[`SystemChannels.textInput`]: {{site.api}}/flutter/services/SystemChannels/textInput-constant.html
