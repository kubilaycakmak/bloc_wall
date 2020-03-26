import 'package:bloc_wall/ui/style/color.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class ParallaxCards extends StatelessWidget {
  ParallaxCards({
    @required this.item,
    @required this.pageVisibility,
  });

  final ParallaxCardItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          5.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    var categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GradientText(
          item.body,
          shaderRect: Rect.fromLTWH(0.0, 0.0, 10.0, 10.0),
          style: TextStyle(color: Colors.white, fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
    );

    var titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: GradientText(
          item.title,
          shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
          gradient: Gradients.haze,
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Positioned(
      bottom: 50.0,
      left: 10.0,
      right: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Container(
      color: item.colors,
      child: Image.asset(
        item.imagePath,
        fit: BoxFit.cover,
        alignment: FractionalOffset(
          0.5 + (pageVisibility.pagePosition / 3),
          0.5,
        ),
      ),
    );

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            MyColors.black,
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 10.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              imageOverlayGradient,
              _buildTextContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  bool isThemeCurrentlyDark(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}

class ParallaxCardItem {
  ParallaxCardItem({
    this.imageType,
    this.title,
    this.colors,
    this.content,
    this.body,
    this.editCho,
    this.imagePath,
  });
  final String imageType;
  final Color colors;
  final String content;
  final bool editCho;
  final String title;
  final String body;
  final String imagePath;
}

/// A function that builds a [PageView] lazily.
typedef PageView PageViewBuilder(
    BuildContext context, PageVisibilityResolver visibilityResolver);

/// A class that can be used to compute visibility information about
/// the current page.
class PageVisibilityResolver {
  PageVisibilityResolver({
    ScrollMetrics metrics,
    double viewPortFraction,
  })  : this._pageMetrics = metrics,
        this._viewPortFraction = viewPortFraction;

  final ScrollMetrics _pageMetrics;
  final double _viewPortFraction;

  /// Calculates visibility information for the page at [pageIndex].
  /// Used inside PageViews' itemBuilder, but can be also used in a
  /// simple PageView that simply has an array of children passed to it.
  PageVisibility resolvePageVisibility(int pageIndex) {
    final double pagePosition = _calculatePagePosition(pageIndex);
    final double visiblePageFraction =
        _calculateVisiblePageFraction(pageIndex, pagePosition);

    return PageVisibility(
      visibleFraction: visiblePageFraction,
      pagePosition: pagePosition,
    );
  }

  double _calculateVisiblePageFraction(int index, double pagePosition) {
    if (pagePosition > -1.0 && pagePosition <= 1.0) {
      return 1.0 - pagePosition.abs();
    }

    return 0.0;
  }

  double _calculatePagePosition(int index) {
    final double viewPortFraction = _viewPortFraction ?? 1.0;
    final double pageViewWidth =
        (_pageMetrics?.viewportDimension ?? 1.0) * viewPortFraction;
    final double pageX = pageViewWidth * index;
    final double scrollX = (_pageMetrics?.pixels ?? 0.0);
    final double pagePosition = (pageX - scrollX) / pageViewWidth;
    final double safePagePosition = !pagePosition.isNaN ? pagePosition : 0.0;

    if (safePagePosition > 1.0) {
      return 1.0;
    } else if (safePagePosition < -1.0) {
      return -1.0;
    }

    return safePagePosition;
  }
}

/// A class that contains visibility information about the current page.
class PageVisibility {
  PageVisibility({
    @required this.visibleFraction,
    @required this.pagePosition,
  });

  /// How much of the page is currently visible, between 0.0 and 1.0.
  ///
  /// For example, if only the half of the page is visible, the
  /// value of this is going to be 0.5.
  ///
  /// This doesn't contain information about where the page is
  /// disappearing to or appearing from. For that, see [pagePosition].
  final double visibleFraction;

  /// Tells the position of this page, relative to being visible in
  /// a "non-dragging" position, between -1.0 and 1.0.
  ///
  /// For example, if the page is fully visible, this value equals 0.0.
  ///
  /// If the page is fully out of view on the right, this value is
  /// going to be 1.0.
  ///
  /// Likewise, if the page is fully out of view, on the left, this
  /// value is going to be -1.0.
  final double pagePosition;
}

/// A widget for getting useful information about a pages' position
/// and how much of it is visible in a PageView.
///
/// Note: Does not transform pages in any way, but provides the means
/// to easily do it, in the form of [PageVisibility].
class PageTransformer extends StatefulWidget {
  PageTransformer({
    @required this.pageViewBuilder,
  });

  final PageViewBuilder pageViewBuilder;

  @override
  _PageTransformerState createState() => _PageTransformerState();
}

class _PageTransformerState extends State<PageTransformer> {
  PageVisibilityResolver _visibilityResolver;

  @override
  Widget build(BuildContext context) {
    final pageView = widget.pageViewBuilder(
      context,
      _visibilityResolver ?? PageVisibilityResolver(),
    );

    final controller = pageView.controller;
    final viewPortFraction = controller.viewportFraction;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        setState(() {
          _visibilityResolver = PageVisibilityResolver(
            metrics: notification.metrics,
            viewPortFraction: viewPortFraction,
          );
        });
      },
      child: pageView,
    );
  }
}

class HeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class SubHeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}
