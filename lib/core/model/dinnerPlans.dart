import 'package:good_food/core/model/categoryPlan.dart';

class DinnerPlans {
  CategoryPlan classic;
  CategoryPlan vegetarian;
  CategoryPlan rapido;
  CategoryPlan clean15;
  CategoryPlan family;
  DinnerPlans({this.classic, this.vegetarian, this.rapido, this.clean15, this.family});

  DinnerPlans.fromJson(Map<String, dynamic> json) {
    classic = CategoryPlan.fromJson(json["classic"]);
    vegetarian = CategoryPlan.fromJson(json["vegetarian"]);
    rapido = CategoryPlan.fromJson(json["rapido"]);
    clean15 = CategoryPlan.fromJson(json["clean15"]);
    family = CategoryPlan.fromJson(json["family"]);
  }
}