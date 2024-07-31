import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/common_import.dart';
import '../../intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirectToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 200, width: 200, child: SvgPicture.asset(AppVectors.logo)),
      ),
    );
  }

  Future<void> redirectToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const GetStartedPage(),
      ),
    );
  }
}
