import 'package:bloc_sample/screen/splash_screen/splash_screen.dart';
import 'package:test/test.dart';

void main() {
  SplashScreenBloc bloc;

  setUp(() {
    bloc = SplashScreenBloc();
  });

  group('SplashScreenBloc Testing', () {
    test('initialState', () {
      expectLater(
        bloc.initialState,
        SplashScreenUninitializedState(),
      );
    });

    test('dispose', () {
      expectLater(
        bloc.state,
        emitsInOrder([]),
      );
      bloc.dispose();
    });

    test('SplashScreenStartedEvent', () {
      final expectedResponse = [
        SplashScreenUninitializedState(),
        SplashScreenInitializedState(),
        SplashScreenToLoginScreenNavigatingState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        SplashScreenStartedEvent(),
      );
    });

    test('SplashScreenToLoginScreenNavigationCompletedEvent', () {
      final expectedResponse = [
        SplashScreenUninitializedState(),
        SplashScreenToLoginScreenNavigatedState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        SplashScreenToLoginScreenNavigationCompletedEvent(),
      );
    });
  });
}
