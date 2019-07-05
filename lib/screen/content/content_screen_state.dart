import 'package:equatable/equatable.dart';

abstract class ContentScreenState extends Equatable {
  ContentScreenState([List props = const []]) : super(props);
}

class UninitializedState extends ContentScreenState {
  @override
  String toString() => 'Uninitialized';
}

class InitializingState extends ContentScreenState {
  @override
  String toString() => 'Initializing';
}

class InitializedState extends ContentScreenState {
  @override
  String toString() => 'Initialized';
}

class IdlingState extends ContentScreenState {
  @override
  String toString() => 'Idling';
}
