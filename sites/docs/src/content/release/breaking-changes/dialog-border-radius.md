---
# title: Dialogs' Default BorderRadius
title: Dialog 的默认 BorderRadius
# description: The default BorderRadius of Dialog widgets is changing.
description: Dialog widget 的默认 BorderRadius 正在变更。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Instances of `Dialog`, as well as
`SimpleDialog`, `AlertDialog`, and `showTimePicker`,
now have a default shape of a `RoundedRectangleBorder`
with a `BorderRadius` of 4.0 pixels.
This matches the current specifications of Material Design.
Prior to this change, the default behavior for
`Dialog.shape`'s `BorderRadius` was 2.0 pixels.

`Dialog` 以及 `SimpleDialog`、`AlertDialog` 和 `showTimePicker`
现在默认使用 `RoundedRectangleBorder` 形状，
`BorderRadius` 为 4.0 像素。
这与 Material Design 的当前规范一致。
在此变更之前，`Dialog.shape` 的 `BorderRadius` 默认为 2.0 像素。

## Context

## 背景

`Dialog`s and their associated subclasses
(`SimpleDialog`, `AlertDialog`, and `showTimePicker`), appears
slightly different as the border radius is larger.
If you have master golden file images that have the
prior rendering of the `Dialog` with a 2.0 pixel border radius,
your widget tests will fail.
These golden file images can be updated to reflect the new rendering,
or you can update your code to maintain the original behavior.

`Dialog` 及其相关子类
（`SimpleDialog`、`AlertDialog` 和 `showTimePicker`）
因圆角更大而略有不同。
如果你的 master golden 文件图像仍使用
2.0 像素圆角的旧 `Dialog` 渲染效果，
widget 测试将会失败。
你可以更新这些 golden 文件图像以反映新渲染效果，
或修改代码以保持原有行为。

The `showDatePicker` dialog already matched
this specification and is unaffected by this change.

`showDatePicker` 对话框已符合此规范，
不受此变更影响。

## Migration guide

## 迁移指南

If you prefer to maintain the old shape, you can use
the shape property of your `Dialog` to specify the original 2 pixel radius.

如果你希望保持旧形状，可通过 `Dialog` 的 shape 属性
指定原有的 2 像素圆角。

Setting the Dialog shape to the original radius:

将 Dialog 形状设为原有圆角：

```dart
import 'package:flutter/material.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text('Alert!'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              );
            },
          );
        }),
      ),
    );
  }
}
```

If you prefer the new behavior and have failing golden file tests,
you can update your master golden files using this command:

如果你接受新行为且 golden 文件测试失败，
可使用以下命令更新 master golden 文件：

```console
flutter test --update-goldens
```

## Timeline

## 时间线

Landed in version: 1.20.0-0.0.pre<br>
In stable release: 1.20

合入版本：1.20.0-0.0.pre<br>
稳定版发布：1.20

## References

## 参考资料

API documentation:

API 文档：

* [`Dialog`][]
* [`SimpleDialog`][]
* [`AlertDialog`][]
* [`showTimePicker`][]
* [`showDatePicker`][]

Relevant PR:

相关 PR：

* [PR 58829: Matching Material Spec for Dialog shape][]

  [PR 58829：使 Dialog 形状符合 Material 规范][PR 58829: Matching Material Spec for Dialog shape]

[`Dialog`]: {{site.api}}/flutter/material/Dialog-class.html
[`SimpleDialog`]: {{site.api}}/flutter/material/SimpleDialog-class.html
[`AlertDialog`]: {{site.api}}/flutter/material/AlertDialog-class.html
[`showTimePicker`]: {{site.api}}/flutter/material/showTimePicker.html
[`showDatePicker`]: {{site.api}}/flutter/material/showDatePicker.html
[PR 58829: Matching Material Spec for Dialog shape]: {{site.repo.flutter}}/pull/58829
