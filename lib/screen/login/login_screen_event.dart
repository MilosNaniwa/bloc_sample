import 'package:bloc_sample/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginScreenEvent extends Equatable {
  LoginScreenEvent([List props = const []]) : super(props);
}

class OnRequestInitializing extends LoginScreenEvent {
  @override
  String toString() => 'OnRequestInitializing';
}

class OnCompleteRendering extends LoginScreenEvent {
  @override
  String toString() => 'OnCompleteRendering';
}

class OnRequestAuthenticating extends LoginScreenEvent {
  final LoginModel loginModel;

  OnRequestAuthenticating({
    @required this.loginModel,
  }) : super([
          loginModel,
        ]);

  @override
  String toString() => 'OnRequestAuthenticating';
}

class OnCompleteAuthenticating extends LoginScreenEvent {
  @override
  String toString() => 'OnCompleteAuthenticating';
}

class OnRequestNavigatingToContentScreen extends LoginScreenEvent {
  @override
  String toString() => 'OnRequestNavigatingToContentScreen';
}
