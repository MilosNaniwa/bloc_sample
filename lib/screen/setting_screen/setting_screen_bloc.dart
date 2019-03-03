import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/setting_screen/setting_screen.dart';

class SettingScreenBloc extends Bloc<SettingScreenEvent, SettingScreenState> {
  @override
  SettingScreenState get initialState => SettingScreenUninitializedState();

  @override
  Stream<SettingScreenState> mapEventToState(
    SettingScreenState currentState,
    SettingScreenEvent event,
  ) async* {
    // 画面が開始された場合
    if (event is SettingScreenStartedEvent) {
      // 初期化された状態を返却
      yield SettingScreenInitializedState();
    }
  }
}
