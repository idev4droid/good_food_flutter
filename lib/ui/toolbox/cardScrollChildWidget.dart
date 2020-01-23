import 'package:flutter/material.dart';

abstract class CardScrollChildWidget {
  Widget buildMe(BuildContext context, dynamic model, double cardAspectRatio);
}