---
# title: New APIs for Android plugins that render to a Surface
title: 渲染到 Surface 的 Android 插件的新 API
# description: >-
#   Adds a new API, SurfaceProducer, to the Android embedding API, which
#   opaquely handles the creation and management of a `Surface` for plugins.
#   For Impeller, use of this API is recommended.
description: >-
  将新的 API SurfaceProducer 添加到 Android 嵌入 API，该 API 不透明地处理插件 `Surface` 的创建和管理。对于叶轮，建议使用此 API。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The Android embedder for Flutter introduces a new API, [`SurfaceProducer`][],
which allows plugins to render to a `Surface` without needing to manage what
the backing implementation is. Plugins using the older
[`createSurfaceTexture`][] API will continue to work with [Impeller][] after the
_next_ stable release, but are recommended to migrate to the new API.

Flutter 的 Android 嵌入器引入了一个新的 API，[`SurfaceProducer`][]，它允许插件渲染到 `Surface` ，而不需要管理支持实现是什么。使用较旧的插件[`createSurfaceTexture`][]API 将继续与[Impeller][]在 _next_ 稳定版本之后，但建议迁移到新的 API。


## Background

## 背景


An Android [`SurfaceTexture`][] is a backing implementation for a [`Surface`][]
that uses an [OpenGLES][] texture as the backing store.

Android [`SurfaceTexture`][]是一个支持实现[`Surface`][]使用一个[OpenGLES][]纹理作为后备存储。


For example, a plugin might display frames from a _camera_ plugin:

例如，插件可能会显示来自 _camera_ 插件的帧：


