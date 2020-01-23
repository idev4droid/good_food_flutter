import 'package:flutter/material.dart';
import 'package:good_food/core/enums/viewState.dart';
import 'package:good_food/core/model/categoryPlan.dart';
import 'package:good_food/core/viewmodel/dinnerViewModel.dart';
import 'package:good_food/ui/base/baseView.dart';
import 'package:good_food/ui/menu/dinner/dinnerScrollChildWidget.dart';
import 'package:good_food/ui/theme/theme.dart';
import 'package:good_food/ui/toolbox/cardScrollWidget.dart';

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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Text("WHAT'S ON THE MENU THIS WEEK?",
                style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        DinnerMenuItem(model.dinnerPlans.classic),
        DinnerMenuItem(model.dinnerPlans.clean15),
        DinnerMenuItem(model.dinnerPlans.rapido),
        DinnerMenuItem(model.dinnerPlans.family),
        DinnerMenuItem(model.dinnerPlans.vegetarian)
      ],
    );
  }

  Widget buildViewStateBusyWidget() =>
      Center(child: CircularProgressIndicator());
}

class DinnerMenuItem extends StatefulWidget {
  final CategoryPlan categoryPlan;

  const DinnerMenuItem(this.categoryPlan);

  DinnerMenuItemState createState() => DinnerMenuItemState(categoryPlan);
}

class DinnerMenuItemState extends State<DinnerMenuItem> {
  final CategoryPlan categoryPlan;
  var recipes;
  var cardAspectRatio = 12.0 / 16.0;
  var currentPage;

  DinnerMenuItemState(this.categoryPlan) {
    recipes = categoryPlan.recipes;
    currentPage = recipes.length - 1.0;
  }

  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: recipes.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(categoryPlan.name,
                  style: TextStyle(color: PRIMARY_COLOR, fontSize: 20.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(categoryPlan.description,
                  style: TextStyle(color: TEXT_COLOR, fontSize: 15.0)),
            ),
          ),
          Stack(
            children: <Widget>[
              CardScrollWidget(currentPage, cardAspectRatio, recipes,
                  DinnerScrollChildWidget()),
              Positioned.fill(
                child: PageView.builder(
                  itemCount: recipes.length,
                  controller: pageController,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
