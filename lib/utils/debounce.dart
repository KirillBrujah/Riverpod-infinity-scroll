import 'dart:async';
import 'dart:ui';

class Debounce {
  final Duration duration;
  // VoidCallback action;
  Timer? _timer;

  Debounce(this.duration);

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }
}
