import 'package:flutter/material.dart';
import 'package:good_food/core/enums/viewState.dart';
import 'package:good_food/core/model/categoryPlan.dart';
import 'package:good_food/core/viewmodel/dinnerViewModel.dart';
import 'package:good_food/ui/base/baseView.dart';

class DinnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<DinnerViewModel>(
        onModelReady: (model) => model.fetchDinnerPlans(),
        builder: (context, model, child) => model.state == ViewState.Busy
            ? buildViewStateBusyWidget()
            : buildViewStateIdleWidget(model));
  }

  Widget buildViewStateIdleWidget(DinnerViewModel model) {
    return ListView(
      children: <Widget>[
        DinnerMenuItem(model.dinnerPlans.classic),
        DinnerMenuItem(model.dinnerPlans.clean15)
      ],
    );
  }

  Widget buildViewStateBusyWidget() =>
      Center(child: CircularProgressIndicator());
}

class DinnerMenuItem extends StatelessWidget {
  const DinnerMenuItem(this.categoryPlan);

  final CategoryPlan categoryPlan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(categoryPlan.code),
    );
  }
}
