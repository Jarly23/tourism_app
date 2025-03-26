import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationViewModel extends ChangeNotifier {
  final List<Destination> _destinations = [
    Destination(
      id: '1',
      name: 'Arequipa',
      image:
          'https://content.r9cdn.net/rimg/dimg/9b/c5/d5c7611f-city-2270-16441b01e36.jpg?width=1366&height=768&xhint=1623&yhint=912&crop=true',
      tourIds: ['101', '102', '103'],
    ),
    Destination(
      id: '2',
      name: 'Puno',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg',
      tourIds: ['103', '104'],
    ),
    Destination(
      id: '3',
      name: 'Cusco',
      image:
          'https://content.r9cdn.net/rimg/dimg/7d/34/bc7300b5-city-15324-16906f3d65a.jpg?width=1366&height=768&xhint=1420&yhint=706&crop=true',
      tourIds: ['105', '106'],
    ),
  ];

  List<Destination> get destinations => _destinations;
}
