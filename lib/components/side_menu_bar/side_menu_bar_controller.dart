// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class SideMenuBarController {
  int _currentDepth = 0;
  final StreamController<int> _depthStreamController =
      StreamController<int>.broadcast();

  int get currentDepth => _currentDepth;
  Stream<int> get currentDepthStream => _depthStreamController.stream;

  void changeDepth(int depth) {
    _currentDepth = depth;
    _depthStreamController.sink.add(_currentDepth);
  }

  void dispose() {
    _depthStreamController.close();
  }
}
