import 'package:bloc_sample/screen/content_screen/content_screen_view.dart';
import 'package:bloc_sample/screen/setting_screen/setting_screen_view.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static const String CONTENT = "コンテンツ";
  static const String SETTING = "設定";

  int _page = 0;

  static PageController _pageController;
  static ContentScreenView _contentScreenView;
  static SettingScreenView _settingScreenView;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _contentScreenView = ContentScreenView();
    _settingScreenView = SettingScreenView();
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
          _contentScreenView,
          _settingScreenView,
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
