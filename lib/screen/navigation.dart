import 'package:bloc_sample/screen/content/content_screen_page.dart';
import 'package:bloc_sample/screen/setting/setting_screen_page.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static const String CONTENT = "Content";
  static const String SETTING = "Setting";

  int _page = 0;

  static PageController _pageController;
  static ContentScreenPage _contentScreenPage;
  static SettingScreenPage _settingScreenPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _contentScreenPage = ContentScreenPage();
    _settingScreenPage = SettingScreenPage();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          _contentScreenPage,
          _settingScreenPage,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: _onTapBottomNavigation,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(CONTENT),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(SETTING),
          ),
        ],
      ),
    );
  }

  void _onTapBottomNavigation(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
