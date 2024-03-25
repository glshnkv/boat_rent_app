import 'package:boat_rent_app/boat_rent_app.dart';
import 'package:boat_rent_app/models/transport_model.dart';
import 'package:boat_rent_app/screens/transport/transport_bloc/transport_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(TransportModelAdapter());
  await Hive.openBox('transports');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TransportBloc>(
          create: (context) => TransportBloc()),
    ],
    child: BoatRentApp()
  ));
}
