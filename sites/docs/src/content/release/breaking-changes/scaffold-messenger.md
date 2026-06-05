---
# title: SnackBars managed by the ScaffoldMessenger
title: 由 ScaffoldMessenger 管理的 SnackBars
# description: >
#   SnackBars are now managed by the ScaffoldMessenger, and persist across routes.
description: >
  SnackBars 现在由 ScaffoldMessenger 管理，并跨路由持续存在。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The `SnackBar` API within the `Scaffold` is now handled by the
`ScaffoldMessenger`, one of which is
available by default within the context of a `MaterialApp`.

“Scaffold”中的“SnackBar” API 现在由“ScaffoldMessenger”处理，其中之一默认在“MaterialApp”上下文中可用。


## Context

## 背景


Prior to this change, `SnackBar`s would be shown by calling
on the `Scaffold` within the current `BuildContext`.
By calling `Scaffold.of(context).showSnackBar`,
the current `Scaffold` would animate a `SnackBar` into view.
This would only apply to the current `Scaffold`,
and would not persist across routes if they were changed
in the course of the `SnackBar`s presentation.
This would also lead to errors if `showSnackBar`
would be called in the course of executing an
asynchronous event, and the `BuildContext` became invalidated
by the route changing and the `Scaffold` being disposed of.

在此更改之前，“SnackBar”将通过调用当前“BuildContext”中的“Scaffold”来显示。通过调用“Scaffold.of(context).showSnackBar”，当前的“Scaffold”会将“SnackBar”动画显示到视图中。这仅适用于当前的“Scaffold”，并且如果在“SnackBar”演示过程中更改了路由，则不会在路由之间持续存在。如果在执行异步事件的过程中调用“showSnackBar”，并且“BuildContext”因路由更改和“Scaffold”被处置而变得无效，这也会导致错误。


The `ScaffoldMessenger` now handles `SnackBar`s in order to
persist across routes and always be displayed on the current `Scaffold`.
By default, a root `ScaffoldMessenger` is included in the `MaterialApp`,
but you can create your own controlled scope for the `ScaffoldMessenger`
to further control _which_ `Scaffold`s receive your `SnackBar`s.

`ScaffoldMessenger` 现在可以处理 `SnackBar`，以便跨路由持久存在并始终显示在当前的 `Scaffold` 上。默认情况下，根“ScaffoldMessenger”包含在“MaterialApp”中，但你可以为“ScaffoldMessenger”创建自己的受控范围，以进一步控制“Scaffold”接收你的“SnackBar”。


## Description of change

## 变更说明


The previous approach called upon the `Scaffold` to show a `SnackBar`.

之前的方法调用“Scaffold”来显示“SnackBar”。


```dart
Scaffold(
  key: scaffoldKey,
  body: Builder(
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: const Text('snack'),
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
              label: 'ACTION',
              onPressed: () { },
            ),
          ));
        },
        child: const Text('SHOW SNACK'),
      );
    },
  )
);
```

The new approach calls on the `ScaffoldMessenger` to show
the `SnackBar`. In this case, the `Builder` is no longer
required to provide a new scope with a `BuildContext` that
is `under` the `Scaffold`.

新方法调用“ScaffoldMessenger”来显示“SnackBar”。在这种情况下，“Builder”不再需要提供位于“Scaffold”“下方”的“BuildContext”的新作用域。


```dart
Scaffold(
  key: scaffoldKey,
  body: GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('snack'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () { },
        ),
      ));
    },
    child: const Text('SHOW SNACK'),
  ),
);
```

When presenting a `SnackBar` during a transition,
the `SnackBar` completes a `Hero` animation,
moving smoothly to the next page.

在过渡期间呈现“SnackBar”时，“SnackBar”会完成“Hero”动画，平滑地移动到下一页。


The `ScaffoldMessenger` creates a scope in which all descendant
`Scaffold`s register to receive `SnackBar`s,
which is how they persist across these transitions.
When using the root `ScaffoldMessenger` provided by the
`MaterialApp`, all descendant `Scaffold`s receive `SnackBar`s,
unless a new `ScaffoldMessenger` scope is created further down the tree.
By instantiating your own `ScaffoldMessenger`,
you can control which `Scaffold`s receive `SnackBar`s, and which are not,
based on the context of your application.

`ScaffoldMessenger` 创建一个范围，所有后代 `Scaffold` 都在其中注册以接收 `SnackBar`，这就是它们在这些转换中持续存在的方式。当使用“MaterialApp”提供的根“ScaffoldMessenger”时，所有后代“Scaffold”都会收到“SnackBar”，除非在树的更下方创建了新的“ScaffoldMessenger”范围。通过实例化你自己的“ScaffoldMessenger”，你可以根据应用程序的上下文控制哪些“Scaffold”接收“SnackBar”，哪些不接收。


