import 'package:flutter/material.dart';
import 'package:pets_go/Data/serviciosFunebres.dart';

class ServiciosFunerariosScreen extends StatefulWidget {
  const ServiciosFunerariosScreen({super.key});

  @override
  State<ServiciosFunerariosScreen> createState() =>
      _ServiciosFunerariosScreenState();
}

class _ServiciosFunerariosScreenState extends State<ServiciosFunerariosScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquetes Funerarios'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: serviciosFunebres.length,
        itemBuilder: (context, index) {
          final servicio = serviciosFunebres[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Card(
              color: isSelected ? Colors.deepPurple.shade50 : Colors.white,
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          servicio.titulo,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.deepPurple,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      servicio.subtitulo,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      servicio.descripcion,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    if (servicio.precio != null)
                      Text(
                        'Precio: ${servicio.precio}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepPurple,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Función para agendar cita próximamente'),
            ),
          );
        },
        icon: const Icon(Icons.calendar_month),
        label: const Text('Agendar Cita'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
