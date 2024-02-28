import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen_model.g.dart';

@riverpod
class HomeScreenModel extends _$HomeScreenModel {
  @override
  AsyncValue build() {
    return AsyncData(null);
  }

  bool _isMenuOpen = false;
  bool get isMenuOpen => _isMenuOpen;

  void toggleIsMenuOpen() {
    state = const AsyncLoading();
    _isMenuOpen = !isMenuOpen;
    state = const AsyncData(null);
  }
}
