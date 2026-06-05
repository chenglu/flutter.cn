---
# title: Added missing `dispose()` for some disposable objects in Flutter
title: 为 Flutter 中部分可释放对象补充缺失的 `dispose()`
# description: >
#   'dispose()' might fail because of double disposal.
description: >
  重复调用 `dispose()` 可能导致失败。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Missing calls to 'dispose()' are added for some disposable objects.
For example, ContextMenuController did not dispose OverlayEntry,
and EditableTextState did not dispose TextSelectionOverlay.

为部分可释放对象补充了缺失的 `dispose()` 调用。
例如，ContextMenuController 未释放 OverlayEntry，
EditableTextState 未释放 TextSelectionOverlay。

If some other code also invokes 'dispose()' for the object,
and the object is protected from double disposal,
the second 'dispose()' fails with the following error message:

`Once you have called dispose() on a <class name>, it can no longer be used.`

如果其他代码也对该对象调用了 `dispose()`，
且该对象有防重复释放保护，
第二次 `dispose()` 将失败并显示以下错误信息：

`Once you have called dispose() on a <class name>, it can no longer be used.`

## Background

## 背景

The convention is that the owner of an object should dispose of it.

惯例是对象的所有者应负责释放它。

This convention was broken in some places:
owners were not disposing the disposable objects.
The issue was fixed by adding a call to `dispose()`.
However, if the object is protected from double disposal,
this can cause failures when running in debug mode
and `dispose()` is called elsewhere on the object.

某些地方违反了这一惯例：
所有者未释放可释放对象。
已通过添加 `dispose()` 调用来修复此问题。
然而，如果对象有防重复释放保护，
在 debug 模式下运行时，
若其他地方也调用了 `dispose()`，可能会导致失败。

## Migration guide

## 迁移指南

If you encounter the following error, update your code to
call `dispose()` only in cases when your code created the object.

如果遇到以下错误，请更新代码，
仅在你创建的该对象上调用 `dispose()`。

```plaintext
Once you have called dispose() on a <class name>, it can no longer be used.
```

Code before migration:

迁移前的代码：

```dart
x.dispose();
```

Code after migration:

迁移后的代码：

```dart
if (xIsCreatedByMe) {
  x.dispose();
}
```

To locate the incorrect disposal, check the call stack of the error. If the call stack points to `dispose`
in your code, this disposal is incorrect and should be fixed.

要定位错误的释放操作，请检查错误的调用栈。
如果调用栈指向你代码中的 `dispose`，
则该释放操作不正确，应予以修复。

If the error occurs in Flutter code, `dispose()` was
called incorrectly the first time.

如果错误发生在 Flutter 代码中，
说明第一次 `dispose()` 调用不正确。

You can locate the incorrect call by temporary calling `print(StackTrace.current)`
in the body of the failed method `dispose`.

你可以在失败的 `dispose` 方法体中临时调用 `print(StackTrace.current)`，
以定位错误的调用位置。

## Timeline

## 时间线

See the progress and status [in the tracking issue]({{site.repo.flutter}}/issues/134787).

进度和状态请参见[跟踪 issue]({{site.repo.flutter}}/issues/134787)。
