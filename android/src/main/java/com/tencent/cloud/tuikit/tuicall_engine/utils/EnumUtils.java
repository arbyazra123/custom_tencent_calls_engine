package com.tencent.cloud.tuikit.tuicall_engine.utils;

import com.tencent.qcloud.tuikit.TUICommonDefine;
import com.tencent.qcloud.tuikit.tuicallengine.TUICallDefine;

public class EnumUtils {

    public static TUICallDefine.MediaType getMediaType(int index) {
        switch (index) {
            case 0:
                return TUICallDefine.MediaType.Unknown;
            case 1:
                return TUICallDefine.MediaType.Audio;
            case 2:
                return TUICallDefine.MediaType.Video;
            default:
                break;
        }
        return TUICallDefine.MediaType.Unknown;
    }

    public static TUICommonDefine.VideoEncoderParams.Resolution getResolutionType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_640_360;
            case 1:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_640_480;
            case 2:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_960_540;
            case 3:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_960_720;
            case 4:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_1280_720;
            case 5:
                return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_1920_1080;
            default:
                break;
        }
        return TUICommonDefine.VideoEncoderParams.Resolution.Resolution_640_360;
    }

    public static TUICommonDefine.VideoEncoderParams.ResolutionMode getResolutionModeType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.VideoEncoderParams.ResolutionMode.Landscape;
            case 1:
                return TUICommonDefine.VideoEncoderParams.ResolutionMode.Portrait;
            default:
                break;
        }
        return TUICommonDefine.VideoEncoderParams.ResolutionMode.Portrait;
    }

    public static TUICommonDefine.VideoRenderParams.FillMode getFillModeType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.VideoRenderParams.FillMode.Fill;
            case 1:
                return TUICommonDefine.VideoRenderParams.FillMode.Fit;
            default:
                break;
        }
        return TUICommonDefine.VideoRenderParams.FillMode.Fill;
    }

    public static TUICommonDefine.VideoRenderParams.Rotation getRotationType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.VideoRenderParams.Rotation.Rotation_0;
            case 1:
                return TUICommonDefine.VideoRenderParams.Rotation.Rotation_90;
            case 2:
                return TUICommonDefine.VideoRenderParams.Rotation.Rotation_180;
            case 3:
                return TUICommonDefine.VideoRenderParams.Rotation.Rotation_270;
            default:
                break;
        }
        return TUICommonDefine.VideoRenderParams.Rotation.Rotation_0;
    }

    public static TUICallDefine.IOSOfflinePushType getIOSOfflinePushType(int index) {
        switch (index) {
            case 0:
                return TUICallDefine.IOSOfflinePushType.APNs;
            case 1:
                return TUICallDefine.IOSOfflinePushType.VoIP;
            default:
                break;
        }
        return TUICallDefine.IOSOfflinePushType.APNs;
    }

    public static TUICommonDefine.Camera getCameraType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.Camera.Front;
            case 1:
                return TUICommonDefine.Camera.Back;
            default:
                break;
        }
        return TUICommonDefine.Camera.Front;
    }

    public static TUICommonDefine.AudioPlaybackDevice getAudioPlaybackDeviceType(int index) {
        switch (index) {
            case 0:
                return TUICommonDefine.AudioPlaybackDevice.Speakerphone;
            case 1:
                return TUICommonDefine.AudioPlaybackDevice.Earpiece;
            default:
                break;
        }
        return TUICommonDefine.AudioPlaybackDevice.Earpiece;
    }

    public static TUICallDefine.CallRecords.Result getCallRecordsResultType(int index) {
        switch (index) {
            case 0:
                return TUICallDefine.CallRecords.Result.Unknown;
            case 1:
                return TUICallDefine.CallRecords.Result.Missed;
            case 2:
                return TUICallDefine.CallRecords.Result.Incoming;
            case 3:
                return TUICallDefine.CallRecords.Result.Outgoing;
            default:
                break;
        }
        return TUICallDefine.CallRecords.Result.Unknown;
    }
}
