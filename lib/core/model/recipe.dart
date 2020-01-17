import 'package:good_food/core/model/categoryPlan.dart';

class Recipe {
  int id;
  String hash;
  String title;
  String createdAt;
  String updatedAt;
  String titleFr;
  String slug;
  String slugFr;
  String allergens;
  String allergensFr;
  int copyOfRecipeId;
  int weekNumber;
  String file;
  String descriptionFr;
  String description;
  int orderNumberInternal;
  String packingSheetReferenceSingle;
  String packingSheetReferenceDouble;
  String packingSheetCommentSingle;
  String packingSheetCommentDouble;
  String title2Fr;
  String title2;
  String recipeType;
  int planTypeId;
  int prepTime;
  String cookingTime;
  int calories;
  int totalFat;
  int saturatedFat;
  int sodium;
  int totalCarbs;
  int sugars;
  int protein;
  int fibers;
  String fileIngred;
  bool isQuick;
  bool isBbq;
  bool isSpicy;
  bool isOnePot;
  bool isLactoseFree;
  bool isGlutenFree;
  bool isEasyPrep;
  bool isClean15;
  bool isFoodProcessorNeeded;
  bool isKeto;
  bool isFavourite;
  bool isPremium;
  bool isReadyToEat;
  bool isTaxable;
  bool isNew;
  bool isKidApproved;
  bool isBestSeller;
  bool isCaffeine;
  bool isProtein10g;
  bool isCold;
  bool isHot;
  bool isHotOrCold;
  bool isSmoothie;
  bool isOatBowl;
  bool isOmelette;
  bool is4Minutes;
  bool isDoubleEgg;
  bool isGranola;
  bool isCoffee;
  bool isMuffin;
  bool isPastry;
  bool isPancake;
  bool isBreakfastStandalone;
  int premiumPrice;
  String productId;
  String orderNumber;
  String weekDate;
  bool isPerPacks;
  String links;
  CategoryPlan categoryPlan;
  Recipe({this.id, this.hash, this.title, this.createdAt, this.updatedAt, this.titleFr, this.slug, this.slugFr, this.allergens, this.allergensFr, this.copyOfRecipeId, this.weekNumber, this.file, this.descriptionFr, this.description, this.orderNumberInternal, this.packingSheetReferenceSingle, this.packingSheetReferenceDouble, this.packingSheetCommentSingle, this.packingSheetCommentDouble, this.title2Fr, this.title2, this.recipeType, this.planTypeId, this.prepTime, this.cookingTime, this.calories, this.totalFat, this.saturatedFat, this.sodium, this.totalCarbs, this.sugars, this.protein, this.fibers, this.fileIngred, this.isQuick, this.isBbq, this.isSpicy, this.isOnePot, this.isLactoseFree, this.isGlutenFree, this.isEasyPrep, this.isClean15, this.isFoodProcessorNeeded, this.isKeto, this.isFavourite, this.isPremium, this.isReadyToEat, this.isTaxable, this.isNew, this.isKidApproved, this.isBestSeller, this.isCaffeine, this.isProtein10g, this.isCold, this.isHot, this.isHotOrCold, this.isSmoothie, this.isOatBowl, this.isOmelette, this.is4Minutes, this.isDoubleEgg, this.isGranola, this.isCoffee, this.isMuffin, this.isPastry, this.isPancake, this.isBreakfastStandalone, this.premiumPrice, this.productId, this.orderNumber, this.weekDate, this.isPerPacks, this.links, this.categoryPlan});

  Recipe.fromJson(Map<String, dynamic> json) {

    this.id = json["id"];
    this.hash = json["hash"];
    this.slug = json["slug"];
    this.slugFr = json["slug_fr"];
    this.weekNumber = json["week_number"];
    this.weekDate = json["week_date"];
    this.orderNumber = json["order_number"];
    this.orderNumberInternal = json["order_number_internal"];
    this.planTypeId = json["plan_type_id"];
    this.productId = json["product_id"];

    this.file = json["file"];
    this.fileIngred = json["file_ingred"];
    this.copyOfRecipeId = json["copy_of_recipe_id"];

    this.packingSheetReferenceSingle = json["packingsheet_reference_single"];
    this.packingSheetReferenceDouble = json["packingsheet_reference_double"];
    this.packingSheetCommentSingle = json["packingsheet_comment_single"];
    this.packingSheetCommentDouble = json["packingsheet_comment_double"];

    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];

    this.links = json["links"]["self"]["href"];

    this.title = json["title"];
    this.titleFr = json["title_fr"];
    this.title2 = json["title2_en"];
    this.title2Fr = json["title2_fr"];
    this.description = json["desc_en"];
    this.descriptionFr = json["desc_fr"];
    this.recipeType = json["recipe_type"];

    this.allergens = json["allergens_en"];
    this.allergensFr = json["allergens_fr"];
    this.prepTime = json["prep_time"];
    this.cookingTime = json["cooking_time"];
    this.premiumPrice = json["premium_price"];

    this.calories = json["calories"];
    this.totalFat = json["total_fat"];
    this.saturatedFat = json["saturated_fat"];
    this.sodium = json["sodium"];
    this.totalCarbs = json["total_carbs"];
    this.sugars = json["sugars"];
    this.protein = json["protein"];
    this.fibers = json["fibres"];

    this.isQuick = getBool(json, "is_quick");
    this.isBbq = getBool(json, "is_bbq");
    this.isSpicy = getBool(json, "is_spicy");
    this.isOnePot = getBool(json, "is_one_pot");
    this.isLactoseFree = getBool(json, "is_lactose_free");
    this.isGlutenFree = getBool(json, "is_gluten_free");
    this.isEasyPrep = getBool(json, "is_easy_prep");
    this.isClean15 = getBool(json, "is_clean15");
    this.isFoodProcessorNeeded = getBool(json, "is_food_processor_needed");
    this.isKeto = getBool(json, "is_keto");
    this.isFavourite = getBool(json, "is_favourite");
    this.isPremium = getBool(json, "is_premium");
    this.isReadyToEat = json["is_ready_to_eat"];
    this.isTaxable = getBool(json, "is_taxable");
    this.isNew = getBool(json, "is_new");
    this.isKidApproved = getBool(json, "is_kid_approved");
    this.isBestSeller = getBool(json, "is_best_seller");
    this.isCaffeine = getBool(json, "is_caffeine");
    this.isProtein10g = getBool(json, "is_protein_10g");
    this.isCold = getBool(json, "is_cold");
    this.isHot = getBool(json, "is_hot");
    this.isHotOrCold = getBool(json, "is_hot_or_cold");
    this.isSmoothie = getBool(json, "is_smoothie");
    this.isOatBowl = getBool(json, "is_oatbowl");
    this.isOmelette = getBool(json, "is_omelette");
    this.is4Minutes = getBool(json, "is_4_minutes");
    this.isDoubleEgg = getBool(json, "is_double_egg");
    this.isGranola = getBool(json, "is_granola");
    this.isCoffee = getBool(json, "is_coffee");
    this.isMuffin = getBool(json, "is_muffin");
    this.isPastry = getBool(json, "is_pastry");
    this.isPancake = getBool(json, "is_pancake");
    this.isBreakfastStandalone = getBool(json, "is_breakfast_standalone");
    this.isPerPacks = json["is_per_packs"];
  }


}

bool getBool(Map json, String key) {
  return json[key] == 1;
}