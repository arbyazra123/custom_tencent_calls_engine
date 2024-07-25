import 'package:flutter_test/flutter_test.dart';
import 'package:tencent_calls_engine/platform/tuicall_engine_platform_interface.dart';
import 'package:tencent_calls_engine/platform/tuicall_engine_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:tencent_calls_engine/tencent_calls_engine.dart';

class MockTuicallEnginePlatform
    with MockPlatformInterfaceMixin
    implements TUICallEnginePlatform {

  @override
  Future<TUIResult> accept() {
    // TODO: implement accept
    throw UnimplementedError();
  }

  @override
  Future<void> addObserver(TUICallObserver observer) {
    // TODO: implement addObserver
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> call(String userId, TUICallMediaType mediaType, TUICallParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<void> callExperimentalAPI(Map<String, dynamic> jsonMap) {
    // TODO: implement callExperimentalAPI
    throw UnimplementedError();
  }

  @override
  Future<void> closeCamera() {
    // TODO: implement closeCamera
    throw UnimplementedError();
  }

  @override
  Future<void> closeMicrophone() {
    // TODO: implement closeMicrophone
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRecordCalls(List<String> callIdList, TUIValueCallback callback) {
    // TODO: implement deleteRecordCalls
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> enableMultiDeviceAbility(bool enable) {
    // TODO: implement enableMultiDeviceAbility
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> groupCall(String groupId, List<String> userIdList, TUICallMediaType mediaType, TUICallParams params) {
    // TODO: implement groupCall
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> hangup() {
    // TODO: implement hangup
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> ignore() {
    // TODO: implement ignore
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> init(int sdkAppID, String userId, String userSig) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> iniviteUser(List<String> userIdList, TUICallParams params, TUIValueCallback callback) {
    // TODO: implement iniviteUser
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> joinInGroupCall(TUIRoomId roomId, String groupId, TUICallMediaType mediaType) {
    // TODO: implement joinInGroupCall
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> openCamera(TUICamera camera, int? viewId) {
    // TODO: implement openCamera
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> openMicrophone() {
    // TODO: implement openMicrophone
    throw UnimplementedError();
  }

  @override
  Future<void> queryRecentCalls(TUICallRecentCallsFilter filter, TUIValueCallback callback) {
    // TODO: implement queryRecentCalls
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> reject() {
    // TODO: implement reject
    throw UnimplementedError();
  }

  @override
  Future<void> removeObserver(TUICallObserver observer) {
    // TODO: implement removeObserver
    throw UnimplementedError();
  }

  @override
  Future<void> selectAudioPlaybackDevice(TUIAudioPlaybackDevice device) {
    // TODO: implement selectAudioPlaybackDevice
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> setBeautyLevel(double level) {
    // TODO: implement setBeautyLevel
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> setSelfInfo(String nickname, String avatar) {
    // TODO: implement setSelfInfo
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> setVideoEncoderParams(VideoEncoderParams params) {
    // TODO: implement setVideoEncoderParams
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> setVideoRenderParams(String userId, VideoRenderParams params) {
    // TODO: implement setVideoRenderParams
    throw UnimplementedError();
  }

  @override
  Future<void> startRemoteView(String userId, int? viewId) {
    // TODO: implement startRemoteView
    throw UnimplementedError();
  }

  @override
  Future<void> stopRemoteView(String userId) {
    // TODO: implement stopRemoteView
    throw UnimplementedError();
  }

  @override
  Future<void> switchCallMediaType(TUICallMediaType mediaType) {
    // TODO: implement switchCallMediaType
    throw UnimplementedError();
  }

  @override
  Future<void> switchCamera(TUICamera camera) {
    // TODO: implement switchCamera
    throw UnimplementedError();
  }

  @override
  Future<TUIResult> unInit() {
    // TODO: implement unInit
    throw UnimplementedError();
  }

  @override
  void setBlurBackground(int level, Function(int code, String message)? errorCallback) {
    // TODO: implement setBlurBackground
  }

  @override
  void setVirtualBackground(String imagePath, Function(int code, String message)? errorCallback) {
    // TODO: implement setVirtualBackground
  }
}

void main() {
  final TUICallEnginePlatform initialPlatform = TUICallEnginePlatform.instance;

  test('$MethodChannelTUICallEngine is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTUICallEngine>());
  });
  
}
