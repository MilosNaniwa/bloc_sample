import 'package:equatable/equatable.dart';

abstract class LoginScreenState extends Equatable {
  LoginScreenState([List props = const []]) : super(props);
}

class Uninitialized extends LoginScreenState {
  @override
  String toString() => 'Uninitialized';
}

class Initializing extends LoginScreenState {
  @override
  String toString() => 'Initializing';
}

class Initialized extends LoginScreenState {
  @override
  String toString() => 'Initialized';
}

class Idling extends LoginScreenState {
  @override
  String toString() => 'Idling';
}

class Authenticating extends LoginScreenState {
  @override
  String toString() => 'Authenticating';
}

class AuthenticationSucceeded extends LoginScreenState {
  @override
  String toString() => 'AuthenticationSucceeded';
}

class AuthenticationFailed extends LoginScreenState {
  @override
  String toString() => 'AuthenticationFailed';
}

class ToContentScreenNavigating extends LoginScreenState {
  @override
  String toString() => 'ToContentScreenNavigating';
}
