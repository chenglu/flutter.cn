---
# title: Actions API revision
title: 操作 API 修订
# description: >
#   Removes need for FocusNode in invocations, map Intent types to Actions.
description: >-
  消除了调用中对 FocusNode 的需要，将 Intent 类型映射到 Actions。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


In Flutter an [`Intent`][] is an object that's typically bound
to a keyboard key combination using the [`Shortcuts`][] widget.
An `Intent` can be bound to an [`Action`][],
which can update the application's state or perform other operations.
In the course of using this API, we identified several drawbacks
in the design, so we have updated the Actions API to make it easier
to use and understand.

在 Flutter 中[`Intent`][]是一个通常使用以下方式绑定到键盘组合键的对象[`Shortcuts`][]widget。 `Intent` 可以绑定到[`Action`][]，它可以更新应用程序的状态或执行其他操作。在使用此 API 的过程中，我们发现了设计中的几个缺陷，因此我们更新了 Actions API，使其更易于使用和理解。


In the previous Actions API design, actions were mapped from a
[`LocalKey`][] to an `ActionFactory` that created a new
`Action` each time the `invoke` method was called.
In the current API, actions are mapped from the type of the `Intent`
to an `Action` instance (with a `Map<Type, Action>`),
and they are not created anew for each invocation.

在之前的 Actions API 设计中，操作是从[`LocalKey`][]到每次调用 `invoke` 方法时都会创建一个新的 `Action` 的 `ActionFactory` 。在当前 API 中，操作从 `Intent` 类型映射到 `Action` 实例（带有 `Map<Type, Action>`），并且不会为每次调用重新创建它们。


## Context

## 背景


The original Actions API design was oriented towards invoking actions from
widgets, and having those actions act in the context of the widget.
Teams have been using actions, and found several limitations in that
design that needed to be addressed:

最初的 Actions API 设计面向从 widgets 调用操作，并使这些操作在 widget 的上下文中执行。团队一直在使用操作，并发现该设计中存在一些需要解决的限制：


1. Actions couldn't be invoked from outside of the widget hierarchy.

  无法从 widget 层次结构外部调用操作。

   Examples of this include processing a script of commands,
   some undo architectures, and some controller architectures.

这方面的示例包括处理命令脚本、一些撤消架构和一些控制器架构。


1. The mapping from shortcut key to `Intent` and then to

  从快捷键到`Intent`的映射，然后到

   `Action` wasn't always clear, since the data structures
   mapped LogicalKeySet =>Intent and then
   `LocalKey` => `ActionFactory`. The new mapping is still
   `LogicalKeySet` to `Intent` but then it maps `Type`
   (`Intent` type) to `Action`, which is more direct and
   readable, since the type of the intent is written in the mapping.

`Action` 并不总是很清楚，因为数据结构映射 LogicalKeySet =>Intent，然后 `LocalKey` => `ActionFactory`。新的映射仍然是 `LogicalKeySet` 到 `Intent` ，但随后它将 `Type` （`Intent` 类型）映射到 `Action` ，这更直接和可读，因为意图的类型是写在映射中的。


1. If the key binding for an action was in another part of the

  如果某个操作的键绑定位于该操作的另一部分

   widget hierarchy, it was not always possible for the `Intent`
   to have access to the state necessary to decide if the
   intent/action should be enabled or not.

widget 层次结构中，`Intent` 并不总是能够访问决定是否应启用意图/操作所需的状态。


To address these issues, we made some significant changes to the API.
The mapping of actions was made more intuitive,
and the enabled interface was moved to the `Action` class.
Some unnecessary arguments were removed from the `Action`'s
`invoke` method and its constructor, and actions were allowed
to return results from their invoke method.
Actions were made into generics, accepting the type of `Intent`
they handle, and `LocalKeys` were no longer used for identifying
which action to run, and the type of the `Intent` is used instead.

