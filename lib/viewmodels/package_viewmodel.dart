import 'package:flutter/material.dart';
import 'package:tourism_app/models/hotel.dart';
import 'package:tourism_app/models/package.dart';
import 'package:tourism_app/models/tour.dart';
import 'package:tourism_app/viewmodels/tour_viewmodel.dart';
import 'package:tourism_app/viewmodels/hotel_viewmodel.dart';

class PackageViewModel extends ChangeNotifier {
  final TourViewModel _tourViewModel;
  final HotelViewModel _hotelViewModel;

  PackageViewModel(this._tourViewModel, this._hotelViewModel);

  List<Package> get packages => [
    Package(
      id: '1',
      title: 'Viaje a Cusco por 3 días',
      description: 'Explora Cusco con tours a Machu Picchu y Valle Sagrado.',
      image:
          'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      tourIds: ['105', '106'],
      hotelId: '3',
      price: "230",
      location: "Cusco",
      rating: "4.5",
    ),
    Package(
      id: '2',
      title: 'Aventura en Puno',
      description: 'Descubre el Lago Titicaca y las Islas Flotantes.',
      image:
          'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      tourIds: ['103', '104'],
      hotelId: '2',
      price: "250",
      location: "Arequipa",
      rating: "4.0",
    ),
  ];

  List<Tour> getToursForPackage(Package package) {
    return package.tourIds
        .map((id) => _tourViewModel.tours.firstWhere((tour) => tour.id == id))
        .toList();
  }

  Hotel? getHotelForPackage(Package package) {
    return _hotelViewModel.hotels.firstWhere(
      (hotel) => hotel.id == package.hotelId,
      orElse:
          () => Hotel(
            id: '',
            name: 'Hotel no disponible',
            location: '',
            image: [''],
            description: '',
            pricePerNight: "0",
            type: "",
            services: [""],
          ),
    );
  }
}
