import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/splash_screen/splash_screen.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  @override
  SplashScreenState get initialState => SplashScreenUninitializedState();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenState currentState,
    SplashScreenEvent event,
  ) async* {
    // 画面が開始された場合
    if (event is SplashScreenStartedEvent) {
      // 初期化された状態を返却
      yield SplashScreenInitializedState();

      // 遷移中の状態を返却
      yield SplashScreenToLoginScreenNavigatingState();
    }

    // 画面遷移が完了した場合
    if (event is SplashScreenToLoginScreenNavigationCompletedEvent) {
      // 遷移完了の状態を返却
      yield SplashScreenToLoginScreenNavigatedState();
    }
  }
}
