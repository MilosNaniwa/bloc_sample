import 'package:equatable/equatable.dart';

abstract class LoginScreenState extends Equatable {
  LoginScreenState([List props = const []]) : super(props);
}

// 初期化前の状態
class LoginScreenUninitializedState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenUninitializedState';
}

// 初期化された状態
class LoginScreenInitializedState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenInitializedState';
}

// 認証中の状態
class LoginScreenAuthenticatingState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenAuthenticatingState';
}

// 認証に失敗した状態
class LoginScreenAuthenticationFailedState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenAuthenticationFailedState';
}

// 次画面へ遷移処理中の状態
class LoginScreenToFirstScreenNavigatingState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenToFirstScreenNavigatingState';
}

// 次画面へ遷移完了の状態
class LoginScreenToFirstScreenNavigatedState extends LoginScreenState {
  @override
  String toString() => 'LoginScreenToFirstScreenNavigated';
}
