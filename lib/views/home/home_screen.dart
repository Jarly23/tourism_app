import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/viewmodels/tour_viewmodel.dart';
import 'package:tourism_app/views/destination/destination_screen.dart';
import 'package:tourism_app/views/hotel/hotel_screen.dart';
import 'package:tourism_app/views/package/package_screen.dart';
import 'package:tourism_app/views/profile/profile_screen.dart';
import 'package:tourism_app/widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color colorAzul = const Color(0xFF0D6EFD);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Obtener el TourViewModel desde Provider
    final tourViewModel = Provider.of<TourViewModel>(context);
    final tours = tourViewModel.tours; // Accede a la lista de tours

    final List<Widget> pages = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const Icon(Icons.notifications, size: 30),
              ],
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.black,
                ), // Estilo base
                children: [
                  TextSpan(text: "Explora las \nmaravillas del \n"),
                  TextSpan(
                    text: "Sur ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ), // Solo "Sur" en negrita
                  ),
                  TextSpan(text: "del "),
                  TextSpan(
                    text: "Perú",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 236, 147, 13),
                    ), // "Perú" en negrita y amarillo
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Destinos más populares",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  final tour = tours[index];
                  return Container(
                    width: 268,
                    height: 384,
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 10,
                      bottom: 20,
                      left: 10,
                    ),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.3,
                          ), // Color de la sombra
                          blurRadius: 10, // Difuminado de la sombra
                          spreadRadius: 2, // Expansión de la sombra
                          offset: const Offset(0, 5), // Posición de la sombra
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            tour.image[0],
                            width: double.infinity,
                            height: 286,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tour.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 155, 155, 155),
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Text(
                                  "4.7",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 3, 3, 3),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 187, 187, 187),
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              tour.location,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      const DestinationScreen(),
      const HotelScreen(),
      const PackageScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedColor: Colors.white,
      ),
    );
  }
}
