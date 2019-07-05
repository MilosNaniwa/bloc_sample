import 'package:equatable/equatable.dart';

abstract class ContentScreenEvent extends Equatable {
  ContentScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializingEvent extends ContentScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRenderingEvent extends ContentScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}
