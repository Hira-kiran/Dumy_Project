import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
        )..show(context));
  }
}

// *********** sized box *****************
extension PaddingSizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
