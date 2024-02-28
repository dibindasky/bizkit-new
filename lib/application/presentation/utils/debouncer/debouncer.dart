import 'dart:async';

class Debouncer {
  final Duration duration;

  Debouncer({this.duration = const Duration(milliseconds: 300)});

  Function call(Function callback) {
    Timer? timer;
    return (dynamic value) {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(duration, () {
        callback(value);
      });
    };
  }
}
