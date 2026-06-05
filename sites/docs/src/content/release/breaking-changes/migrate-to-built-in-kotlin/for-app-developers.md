---
# title: Built-in Kotlin migration for app developers
title: 面向应用程序开发人员的内置 Kotlin 迁移
# description: >-
#   Migrate Flutter apps to use built-in Kotlin.
description: >
  迁移 Flutter 应用程序以使用内置 Kotlin。
ai-translated: true
---

## Migrate

## 迁移


This guide outlines the migration steps specifically for app developers.

本指南专门为应用程序开发人员概述了迁移步骤。


These instructions assume you are updating from
an AGP version created before 9.0.0 to an AGP version 9.0.0+.
You should also use the minimum compatible dependency versions
listed in the [Android Gradle Plugin docs][AGP block].

这些说明假设你要从 9.0.0 之前创建的 AGP 版本更新到 AGP 版本 9.0.0+。你还应该使用 [Android Gradle 插件文档][Android Gradle Plugin docs] 中列出的最低兼容依赖项版本。


### Verify flags in properties file

### 验证属性文件中的标志


Flutter sets the default behavior to use the legacy Kotlin Gradle Plugin (KGP)
and the old AGP DSL types to support projects that have not yet migrated.
The Flutter migrator tool automatically adds `android.builtInKotlin=false`
and `android.newDsl=false` to your `gradle.properties` file.

Flutter 设置默认行为使用旧版 Kotlin Gradle 插件 (KGP) 和旧版 AGP DSL 类型来支持尚未迁移的项目。 Flutter 迁移器工具会自动将 android.builtInKotlin=false 和 android.newDsl=false 添加到你的 gradle.properties 文件中。


If these flags are missing from your `gradle.properties` file,
the Flutter tool automatically adds them when you next build or run your app
using `flutter run` or `flutter build apk`.

如果“gradle.properties”文件中缺少这些标志，当你下次使用“flutter run”或“flutter build apk”构建或运行应用程序时，Flutter 工具会自动添加它们。


