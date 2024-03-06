// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NestedSideMenuController extends ChangeNotifier {
  NestedSideMenuController();

  List<int?> _selectedIndexes = [0]; // initial = 0
  List<int?> get selectedIndexes => _selectedIndexes;

  void changeSelectedIndexes(
      {required int menuBarDepth,
      required int? index,
      required bool isSubmenuExist}) {
    if (_selectedIndexes.length < menuBarDepth + 1) {
      // 현재 뎁쓰 보다 깊은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.add(index);
    } else if (_selectedIndexes.length == menuBarDepth + 1) {
      // 동일한 뎁쓰의 탭을 선택한 경우
      _selectedIndexes.removeLast();
      _selectedIndexes.add(index);
    } else if (_selectedIndexes.length > menuBarDepth + 1) {
      // 현재 가장 깊은 뎁쓰 보다 얕은 뎁쓰의 탭을 선택한 경우
      _selectedIndexes
          .replaceRange(menuBarDepth, _selectedIndexes.length, [index]);
    }
    if (isSubmenuExist) {
      _selectedIndexes.add(null);
    }
    notifyListeners();
  }
}
