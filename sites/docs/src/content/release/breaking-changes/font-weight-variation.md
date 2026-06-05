---
# title: FontWeight also controls the weight attribute of variable fonts
title: FontWeight 现在也控制可变字体的 weight 属性
# description: >-
#   FontWeight values applied to text styles will now
#   set the weight attribute of variable fonts.
description: >-
  应用于文本样式的 FontWeight 值现在
  会设置可变字体的 weight 属性。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

A `FontWeight` in a text style will also set the weight attribute of variable
fonts. It is no longer necessary to separately use `FontVariation` to control
the weight of these fonts.

文本样式中的 `FontWeight` 现在也会设置可变字体的 weight 属性。
不再需要使用 `FontVariation` 单独控制这些字体的粗细。

## Context

## 背景

Text styles can specify a `FontWeight` value that configures the thickness of
the strokes used to paint the text. `FontWeight` will select the closest
weight among a set of font files belonging to the same family.

文本样式可以指定 `FontWeight` 值来配置绘制文本时笔画的粗细。
`FontWeight` 会在同一字体族的多个字体文件中选择最接近的粗细。

However, some fonts are distributed as [variable fonts](https://fonts.google.com/knowledge/introducing_type/introducing_variable_fonts)
where a single font file allows adjustment of attributes such as weight. For
variable fonts, applications also had to use the `FontVariation` API to set
the value of the weight variation axis within the selected font file.

然而，部分字体以[可变字体](https://fonts.google.com/knowledge/introducing_type/introducing_variable_fonts)形式分发，
单个字体文件即可调整 weight 等属性。
对于可变字体，应用还需要使用 `FontVariation` API
来设置所选字体文件内 weight 变化轴的值。

Flutter has now changed the behavior of `FontWeight` so that it will both
select the closest matching font file and set the weight attribute of variable
fonts.

Flutter 现已更改 `FontWeight` 的行为，
使其既能选择最匹配的字体文件，又能设置可变字体的 weight 属性。

## Description of change

## 变更说明

Setting the `fontWeight` property of objects such as `TextStyle` will now also
set the value of the `wght` variation axis of fonts that support it. Flutter
will internally apply the equivalent of adding a `FontVariation('wght')`
attribute to the style whose value is the same as the `FontWeight`.

设置 `TextStyle` 等对象的 `fontWeight` 属性现在也会
设置支持该属性的字体的 `wght` 变化轴值。
Flutter 内部会等效于向样式添加 `FontVariation('wght')` 属性，
其值与 `FontWeight` 相同。

`FontWeight` instances can now be constructed using arbitrary integer values
ranging from 1 to 1000. This allows usage of weights beyond the
`FontWeight.w100` through `FontWeight.w900` range with values that are not
multiples of 100. This also means that linear interpolation of fonts using
`FontWeight.lerp` can yield values other than `FontWeight.w100` through `w900`.

`FontWeight` 实例现在可使用 1 到 1000 之间的任意整数值构造。
这让你可以使用超出 `FontWeight.w100` 到 `FontWeight.w900` 范围的粗细值，
且不必是 100 的倍数。
这也意味着使用 `FontWeight.lerp` 进行字体线性插值时，
可能产生 `FontWeight.w100` 到 `w900` 以外的值。

The `FontWeight.index` property is now deprecated because it only identifies
the `FontWeight.w100` through `w900` weights. Applications should use
`FontWeight.value` to obtain the thickness level of a font.

`FontWeight.index` 属性现已弃用，因为它仅标识
`FontWeight.w100` 到 `w900` 的粗细值。
应用应使用 `FontWeight.value` 获取字体的粗细级别。

## Migration guide

## 迁移指南

Applications may see changes in text rendering if they used variable fonts and
were specifying `FontWeight` in text styles without a matching
`FontVariation('wght')` value.

如果应用使用了可变字体，
并在文本样式中指定了 `FontWeight` 但未设置匹配的
`FontVariation('wght')` 值，文本渲染可能会发生变化。

If these changes are undesirable, then the application should change the
`FontWeight` to a value that achieves the intended rendering. For example,
to restore the font's default weight, set `fontWeight` to `FontWeight.normal`.

如果这些变化不符合预期，应用应将 `FontWeight`
更改为能实现预期渲染效果的值。
例如，要恢复字体的默认粗细，将 `fontWeight` 设为 `FontWeight.normal`。

## Timeline

## 时间线

Landed in version: 3.39.0-0.0.pre<br>
In stable release: 3.41

合入版本：3.39.0-0.0.pre<br>
稳定版发布：3.41

## References

## 参考资料

API documentation:

API 文档：

* [`FontWeight`][]

Relevant issue:

相关 issue：

* [Issue 148026][]

Relevant PR:

相关 PR：

* [PR 175771][]

[`FontWeight`]: {{site.api}}/flutter/dart-ui/FontWeight-class.html
[Issue 148026]: {{site.repo.flutter}}/issues/148026
[PR 175771]: {{site.repo.flutter}}/pull/175771
