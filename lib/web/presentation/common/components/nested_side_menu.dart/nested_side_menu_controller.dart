import 'package:flutter/material.dart';

class NestedSideMenuController extends ChangeNotifier {
  List<int?> _selectedIndexes = [0]; // initial = 0
  List<int?> get selectedIndexes => _selectedIndexes;

  void changeSelectedIndexes(int menuBarDepth, int? index) {
    if (_selectedIndexes.length < menuBarDepth + 1) {
      // 현재 가장 깊은 뎁쓰 보다 깊은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.add(index);
      print(_selectedIndexes);
      print('go deeper');
    } else if (_selectedIndexes.length == menuBarDepth + 1) {
      // 동일한 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.removeLast();
      _selectedIndexes.add(index);
      print(_selectedIndexes);
      print('same depth');
    } else if (_selectedIndexes.length > menuBarDepth + 1) {
      // 현재 가장 깊은 뎁쓰 보다 얕은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes
          .replaceRange(menuBarDepth, _selectedIndexes.length, [index]);
      print(_selectedIndexes);
      print('go upper');
    }
    notifyListeners();
  }
}