为了解决这些 issues，我们对 API 进行了一些重大更改。操作映射变得更加直观，并且启用的接口已移至 `Action` 类。从 `Action` 的 `invoke` 方法及其构造函数中删除了一些不必要的参数，并且允许操作从其调用方法返回结果。操作被制成泛型，接受它们处理的 `Intent` 类型，并且 `LocalKeys` 不再用于识别要运行的操作，而是使用 `Intent` 的类型。


The majority of these changes were made in the PRs for
[Revise Action API][] and [Make Action.enabled be
isEnabled(Intent intent) instead][], and are
described in detail in [the design
doc](/go/actions-and-shortcuts-design-revision).

其中大部分更改是在 PR 中进行的[Revise Action API][]和[Make Action.enabled be isEnabled(Intent intent) instead][]，并在中详细描述[the design doc](/go/actions-and-shortcuts-design-revision).


## Description of change

## 变更说明


Here are the changes made to address the above problems:

以下是为解决上述问题所做的更改：


1. The `Map<LocalKey, ActionFactory>` that was given to the [`Actions`][] widget

  提供给的 `Map<LocalKey, ActionFactory>`[`Actions`][]widget

   is now a `Map<Type, Action<Intent>>` (the type is the type of the Intent to
   be passed to the Action).

现在是 `Map<Type, Action<Intent>>` （类型是要传递给操作的 Intent 的类型）。

1. The `isEnabled` method was moved from the `Intent` class to the `Action`

  `isEnabled` 方法已从 `Intent` 类移至 `Action`

   class.

班级。

1. The `FocusNode` argument to `Action.invoke` and `Actions.invoke` methods was removed.

  `Action.invoke` 和 `Actions.invoke` 方法的 `FocusNode` 参数已被删除。

1. Invoking an action no longer creates a new instance of the `Action`.

  调用操作不再创建 `Action` 的新实例。

1. The `LocalKey` argument to the `Intent` constructor was removed.

  `Intent` 构造函数的 `LocalKey` 参数已被删除。

1. The `LocalKey` argument to `CallbackAction` was removed.

  `CallbackAction` 的 `LocalKey` 参数已被删除。

1. The `Action` class is now a generic (`Action<T extends Intent>`) for better

  `Action` 类现在是一个通用类 (`Action<T extends Intent>`)，以便更好地

   type safety.

类型安全。

1. The `OnInvokeCallback` used by `CallbackAction` no longer takes a `FocusNode`

  `CallbackAction` 使用的 `OnInvokeCallback` 不再需要 `FocusNode`

   argument.

争论。

1. The `ActionDispatcher.invokeAction` signature has changed to not accept an

  `ActionDispatcher.invokeAction` 签名已更改为不接受

   optional `FocusNode`, but instead take an optional `BuildContext`.

可选的 `FocusNode`，而是采用可选的 `BuildContext`。

1. The `LocalKey` static constants (named key by convention) in `Action`

  `Action` 中的 `LocalKey` 静态常量（按照约定命名为 key）

   subclasses have been removed.

子类已被删除。

1. The `Action.invoke` and `ActionDispatcher.invokeAction` methods now return

  `Action.invoke` 和 `ActionDispatcher.invokeAction` 方法现在返回

   the result of invoking the action as an `Object`.

将操作作为 `Object` 调用的结果。

1. The `Action` class may now be listened to for state changes.

  现在可以监听 `Action` 类的状态更改。

1. The `ActionFactory` typedef has been removed, as it is no longer used.

  `ActionFactory` typedef 已被删除，因为它不再使用。


## Example analyzer failures

## 分析仪故障示例


Here are some example analyzer failures that might be encountered where an
outdated use of the Actions API might be the cause of the problem. The specifics
of the error might differ, and there may be other failures caused by these
changes.

以下是一些可能会遇到的分析器故障示例，其中过时的操作 API 使用可能是问题的原因。错误的具体情况可能有所不同，并且这些更改可能会导致其他故障。


