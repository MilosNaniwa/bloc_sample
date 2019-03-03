import 'package:equatable/equatable.dart';

abstract class SettingScreenState extends Equatable {
  SettingScreenState([List props = const []]) : super(props);
}

// 初期化前の状態
class SettingScreenUninitializedState extends SettingScreenState {
  @override
  String toString() => 'SettingScreenUninitializedState';
}

// 初期化された状態
class SettingScreenInitializedState extends SettingScreenState {
  @override
  String toString() => 'SettingScreenInitializedState';
}
