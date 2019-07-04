import 'package:equatable/equatable.dart';

abstract class ContentScreenState extends Equatable {
  ContentScreenState([List props = const []]) : super(props);
}

class Uninitialized extends ContentScreenState {
  @override
  String toString() => 'Uninitialized';
}

class Initializing extends ContentScreenState {
  @override
  String toString() => 'Initializing';
}

class Initialized extends ContentScreenState {
  @override
  String toString() => 'Initialized';
}

class Idling extends ContentScreenState {
  @override
  String toString() => 'Idling';
}
