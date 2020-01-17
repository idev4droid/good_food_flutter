class Serving {
  int id;
  int nbServings;
  String businessCode;
  int businessId;
  double price;
  double pricePerPortion;
  Serving({this.id, this.nbServings, this.businessCode, this.businessId, this.price, this.pricePerPortion});

  Serving.fromJson(Map<String, dynamic> json) {
    var data = json["data"];
    id = data["id"];
    price = data["price"];
    pricePerPortion = data["price_per_portion"];

    var businessUnit = json["businessUnit"];
    businessCode = businessUnit["code"];
    businessId = businessUnit["id"];

    nbServings = json["nb_servings"];
  }
}