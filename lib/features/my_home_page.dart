import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story/common/widgets/dot_navigation_bar/DotNavigationBarItem.dart';
import 'package:story/common/widgets/dot_navigation_bar/NavBars.dart';
import 'package:story/features/home/home_provider/home_provider.dart';
import 'package:story/features/search/search_provider/search_provider.dart';
import 'package:story/features/setting/setting_provider/movie_history_provider.dart';
import 'package:story/features/setting/setting_provider/setting_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    const HomeProvider(),
    const SearchProvider(),
    MovieHistoryProvider(),
    // ComicPage(),
    const SettingProvider(),
  ];

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return PopScope(
      canPop: true,
      child: Scaffold(
        body: pages[pageIndex],
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          marginR: EdgeInsets.only(bottom: 20, left: 50, right: 50),
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          // backgroundColor: Colors.red,
          paddingR: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          enablePaddingAnimation: false,
          dotIndicatorColor: Colors.transparent,
          currentIndex: pageIndex,
          onTap: (p0) {
            onPageChanged(p0);
          },
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.purple,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
              selectedColor: Colors.pink,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.history),
              selectedColor: Colors.orange,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.settings),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
