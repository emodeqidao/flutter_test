
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('mine init state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mine title'),
      ),
      body: Container(
        child: Text('mine'),
      ),
    );
  }
}
