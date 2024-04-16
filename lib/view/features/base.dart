import 'package:flutter/material.dart';
import 'package:movies_app/view/features/browse/views/browseScreen.dart';
import 'package:movies_app/view/features/home/views/home_screen.dart';
import 'package:movies_app/view/features/search/views/search_screen.dart';
import 'package:movies_app/view/features/watchlist/views/watchlistScreen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> tabs = const [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_sharp,
                  size: 28,
                ),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/pics/browse.png')),
                label: 'BROWSE'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/pics/watchlist.png')),
                label: 'WATCHLIST'),
          ]),
    );
  }
}
