import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/routes.dart';
import 'package:tourism_app/viewmodels/destination_viewmodel.dart';
import 'package:tourism_app/viewmodels/hotel_viewmodel.dart';
import 'package:tourism_app/viewmodels/package_viewmodel.dart';
import 'package:tourism_app/viewmodels/tour_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourism_app/viewmodels/user_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HotelViewModel()),
        ChangeNotifierProvider(create: (_) => DestinationViewModel()),
        ChangeNotifierProvider(create: (_) => TourViewModel()),
        ChangeNotifierProvider(
          create:
              (context) => PackageViewModel(
                Provider.of<TourViewModel>(context, listen: false),
                Provider.of<HotelViewModel>(context, listen: false),
              ),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ), // Agrega el UserViewModel
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
