import 'package:bloc/bloc.dart';
import 'package:bloc_sample/repository/authentication/authentication.dart';
import 'package:bloc_sample/screen/login_screen/login_screen.dart';
import 'package:meta/meta.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final AuthenticationRepository authenticationRepository;

  LoginScreenBloc({
    @required this.authenticationRepository,
  });

  @override
  LoginScreenState get initialState => LoginScreenUninitializedState();

  @override
  Stream<LoginScreenState> mapEventToState(
    LoginScreenState currentState,
    LoginScreenEvent event,
  ) async* {
    // 画面が開始された場合
    if (event is LoginScreenStartedEvent) {
      // 初期化された状態を返却する
      yield LoginScreenInitializedState();
    }

    // ログインボタンが押下された場合
    if (event is LoginScreenLoginButtonOnPressedEvent) {
      // 認証中の状態を返却する
      yield LoginScreenAuthenticatingState();

      // 認証処理を行う
      bool result = await authenticationRepository.authenticate(
        loginModel: event.loginModel,
      );

      // 認証結果を検証する
      if (result) {
        // 認証に成功した場合
        // 次画面へ遷移中の状態を返却する
        yield LoginScreenToFirstScreenNavigatingState();
      } else {
        // 認証に失敗した場合
        // 認証失敗の状態を返却する
        yield LoginScreenAuthenticationFailedState();
      }
    }

    // 画面遷移が完了した場合
    if (event is LoginScreenToFirstScreenNavigationCompletedEvent) {
      // 遷移完了の状態を返却する
      yield LoginScreenToFirstScreenNavigatedState();
    }
  }
}
