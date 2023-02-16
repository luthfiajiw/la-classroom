import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerZoomController extends ChangeNotifier {
  final ZoomDrawerController zoomDrawerController;

  DrawerZoomController(this.zoomDrawerController);

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    notifyListeners();
  }
}