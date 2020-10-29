import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:uplanit_supplier/core/models/onboard.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  User get user => firebaseAuth.currentUser;

  //Google sign in


  Future<User>googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credentials);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  // //Facebook sign in
  // Future<User> facebookSignIn() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();

  //     final FacebookAuthCredential credential =
  //         FacebookAuthProvider.credential(result.accessToken.token);

  //     UserCredential userCredential =
  //         await firebaseAuth.signInWithCredential(credential);
  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     return null;
  //   }
  // }

  Future<User> registerUserWithEmailAndPassword(
      {String displayName, String email, String password}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user.updateProfile(displayName: displayName);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Firebase exception: ${e.message}';
      return null;
    }
  }

  Future<String> loginWithEmailAndPassword(email, password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }
}
