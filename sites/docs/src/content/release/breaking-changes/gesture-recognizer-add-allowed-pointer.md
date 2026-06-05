---
# title: GestureRecognizer cleanup
title: GestureRecognizer 清理
# description: >
#   OneSequenceGestureRecognizer subclasses should
#   override `addAllowedPointer` to take a `PointerDownEvent`
description: >
  OneSequenceGestureRecognizer 子类应重写 `addAllowedPointer`，
  使其接受 `PointerDownEvent` 参数。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`OneSequenceGestureRecognizer.addAllowedPointer()` was changed to take a
`PointerDownEvent`, like its superclass. Previously, it accepted the more
general `PointerEvent` type, which was incorrect.

`OneSequenceGestureRecognizer.addAllowedPointer()` 已更改为接受
`PointerDownEvent`，与其超类一致。
此前它接受更通用的 `PointerEvent` 类型，这是不正确的。

## Context

## 背景

The framework only ever passes `PointerDownEvent` objects to
`addAllowedPointer()`. Declaring
`OneSequenceGestureRecognizer.addAllowedPointer()` to take the more general
type was confusing, and caused `OneSequenceGestureRecognizer` subclasses to
have to cast their argument to the right class.

框架只会向 `addAllowedPointer()` 传递 `PointerDownEvent` 对象。
将 `OneSequenceGestureRecognizer.addAllowedPointer()` 声明为接受更通用的类型
令人困惑，并导致 `OneSequenceGestureRecognizer` 子类
必须将参数转型为正确的类。

## Description of change

## 变更说明

The previous declaration forced `OneSequenceGestureRecognizer` descendants to
override `addAllowedPointer()` like so:

先前的声明迫使 `OneSequenceGestureRecognizer` 后代
这样重写 `addAllowedPointer()`：

```dart
class CustomGestureRecognizer extends ScaleGestureRecognizer {
  @override
  void addAllowedPointer(PointerEvent event) {
    // insert custom handling of event here...
    super.addAllowedPointer(event);
  }
}
```

The new method declaration will cause this code to fail with the following
error message:

新的方法声明会导致此代码失败，并显示以下错误信息：

```plaintext
super.addAllowedPointer(event); The argument type 'PointerEvent' can't be assigned to the parameter type 'PointerDownEvent'.
                                #argument_type_not_assignable

```

## Migration guide

## 迁移指南

Code before migration:

迁移前的代码：

```dart
class CustomGestureRecognizer extends ScaleGestureRecognizer {
  @override
  void addAllowedPointer(PointerEvent event) {
    // insert custom handling of event here...
    super.addAllowedPointer(event);
  }
}
```

Code after migration:

迁移后的代码：

```dart
class CustomGestureRecognizer extends ScaleGestureRecognizer {
  @override
  void addAllowedPointer(PointerDownEvent event) {
    // insert custom handling of event here...
    super.addAllowedPointer(event);
  }
}
```

## Timeline

## 时间线

Landed in version: 2.3.0-13.0.pre<br>
In stable release: 2.5

合入版本：2.3.0-13.0.pre<br>
稳定版发布：2.5

## References

## 参考资料

API documentation:

API 文档：

* [`OneSequenceGestureRecognizer`][]

Relevant PR:

相关 PR：

* [Fix addAllowedPointer() overrides][]

  [修复 addAllowedPointer() 重写][Fix addAllowedPointer() overrides]

[`OneSequenceGestureRecognizer`]: {{site.api}}/flutter/gestures/OneSequenceGestureRecognizer-class.html
[Fix addAllowedPointer() overrides]: {{site.repo.flutter}}/pull/82834
