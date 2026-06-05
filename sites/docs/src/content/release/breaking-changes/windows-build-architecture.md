---
# title: Windows build path changed to add the target architecture
title: Windows 构建路径已更改以添加目标架构
# description: >-
#   In preparation for supporting Windows on Arm64,
#   the Windows build path was updated to include the target architecture.
description: >-
  为了准备在 Arm64 上支持 Windows，更新了 Windows 构建路径以包含目标架构。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Built executables for Flutter Windows apps are now located in architecture
dependent folders.

为 Flutter Windows 应用程序构建的可执行文件现在位于依赖于体系结构的文件夹中。


## Context

## 背景


In preparation for supporting Windows on Arm64, the Windows build path was
updated to add the build's target architecture.

为了准备在 Arm64 上支持 Windows，更新了 Windows 构建路径以添加构建的目标架构。


Previously, Flutter builds for Windows assumed an x64 target architecture.

以前，Flutter 为 Windows 构建，假定 x64 目标架构。


## Migration guide

## 迁移指南


You may need to update your infrastructure to use the new Flutter Windows
build path.

你可能需要更新基础架构才能使用新的 Flutter Windows 构建路径。


Example build path before the migration:

迁移前的构建路径示例：


```plaintext
build\windows\runner\Release\hello_world.exe
```

Example build path after the migration if targeting x64:

如果针对 x64，迁移后的示例构建路径：


```plaintext
build\windows\x64\runner\Release\hello_world.exe
```

Example build path after the migration if targeting Arm64:

如果针对 Arm64，迁移后的示例构建路径：


```plaintext
build\windows\arm64\runner\Release\hello_world.exe
```

If you use [`package:msix`][], update to version 3.16.7 or newer.

如果你使用[`package:msix`][]，更新至版本 3.16.7 或更高版本。


[`package:msix`]: {{site.pub-pkg}}/msix

## Timeline

## 时间线


Landed in version: 3.15.0-0.0.pre<br>
登陆版本：3.15.0-0.0.pre
In stable release: 3.16
稳定版本：3.16

## References

## 参考资料


Design document:

设计文档：


* [flutter.dev/go/windows-arm64][]

  [flutter.dev/go/windows-arm64][flutter.dev/go/windows-arm64]


Relevant pull requests:

相关 pull request：


* [Introduce architecture subdirectory for Windows build][]

  [引入 Windows build 的架构子目录][Introduce architecture subdirectory for Windows build]


[flutter.dev/go/windows-arm64]: {{site.main-url}}/go/windows-arm64
[Introduce architecture subdirectory for Windows build]: {{site.repo.flutter}}/pull/131843
