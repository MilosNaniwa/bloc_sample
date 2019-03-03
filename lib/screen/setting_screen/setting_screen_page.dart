import 'package:bloc_sample/screen/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenPage extends StatefulWidget {
  final SettingScreenBloc settingScreenBloc;

  SettingScreenPage({
    @required this.settingScreenBloc,
  });

  @override
  _SettingScreenPageState createState() => _SettingScreenPageState();
}

class _SettingScreenPageState extends State<SettingScreenPage> {
  SettingScreenBloc get _settingScreenBloc => widget.settingScreenBloc;

  @override
  void initState() {
    super.initState();
    _settingScreenBloc.dispatch(
      SettingScreenStartedEvent(),
    );
  }

  @override
  void dispose() {
    _settingScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: BlocBuilder(
        bloc: _settingScreenBloc,
        builder: (
          BuildContext context,
          SettingScreenState state,
        ) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DESCRIPTION,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
