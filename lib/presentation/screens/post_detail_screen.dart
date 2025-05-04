import 'package:flutter/material.dart';
import 'package:pets_go/Models/pet_post.dart';
import 'package:pets_go/Theme/AppBackground.dart';

class PostDetailScreen extends StatelessWidget {
  final PetPost post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.ownerName),
        backgroundColor: Colors.purple,
      ),
      body: AppBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPetImage(),
            ListTile(
              leading: _buildProfileImage(),
              title: Text(
                post.ownerName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(post.timeAgo),
              trailing: Text('${post.likes} ❤️'),
            ),

            // Descripción
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                post.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // Sección de comentarios (simulada)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Comentarios',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Comentarios simulados
            _buildCommentTile('Maria López', 'Qué lindo! 😍'),
            _buildCommentTile('Juan Pérez', 'Me encanta tu mascota'),
            _buildCommentTile('Ana García', 'Quiero uno igual!'),

            // Campo para añadir comentario
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Añadir un comentario...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Aquí iría la lógica para añadir comentario
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Función de comentarios en desarrollo'),
                        ),
                      );
                    },
                  ),
                ),
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
      child: const Icon(Icons.person, color: Colors.transparent),
    );
  }

  Widget _buildPetImage() {
    return SizedBox(
      width: double.infinity,
      child: Image(
        image: _safeNetworkImage(post.petImageUrl),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 50, color: Colors.grey),
                  SizedBox(height: 10),
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
            height: 300,
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

  // Método para manejar URLs problemáticas
  ImageProvider _safeNetworkImage(String url) {
    // Si la URL es de placekitten.com, usa una URL alternativa
    if (url.contains('placekitten.com')) {
      return const NetworkImage('https://picsum.photos/200');
    }

    // Verifica si la URL es válida
    try {
      Uri.parse(url);
      return NetworkImage(url);
    } catch (e) {
      // Si la URL no es válida, usa una imagen alternativa
      return const NetworkImage('https://picsum.photos/200');
    }
  }

  Widget _buildCommentTile(String username, String comment) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        child: Text(username[0]),
        backgroundColor: Colors.purple[100],
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: '$username ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: comment),
          ],
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.favorite_border, size: 16),
        onPressed: () {},
      ),
    );
  }
}
