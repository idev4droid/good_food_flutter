import 'package:good_food/core/model/plan.dart';

class CategoryPlan {
  String code;
  String image;
  String name;
  String description;
  int order;
  String lowestPricePerPortion;
  List<Plan> plans;
  int defaultRecipes;
  int defaultServings;
  CategoryPlan({this.code, this.image, this.name, this.description, this.order, this.lowestPricePerPortion, this.plans, this.defaultRecipes, this.defaultServings});

  CategoryPlan.fromJson(Map<String, dynamic> json) {
    List<dynamic> plansJson = json["plans"];
    List<Plan> plansConverted = new List();
    plansJson.forEach((planJson) {
      plansConverted.add(Plan.fromJson(planJson));
    });
    plans = plansConverted;

    Map<String, dynamic> defaultConverted = json["default"];
    defaultRecipes = defaultConverted["recipes"];
    defaultServings = defaultConverted["servings"];

    code = json["code"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    order = json["order"];
    lowestPricePerPortion = json["lowest_price_per_portion"];
  }
}