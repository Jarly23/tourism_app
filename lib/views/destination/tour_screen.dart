import 'package:flutter/material.dart';
import 'package:tourism_app/models/tour.dart';
import 'package:tourism_app/viewmodels/tour_viewmodel.dart';
import 'package:provider/provider.dart';

class TourScreen extends StatefulWidget {
  final String destinationId;

  const TourScreen({super.key, required this.destinationId});

  @override
  // ignore: library_private_types_in_public_api
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  TextEditingController searchController = TextEditingController();
  List<Tour> filteredTours = [];

  @override
  void initState() {
    super.initState();
    _filterTours(""); // Cargar todos los tours al inicio
  }

  void _filterTours(String query) {
    final tourViewModel = Provider.of<TourViewModel>(context, listen: false);

    setState(() {
      filteredTours =
          tourViewModel.tours
              .where(
                (tour) =>
                    tour.destinationId == widget.destinationId &&
                    tour.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tours Disponibles",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// 📌 Barra de búsqueda
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: searchController,
                onChanged: _filterTours,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Buscar tours",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// 📌 Lista de Tours
            Expanded(
              child:
                  filteredTours.isEmpty
                      ? const Center(child: Text("No se encontraron tours"))
                      : ListView.builder(
                        itemCount: filteredTours.length,
                        itemBuilder: (context, index) {
                          final tour = filteredTours[index];
                          return buildTourCard(context, tour);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 Widget para construir cada tarjeta con diseño mejorado
  Widget buildTourCard(BuildContext context, Tour tour) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/tourDetail", arguments: tour);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 📌 Imagen del tour
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                tour.image.isNotEmpty ? tour.image[0] : "",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey,
                    ),
              ),
            ),
            const SizedBox(width: 12),

            /// 📌 Información del tour
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🏷 Nombre del tour
                  Text(
                    tour.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  /// 💲 Precio del tour
                  Text(
                    "\$${tour.price.toString()}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
