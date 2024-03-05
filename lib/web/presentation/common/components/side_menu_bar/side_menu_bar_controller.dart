// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';

// import 'package:flutter/material.dart';

// class SideMenuBarController {
//   int _currentDepth = 0;
//   final StreamController<int> _depthStreamController =
//       StreamController<int>.broadcast();
//   final StreamController<Widget> _widgetStreamController =
//       StreamController<Widget>.broadcast();

//   int get currentDepth => _currentDepth;
//   Stream<int> get currentDepthStream => _depthStreamController.stream;
//   Stream<Widget> get currentWidgetStream => _widgetStreamController.stream;

//   void changeDepth(int depth) {
//     _currentDepth = depth;
//     _depthStreamController.sink.add(_currentDepth);
//   }

//   void updateWidget(Widget widget) {
//     _widgetStreamController.sink.add(widget);
//   }

//   void dispose() {
//     _depthStreamController.close();
//     _widgetStreamController.close();
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class SideMenuBarController {
  List<int> _selectedIndexes = [0]; // initial = 0
  SideMenuBarController() {
    _selectedIndexesStreamController.sink.add(_selectedIndexes);
  }

  void changeSelectedIndexes(int menuBarDepth, int index) {
    if (_selectedIndexes.length < menuBarDepth) {
      // 현재 가장 깊은 뎁쓰 보다 깊은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.add(index);
    } else if (_selectedIndexes.length == menuBarDepth) {
      // 현재 가장 깊은 뎁쓰와 같은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.removeLast();
      _selectedIndexes.add(index);
    } else if (_selectedIndexes.length > menuBarDepth) {
      // 현재 가장 깊은 뎁쓰 보다 얕은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes
          .replaceRange(menuBarDepth, _selectedIndexes.length, [index]);
    }
    _selectedIndexesStreamController.sink.add(_selectedIndexes);
  }

  final StreamController<List<int>> _selectedIndexesStreamController =
      StreamController<List<int>>.broadcast();
  Stream<List<int>> get selectedIndexes =>
      _selectedIndexesStreamController.stream;

  void dispose() {
    _selectedIndexesStreamController.close();
  }
}
