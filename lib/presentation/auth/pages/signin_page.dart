import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/common/helper/message/display_message.dart';
import 'package:movies/common/helper/navigation/app_navigation.dart';
import 'package:movies/core/configs/theme/app_colors.dart';
import 'package:movies/data/auth/models/signin_req_params.dart';
import 'package:movies/domain/auth/usecases/signin_use_case.dart';
import 'package:movies/presentation/auth/pages/signup_page.dart';
import 'package:movies/presentation/home/pages/home_page.dart';
import 'package:movies/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();

  final TextEditingController _passwordCon = TextEditingController();
  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(
              height: 30,
            ),
            _emailField(),
            const SizedBox(
              height: 20,
            ),
            _passwordField(),
            const SizedBox(
              height: 60,
            ),
            _signinButton(context),
            const SizedBox(
              height: 20,
            ),
            _signupText(context)
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUseCase>().call(
        params: SigninReqParams(
          email: _emailCon.text,
          password: _passwordCon.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemoveUntil(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(context, error);
      },
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't you have account?"),
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(context, SignupPage());
              },
          )
        ],
      ),
    );
  }
}
