import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/hotel_viewmodel.dart';
import 'hotel_detail_screen.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelViewModel = Provider.of<HotelViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Hoteles'),
      ),
      body:
          hotelViewModel.hotels.isEmpty
              ? const Center(child: Text('No hay hoteles disponibles'))
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        screenWidth < 600
                            ? 2
                            : 3, // Más columnas en pantallas grandes
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio:
                        screenWidth < 400 ? 0.7 : 0.8, // Ajuste dinámico
                  ),
                  itemCount: hotelViewModel.hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = hotelViewModel.hotels[index];
                    return HotelCard(hotel: hotel);
                  },
                ),
              ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(hotel: hotel),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: FadeInImage.assetNetwork(
                    placeholder:
                        'assets/images/placeholder.jpg', // Imagen de carga
                    image: hotel.image.isNotEmpty ? hotel.image[0] : '',
                    height: screenWidth < 400 ? 120 : 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageErrorBuilder:
                        (context, error, stackTrace) => Image.asset(
                          'assets/images/placeholder.jpg',
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              hotel.name,
              style: TextStyle(
                fontSize:
                    screenWidth < 400 ? 12 : 14, // Ajuste en pantallas pequeñas
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    hotel.location,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
