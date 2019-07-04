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
  LoginScreenState get initialState => Uninitialized();

  @override
  Stream<LoginScreenState> mapEventToState(
    LoginScreenEvent event,
  ) async* {
    if (event is OnRequestInitializing) {
      yield Initializing();

      yield Initialized();
    } else if (event is OnCompleteRendering) {
      yield Idling();
    } else if (event is OnRequestAuthenticating) {
      yield Authenticating();

      bool result = await authenticationRepository.authenticate(
        loginModel: event.loginModel,
      );

      if (result) {
        yield AuthenticationSucceeded();
      } else {
        yield AuthenticationFailed();
      }
    } else if (event is OnRequestNavigatingToContentScreen) {
      yield ToContentScreenNavigating();
    }
  }
}
