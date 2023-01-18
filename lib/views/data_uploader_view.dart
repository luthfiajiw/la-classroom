import 'package:flutter/material.dart';
import 'package:laclassroom/controllers/question_paper/data_uploader_controller.dart';
import 'package:provider/provider.dart';

class DataUploaderView extends StatefulWidget {
  const DataUploaderView({super.key});

  @override
  State<DataUploaderView> createState() => _DataUploaderViewState();
}

class _DataUploaderViewState extends State<DataUploaderView> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DataUploaderController>(context, listen: false).uploadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Uploading..."),
      ),
    );
  }
}