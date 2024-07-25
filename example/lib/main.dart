import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tencent_calls_engine/tencent_calls_engine.dart';

import 'generate_test_user_sig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _viewID = 0;
  int _remoteViewID = 0;

  bool _openLocal = false;
  bool _openRemote = false;
  final _engine = TUICallEngine.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SizedBox(
        child: ListView(
          padding: const EdgeInsets.all(40), //Line in the direction of the main axis
          children: <Widget>[
            Container(
                height: (_openLocal || _openRemote) ? 200.0 : 0,
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 200,
                      child: TUIVideoView(
                        onPlatformViewCreated: (viewId) {
                          _viewID = viewId;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 200,
                      child: TUIVideoView(
                        onPlatformViewCreated: (viewId) {
                          _remoteViewID = viewId;
                        },
                      ),
                    )
                  ],
                )),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("init"),
                onPressed: () async {
                  final result = await _engine.init(
                      GenerateTestUserSig.sdkAppId,
                      '8558',
                      GenerateTestUserSig.genTestSig('8558'));
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("openCamera"),
                  onPressed: () async {
                    final result =
                        await _engine.openCamera(TUICamera.front, _viewID);
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                    setState(() {
                      _openLocal = true;
                    });
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("closeCamera"),
                  onPressed: () {
                    _engine.closeCamera();
                    setState(() {
                      _openLocal = false;
                    });
                  },
                )),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("setVideoEncoderParams"),
                onPressed: () async {
                  final params = VideoEncoderParams(
                      resolution: Resolution.resolution_640_480,
                      resolutionMode: ResolutionMode.portrait);
                  final result = await _engine.setVideoEncoderParams(params);
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("setVideoRenderParams"),
                onPressed: () async {
                  final params = VideoRenderParams(
                      fillMode: FillMode.fit, rotation: Rotation.rotation_90);
                  final result =
                      await _engine.setVideoRenderParams('8558', params);
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("hangup"),
                onPressed: () async {
                  final result = await _engine.hangup();
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("call"),
                onPressed: () async {
                  TUICallParams params = TUICallParams();
                  params.roomId = TUIRoomId.intRoomId(intRoomId: 12234);
                  final result =
                      await _engine.call("111", TUICallMediaType.video, params);
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("groupCall"),
                onPressed: () async {
                  final result = await _engine.groupCall('@TGS#1IYQ4JNML',
                      ['910635538'], TUICallMediaType.video, TUICallParams());
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("accept"),
                onPressed: () async {
                  final result = await _engine.accept();
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("reject"),
                onPressed: () async {
                  final result = await _engine.reject();
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("ignore"),
                onPressed: () async {
                  final result = await _engine.ignore();
                  Fluttertoast.showToast(
                      msg: "${result.code}: ${result.message}");
                },
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                child: const Text("iniviteUser"),
                onPressed: () async {
                  await _engine.iniviteUser(
                      [
                        '1234',
                        '8387',
                      ],
                      TUICallParams(),
                      TUIValueCallback(onSuccess: (userIds) {
                        Fluttertoast.showToast(msg: "onSuccess: $userIds");
                      }, onError: (code, message) {
                        Fluttertoast.showToast(
                            msg: "onError: $code , $message");
                      }));
                },
              ),
            ),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("joinInGroupCall"),
                  onPressed: () async {
                    final roomId = TUIRoomId.intRoomId(intRoomId: 12234);
                    final result = await _engine.joinInGroupCall(
                        roomId, '@TGS#1IYQ4JNML', TUICallMediaType.video);
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("switchCallMediaType"),
                  onPressed: () async {
                    await _engine.switchCallMediaType(TUICallMediaType.audio);
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("startRemoteView"),
                  onPressed: () async {
                    await _engine.startRemoteView('910635538', _remoteViewID);
                    setState(() {
                      _openRemote = true;
                    });
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("stopRemoteView"),
                  onPressed: () async {
                    await _engine.stopRemoteView('910635538');
                    setState(() {
                      _openRemote = false;
                    });
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("switchCamera"),
                  onPressed: () async {
                    await _engine.switchCamera(TUICamera.back);
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("openMicrophone"),
                  onPressed: () async {
                    final result = await _engine.openMicrophone();
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("closeMicrophone"),
                  onPressed: () async {
                    await _engine.closeMicrophone();
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("selectAudioPlaybackDevice"),
                  onPressed: () async {
                    await _engine.selectAudioPlaybackDevice(
                        TUIAudioPlaybackDevice.speakerphone);
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("setSelfInfo"),
                  onPressed: () async {
                    final result = await _engine.setSelfInfo('qwwe', '');
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("enableMultiDeviceAbility"),
                  onPressed: () async {
                    final result =
                        await _engine.enableMultiDeviceAbility(false);
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("queryRecentCalls"),
                  onPressed: () async {
                    await _engine.queryRecentCalls(
                        TUICallRecentCallsFilter(),
                        TUIValueCallback(onSuccess: (recods) {
                          Fluttertoast.showToast(msg: "onSuccess: $recods");
                        }, onError: (code, message) {
                          Fluttertoast.showToast(
                              msg: "onError: $code , $message");
                        }));
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("deleteRecordCalls"),
                  onPressed: () async {
                    await _engine.deleteRecordCalls(
                        ['910635538'],
                        TUIValueCallback(onSuccess: (callIds) {
                          Fluttertoast.showToast(msg: "onSuccess: $callIds");
                        }, onError: (code, message) {
                          Fluttertoast.showToast(
                              msg: "onError: $code , $message");
                        }));
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("setBeautyLevel"),
                  onPressed: () async {
                    final result = await _engine.setBeautyLevel(10);
                    Fluttertoast.showToast(
                        msg: "${result.code}: ${result.message}");
                  },
                )),
            Container(
                height: 50.0,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  child: const Text("callExperimentalAPI"),
                  onPressed: () async {
                    final jsonMap = {'': {}};
                    await _engine.callExperimentalAPI(jsonMap);
                  },
                )),
          ],
        ),
      ),
    ));
  }
}
