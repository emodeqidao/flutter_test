import 'dart:async';

class PrintManager {

  Completer<String> _completer;

  static PrintManager manager;

  static List _taskList = [];
  static List _printedList = [];
  static bool _isDoing = false;

  static initData() {
    if (manager == null) {
      manager = PrintManager();

      _taskList.add('');
      _taskList.add('');
      _taskList.add('');
    }
  }

  //开始做任务
  static Future<void> doActionTask() async {
    if (!_isDoing) {
      _isDoing = true;
      for (int i = 0; i < _taskList.length; i++) {
        print('${_taskList.length}');
        print('进入循环第${i} 个');
        await manager.printe();
        print('继续下一个');
        _printedList.add('');
        if (_printedList.length == _taskList.length) {
          _isDoing = false;
          _printedList.clear();
          _taskList.clear();
        }
      }
    }
  }

  static doAddTask() {
    _taskList.add('');
    _taskList.add('');
    doActionTask();
  }

  //打印任务
  Future<String> printe() async {
    _completer = Completer<String>();
    await sendMessage();
    print('在等待中');
    return _completer.future;
  }

  //发送消息数据进行打印
  void sendMessage() async {
    await Future(() {
      print('耗时任务，挂起来， 发送消息了 async');
    });
  }

  //回调
  static void callBack() {
    if (manager._completer?.isCompleted == false) {
      print('啊 我回调了, 可以执行下一个了');
      manager._completer.complete('xixi');
    }
  }
}