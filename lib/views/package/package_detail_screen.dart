import 'package:flutter/material.dart';
import 'package:tourism_app/models/hotel.dart';
import 'package:tourism_app/models/package.dart';
import 'package:tourism_app/models/tour.dart';

class PackageDetailScreen extends StatelessWidget {
  final Package package;
  final List<Tour> tours;
  final Hotel? hotel;

  const PackageDetailScreen({
    super.key,
    required this.package,
    required this.tours,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    Color colorAzul = const Color(0xFF0D6EFD);
    return Scaffold(
      body: Stack(
        children: [
          // Imagen superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 380,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: Image.network(package.image, fit: BoxFit.cover),
              ),
            ),
          ),
          // Contenido principal
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título del paquete
                      Text(
                        package.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(
                            package.location,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$${package.price}/Persona',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Descripción
                      const Text(
                        "Sobre el destino",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        package.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      // Lista de tours
                      const Text(
                        "Tours incluidos:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children:
                            tours
                                .map(
                                  (tour) => ListTile(
                                    leading: const Icon(Icons.directions),
                                    title: Text(tour.name),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 16),
                      // Hotel asociado
                      const Text(
                        "Hotel asociado:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.hotel),
                        title: Text(hotel?.name ?? "No hay hotel asociado"),
                      ),
                      const SizedBox(height: 16),
                      // Botón de reserva
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorAzul,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Reservar Ahora",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
          // Botón de regreso
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(146, 22, 22, 22),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
