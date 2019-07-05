import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  SplashScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializingEvent extends SplashScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnRequestNavigatingToLoginScreenEvent extends SplashScreenEvent {
  @override
  String toString() => 'OnRequestNavigatingToLoginScreen';
}
