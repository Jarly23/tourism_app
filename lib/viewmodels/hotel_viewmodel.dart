import 'package:flutter/material.dart';
import 'package:tourism_app/models/hotel.dart';
import 'package:tourism_app/models/package.dart';

class HotelViewModel extends ChangeNotifier {
  final List<Hotel> _hotels = [
    Hotel(
      id: '1',
      name: 'Hotel Arequipa',
      description: 'Un hermoso hotel en el corazón de Arequipa.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      pricePerNight: "120.0",
      location: 'Arequipa, Perú',
      type: 'Resort de lujo',
      services: [
        'Wi-Fi gratuito',
        'Desayuno buffet',
        'Piscina infinita',
        'Gimnasio',
        'Spa y masajes',
        'Transporte al aeropuerto',
      ],
    ),
    Hotel(
      id: '2',
      name: 'Puno Lake Hotel',
      description: 'Hermosas vistas del lago Titicaca.',
      image: [
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
        'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      ],
      pricePerNight: "150.0",
      location: 'Puno, Perú',
      type: 'Resort de lujo',
      services: [
        'Wi-Fi gratuito',
        'Desayuno buffet',
        'Piscina infinita',
        'Gimnasio',
        'Spa y masajes',
        'Transporte al aeropuerto',
      ],
    ),
    Hotel(
      id: '3',
      name: 'Cusco Plaza',
      description: 'Hotel colonial con todas las comodidades.',
      image: [
        'https://cdn0.uncomo.com/es/posts/1/9/2/guia_de_decoracion_para_habitaciones_de_hoteles_47291_orig.jpg',
        'https://cdn0.uncomo.com/es/posts/1/9/2/guia_de_decoracion_para_habitaciones_de_hoteles_47291_orig.jpg',
        'https://cdn0.uncomo.com/es/posts/1/9/2/guia_de_decoracion_para_habitaciones_de_hoteles_47291_orig.jpg',
        'https://cdn.forbes.com.mx/2021/12/hoteles-de-lujo-tres-e1639513889195.jpg',
        'https://cdn.forbes.com.mx/2021/12/hoteles-de-lujo-tres-e1639513889195.jpg',
      ],
      pricePerNight: "200.0",
      location: 'Cusco, Perú',
      type: 'Resort de lujo',
      services: [
        'Wi-Fi gratuito',
        'Desayuno buffet',
        'Piscina infinita',
        'Gimnasio',
        'Spa y masajes',
        'Transporte al aeropuerto',
      ],
    ),
  ];
  List<Hotel> get hotels => _hotels;

  void addHotel(Hotel hotel) {
    _hotels.add(hotel);
    notifyListeners(); // Notificar a la vista para actualizar
  }

  Hotel? getHotelForPackage(Package package) {
    return hotels.firstWhere(
      (hotel) => hotel.id == package.hotelId,
      orElse:
          () => Hotel(
            id: '0',
            name: 'Hotel no encontrado',
            description: '',
            image: [""],
            pricePerNight: "0",
            location: '',
            type: "",
            services: [""],
          ),
    );
  }
}
