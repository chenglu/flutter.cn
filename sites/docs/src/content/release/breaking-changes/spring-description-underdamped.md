---
# title: Underdamped spring formula changed
title: 欠阻尼弹簧公式已更改
# description: >-
#   The formula for `SpringDescription` changed to correct an earlier error,
#   affecting underdamped springs (damping ratio less than 1).
description: >
  “SpringDescription”的公式已更改，以纠正早期的错误，影响欠阻尼弹簧（阻尼比小于 1）。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The formula for `SpringDescription` changed to correct an earlier error,
affecting underdamped springs (damping ratio less than 1)
with mass values other than 1.
Springs created prior to this change may exhibit
different bouncing behaviors after upgrading.

“SpringDescription”的公式已更改，以纠正早期的错误，影响质量值不为 1 的欠阻尼弹簧（阻尼比小于 1）。在此更改之前创建的弹簧在升级后可能会表现出不同的弹跳行为。


## Background

## 背景


The [`SpringDescription`][] class describes the behavior of damped springs,
enabling Flutter widgets to animate realistically based on provided parameters.
The physics of damped springs are widely studied and documented. For an overview
of damping, see [Wikipedia: Damping][].

[`SpringDescription`][] 类描述阻尼弹簧的行为，使 Flutter widget 能够根据提供的参数进行真实的动画处理。阻尼弹簧的物理学得到了广泛的研究和记录。有关阻尼的概述，请参阅维基百科：阻尼。


Previously, Flutter's formula for calculating underdamped spring behavior was
incorrect, as reported in [Issue 163858][]. This error affected all springs with
a damping ratio less than 1 and a mass other than 1. Consequently, animations
did not match expected real-world physics, and behavior around the critical
damping point (damping ratio of exactly 1) exhibited discontinuities.
Specifically, when using `SpringDescription.withDampingRatio`, small
differences, such as damping ratios of 1.0001 versus 0.9999, resulted in
significantly different animations.

之前，Flutter 用于计算欠阻尼弹簧行为的公式不正确，如 [问题 163858][Issue 163858] 中所述。此错误影响阻尼比小于 1 且质量不为 1 的所有弹簧。因此，动画与预期的现实物理物理不匹配，并且临界阻尼点（阻尼比恰好为 1）周围的行为表现出不连续性。具体来说，当使用“SpringDescription.withDampingRatio”时，微小的差异（例如 1.0001 与 0.9999 的阻尼比）会导致动画显着不同。


The issue was corrected in PR [Fix SpringSimulation formula for underdamping][],
which updated the underlying calculation. As a result, previously affected
animations now behave differently, though no explicit errors are reported by the
framework.

该问题已在 PR [修复欠阻尼的 SpringSimulation 公式][Fix SpringSimulation formula for underdamping] 中得到纠正，更新了基础计算。因此，尽管框架没有报告明确的错误，但之前受影响的动画现在的行为有所不同。


## Migration guide

## 迁移指南


Migration is necessary only for springs with damping ratios less than 1 and
masses other than 1.

仅对于阻尼比小于 1 且质量不等于 1 的弹簧才需要迁移。


To restore previous animation behavior, update your spring parameters
accordingly. You can calculate the required parameter adjustments using the
provided [JSFiddle for migration][]. Detailed formulas and explanations follow
in the next sections.

要恢复以前的动画行为，请相应地更新弹簧参数。你可以使用提供的[用于迁移的 JSFiddle][JSFiddle for migration]来计算所需的参数调整。详细的公式和解释将在下一节中给出。


### Default constructor

### 默认构造函数


If the `SpringDescription` was built with the default constructor with
mass `m`, stiffness `k`, and damping `c`,
then it should be changed with the following formula:

如果“SpringDescription”是使用质量“m”、刚度“k”和阻尼“c”的默认构造函数构建的，则应使用以下公式对其进行更改：


```plaintext
new_m = 1
new_c = c * m
new_k = (4 * (k / m) - (c / m)^2 + (c * m)^2) / 4
```

Code before migration:

迁移前的代码：


```dart
const spring = SpringDescription(
  mass: 20.0,
  stiffness: 10,
  damping: 1,
);
```

Code after migration:

迁移后的代码：


```dart
const spring = SpringDescription(
  mass: 1.0,
  stiffness: 100.499375,
  damping: 20,
);
```

### `.withDampingRatio` constructor

### `.withDampingRatio` 构造函数


If the `SpringDescription` was built with the `.withDampingRatio` constructor
with mass `m`, stiffness `k`, and ratio `z`, then first calculate damping:

如果“SpringDescription”是使用“.withDampingRatio”构造函数构建的，具有质量“m”、刚度“k”和比率“z”，则首先计算阻尼：


```plaintext
c = z * 2 * sqrt(m * k)
```

Then apply the formula above.
Optionally, you might convert the result back to damping ratio with:

然后应用上面的公式。或者，你可以使用以下方法将结果转换回阻尼比：


```plaintext
new_z = new_c / 2 / sqrt(new_m * new_k)
```

Code before migration:

迁移前的代码：


```dart
const spring = SpringDescription.withDampingRatio(
  mass: 5.0,
  stiffness: 6.0,
  damping: 0.03,
);
```

Code after migration:

迁移后的代码：


```dart
const spring = SpringDescription.withDampingRatio(
  mass: 1,
  stiffness: 1.87392,
  ratio: 0.60017287468545,
);
```

## Timeline

## 时间轴


Landed in version: 3.31.0-0.1.pre<br>
In stable release: 3.32

登陆版本：3.31.0-0.1.pre<br> 稳定版本：3.32


## References

## 参考


API documentation:

API 文档：


* [`SpringDescription`][]

  [`SpringDescription`][]


Relevant issues:

相关问题：


* [Issue 163858][], where the bug was discovered and more context can be found.

  [问题 163858][Issue 163858]，其中发现了错误并可以找到更多上下文。


Relevant PRs:

相关 PR：


* [Fix SpringSimulation formula for underdamping][]

  [修复欠阻尼的 SpringSimulation 公式][Fix SpringSimulation formula for underdamping]


Tool:

工具：

* [JSFiddle for migration][]

  [用于迁移的 JSFiddle][JSFiddle for migration]


[Fix SpringSimulation formula for underdamping]: {{site.repo.flutter}}/pull/165017
[Issue 163858]: {{site.repo.flutter}}/issues/163858
[JSFiddle for migration]: https://jsfiddle.net/6jgvbzps/30/
[`SpringDescription`]: {{site.api}}/flutter/physics/SpringDescription-class.html
[Wikipedia: Damping]: https://en.wikipedia.org/wiki/Damping
