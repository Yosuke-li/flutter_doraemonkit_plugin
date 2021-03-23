package com.example.flutter_doraemonkit;

import com.didichuxing.doraemonkit.DoraemonKit;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterDoraemonkitPlugin */
public class FlutterDoraemonkitPlugin implements MethodCallHandler {

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_doraemonkit");
    channel.setMethodCallHandler(new FlutterDoraemonkitPlugin());
    DoraemonKit.disableUpload();
    DoraemonKit.install(registrar.activity().getApplication(),null);
    DoraemonKit.hide();
  }


  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("toggle")) {
      if(DoraemonKit.isShow()){
        DoraemonKit.hide();
      }else {
        DoraemonKit.show();
      }
      result.success(true);
    } else {
      result.notImplemented();
    }
  }
}
