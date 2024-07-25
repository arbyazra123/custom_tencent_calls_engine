package com.tencent.cloud.tuikit.tuicall_engine.utils;

import com.tencent.qcloud.tuikit.TUICommonDefine;
import com.tencent.qcloud.tuikit.tuicallengine.TUICallDefine;

import java.util.HashMap;
import java.util.Map;

public class ObjectUtils {

    public static TUICallDefine.CallParams getTUICallParamsByMap(Map map) {
        if (map == null || map.size() <= 0) {
            return null;
        }
        TUICallDefine.CallParams params = new TUICallDefine.CallParams();
        if (map.get("offlinePushInfo") != null) {
            params.offlinePushInfo = getTUIOfflinePushInfoByMap((Map) map.get("offlinePushInfo"));
        }
        if (map.get("timeout") != null) {
            params.timeout = (int) map.get("timeout");
        }
        if (map.get("userData") != null) {
            params.userData = (String) map.get("userData");
        }
        if (map.get("roomId") != null) {
            Map roomIdMap = (Map) map.get("roomId");
            params.roomId = getRoomIdByMap(roomIdMap);
        }
        return params;
    }

    public static TUICallDefine.OfflinePushInfo getTUIOfflinePushInfoByMap(Map map) {
        if (map == null || map.size() <= 0) {
            return null;
        }
        TUICallDefine.OfflinePushInfo offlinePushInfo = new TUICallDefine.OfflinePushInfo();
        if (map.get("title") != null) {
            offlinePushInfo.setTitle((String) map.get("title"));
        }
        if (map.get("desc") != null) {
            offlinePushInfo.setDesc((String) map.get("desc"));
        }
        if (map.get("ignoreIOSBadge") != null) {
            offlinePushInfo.setIgnoreIOSBadge((boolean) map.get("ignoreIOSBadge"));
        }
        if (map.get("iOSSound") != null) {
            offlinePushInfo.setIOSSound((String) map.get("iOSSound"));
        }
        if (map.get("androidSound") != null) {
            offlinePushInfo.setAndroidSound((String) map.get("androidSound"));
        }
        if (map.get("androidOPPOChannelID") != null) {
            offlinePushInfo.setAndroidOPPOChannelID((String) map.get("androidOPPOChannelID"));
        }
        if (map.get("androidVIVOClassification") != null) {
            offlinePushInfo.setAndroidVIVOClassification((int) map.get("androidVIVOClassification"));
        }
        if (map.get("androidXiaoMiChannelID") != null) {
            offlinePushInfo.setAndroidXiaoMiChannelID((String) map.get("androidXiaoMiChannelID"));
        }
        if (map.get("androidFCMChannelID") != null) {
            offlinePushInfo.setAndroidFCMChannelID((String) map.get("androidFCMChannelID"));
        }
        if (map.get("androidHuaWeiCategory") != null) {
            offlinePushInfo.setAndroidHuaWeiCategory((String) map.get("androidHuaWeiCategory"));
        }
        if (map.get("isDisablePush") != null) {
            offlinePushInfo.setDisablePush((boolean) map.get("isDisablePush"));
        }
        if (map.get("iOSPushType") != null) {
            int iOSPushTypeIndex = (int) map.get("iOSPushType");
            offlinePushInfo.setIOSPushType(EnumUtils.getIOSOfflinePushType(iOSPushTypeIndex));
        }
        return offlinePushInfo;
    }

    public static TUICommonDefine.RoomId getRoomIdByMap(Map map) {
        if (map == null) {
            return null;
        }
        TUICommonDefine.RoomId roomId = new TUICommonDefine.RoomId();
        if (map.containsKey("intRoomId")) {
            roomId.intRoomId = (int) map.get("intRoomId");
        }
        if (map.containsKey("strRoomId")) {
            roomId.strRoomId = (String) map.get("strRoomId");
        }
        return roomId;
    }


    public static TUICallDefine.RecentCallsFilter getRecentCallsFilterByMap(Map map) {
        if (map == null) {
            return null;
        }
        TUICallDefine.RecentCallsFilter filter = new TUICallDefine.RecentCallsFilter();
        if (map.containsKey("resultType")) {
            filter.result = EnumUtils.getCallRecordsResultType((int) map.get("resultType"));
        }
        return filter;
    }

    public static TUICommonDefine.VideoEncoderParams getVideoEncoderParamsByMap(Map map) {
        if (map == null) {
            return null;
        }

        TUICommonDefine.VideoEncoderParams encoderParams = new TUICommonDefine.VideoEncoderParams();
        if (map.containsKey("resolution")) {
            int resolutionIndex = (int) map.get("resolution");
            encoderParams.resolution = EnumUtils.getResolutionType(resolutionIndex);
        }
        if (map.containsKey("resolutionMode")) {
            int resolutionModeIndex = (int) map.get("resolutionMode");
            encoderParams.resolutionMode = EnumUtils.getResolutionModeType(resolutionModeIndex);

        }

        return encoderParams;
    }

    public static TUICommonDefine.VideoRenderParams getVideoRenderParamsByMap(Map map) {
        if (map == null) {
            return null;
        }

        TUICommonDefine.VideoRenderParams renderParams = new TUICommonDefine.VideoRenderParams();
        if (map.containsKey("fillMode")) {
            int fillModeIndex = (int) map.get("fillMode");
            renderParams.fillMode = EnumUtils.getFillModeType(fillModeIndex);
        }
        if (map.containsKey("rotation")) {
            int rotationIndex = (int) map.get("rotation");
            renderParams.rotation = EnumUtils.getRotationType(rotationIndex);
        }

        return renderParams;
    }

    public static Map getCallRecordsMap(TUICallDefine.CallRecords record) {
        Map<String, Object> map = new HashMap<>();
        if (record != null) {
            map.put("callId", record.callId);
            map.put("inviter'", record.inviter);
            map.put("inviteList", record.inviteList);
            map.put("scene", record.scene.ordinal());
            map.put("mediaType", record.mediaType.ordinal());
            map.put("groupId", record.groupId);
            map.put("role", record.role.ordinal());
            map.put("result", record.result.ordinal());
            map.put("beginTime", record.beginTime);
            map.put("totalTime", record.totalTime);
        }
        return map;
    }
}
