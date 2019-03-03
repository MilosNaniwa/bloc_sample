import 'package:bloc_sample/data_provider/firebase/firebase.dart';
import 'package:bloc_sample/model/login/login.dart';
import 'package:bloc_sample/repository/authentication/authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockFirebaseDataProvider extends Mock implements FirebaseDataProvider {}

void main() {
  AuthenticationRepository authenticationRepository;
  FirebaseDataProvider firebaseDataProvider;

  final String userId = 'hoge';
  final String password = 'fuga';

  const OK = 'OK';
  const NG = 'NG';

  final LoginModel loginModel = LoginModel(
    userId: userId,
    password: password,
  );

  setUp(() {
    firebaseDataProvider = MockFirebaseDataProvider();
    authenticationRepository = AuthenticationRepository(
      firebaseDataProvider: firebaseDataProvider,
    );
  });

  group('AuthenticationRepository Testing', () {
    test('authenticate OK', () async {
      when(
        firebaseDataProvider.getAccessToken(
          userId: userId,
          password: password,
        ),
      ).thenAnswer(
        (_) => Future.value(OK),
      );

      final result = await authenticationRepository.authenticate(
        loginModel: loginModel,
      );

      expect(
        result,
        true,
      );
    });

    test('authenticate NG', () async {
      when(
        firebaseDataProvider.getAccessToken(
          userId: userId,
          password: password,
        ),
      ).thenAnswer(
        (_) => Future.value(NG),
      );

      final result = await authenticationRepository.authenticate(
        loginModel: loginModel,
      );

      expect(
        result,
        false,
      );
    });
  });
}
