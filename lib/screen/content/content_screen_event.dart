import 'package:equatable/equatable.dart';

abstract class ContentScreenEvent extends Equatable {
  ContentScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializing extends ContentScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRendering extends ContentScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}
