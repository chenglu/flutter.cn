---
# title: Migration guide for describeEnum and EnumProperty
title: describeEnum 和 EnumProperty 迁移指南
# description: Learn about the removal of describeEnum and how to migrate.
description: 了解 describeEnum 的移除及迁移方法。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The global method `describeEnum` has been deprecated. Previous uses
of `describeEnum(Enum.something)` should use
`Enum.something.name` instead.

全局方法 `describeEnum` 已被弃用。
原先使用 `describeEnum(Enum.something)` 的地方
应改用 `Enum.something.name`。

The class `EnumProperty` was modified to
extend `<T extends Enum?>` instead of `<T>`.
Existing uses of `EnumProperty<NotAnEnum>` should
use `DiagnosticsProperty<NotAnEnum>` instead.

`EnumProperty` 类已修改为
继承 `<T extends Enum?>` 而非 `<T>`。
原先使用 `EnumProperty<NotAnEnum>` 的地方
应改用 `DiagnosticsProperty<NotAnEnum>`。

## Context

## 背景

Dart 2.17 introduced [enhanced enums][], which added `Enum` as a type.
As a result, all enums got a `name` getter, which made `describeEnum`
redundant. Before that, enum classes were often analyzed using an
`EnumProperty`.

Dart 2.17 引入了[增强型枚举][enhanced enums]，
新增了 `Enum` 类型。
因此，所有枚举都获得了 `name` getter，使 `describeEnum` 变得多余。
在此之前，枚举类通常通过 `EnumProperty` 进行分析。

The `describeEnum` method was used to convert an enum value to a string,
since `Enum.something.toString()` would produce `Enum.something` instead
of `something`, which a lot of users wanted. Now, the `name` getter does this.

`describeEnum` 方法用于将枚举值转换为字符串，
因为 `Enum.something.toString()` 会输出 `Enum.something` 而非 `something`，
而许多用户希望得到后者。现在 `name` getter 可以实现这一需求。

The `describeEnum` function is being deprecated,
so the `EnumProperty` class is updated to only accept `Enum` objects.

`describeEnum` 函数正在被弃用，
因此 `EnumProperty` 类已更新为仅接受 `Enum` 对象。

[enhanced enums]: {{site.dart-site}}/language/enums#declaring-enhanced-enums

## Description of change

## 变更说明

Remove `describeEnum`.

移除 `describeEnum`。

- Replace `describeEnum(Enum.something)` with `Enum.something.name`.

- 将 `describeEnum(Enum.something)` 替换为 `Enum.something.name`。

The `EnumProperty` now expects null or an `Enum`;
you can no longer pass it a non-`Enum` class.

`EnumProperty` 现在期望 `null` 或 `Enum` 对象；
不能再向其传入非 `Enum` 类。

## Migration guide

## 迁移指南

If you previously used `describeEnum(Enum.field)` to access the
string value from an enum, you can now call `Enum.field.name`.

如果你先前使用 `describeEnum(Enum.field)` 获取枚举的字符串值，
现在可以调用 `Enum.field.name`。

If you previously used `EnumProperty<NotAnEnum>`, you can
now use the generic `DiagnosticsProperty<NotAnEnum>`.

如果你先前使用 `EnumProperty<NotAnEnum>`，
现在可以使用通用的 `DiagnosticsProperty<NotAnEnum>`。

Code before migration:

迁移前的代码：

```dart
enum MyEnum { paper, rock }

print(describeEnum(MyEnum.paper)); // output: paper

// TextInputType is not an Enum
properties.add(EnumProperty<TextInputType>( ... ));
```

Code after migration:

迁移后的代码：

```dart
enum MyEnum { paper, rock }

print(MyEnum.paper.name); // output: paper

// TextInputType is not an Enum
properties.add(DiagnosticsProperty<TextInputType>( ... ));
```

## Timeline

## 时间线

Landed in version: 3.14.0-2.0.pre<br>
In stable release: 3.16

合入版本：3.14.0-2.0.pre<br>
稳定版发布：3.16

## References

## 参考资料

API documentation:

API 文档：

* [`describeEnum`][]
* [`EnumProperty`][]

Relevant issues:

相关 issue：

* [Cleanup SemanticsFlag and SemanticsAction issue][]

  [清理 SemanticsFlag 和 SemanticsAction issue][Cleanup SemanticsFlag and SemanticsAction issue]

Relevant PRs:

相关 PR：

* [Deprecate `describeEnum` PR][]

  [弃用 `describeEnum` PR][Deprecate `describeEnum` PR]

[`describeEnum`]: {{site.api}}/flutter/foundation/describeEnum.html
[`EnumProperty`]: {{site.api}}/flutter/foundation/EnumProperty-class.html

[Cleanup SemanticsFlag and SemanticsAction issue]: {{site.repo.flutter}}/issues/123346
[Deprecate `describeEnum` PR]: {{site.repo.flutter}}/pull/125016
