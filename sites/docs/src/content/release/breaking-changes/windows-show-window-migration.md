---
# title: Migrate a Windows project to ensure the window is shown
title: 迁移 Windows 项目以确保显示窗口
# description: How to update a Windows project to ensure the window is shown
description: 如何更新 Windows 项目以确保显示窗口
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



Flutter 3.13 fixed a [bug][] that could result in the window not being shown.
Windows projects created using Flutter 3.7 or Flutter 3.10 need to be migrated
to fix this issue.

Flutter 3.13 修复了[bug][]这可能会导致窗口不显示。需要迁移使用 Flutter 3.7 或 Flutter 3.10 创建的 Windows 项目才能修复此 issue。


[bug]: {{site.repo.flutter}}/issues/119415

## Migration steps

## 迁移步骤


Verify you are on Flutter version 3.13 or newer using `flutter --version`.
If needed, use `flutter upgrade` to update to the latest version of the
Flutter SDK.

使用 `flutter --version` 验证你使用的是 Flutter 版本 3.13 或更高版本。如果需要，请使用 `flutter upgrade` 更新到最新版本的 Flutter SDK。


Projects that have not modified their `windows/runner/flutter_window.cpp` file
will be migrated automatically by `flutter run` or `flutter build windows`.

未修改 `windows/runner/flutter_window.cpp` 文件的项目将由 `flutter run` 或 `flutter build windows` 自动迁移。


Projects that have modified their `windows/runner/flutter_window.cpp` file might
need to migrate manually.

修改了 `windows/runner/flutter_window.cpp` 文件的项目可能需要手动迁移。


Code before migration:

迁移前的代码：


```cpp
flutter_controller_->engine()->SetNextFrameCallback([&]() {
  this->Show();
});
```

Code after migration:

迁移后的代码：


```cpp
flutter_controller_->engine()->SetNextFrameCallback([&]() {
  this->Show();
});

// Flutter can complete the first frame before the "show window" callback is
// registered. The following call ensures a frame is pending to ensure the
// window is shown. It is a no-op if the first frame hasn't completed yet.
flutter_controller_->ForceRedraw();
```

## Example

## 示例


[PR 995][] shows the migration work for the
[Flutter Gallery][] app.

[PR 995]: {{site.repo.gallery-archive}}/pull/995/files
[Flutter Gallery]: {{site.gallery-archive}}
