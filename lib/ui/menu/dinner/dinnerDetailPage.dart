import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:good_food/core/model/recipe.dart';
import 'package:good_food/ui/theme/theme.dart';

class DinnerDetailPage extends StatelessWidget {
  final Recipe recipe;

  DinnerDetailPage(this.recipe);

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://cdn.makegoodfood.ca/uploads/images/${recipe.hash}/${recipe
        .file}@2x_s.jpg";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 230, 230, 230)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            buildRecipeImage(imageUrl),
            buildNavBar(context),
            Positioned.fill(
              top: 240,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    buildTopBlock(),
                    buildSecondBlock(),
                    buildThirdBlock()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildThirdBlock() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                "We will send you",
                style: TextStyle(color: PRIMARY_COLOR, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSecondBlock() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                recipe.description,
                style: TextStyle(color: TEXT_COLOR, letterSpacing: 1.1),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildTopBlock() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              recipe.title,
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Text(
                recipe.title2,
                style: TextStyle(
                    color: TEXT_COLOR,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Cooking time",
                        style: TextStyle(color: TEXT_COLOR),
                      ),
                      Text(
                        recipe.prepTime.toString() + " minutes",
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Text("Servings", style: TextStyle(color: TEXT_COLOR)),
                      Text(recipe.cookingTime,
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Text("Calories", style: TextStyle(color: TEXT_COLOR)),
                      Text(recipe.calories.toString() + "/serving",
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRecipeImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) =>
          Container(
            constraints: BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter),
            ),
          ),
      placeholder: (context, url) =>
          SizedBox(
              width: 30,
              height: 30,
              child: Center(child: CircularProgressIndicator())),
    );
  }

  Widget buildNavBar(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
