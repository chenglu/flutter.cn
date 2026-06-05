---
# title: Migrate ShortcutActivator and ShortcutManager to KeyEvent system
title: 将 ShortcutActivator 和 ShortcutManager 迁移到 KeyEvent 系统
# description: >
#   The raw key event subsystem has been superseded by the key event subsystem,
#   and APIs that use RawKeyEvent and RawKeyboard are converted to KeyEvent and
#   HardwareKeyboard.
description: >
  原始按键事件子系统已被按键事件子系统取代，并且使用 RawKeyEvent 和 RawKeyboard 的 API 已转换为 KeyEvent 和 HardwareKeyboard。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


For some time now (years), Flutter has had two key event systems implemented.
The new system reached parity with the old platform-specific raw key event
system, and the raw system will be removed. To prepare for that, the Flutter
APIs that use the old system are being modified, and for a select few of them we
have decided to make breaking changes in the API in order to preserve the
quality of the API.

一段时间（几年）以来，Flutter 已经实现了两个关键事件系统。新系统与旧平台特定的原始按键事件系统达到了同等水平，原始系统将被删除。为此，我们正在修改使用旧系统的 Flutter API，对于其中的一些 API，我们决定对 API 进行重大更改，以保持 API 的质量。


## Context

## 背景


In the original key event subsystem handling each platform's quirks in the
framework and in client apps caused overly complex code, and the old system
didn't properly represent the true state of key events on the system.

在最初的按键事件子系统中，处理框架和客户端应用程序中每个平台的怪癖会导致代码过于复杂，并且旧系统无法正确表示系统上按键事件的真实状态。


So, the new [`KeyEvent`][]-based system was born, and to minimize breaking
changes, was implemented in parallel with the old system with the intention of
eventually deprecating the raw system. That time is quickly arriving, and to
prepare for it, we have made some minimal breaking changes required to preserve
the quality of the API.

因此，基于 [`KeyEvent`][] 的新系统诞生了，为了最大限度地减少重大更改，它与旧系统并行实施，目的是最终弃用原始系统。这个时刻很快就会到来，为了做好准备，我们进行了一些必要的最小破坏性更改，以保持 API 的质量。


## Description of change

## 变更说明


Summary of APIs that have been affected:

受影响的 API 摘要：


- `ShortcutActivator.accepts` now takes a `KeyEvent` and `HardwareKeyboard`.

  “ShortcutActivator.accepts”现在采用“KeyEvent”和“HardwareKeyboard”。

- `ShortcutActivator.isActivatedBy` is now deprecated. Just call `accepts` instead.

  `ShortcutActivator.isActivatedBy` 现已弃用。只需调用“accepts”即可。

- `ShortcutActivator.triggers` is now optional, and returns null if not implemented.

  `ShortcutActivator.triggers` 现在是可选的，如果未实现则返回 null。

- `ShortcutManager.handleKeypress` now takes a `KeyEvent`.

  `ShortcutManager.handleKeypress` 现在采用 `KeyEvent`。


The change modifies the `ShortcutActivator.accepts` method to take a `KeyEvent`
and `HardwareKeyboard` instead of the previous `RawKeyEvent` and `RawKeyboard`.

此更改修改了“ShortcutActivator.accepts”方法以采用“KeyEvent”和“HardwareKeyboard”，而不是之前的“RawKeyEvent”和“RawKeyboard”。


The meaning of `ShortcutActivator.accepts` has changed slightly. Before the
change, it was assumed that `accepts` was only called if
`ShortcutActivator.triggers` returned null, or if the key event sent to `accepts`
had a logical key that was in the `triggers` list. Now it is always called, and
may use the `triggers` list as a performance improvement, but is not required
to. Flutter subclasses such as `SingleActivator` and `CharacterActivator`
already do this.

`ShortcutActivator.accepts` 的含义略有变化。在更改之前，假设仅当“ShortcutActivator.triggers”返回 null，或者发送到“accepts”的按键事件具有“triggers”列表中的逻辑键时才调用“accepts”。现在它总是被调用，并且可以使用“触发器”列表作为性能改进，但不是必需的。 Flutter 子类（例如“SingleActivator”和“CharacterActivator”）已经做到了这一点。


The change also modifies the `ShortcutManager.handleKeypress` method to take a
`KeyEvent` instead of `RawKeyEvent`.

此更改还修改了“ShortcutManager.handleKeypress”方法以采用“KeyEvent”而不是“RawKeyEvent”。


## Migration guide

## 迁移指南


APIs provided by the Flutter framework are already migrated. Migration is
needed only if you're using any of the methods listed in the previous section.

Flutter 框架提供的 API 已经迁移。仅当你使用上一节中列出的任何方法时才需要迁移。


### Migrating your APIs that use `ShortcutActivator` or its subclasses.

### 迁移使用“ShortcutActivator”或其子类的 API。


Pass a `KeyEvent` instead of a `RawKeyEvent` to `ShortcutActivator.accepts`.
This may mean switching where you get your key events from. Depending on where
you get them, this can either mean switching to using `Focus.onKeyEvent` instead
of `Focus.onKey`, or a similar change if using `FocusScope`, `FocusNode` or
`FocusScopeNode`.

