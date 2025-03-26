class Package {
  final String id;
  final String title;
  final String description;
  final String price;
  final String image;
  final String location;
  final String rating;
  final List<String> tourIds; // Tours incluidos
  final String hotelId; // Hotel asociado

  Package({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.location,
    required this.rating,
    required this.tourIds,
    required this.hotelId,
  });
}
