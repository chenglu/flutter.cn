---
# title: Migration guide for wide gamut CupertinoDynamicColor
title: 广色域迁移指南 CupertinoDynamicColor
# description: >-
#   Addressing previously missed deprecations in CupertinoDynamicColor to
#   align with wide gamut Color API.
description: >-
  解决了之前在 CupertinoDynamicColor 中遗漏的弃用问题，以与广色域颜色 API 保持一致。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Certain properties and methods in [`CupertinoDynamicColor`][] were deprecated
to align with the [`Color`][] class due to [wide gamut color spaces][] support
added in [Flutter 3.27][Migration guide for wide gamut Color].

中的某些属性和方法[`CupertinoDynamicColor`][]已弃用以与[`Color`][]类由于[wide gamut color spaces][]Flutter 3.27中添加了支持。


## Context

## 背景


The `Color` class was updated to support wide gamut color spaces,
but some corresponding deprecations were not initially applied to
`CupertinoDynamicColor` due to its implementation rather than
due to the extension of `Color`.

`Color` 类已更新以支持广色域颜色空间，但由于其实现而不是由于 `Color` 的扩展，一些相应的弃用最初并未应用于 `CupertinoDynamicColor` 。


## Description of change

## 变更说明


1.  The [`CupertinoDynamicColor.red`][] field is deprecated in

  这[`CupertinoDynamicColor.red`][]该字段已被弃用

    favor of [`CupertinoDynamicColor.r`].

支持 [`CupertinoDynamicColor.r`]。

1.  The [`CupertinoDynamicColor.green`][] is deprecated in

  这[`CupertinoDynamicColor.green`][]已弃用

    favor of [`CupertinoDynamicColor.g`].

支持 [`CupertinoDynamicColor.g`]。

1.  The [`CupertinoDynamicColor.blue`][] is deprecated in

  这[`CupertinoDynamicColor.blue`][]已弃用

    favor of [`CupertinoDynamicColor.b`].

支持 [`CupertinoDynamicColor.b`]。

1.  The [`CupertinoDynamicColor.opacity`][] is deprecated in

  这[`CupertinoDynamicColor.opacity`][]已弃用

    favor of [`CupertinoDynamicColor.a`].

支持 [`CupertinoDynamicColor.a`]。

1.  The [`CupertinoDynamicColor.withOpacity()`][] is deprecated in

  这[`CupertinoDynamicColor.withOpacity()`][]已弃用

    favor of [`CupertinoDynamicColor.withValues()`].

[`CupertinoDynamicColor.withValues()`] 的青睐。


## Migration guide

## 迁移指南


### Access color components

### 访问颜色组件


If your app accesses a single color component, consider
taking advantage of the floating-point components.
In the short term, you can scale the components themselves.

如果你的应用程序访问单个颜色组件，请考虑利用浮点组件。在短期内，你可以扩展组件本身。


```dart
int _floatToInt8(double x) {
  return (x * 255.0).round().clamp(0, 255);
}

const CupertinoDynamicColor color = CupertinoColors.systemBlue;
final intRed = _floatToInt8(color.r);
final intGreen = _floatToInt8(color.g);
final intBlue = _floatToInt8(color.b);
```

### Opacity

### 不透明度


Before Flutter 3.27, `Color` had the concept of "opacity", which
showed up in the methods `opacity` and `withOpacity()`.
Since Flutter 3.27, the alpha channel has been stored as a floating-point value.
Using `.a` and `.withValues()` will give the full expression of
a floating-point value and won't be quantized (restricted to a limited range).
That means "alpha" expresses the intent of "opacity" more correctly.

在Flutter 3.27之前，`Color`有“不透明度”的概念，它出现在方法`opacity`和`withOpacity()`中。自 Flutter 3.27 起，Alpha 通道已存储为浮点值。使用 `.a` 和 `.withValues()` 将给出浮点值的完整表达式，并且不会被量化（限制在有限范围内）。这意味着“alpha”更正确地表达了“不透明度”的意图。


#### Migrate `opacity`

#### 迁移 `opacity`


```dart
// Before: Access the alpha channel as a (converted) floating-point value.
final x = color.opacity;

// After: Access the alpha channel directly.
final x = color.a;
```

#### Migrate `withOpacity`

#### 迁移 `withOpacity`


```dart
// Before: Create a new color with the specified opacity.
final x = color.withOpacity(0.5);

// After: Create a new color with the specified alpha channel value,
// accounting for the current or specified color space.
final x = color.withValues(alpha: 0.5);
```

## Timeline

## 时间线


Landed in version: 3.36.0-0.1.pre<br>
登陆版本：3.36.0-0.1.pre
Stable release: 3.38
稳定版本：3.38

## References

## 参考资料


Relevant guides:

相关指南：


* [Migration guide for wide gamut Color][]

  [广色域颜色迁移指南][Migration guide for wide gamut Color]


Relevant issues:

相关 issue：


* [Implement wide gamut color support in the Framework][]

  [在框架中实现广色域颜色支持][Implement wide gamut color support in the Framework]

* [CupertinoDynamicColor is missing deprecation notices][]

  [CupertinoDynamicColor 缺少弃用通知][CupertinoDynamicColor is missing deprecation notices]


Relevant PRs:

相关 PR：


* [Add missing deprecations to CupertinoDynamicColor][]

  [将缺失的弃用添加到 CupertinoDynamicColor][Add missing deprecations to CupertinoDynamicColor]


[`Color`]: {{site.api}}/flutter/dart-ui/Color-class.html
[`CupertinoDynamicColor`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor-class.html
[wide gamut color spaces]: https://en.wikipedia.org/wiki/RGB_color_spaces
[`CupertinoDynamicColor.red`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/red.html
[`CupertinoDynamicColor.r`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/r.html
[`CupertinoDynamicColor.green`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/green.html
[`CupertinoDynamicColor.g`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/g.html
[`CupertinoDynamicColor.blue`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/blue.html
[`CupertinoDynamicColor.b`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/b.html
[`CupertinoDynamicColor.opacity`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/opacity.html
[`CupertinoDynamicColor.a`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/a.html
[`CupertinoDynamicColor.withOpacity()`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/withOpacity.html
[`CupertinoDynamicColor.withValues()`]: {{site.api}}/flutter/cupertino/CupertinoDynamicColor/withValues.html
[Migration guide for wide gamut Color]: /release/breaking-changes/wide-gamut-framework
[Implement wide gamut color support in the Framework]: {{site.repo.flutter}}/issues/127855
[CupertinoDynamicColor is missing deprecation notices]: {{site.repo.flutter}}/issues/171059
[Add missing deprecations to CupertinoDynamicColor]: {{site.repo.flutter}}/pull/171160
