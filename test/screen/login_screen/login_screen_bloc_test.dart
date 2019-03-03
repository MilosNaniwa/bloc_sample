import 'package:bloc_sample/model/login/login.dart';
import 'package:bloc_sample/repository/authentication/authentication.dart';
import 'package:bloc_sample/screen/login_screen/login_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  LoginScreenBloc bloc;
  AuthenticationRepository authenticationRepository;

  final LoginModel loginModel = LoginModel(
    userId: 'hoge',
    password: 'fuga',
  );

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    bloc = LoginScreenBloc(
      authenticationRepository: authenticationRepository,
    );
  });

  group('LoginScreenBloc Testing', () {
    test('initialState', () {
      expectLater(
        bloc.initialState,
        LoginScreenUninitializedState(),
      );
    });

    test('dispose', () {
      expectLater(
        bloc.state,
        emitsInOrder([]),
      );
      bloc.dispose();
    });

    test('LoginScreenStartedEvent', () {
      final expectedResponse = [
        LoginScreenUninitializedState(),
        LoginScreenInitializedState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        LoginScreenStartedEvent(),
      );
    });

    test('LoginScreenLoginButtonOnPressedEvent Login Success', () {
      final expectedResponse = [
        LoginScreenUninitializedState(),
        LoginScreenAuthenticatingState(),
        LoginScreenToFirstScreenNavigatingState(),
      ];
      when(
        authenticationRepository.authenticate(
          loginModel: loginModel,
        ),
      ).thenAnswer(
        (_) => Future.value(true),
      );
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        LoginScreenLoginButtonOnPressedEvent(
          loginModel: loginModel,
        ),
      );
    });

    test('LoginScreenLoginButtonOnPressedEvent Login Fail', () {
      final expectedResponse = [
        LoginScreenUninitializedState(),
        LoginScreenAuthenticatingState(),
        LoginScreenAuthenticationFailedState(),
      ];
      when(
        authenticationRepository.authenticate(
          loginModel: loginModel,
        ),
      ).thenAnswer(
        (_) => Future.value(false),
      );
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        LoginScreenLoginButtonOnPressedEvent(
          loginModel: loginModel,
        ),
      );
    });

    test('LoginScreenToFirstScreenNavigationCompletedEvent', () {
      final expectedResponse = [
        LoginScreenUninitializedState(),
        LoginScreenToFirstScreenNavigatedState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        LoginScreenToFirstScreenNavigationCompletedEvent(),
      );
    });
  });
}
