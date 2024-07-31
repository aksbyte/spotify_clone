import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/pages/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/pages/choose_mode/bloc/theme_cubit.dart';

import '../../../../common/common_import.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.chooseMode), fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        iconSize: 30,
                    //    color: _isClicked ? AppColors.primary : Colors.white,
                        onPressed: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);
                        },
                        icon: const Icon(Icons.sunny),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                    //   color: _isClicked ? AppColors.primary : Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        icon: const Icon(Icons.dark_mode_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignupOrSigningPage(),
                        ),
                      );
                    },
                    title: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
