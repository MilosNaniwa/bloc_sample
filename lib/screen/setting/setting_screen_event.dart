import 'package:equatable/equatable.dart';

abstract class SettingScreenEvent extends Equatable {
  SettingScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializingEvent extends SettingScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRenderingEvent extends SettingScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}
