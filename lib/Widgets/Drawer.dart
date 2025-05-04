import 'package:flutter/material.dart';
import 'package:pets_go/presentation/screens/AdopcionFunctionScreen.dart';
import 'package:pets_go/presentation/screens/HistorialMedicoScreen.dart';
import 'package:pets_go/presentation/screens/PaseadoresFunctionScreen.dart';
import 'package:pets_go/presentation/screens/SpaFunctionScreen.dart';
import 'package:pets_go/presentation/screens/VeterinariosFunctionScreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          _buildSectionTitle('Servicios'),
          _buildMenuItem(
            context,
            icon: Icons.medical_services,
            text: 'Veterinarios',
            route: const VeterinariosFunctionScreen(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.directions_walk,
            text: 'Paseadores',
            route: const PaseadoresFunctionScreen(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.spa,
            text: 'SPA',
            route: const SpaFunctionScreen(),
          ),
          const Divider(),
          _buildSectionTitle('¿Eres profesional?'),
          _buildMenuItem(
            context,
            icon: Icons.verified_user,
            text: 'Verifícate como Paseador',
            onTap: () => _showVerificationDialog(context, 'Paseador'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.verified_user,
            text: 'Verifícate como Veterinario',
            onTap: () => _showVerificationDialog(context, 'Veterinario'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.verified_user,
            text: 'Verifícate como SPA',
            onTap: () => _showVerificationDialog(context, 'SPA'),
          ),
          const Divider(),
          _buildSectionTitle('Historial Médico'),
          _buildMenuItem(
            context,
            icon: Icons.medical_information,
            text: 'Historial Médico',
            route: const HistorialMedicoScreen(),
          ),
          const Divider(),
          _buildSectionTitle('Adopciones y perreras'),
          _buildMenuItem(
            context,
            icon: Icons.pets,
            text: 'Adopciones',
            route: const AdopcionScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.lightBlue.shade200],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/44.jpg',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Menú de opciones',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Bienvenido, Usuario',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    Widget? route,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(text),
      onTap: () {
        Navigator.pop(context); // Cierra el drawer

        if (route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        } else if (onTap != null) {
          onTap();
        }
      },
    );
  }

  void _showVerificationDialog(BuildContext context, String profession) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Verificación como $profession'),
            content: Text(
              '¿Deseas iniciar el proceso de verificación como $profession?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Aquí iría la lógica de verificación
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
    );
  }
}
