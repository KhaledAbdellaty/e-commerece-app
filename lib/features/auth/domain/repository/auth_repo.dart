import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<UserCredential> loginWithGoogle();
  Future<UserCredential> loginWithFacebook();
  Future<UserCredential> createNewUser(String email, String password);
  Future<UserCredential> signInUser(String email, String password);
}
