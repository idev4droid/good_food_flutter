import 'dart:convert';

import 'package:good_food/core/model/dinnerPlans.dart';
import 'package:http/http.dart' as http;

class DinnerApi {
  static const endpoint = "https://www.makegoodfood.ca/plans";

  var client = new http.Client();

  Future<DinnerPlans> getDinnerPlans() async {
    var locale = "en";
    var coupon = "";
    var businessUnitCode = "dinner";
    var token = "AGMwKst00vhITQcFEedLxuxrOJivUgycO3B06nPW";
    var response = await client.get('$endpoint?locale=$locale&coupon=$coupon&businessUnitCode=$businessUnitCode&_token=$token');

    // Convert and return
    return DinnerPlans.fromJson(json.decode(response.body));
  }
}