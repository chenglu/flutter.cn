---
# title: Use maxLengthEnforcement instead of maxLengthEnforced
title: 使用 maxLengthEnforcement 而不是 maxLengthEnforced
# description: Introducing the MaxLengthEnforcement enum.
description: 介绍 MaxLengthEnforcement 枚举。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


To control the behavior of `maxLength` in the
`LengthLimitingTextInputFormatter`, use `maxLengthEnforcement`
instead of the now-deprecated `maxLengthEnforced`.

要控制 `LengthLimitingTextInputFormatter` 中 `maxLength` 的行为，请使用 `maxLengthEnforcement` 而不是现已弃用的 `maxLengthEnforced`。


## Context

## 背景


The `maxLengthEnforced` parameter was used to decide
whether text fields should truncate the input value
when it reaches the `maxLength` limit, or whether
(for `TextField` and `TextFormField`)
a warning message should instead be shown in the
character count when the length of the user input
exceeded `maxLength`.

`maxLengthEnforced` 参数用于决定当输入值达到 `maxLength` 限制时文本字段是否应截断输入值，或者当用户输入的长度超过 `maxLength` 时（对于 `TextField` 和 `TextFormField`）是否应在字符计数中显示警告消息。


However, to enter CJK characters, some input methods
require the user to enter a sequence of Latin characters
into the text field, then turn this sequence
into desired CJK characters (a referred to as *text composition*).
The Latin sequence is usually longer than the resulting CJK characters,
so setting a hard maximum character limit on a text field may mean
the user is unable to finish the text composition normally due to the
`maxLength` character limit.

然而，要输入 CJK 字符，某些输入法要求用户在文本字段中输入拉丁字符序列，然后将该序列转换为所需的 CJK 字符（称为“文本组合”）。拉丁序列通常比生成的 CJK 字符长，因此在文本字段上设置硬性最大字符限制可能意味着用户由于 `maxLength` 字符限制而无法正常完成文本撰写。


Text composition is also used by some input methods to
indicate that the text within the highlighted composing
region is being actively edited, even when entering
Latin characters. For example, Gboard's English keyboard on Android
(as with many other input methods on Android) puts the current word
in a composing region.

某些输入方法还使用文本合成来指示突出显示的合成区域内的文本正在被主动编辑，即使在输入拉丁字符时也是如此。例如，Android 上的 Gboard 英文键盘（与 Android 上的许多其他输入法一样）会将当前单词置于撰写区域中。


To improve the input experience in these scenarios,
a new tri-state enum, `MaxLengthEnforcement`, was introduced.
Its values describe supported strategies for handling
active composing regions when applying a
`LengthLimitingTextInputFormatter`.
A new `maxLengthEnforcement` parameter that uses
this enum has been added to text fields to replace
the boolean `maxLengthEnforced` parameter.
With the new enum parameter,
developers can choose different strategies
based on the type of the content the text field expects.

为了改善这些场景中的输入体验，引入了新的三态枚举 `MaxLengthEnforcement`。它的值描述了应用 `LengthLimitingTextInputFormatter` 时处理活动合成区域所支持的策略。使用此枚举的新 `maxLengthEnforcement` 参数已添加到文本字段中，以替换布尔值 `maxLengthEnforced` 参数。通过新的枚举参数，开发人员可以根据文本字段期望的内容类型选择不同的策略。


For more information, see the docs for [`maxLength`][] and
[`MaxLengthEnforcement`][].

有关更多信息，请参阅文档[`maxLength`][]和[`MaxLengthEnforcement`][].


The default value of the `maxLengthEnforcement`
parameter is inferred from the `TargetPlatform`
of the application, to conform to the platform's conventions:

`maxLengthEnforcement` 参数的默认值是从应用程序的 `TargetPlatform` 推断出来的，以符合平台的约定：


## Description of change

## 变更说明


* Added a `maxLengthEnforcement` parameter using the

  使用以下命令添加了 `maxLengthEnforcement` 参数

  new enum type `MaxLengthEnforcement`,
  as a replacement for the now-deprecated boolean
  `maxLengthEnforced` parameter on
  `TextField`, `TextFormField`, `CupertinoTextField`, and
  `LengthLimitingTextInputFormatter` classes.

新的枚举类型 `MaxLengthEnforcement`，作为 `TextField`、`TextFormField`、`CupertinoTextField` 和 `LengthLimitingTextInputFormatter` 类上现已弃用的布尔值 `maxLengthEnforced` 参数的替代。


