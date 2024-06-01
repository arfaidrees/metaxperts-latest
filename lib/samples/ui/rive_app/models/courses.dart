import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/assets.dart' as app_assets;

class CourseModel {
  CourseModel(
      {this.id,
        this.title = "",
        this.subtitle = "",
        this.caption = "",
        this.color = Colors.white,
        // this.image = ""
      });

  UniqueKey? id = UniqueKey();
  String title, caption ;
  // String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
        title: "Add Shop",
        subtitle: "Click here to add your shop and provide all essential details",
        caption: "Tap it",
        color: const Color(0xFF7850F0),
       // image: app_assets.topic_1
  ),
    CourseModel(
        title: "Shop Visit",
        subtitle:
        "Click here to visit the shop and explore its products",
        caption: "Tap it",
        color: const Color(0xFFBBA6FF),),
    //  image: app_assets.topic_2),
    CourseModel(
        title: "Return Form",
        subtitle:
        "Click here to fill out the return form and provide all necessary details for processing your return efficiently.",
        caption: "Tap it",
        color: const Color(0xFF005FE7),),
  //   image: app_assets.topic_2),
    CourseModel(
        title: "Recovery",
        subtitle:
        "View your previous payment history and manage cash recovery effortlessly.",
        caption: "Tap it",
        color: const Color(0xFF6792FF),
  ),
    //image: app_assets.topic_1),
    CourseModel(
        title: "Order Booking Status",
        subtitle:
        "Track the current status of your orders, from booking to delivery, ensuring you stay updated every step of the way",
        caption: "Tap it",
        color: const Color(0xFF7850F0),),
    //   image: app_assets.topic_2),
  ];
  static List<CourseModel> courseSections = [
        CourseModel(
        title: "Booker Details",
        caption: "More Info",
        color: const Color(0xFF9CC5FF),
  ),
  // image: app_assets.topic_2),
    CourseModel(
        title: "Recovery",
        caption: "Check Current Balance",
        color: const Color(0xFF6E6AE8),),
    //     image: app_assets.topic_1),
    CourseModel(
        title: "Return Form",
        caption: "Insert Item",
        color: const Color(0xFF005FE7),),
    //  image: app_assets.topic_2),
    CourseModel(
        title: "Booking Status",
        caption: "Check Details",
        color: const Color(0xFFBBA6FF),),
    //   image: app_assets.topic_1),
  ];
}