```plaintext
error: MyActionDispatcher.invokeAction' ('bool Function(Action<Intent>, Intent, {FocusNode focusNode})') isn't a valid override of 'ActionDispatcher.invokeAction' ('Object Function(Action<Intent>, Intent, [BuildContext])'). (invalid_override at [main] lib/main.dart:74)

error: MyAction.invoke' ('void Function(FocusNode, Intent)') isn't a valid override of 'Action.invoke' ('Object Function(Intent)'). (invalid_override at [main] lib/main.dart:231)

error: The method 'isEnabled' isn't defined for the type 'Intent'. (undefined_method at [main] lib/main.dart:97)

error: The argument type 'Null Function(FocusNode, Intent)' can't be assigned to the parameter type 'Object Function(Intent)'. (argument_type_not_assignable at [main] lib/main.dart:176)

error: The getter 'key' isn't defined for the type 'NextFocusAction'. (undefined_getter at [main] lib/main.dart:294)

error: The argument type 'Map<LocalKey, dynamic>' can't be assigned to the parameter type 'Map<Type, Action<Intent>>'. (argument_type_not_assignable at [main] lib/main.dart:418)
```

## Migration guide

## 迁移指南


Significant changes area required to update existing code
to the new API.

将现有代码更新到新 API 需要进行重大更改。


### Actions mapping for pre-defined actions

### 预定义操作的操作映射


To update the action maps in the `Actions` widget for
predefined actions in Flutter, like `ActivateAction`
and `SelectAction`, do the following:

要为 Flutter 中的预定义操作（例如 `ActivateAction` 和 `SelectAction`）更新 `Actions` widget 中的操作映射，请执行以下操作：


* Update the argument type of the `actions` argument

  更新 `actions` 参数的参数类型

* Use an instance of a specific `Intent` class in the

  在中使用特定 `Intent` 类的实例

  `Shortcuts` mapping, rather than an `Intent(TheAction.key)`
  instance.

`Shortcuts` 映射，而不是 `Intent(TheAction.key)` 实例。


Code before migration:

迁移前的代码：


```dart
class MyWidget extends StatelessWidget {
  // ...
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent> {
        LogicalKeySet(LogicalKeyboardKey.enter): Intent(ActivateAction.key),
      },
      child: Actions(
        actions: <LocalKey, ActionFactory>{
          Activate.key: () => ActivateAction(),
        },
        child: Container(),
      )
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
class MyWidget extends StatelessWidget {
  // ...
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent> {
        LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent,
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          ActivateIntent: ActivateAction(),
        },
        child: Container(),
      )
    );
  }
}
```

### Custom actions

### 自定义操作


To migrate your custom actions, eliminate the `LocalKeys`
you've defined, and replace them with `Intent` subclasses,
as well as changing the type of the argument to the `actions`
argument of the `Actions` widget.

要迁移自定义操作，请消除你定义的 `LocalKeys`，并将其替换为 `Intent` 子类，并将参数类型更改为 `Actions` widget 的 `actions` 参数。


Code before migration:

迁移前的代码：


```dart
class MyAction extends Action {
  MyAction() : super(key);

  /// The [LocalKey] that uniquely identifies this action to an [Intent].
  static const LocalKey key = ValueKey<Type>(RequestFocusAction);

  @override
  void invoke(FocusNode node, MyIntent intent) {
    // ...
  }
}

class MyWidget extends StatelessWidget {
  // ...
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent> {
        LogicalKeySet(LogicalKeyboardKey.enter): Intent(MyAction.key),
      },
      child: Actions(
        actions: <LocalKey, ActionFactory>{
          MyAction.key: () => MyAction(),
        },
        child: Container(),
      )
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
// You may need to create new Intent subclasses if you used
// a bare LocalKey before.
class MyIntent extends Intent {
  const MyIntent();
}

class MyAction extends Action<MyIntent> {
  @override
  Object invoke(MyIntent intent) {
    // ...
  }
}

class MyWidget extends StatelessWidget {
  // ...
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent> {
        LogicalKeySet(LogicalKeyboardKey.enter): MyIntent,
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          MyIntent: MyAction(),
        },
        child: Container(),
      )
    );
  }
}
```

