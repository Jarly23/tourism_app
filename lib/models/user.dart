class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String? googleId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    this.googleId,
  });
}