The method `debugCheckHasScaffoldMessenger` is available to assert
that a given context has a `ScaffoldMessenger` ancestor.
Trying to present  a `SnackBar` without a `ScaffoldMessenger` ancestor
present results in an assertion such as the following:

“debugCheckHasScaffoldMessenger”方法可用于断言给定上下文具有“ScaffoldMessenger”祖先。尝试在没有“ScaffoldMessenger”祖先存在的情况下呈现“SnackBar”会导致如下断言：


```plaintext
No ScaffoldMessenger widget found.
Scaffold widgets require a ScaffoldMessenger widget ancestor.
Typically, the ScaffoldMessenger widget is introduced by the MaterialApp
at the top of your application widget tree.
```

## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```dart
// The ScaffoldState of the current context was used for managing SnackBars.
Scaffold.of(context).showSnackBar(mySnackBar);
Scaffold.of(context).hideCurrentSnackBar(mySnackBar);
Scaffold.of(context).removeCurrentSnackBar(mySnackBar);

// If a Scaffold.key is specified, the ScaffoldState can be directly
// accessed without first obtaining it from a BuildContext via
// Scaffold.of. From the key, use the GlobalKey.currentState
// getter. This was previously used to manage SnackBars.
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
Scaffold(
  key: scaffoldKey,
  body: ...,
);

scaffoldKey.currentState.showSnackBar(mySnackBar);
scaffoldKey.currentState.hideCurrentSnackBar(mySnackBar);
scaffoldKey.currentState.removeCurrentSnackBar(mySnackBar);

```

Code after migration:

迁移后的代码：


```dart
// The ScaffoldMessengerState of the current context is used for managing SnackBars.
ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
ScaffoldMessenger.of(context).hideCurrentSnackBar(mySnackBar);
ScaffoldMessenger.of(context).removeCurrentSnackBar(mySnackBar);

// If a ScaffoldMessenger.key is specified, the ScaffoldMessengerState can be directly
// accessed without first obtaining it from a BuildContext via
// ScaffoldMessenger.of. From the key, use the GlobalKey.currentState
// getter. This is used to manage SnackBars.
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
ScaffoldMessenger(
  key: scaffoldMessengerKey,
  child: ...
)

scaffoldMessengerKey.currentState.showSnackBar(mySnackBar);
scaffoldMessengerKey.currentState.hideCurrentSnackBar(mySnackBar);
scaffoldMessengerKey.currentState.removeCurrentSnackBar(mySnackBar);

// The root ScaffoldMessenger can also be accessed by providing a key to
// MaterialApp.scaffoldMessengerKey. This way, the ScaffoldMessengerState can be directly accessed
// without first obtaining it from a BuildContext via ScaffoldMessenger.of. From the key, use
// the GlobalKey.currentState getter.
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
MaterialApp(
  scaffoldMessengerKey: rootScaffoldMessengerKey,
  home: ...
)

rootScaffoldMessengerKey.currentState.showSnackBar(mySnackBar);
rootScaffoldMessengerKey.currentState.hideCurrentSnackBar(mySnackBar);
rootScaffoldMessengerKey.currentState.removeCurrentSnackBar(mySnackBar);
```

## Timeline

## 时间轴


Landed in version: 1.23.0-13.0.pre<br>
In stable release: 2.0.0

登陆版本：1.23.0-13.0.pre<br> 稳定版本：2.0.0


## References

## 参考


API documentation:

API 文档：


* [`Scaffold`][]


* [`ScaffoldMessenger`][]


* [`SnackBar`][]


* [`MaterialApp`][]

  [`MaterialApp`][]


Relevant issues:

相关问题：


* [Issue #57218][]

  [问题#57218][Issue #57218]

* [Issue #62921][]

  [问题#62921][Issue #62921]


Relevant PRs:

相关 PR：


* [ScaffoldMessenger][]


* [ScaffoldMessenger Migration][]

  [ScaffoldMessenger 迁移][ScaffoldMessenger]


[`Scaffold`]: {{site.api}}/flutter/material/Scaffold-class.html
[`ScaffoldMessenger`]: {{site.api}}/flutter/material/ScaffoldMessenger-class.html
[`SnackBar`]: {{site.api}}/flutter/material/SnackBar-class.html
[`MaterialApp`]: {{site.api}}/flutter/material/MaterialApp-class.html
[Issue #57218]: {{site.repo.flutter}}/issues/57218
[Issue #62921]: {{site.repo.flutter}}/issues/62921
[ScaffoldMessenger]: {{site.repo.flutter}}/pull/64101
[ScaffoldMessenger Migration]: {{site.repo.flutter}}/pull/64170
