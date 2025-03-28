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
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color colorAzul = const Color(0xFF0D6EFD);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tourViewModel = Provider.of<TourViewModel>(context);
    final tours = tourViewModel.tours;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.06, // Ajuste dinámico del tamaño
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                ),
                const Icon(Icons.notifications, size: 30),
              ],
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenWidth * 0.1, // Ajuste dinámico del texto
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(text: "Explora las \nmaravillas del \n"),
                  TextSpan(
                    text: "Sur ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "del "),
                  TextSpan(
                    text: "Perú",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 236, 147, 13),
                    ),
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
              child:
                  tours.isEmpty
                      ? const Center(child: Text("No hay tours disponibles"))
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tours.length,
                        itemBuilder: (context, index) {
                          final tour = tours[index];
                          return Container(
                            width: screenWidth * 0.7,
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
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    tour.image.isNotEmpty
                                        ? tour.image[0]
                                        : 'https://via.placeholder.com/150',
                                    width: double.infinity,
                                    height: screenHeight * 0.3,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/placeholder.jpg',
                                        width: double.infinity,
                                        height: screenHeight * 0.3,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        tour.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            155,
                                            155,
                                            155,
                                          ),
                                        ),
                                        overflow:
                                            TextOverflow
                                                .ellipsis, // Evita desbordamiento
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
                                    Expanded(
                                      child: Text(
                                        tour.location,
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        overflow: TextOverflow.ellipsis,
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
