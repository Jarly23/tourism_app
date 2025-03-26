class Tour {
  final String id;
  final String name;
  final String description;
  final List<String> image;
  final double price;
  final String destinationId; // Relación con destino
  final String location;
  final String date;

  Tour({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.destinationId,
    required this.date,
    required this.location,
  });
}
