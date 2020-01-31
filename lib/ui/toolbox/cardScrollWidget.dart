import 'dart:math';

import 'package:flutter/material.dart';
import 'package:good_food/ui/toolbox/cardScrollChildWidget.dart';

/// Inspiration from
/// ui: https://dribbble.com/shots/3844950-Story-App-Concept
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var cardAspectRatio;
  List<dynamic> children;
  CardScrollChildWidget widget;
  var widgetAspectRatio;
  final padding = 20.0;
  final verticalInset = 20.0;

  CardScrollWidget(this.currentPage, this.cardAspectRatio, this.children,
      this.widget) {
    widgetAspectRatio = cardAspectRatio * 1.2;
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        double primaryCardLeft = calculatePrimaryCardLeftPosition(constraints);
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < children.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          double start = calculateStartPosition(
              primaryCardLeft, horizontalInset, delta, isOnRight);
          cardList.add(makeCardItem(delta, start, context, i));
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }

  Positioned makeCardItem(num delta, double start, BuildContext context,
      int i) {
    var cardItem = Positioned.directional(
        top: padding + verticalInset * max(-delta, 0.0),
        bottom: padding + verticalInset * max(-delta, 0.0),
        start: start,
        textDirection: TextDirection.rtl,
        child: widget.buildMe(context, children[i], cardAspectRatio));
    return cardItem;
  }

  double calculateStartPosition(double primaryCardLeft, double horizontalInset,
      num delta, bool isOnRight) {
    var start = padding +
        max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1),
            0.0);
    return start;
  }

  double calculatePrimaryCardLeftPosition(BoxConstraints constraints) {
    var width = constraints.maxWidth;
    var height = constraints.maxHeight;

    var safeWidth = width - 2 * padding;
    var safeHeight = height - 2 * padding;

    var heightOfPrimaryCard = safeHeight;
    var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

    var primaryCardLeft = safeWidth - widthOfPrimaryCard;
    return primaryCardLeft;
  }
}
