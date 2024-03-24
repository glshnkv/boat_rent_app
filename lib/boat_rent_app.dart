import 'package:boat_rent_app/router/router.dart';
import 'package:flutter/material.dart';

class BoatRentApp extends StatelessWidget {
  BoatRentApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
