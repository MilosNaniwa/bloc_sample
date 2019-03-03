import 'package:bloc_sample/model/login/login.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginScreenEvent extends Equatable {
  LoginScreenEvent([List props = const []]) : super(props);
}

// 画面の開始を通知
class LoginScreenStartedEvent extends LoginScreenEvent {
  @override
  String toString() => 'LoginScreenStartedEvent';
}

// ログインボタンが押下されたことを通知
class LoginScreenLoginButtonOnPressedEvent extends LoginScreenEvent {
  final LoginModel loginModel;

  LoginScreenLoginButtonOnPressedEvent({
    @required this.loginModel,
  }) : super([
          loginModel,
        ]);

  @override
  String toString() => 'LoginScreenLoginButtonOnPressedEvent';
}

// 次画面への遷移完了を通知
class LoginScreenToFirstScreenNavigationCompletedEvent
    extends LoginScreenEvent {
  @override
  String toString() => 'LoginScreenToFirstScreenNavigationCompletedEvent';
}
