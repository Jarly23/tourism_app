import 'package:flutter/material.dart';
import 'package:tourism_app/models/package.dart';
import '../models/tour.dart';

class TourViewModel extends ChangeNotifier {
  final List<Tour> _tours = [
    Tour(
      id: '100',
      name: 'Monasterio de Santa Catalina',
      description:
          'Impresionante convento colonial con calles estrechas y una arquitectura bien conservada.',
      image: [
        'https://denomades.s3.us-west-2.amazonaws.com/blog/wp-content/uploads/2019/11/20221220/shutterstock_71958730.jpg',
      ],
      price: 50.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '101',
      name: 'Cañón del Colca',
      description:
          'Uno de los cañones más profundos del mundo, hogar del majestuoso cóndor andino.',
      image: [
        'https://www.peru.travel/Contenido/Experiencia/Imagen/es/67/1.1/Visita%20al%20canon%20del%20colca.jpg',
      ],
      price: 80.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '102',
      name: 'Mirador de Yanahuara',
      description:
          'Ofrece una vista panorámica de la ciudad de Arequipa y los volcanes que la rodean.',
      image: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJjrQRzZ9J-Z-Bby9PaZ-WsCLzD6wxr99udA&s',
      ],
      price: 20.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '103',
      name: 'Volcán Misti',
      description:
          'Volcán emblemático de Arequipa, popular entre montañistas y aventureros.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 120.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '104',
      name: 'Reserva Nacional de Salinas y Aguada Blanca',
      description:
          'Área protegida con paisajes espectaculares y fauna andina como vicuñas y flamencos.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 60.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '105',
      name: 'Catarata de Pillones',
      description: 'Hermosa cascada rodeada de formaciones rocosas naturales.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 40.0,
      destinationId: '1',
      location: "Arequipa",
      date: "",
    ),

    Tour(
      id: '106',
      name: 'Machu Picchu',
      description:
          'Una de las Siete Maravillas del Mundo, antigua ciudad inca en la cima de los Andes.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 150.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '107',
      name: 'Sacsayhuamán',
      description:
          'Fortaleza inca con impresionantes muros de piedra en las afueras de Cusco.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 50.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '108',
      name: 'Valle Sagrado de los Incas',
      description:
          'Región con pueblos tradicionales, ruinas incas y hermosos paisajes andinos.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 90.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '109',
      name: 'Montaña de Siete Colores',
      description: 'Excursión a la impresionante montaña Vinicunca.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 70.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '110',
      name: 'Qorikancha y Convento de Santo Domingo',
      description:
          'Antiguo templo inca del Sol, sobre el cual se construyó un convento colonial.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 30.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '111',
      name: 'Choquequirao',
      description:
          'Ciudadela inca conocida como la "hermana sagrada de Machu Picchu".',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 140.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '112',
      name: 'Laguna Humantay',
      description:
          'Hermosa laguna turquesa en medio de los Andes, ideal para senderismo.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 60.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '113',
      name: 'Piedra de los 12 ángulos',
      description:
          'Bloque de piedra inca tallado con gran precisión, ícono arquitectónico de Cusco.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 15.0,
      destinationId: '3',
      location: "Cusco",
      date: "",
    ),

    Tour(
      id: '114',
      name: 'Lago Titicaca y las Islas Flotantes de los Uros',
      description:
          'Lago navegable más alto del mundo, con islas artificiales hechas de totora.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 80.0,
      destinationId: '2',
      location: "Puno",
      date: "",
    ),

    Tour(
      id: '115',
      name: 'Isla Taquile',
      description:
          'Comunidad indígena con una rica tradición textil y paisajes espectaculares.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 60.0,
      destinationId: '2',
      location: "Puno",
      date: "",
    ),

    Tour(
      id: '116',
      name: 'Chullpas de Sillustani',
      description:
          'Necrópolis preinca con impresionantes torres funerarias de piedra.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 40.0,
      destinationId: '2',
      location: "Puno",
      date: "",
    ),

    Tour(
      id: '117',
      name: 'Templo de la Fertilidad (Chucuito)',
      description:
          'Complejo arqueológico con esculturas de piedra asociadas a rituales de fertilidad.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 30.0,
      destinationId: '2',
      location: "Puno",
      date: "",
    ),

    Tour(
      id: '118',
      name: 'Cañón de Tinajani',
      description:
          'Impresionante formación rocosa con paisajes únicos y pinturas rupestres.',
      image: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/PERU.jpg/1200px-PERU.jpg',
      ],
      price: 50.0,
      destinationId: '2',
      location: "Puno",
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
