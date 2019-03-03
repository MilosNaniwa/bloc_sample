import 'package:bloc_sample/screen/content_screen/content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentScreenPage extends StatefulWidget {
  final ContentScreenBloc contentScreenBloc;

  ContentScreenPage({
    @required this.contentScreenBloc,
  });

  @override
  _ContentScreenPageState createState() => _ContentScreenPageState();
}

class _ContentScreenPageState extends State<ContentScreenPage> {
  ContentScreenBloc get _contentScreenBloc => widget.contentScreenBloc;

  @override
  void initState() {
    super.initState();
    _contentScreenBloc.dispatch(
      ContentScreenStartedEvent(),
    );
  }

  @override
  void dispose() {
    _contentScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: BlocBuilder(
        bloc: _contentScreenBloc,
        builder: (
          BuildContext context,
          ContentScreenState state,
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
