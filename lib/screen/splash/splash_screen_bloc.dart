import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/splash/splash_screen.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  @override
  String toString() => 'SplashScreen';

  @override
  SplashScreenState get initialState => Uninitialized();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is OnRequestInitializing) {
      yield Initializing();

      // initialize process here
      await Future.delayed(const Duration(seconds: 3));

      yield Initialized();
    } else if (event is OnRequestNavigatingToLoginScreen) {
      yield ToLoginScreenNavigating();
    }
  }
}
