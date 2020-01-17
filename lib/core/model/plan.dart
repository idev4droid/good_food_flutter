import 'package:good_food/core/model/serving.dart';

class Plan {
  int nbRecipes;
  List<Serving> servings;
  Plan({this.nbRecipes, this.servings});

  Plan.fromJson(Map<String, dynamic> json) {
    List<dynamic> servingsJson = json["servings"];
    List<Serving> servingsConverted = new List();
    servingsJson.forEach((servingJson) {
      servingsConverted.add(Serving.fromJson(servingJson));
    });
    servings = servingsConverted;

    nbRecipes = json["nb_recipes"];
  }
}