import 'package:good_food/core/api/dinner/dinnerApi.dart';
import 'package:good_food/core/enums/viewState.dart';
import 'package:good_food/core/model/dinnerPlans.dart';
import 'package:good_food/core/viewmodel/baseModel.dart';
import 'package:good_food/locator.dart';

class DinnerViewModel extends BaseModel {
  DinnerApi dinnerApi = locator<DinnerApi>();

  DinnerPlans dinnerPlans;

  Future fetchDinnerPlans() async {
    setState(ViewState.Busy);
    dinnerPlans = await dinnerApi.getDinnerPlans();
    setState(ViewState.Idle);
  }
}