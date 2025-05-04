import 'package:flutter/material.dart';
import 'package:pets_go/Data/sample_adopcion.dart';

class AdopcionScreen extends StatelessWidget {
  const AdopcionScreen({super.key});

  void _mostrarDialogoAccion(BuildContext context, String tipo, String nombre) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('$tipo a $nombre'),
            content: Text(
              'Gracias por tu interés en $tipo a $nombre. Nos pondremos en contacto contigo.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopción y Perreras'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: SampleAdopcion.mascotas.length,
        itemBuilder:
            (context, index) =>
                _buildMascotaCard(context, SampleAdopcion.mascotas[index]),
      ),
    );
  }

  Widget _buildMascotaCard(BuildContext context, Map<String, dynamic> mascota) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMascotaImage(mascota['imagen']),
          _buildMascotaInfo(context, mascota),
        ],
      ),
    );
  }

  Widget _buildMascotaImage(String imagenUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.network(
        imagenUrl,
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMascotaInfo(BuildContext context, Map<String, dynamic> mascota) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mascota['nombre'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('${mascota['edad']} • ${mascota['raza']}'),
          const SizedBox(height: 8),
          Text(mascota['descripcion']),
          const SizedBox(height: 12),
          _buildActionButtons(context, mascota['nombre']),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, String nombreMascota) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          context: context,
          icon: Icons.home,
          label: 'Adoptar',
          color: Colors.teal.shade400,
          action: 'Adoptar',
          nombreMascota: nombreMascota,
        ),
        _buildActionButton(
          context: context,
          icon: Icons.volunteer_activism,
          label: 'Apadrinar',
          outlined: true,
          action: 'Apadrinar',
          nombreMascota: nombreMascota,
        ),
        _buildActionButton(
          context: context,
          label: 'Donar',
          action: 'Donar a',
          nombreMascota: nombreMascota,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    IconData? icon,
    required String label,
    Color? color,
    bool outlined = false,
    required String action,
    required String nombreMascota,
  }) {
    if (outlined) {
      return OutlinedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: () => _mostrarDialogoAccion(context, action, nombreMascota),
      );
    }

    if (icon != null) {
      return ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () => _mostrarDialogoAccion(context, action, nombreMascota),
      );
    }

    return TextButton(
      child: Text(label),
      onPressed: () => _mostrarDialogoAccion(context, action, nombreMascota),
    );
  }
}
