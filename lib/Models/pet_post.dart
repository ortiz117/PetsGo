class PetPost {
  final String profilePicUrl;
  final String ownerName;
  final String petImageUrl;
  final String description;
  final String timeAgo;
  int likes;

  PetPost({
    required this.profilePicUrl,
    required this.ownerName,
    required this.petImageUrl,
    required this.description,
    required this.timeAgo,
    this.likes = 0,
  });
}
