import 'package:flutter/material.dart';
import 'package:tourism_app/models/hotel.dart';
import 'package:tourism_app/viewmodels/hotel_viewmodel.dart';
import 'package:tourism_app/viewmodels/tour_viewmodel.dart';
import 'package:tourism_app/views/destination/tour_screen.dart';
import 'package:tourism_app/views/destination/tour_detail_screen.dart';
import 'package:tourism_app/views/home/home_screen.dart';
import 'package:tourism_app/views/destination/destination_screen.dart';
import 'package:tourism_app/views/hotel/hotel_screen.dart';
import 'package:tourism_app/views/package/package_screen.dart';
import 'package:tourism_app/views/package/package_detail_screen.dart'; // 🔹 Agregar esta línea
import 'package:tourism_app/views/profile/profile_screen.dart';
import 'package:tourism_app/models/tour.dart';
import 'package:tourism_app/models/package.dart';
import 'package:tourism_app/views/splash/splash_screen.dart'; // 🔹 Agregar esta línea

class AppRoutes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String destinations = '/destinations';
  static const String hotels = '/hotels';
  static const String tours = '/tours';
  static const String tourDetail = '/tourDetail';
  static const String profile = '/profile';
  static const String packages = '/packages'; // 🔹 Agregar esta línea
  static const String packageDetail = '/packageDetail'; // 🔹 Agregar esta línea

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case destinations:
        return MaterialPageRoute(builder: (_) => DestinationScreen());
      case hotels:
        return MaterialPageRoute(builder: (_) => HotelScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case tours:
        final destinationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => TourScreen(destinationId: destinationId),
        );
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case tourDetail:
        final tour = settings.arguments as Tour;
        return MaterialPageRoute(builder: (_) => TourDetailScreen(tour: tour));

      case packages:
        return MaterialPageRoute(builder: (_) => PackageScreen());

      case packageDetail:
        final package = settings.arguments as Package;

        // Obtener los datos adicionales necesarios
        final tourViewModel = TourViewModel();
        final hotelViewModel = HotelViewModel();

        final List<Tour> tours = tourViewModel.getToursForPackage(package);
        final Hotel? hotel = hotelViewModel.getHotelForPackage(package);

        return MaterialPageRoute(
          builder:
              (_) => PackageDetailScreen(
                package: package,
                tours: tours,
                hotel: hotel,
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('Ruta no encontrada'))),
        );
    }
  }
}
