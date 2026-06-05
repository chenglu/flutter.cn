---
# title: Notable rendering and layout changes after v3.7
title: v3.7 之后显着的渲染和布局变化
# description: Non-API related breaking changes made after Flutter v3.7.
description: Flutter v3.7 之后进行的非 API 相关重大更改。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Changes

## 变化


This section lists the notable non-API breaking changes.

本节列出了值得注意的非 API 重大更改。


### (Only Affects Tests) `FlutterTest` is now the default test font

### （仅影响测试）“FlutterTest”现在是默认测试字体


The `FlutterTest` font replaced `Ahem` as the default font in tests: when
`fontFamily` isn't specified, or the font families specified are not registered,
tests use the `FlutterTest` font to render text. The `Ahem` font is still
available in tests if specified as the `fontFamily` to use.

`FlutterTest` 字体取代了 `Ahem` 成为测试中的默认字体：当未指定 `fontFamily` 或未注册指定的字体系列时，测试使用 `FlutterTest` 字体来渲染文本。如果指定为要使用的“fontFamily”，“Ahem”字体在测试中仍然可用。


The `FlutterTest` font produces more precise font and glyph metrics than `Ahem`,
and the metrics are generally font-engine agnostic.
Check out the [Flutter Test Fonts][]
wiki page for more details about the test font.

“FlutterTest”字体比“Ahem”生成更精确的字体和字形指标，并且这些指标通常与字体引擎无关。查看 [Flutter Test Fonts][] wiki 页面，了解有关测试字体的更多详细信息。


**Differences**

**差异**


The `FlutterTest` font looks almost identical to the old default `Ahem`: the
glyph for most characters is a box that fills the em square. The notable
differences between the `FlutterTest` font and `Ahem` font are:

“FlutterTest” 字体看起来几乎与旧的默认“Ahem” 相同：大多数字符的字形是一个填充 em 正方形的框。 `FlutterTest` 字体和 `Ahem` 字体之间的显着区别是：


**1. Different baseline location**

**1.不同的基线位置**


The `FlutterTest` font's ascent and descent are 0.75 em and 0.25 em, while
`Ahem`'s are 0.8 em and 0.2 em, respectively.

“FlutterTest”字体的上升和下降分别为 0.75 em 和 0.25 em，而“Ahem”字体分别为 0.8 em 和 0.2 em。


In the example golden image change below, the white blocks are text rendered
using `Ahem` and `FlutterTest`. The second character is taller in the new font
since it has a larger descent.

在下面的金色图像更改示例中，白色块是使用“Ahem”和“FlutterTest”渲染的文本。新字体中的第二个字符更高，因为它有更大的下降。


| Before (`Ahem`) | After |               Animated Diff               |
| Before (`Ahem`) | 后 | 动画差异 |
| :---: | :---: |:-----------------------------------------:|
| ![before](/assets/images/docs/breaking-changes/material.ink_sparkle.bottom_right.0_masterImage.png) | ![after](/assets/images/docs/breaking-changes/material.ink_sparkle.bottom_right.0_testImage.png) | ![baseline_animated](/assets/images/docs/breaking-changes/baseline.gif) |

**2. Different decoration position**

**2.不同的装修位置**


The underline location is slightly higher in `FlutterTest` than `Ahem`.

在 `FlutterTest` 中下划线位置比 ` 咳咳 ` 略高。


In the example golden image change below, the 3 lines of white blocks are text
rendered using `Ahem` and `FlutterTest`. The blue dashed lines indicate the
[TextDecoration.overline]/[TextDecoration.lineThrough]/[TextDecoration.underline]
positions for each line.

在下面的金色图像更改示例中，3 行白色块是使用“Ahem”和“FlutterTest”渲染的文本。蓝色虚线表示每行的 [TextDecoration.overline]/[TextDecoration.lineThrough]/[TextDecoration.underline] 位置。


| Before (`Ahem`) | After |               Animated Diff                |
| Before (`Ahem`) | 后 | 动画差异 |
| :---: | :---: |:------------------------------------------:|
| ![before](/assets/images/docs/breaking-changes/widgets.text_golden.Decoration.1_masterImage.png) | ![after](/assets/images/docs/breaking-changes/widgets.text_golden.Decoration.1_testImage.png) | ![baseline_animated](/assets/images/docs/breaking-changes/underline.gif) |

**3. The glyph used for unmapped characters are slightly different**

**3.用于未映射字符的字形略有不同**


Unmapped characters are rendered as hollow boxes in both fonts, with
a slight difference:

未映射的字符在两种字体中都呈现为空心框，但略有不同：


| Before (`Ahem`) | After |                  Diff                   |
| Before (`Ahem`) | 后 | 差异 |
| :---: | :---: |:---------------------------------------:|
| ![before](/assets/images/docs/breaking-changes/material.floating_action_button_test.clip_masterImage.png) | ![after](/assets/images/docs/breaking-changes/material.floating_action_button_test.clip_testImage.png) | ![not_def_animated](/assets/images/docs/breaking-changes/not_def.gif) |

## References

## 参考


Relevant PRs:

相关 PR：


* The `FlutterTest` font was added in: [Add new test font]({{site.repo.engine}}/pull/39809)

  `FlutterTest` 字体已添加到：[添加新测试字体]({{site.repo.engine}}/pull/39809)

* The `FlutterTest` font was made the default in: [Make FlutterTest the default test font]({{site.repo.engine}}/pull/40188)

  `FlutterTest` 字体被设为默认字体：[将 FlutterTest 设置为默认测试字体]({{site.repo.engine}}/pull/40188)


Wiki page:

维基页面：


* [Flutter Test Fonts][]


[Flutter Test Fonts]: {{site.repo.flutter}}/blob/main/docs/contributing/testing/Flutter-Test-Fonts.md
[TextDecoration.underline]: {{site.api}}/flutter/dart-ui/TextDecoration/underline-constant.html
[TextDecoration.overline]: {{site.api}}/flutter/dart-ui/TextDecoration/overline-constant.html
[TextDecoration.lineThrough]: {{site.api}}/flutter/dart-ui/TextDecoration/lineThrough-constant.html
