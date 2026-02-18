import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories =[];
    
    categories.add(
      CategoryModel(name: 'Applied', iconPath: 'assets/icons/send.svg', boxColor: Colors.yellow)
    );

    return categories;
  }
}