## Migration guide

## 迁移指南


_Using the default behavior for the current platform is recommended,
since this will be the behavior most familiar to the user._

_建议使用当前平台的默认行为，因为这将是用户最熟悉的行为。_


### Default values of `maxLengthEnforcement`

### `maxLengthEnforcement` 的默认值


* Android, Windows: `MaxLengthEnforcement.enforced`.

  Android、Windows：`MaxLengthEnforcement.enforced`。

  The native behavior of these platforms is enforced.
  The inputting value will be truncated whether
  the user is entering with composition or not.

这些平台的本机行为是强制执行的。无论用户是否组合输入，输入的值都会被截断。

* iOS, macOS: `MaxLengthEnforcement.truncateAfterCompositionEnds`.

  iOS、macOS：`MaxLengthEnforcement.truncateAfterCompositionEnds`。

  These platforms do not have a "maximum length"
  feature and therefore require that developers implement
  the behavior themselves. No standard convention seems
  to have evolved on these platforms. We have chosen
  to allow the composition to exceed the maximum length
  to avoid breaking CJK input.

这些平台没有“最大长度”功能，因此需要开发人员自己实现该行为。这些平台上似乎没有发展出任何标准约定。我们选择允许合成超过最大长度，以避免破坏 CJK 输入。

* Web and Linux: `MaxLengthEnforcement.truncateAfterCompositionEnds`.

  Web 和 Linux：`MaxLengthEnforcement.truncateAfterCompositionEnds`。

  While there is no standard on these platforms
  (and many implementation exist with conflicting behavior),
  the common convention seems to be to allow the composition
  to exceed the maximum length by default.

虽然这些平台上没有标准（并且许多实现存在冲突行为），但通用约定似乎是默认允许组合超过最大长度。

* Fuchsia: `MaxLengthEnforcement.truncateAfterCompositionEnds`.

  Fuchsia：`MaxLengthEnforcement.truncateAfterCompositionEnds`。

  There is no platform convention on this platform yet,
  so we have chosen to default to the convention that is
  least likely to result in data loss.

该平台上尚无平台约定，因此我们选择默认最不可能导致数据丢失的约定。


### To enforce the limit all the time

### 始终强制执行限制


To enforce the limit that always truncate the value when
it reaches the limit (for example, when entering a
verification code), use `MaxLengthEnforcement.enforced` in
editable text fields.

要强制执行在达到限制时始终截断值的限制（例如，输入验证码时），请在可编辑文本字段中使用 `MaxLengthEnforcement.enforced`。


