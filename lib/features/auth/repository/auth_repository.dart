//logic for firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f35/core/constants/firebase_constants.dart';
import 'package:f35/core/providers/firebase_providers.dart';
import 'package:f35/features/auth/screens/loginScreen.dart';
import 'package:f35/home/screens/homepage.dart';
import 'package:f35/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = (await googleUser?.authentication);

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? 'untitled',
            email: userCredential.user!.email ?? 'null',
            isVet: false,
            uid: userCredential.user!.uid,
            isAuthenticated: true);

        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      }

      print(userCredential.user?.email);
    } catch (E) {
      print("google sign in başarısız");
    }
  } // end-of-signInWithGoogle

  void signUpWithEmail(String emailAddress, String password, String name,
      BuildContext context) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UserModel userModel;
      userModel = UserModel(
        name: name,
        email: emailAddress,
        isVet: false,
        uid: credential.user!.uid,
        isAuthenticated: true,
      );

      await _users.doc(credential.user!.uid).set(userModel.toMap());

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));

      print('succesful email password signup');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  } // end-of-signUpWithEmail

  void signInWithEmail(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  } // end-of-signInWithEmail

  void signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  } // end-of-signInAnonymously

  void resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  } // end-of-resetPassword

  void signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  } // end-of-signOut
}
