import 'package:flutter/material.dart';

import '../flutter_doraemonkit.dart';

class DoraemonkitListener extends StatefulWidget {
  final Widget child;
  final bool Function() enable;

  DoraemonkitListener({Key key, this.child, this.enable})
      : super(key: key);

  @override
  _DoraemonkitListenerState createState() =>
      _DoraemonkitListenerState();
}

class _DoraemonkitListenerState extends State<DoraemonkitListener> {
  int _value;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: widget.child,
      onPointerDown: (_) {
        _value = DateTime.now().millisecondsSinceEpoch;
      },
      onPointerUp: (_) {
        final value = DateTime.now().millisecondsSinceEpoch;
        if (value - _value > 3 * 1000 &&
            widget.enable != null &&
            widget.enable()) {
          FlutterDoraemonkit.toggle();
        }
      },
    );
  }
}
