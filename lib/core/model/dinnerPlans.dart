import 'package:good_food/core/model/categoryPlan.dart';
import 'package:good_food/core/model/recipe.dart';

class DinnerPlans {
  CategoryPlan classic;
  CategoryPlan vegetarian;
  CategoryPlan rapido;
  CategoryPlan clean15;
  CategoryPlan family;
  DinnerPlans({this.classic, this.vegetarian, this.rapido, this.clean15, this.family});

  DinnerPlans.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> plansJson = json["plans"];
    classic = CategoryPlan.fromJson(plansJson["classic"]);
    vegetarian = CategoryPlan.fromJson(plansJson["vegetarian"]);
    rapido = CategoryPlan.fromJson(plansJson["rapido"]);
    clean15 = CategoryPlan.fromJson(plansJson["clean15"]);
    family = CategoryPlan.fromJson(plansJson["family"]);

    List<dynamic> recipesParentJson = json["recipes"];
    recipesParentJson.forEach((recipesJson) {
      String title = recipesJson["title"];
      if (title == "classic") {
        classic.recipes = fromRecipeJson(recipesJson);
      } else if (title == "rapido") {
        rapido.recipes = fromRecipeJson(recipesJson);
      } else if (title == "family") {
        family.recipes = fromRecipeJson(recipesJson);
      } else if (title == "vegetarian") {
        vegetarian.recipes = fromRecipeJson(recipesJson);
      } else if (title == "clean15") {
        clean15.recipes = fromRecipeJson(recipesJson);
      } else {
        throw new Exception("Dinner plan with title $title was not supported");
      }
    });
  }

  List<Recipe> fromRecipeJson(Map<String, dynamic> json) {
    List<dynamic> recipesJson = json["recipes"];
    List<Recipe> recipesConverted = new List();

    recipesJson.forEach((recipeJson) {
      recipesConverted.add(Recipe.fromJson(recipeJson));
    });
    return recipesConverted;
  }
}