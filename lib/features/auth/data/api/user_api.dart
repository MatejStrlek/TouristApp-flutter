import 'package:firebase_auth/firebase_auth.dart';

class UserApi {
  final FirebaseAuth instance;

  const UserApi(this.instance);

  Future<User?> signIn(final String email, final String password) async {
    final credentials = await instance.signInWithEmailAndPassword(
        email: email, password: password);
    return credentials.user;
  }

  Future<User?> register(final String email, final String password) async {
    final credentials = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return credentials.user;
  }

  Future<void> signOut() async {
    await instance.signOut();
  }
}
