import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/pages/video/video_bloc.dart';
import 'package:bloc_wall/ui/pages/widget/centered_message.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class ListVideoPage extends StatefulWidget {
  final bool editorChoice;
  final String query;
  final String order;
  final String userId;
  final String videoType;
  final int minWidth;
  final int minHeight;
  final String category;

  const ListVideoPage({
    Key key,
    this.editorChoice,
    this.query,
    this.order,
    this.userId,
    this.videoType,
    this.minWidth,
    this.minHeight,
    this.category,
  }) : super(key: key);

  @override
  _ListVideoPageState createState() => _ListVideoPageState();
}

class _ListVideoPageState extends State<ListVideoPage> {
  final _videoBloc = kiwi.Container().resolve<VideoBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print('edit choice ' + widget.editorChoice.toString());
    print('category ' + widget.category);
    print('query ' + widget.query);
    print('order ' + widget.order);
    print('userId ' + widget.userId);
    print('videoType ' + widget.videoType);
    print('min ' + widget.minWidth.toString());
    print('minHeight ' + widget.minHeight.toString());
    print('----------');
    _videoBloc.add(FetchVideo(
        widget.query,
        widget.userId,
        widget.videoType,
        widget.category,
        widget.minWidth,
        widget.minHeight,
        widget.editorChoice,
        widget.order));
  }

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.category == ''
                ? '${widget.order.toUpperCase()} ${widget.query.toUpperCase()}'
                : widget.category.toUpperCase(),
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              EvaIcons.arrowBackOutline,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
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
          return CenteredMessage(
            message: 'Error while fetching photos',
            icon: EvaIcons.doneAll,
          );
        }
        if (state is VideoIsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is VideoIsLoaded) {
          return Text('compl');
        }
        return Text('error');
      },
    );
  }

  // Widget _buildGridViewList(VideoHits videoHits) {
  //   return NotificationListener<ScrollNotification>(
  //     onNotification: _handleScrollNotification,
  //     child: StaggeredGridView.countBuilder(
  //       controller: _scrollController,
  //       shrinkWrap: true,
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 1,
  //       itemCount: videoHits.length,
  //       crossAxisSpacing: 1,
  //       staggeredTileBuilder: (index) =>
  //           StaggeredTile.count(2, index.isEven ? 2 : 3),
  //       itemBuilder: (context, index) {
  //         return Stack(
  //           children: <Widget>[
  //             GridTile(
  //               footer: Container(
  //                 height: 50,
  //               ),
  //               child: GestureDetector(
  //                 onTap: () {
  //                   // Navigator.push(
  //                   //     context,
  //                   //     MaterialPageRoute(
  //                   //       builder: (context) => WallpaperPage(
  //                   //             heroId: videoAll.videoHits[index].id.toString(),
  //                   //             photoHits: videoAll.videoHits.,
  //                   //           )));
  //                 },
  //                 child: FadeInImage(
  //                   image: NetworkImage(videoAll.hits[index].videos.small.url),
  //                   fit: BoxFit.cover,
  //                   placeholder: NetworkImage(videoAll.hits[index].videos.small.url),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               alignment: Alignment.bottomCenter,
  //               child: new ClipRect(
  //                 child: new BackdropFilter(
  //                   filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //                   child: new Container(
  //                     height: 40.0,
  //                     decoration: new BoxDecoration(
  //                         color: Colors.grey.shade100.withOpacity(0.2)),
  //                     child: new Center(
  //                       child: new Text(videoAll.hits[index].user,
  //                           style: GoogleFonts.montserrat(color: Colors.white)),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         );
  //       }
  //     ),
  //   );
  // }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      print('object');
    }
    return false;
  }
}
