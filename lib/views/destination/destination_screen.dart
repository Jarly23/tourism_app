import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/viewmodels/destination_viewmodel.dart';
import 'package:tourism_app/views/destination/tour_screen.dart';
import 'package:tourism_app/models/destination.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DestinationViewModel>(
      builder: (context, destinationViewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Destinos Turísticos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: destinationViewModel.destinations.length,
              itemBuilder: (context, index) {
                return buildDestinationCard(
                  context,
                  destinationViewModel.destinations[index],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildDestinationCard(BuildContext context, Destination destination) {
    return GestureDetector(
      onTap: () {
        /// 📌 Navegar a la pantalla de detalles
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TourScreen(destinationId: destination.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              /// 📌 Imagen del destino
              Image.network(
                destination.image,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),

              /// 📌 Degradado para resaltar el texto
              Container(
                width: double.infinity,
                height: 160,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 📍 Nombre del Destino
                      Text(
                        destination.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      /// ⭐ Estrellas de calificación
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              /// 📌 Ícono de navegación (flecha)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(108, 0, 0, 0),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
