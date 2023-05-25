import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/constants/constants.dart';
import 'package:spotify/data%20screen/datascreen.dart';
import 'package:spotify/reusable_widgets/appbar.dart';
import 'package:spotify/reusable_widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  void onBottomTab(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _page == 0 ? AppBarClass.homeScreenAppBar() : null,
      body: IndexedStack(index: _page, children: DataWidgets.dataWidgets),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: whiteColor,
        onTap: onBottomTab,
        currentIndex: _page,
        items: [
          bottomNavigationBarItem(
              icon: _page == 0
                  ? IconConstants.homeFilledIcon
                  : IconConstants.homeOutlinedIcon,
              label: StringConstants.home,
              page: _page == 0 ? true : false),
          bottomNavigationBarItem(
              icon: IconConstants.searchIcon,
              label: StringConstants.search,
              page: _page == 1 ? true : false),
          bottomNavigationBarItem(
              icon: IconConstants.libraryIcon,
              label: StringConstants.library,
              page: _page == 2 ? true : false),
        ],
      ),
    );
  }
}