将“KeyEvent”而不是“RawKeyEvent”传递给“ShortcutActivator.accepts”。这可能意味着切换你获取关键事件的位置。根据你获取它们的位置，这可能意味着切换到使用“Focus.onKeyEvent”而不是“Focus.onKey”，或者如果使用“FocusScope”、“FocusNode”或“FocusScopeNode”，则进行类似的更改。


If you're using a `RawKeyboardListener`, switch to using a
`KeyboardListener` instead. If you're accessing `RawKeyboard` directly, use
`HardwareKeyboard` instead. You'll find that there are non-raw equivalents for
all of the key event sources.

如果你使用的是“RawKeyboardListener”，请改用“KeyboardListener”。如果你直接访问“RawKeyboard”，请改用“HardwareKeyboard”。你会发现所有关键事件源都有非原始等效项。


### Migrating your APIs that extend `ShortcutActivator`

### 迁移扩展 `ShortcutActivator` 的 API


The `ShortcutActivator.accepts` method was modified to take a `KeyEvent` and a
`HardwareKeyboard` instead of a `RawKeyEvent` and `RawKeyboard`.

“ShortcutActivator.accepts”方法已修改为采用“KeyEvent”和“HardwareKeyboard”，而不是“RawKeyEvent”和“RawKeyboard”。


Before:

前：


```dart
class MyActivator extends ShortcutActivator {
  @override
  bool accepts(RawKeyEvent event, RawKeyboard state) {
    // ... (your implementation here)
    returns false;
  }
  // ...
}
```

After:

后：


```dart
class MyActivator extends ShortcutActivator {
  @override
  bool accepts(KeyEvent event, HardwareKeyboard state) {
    // ... (your implementation here)
    returns false;
  }
  // ...
}
```

### Migrating your APIs that extend `ShortcutManager`

### 迁移扩展 `ShortcutManager` 的 API


The `ShortcutManager` class was modified to take `KeyEvent`s in `handleKeypress`
instead of `RawKeyEvent`s.  One difference in the two APIs is that repeated keys
are determined differently. In the `RawKeyEvent` case, the `repeat` member
indicated a repeat, but in `RawKeyEvent` code, the event is a different type
(`KeyRepeatEvent`).

修改了“ShortcutManager”类以采用“handleKeypress”中的“KeyEvent”而不是“RawKeyEvent”。  这两个 API 的一个区别是重复密钥的确定方式不同。在“RawKeyEvent”情况下，“repeat”成员表示重复，但在“RawKeyEvent”代码中，事件是不同的类型（“KeyRepeatEvent”）。


Before:

前：


```dart
class _MyShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    if (event is! RawKeyDownEvent) {
      return KeyEventResult.ignored;
    }
    if (event.repeat) {
      // (Do something with repeated keys.)
    }
    // ... (your implementation here)
    return KeyEventResult.handled;
  }
}
```

After:

后：


```dart
class _MyShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event is KeyRepeatEvent) {
      // (Do something with repeated keys.)
    }
    // ... (your implementation here)
    return KeyEventResult.handled;
  }
}
```

## Timeline

## 时间轴


Landed in version: 3.17.0-5.0.pre<br>
In stable release: 3.19.0

登陆版本：3.17.0-5.0.pre<br> 稳定版本：3.19.0


## References

## 参考


API documentation:

API 文档：


* [`KeyEvent`][]


* [`HardwareKeyboard`][]


* [`ShortcutActivator`][]


* [`ShortcutManager`][]


Relevant issues:

相关问题：


* [`RawKeyEvent` and `RawKeyboard`, et al should be deprecated and removed (Issue 136419)][]

  [`RawKeyEvent` 和 `RawKeyboard` 等应弃用并删除（问题 136419）][`RawKeyEvent` and `RawKeyboard`, et al should be deprecated and removed (Issue 136419)]


Relevant PRs:

相关 PR：


* [Prepare ShortcutActivator and ShortcutManager to migrate to KeyEvent from RawKeyEvent][]

  [准备 ShortcutActivator 和 ShortcutManager 从 RawKeyEvent 迁移到 KeyEvent][Prepare ShortcutActivator and ShortcutManager to migrate to KeyEvent from RawKeyEvent]


[`KeyEvent`]: {{site.api}}/flutter/services/KeyEvent-class.html
[`HardwareKeyboard`]: {{site.api}}/flutter/services/HardwareKeyboard-class.html
[`ShortcutActivator`]: {{site.api}}/flutter/widgets/ShortcutActivator-class.html
[`ShortcutManager`]: {{site.api}}/flutter/widgets/ShortcutManager-class.html
[`RawKeyEvent` and `RawKeyboard`, et al should be deprecated and removed (Issue 136419)]: {{site.repo.flutter}}/issues/136419
[Prepare ShortcutActivator and ShortcutManager to migrate to KeyEvent from RawKeyEvent]: {{site.repo.flutter}}/pull/136854
