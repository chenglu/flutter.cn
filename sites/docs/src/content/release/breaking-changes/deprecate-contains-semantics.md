---
# title: Deprecate `containsSemantics` in favor of `isSemantics`
title: 弃用 `containsSemantics` 以支持 `isSemantics`
# description: >-
#   The `containsSemantics` matcher has been deprecated in favor of
#   `isSemantics` and `matchesSemantics` matchers.
description: >-
  `containsSemantics` 匹配器已被弃用，取而代之的是 `isSemantics` 和 `matchesSemantics` 匹配器。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `containsSemantics` partial matcher is deprecated and replaced by
`isSemantics` to clarify intent and standardize matcher conventions.

`containsSemantics` 部分匹配器已弃用，并替换为 `isSemantics` 以澄清意图并标准化匹配器约定。


## Context

## 背景


The `contains` prefix for partial matchers, such as `containsSemantics`, has been 
replaced with `is` to align with naming conventions:

部分匹配器的 `contains` 前缀（例如 `containsSemantics`）已替换为 `is` 以符合命名约定：


* **Partial matchers** (such as `isSemantics`) match only

  **部分匹配器**（例如 `isSemantics`）仅匹配

  the properties explicitly provided.
  Any arguments not provided are ignored.

明确提供的属性。任何未提供的参数都将被忽略。

* **Exact matchers** (such as `matchesSemantics`) verify all values.

  **精确匹配器**（例如 `matchesSemantics`）验证所有值。

  Any arguments not provided are expected to
  match the object's default values.

任何未提供的参数都应与对象的默认值匹配。


## Migration guide

## 迁移指南


To automatically migrate your code, run the following command:

要自动迁移代码，请运行以下命令：


```console
$ dart fix --apply
```

Alternatively, replace `containsSemantics` with `isSemantics` for partial
matching (most common case), or `matchesSemantics` if you need to assert 
exact property values (including defaults for omitted arguments).

或者，将 `containsSemantics` 替换为 `isSemantics` 进行部分匹配（最常见的情况），或者如果需要断言精确的属性值（包括省略参数的默认值），则替换 `matchesSemantics` 。


Code before migration:

迁移前的代码：


```dart
expect(
  tester.getSemantics(find.byType(MyWidget)),
  containsSemantics(
    label: 'My Widget',
    isButton: true,
  ),
);
```

Code after migration:

迁移后的代码：


```dart
expect(
  tester.getSemantics(find.byType(MyWidget)),
  isSemantics(
    label: 'My Widget',
    isButton: true,
  ),
);
```

## Timeline

## 时间线


Landed in version: 3.40.0-1.0.pre<br>
登陆版本：3.40.0-1.0.pre
In stable release: 3.41
稳定版本：3.41

## References

## 参考资料


API documentation:

API 文档：


* [`isSemantics`][]
* [`matchesSemantics`][]

Relevant issues:

相关 issue：


* [Issue 180534][]

  [问题 180534][Issue 180534]

* [Issue 107859][]

  [问题 107859][Issue 107859]


Relevant PR:

相关 PR：


* [PR 180538][]

  [PR 180538][PR 180538]


[`isSemantics`]: {{site.api}}/flutter/flutter_test/isSemantics.html
[`matchesSemantics`]: {{site.api}}/flutter/flutter_test/matchesSemantics.html
[Issue 180534]: {{site.repo.flutter}}/issues/180534
[Issue 107859]: {{site.repo.flutter}}/issues/107859
[PR 180538]: {{site.repo.flutter}}/pull/180538
