import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_e_commerece_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final auth = FirebaseAuth.instance;
  @override
  Future<UserCredential> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(
        googleUser.email,
      );

      return await auth.signInWithCredential(credential);
    } on PlatformException catch (e) {
      throw Exception('Somethng went wrong with signing in with google : $e');
    }
  }

  @override
  Future<UserCredential> createNewUser(String email, String password) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return newUser;
    } on PlatformException catch (e) {
      throw Exception('Somethng went wrong with creating new user : $e');
    }
  }

  @override
  Future<UserCredential> signInUser(String email, String password) async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(
      email,
    );
    print(
      password,
    );
    return user;
  }
}
