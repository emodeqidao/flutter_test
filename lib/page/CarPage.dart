
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> with AutomaticKeepAliveClientMixin<CarPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('car init state');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('car title'),
      ),
      body: Container(
        child: Text('car'),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
