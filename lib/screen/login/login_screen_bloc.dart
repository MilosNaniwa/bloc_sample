import 'package:bloc/bloc.dart';
import 'package:bloc_sample/repository/authentication_repository.dart';
import 'package:bloc_sample/screen/login/login_screen.dart';
import 'package:meta/meta.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final AuthenticationRepository authenticationRepository;

  @override
  String toString() => 'LoginScreen';

  LoginScreenBloc({
    @required this.authenticationRepository,
  });

  @override
  LoginScreenState get initialState => UninitializedState();

  @override
  Stream<LoginScreenState> mapEventToState(
    LoginScreenEvent event,
  ) async* {
    if (event is OnRequestInitializingEvent) {
      yield InitializingState();

      yield InitializedState();
    } else if (event is OnCompleteRenderingEvent) {
      yield IdlingState();
    } else if (event is OnRequestAuthenticatingEvent) {
      yield AuthenticatingState();

      bool result = await authenticationRepository.authenticate(
        loginModel: event.loginModel,
      );

      if (result) {
        yield AuthenticationSucceededState();
      } else {
        yield AuthenticationFailedState();
      }
    } else if (event is OnRequestNavigatingToContentScreenEvent) {
      yield ToContentScreenNavigatingState();
    }
  }
}