### Custom `Actions` and `Intents` with arguments

### 带参数的自定义 `Actions` 和 `Intents`


To update actions that use intent arguments or hold state,
you need to modify the arguments to the `invoke` method.
In the example below, the code keeps the value of the
argument in the intent as part of the action instance.
This is because in the old design there is a new instance
of the action created each time it's executed,
and the resulting action could be kept by the
[`ActionDispatcher`][] to record the state.

要更新使用意图参数或保持状态的操作，你需要修改 `invoke` 方法的参数。在下面的示例中，代码将意图中的参数值保留为操作实例的一部分。这是因为在旧的设计中，每次执行时都会创建一个新的操作实例，并且生成的操作可以由[`ActionDispatcher`][]来记录状态。


In the example of post migration code below,
the new `MyAction` returns the state as the result
of calling `invoke`, since a new instance isn't created
for each invocation. This state is returned to the caller of
`Actions.invoke`, or `ActionDispatcher.invokeAction`,
depending on how the action is invoked.

在下面的迁移后代码示例中，新的 `MyAction` 返回状态作为调用 `invoke` 的结果，因为不会为每次调用创建新实例。此状态将返回给 `Actions.invoke` 或 `ActionDispatcher.invokeAction` 的调用者，具体取决于操作的调用方式。


Code before migration:

迁移前的代码：


```dart
class MyIntent extends Intent {
  const MyIntent({this.argument});

  final int argument;
}

class MyAction extends Action {
  MyAction() : super(key);

  /// The [LocalKey] that uniquely identifies this action to an [Intent].
  static const LocalKey key = ValueKey<Type>(RequestFocusAction);

  int state;

  @override
  void invoke(FocusNode node, MyIntent intent) {
    // ...
    state = intent.argument;
  }
}
```

Code after migration:

迁移后的代码：


```dart
class MyIntent extends Intent {
  const MyIntent({this.argument});

  final int argument;
}

class MyAction extends Action<MyIntent> {
  @override
  int invoke(Intent intent) {
    // ...
    return intent.argument;
  }
}
```

## Timeline

## 时间线


Landed in version: 1.18<br>
登陆版本：1.18
In stable release: 1.20
稳定版本：1.20

## References

## 参考资料


API documentation:

API 文档：


* [`Action`][]
* [`ActionDispatcher`][]
* [`Actions`][]
* [`Intent`][]
* [`Shortcuts`][]

Relevant issue:

相关issue：


* [Issue 53276][]

  [问题 53276][Issue 53276]


Relevant PRs:

相关 PR：


* [Revise Action API][]

  [修改操作API][Revise Action API]

* [Make Action.enabled be isEnabled(Intent intent) instead][]

  [将 Action.enabled 改为 isEnabled(Intent Intent)][Make Action.enabled be isEnabled(Intent intent) instead]


[`Action`]: {{site.api}}/flutter/widgets/Action-class.html
[`ActionDispatcher`]: {{site.api}}/flutter/widgets/ActionDispatcher-class.html
[`Actions`]: {{site.api}}/flutter/widgets/Actions-class.html
[`Intent`]: {{site.api}}/flutter/widgets/Intent-class.html
[Issue 53276]: {{site.repo.flutter}}/issues/53276
[`LocalKey`]: {{site.api}}/flutter/foundation/LocalKey-class.html
[Make Action.enabled be isEnabled(Intent intent) instead]: {{site.repo.flutter}}/pull/55230
[Revise Action API]: {{site.repo.flutter}}/pull/42940
[`Shortcuts`]: {{site.api}}/flutter/widgets/Shortcuts-class.html
