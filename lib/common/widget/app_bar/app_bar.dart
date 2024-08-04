import 'package:spotify_clone/common/helpers/dark_mode.dart';

import '../../common_import.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
  });

  final Widget? title;
  final bool? hideBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hideBack!
          ? null
          : IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
