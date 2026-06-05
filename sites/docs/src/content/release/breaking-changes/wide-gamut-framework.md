---
# title: Migration guide for wide gamut Color
title: 广色域颜色迁移指南
# description: >-
#   Changes to support wide gamut color and migration instructions.
description: >-
  进行更改以支持广色域颜色和迁移指令。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


The API for the [`Color`][] class in `dart:ui` is changing to
support [wide gamut color spaces][].

API 为[`Color`][]`dart:ui` 中的类正在更改以支持[wide gamut color spaces][].


## Context

## 背景


The Flutter engine [already supports wide gamut color][] with [Impeller][], and
the support is now being added [to the framework][].

Flutter 引擎[already supports wide gamut color][]和[Impeller][]，现在正在添加支持[to the framework][].


The iOS devices that Flutter supports render to a larger array of colors,
specifically in the [DisplayP3][] color space.
After this change, the Flutter framework can
render all of those colors on iOS Impeller, and
the `Color` class is better prepared for future color spaces or
changes to color component bit depth.

Flutter 支持渲染为更大的颜色数组的 iOS 设备，特别是在[DisplayP3][]色彩空间。进行此更改后，Flutter 框架可以在 iOS 叶轮上渲染所有这些颜色，并且 `Color` 类为未来的颜色空间或颜色分量位深度的更改做好了更好的准备。


## Description of change

## 变更说明


Changes to [`Color`][]:

更改为[`Color`][]:


 1. Adds an enum field that specifies its [`ColorSpace`][].

   添加一个枚举字段来指定其[`ColorSpace`][].

 1. Adds API to use normalized floating-point color components.

   添加 API 以使用标准化浮点颜色分量。

 1. Removes API that uses 8-bit unsigned integer color components that can

   删除了使用 8 位无符号整数颜色分量的 API，这些分量可以

    lead to data loss.

导致数据丢失。


Changes to [`ColorSpace`][]:

更改为[`ColorSpace`][]:


 1. Adds a `displayP3` property.

   添加 `displayP3` 属性。


## Migration guide

## 迁移指南


### 8-bit unsigned integer constructors

### 8 位无符号整数构造函数


Constructors like `Color.fromARGB` remain unchanged and have continued support.
To take advantage of Display P3 colors, you must use the new
`Color.from` constructor that takes normalized floating-point color components.

像 `Color.fromARGB` 这样的构造函数保持不变并继续得到支持。要利用 Display P3 颜色，你必须使用采用标准化浮点颜色分量的新 `Color.from` 构造函数。


```dart
// Before: Constructing an sRGB color from the lower 8 bits of four integers.
final magenta = Color.fromARGB(0xff, 0xff, 0x0, 0xff);

// After: Constructing a color with normalized floating-point components.
final magenta = Color.from(alpha: 1.0, red: 1.0, green: 0.0, blue: 1.0);
```

### Implementors of `Color`

### `Color` 的实现者


There are new methods being added to `Color` so
any class that `implements Color` will break and have to
implement the new methods, such as `Color.a` and `Color.b`.

`Color` 中添加了新方法，因此 `implements Color` 将破坏任何类，并且必须实现新方法，例如 `Color.a` 和 `Color.b`。


Ultimately, implementors should migrate to take advantage of the new API.
In the short-term, these methods can easily be implemented without
changing the underlying structure of your class.

最终，实施者应该迁移以利用新的 API。从短期来看，这些方法可以轻松实现，而无需更改类的底层结构。


For example:

例如：


```dart
class Foo implements Color {
  int _red;

  @override
  double get r => _red / 255.0;
}
```

:::note
Flutter plans to eventually lock the `Color` class down and make it `sealed`.

Flutter 计划最终锁定 `Color` 类并使其成为 `sealed`。


Now might be a good opportunity to switch from [inheritance to composition][]
and stop reimplementing `Color`.

现在可能是一个转换的好机会[inheritance to composition][]并停止重新实现 `Color`。

:::

### Color space support

### 色彩空间支持


Clients that use `Color` and perform any sort of calculation on
the color components should now first check the
color space component before performing calculations.
To help with that, you can use the new `Color.withValues` method to
perform color space conversions.

使用 `Color` 并对颜色分量执行任何类型计算的客户端现在应在执行计算之前首先检查颜色空间分量。为此，你可以使用新的 `Color.withValues` 方法来执行颜色空间转换。


Example migration:

迁移示例：


```dart
// Before
double redRatio(Color x, Color y) => x.red / y.red;

// After
double redRatio(Color x, Color y) {
  final xPrime = x.withValues(colorSpace: ColorSpace.extendedSRGB);
  final yPrime = y.withValues(colorSpace: ColorSpace.extendedSRGB);
  return xPrime.r / yPrime.r;
}
```

Performing calculations with color components without
aligning color spaces can lead to subtle unexpected results.
In the preceding example, the `redRatio` would have the difference of `0.09`
when calculated with differing color spaces versus aligned color spaces.

在不对齐颜色空间的情况下使用颜色分量执行计算可能会导致微妙的意外结果。在前面的示例中，当使用不同的颜色空间与对齐的颜色空间进行计算时，`redRatio` 将具有 `0.09` 的差异。


### Access color components

### 访问颜色组件


If your app ever accesses a `Color` component, consider
taking advantage of the floating-point components.
In the short term, you can scale the components themselves.

如果你的应用曾经访问 `Color` 组件，请考虑利用浮点组件。在短期内，你可以扩展组件本身。


```dart
extension IntColorComponents on Color {
  int get intAlpha => _floatToInt8(this.a);
  int get intRed => _floatToInt8(this.r);
  int get intGreen => _floatToInt8(this.g);
  int get intBlue => _floatToInt8(this.b);

  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}
```

