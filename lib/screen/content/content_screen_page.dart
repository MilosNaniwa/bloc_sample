import 'package:bloc_sample/screen/content/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentScreenPage extends StatefulWidget {
  @override
  _ContentScreenPageState createState() => _ContentScreenPageState();
}

class _ContentScreenPageState extends State<ContentScreenPage>
    with AutomaticKeepAliveClientMixin {
  static ContentScreenBloc _bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc = ContentScreenBloc();
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
          title: Text("Content"),
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
