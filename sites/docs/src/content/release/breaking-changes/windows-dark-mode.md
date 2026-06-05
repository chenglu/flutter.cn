---
# title: Migrate a Windows project to support dark title bars
title: 迁移 Windows 项目以支持深色标题栏
# description: How to update a Windows project to support dark title bars
description: 如何更新 Windows 项目以支持深色标题栏
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



Projects created before Flutter 3.7 have light title bars even
when the Windows theme is dark mode. Projects created before
Flutter 3.7 need to be migrated to support dark title bars.

即使 Windows 主题为深色模式，在 Flutter 3.7 之前创建的项目也具有浅色标题栏。 Flutter 3.7 之前创建的项目需要迁移以支持深色标题栏。


## Migration steps

## 迁移步骤


Your project can be updated using these steps:

可以使用以下步骤更新你的项目：


1. Verify you are on Flutter version 3.7 or newer using `flutter --version`

  使用 `flutter --version` 验证你使用的是 Flutter 版本 3.7 或更高版本

2. If needed, use `flutter upgrade` to update to the latest version of the

  如果需要，请使用 `flutter upgrade` 更新到最新版本

Flutter SDK
3. Backup your project, possibly using git or some other version control system

  备份你的项目，可能使用 git 或其他版本控制系统

4. Delete the following files:

  删除以下文件：

    1. `windows/runner/CMakeLists.txt`

      `windows/runner/CMakeLists.txt`

    2. `windows/runner/win32_window.cpp`

      `windows/runner/win32_window.cpp`

    3. `windows/runner/win32_window.h`

      `windows/runner/win32_window.h`

5. Run `flutter create --platforms=windows .`

  运行 `flutter create --platforms=windows .`

6. Review the changes to the following files:

  查看对以下文件的更改：

    1. `windows/runner/CMakeLists.txt`

      `windows/runner/CMakeLists.txt`

    2. `windows/runner/win32_window.cpp`

      `windows/runner/win32_window.cpp`

    3. `windows/runner/win32_window.h`

      `windows/runner/win32_window.h`

7. Verify your app builds using `flutter build windows`

  使用 `flutter build windows` 验证你的应用程序版本


:::note
Follow the [run loop migration guide][] if the build fails
with the following error message:

遵循[run loop migration guide][]如果构建失败并出现以下错误消息：


```console
flutter_window.obj : error LNK2019: unresolved external symbol "public: void __cdecl RunLoop::RegisterFlutterInstance(class flutter::FlutterEngine *)" (?RegisterFlutterInstance@RunLoop@@QEAAXPEAVFlutterEngine@flutter@@@Z) referenced in function "protected: virtual bool __cdecl FlutterWindow::OnCreate(void)" (?OnCreate@FlutterWindow@@MEAA_NXZ)
```
:::

## Example

## 示例


[PR 862][] shows the migration work for the
[Flutter Gallery][] app.

[run loop migration guide]: /release/breaking-changes/windows-run-loop
[PR 862]: {{site.repo.gallery-archive}}/pull/862/files
[Flutter Gallery]: {{site.gallery-archive}}
