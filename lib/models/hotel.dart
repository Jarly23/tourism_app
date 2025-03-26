class Hotel {
  final String id;
  final String name;
  final String description;
  final List<String> image;
  final String pricePerNight;
  final String location;
  final String type;
  final List<String> services;

  Hotel({
    required this.services,
    required this.type,
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.pricePerNight,
    required this.location,
  });
}
