import 'package:flutter/material.dart';
import 'package:pets_go/Models/Generic_Card.dart';
import 'package:pets_go/Models/Veterinario.dart';
import 'package:pets_go/Widgets/FilterGeneric.dart';

class VeterinariosFunctionScreen extends StatefulWidget {
  const VeterinariosFunctionScreen({super.key});

  @override
  State<VeterinariosFunctionScreen> createState() =>
      _VeterinariosFunctionState();
}

class _VeterinariosFunctionState extends State<VeterinariosFunctionScreen> {
  int? selectedVeterinarioIndex;
  List<Veterinario> veterinarios = Veterinario.veterinariosEjemplo();
  String selectedFiltro = 'Todos';

  final List<String> filtros = [
    'Todos',
    'Cercanos',
    'Mejor valorados',
    'Experiencia',
    'Precio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Veterinarios Disponibles',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda (para cuando la implementes)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filtros.length,
              itemBuilder: (context, index) {
                final filtro = filtros[index];
                return GenericFilterChip(
                  label: filtro,
                  selected: filtro == selectedFiltro,
                  onSelected: (bool value) {
                    setState(() {
                      selectedFiltro = filtro;
                      // Aquí puedes aplicar la lógica de filtrado si deseas
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF6DD5FA), Color(0xFFA18CD1)],
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: veterinarios.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return GenericServiceCard(
                      title: veterinarios[index].nombre,
                      subtitle: veterinarios[index].especialidad,
                      description: veterinarios[index].descripcion,
                      priceText:
                          veterinarios[index].tarifaHora != null
                              ? '\$${veterinarios[index].tarifaHora!.toStringAsFixed(2)} consulta'
                              : 'Precio por consultar',
                      rating: veterinarios[index].calificacion,
                      isSelected: selectedVeterinarioIndex == index,
                      onTap:
                          () => setState(() {
                            selectedVeterinarioIndex =
                                selectedVeterinarioIndex == index
                                    ? null
                                    : index;
                          }),
                      onRatingChanged: (rating) {
                        setState(() {
                          veterinarios[index].calificacion = rating;
                        });
                      },
                      accentColor: Colors.blue,
                      ratingLabel: 'Califica a este veterinario:',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          selectedVeterinarioIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.medical_services, color: Colors.white),
                label: const Text(
                  'Agendar Consulta',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue.shade600,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  // Acción para agendar consulta
                },
              )
              : null,
    );
  }
}
