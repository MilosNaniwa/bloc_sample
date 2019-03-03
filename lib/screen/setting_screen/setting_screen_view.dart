import 'package:bloc_sample/screen/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';

class SettingScreenView extends StatefulWidget {
  @override
  _SettingScreenViewState createState() => _SettingScreenViewState();
}

class _SettingScreenViewState extends State<SettingScreenView> {
  static SettingScreenBloc _settingScreenBloc;

  @override
  void initState() {
    super.initState();
    _settingScreenBloc = SettingScreenBloc();
  }

  @override
  void dispose() {
    _settingScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingScreenPage(
      settingScreenBloc: _settingScreenBloc,
    );
  }
}
