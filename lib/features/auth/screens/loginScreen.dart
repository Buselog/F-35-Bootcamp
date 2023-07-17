import 'package:email_validator/email_validator.dart';
import 'package:f35/features/auth/controller/auth_controller.dart';
import 'package:f35/features/auth/screens/forgotPasswordScreen.dart';
import 'package:f35/features/auth/screens/registrationScreen.dart';
import 'package:f35/features/auth/screens/widgets/anonSignInButton.dart';
import 'package:f35/features/auth/screens/widgets/googleSignInButton.dart';
import 'package:f35/features/auth/screens/widgets/logInButton.dart';
import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/navigation/navigation_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  NavigationService service = NavigationService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Icon(
          Icons.pets,
          color: Pallete.whiteColor,
        ),
        backgroundColor: Pallete.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Pallete.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Pallete.primaryColor.withOpacity(0.5),
                    spreadRadius: 40,
                    blurRadius: 60,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Pallete.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ),
            ),
            // Form starts here -----------------------------------------------
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen e-posta adresinizi giriniz';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Lütfen geçerli bir e-posta adresi giriniz.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'E-posta adresi',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen şifrenizi giriniz';
                        }
                        return null;
                      },
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),

                    TextButton(
                      child: const Text(
                        "Şifremi unuttum",
                        style: TextStyle(
                          color: Pallete.primaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                    ),
                    LogInButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          ref.read(authControllerProvider).signInWithEmail(
                              emailAddress: email,
                              password: password,
                              context: context);
                          print('Login button pressed');
                          print('Email: $email');
                          print('Password: $password');
                        }
                      },
                    ),
                    //////////////////////////////////// EPOSTA LOGIN ENDS HERE
                    const SizedBox(height: 30),
                    const Row(
                      children: <Widget>[
                        Expanded(child: Divider()),
                        Text(
                          "veya şu şekilde giriş yap",
                          style: TextStyle(color: Pallete.greyColor),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const GoogleSignInButton(),
                        const Spacer(),
                        AnonSignInButton(
                          onTap: () {
                            ref
                                .read(authControllerProvider)
                                .signInAnonymously();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      child: const Text(
                        "Kayıt ol",
                        style: TextStyle(
                          color: Pallete.primaryColor,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen()));
                        // NavigationService().goBack();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
