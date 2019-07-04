import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  SplashScreenState([List props = const []]) : super(props);
}

class Uninitialized extends SplashScreenState {
  @override
  String toString() => 'Uninitialized';
}

class Initializing extends SplashScreenState {
  @override
  String toString() => 'Initializing';
}

class Initialized extends SplashScreenState {
  @override
  String toString() => 'Initialized';
}

class ToLoginScreenNavigating extends SplashScreenState {
  @override
  String toString() => 'ToLoginScreenNavigating';
}
