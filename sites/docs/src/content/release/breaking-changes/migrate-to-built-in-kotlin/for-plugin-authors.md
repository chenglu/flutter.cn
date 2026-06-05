---
# title: Built-in Kotlin migration for plugin authors
title: 为插件作者提供内置 Kotlin 迁移
# description: >-
#   Migrate Flutter plugins to use built-in Kotlin.
description: >
  迁移 Flutter 插件以使用内置 Kotlin。
ai-translated: true
---

## Migrate your Flutter plugin

## 迁移你的 Flutter 插件


This guide outlines the migration steps specifically for plugin authors.

本指南专门为插件作者概述了迁移步骤。


### Update the Gradle file

### 更新 Gradle 文件


The following steps assume you can update your plugin's Flutter SDK minimum
to 3.44. If you cannot update the Flutter SDK minimum to 3.44, follow the
instructions for
[supporting Flutter versions earlier than 3.44][flutter-sdk-minimum-below-3.44].

以下步骤假设你可以将插件的 Flutter SDK 最低更新至 3.44。如果你无法将 Flutter SDK 最低版本更新至 3.44，请按照[支持 3.44 之前的 Flutter 版本][flutter-sdk-minimum-below-3.44] 的说明进行操作。


First, find the `kotlin-android` plugin (or the `org.jetbrains.kotlin.android`
plugin).
It is likely located in the `plugins` block of the
`<plugin-project>/build.gradle` or the `<plugin-project>/build.gradle.kts` file.
If you use the legacy `apply` syntax, it will be located in
the Groovy-based `<plugin-project>/build.gradle` file, as this syntax is
not supported in Kotlin DSL.

首先，找到“kotlin-android”插件（或“org.jetbrains.kotlin.android”插件）。它可能位于“<plugin-project>/build.gradle”或“<plugin-project>/build.gradle.kts”文件的“plugins”块中。如果你使用旧的“apply”语法，它将位于基于 Groovy 的“<plugin-project>/build.gradle”文件中，因为 Kotlin DSL 不支持此语法。


The following examples demonstrate how to migrate a Flutter plugin:

以下示例演示了如何迁移 Flutter 插件：


<Tabs key="modern-legacy-apply">
<Tab name="plugins block">

**Before**:

**前**：


