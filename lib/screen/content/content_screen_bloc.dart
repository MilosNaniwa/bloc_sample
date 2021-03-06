import 'package:bloc/bloc.dart';
import 'package:bloc_sample/screen/content/content_screen.dart';

class ContentScreenBloc extends Bloc<ContentScreenEvent, ContentScreenState> {
  @override
  String toString() => 'ContentScreen';

  @override
  ContentScreenState get initialState => UninitializedState();

  @override
  Stream<ContentScreenState> mapEventToState(
    ContentScreenEvent event,
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
