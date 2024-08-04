import 'package:spotify_clone/common/helpers/dark_mode.dart';
import 'package:spotify_clone/common/widget/app_bar/app_bar.dart';
import 'package:spotify_clone/presentation/pages/home/widget/news_songs.dart';

import '../../../../common/common_import.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _homeTopCard(),
            _tab(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                NewsSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return SizedBox(
      height: 188,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.homeTopCard),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 45.0),
              child: Image.asset(AppImages.homeArtist),
            ),
          )
        ],
      ),
    );
  }

  Widget _tab() {
    return TabBar(
        controller: _tabController,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
        tabs: [
          Text(
            'News',
          ),
          Text(
            'Videos',
          ),
          Text(
            'Artist',
          ),
          Text(
            'Podcasts',
          ),
        ]);
  }
}
