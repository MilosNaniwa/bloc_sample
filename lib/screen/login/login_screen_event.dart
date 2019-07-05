import 'package:bloc_sample/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginScreenEvent extends Equatable {
  LoginScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializingEvent extends LoginScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRenderingEvent extends LoginScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}

class OnRequestAuthenticatingEvent extends LoginScreenEvent {
  final LoginModel loginModel;

  OnRequestAuthenticatingEvent({
    @required this.loginModel,
  }) : super([
          loginModel,
        ]);

  @override
  String toString() => 'OnRequestAuthenticating';
}

class OnCompleteAuthenticatingEvent extends LoginScreenEvent {
  @override
  String toString() => 'OnCompleteAuthenticating';
}

class OnRequestNavigatingToContentScreenEvent extends LoginScreenEvent {
  @override
  String toString() => 'OnRequestNavigatingToContentScreen';
}
