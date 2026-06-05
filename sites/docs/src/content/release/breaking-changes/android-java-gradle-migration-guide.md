---
# title: Android Java Gradle migration guide
title: Android Java Gradle 迁移指南
# description: >
#   How to migrate your Android app if you experience
#   a run or build error from Gradle.
description: >-
  如果你在 Gradle 中遇到运行或构建错误，如何迁移 Android 应用程序。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


If you've recently upgraded Android Studio to the Flamingo
release and have either run or built an existing Android app,
you might have run into an error similar to the following:

如果你最近将 Android Studio 升级到 Flamingo 版本，并且运行或构建了现有的 Android 应用程序，则可能会遇到类似于以下内容的错误：


```sh
Caused by: org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
```

The terminal output for this error is
similar to the following:

此错误的终端输出类似于以下内容：



```sh
FAILURE: Build failed with an exception.

* Where:
Build file '…/example/android/build.gradle'
* What went wrong:
Could not compile build file '…/example/android/build.gradle'.
> startup failed:
  General error during conversion: Unsupported class file major version 61

  java.lang.IllegalArgumentException: Unsupported class file major version 61
  	at groovyjarjarasm.asm.ClassReader.<init>(ClassReader.java:189)
  	at groovyjarjarasm.asm.ClassReader.<init>(ClassReader.java:170)
  	[…
  	 …
  	 … 209 more lines of Groovy and Gradle stack trace …
  	 …
  	 …]
  	at java.base/java.lang.Thread.run(Thread.java:833)
```

This error occurs because Android Studio Flamingo
updates its bundled Java SDK from 11 to 17.
Flutter uses the version of Java bundled with
Android Studio to build Android apps.
Gradle versions [prior to 7.3][] can't run
when using Java 17.

出现此错误的原因是 Android Studio Flamingo 将其捆绑的 Java SDK 从 11 更新为 17。 Flutter 使用与 Android Studio 捆绑的 Java 版本来构建 Android 应用程序。 Gradle 版本[prior to 7.3][]使用 Java 17 时无法运行。


**You can fix this error by upgrading your Gradle project
to a compatible version (7.3 through 7.6.1, inclusive)
using one of the following approaches.**

**你可以使用以下方法之一将 Gradle 项目升级到兼容版本（7.3 到 7.6.1，含）来修复此错误。**


[prior to 7.3]: https://docs.gradle.org/current/userguide/compatibility.html#java

## Solution #1: Guided fix using Android Studio

## 解决方案 #1：使用 Android Studio 进行引导修复


Upgrade the Gradle version in Android Studio Flamingo
as follows:

升级 Android Studio Flamingo 中的 Gradle 版本如下：


1. In Android Studio, open the `android` folder.

  在 Android Studio 中，打开 `android` 文件夹。

   This should bring up the following dialog:

这应该会弹出以下对话框：


   ![Dialog prompting you to upgrade Gradle](/assets/images/docs/releaseguide/android-studio-flamingo-upgrade-alert.png){:width="50%"}

   Update to a Gradle release between 7.3 through 7.6.1, inclusive.

更新到 7.3 到 7.6.1（含）之间的 Gradle 版本。


1. Follow the guided workflow to update Gradle.

  按照指导工作流程更新 Gradle。


   ![Workflow to upgrade Gradle](/assets/images/docs/releaseguide/android-studio-flamingo-gradle-upgrade.png){:width="85%"}

## Solution #2: Manual fix at the command line

## 解决方案#2：在命令行手动修复


Do the following from the top of your Flutter project.

从 Flutter 项目的顶部执行以下操作。


1. Go to the Android directory for your project.

  转到项目的 Android 目录。


   ```console
   $ cd android
   ```

1. Update Gradle to the preferred version. Choose between 7.3 through 7.6.1, inclusive.

  将 Gradle 更新到首选版本。在 7.3 到 7.6.1（含）之间进行选择。


   ```console
   $ ./gradlew wrapper --gradle-version=7.6.1
   ```

## You didn't update Android Studio and still have a Java error

## 你没有更新 Android Studio，但仍然出现 Java 错误

The error appears similar to `Unsupported class file major version 65`.
This is an indication that your Java version is newer than the version of
Gradle you are running can handle. There is a non-obvious set of dependencies
surrounding AGP, Java, and Gradle.

The error appears similar to `Unsupported class file major version 65`.这表明你的 Java 版本比你正在运行的 Gradle 可以处理的版本新。 AGP、Java 和 Gradle 存在一组不明显的依赖关系。


### Solution 1: Android Studio

### 解决方案1：Android Studio

