import 'package:flutter/material.dart';

class DataUploaderView extends StatefulWidget {
  const DataUploaderView({super.key});

  @override
  State<DataUploaderView> createState() => _DataUploaderViewState();
}

class _DataUploaderViewState extends State<DataUploaderView> {

  @override
  void initState() {
    super.initState();
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