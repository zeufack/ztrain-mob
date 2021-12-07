import 'package:shop_app/helper/response.dart';

abstract class BaseAuth {
  Stream<String> get onAuthStateChanged;
  Future<Response> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassord(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  Future<String> signInWithTweeter();
}
