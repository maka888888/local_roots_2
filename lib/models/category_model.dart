import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  int index;
  String nameTranslated;
  IconData iconData;

  CategoryModel({
    required this.id,
    required this.index,
    required this.nameTranslated,
    required this.iconData,
  });
}
