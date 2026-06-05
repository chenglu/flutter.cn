---
# title: Redesigned the Radio widget
title: 重新设计了收音机 widget
# description: >-
#   Learn about changes to the radio widget in Flutter 3.35.
description: >
  了解 Flutter 3.35 中对单选 widget 的更改。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Introduced the `RadioGroup` widget to centralize `groupValue` management and the `onChanged`
callback for a set of `Radio` widgets. As a result, the individual `Radio.groupValue` and
`Radio.onChanged` properties have been deprecated.

引入了“RadioGroup”widget 来集中“groupValue”管理和一组“Radio”widget 的“onChanged”回调。因此，单独的“Radio.groupValue”和“Radio.onChanged”属性已被弃用。


## Context

## 背景


To meet APG (ARIA Practices Guide) requirements for keyboard navigation and
semantic properties in radio button groups, Flutter needed a dedicated radio group concept.
Introducing a wrapper widget, `RadioGroup`, provides this out-of-the-box support.
This change also presented an opportunity to simplify the API for individual `Radio` widgets.

为了满足 APG（ARIA 实践指南）对单选按钮组中键盘导航和语义属性的要求，Flutter 需要一个专用的单选组概念。引入包装器 widget“RadioGroup”，提供了这种开箱即用的支持。这一变化还提供了一个简化各个“Radio”widget API 的机会。


## Description of change

## 变更说明


The following API is deprecated:

以下 API 已弃用：


* `Radio.onChanged`

  `Radio.onChanged`

* `Radio.groupValue`

  `Radio.groupValue`

* `CupertinoRadio.onChanged`

  `CupertinoRadio.onChanged`

* `CupertinoRadio.groupValue`

  `CupertinoRadio.groupValue`

* `RadioListTile.groupValue`

  `RadioListTile.groupValue`

* `RadioListTile.onChanged`.

  `RadioListTile.onChanged`。


## Migration guide

## 迁移指南


If you are using these properties, you can refactor them with `RadioGroup`.

如果你正在使用这些属性，则可以使用“RadioGroup”重构它们。


### Case 1: trivial case

### 案例 1：小案例


Code before migration:

迁移前的代码：


```dart
Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      Radio<int>(
        value: 0,
        groupValue: _groupValue,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
        },
      ),
      Radio<int>(
        value: 2,
        groupValue: _groupValue,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
        },
      ),
    ],
  );
}
```

Code after migration:

迁移后的代码：


```dart
Widget build(BuildContext context) {
  return RadioGroup<int>(
    groupValue: _groupValue,
    onChanged: (int? value) {
      setState(() {
        _groupValue = value;
      });
    },
    child: Column(
      children: <Widget>[
        Radio<int>(value: 0),
        Radio<int>(value: 2),
      ],
    ),
  );
}
```

### Case 2: disabled radio

### 案例 2：禁用无线电


Code before migration:

迁移前的代码：


```dart
Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      Radio<int>(
        value: 0,
        groupValue: _groupValue,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
        },
      ),
      Radio<int>(
        value: 2,
        groupValue: _groupValue,
        onChanged: null, // disabled
      ),
    ],
  );
}
```

Code after migration:

迁移后的代码：


```dart
Widget build(BuildContext context) {
  return RadioGroup<int>(
    groupValue: _groupValue,
    onChanged: (int? value) {
      setState(() {
        _groupValue = value;
      });
    },
    child: Column(
      children: <Widget>[
        Radio<int>(value: 0),
        Radio<int>(value: 2, enabled: false),
      ],
    ),
  );
}
```

### Case 3: mixed group or multi-selection

### 情况 3：混合分组或多选


Code before migration:

迁移前的代码：


```dart
Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      Radio<int>(
        value: 1,
        groupValue: _groupValue,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
        }, // disabled
      ),
      Radio<String>(
        value: 'a',
        groupValue: _stringValue,
        onChanged: (String? value) {
          setState(() {
            _stringValue = value;
          });
        },
      ),
      Radio<String>(
        value: 'b',
        groupValue: _stringValue,
        onChanged: (String? value) {
          setState(() {
            _stringValue = value;
          });
        },
      ),
      Radio<int>(
        value: 2,
        groupValue: _groupValue,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
        }, // disabled
      ),
    ],
  );
}
```

Code after migration:

迁移后的代码：


```dart
Widget build(BuildContext context) {
  return RadioGroup<int>(
    groupValue: _groupValue,
    onChanged: (int? value) {
      setState(() {
        _groupValue = value;
      });
    },
    child: Column(
      children: <Widget>[
        Radio<int>(value: 1),
        RadioGroup<String>(
          child: Column(
            children: <Widget>[
              Radio<String>(value: 'a'),
              Radio<String>(value: 'b'),
            ]
          ),
        ),
        Radio<int>(value: 2),
      ],
    ),
  );
}
```

## Timeline

## 时间轴


Landed in version: 3.34.0-0.0.pre<br>
In stable release: 3.35

登陆版本：3.34.0-0.0.pre<br> 稳定版本：3.35


## References

## 参考


* [`APG`][]

  [`APG`][]


API documentation:

API 文档：


* [`Radio`][]

  [` 收音机 `][`APG`]

* [`CupertinoRadio`][]


* [`RadioListTile`][]

  [`RadioListTile`][]

* [`RadioGroup`][]

  [` 无线电组 `][`APG`]


Relevant issue:

相关问题：


* [Issue 113562][]

  [问题 113562][Issue 113562]


Relevant PR:

相关公关：


* [PR 168161][]

  [PR 168161][]


[`APG`]: https://www.w3.org/WAI/ARIA/apg/patterns/radio
[`Radio`]: {{site.api}}/flutter/material/Radio-class.html
[`RadioListTile`]: {{site.api}}/flutter/material/RadioListTile-class.html
[`CupertinoRadio`]: {{site.api}}/flutter/cupertino/CupertinoRadio-class.html
[`RadioGroup`]: {{site.api}}/flutter/widgets/RadioGroup-class.html
[Issue 113562]: {{site.repo.flutter}}/issues/113562
[PR 168161]: {{site.repo.flutter}}/pull/168161
