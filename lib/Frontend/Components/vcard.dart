import 'package:flutter/material.dart';
import '../Views/add_shop_screen.dart';
import '../Views/shop_visit_screen.dart';
import 'courses.dart';
import '../Views/order_booking_status.dart';
import '../Views/recovery.dart';
import '../Views/return_form.dart';

class VCard extends StatefulWidget {
  const VCard({Key? key, required this.course}) : super(key: key);

  final CourseModel course;

  @override
  _VCardState createState() => _VCardState();
}

class _VCardState extends State<VCard> {

  @override
  Widget build(BuildContext context) {
    int avatarIndex = widget.course.avatarIndex;

    return GestureDetector(
      onTap: () => _navigateToPage(context, widget.course.title),
      child: Container(
        width: 88,
        height: 90,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.course.color, widget.course.color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.course.color.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: widget.course.color.withOpacity(0.3),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 9),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                _getAvatarImagePath(avatarIndex),
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.course.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9,
                fontFamily: "avenir next",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.course.subtitle ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 9,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.course.caption.toUpperCase(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 7,
                fontFamily: "avenir next",
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String title) {
    switch (title) {
      case "Add Shop":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddShopScreen()),
        );
        break;
      case "Shop Visit":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopVisitScreen()),
        );
        break;
      case "Return Form":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReturnForm()),
        );
        break;
      case "Recovery":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Recovery()),
        );
        break;
      case "Booking Status":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderBookingStatus()),
        );
        break;
    }
  }

  String _getAvatarImagePath(int index) {
    switch (index) {
      case 0:
        return "assets/samples/ui/rive_app/images/avatars/addshop.png";
      case 1:
        return "assets/samples/ui/rive_app/images/avatars/avatar_2.png";
      case 2:
        return "assets/samples/ui/rive_app/images/avatars/avatar_3.png";
      case 3:
        return "assets/samples/ui/rive_app/images/avatars/avatar_1.png";
      default:
        return "assets/samples/ui/rive_app/images/avatars/avatar_4.png";
    }
  }
}


