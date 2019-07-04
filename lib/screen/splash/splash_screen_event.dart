import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  SplashScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializing extends SplashScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnRequestNavigatingToLoginScreen extends SplashScreenEvent {
  @override
  String toString() => 'OnRequestNavigatingToLoginScreen';
}
