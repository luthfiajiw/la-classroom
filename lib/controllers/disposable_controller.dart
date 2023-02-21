import 'package:flutter/material.dart';

abstract class DisposableController with ChangeNotifier {
  void disposeValues();
}