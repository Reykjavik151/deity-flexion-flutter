import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class DefaultProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeartbeatProgressIndicator(
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.5)),
        ),
      ),
    );
  }
}
