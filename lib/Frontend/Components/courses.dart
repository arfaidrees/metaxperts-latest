import 'package:flutter/material.dart';
import 'package:flutter_samples/Frontend/Components/theme.dart';

class CourseModel {
  CourseModel({
    this.id,
    this.title = "",
    this.subtitle = "",
    this.caption = "",
    this.color = Colors.white,
    this.avatarIndex = 0, // Add this field
  });

  UniqueKey? id = UniqueKey();
  String title, caption;
  String? subtitle;
  Color color;
  int avatarIndex;

  static List<CourseModel> courses = [
    CourseModel(
      title: "Add Shop",
      color: RiveAppTheme.white,
      avatarIndex: 0, // Specify index or path for each card
    ),
    CourseModel(
      title: "Shop Visit",
      color: RiveAppTheme.white,
      avatarIndex: 1,
    ),
    CourseModel(
      title: "Return Form",
      color: RiveAppTheme.white,
      avatarIndex: 2,
    ),
    CourseModel(
      title: "Recovery",
      color: RiveAppTheme.white,
      avatarIndex: 3,
    ),
    CourseModel(
      title: "Booking Status",
      color: RiveAppTheme.white,
      avatarIndex: 4,
    ),
  ];

}