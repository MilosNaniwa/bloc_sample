import 'package:bloc_sample/screen/content_screen/content_screen.dart';
import 'package:flutter/material.dart';

class ContentScreenView extends StatefulWidget {
  @override
  _ContentScreenViewState createState() => _ContentScreenViewState();
}

class _ContentScreenViewState extends State<ContentScreenView> {
  static ContentScreenBloc _contentScreenBloc;

  @override
  void initState() {
    super.initState();
    _contentScreenBloc = ContentScreenBloc();
  }

  @override
  void dispose() {
    _contentScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentScreenPage(
      contentScreenBloc: _contentScreenBloc,
    );
  }
}
