import 'package:boat_rent_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoRowWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final Color valueColor;
  const InfoRowWidget({super.key, required this.icon, required this.title, required this.value, required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 7),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.white50,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
