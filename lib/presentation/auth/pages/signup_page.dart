import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/common/helper/navigation/app_navigation.dart';
import 'package:movies/core/configs/theme/app_colors.dart';
import 'package:movies/data/auth/models/signup_req_params.dart';
import 'package:movies/domain/auth/usecases/signup_use_case.dart';
import 'package:movies/presentation/auth/pages/signin_page.dart';
import 'package:movies/presentation/home/pages/home_page.dart';
import 'package:movies/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../common/helper/message/display_message.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100,right:16,left:16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            const SizedBox(height: 30,),
            _emailField(),
            const SizedBox(height: 20,),
            _passwordField(),
            const SizedBox(height: 60,),
            _signupButton(context),
            const SizedBox(height: 20,),
            _signinText(context)
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Email'
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Password'
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async => sl < SignupUseCase > ().call(
        params: SignupReqParams(
          email: _emailCon.text,
          password: _passwordCon.text
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemoveUntil(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(context, error);
      }
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Do you have account?"
          ),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(
              color: Colors.blue
            ),
            recognizer: TapGestureRecognizer()..onTap=(){
              AppNavigation.push(context, SigninPage());
            }
          )
        ]
      )
    );
  }
}