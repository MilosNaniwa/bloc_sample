import 'package:equatable/equatable.dart';

abstract class LoginScreenState extends Equatable {
  LoginScreenState([List props = const []]) : super(props);
}

class UninitializedState extends LoginScreenState {
  @override
  String toString() => 'Uninitialized';
}

class InitializingState extends LoginScreenState {
  @override
  String toString() => 'Initializing';
}

class InitializedState extends LoginScreenState {
  @override
  String toString() => 'Initialized';
}

class IdlingState extends LoginScreenState {
  @override
  String toString() => 'Idling';
}

class AuthenticatingState extends LoginScreenState {
  @override
  String toString() => 'Authenticating';
}

class AuthenticationSucceededState extends LoginScreenState {
  @override
  String toString() => 'AuthenticationSucceeded';
}

class AuthenticationFailedState extends LoginScreenState {
  @override
  String toString() => 'AuthenticationFailed';
}

class ToContentScreenNavigatingState extends LoginScreenState {
  @override
  String toString() => 'ToContentScreenNavigating';
}
