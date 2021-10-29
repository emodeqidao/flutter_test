import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;
  SearchPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search页面"),
        centerTitle: true,
      ),
      body: Center(
          child: Text("Search页面${arguments != null ? arguments['id']:'0'} ")
      ),

    );
  }
}
