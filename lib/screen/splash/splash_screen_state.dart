import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  SplashScreenState([List props = const []]) : super(props);
}

class UninitializedState extends SplashScreenState {
  @override
  String toString() => 'Uninitialized';
}

class InitializingState extends SplashScreenState {
  @override
  String toString() => 'Initializing';
}

class InitializedState extends SplashScreenState {
  @override
  String toString() => 'Initialized';
}

class ToLoginScreenNavigatingState extends SplashScreenState {
  @override
  String toString() => 'ToLoginScreenNavigating';
}
