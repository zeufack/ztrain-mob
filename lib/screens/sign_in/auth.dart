import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  Future<Response> signInWithGoogle() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _auth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _auth.accessToken, idToken: _auth.idToken);

    try {
      await _firebaseAuth.signInWithCredential(credential);
      return Response(message: "connection OK", status: 200);
    } on FirebaseAuthException catch (e) {
      return Response(message: "connection faild", status: 400);
    }
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<Response> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();
    print(result.message);
    print(result.status);
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      print('----------------------ok --------------------${result}');
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return Response(message: "connection OK", status: 200);
    }
    return Response(message: "connection OK", status: 400);
    // try {
    //   final LoginResult loginResult = await FacebookAuth.instance.login();
    //   print('----------------------ok --------------------${loginResult}');
    //   // Create a credential from the access token
    //   final OAuthCredential facebookAuthCredential =
    //       FacebookAuthProvider.credential(loginResult.accessToken.token);

    //   await _firebaseAuth.signInWithCredential(facebookAuthCredential);

    //   return Response(message: "connection OK", status: 200);
    // } on FirebaseAuthException catch (e) {
    //   print('----------------------KO --------------------');
    //   return Response(message: "connection faild", status: 400);
    // }
  }

  @override
  Future<String> signInWithTweeter() {
    throw UnimplementedError();
  }

  void incorrectLogOut() async {
    try {
      await FirebaseAuth.instance.currentUser.delete();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }
}
