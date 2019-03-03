import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  SplashScreenState([List props = const []]) : super(props);
}

// 初期化前の状態
class SplashScreenUninitializedState extends SplashScreenState {
  @override
  String toString() => 'SplashScreenUninitializedState';
}

// 初期化された状態
class SplashScreenInitializedState extends SplashScreenState {
  @override
  String toString() => 'SplashScreenInitializedState';
}

// 次画面へ遷移処理中の状態
class SplashScreenToLoginScreenNavigatingState extends SplashScreenState {
  @override
  String toString() => 'SplashScreenToLoginScreenNavigatingState';
}

// 次画面へ遷移完了の状態
class SplashScreenToLoginScreenNavigatedState extends SplashScreenState {
  @override
  String toString() => 'SplashScreenToLoginScreenNavigatedState';
}
