import 'package:f35/features/auth/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));

class AuthController {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }

  void signUpWithEmail(
      {required String emailAddress,
      required String password,
      required String name,
      required BuildContext context}) {
    _authRepository.signUpWithEmail(emailAddress, password, name, context);
  }

  void signInWithEmail(
      {required String emailAddress,
      required String password,
      required BuildContext context}) {
    _authRepository.signInWithEmail(emailAddress, password, context);
  }

  void signInAnonymously() {
    _authRepository.signInAnonymously();
  }

  void resetPassword({required String email}) {
    _authRepository.resetPassword(email);
  }

  void signOut(BuildContext context) {
    _authRepository.signOut(context);
  }
}
