import 'package:flutter/material.dart';
import 'package:good_food/core/model/recipe.dart';
import 'package:good_food/ui/theme/theme.dart';
import 'package:good_food/ui/toolbox/cardScrollChildWidget.dart';

class DinnerScrollChildWidget extends CardScrollChildWidget {
  @override
  Widget buildMe(BuildContext context, model, cardAspectRatio) {
    var recipe = model as Recipe;
    var imageUrl =
        "https://cdn.makegoodfood.ca/uploads/images/${recipe.hash}/${recipe.file}@2x_s.jpg";
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)
        ]),
        child: AspectRatio(
          aspectRatio: cardAspectRatio,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(imageUrl, fit: BoxFit.cover),
              buildTilesAndTitle(recipe)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTilesAndTitle(Recipe recipe) {
    if (recipe.isEasyPrep) {
      return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            buildEasyPrepTile(recipe),
            buildTitlesWithButton(recipe)
          ]
      );
    } else {
      return buildTitlesWithButton(recipe);
    }
  }

  Align buildEasyPrepTile(Recipe recipe) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container (
          decoration: BoxDecoration(
            color: PRIMARY_COLOR,
            border: Border.all(color: Colors.white, width: 2.0)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
            child: Text("EASY\nPREP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),),
          ),
        ),
      ),
    );
  }

  Align buildTitlesWithButton(Recipe recipe) {
    return Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87])),
                padding: EdgeInsets.only(top: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 2.0),
                      child: Text(recipe.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(recipe.title2,
                          style: TextStyle(
                              color: Colors.white.withAlpha(235),
                              fontSize: 14.0)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, bottom: 12.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Order this recipe",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}
