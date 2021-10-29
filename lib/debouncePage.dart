import 'package:flutter/material.dart';
import 'package:fluttertest/fun_utils.dart';

class DebouncePage extends StatefulWidget {
  const DebouncePage({Key key}) : super(key: key);

  @override
  _DebouncePageState createState() => _DebouncePageState();
}

class _DebouncePageState extends State<DebouncePage> {
  int _count = 0;
  String str = '1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void test() {
    Future(() {
      for (int i = 0; i < 100000000; i++) {
        // 模拟耗时操作
        str = i.toString();
      }
      str = '2';
      print('${str}');
    });
    Future(() {
      str = '3';
      print('${str}');
    });
    Future.delayed(Duration(seconds: 1)).then((value) {
      str = '4';
      print('${str}');
    });
    print('5');
  }

  void testDe() {
    sx_debounce(() {
      print('aaaa');
      if (!mounted) {
        return;
      }
      setState(() {
        _count++;
      });
    }, delay: Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debounce'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            '$_count',
            // str,
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Test'),
            onPressed: () {
              test();
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('防抖'),
            onPressed: () {
              testDe();
            },
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('防抖1'),
            onPressed: sx_debounce(() {
              print('aaaa');
              if (!mounted) {
                return;
              }
              setState(() {
                _count++;
              });
            }, delay: Duration(milliseconds: 1000)),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('不防抖'),
            onPressed: () {
              if (!mounted) {
                return;
              }
              setState(() {
                _count++;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('节流，耗时操作2s'),
            onPressed: sx_throttle(() async {
              await Future.delayed(Duration(milliseconds: 2000))
                  .then((value) => print('$_count'));
              if (!mounted) {
                return;
              }
              setState(() {
                _count++;
              });
            }),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('不流，耗时操作2s'),
            onPressed: () async {
              await Future.delayed(Duration(milliseconds: 5000))
                  .then((value) => print('$_count'));
              if (!mounted) {
                return;
              }
              setState(() {
                _count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
