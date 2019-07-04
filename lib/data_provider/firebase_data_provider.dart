import 'package:meta/meta.dart';

class FirebaseDataProvider {
  Future<String> getAccessToken({
    @required String userId,
    @required String password,
  }) async {
    // TODO Firebaseで認証処理を実装
    await Future.delayed(Duration(seconds: 3));
    if (password == 'fuga') {
      return 'OK';
    } else {
      return 'NG';
    }
  }
}
