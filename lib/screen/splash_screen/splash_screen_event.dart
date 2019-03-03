import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {}

// 画面の開始を通知
class SplashScreenStartedEvent extends SplashScreenEvent {
  @override
  String toString() => 'SplashScreenStartedEvent';
}

// 次画面への遷移完了を通知
class SplashScreenToLoginScreenNavigationCompletedEvent
    extends SplashScreenEvent {
  @override
  String toString() => 'SplashScreenToLoginScreenNavigationCompletedEvent';
}
