---
# title: Added enabled property and made onChanged optional for DropdownButton
title: 为 DropdownButton 新增 enabled 属性并使 onChanged 变为可选
# description: >-
#   DropdownButton and DropdownButtonFormField now support an explicit enabled
#   property, and their onChanged callbacks are no longer required.
description: >-
  DropdownButton 和 DropdownButtonFormField 现在支持显式的 enabled 属性，
  且 onChanged 回调不再为必填项。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`DropdownButton` and `DropdownButtonFormField` now include
an `enabled` property to explicitly manage their interactive state,
and the `onChanged` callback is no longer marked as `required`.

`DropdownButton` 和 `DropdownButtonFormField` 现在包含
`enabled` 属性，用于显式管理其交互状态，
且 `onChanged` 回调不再标记为 `required`。

## Background

## 背景

Previously, `DropdownButton` and `DropdownButtonFormField` didn't
have an `enabled` parameter.
The only way to disable the dropdown
(graying it out and making it non-interactive) was to
pass `null` to the `required` `onChanged` callback.
This led to unintuitive code when trying to
dynamically enable or disable the button,
forcing developers to write conditional expressions for the callback itself,
such as `onChanged: condition ? (value) { ... } : null`.

此前，`DropdownButton` 和 `DropdownButtonFormField` 没有
`enabled` 参数。
禁用下拉框（变灰且不可交互）的唯一方式
是向必填的 `onChanged` 回调传入 `null`。
在动态启用或禁用按钮时，这会导致代码不够直观，
迫使开发者为回调本身编写条件表达式，
例如 `onChanged: condition ? (value) { ... } : null`。

To improve this API, a dedicated `enabled` property was introduced,
and `onChanged` was made optional.

为改进此 API，引入了专用的 `enabled` 属性，
并将 `onChanged` 设为可选。

The `enabled` property is optional.
Making it mandatory introduces a massive breaking change that
breaks nearly every existing `DropdownButton` implementation in
the Flutter ecosystem.
Instead, to preserve backward compatibility,
if the `enabled` argument isn't explicitly provided,
the button determines its state by falling back to whether
`onChanged` is provided (that is, it's enabled if `onChanged != null`,
and disabled if `onChanged == null`).

`enabled` 属性为可选。
将其设为必填会引入大规模破坏性变更，
几乎会破坏 Flutter 生态中所有现有的 `DropdownButton` 实现。
因此，为保持向后兼容，
若未显式提供 `enabled` 参数，
按钮会根据是否提供了 `onChanged` 来确定状态
（即 `onChanged != null` 时启用，`onChanged == null` 时禁用）。

The minor breaking change here is structural:
while the old conditional `onChanged` pattern technically
still works due to the fallback logic,
developers are encouraged to migrate to the clearer API by
explicitly using the `enabled` property.

此处的轻微破坏性变更属于结构性变更：
虽然由于回退逻辑，旧的条件 `onChanged` 模式在技术上仍然有效，
但建议开发者通过显式使用 `enabled` 属性
迁移到更清晰的 API。

## Migration guide

## 迁移指南

If you previously disabled your `DropdownButton` by
conditionally passing `null` to `onChanged`,
migrate to the new `enabled` property.
This cleanly separates the state of the widget (enabled/disabled) from
its behavior (the callback).

如果你先前通过向 `onChanged` 条件传入 `null` 来禁用 `DropdownButton`，
请迁移到新的 `enabled` 属性。
这样可以清晰地将 widget 状态（启用/禁用）与其行为（回调）分离。

To automatically migrate your code for simple cases
(such as statically passing `null`), run the following command:

对于简单情况（如静态传入 `null`），
可运行以下命令自动迁移代码：

```console
$ dart fix --apply
```

:::important
Note that `dart fix` will not automatically migrate cases where `onChanged`
is set using conditional logic. For those, you must update your code manually.

请注意，`dart fix` 不会自动迁移通过条件逻辑设置 `onChanged` 的情况。
这些情况需要手动更新代码。
:::

### Case 1: Statically disabled dropdown {: #case-1-statically-disabled }

### 情况 1：静态禁用的下拉框 {: #case-1-statically-disabled }

For simple cases where a dropdown is permanently disabled,
you can now simply omit `onChanged` and use `enabled: false`.

对于永久禁用的下拉框等简单情况，
现在可以省略 `onChanged` 并使用 `enabled: false`。

Code before migration:

迁移前的代码：

```dart
final disabledDropdown = DropdownButton<String>(
  value: 'Option 1',
  items: const [
    DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
  ],
  onChanged: null, // This was the only way to disable it
);
```

Code after migration:

迁移后的代码：

```dart diff
  final disabledDropdown = DropdownButton<String>(
    value: 'Option 1',
    items: const [
      DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
    ],
-   onChanged: null, // This was the only way to disable it
+   enabled: false,
  );
```

### Case 2: Conditionally disabled dropdown {: #case-2-conditionally-disabled }

### 情况 2：条件禁用的下拉框 {: #case-2-conditionally-disabled }

The recommended best practice is to separate the callback from
the interactive state by using the `enabled` property directly.

推荐的最佳实践是直接使用 `enabled` 属性，
将回调与交互状态分离。

Code before migration:

迁移前的代码：

```dart
final conditionalDropdown = DropdownButton<String>(
  value: 'Option 1',
  items: const [
    DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
  ],
  onChanged: condition ? (value) { ... } : null,
);
```

Code after migration:

迁移后的代码：

```dart diff
  final conditionalDropdown = DropdownButton<String>(
    value: 'Option 1',
    items: const [
      DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
    ],
-   onChanged: condition ? (value) { ... } : null,
+   onChanged: (value) { ... },
+   enabled: condition,
  );
```

## Timeline

## 时间线

Landed in version: 3.44.0-1.0.pre-629<br>
In stable release: Not yet

合入版本：3.44.0-1.0.pre-629<br>
稳定版发布：尚未发布

## References

## 参考资料

API documentation:

API 文档：

* [`DropdownButton`][]
* [`DropdownButtonFormField`][]

Relevant issues:

相关 issue：

* [Why is DropdownButtonFormField's onChanged required?][issue-57953]

  为什么 DropdownButtonFormField 的 onChanged 是必填的？

Relevant PRs:

相关 PR：

* [Update DropdownButton enabled property logic][]

  [更新 DropdownButton enabled 属性逻辑][Update DropdownButton enabled property logic]

[`DropdownButton`]: {{site.api}}/flutter/material/DropdownButton-class.html
[`DropdownButtonFormField`]: {{site.api}}/flutter/material/DropdownButtonFormField-class.html
[issue-57953]: {{site.repo.flutter}}/issues/57953
[Update DropdownButton enabled property logic]: {{site.repo.flutter}}/pull/182419
