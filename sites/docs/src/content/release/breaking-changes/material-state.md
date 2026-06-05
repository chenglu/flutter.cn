---
# title: Rename MaterialState to WidgetState
title: 将 MaterialState 重命名为 WidgetState
# description: >-
#   MaterialState and its related APIs have been moved
#   outside of the Material library and renamed to
#   WidgetState.
description: >-
  MaterialState 及其相关 API 已移出
  Material 库并重命名为 WidgetState。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`MaterialState`, and its related APIs, have been moved out
of the Material library and renamed to `WidgetState`.

`MaterialState` 及其相关 API 已移出
Material 库并重命名为 `WidgetState`。

## Background

## 背景

Previously, `MaterialState` provided logic for
handling multiple different states a widget could have,
like "hovered", "focused", and "disabled".
Because this functionality is useful outside the Material library,
namely for the base Widgets layer and Cupertino,
it was decided to move it outside of Material.
As part of the move, and to avoid future confusion,
the different `MaterialState` classes have been renamed to `WidgetState`.
The behavior of the two are the same.

此前，`MaterialState` 提供了处理 widget 多种不同状态的逻辑，
如 "hovered"、"focused" 和 "disabled"。
由于此功能在 Material 库之外也有用，
即基础 Widgets 层和 Cupertino，
因此决定将其移出 Material。
作为迁移的一部分，并避免未来混淆，
不同的 `MaterialState` 类已重命名为 `WidgetState`。
两者的行为相同。

| Before                          | Now                           |
|---------------------------------|-------------------------------|
| `MaterialState`                 | `WidgetState`                 |
| `MaterialStatePropertyResolver` | `WidgetStatePropertyResolver` |
| `MaterialStateColor`            | `WidgetStateColor`            |
| `MaterialStateMouseCursor`      | `WidgetStateColorMouseCursor` |
| `MaterialStateBorderSide`       | `WidgetStateBorderSide`       |
| `MaterialStateOutlinedBorder`   | `WidgetStateOutlinedBorder`   |
| `MaterialStateTextStyle`        | `WidgetStateTextStyle`        |
| `MaterialStateProperty`         | `WidgetStateProperty`         |
| `MaterialStatePropertyAll`      | `WidgetStatePropertyAll`      |
| `MaterialStatesController`      | `WidgetStatesController`      |

The classes `MaterialStateOutlineInputBorder` and
`MaterialStateUnderlineInputBorder` were left in the
Material library with no `WidgetState` equivalent, as
they are specific to Material design.

`MaterialStateOutlineInputBorder` 和
`MaterialStateUnderlineInputBorder` 类保留在
Material 库中，没有 `WidgetState` 等效类，
因为它们是 Material design 特有的。

## Migration guide

## 迁移指南

A [Flutter fix][] is available to help migrate the `MaterialState`
classes to `WidgetState`.

可使用 [Flutter fix][] 帮助将 `MaterialState`
类迁移到 `WidgetState`。

To migrate, replace `MaterialState` with `WidgetState`.

要迁移，请将 `MaterialState` 替换为 `WidgetState`。

Code before migration:

迁移前的代码：

```dart
MaterialState selected = MaterialState.selected;

final MaterialStateProperty<Color> backgroundColor;

class _MouseCursor extends MaterialStateMouseCursor{
  const _MouseCursor(this.resolveCallback);

  final MaterialPropertyResolver<MouseCursor?> resolveCallback;

  @override
  MouseCursor resolve(Set<MaterialState> states) => resolveCallback(states) ?? MouseCursor.uncontrolled;
}

BorderSide side = MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return const BorderSide(color: Colors.red);
  }
  return null;
});
```

Code after migration:

迁移后的代码：

```dart
WidgetState selected = WidgetState.selected;

final WidgetStateProperty<Color> backgroundColor;

class _MouseCursor extends WidgetStateMouseCursor{
  const _MouseCursor(this.resolveCallback);

  final WidgetPropertyResolver<MouseCursor?> resolveCallback;

  @override
  MouseCursor resolve(Set<WidgetState> states) => resolveCallback(states) ?? MouseCursor.uncontrolled;
}

BorderSide side = WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
  if (states.contains(WidgetState.selected)) {
    return const BorderSide(color: Colors.red);
  }
  return null;
});
```

## Timeline

## 时间线

Landed in version: 3.21.0-11.0.pre<br>
In stable release: 3.22.0

合入版本：3.21.0-11.0.pre<br>
稳定版发布：3.22.0

## References

## 参考资料

Relevant issues:

相关 issue：

* [Create widgets level support for State][]

  [为 State 创建 widgets 层支持][Create widgets level support for State]

Relevant PRs:

相关 PR：

* [Widget State Properties][]

  [Widget State 属性][Widget State Properties]

[Create widgets level support for State]: {{site.repo.flutter}}/issues/138270
[Flutter fix]: /tools/flutter-fix
[Widget State Properties]: {{site.repo.flutter}}/pull/142151
