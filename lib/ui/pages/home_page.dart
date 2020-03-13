import 'dart:ui';

import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();
  AssetImage latest = AssetImage('assets/latest.jpg');
  AssetImage popular = AssetImage('assets/popular.jpg');
  AssetImage random = AssetImage('assets/random.jpg');
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(PhotoRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                buildPreferredSize(),
                SizedBox(
                  height: 20,
                ),
                _buildBlocBuilder(),
              ],
            ),
            _buildNavBar(),
          ],
        ),
      ),
    );
  }

  Widget buildPreferredSize() {
    return Container(
      height: 110,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 15,
          offset: Offset(0, 10),
        )
      ]),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: SearchBar(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          )),
    );
  }

  BlocBuilder<PhotoBloc, PhotoState> _buildBlocBuilder() {
    return BlocBuilder<PhotoBloc, PhotoState>(
      bloc: _photoBloc,
      builder: (context, state) {
        if (state is PhotoIsNotList) {
          return _buildBody();
        }
        if (state is PhotoIsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PhotoIsLoaded) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                child: Image.network(
                  state.getPhoto.hits[index].previewURL,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }
        return Text('error');
      },
    );
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
            height: 200,
            child: PageView(
              onPageChanged: (value) {},
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCard(latest, 'Latest'),
                _buildCard(popular, 'Popular'),
                _buildCard(random, 'Random'),
              ],
            ))
      ],
    );
  }

  Widget _buildNavBar() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.white.withOpacity(0.0),
            height: 90,
            child: FloatingActionButton.extended(
              elevation: 15,
              backgroundColor: Colors.white,
              onPressed: null,
              label: ButtonBar(
                buttonPadding: EdgeInsets.symmetric(horizontal: 20),
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    minRadius: 20,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _selected = 0;
                        });
                      },
                      child: Icon(_selected == 0 ? EvaIcons.home : EvaIcons.homeOutline, size: 35, color: _selected == 0 ? Colors.black : Colors.black54,),
                    ),
                  ),
                  CircleAvatar(
                    minRadius: 20,
                    backgroundColor: Colors.transparent,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _selected = 1;
                        });
                      },
                      child: Icon(_selected == 1 ? EvaIcons.heart : EvaIcons.heartOutline, size: 35,color: _selected == 1 ? Colors.black : Colors.black54,),
                    ),
                  ),
                  CircleAvatar(
                    minRadius: 20,
                    backgroundColor: Colors.transparent,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _selected = 2;
                        });
                      },
                      child: Icon(_selected == 2 ? EvaIcons.info : EvaIcons.infoOutline, size: 35,color: _selected == 2 ? Colors.black : Colors.black54,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard(AssetImage image, String title) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        onTap: () {
          print('asd');
        },
        child: Card(
          elevation: 10,
          child: Stack(
            children: <Widget>[
              Image(
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.fitWidth,
                image: image,
                alignment: Alignment.center,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
