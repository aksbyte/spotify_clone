import 'package:spotify_clone/common/common_import.dart';

void showSnack(
    {required BuildContext context, required String content, Color? color}) {
  final snackBar = SnackBar(
    content: Text(content),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    backgroundColor: AppColors.primary,
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar,
        snackBarAnimationStyle: AnimationStyle(duration: Durations.short2));
}
