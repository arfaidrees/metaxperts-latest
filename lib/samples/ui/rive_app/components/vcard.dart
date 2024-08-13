import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/recovery.dart';
import 'package:flutter_samples/samples/ui/rive_app/components/return_form.dart';
import 'package:flutter_samples/samples/ui/rive_app/models/courses.dart';
import 'Shopvisit.dart';
import 'add_shop_final.dart';
import 'order_booking_status.dart';

class VCard extends StatefulWidget {
  const VCard({Key? key, required this.course}) : super(key: key);

  final CourseModel course;

  @override
  State<VCard> createState() => _VCardState();
}

class _VCardState extends State<VCard> {
  @override
  Widget build(BuildContext context) {
    int avatarIndex = widget.course.avatarIndex;

    return GestureDetector(
      onTap: () => _navigateToPage(context, widget.course.title),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 180, maxHeight: 220),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.course.color, widget.course.color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.course.color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: widget.course.color.withOpacity(0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 140),
                  child: Text(
                    widget.course.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "avenir next",
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.course.subtitle ?? '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.course.caption.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "avenir next",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      _getAvatarImagePath(avatarIndex),
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String title) {
    switch (title) {
      case "Add Shop ":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddShopFinal()),
        );
        break;
      case "Shop Visit":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopVisit()),
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
          MaterialPageRoute(builder: (context) =>  RecoveryForm()),
        );
        break;
      case "Booking Status":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  OrderBookingStatus()),
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
