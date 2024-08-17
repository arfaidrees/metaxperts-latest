import 'package:flutter/material.dart';
import 'courses.dart';
import 'theme.dart';
import 'vcard.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<CourseModel> _courses = CourseModel.courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: RiveAppTheme.background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 60,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _courses
                      .map(
                        (course) => Padding(
                      key: course.id,
                      padding: const EdgeInsets.all(7),
                      child: VCard(course: course),
                    ),
                  )
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 0, right: 10, bottom: 10),
                child: Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "avenir next",
                    color: RiveAppTheme.purple,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircularCard("Total Booking", "289"),
                    _buildCircularCard("Total Visit", "30"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildAudienceSatisfactionCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularCard(String title, String number) {
    return Container(
      width: 150,
      height: 190,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "avenir next",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: double.infinity,
                  child: Divider(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              _buildCircularChart(number),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularChart(String number) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: RiveAppTheme.purple,
          width: 4,
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildAudienceSatisfactionCard() {
    return Container(
      width: 170,  // Reduced the width
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Monthly Attendance",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "avenir next",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildAudienceSatisfactionChart(0.767, "76.7%"),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudienceSatisfactionChart(double percentage, String percentageText) {
    return SizedBox(
      width: 100,  // Reduced the width of the circular chart
      height: 100, // Reduced the height of the circular chart
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: percentage,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>( RiveAppTheme.purple,),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sentiment_satisfied, size: 24,   color: RiveAppTheme.purple,),  // Reduced icon size
                const SizedBox(height: 5),
                Text(
                  percentageText,
                  style: const TextStyle(
                    fontSize: 20,  // Reduced text size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
