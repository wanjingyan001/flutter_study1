import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerState();
  }
}

class _GestureRecognizerState extends State<GestureRecognizerTest> {
  TapGestureRecognizer _recognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(
        children: [
          TextSpan(text: "Hello World"),
          TextSpan(
              text: "click me To Change Color",
              style: TextStyle(
                  fontSize: 30, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _recognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: "你好世界")
        ],
      )),
    );
  }
}