Alternatively, building the project using Android Studio tooling also adds
these flags automatically.
Once the process completes, verify that the flags have been added.
For more details, see [Issue #183910].

或者，使用 Android Studio 工具构建项目也会自动添加这些标志。该过程完成后，验证是否已添加标志。有关更多详细信息，请参阅[问题#183910]。


All add-to-app projects must manually add `android.builtInKotlin=false`
and `android.newDsl=false` to the Android host app's `gradle.properties` file.
The Flutter migrator tool cannot run during add-to-app Android host app builds
because the host app is a pure native Android project.

所有添加到应用程序的项目都必须手动将 `android.builtInKotlin=false` 和 `android.newDsl=false` 添加到 Android 主机应用程序的 `gradle.properties` 文件中。 Flutter 迁移器工具无法在添加到应用程序 Android 主机应用程序构建期间运行，因为主机应用程序是纯原生 Android 项目。


```properties diff title="<host-app-project>/gradle.properties"
# ...
+ android.newDsl=false
+ android.builtInKotlin=false
```

:::note
If your app doesn't apply
如果你的应用不适用

the `kotlin-android` plugin (also called Kotlin Gradle Plugin),
`kotlin-android` 插件（也称为 Kotlin Gradle 插件），

then you only need to add `android.newDsl=false` and do not need
那么你只需要添加 `android.newDsl=false` 而不需要

further migration.
进一步迁移。

:::

### Update the Gradle file

### 更新 Gradle 文件


First, find the `kotlin-android` plugin (or the `org.jetbrains.kotlin.android`
plugin).
It is likely located in the `plugins` block of the
`<app-src>/android/app/build.gradle` or the
`<app-src>/android/app/build.gradle.kts` file.
If you use the legacy `apply` syntax, it will be located in
the Groovy-based `<app-src>/android/app/build.gradle` file, as this syntax is
not supported in Kotlin DSL.

首先，找到“kotlin-android”插件（或“org.jetbrains.kotlin.android”插件）。它可能位于“<app-src>/android/app/build.gradle”或“<app-src>/android/app/build.gradle.kts”文件的“plugins”块中。如果你使用旧的“apply”语法，它将位于基于 Groovy 的“<app-src>/android/app/build.gradle”文件中，因为 Kotlin DSL 不支持此语法。


The following examples demonstrate how to migrate a Flutter Android app
and an add-to-app Android host app:

以下示例演示了如何迁移 Flutter Android 应用程序和添加到应用程序的 Android 主机应用程序：


#### Migrate your Flutter Android app

#### 迁移你的 Flutter Android 应用


<Tabs key="modern-legacy-apply">
<Tab name="plugins block">

**Before**:

**前**：


```kotlin title="<app-src>/android/app/build.gradle(.kts)"
plugins {
    id(`com.android.application`)
    id("kotlin-android")
    // ...
}

android {
    // ...
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }
    // ...
}

// ...
```

Next, remove the `kotlin-android` plugin and the `kotlinOptions` block:

接下来，删除“kotlin-android”插件和“kotlinOptions”块：


```kotlin diff title="<app-src>/android/app/build.gradle.kts"
  plugins {
      id(`com.android.application`)
-     id("kotlin-android")
      // ...
  }

  android {
      // ...
-     kotlinOptions {
-         jvmTarget = JavaVersion.VERSION_17.toString()
-     }
      // ...
  }
```

Add the `kotlin.compilerOptions{}` DSL block with the following:

添加“kotlin.compilerOptions{}”DSL 块，其中包含以下内容：


```kotlin diff title="<app-src>/android/app/build.gradle.kts"
+ kotlin {
+     compilerOptions {
+         jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
+     }
+ }
```

Here is how the file will likely end up:

该文件可能的最终结果如下：


**After**:

**后**：


```kotlin title="<app-src>/android/app/build.gradle(.kts)"
plugins {
    id(`com.android.application`)
    // ...
}

android {
    // ...
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// ...
```

</Tab>
<Tab name="legacy apply">

**Before**:

**前**：


```groovy title="<app-src>/android/app/build.gradle"
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
// ...

android {
    // ...
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }
    // ...
}

// ...
```

Next, remove the `kotlin-android` plugin and the `kotlinOptions` block:

接下来，删除“kotlin-android”插件和“kotlinOptions”块：


```groovy diff title="<app-src>/android/app/build.gradle"
  apply plugin: 'com.android.application'
- apply plugin: 'kotlin-android'
// ...

  android {
      // ...
-     kotlinOptions {
-         jvmTarget = JavaVersion.VERSION_17.toString()
-     }
      // ...
  }
```
Add the `kotlin.compilerOptions{}` DSL block with the following:

添加“kotlin.compilerOptions{}”DSL 块，其中包含以下内容：


```groovy diff title="<app-src>/android/app/build.gradle"
+ kotlin {
+     compilerOptions {
+         jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
+     }
+ }
```

Here is how the file will likely end up:

该文件可能的最终结果如下：


**After**:

**后**：


```groovy title="<app-src>/android/app/build.gradle"
apply plugin: 'com.android.application'
// ...

android {
    // ...
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// ...
```

</Tab>
</Tabs>

#### Migrate your add-to-app Android host app

#### 迁移你的添加到应用程序 Android 主机应用程序


Android native apps use the `alias` keyword to apply plugins,
which is incompatible with the legacy `apply()` syntax.
Therefore, only the `plugins {}` block instructions are included.

Android 本机应用程序使用“alias”关键字来应用插件，这与旧版“apply()”语法不兼容。因此，仅包含“plugins {}”块指令。


**Before**:

**前**：


```kotlin title="<app-src>/android/app/build.gradle(.kts)"
plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    // ...
}

android {
    // ...
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }
    // ...
}

// ...
```

Next, remove the `kotlin-android` plugin and the `kotlinOptions` block:

接下来，删除“kotlin-android”插件和“kotlinOptions”块：


```kotlin diff title="<app-src>/android/app/build.gradle.kts"
  plugins {
      alias(libs.plugins.android.application)
-     alias(libs.plugins.kotlin.android)
      // ...
  }

  android {
      // ...
-     kotlinOptions {
-         jvmTarget = JavaVersion.VERSION_17.toString()
-     }
      // ...
  }
```
Add the `kotlin.compilerOptions{}` DSL block with the following:

添加“kotlin.compilerOptions{}”DSL 块，其中包含以下内容：


```kotlin diff title="<app-src>/android/app/build.gradle.kts"
+ kotlin {
+     compilerOptions {
+         jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
+     }
+ }
```

Here is how the file will likely end up:

该文件可能的最终结果如下：


**After**:

**后**：


```kotlin title="<app-src>/android/app/build.gradle(.kts)"
plugins {
    alias(libs.plugins.android.application)
    // ...
}

android {
    // ...
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// ...
```

### Validate

### 证实


Execute `flutter run` or `flutter build apk` to confirm that
your app builds and launches on a connected Android device or emulator.

执行“flutter run”或“flutter build apk”以确认你的应用程序在连接的 Android 设备或模拟器上构建并启动。


If your app fails to build because you are using an unmigrated Flutter plugin,
follow the instructions below:

如果你的应用因使用未迁移的 Flutter 插件而无法构建，请按照以下说明操作：


### Report incompatible Kotlin Gradle Plugin usage to plugin authors

### 向插件作者报告不兼容的 Kotlin Gradle 插件使用情况


Follow these instructions only if your app uses a Flutter plugin
that has not yet migrated to built-in Kotlin.

仅当你的应用使用尚未迁移到内置 Kotlin 的 Flutter 插件时，才需要遵循这些说明。


1. Find the repository of the unmigrated Flutter plugin by searching for the
plugin name on [pub.dev](https://pub.dev) or online.
2. Refer to the plugin CHANGELOG to confirm that no existing version
has migrated to built-in Kotlin.
3. Report an issue to the plugin authors, informing them that the Kotlin
Gradle Plugin is incompatible and won't be supported in a future version
of Flutter.

1. 通过在 [pub.dev](https://pub.dev) 或在线搜索插件名称，找到未迁移的 Flutter 插件的存储库。 2. 参考插件 CHANGELOG 确认现有版本没有迁移到内置 Kotlin。 3. 向插件作者报告问题，告知他们 Kotlin Gradle 插件不兼容，未来版本的 Flutter 将不再支持。


You can use the following template for the issue:

你可以使用以下模板来解决该问题：


**Issue Title:** Migrate Plugin to Built-in Kotlin

**问题标题：** 将插件迁移到内置 Kotlin


**Issue Body:**
I am using `<plugin-name>` in my Flutter app.

**问题正文：** 我在 Flutter 应用程序中使用 `<plugin-name>`。


Starting with Android Gradle Plugin (AGP) 9.0,
support for applying the Kotlin Gradle Plugin (KGP) has been removed.
Because this plugin applies KGP, it causes a compilation error
that prevents my app from building.
Here is an example of the error [Issue #181383][].

从 Android Gradle Plugin (AGP) 9.0 开始，删除了对应用 Kotlin Gradle Plugin (KGP) 的支持。由于此插件应用 KGP，因此会导致编译错误，从而阻止我的应用程序构建。以下是错误 [问题 #181383][Issue #181383] 的示例。


Flutter has temporarily added support to allow KGP
while apps and plugins migrate to AGP 9.0+,
but this support will be removed in a future version of Flutter.

Flutter 暂时添加了支持，以在应用程序和插件迁移到 AGP 9.0+ 时允许 KGP，但此支持将在 Flutter 的未来版本中删除。


Please migrate this plugin to use built-in Kotlin to ensure your plugin
users can successfully build their apps in future versions of Flutter.

请迁移此插件以使用内置 Kotlin，以确保你的插件用户可以在未来版本的 Flutter 中成功构建他们的应用程序。


Here is the Flutter [migration guide for plugin authors][plugin-migration-guide].

这是 Flutter [插件作者迁移指南][plugin-migration-guide]。


Please be respectful and mindful of the plugin repository's rules and code
of conduct when reporting issues and interacting with plugin authors.

报告问题以及与插件作者互动时，请尊重并注意插件存储库的规则和行为准则。


For reference, see the [Flutter Code of Conduct][Code of Conduct].

如需参考，请参阅Flutter 行为准则。


## Next steps

## 后续步骤


See the [migration overview](./) for next steps.

请参阅[迁移概述](./) 了解后续步骤。


## References

## 参考


Relevant issues:

相关问题：


- [Issue #183910][]: Add Disable Built-in Kotlin and new DSL Migrators

  [问题 #183910][Issue #183910]：添加禁用内置 Kotlin 和新的 DSL 迁移器

- [Issue #181383][]: Flutter plugins should support AGP 9.0.0

  [问题 #181383][Issue #181383]：Flutter 插件应支持 AGP 9.0.0


The Gradle build files in your app vary based on the Flutter version
used when your app was created.
Consider staying up to date with the latest version
of the build files by periodically running `flutter upgrade`
in your app's directory.

应用程序中的 Gradle 构建文件根据创建应用程序时使用的 Flutter 版本而有所不同。考虑通过定期在应用程序目录中运行“flutter Upgrade”来保持最新版本的构建文件。


[AGP block]: {{site.android-dev}}/build/releases/gradle-plugin

[Issue #183910]: {{site.github}}/flutter/flutter/issues/183910
[Issue #181383]: {{site.github}}/flutter/flutter/issues/181383

[plugin-migration-guide]: {{site.flutter-docs}}/release/breaking-changes/migrate-to-built-in-kotlin/for-plugin-authors
[Code of Conduct]: https://github.com/flutter/flutter/blob/master/CODE_OF_CONDUCT.md
