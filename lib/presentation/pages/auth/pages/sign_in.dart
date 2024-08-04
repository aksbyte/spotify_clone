import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/common/widget/app_bar/app_bar.dart';
import 'package:spotify_clone/common/widget/custom_snack_bar.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/sign_in.dart';
import 'package:spotify_clone/presentation/pages/auth/pages/sign_up.dart';
import 'package:spotify_clone/presentation/pages/home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';
import '../../../../common/common_import.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 40,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(onPressed: () async{
              var result = await sl<SignInUseCase>().call(
                  params: SignInUserReq(
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
            }, title: 'Sign In'),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      textAlign: TextAlign.center,
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
            'Not a member ?',
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
                      builder: (context) => SignUpPage(),
                    ));
              },
              child: const Text('Register Now'))
        ],
      ),
    );
  }
}
