import 'package:equatable/equatable.dart';

abstract class SettingScreenState extends Equatable {
  SettingScreenState([List props = const []]) : super(props);
}

class UninitializedState extends SettingScreenState {
  @override
  String toString() => 'Uninitialized';
}

class InitializingState extends SettingScreenState {
  @override
  String toString() => 'Initializing';
}

class InitializedState extends SettingScreenState {
  @override
  String toString() => 'Initialized';
}

class IdlingState extends SettingScreenState {
  @override
  String toString() => 'Idling';
}
