import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/setting/setting_screen.dart';

class SettingScreenBloc extends Bloc<SettingScreenEvent, SettingScreenState> {
  @override
  String toString() => 'SettingScreen';

  @override
  SettingScreenState get initialState => UninitializedState();

  @override
  Stream<SettingScreenState> mapEventToState(
    SettingScreenEvent event,
  ) async* {
    if (event is OnRequestInitializingEvent) {
      yield InitializingState();

      // initialize process here
      await Future.delayed(const Duration(seconds: 3));

      yield InitializedState();
    } else if (event is OnCompleteRenderingEvent) {
      yield IdlingState();
    }
  }
}