_This option may give suboptimal user experience when used
with input methods that rely on text composition.
Consider using the `truncateAfterCompositionEnds`
option when the text field expects arbitrary user input
which may contain CJK characters.
See the [Context](#context) section for more information._

_与依赖文本合成的输入法一起使用时，此选项可能会提供次优的用户体验。当文本字段需要可能包含 CJK 字符的任意用户输入时，请考虑使用 `truncateAfterCompositionEnds` 选项。请参阅[Context](#context)部分了解更多信息._


Code before migration:

迁移前的代码：


```dart
TextField(maxLength: 6)
```

or:

或者：


```dart
TextField(
  maxLength: 6,
  maxLengthEnforced: true,
)
```

Code after migration:

迁移后的代码：


```dart
TextField(
  maxLength: 6,
  maxLengthEnforcement: MaxLengthEnforcement.enforced,
)
```

### To not enforce the limitation

### 不强制执行限制


To show a max length error in `TextField`,
but _not_ truncate when the limit is exceeded,
use `MaxLengthEnforcement.none` instead of
`maxLengthEnforced: false`.

要显示 `TextField` 中的最大长度错误，但在超出限制时_不_截断，请使用 `MaxLengthEnforcement.none` 而不是 `maxLengthEnforced: false`。


Code before migration:

迁移前的代码：


```dart
TextField(
  maxLength: 6,
  maxLengthEnforced: false,
)
```

Code after migration:

迁移后的代码：


```dart
TextField(
  maxLength: 6,
  maxLengthEnforcement: MaxLengthEnforcement.none,
)
```

For `CupertinoTextField`, which isn't able to show an error message,
just don't set the `maxLength` value.

对于无法显示错误消息的 `CupertinoTextField`，只需不要设置 `maxLength` 值即可。


Code before migration:

迁移前的代码：


```dart
CupertinoTextField(
  maxLength: 6,
  maxLengthEnforced: false,
)
```

Code after migration:

迁移后的代码：


```dart
CupertinoTextField()
```

### To enforce the limit, but not for composing text

### 强制执行限制，但组合输入文本除外


To avoid truncating text while the user is inputting text
by using composition, specify
`MaxLengthEnforcement.truncateAfterCompositionEnds`.
This behavior allows input methods that use composing
regions larger than the resulting text,
as is common for example with Chinese, Japanese,
and Korean (CJK) text, to temporarily
ignore the limit until editing is complete.

为了避免在用户使用组合输入文本时截断文本，请指定 `MaxLengthEnforcement.truncateAfterCompositionEnds`。此行为允许使用大于结果文本的合成区域（例如中文、日文和韩文 (CJK) 文本）的输入方法暂时忽略该限制，直到编辑完成。


_Gboard's English keyboard on Android
(and many other Android input methods)
creates a composing region for the word being entered.
When used in a `truncateAfterCompositionEnds` text field,
the user won't be stopped right away at the `maxLength` limit.
Consider the `enforced` option if you are confident that
the text field will not be used with input methods
that use temporarily long composing regions such as CJK text._

Android（以及许多其他 Android 输入法）上的 _Gboard 英文键盘为输入的单词创建一个组合区域。当在 `truncateAfterCompositionEnds` 文本字段中使用时，用户不会立即在 `maxLength` 限制处停止。如果你确信文本字段不会与使用临时长组合区域（例如 CJK 文本）的输入法一起使用，请考虑 `enforced` 选项。_


Code for the implementation:

实现代码：


```dart
TextField(
  maxLength: 6,
  maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds, // Temporarily lifts the limit.
)
```

### Be wary of assuming input will not use composing regions

### 勿假定输入不会使用组合区域


It is tempting when targeting a particular locale to assume
that all users will be satisfied with input from that locale.
For example, forum software targeting an English-language
community might be assumed to only need to deal with English
text. However, this kind of assumption is often incorrect.
For example, maybe the English-language forum participants
will want to discuss Japanese anime or Vietnamese cooking.
Maybe one of the participants is Korean and prefers to express
their name in their native ideographs. For this reason,
freeform fields should rarely use the `enforced` value
and should instead prefer the
`truncateAfterCompositionEnds` value if at all possible.

当针对特定区域设置时，很容易假设所有用户都会对该区域设置的输入感到满意。例如，针对英语社区的论坛软件可能被认为只需要处理英语文本。然而，这种假设往往是不正确的。例如，英语论坛参与者可能想讨论日本动漫或越南烹饪。也许其中一位参与者是韩国人，更喜欢用自己的母语表意文字表达自己的名字。因此，自由格式字段应很少使用 `enforced` 值，而应尽可能使用 `truncateAfterCompositionEnds` 值。


## Timeline

## 时间线


Landed in version: v1.26.0-1.0.pre<br>
登陆版本：v1.26.0-1.0.pre
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


Design doc:

设计文档：


* [`MaxLengthEnforcement` design doc][]

  [`MaxLengthEnforcement` 设计文档][`MaxLengthEnforcement` design doc]


API documentation:

API 文档：


* [`MaxLengthEnforcement`][]
* [`LengthLimitingTextInputFormatter`][]
* [`maxLength`][]

Relevant issues:

相关 issue：


* [Issue 63753][]

  [问题 63753][Issue 63753]

* [Issue 67898][]

  [问题 67898][Issue 67898]


Relevant PR:

相关 PR：


* [PR 63754][]: Fix TextField crashed with composing and maxLength set

  [PR 63754][]：修复 TextField 在撰写和设置 maxLength 时崩溃的问题

* [PR 68086][]: Introduce `MaxLengthEnforcement`

  [PR 68086][]：介绍 `MaxLengthEnforcement`


[`MaxLengthEnforcement` design doc]: /go/max-length-enforcement
[`MaxLengthEnforcement`]: {{site.api}}/flutter/services/MaxLengthEnforcement.html
[`LengthLimitingTextInputFormatter`]: {{site.api}}/flutter/services/LengthLimitingTextInputFormatter-class.html
[`maxLength`]: {{site.api}}/flutter/services/LengthLimitingTextInputFormatter/maxLength.html
[Issue 63753]: {{site.repo.flutter}}/issues/63753
[Issue 67898]: {{site.repo.flutter}}/issues/67898
[PR 63754]: {{site.github}}/flutter/flutter/pull/63754
[PR 68086]: {{site.repo.flutter}}/pull/68086
