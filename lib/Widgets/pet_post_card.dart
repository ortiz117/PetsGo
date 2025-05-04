import 'package:flutter/material.dart';
import 'package:pets_go/Models/pet_post.dart';
import 'package:pets_go/presentation/screens/post_detail_screen.dart';

class PetPostCard extends StatelessWidget {
  final PetPost post;
  final VoidCallback onLike;

  const PetPostCard({super.key, required this.post, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: _buildProfileImage(),
              title: Text(post.ownerName),
              subtitle: Text(post.timeAgo),
              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: onLike,
              ),
            ),
            _buildPetImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.description),
                  const SizedBox(height: 8),
                  Text(
                    '${post.likes} likes',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      backgroundImage: _safeNetworkImage(post.profilePicUrl),
      onBackgroundImageError: (exception, stackTrace) {
        debugPrint('Error cargando imagen de perfil: $exception');
      },
      child: ClipOval(
        child: Image.asset(
          'assets/images/default_profile.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person, color: Colors.grey);
          },
        ),
      ),
    );
  }

  Widget _buildPetImage() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400.0),
      width: double.infinity,
      child: Image(
        image: _safeNetworkImage(post.petImageUrl),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error cargando imagen principal: $error');
          return const SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pets, size: 40, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    "No se pudo cargar la imagen",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
              ),
            ),
          );
        },
      ),
    );
  }

  ImageProvider _safeNetworkImage(String url) {
    if (url.contains('placekitten.com')) {
      return const NetworkImage('https://picsum.photos/200');
    }

    try {
      Uri.parse(url);
      return NetworkImage(url);
    } catch (e) {
      return const NetworkImage('https://picsum.photos/200');
    }
  }
}
