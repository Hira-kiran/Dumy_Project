import 'package:flutter/material.dart';

class Utils{


}

// *********** sized box *****************
extension PaddingSizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
