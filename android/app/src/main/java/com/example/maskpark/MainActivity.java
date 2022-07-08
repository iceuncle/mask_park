package com.example.maskpark;

import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
//import org.devio.flutter.splashscreen.SplashScreen;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
//        SplashScreen.show(this, true);
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
        IMPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.maskpark.IMPlugin"));
    }
}
