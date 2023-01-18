
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploaderController extends ChangeNotifier {
  Future<void> uploadData() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
    final papersInAssets = manifestMap.keys.where((e) {
      return e.startsWith("assets/DB/papers") && e.contains(".json");
    }).toList();

    for (String paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
    }
  }
}