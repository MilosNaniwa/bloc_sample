import 'package:bloc_sample/data_provider/firebase/firebase.dart';
import 'package:bloc_sample/model/login/login.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  final FirebaseDataProvider firebaseDataProvider;

  AuthenticationRepository({
    @required this.firebaseDataProvider,
  });

  /// 認証処理
  Future<bool> authenticate({
    @required LoginModel loginModel,
  }) async {
    // ログインモデルからユーザーIDとパスワードを取得し、認証処理を行う
    String token = await firebaseDataProvider.getAccessToken(
      userId: loginModel.userId,
      password: loginModel.password,
    );
    // 結果を検証する
    bool result = _checkToken(token);

    // 結果を返却する
    return result;
  }

  bool _checkToken(String token) {
    bool result = false;
    if (token == 'OK') {
      result = true;
    }
    return result;
  }
}
