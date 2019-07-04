import 'package:equatable/equatable.dart';

abstract class SettingScreenState extends Equatable {
  SettingScreenState([List props = const []]) : super(props);
}

class Uninitialized extends SettingScreenState {
  @override
  String toString() => 'Uninitialized';
}

class Initializing extends SettingScreenState {
  @override
  String toString() => 'Initializing';
}

class Initialized extends SettingScreenState {
  @override
  String toString() => 'Initialized';
}

class Idling extends SettingScreenState {
  @override
  String toString() => 'Idling';
}
