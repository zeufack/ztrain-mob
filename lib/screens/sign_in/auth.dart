import 'package:shop_app/helper/response.dart';
import 'package:shop_app/screens/sign_in/abstract_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((User user) => user?.uid);

  @override
  Future<String> createUserWithEmailAndPassord(
      String email, String password) async {
    return (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  @override
  Future<String> currentUser() async {
    return (await _firebaseAuth.currentUser).uid;
  }

  @override
  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      String userId = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user.uid);
      return Response(message: "connection OK", status: 200, data: userId);
    } on FirebaseAuthException catch (e) {
      return Response(
          message: "connection faild",
          status: 400,
          error: "email ou mot de passe incorrect");
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _auth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _auth.accessToken, idToken: _auth.idToken);

    return (await _firebaseAuth.signInWithCredential(credential)).user.uid;
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<String> signInWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithTweeter() {
    throw UnimplementedError();
  }
}
