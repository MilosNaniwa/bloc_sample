import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/content_screen/content_screen.dart';

class ContentScreenBloc extends Bloc<ContentScreenEvent, ContentScreenState> {
  @override
  ContentScreenState get initialState => ContentScreenUninitializedState();

  @override
  Stream<ContentScreenState> mapEventToState(
    ContentScreenState currentState,
    ContentScreenEvent event,
  ) async* {
    // 画面が開始された場合
    if (event is ContentScreenStartedEvent) {
      // 初期化された状態を返却
      yield ContentScreenInitializedState();
    }
  }
}
