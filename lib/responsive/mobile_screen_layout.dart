import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  int _page = 0;
  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: _page == 2 ? primaryColor : secondaryColor,
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.heart_broken,
            color: _page == 3 ? primaryColor : secondaryColor,
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_alt,
            color: _page == 4 ? primaryColor : secondaryColor,
          ),
          label: " ",
        ),
      ],
      backgroundColor: mobileBackgroundColor,
      onTap: navigationTapped,
    );
  }
}
