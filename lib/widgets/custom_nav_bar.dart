import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color selectedColor;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    Color colorAzul = const Color(0xFF0D6EFD);
    return Container(
      color: colorAzul, // Asegura que el contenedor tenga el fondo azul
      child: BottomNavigationBar(
        backgroundColor:
            colorAzul, // Asegura que el fondo del BottomNavigationBar sea azul
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: selectedColor, // Mantiene el color seleccionado
        unselectedItemColor: Colors.white.withOpacity(
          0.6,
        ), // Ítems no seleccionados con opacidad
        type:
            BottomNavigationBarType
                .fixed, // Evita efectos de transparencia en los ítems
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Destinos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Hoteles'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Paquetes',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
