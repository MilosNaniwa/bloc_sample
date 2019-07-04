import 'package:equatable/equatable.dart';

abstract class SettingScreenEvent extends Equatable {
  SettingScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializing extends SettingScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRendering extends SettingScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}
