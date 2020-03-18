import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/pages/video/video_bloc.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class HomeVideoPage extends StatefulWidget {
  @override
  _HomeVideoPageState createState() => _HomeVideoPageState();
}

class _HomeVideoPageState extends State<HomeVideoPage> {
  final _videoBloc = kiwi.Container().resolve<VideoBloc>();
  String globalSearchQuery = '';

  @override
  void dispose() {
    super.dispose();
    _videoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(ApiRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
            SafeArea(child: SearchBar(title: 'video',)),
          ],
        ),
      ),
    );
  }

  BlocBuilder<VideoBloc, VideoState> _buildBlocBuilder() {
    return BlocBuilder<VideoBloc, VideoState>(
      bloc: _videoBloc,
      builder: (context, state) {
        if (state is VideoInitial) {
          return _buildListBody();
        }
        if (state is VideoIsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is VideoIsLoaded) {
          return Text('heyyo');
        }
        if(state is VideoIsNotLoaded){
        }
        return Center(child: Text('error'));
      },
    );
  }

  Widget _buildListBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[

        ],
      ),
    );
  }

}
