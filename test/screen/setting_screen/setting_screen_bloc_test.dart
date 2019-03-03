import 'package:bloc_sample/screen/setting_screen/setting_screen.dart';
import 'package:test/test.dart';

void main() {
  SettingScreenBloc bloc;

  setUp(() {
    bloc = SettingScreenBloc();
  });

  group('SettingScreenBloc Testing', () {
    test('initialState', () {
      expectLater(
        bloc.initialState,
        SettingScreenUninitializedState(),
      );
    });

    test('dispose', () {
      expectLater(
        bloc.state,
        emitsInOrder([]),
      );
      bloc.dispose();
    });

    test('SettingScreenStartedEvent', () {
      final expectedResponse = [
        SettingScreenUninitializedState(),
        SettingScreenInitializedState(),
      ];
      expectLater(
        bloc.state,
        emitsInOrder(expectedResponse),
      );
      bloc.dispatch(
        SettingScreenStartedEvent(),
      );
    });
  });
}
