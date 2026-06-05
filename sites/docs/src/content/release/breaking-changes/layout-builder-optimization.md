---
# title: LayoutBuilder optimization
# description: >
#   LayoutBuilder and SliverLayoutBuilder call the builder function less often.
title: LayoutBuilder 优化
description: LayoutBuilder 和 SliverLayoutBuilder 调用 builder 函数的频率降低。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

This guide explains how to migrate Flutter applications after
[the LayoutBuilder optimization][1].

本指南介绍在 [LayoutBuilder 优化][1] 之后如何迁移 Flutter 应用。

## Context

## 背景

[LayoutBuilder][2] and [SliverLayoutBuilder][3] call
the [builder][4] function more often than necessary to
fulfill their primary goal of allowing apps to adapt their
widget structure to parent layout constraints.
This has led to less efficient and jankier applications
because widgets are rebuilt unnecessarily.

[LayoutBuilder][2] 和 [SliverLayoutBuilder][3] 调用
[builder][4] 函数的频率高于实现其主要目标所需的频率，
其主要目标是让应用根据父布局约束调整 widget 结构。
这导致应用效率更低且更卡顿，因为 widget 被不必要地重建。

因为 widget 被不必要地重建，这导致应用效率更低且更卡顿。

This transitively affects [OrientationBuilder][5] as well.

这也间接影响了 [OrientationBuilder][5]。

In order to improve app performance
the [LayoutBuilder optimization][1] was made,
which results in calling the `builder` function less often.

进行了 [LayoutBuilder 优化][1]，使 `builder` 函数调用频率降低。

Apps that rely on this function to be called with a certain frequency may break.

依赖该函数以特定频率被调用的应用可能会出现问题。
The app may exhibit some combination of the following symptoms:

应用可能表现出以下症状的组合：

* The `builder` function is not called when it would before the upgrade to the
  Flutter version that introduced the optimization.

  升级到引入此优化的 Flutter 版本后，`builder` 函数不再像之前那样被调用。

* The UI of a widget is missing.

  widget 的 UI 缺失。
* The UI of a widget is not updating.

  widget 的 UI 未更新。

## Description of change

## 变更说明

Prior to the optimization the builder function passed to `LayoutBuilder` or
`SliverLayoutBuilder` was called when any one of the following happened:

优化前，传递给 `LayoutBuilder` 或 `SliverLayoutBuilder` 的 builder 函数
在以下任一情况发生时会被调用：

1. `LayoutBuilder` is rebuilt due to a widget configuration change
   (this typically happens when the widget that uses `LayoutBuilder` rebuilds
   due to `setState`, `didUpdateWidget` or `didChangeDependencies`).

1. `LayoutBuilder` 因 widget 配置变更而重建
   （通常在使用 `LayoutBuilder` 的 widget 因 `setState`、`didUpdateWidget` 或 `didChangeDependencies` 重建时发生）。
1. `LayoutBuilder` is laid out and receives layout constraints from its parent
   that are _different_ from the last received constraints.

1. `LayoutBuilder` 被布局并从父级接收与上次不同的布局约束。
1. `LayoutBuilder` is laid out and receives layout constraints from its parent
   that are the _same_ as the constraints received last time.

1. `LayoutBuilder` 被布局并从父级接收与上次相同的布局约束。

After the optimization the builder function is no longer called in the latter
case. If the constraints are the same and the widget configuration did not
change, the builder function is not called.

优化后，builder 函数在后一种情况下不再被调用。
如果约束相同且 widget 配置未变更，builder 函数不会被调用。

Your app can break if it relies on the relayout to cause the rebuilding of the
`LayoutBuilder` rather than on an explicit call to `setState`. This usually
happens by accident. You meant to add `setState`, but you forgot because the app
continued functioning as you wanted, and therefore nothing reminded you to add
it.

如果你的应用依赖重新布局来触发 `LayoutBuilder` 重建
而非显式调用 `setState`，应用可能会出现问题。
这通常是意外发生的。你本想添加 `setState`，但忘记了，
因为应用仍按你期望的方式运行，因此没有提醒你添加。

## Migration guide

## 迁移指南

Look for usages of `LayoutBuilder` and `SliverLayoutBuilder` and make sure to
call `setState` any time the widget state changes.

