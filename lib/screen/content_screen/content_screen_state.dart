import 'package:equatable/equatable.dart';

abstract class ContentScreenState extends Equatable {
  ContentScreenState([List props = const []]) : super(props);
}

// 初期化前の状態
class ContentScreenUninitializedState extends ContentScreenState {
  @override
  String toString() => 'ContentScreenUninitializedState';
}

// 初期化された状態
class ContentScreenInitializedState extends ContentScreenState {
  @override
  String toString() => 'ContentScreenInitializedState';
}