```kotlin title="<app-src>/android/build.gradle(.kts)"
plugins {
    id(`com.android.library`)
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


```kotlin diff title="<app-src>/android/build.gradle.kts"
  plugins {
      id(`com.android.library`)
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


```kotlin diff title="<app-src>/android/build.gradle.kts"
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


```kotlin title="<app-src>/android/build.gradle(.kts)"
plugins {
    id(`com.android.library`)
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


```groovy title="<app-src>/android/build.gradle"
apply plugin: 'com.android.library'
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


```groovy diff title="<app-src>/android/build.gradle"
  apply plugin: 'com.android.library'
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


```groovy diff title="<app-src>/android/build.gradle"
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


```groovy title="<app-src>/android/build.gradle"
apply plugin: 'com.android.library'
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

### Update the plugin's `pubspec.yaml`

### 更新插件的“pubspec.yaml”


Using the `kotlin.compilerOptions {}` DSL block requires
a minimum Kotlin Gradle Plugin (KGP) version of 2.0.0.
Beginning with Flutter 3.44, the minimum required KGP version is 2.0.0.
To ensure that apps using your plugin can safely migrate to built-in Kotlin,
you should require a minimum Flutter version of 3.44 for this plugin version.

使用 `kotlin.compilerOptions {}` DSL 块需要最低 Kotlin Gradle 插件 (KGP) 版本 2.0.0。从 Flutter 3.44 开始，所需的最低 KGP 版本为 2.0.0。为了确保使用你的插件的应用程序可以安全地迁移到内置 Kotlin，你应该要求该插件版本的 Flutter 版本最低为 3.44。


Since you are updating the minimum Flutter version,
you must also update the minimum associated Dart version.

由于你要更新 Flutter 的最低版本，因此还必须更新关联的最低 Dart 版本。


Update the minimum Flutter version and the minimum Dart version:

更新最低 Flutter 版本和最低 Dart 版本：


```yaml diff title="<plugin-project>/pubspec.yaml"
# ...

  environment:
-   sdk: ^<previous-dart-minimum>
+   sdk: ^3.12.0
-   flutter: ">=<previous-flutter-minimum>"
+   flutter: ">=3.44.0"

# ...
```

Here is how the file will likely end up:

该文件可能的最终结果如下：


```yaml title="<plugin-project>/pubspec.yaml"
# ...

environment:
  sdk: ^3.12.0
  flutter: ">=3.44.0"

# ...
```

## Supporting Flutter versions earlier than 3.44

## 支持 3.44 之前的 Flutter 版本


If you updated your plugin's Flutter SDK minimum to 3.44, skip this section
and proceed to updating the plugin's `CHANGELOG.md`.

如果你将插件的 Flutter SDK 最低版本更新至 3.44，请跳过本节并继续更新插件的“CHANGELOG.md”。


If you cannot update the plugin's Flutter SDK minimum to 3.44, you must make
the following changes to `<plugin-project>/android/build.gradle` or
`<plugin-project>/android/build.gradle.kts` to support apps on AGP < 9
and AGP >= 9:

如果你无法将插件的 Flutter SDK 最低版本更新至 3.44，则必须对 `<plugin-project>/android/build.gradle` 或 `<plugin-project>/android/build.gradle.kts` 进行以下更改，以支持 AGP < 9 和 AGP >= 9 上的应用：


<Tabs key="workaround-for-plugins">
<Tab name="Kotlin DSL fix">

**Before**:

**前**：


```kotlin title="<app-src>/android/build.gradle.kts"
plugins {
    id(`com.android.library`)
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


```kotlin diff title="<app-src>/android/build.gradle.kts"
  plugins {
      id(`com.android.library`)
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

Add a check to apply the Kotlin Gradle Plugin only when the app's Android
Gradle Plugin version is earlier than 9.

添加检查以仅当应用的 Android Gradle 插件版本早于 9 时才应用 Kotlin Gradle 插件。


```kotlin diff title="<app-src>/android/build.gradle.kts"
+ val agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.substringBefore('.').toInt()
+
+ if (agpMajor < 9) {
+    apply(plugin = `org.jetbrains.kotlin.android`)
+ }
```

Add the `compilerOptions` configuration using the project extension:

使用项目扩展添加 `compilerOptions` 配置：


```kotlin diff title="<app-src>/android/build.gradle.kts"
+ project.extensions.configure(org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension::class.java) {
+     compilerOptions {
+         jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
+     }
+ }
```

Here is how the file will likely end up:

该文件可能的最终结果如下：


**After**:

**后**：


```kotlin title="<app-src>/android/build.gradle.kts"
plugins {
    id(`com.android.library`)
    // ...
}

val agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.substringBefore('.').toInt()

if (agpMajor < 9) {
    apply(plugin = `org.jetbrains.kotlin.android`)
}

android {
    // ...
}

project.extensions.configure(org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension::class.java) {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// ...
```

</Tab>
<Tab name="Groovy DSL fix">

**Before**:

**前**：


```groovy title="<app-src>/android/build.gradle"
apply plugin: 'com.android.library'
apply plugin: 'kotlin-android'

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


```groovy diff title="<app-src>/android/build.gradle"
  apply plugin: 'com.android.library'
- apply plugin: 'kotlin-android'

  android {
      // ...
-     kotlinOptions {
-         jvmTarget = JavaVersion.VERSION_17.toString()
-     }
      // ...
  }
```

Add a check to apply the Kotlin Gradle Plugin only when the app's Android
Gradle Plugin version is earlier than 9.

添加检查以仅当应用的 Android Gradle 插件版本早于 9 时才应用 Kotlin Gradle 插件。


```groovy diff title="<app-src>/android/build.gradle"
+ def agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.tokenize('.')[0] as int
+
+ if (agpMajor < 9) {
+    apply plugin: 'kotlin-android'
+ }
```

Add the `kotlin.compilerOptions{}` DSL block with the following:

添加“kotlin.compilerOptions{}”DSL 块，其中包含以下内容：


```groovy diff title="<app-src>/android/build.gradle"
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


```groovy title="<app-src>/android/build.gradle"
apply plugin: 'com.android.library'

def agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.tokenize('.')[0] as int
if (agpMajor < 9) {
    apply plugin: 'kotlin-android'
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
</Tabs>

### Update the plugin's `CHANGELOG.md`

### 更新插件的“CHANGELOG.md”


Include your changes in the CHANGELOG of the newly released plugin version:

将你的更改包含在新发布的插件版本的变更日志中：


```markdown diff title="<plugin-project>/CHANGELOG.md"
+ ## <new-plugin-release-version>

+ - Updates minimum supported SDK version to Flutter 3.44/Dart 3.12.
+ - Migrates to built-in Kotlin

// ...
```

### Validate

### 证实


Execute `flutter run` or `flutter build apk` to confirm that
your plugin example app builds and launches
on a connected Android device or emulator.

执行“flutter run”或“flutter build apk”以确认你的插件示例应用程序在连接的 Android 设备或模拟器上构建并启动。


If your plugin example app also applies KGP,
then you will also have to migrate the example app.
Follow the [migration guide for app developers][app-migration-guide] to migrate your example app.

如果你的插件示例应用程序也应用 KGP，那么你还必须迁移示例应用程序。请按照[应用程序开发人员迁移指南][app-migration-guide] 迁移你的示例应用程序。


[app-migration-guide]: {{site.flutter-docs}}/release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers
[flutter-sdk-minimum-below-3.44]: {{site.flutter-docs}}/release/breaking-changes/migrate-to-built-in-kotlin/for-plugin-authors#supporting-flutter-versions-earlier-than-3-44
