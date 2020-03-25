import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

import 'package:gradient_widgets/gradient_widgets.dart';

class SlidingCardsView extends StatefulWidget {
  final List<SlidingCard> list;
  final double fontSize;
  final double viewportFraction;
  final double height;

  const SlidingCardsView({Key key, this.list, this.height, this.fontSize, this.viewportFraction}) : super(key: key);
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;
  

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: widget.viewportFraction);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        itemCount: widget.list.length,
        controller: pageController,
        itemBuilder: (context, index){
          print(widget.list[0].offset);
          print('pageof = $pageOffset');
          if(pageOffset >= 2) pageOffset = 0;
          return SlidingCard(
            fontSize: widget.fontSize,
            viewportFraction: widget.viewportFraction,
            name: widget.list[index].name,
            assetName: widget.list[index].assetName,
            offset: pageOffset - widget.list[index].offset,
          );
        },
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final double fontSize;
  final String name;
  final String assetName;
  final double offset;
  final double viewportFraction;

  const SlidingCard({
    Key key,
    this.fontSize,
    this.viewportFraction,
    @required this.name,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                      'assets/$assetName',
                      height: MediaQuery.of(context).size.height * 0.5,
                      alignment: Alignment(-offset.abs(), 0),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black26,
                      fit: BoxFit.cover,
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: GradientText(
                      name,
                      shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 10.0),
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}