import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/theme.dart';

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
  int avatarIndex; // Field to store avatar index or path

  static List<CourseModel> courses = [
    CourseModel(
      title: "Add Shop",
      color: RiveAppTheme.accentColor,
      avatarIndex: 0, // Specify index or path for each card
    ),
    CourseModel(
      title: "Shop Visit",
      color: RiveAppTheme.accentColor,
      avatarIndex: 1,
    ),
    CourseModel(
      title: "Return Form",
      color: RiveAppTheme.accentColor,
      avatarIndex: 2,
    ),
    CourseModel(
      title: "Recovery",
      color: RiveAppTheme.accentColor,
      avatarIndex: 3,
    ),
    CourseModel(
      title: "Booking Status",
      color: RiveAppTheme.accentColor,
      avatarIndex: 4,
    ),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
      title: "RSM - Shop Visit",
      color: RiveAppTheme.background2,
      avatarIndex: 5,
    ),
    CourseModel(
      title: "RSM - Booker Details",
      color: RiveAppTheme.background2,
      avatarIndex: 6,
    ),
    CourseModel(
      title: "RSM - Shop Details",
      color: RiveAppTheme.background2,
      avatarIndex: 7,
    ),
    CourseModel(
      title: "RSM - Booking Details",
      color: RiveAppTheme.background2,
      avatarIndex: 8,
    ),
  ];
}