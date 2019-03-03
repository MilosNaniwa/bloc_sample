import 'package:bloc_sample/screen/content_screen/content_screen.dart';
import 'package:test/test.dart';

void main() {
  ContentScreenBloc bloc;

  setUp(() {
    bloc = ContentScreenBloc();
  });

  group('ContentScreenBloc Testing', () {
    test('initialState', () {
      expectLater(
        bloc.initialState,
        ContentScreenUninitializedState(),
      );
    });

    test('dispose', () {
      expectLater(
        bloc.state,
        emitsInOrder([]),
      );
      bloc.dispose();
    });

    test('ContentScreenStartedEvent', () {
      final expectedResponse = [
        ContentScreenUninitializedState(),
        ContentScreenInitializedState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        ContentScreenStartedEvent(),
      );
    });
  });
}
