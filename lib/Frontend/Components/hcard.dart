import 'package:flutter/material.dart';

import 'courses.dart';


class HCard extends StatelessWidget {
  const HCard({Key? key, required this.section}) : super(key: key);

  final CourseModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 80), // Reduced height for a smaller card
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Reduced padding
      decoration: BoxDecoration(
        color: section.color,
        borderRadius: BorderRadius.circular(30), // Adjusted to make cards rounder
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0), // Adjusted padding
                  child: Text(
                    section.title,
                    style: const TextStyle(
                        fontSize: 16, // Smaller font size
                        fontFamily: "avenir next",
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4), // Smaller space between title and caption
                Padding(
                  padding: const EdgeInsets.only(top: 4.0), // Adjusted padding
                  child: Text(
                    section.caption,
                    style: const TextStyle(
                        fontSize: 14, // Smaller font size
                        fontFamily: "avenir next",
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: VerticalDivider(thickness: 0.8, width: 0),
          ),
        ],
      ),
    );
  }
}
