import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/presentation/pages/choose_mode/pages/choose_mode.dart';

import '../../../../common/common_import.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.introBg), fit: BoxFit.cover),
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
                  'Enjoy Listen To Music',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lopsem porem bla! bla! bla!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey),
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                    onPressed: () {
                      try {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChooseModePage(),
                          ),
                        );
                        print('its work');
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    title: 'Get Started'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
