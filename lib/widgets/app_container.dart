import 'package:boat_rent_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: child,
    );
  }
}