import 'package:flutter/material.dart';
import 'package:tourism_app/models/package.dart';
import '../models/tour.dart';

class TourViewModel extends ChangeNotifier {
  final List<Tour> _tours = [
    Tour(
      id: '101',
      name: 'City Tour Arequipa',
      description:
          'Recorrido por los principales atractivos de la ciudad blanca.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 50.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),
    Tour(
      id: '102',
      name: 'Cañón del Colca',
      description: 'Visita al increíble Cañón del Colca y sus cóndores.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 80.0,
      destinationId: '1',
      location: "Caylloma, Arequipa",
      date: "",
    ),
    Tour(
      id: '103',
      name: 'Subida al Volan Misti',
      description: 'Subamos a la cima del volcan misti.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 80.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),
    Tour(
      id: '103',
      name: 'Islas Flotantes de los Uros',
      description: 'Explora las islas hechas de totora en el Lago Titicaca.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 45.0,
      destinationId: '2',
      location: "Puno",
      date: "",
    ),
    Tour(
      id: '104',
      name: 'Chullpas de Sillustani',
      description: 'Tour a las impresionantes torres funerarias preincaicas.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 35.0,
      destinationId: '2',
      location: "Cusco",
      date: "",
    ),
    Tour(
      id: '105',
      name: 'Machu Picchu',
      description: 'La ciudadela inca, una de las maravillas del mundo.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 120.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),
    Tour(
      id: '106',
      name: 'Montaña de Siete Colores',
      description: 'Excursión a la impresionante montaña Vinicunca.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      price: 70.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),
  ];

  List<Tour> get tours => _tours;

  List<Tour> getToursByDestination(String destinationId) {
    return _tours.where((tour) => tour.destinationId == destinationId).toList();
  }

  List<Tour> getToursForPackage(Package package) {
    return tours.where((tour) => package.tourIds.contains(tour.id)).toList();
  }
}
