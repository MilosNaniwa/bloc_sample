import 'package:bloc_sample/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenPage extends StatefulWidget {
  @override
  _SettingScreenPageState createState() => _SettingScreenPageState();
}

class _SettingScreenPageState extends State<SettingScreenPage>
    with AutomaticKeepAliveClientMixin {
  static SettingScreenBloc _bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc = SettingScreenBloc();
    _bloc.dispatch(
      OnRequestInitializingEvent(),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is InitializedState) {
          _bloc.dispatch(
            OnCompleteRenderingEvent(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "description",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
