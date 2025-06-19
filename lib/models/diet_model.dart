 import 'package:flutter/material.dart';
class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  Color boxColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor
  });

  static List <DietModel> getDiets(){
    List <DietModel> diets = [];

    diets.add(
      DietModel(name: 'Honey Pancake', 
              iconPath: 'assets/icons/pancake.svg',
              level: 'Easy', 
              duration: '30 mins', 
              calorie: '190kcal', 
              viewIsSelected: true,
              boxColor: Color(0xffC58BF2))
    );

    diets.add(
      DietModel(name: 'Bread', 
              iconPath: 'assets/icons/bread.svg',
              level: 'Easy', 
              duration: '20 mins', 
              calorie: '100kcal', 
              viewIsSelected: false,
              boxColor: Color(0xffC58BF2))
    );
  return diets;
  }
}