import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/splash/splash_screen.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  @override
  String toString() => 'SplashScreen';

  @override
  SplashScreenState get initialState => UninitializedState();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is OnRequestInitializingEvent) {
      yield InitializingState();

      // initialize process here
      await Future.delayed(const Duration(seconds: 3));

      yield InitializedState();
    } else if (event is OnRequestNavigatingToLoginScreenEvent) {
      yield ToLoginScreenNavigatingState();
    }
  }
}
