
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
export 'src/doraemonkit_page.dart';

class FlutterDoraemonkit {
  static const MethodChannel _channel =
      const MethodChannel('flutter_doraemonkit');


  static Future<bool?> toggle() async {
    if(Platform.isAndroid){
      return  _channel.invokeMethod<bool?>('toggle');
    }else{
      return true;
    }
  }
}