![Flowchart](https://camo.githubusercontent.com/cdb52c5d371b4f1d5573b650a0eddb0871e5e8be1012d290e008f41bc71b2580/68747470733a2f2f736f757263652e616e64726f69642e636f6d2f7374617469632f646f63732f636f72652f67726170686963732f696d616765732f636f6e74696e756f75735f636170747572655f61637469766974792e706e67)

In newer versions of the Android API (>= 29), Android introduced a
backend-agnostic [`HardwareBuffer`][], which coincides with the minimum version
that Flutter will attempt to use the [Vulkan][] renderer. The Android embedding
API needed to be updated to support a more generic `Surface` creation API that
doesn't rely on OpenGLES.

在较新版本的 Android API (>= 29) 中，Android 引入了与后端无关的[`HardwareBuffer`][]，这与 Flutter 将尝试使用的最低版本一致[Vulkan][]渲染器。 Android 嵌入 API 需要更新以支持不依赖于 OpenGLES 的更通用 `Surface` 创建 API。


## Migration guide

## 迁移指南


If you are using the older [`createSurfaceTexture`][] API, you should migrate to
the new [`createSurfaceProducer`][] API. The new API is more flexible and allows
the Flutter engine to opaquely pick the best implementation for the current
platform and API level.

如果你使用的是较旧的[`createSurfaceTexture`][]API，你应该迁移到新的[`createSurfaceProducer`][]API。新的 API 更加灵活，允许 Flutter 引擎不透明地选择当前平台和 API 级别的最佳实现。


1. Instead of creating a `SurfaceTextureEntry`, create a `SurfaceProducer`:

  创建 `SurfaceProducer`，而不是创建 `SurfaceTextureEntry`：


   ```java diff
   - TextureRegistry.SurfaceTextureEntry entry = textureRegistry.createSurfaceTexture();
   + TextureRegistry.SurfaceProducer producer = textureRegistry.createSurfaceProducer();
   ```

1. Instead of creating a `new Surface(...)`, call [`getSurface()`][] on the

  不要创建 `new Surface(...)`，而是调用[`getSurface()`][]于

   `SurfaceProducer`:

`SurfaceProducer`：


   ```java diff
   - Surface surface = new Surface(entry.surfaceTexture());
   + Surface surface = producer.getSurface();
   ```

In order to conserve memory when the application is suspended in the background,
Android and Flutter _may_ destroy a surface when it is no longer visible. To
ensure that the surface is recreated when the application is resumed, you should
use the provided [`setCallback`][] method to listen to surface lifecycle events:

为了在应用程序在后台挂起时节省内存，Android 和 Flutter 可能会在表面不再可见时销毁该表面。为了确保应用程序恢复时重新创建表面，你应该使用提供的[`setCallback`][]监听表面生命周期事件的方法：


```java
surfaceProducer.setCallback(
   new TextureRegistry.SurfaceProducer.Callback() {
      @Override
      public void onSurfaceAvailable() {
         // Do surface initialization here, and draw the current frame.
      }

      @Override
      public void onSurfaceDestroyed() {
         // Do surface cleanup here, and stop drawing frames.
      }
   }
);
```

A full example of using this new API can be found in [PR 6989][] for the
`video_player_android` plugin.

使用这个新 API 的完整示例可以在[PR 6989][]对于 `video_player_android` 插件。


:::note
In early versions of this API, the callback was named `onSurfaceCreated`, and
was invoked even if the original surface was not destroyed. This has been fixed
in the latest (pending 3.27) version of the API.

在此 API 的早期版本中，回调名为 `onSurfaceCreated`，即使原始表面未被破坏也会被调用。该问题已在最新（待定的 3.27）版本的 API 中修复。

:::

## Note on camera previews

## 关于相机预览的注意事项


If your plugin implements a camera preview, your migration might also require
fixing the rotation of that preview. This is because `Surface`s produced by the
`SurfaceProducer` might not contain the transformation information that Android
libraries need to correctly rotate the preview automatically.

如果你的插件实现了相机预览，你的迁移可能还需要修复该预览的旋转。这是因为 `SurfaceProducer` 生成的 `Surface`s 可能不包含 Android 库自动正确旋转预览所需的转换信息。


In order to correct the rotation, you need to rotate the preview with
respect to the camera sensor orientation and the device orientation according
to the equation:

为了校正旋转，你需要根据以下公式相对于相机传感器方向和设备方向旋转预览：


```plaintext
rotation = (sensorOrientationDegrees - deviceOrientationDegrees * sign + 360) % 360
```

where `deviceOrientationDegrees` is counterclockwise degrees and `sign` is 1 for
front-facing cameras and -1 for back-facing cameras.

其中 `deviceOrientationDegrees` 是逆时针角度，`sign` 对于前置摄像头为 1，对于后置摄像头为 -1。


To calculate this rotation,

为了计算这个旋转，


- Use [`SurfaceProducer.handlesCropAndRotation`][] to check if the underlying

  使用[`SurfaceProducer.handlesCropAndRotation`][]检查底层是否

  `Surface` handles rotation (if `false`, you may need to handle the rotation).

`Surface` 处理旋转（如果 `false`，你可能需要处理旋转）。

- Retrieve the sensor orientation degrees by retrieving the value of

  通过检索值来检索传感器方向度

  [`CameraCharacteristics.SENSOR_ORIENTATION`][].
- Retrieve the device orientation degrees in one of the ways that the

  以以下方式之一检索设备方向度

  [Android orientation calculation documentation][] details.

To apply this rotation, you can use a [`RotatedBox`][] widget.

要应用此旋转，你可以使用[`RotatedBox`][]widget。


For more information on this calculation, check out the
[Android orientation calculation documentation][]. For a full example of making
this fix, check out [this `camera_android_camerax` PR][].

有关此计算的更多信息，请查看[Android orientation calculation documentation][]。有关进行此修复的完整示例，请查看[this `camera_android_camerax` PR][].


## Timeline

## 时间线


Landed in version: 3.22
登陆版本：3.22

:::note
This feature landed in the _previous_ version of the SDK but was non-functional;
plugins that migrate to this API should set `3.24` as a minimum version constraint.

此功能已出现在 SDK 的_先前_版本中，但无法正常运行；迁移到此 API 的插件应将 `3.24` 设置为最低版本约束。

:::

In stable release: 3.24
稳定版本：3.24

In the upcoming stable release, 3.27, `onSurfaceCreated` is deprecated, and
`onSurfaceAvailable` and `handlesCropAndRotation` are added.

在即将发布的稳定版本 3.27 中，不推荐使用 `onSurfaceCreated`，并添加 `onSurfaceAvailable` 和 `handlesCropAndRotation`。


## References

## 参考资料


API documentation:

API 文档：


- [`SurfaceProducer`][]
- [`createSurfaceProducer`][]
- [`createSurfaceTexture`][]

Relevant issues:

相关 issue：


- [Issue 139702][]

  [问题 139702][Issue 139702]

- [Issue 145930][]

  [问题 145930][Issue 145930]


Relevant PRs:

相关 PR：


- [PR 51061][], where we test the new API in the engine tests.

  [PR 51061][]，我们在引擎测试中测试新的 API。

- [PR 6456][], where we migrate the `video_player` plugin to use the new API.

  [PR 6456][]，我们迁移 `video_player` 插件以使用新的 API。

- [PR 6461][], where we migrate the `camera_android` plugin to use the new API.

  [PR 6461][]，我们在其中迁移 `camera_android` 插件以使用新的 API。

- [PR 6989][], where we add a full example of using the new API in the `video_player_android` plugin.

  [PR 6989][]，我们在 `video_player_android` 插件中添加了使用新 API 的完整示例。


[Impeller]: /perf/impeller
[OpenGLES]: https://www.khronos.org/opengles/
[Vulkan]: https://source.android.com/docs/core/graphics/arch-vulkan
[`HardwareBuffer`]: https://developer.android.com/reference/android/hardware/HardwareBuffer
[`Surface`]: https://developer.android.com/reference/android/view/Surface
[`SurfaceProducer`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.SurfaceProducer.html
[`SurfaceProducer.handlesCropAndRotation`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.SurfaceProducer.html#handlesCropAndRotation()
[`SurfaceTexture`]: https://source.android.com/docs/core/graphics/arch-st
[`createSurfaceProducer`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.html#createSurfaceProducer()
[`createSurfaceTexture`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.html#createSurfaceTexture()
[`getSurface()`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.SurfaceProducer.html#getSurface()
[`setCallback`]: {{site.api}}/javadoc/io/flutter/view/TextureRegistry.SurfaceProducer.html#setCallback(io.flutter.view.TextureRegistry.SurfaceProducer.Callback)
[`CameraCharacteristics.SENSOR_ORIENTATION`]: {{site.android-dev}}/reference/android/hardware/camera2/CameraCharacteristics#SENSOR_ORIENTATION
[`RotatedBox`]: {{site.api}}/flutter/widgets/RotatedBox-class.html
[Android orientation calculation documentation]: {{site.android-dev}}/media/camera/camera2/camera-preview#orientation_calculation
[this `camera_android_camerax` PR]: {{site.repo.packages}}/pull/7044
[Issue 139702]: {{site.repo.flutter}}/issues/139702
[Issue 145930]: {{site.repo.flutter}}/issues/145930
[PR 51061]: {{site.repo.engine}}/pull/51061
[PR 6456]: {{site.repo.packages}}/pull/6456
[PR 6461]: {{site.repo.packages}}/pull/6461
[PR 6989]: {{site.repo.packages}}/pull/6989
