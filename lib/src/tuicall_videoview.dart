import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class TUIVideoView extends StatefulWidget {
  ///
  /// This event is triggered when a platform view is created.
  ///
  final PlatformViewCreatedCallback? onPlatformViewCreated;

  ///
  /// The Gesture object.
  ///
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  /// Constructs the [TUIVideoView].
  const TUIVideoView({
    Key? key,
    this.onPlatformViewCreated,
    this.gestureRecognizers,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TUIVideoViewState();
  }
}

class TUIVideoViewState extends State<TUIVideoView> {
  int? _id;
  MethodChannel? _channel;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Text('Web is not yet supported by the plugin');
    }
    const viewType = 'TUICallEnginVideoView';
    final creationParams = {};

    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      if (_id != null) {
        return Texture(textureId: _id!);
      }
      return Container();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: UiKitView(
          viewType: viewType,
          onPlatformViewCreated: _onPlatformViewCreated,
          hitTestBehavior: PlatformViewHitTestBehavior.transparent,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          gestureRecognizers: widget.gestureRecognizers,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: AndroidView(
          viewType: viewType,
          onPlatformViewCreated: _onPlatformViewCreated,
          hitTestBehavior: PlatformViewHitTestBehavior.transparent,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          gestureRecognizers: widget.gestureRecognizers,
        ),
      );
    } else {
      return Text('$defaultTargetPlatform is not yet supported by the plugin');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(TUIVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _channel?.invokeMethod("destroyVideoView", {});
  }

  Future<void> _onPlatformViewCreated(int id) async {
    _id = id;
    _channel = MethodChannel('tuicall_engine/video_view_$id');
    widget.onPlatformViewCreated?.call(id);
  }
}
