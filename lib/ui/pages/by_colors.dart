import 'package:bloc_wall/ui/pages/static_data/data_lists.dart';
import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  final List<ParallaxCardItem> list;
  final title;

  const ViewAll({Key key, this.list, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 16 / 9,
              children: List.generate(list.length, (index) {
                return Stack(
                  children: <Widget>[
                    ParallaxCards(
                      item: ParallaxCardItem(
                          colors: list[index].colors,
                          imagePath: list[index].imagePath,
                          body: list[index].body,
                          title: list[index].title),
                      pageVisibility:
                          PageVisibility(pagePosition: 0, visibleFraction: 1),
                    ),
                  ],
                );
              }))
        ],
      ),
    );
  }
}
