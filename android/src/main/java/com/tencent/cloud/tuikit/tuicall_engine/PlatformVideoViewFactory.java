package com.tencent.cloud.tuikit.tuicall_engine;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.tencent.cloud.tuikit.tuicall_engine.utils.Logger;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class PlatformVideoViewFactory extends PlatformViewFactory {
    private static final String TAG  = "PlatformVideoViewFactory";
    public static final  String SIGN = "TUICallEnginVideoView";

    private final BinaryMessenger                 mMessenger;
    public static Map<Integer, PlatformVideoView> mVideoViewMap;

    PlatformVideoViewFactory(
            BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.mMessenger = messenger;
        mVideoViewMap = new HashMap<>();
    }


    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        Logger.info(TAG, "create: viewId = " + viewId);
        PlatformView platformVideoView = mVideoViewMap.get(viewId);
        if (platformVideoView == null) {
            platformVideoView = new PlatformVideoView(context, viewId, mMessenger);
            mVideoViewMap.put(viewId, (PlatformVideoView) platformVideoView);
        }
        return platformVideoView;
    }
}
