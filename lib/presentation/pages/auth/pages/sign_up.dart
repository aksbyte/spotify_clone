import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/common/widget/app_bar/app_bar.dart';
import 'package:spotify_clone/common/widget/custom_snack_bar.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/sign_up.dart';
import 'package:spotify_clone/presentation/pages/auth/pages/sign_in.dart';
import 'package:spotify_clone/presentation/pages/home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';

import '../../../../common/common_import.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(
                height: 40,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 20,
              ),
              _emailField(context),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                      fullName: _fullNameController.text.toString(),
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString(),
                    ));
                    result.fold((l) {
                      showSnack(context: context, content: l);
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    });
                  },
                  title: 'Create Account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      textAlign: TextAlign.center,
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullNameController,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>  SignInPage(),
                    ));
              },
              child: const Text('Sign In'))
        ],
      ),
    );
  }
}