The easiest way to resolve this issue is to use Android Studio AGP upgrade assistant.
To use select your top-level `build.gradle` file in Android Studio then select
Tools -> AGP Upgrade Assistant.

解决这个 issue 最简单的方法是使用 Android Studio AGP 升级助手。要使用，请在 Android Studio 中选择顶级 `build.gradle` 文件，然后选择“工具”->“AGP 升级助手”。


### Solution 2: Command line

### 解决方案 2：命令行

Run `flutter analyze --suggestions` to see if your AGP, Java, and Gradle versions are compatible.
If Gradle needs to be updated you can update it with `./gradlew wrapper --gradle-version=SOMEGRADLEVERSION`
where SOMEGRADLEVERSION is the version (you can use a newer version)
suggested by `flutter analyze`.

Run `flutter analyze --suggestions` to see if your AGP, Java, and Gradle versions are compatible.如果 Gradle 需要更新，你可以使用 `./gradlew wrapper --gradle-version=SOMEGRADLEVERSION` 进行更新，其中 SOMEGRADLEVERSION 是 `flutter analyze` 建议的版本（你可以使用较新的版本）。


To find the Java version being used run `flutter doctor`.
On a mac, you can find the Java versions that the OS knows about with `/usr/libexec/java_home -V`.
To set the version of Java that all flutter projects use run `flutter config --jdk-dir=SOMEJAVAPATH`
where SOMEJAVAPATH is a path to a Java version like `/opt/homebrew/Cellar/openjdk@17/17.0.13/libexec/openjdk.jdk/Contents/Home`

要查找正在使用的 Java 版本，请运行 `flutter doctor`。在 Mac 上，你可以通过 `/usr/libexec/java_home -V` 找到操作系统识别的 Java 版本。要设置所有 flutter 项目使用的 Java 版本，请运行 `flutter config --jdk-dir=SOMEJAVAPATH` ，其中 SOMEJAVAPATH 是 Java 版本的路径，例如 `/opt/homebrew/Cellar/openjdk@17/17.0.13/libexec/openjdk.jdk/Contents/Home`


## Notes

## Notes


A few notes to be aware of:

需要注意的一些注意事项：


* Repeat this step for each affected Android app.

  对每个受影响的 Android 应用程序重复此步骤。

* This issue can be experienced by those who

  issue 可以由以下人员体验：

  _don't_ download Java and the Android SDK through
  Android studio.
  If you've manually upgraded your Java SDK to
  version 17 but haven't upgraded Gradle, you can
  also encounter this issue. The fix is the same:
  upgrade Gradle to a release between 7.3 and 7.6.1.

_不要_通过 Android 工作室下载 Java 和 Android SDK。如果你已手动将 Java SDK 升级到版本 17 但尚未升级 Gradle，你也可能会遇到此 issue。修复方法相同：将 Gradle 升级到 7.3 和 7.6.1 之间的版本。

* Your development machine _might_ contain more

  你的开发机器_可能_包含更多

  than one copy of the Java SDK:

比 Java SDK 的一份副本：

  * The Android Studio app includes a version of Java,

    Android Studio 应用程序包含一个 Java 版本，

    which Flutter uses by default.

Flutter 默认使用。

  * If you don't have Android Studio installed,

    如果你没有安装 Android Studio，

    Flutter relies on the version defined by your
    shell script's `JAVA_HOME` environment variable.

Flutter 依赖于 shell 脚本的 `JAVA_HOME` 环境变量定义的版本。

  * If `JAVA_HOME` isn't defined, Flutter looks

    如果未定义 `JAVA_HOME` ，则 Flutter 看起来

    for any `java` executable in your path.
    The `flutter doctor -v` command reports which version
    of Java is used.

对于路径中的任何 `java` 可执行文件。 `flutter doctor -v` 命令报告使用的 Java 版本。

* If you upgrade Gradle to a release _newer_ than 7.6.1,

  如果你将 Gradle 升级到比 7.6.1 更新的版本，

  you might (though it's unlikely) encounter issues
  that result from changes to Gradle, such as
  [deprecated Gradle classes][], or changes to the
  Android file structure.
  If this occurs, downgrade to a release of Gradle
  between 7.3 and 7.6.1, inclusive.

你可能（尽管不太可能）遇到因 Gradle 更改而导致的 issues，例如[deprecated Gradle classes][], or changes to the Android file structure.如果发生这种情况，请降级到 Gradle 7.3 和 7.6.1 之间的版本（含）。

* Upgrading to Flutter 3.10 won't fix this issue.

  升级到 Flutter 3.10 不会修复此 issue。


[deprecated Gradle classes]: https://docs.gradle.org/7.6/javadoc/deprecated-list.html
[issue 122609]: {{site.repo.flutter}}/issues/122609
