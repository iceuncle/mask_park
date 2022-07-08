package com.example.maskpark;

import android.app.Activity;
import android.util.Log;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * 界面描述：
 * <p>
 * Created by tianyang on 2020/5/14.
 */
public class IMPlugin implements MethodChannel.MethodCallHandler {
    private final static String TAG = "AsrPlugin";
    private final Activity activity;

    public IMPlugin(PluginRegistry.Registrar registrar) {
        this.activity = registrar.activity();
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), "im_plugin");
        IMPlugin instance = new IMPlugin(registrar);
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "sendMessage":
                Log.d(TAG, "SendMessage");
                Map map = methodCall.arguments instanceof Map ? (Map) methodCall.arguments : null;
                if (map != null && map.get("a") != null)
                    Log.d(TAG, String.valueOf(map.get("a")));
                result.success("收到");
                break;
            case "hello":
                Log.d(TAG, "Hello");
                break;
        }
    }
}
