---
# title: Updated `Checkbox.fillColor` behavior
title: 更新了 `Checkbox.fillColor` 行为
# description: >
#   Improved `Checkbox.fillColor` behavior applies the fill color to the
#   background when the checkbox is unselected.
description: >-
  改进的 `Checkbox.fillColor` 行为在取消选中复选框时将填充颜色应用于背景。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `Checkbox.fillColor` is now applied to the checkbox's background when
the checkbox is unselected.

当取消选中复选框时，`Checkbox.fillColor` 现在会应用于该复选框的背景。


## Context

## 背景


Previously, the `Checkbox.fillColor` was applied to the checkbox's border
when the checkbox was unselected and its background was transparent.
With this change, the `Checkbox.fillColor` is applied to the checkbox's
background and the border uses the `Checkbox.side` color when the checkbox
is unselected.

以前，当取消选中复选框且其背景为透明时，`Checkbox.fillColor` 会应用于复选框的边框。通过此更改，`Checkbox.fillColor` 将应用于复选框的背景，并且当取消选中该复选框时，边框将使用 `Checkbox.side` 颜色。


## Description of change

## 变更说明


The `Checkbox.fillColor` is now applied to the checkbox's background when
the checkbox is unselected instead of being used as the border color.

当取消选中复选框时，`Checkbox.fillColor` 现在应用于复选框的背景，而不是用作边框颜色。


## Migration guide

## 迁移指南


The updated `Checkbox.fillColor` behavior applies the fill color to the
checkbox's background in the unselected state. To get the previous behavior,
set `Checkbox.fillColor` to `Colors.transparent` in the unselected state and
set `Checkbox.side` to the desired color.

更新后的 `Checkbox.fillColor` 行为将填充颜色应用于未选中状态下的复选框背景。要获得以前的行为，请在未选择状态下将 `Checkbox.fillColor` 设置为 `Colors.transparent` 并将 `Checkbox.side` 设置为所需的颜色。


If you use the `Checkbox.fillColor` property to customize the checkbox.

如果你使用 `Checkbox.fillColor` 属性来自定义复选框。


Code before migration:

迁移前的代码：


```dart
Checkbox(
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (!states.contains(MaterialState.selected)) {
      return Colors.red;
    }
    return null;
  }),
  value: _checked,
  onChanged: _enabled
    ? (bool? value) {
        setState(() {
          _checked = value!;
        });
      }
    : null,
),
```

Code after migration:

迁移后的代码：


```dart
Checkbox(
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (!states.contains(MaterialState.selected)) {
      return Colors.transparent;
    }
    return null;
  }),
  side: const BorderSide(color: Colors.red, width: 2),
  value: _checked,
  onChanged: _enabled
    ? (bool? value) {
        setState(() {
          _checked = value!;
        });
      }
    : null,
),
```

If you use the `CheckboxThemeData.fillColor` property to customize the checkbox.

如果你使用 `CheckboxThemeData.fillColor` 属性来自定义复选框。


Code before migration:

迁移前的代码：


```dart
checkboxTheme: CheckboxThemeData(
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (!states.contains(MaterialState.selected)) {
      return Colors.red;
    }
    return null;
  }),
),
```

Code after migration:

迁移后的代码：


```dart
checkboxTheme: CheckboxThemeData(
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (!states.contains(MaterialState.selected)) {
      return Colors.transparent;
    }
    return null;
  }),
  side: const BorderSide(color: Colors.red, width: 2),
),
```

## Timeline

## 时间线


Landed in version: 3.10.0-17.0.pre<br>
登陆版本：3.10.0-17.0.pre
In stable release: 3.13.0
稳定版本：3.13.0

## References

## 参考资料


API documentation:

API 文档：


* [`Checkbox.fillColor`][]

Relevant issues:

相关 issue：


* [Add `backgroundColor` to `Checkbox` and `CheckboxThemeData`][]

  [将 `backgroundColor` 添加到 `Checkbox` 和 `CheckboxThemeData`][Add `backgroundColor` to `Checkbox` and `CheckboxThemeData`]


Relevant PRs:

相关 PR：


* [`Checkbox.fillColor` should be applied to checkbox's background color when it is unchecked.][]

  [未选中时，应将 `Checkbox.fillColor` 应用于复选框的背景颜色。][`Checkbox.fillColor` should be applied to checkbox's background color when it is unchecked.]


[`Checkbox.fillColor`]: {{site.api}}/flutter/material/Checkbox/fillColor.html

[Add `backgroundColor` to `Checkbox` and `CheckboxThemeData`]: {{site.repo.flutter}}/issues/123386
[`Checkbox.fillColor` should be applied to checkbox's background color when it is unchecked.]: {{site.repo.flutter}}/pull/125643
