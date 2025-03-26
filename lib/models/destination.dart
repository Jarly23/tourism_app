class Destination {
  final String id;
  final String name;
  final String image;
  final List<String> tourIds; // IDs de tours asociados

  Destination({
    required this.id,
    required this.name,
    required this.image,
    required this.tourIds,
  });
}
