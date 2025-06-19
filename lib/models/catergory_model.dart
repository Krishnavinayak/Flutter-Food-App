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
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad', 
        iconPath: 'assets/icons/plt.png', 
        boxColor: Color(0xffC58BF2))
    );

    categories.add(
      CategoryModel(
        name: 'Cake', 
        iconPath: 'assets/icons/ca.jpg', 
        boxColor: Color(0xffC58BF2))
    );

    categories.add(
      CategoryModel(
        name: 'pie', 
        iconPath: 'assets/icons/pi.jpg', 
        boxColor: Color(0xffC58BF2))
    );

    return categories;
  }
 }