查找 `LayoutBuilder` 和 `SliverLayoutBuilder` 的用法，
确保在 widget 状态每次变更时调用 `setState`。

**Example**: in the example below the contents of the builder function depend
on the value of the `_counter` field. Therefore, whenever the value is updated,
you should call `setState` to tell the framework to rebuild the widget. However,
this example may have previously worked even without calling `setState`, if the
`_ResizingBox` triggers a relayout of `LayoutBuilder`.

**示例**：在以下示例中，builder 函数的内容取决于 `_counter` 字段的值。
因此，每当值更新时，应调用 `setState` 告诉框架重建 widget。
然而，如果 `_ResizingBox` 触发 `LayoutBuilder` 重新布局，
此示例先前可能即使不调用 `setState` 也能工作。

Code before migration (note the missing `setState` inside the `onPressed`
callback):

迁移前的代码（注意 `onPressed` 回调中缺少 `setState`）：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return _ResizingBox(
            TextButton(
                onPressed: () {
                  _counter++;
                },
                child: Text('Increment Counter')),
            Text(_counter.toString()),
          );
        },
      ),
    ));
  }
}

class _ResizingBox extends StatefulWidget {
  _ResizingBox(this.child1, this.child2);

  final Widget child1;
  final Widget child2;

  @override
  State<StatefulWidget> createState() => _ResizingBoxState();
}

class _ResizingBoxState extends State<_ResizingBox>
    with SingleTickerProviderStateMixin {
  Animation animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )
      ..forward()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100 + animation.value * 100,
          child: widget.child1,
        ),
        SizedBox(
          width: 100 + animation.value * 100,
          child: widget.child2,
        ),
      ],
    );
  }
}
```

Code after migration (`setState` added to `onPressed`):

迁移后的代码（在 `onPressed` 中添加了 `setState`）：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return _ResizingBox(
            TextButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: Text('Increment Counter')),
            Text(_counter.toString()),
          );
        },
      ),
    ));
  }
}

class _ResizingBox extends StatefulWidget {
  _ResizingBox(this.child1, this.child2);

  final Widget child1;
  final Widget child2;

  @override
  State<StatefulWidget> createState() => _ResizingBoxState();
}

class _ResizingBoxState extends State<_ResizingBox>
    with SingleTickerProviderStateMixin {
  Animation animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )
      ..forward()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100 + animation.value * 100,
          child: widget.child1,
        ),
        SizedBox(
          width: 100 + animation.value * 100,
          child: widget.child2,
        ),
      ],
    );
  }
}
```

Watch for usages of `Animation` and `LayoutBuilder` in the same widget.
Animations have internal mutable state that changes on every frame. If the
logic of your builder function depends on the value of the animation, it may
require a `setState` to update in tandem with the animation. To do that, add an
[animation listener][7] that calls `setState`, like so:

注意在同一 widget 中使用 `Animation` 和 `LayoutBuilder`。
动画有每帧变化的内部可变状态。如果 builder 函数的逻辑依赖动画值，
可能需要 `setState` 与动画同步更新。为此，添加调用 `setState` 的
[动画监听器][7]，如下：

```dart
Animation animation = … create animation …;
animation.addListener(() {
  setState(() {
    // Intentionally empty. The state is inside the animation object.
  });
});
```

## Timeline

## 时间线

This change was released in Flutter v1.20.0.

此变更在 Flutter v1.20.0 中发布。

## References

## 参考资料

API documentation:

API 文档：

* [`LayoutBuilder`][2]
* [`SliverLayoutBuilder`][3]

Relevant issue:

相关 issue：

* [Issue 6469][8]

Relevant PR:

相关 PR：

* [LayoutBuilder: skip calling builder when constraints are the same][6]

* LayoutBuilder：约束相同时跳过调用 builder

[1]: /go/layout-builder-optimization
[2]: {{site.api}}/flutter/widgets/LayoutBuilder-class.html
[3]: {{site.api}}/flutter/widgets/SliverLayoutBuilder-class.html
[4]: {{site.api}}/flutter/widgets/LayoutBuilder/builder.html
[5]: {{site.api}}/flutter/widgets/OrientationBuilder-class.html
[6]: {{site.repo.flutter}}/pull/55414
[7]: {{site.api}}/flutter/animation/Animation/addListener.html
[8]: {{site.repo.flutter}}/issues/6469
