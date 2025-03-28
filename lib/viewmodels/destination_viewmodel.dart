import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationViewModel extends ChangeNotifier {
  final List<Destination> _destinations = [
    Destination(
      id: '1',
      name: 'Arequipa',
      image:
          'https://media.vogue.mx/photos/5e5c5b1f25623100081c437c/master/w_1600%2Cc_limit/Arequipa--paisaje.jpg',
      tourIds: ['100', '101', '102', '103', '105'],
    ),
    Destination(
      id: '3',
      name: 'Cusco',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg',
      tourIds: ['106', '107', '108', '109', '110', '111', '112', '113'],
    ),
    Destination(
      id: '2',
      name: 'Puno',
      image:
          'https://denomades.imgix.net/destinos/puno/350/islas-flotantes-de-uros.jpg',
      tourIds: ['114', '115', '116', '117', '118'],
    ),
  ];

  List<Destination> get destinations => _destinations;
}