### Opacity

### 不透明度


Before Flutter 3.27, Color had the concept of "opacity" which showed up in the
methods `opacity` and `withOpacity()`. Opacity was introduced as a way to
communicate with `Color` about its alpha channel with floating-point values
([0.0, 1.0]). Opacity methods were convenience methods for setting the 8-bit
alpha value ([0, 255]), but never offered the full expression of a
floating-point number. This was sufficient when color components were stored as
8-bit integers.

在Flutter 3.27之前，Color有“不透明度”的概念，它出现在方法`opacity`和`withOpacity()`中。引入不透明度是为了与 `Color` 就其具有浮点值 ([0.0, 1.0]) 的 alpha 通道进行通信。不透明度方法是设置 8 位 alpha 值 ([0, 255]) 的便捷方法，但从未提供浮点数的完整表达式。当颜色分量存储为 8 位整数时，这就足够了。


Since Flutter 3.27, alpha is stored as a floating-point value. Using `.a` and
`.withValues()` will give the full expression of a floating-point value and
won't be quantized (restricted to a limited range). That means "alpha" expresses
the intent of "opacity" more correctly. Opacity is different in a subtle way
where its usage can result in unexpected data loss, so `.withOpacity()` and
`.opacity` have been deprecated and their semantics have been maintained to
avoid breaking anyone.

自 Flutter 3.27 起，alpha 存储为浮点值。使用 `.a` 和 `.withValues()` 将给出浮点值的完整表达式，并且不会被量化（限制在有限范围内）。这意味着“alpha”更正确地表达了“不透明度”的意图。不透明度的不同之处在于它的使用可能会导致意外的数据丢失，因此 `.withOpacity()` 和 `.opacity` 已被弃用，并且保留了它们的语义以避免破坏任何人。


For example:

例如：


```dart
// Prints 0.5019607843137255.
print(Colors.black.withOpacity(0.5).a);
// Prints 0.5.
print(Colors.black.withValues(alpha: 0.5).a);
```

Practically all usage will directly benefit from the more accurate colors. In
the rare case where it doesn't, care can be taken to quantize opacity to [0,
255] using `.alpha` and `.withAlpha()` to match the behavior before Flutter
3.27.

实际上，所有使用都将直接受益于更准确的颜色。在极少数情况下，可以使用 `.alpha` 和 `.withAlpha()` 将不透明度量化为 [0, 255]，以匹配 Flutter 3.27 之前的行为。


<a id="opacity-migration" aria-hidden="true"></a>
#### Migrate `opacity`

#### 迁移 `opacity`


```dart
// Before: Access the alpha channel as a (converted) floating-point value.
final x = color.opacity;

// After: Access the alpha channel directly.
final x = color.a;
```

<a id="withopacity-migration" aria-hidden="true"></a>
#### Migrate `withOpacity`

#### 迁移 `withOpacity`


```dart
// Before: Create a new color with the specified opacity.
final x = color.withOpacity(0.0);

// After: Create a new color with the specified alpha channel value,
// accounting for the current or specified color space.
final x = color.withValues(alpha: 0.0);
```

### Equality

### 平等


Once `Color` stores its color components as floating-point numbers,
equality works slightly differently.
When calculating colors, there might be a
tiny difference in values that could be considered equal.
To accommodate this use the [`closeTo`][] or [`isColorSameAs`][] matchers.

一旦 `Color` 将其颜色分量存储为浮点数，相等的工作方式会略有不同。计算颜色时，可能存在可被视为相等的微小差异。为了适应这种情况，请使用[`closeTo`][]或者[`isColorSameAs`][]匹配者。


```dart
// Before: Check exact equality of int-based color.
expect(calculateColor(), const Color(0xffff00ff));

// After: Check rough equality of floating-point-based color.
expect(calculateColor(), isSameColorAs(const Color(0xffff00ff)));
```

## Timeline

## 时间线


### Phase 1 - New API introduction, old API deprecation

### 第 1 阶段 - 引入新 API，弃用旧 API


Landed in version: 3.26.0-0.1.pre<br>
登陆版本：3.26.0-0.1.pre
In stable release: 3.27.0
稳定版本：3.27.0

### Phase 2 - Old API removal

### 第 2 阶段 - 旧 API 删除


Landed in version: Not yet<br>
登陆版本：<br>尚未
In stable release: Not yet
稳定版本：还没有

## References

## 参考资料


Relevant issue:

相关issue：


* [issue 127855][]: Implement wide gamut color support in the Framework

  [issue 127855][]：在框架中实现广色域颜色支持


Relevant PRs:

相关 PR：


* [PR 54737][]: Framework wide color

  [PR 54737][]：框架宽色


[`Color`]: {{site.api}}/flutter/dart-ui/Color-class.html
[already supports wide gamut color]: {{site.repo.flutter}}/issues/55092
[to the framework]: {{site.repo.flutter}}/issues/127855
[issue 127855]: {{site.repo.flutter}}/issues/127855
[`ColorSpace`]: {{site.api}}/flutter/dart-ui/ColorSpace.html
[PR 54737]: {{site.repo.engine}}/pull/54737
[DisplayP3]: https://en.wikipedia.org/wiki/DCI-P3
[Impeller]: {{site.api}}/perf/impeller
[wide gamut color spaces]: https://en.wikipedia.org/wiki/RGB_color_spaces
[inheritance to composition]: https://en.wikipedia.org/wiki/Composition_over_inheritance
[`closeTo`]: {{site.api}}/documentation/matcher/latest/matcher/closeTo.html
[`isColorSameAs`]: {{site.api}}/flutter/flutter_test/isSameColorAs.html
