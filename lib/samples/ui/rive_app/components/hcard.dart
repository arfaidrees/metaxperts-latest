import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/courses.dart';

class HCard extends StatelessWidget {
  const HCard({Key? key, required this.section}) : super(key: key);

  final CourseModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 110),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: section.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0), // Added padding
                  child: Text(
                    section.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "avenir next",
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Added padding
                  child: Text(
                    section.caption,
                    style: const TextStyle(
                        fontSize: 17, fontFamily: "avenir next", color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: VerticalDivider(thickness: 0.8, width: 0),
          ),
          // p Image.asset(section.image)
        ],
      ),
    );
  }
}
