import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertest/PrintManager.dart';

import 'package:flutter/material.dart';
import 'package:fluttertest/QueueUtil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tag = 4;
  List<String> list = <String>[];

  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;

  void onData(String data) {
    print("$data");
  }

  void onError(error) {
    print("onError $error");
  }

  void onDone() {
    print("onDone");
  }

  void _pauseStream() {
    print("Pause subscrition");
    _streamSubscription.pause();
  }

  void _addData() async {
    print("Add data to stream");
    String data = await fetchData();
    _streamController.add(data);
  }

  void _resumeStream() {
    print("Resume subscrition");
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print("Cancel subscrition");
    _streamSubscription.cancel();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw "Something happend";
    return "hello~";
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PrintManager.initData();

    _streamController = StreamController<String>();

    _streamSubscription =
        _streamController.stream.listen(onData, onError: onError, onDone: onDone);
  }

  Future _doFuture(String queueName, int taskNo) {
    return Future.delayed(Duration(seconds: 2), () {
      print("任务完成  queueName: $queueName, taskNo: $taskNo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello flutter"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Text('开始任务'),
                      onTap: () {
                        PrintManager.doActionTask();
                      },
                    ),
                    SizedBox(width: 50,),
                    GestureDetector(
                      child: Text('增加打印'),
                      onTap: () {
                        PrintManager.doAddTask();
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: Text('执行下一个'),
                  onTap: () {
                    PrintManager.callBack();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Text('QueueUtil 开始'),
                      onTap: () {
                        /// 将任务添加到队列
                        print("加入队列-net, taskNo: 1");
                        QueueUtil.get("net").addTask(() {
                          return _doFuture("net", 1);
                        });
                        print("加入队列-net, taskNo: 2");
                        QueueUtil.get("net").addTask(() {
                          return _doFuture("net", 2);
                        });
                        print("加入队列-local, taskNo: 1");
                        QueueUtil.get("local").addTask(() {
                          return _doFuture("local", 1);
                        });
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      child: Text('QueueUtil 增加一个'),
                      onTap: () {
                        tag++;
                        QueueUtil.get("local").addTask(() {
                          return _doFuture("local", tag);
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      // body: Center(
      //   child: RaisedButton(
      //     child: Text("点击跳转到search页面"),
      //     onPressed: (){
      //       //需要传递的参数放入arguments里面
      //       Navigator.pushNamed(context,'/search',arguments: {
      //         "id":12312312312
      //       });
      //
      //     },
      //   ),
      // ),
    );
  }
}

