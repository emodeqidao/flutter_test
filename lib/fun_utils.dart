import 'dart:async';

/*
 场景说明
 例如 一个按钮，被测试在 短时间内快速连续点击， 可以使用 sx_debounce 来防止
 例如 一个方法是更变 某个数值，接口在短时间内快速更变了几次，这个时候可以使用 sx_throttle 来达到减少调用次数
 */

/// 函数防抖
/// func 执行的函数
/// delay 间隔时间
Function sx_debounce(
    Function func, {
      Duration delay = const Duration(milliseconds: 500),
    }) {
  Timer timer;
  Function target = () {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(delay, () {
      func?.call();
    });
  };
  return target;
}

/// 函数节流
Function sx_throttle(
    Future Function() func,
    ) {
  if (func == null) {
    return func;
  }
  bool enable = true;
  Function target = () {
    if (enable == true) {
      enable = false;
      func().then((_) {
        enable = true;
      });
    }
  };
  return target;
}