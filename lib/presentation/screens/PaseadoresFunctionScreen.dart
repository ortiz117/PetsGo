import 'package:flutter/material.dart';
import 'package:pets_go/Models/Generic_Card.dart';
import 'package:pets_go/Models/Paseador.dart';
import 'package:pets_go/Widgets/FilterGeneric.dart';
import 'package:pets_go/Widgets/agendar_cita_dialog.dart';

class PaseadoresFunctionScreen extends StatefulWidget {
  const PaseadoresFunctionScreen({super.key});

  @override
  State<PaseadoresFunctionScreen> createState() => _PaseadoresFunctionState();
}

class _PaseadoresFunctionState extends State<PaseadoresFunctionScreen> {
  int? selectedPaseadorIndex;
  List<Paseador> paseadores = Paseador.paseadoresEjemplo();
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
          'Paseadores Disponibles',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
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
                  itemCount: paseadores.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return GenericServiceCard(
                      title: paseadores[index].nombre,
                      subtitle: paseadores[index].experiencia,
                      description: paseadores[index].descripcion,
                      priceText:
                          '\$${paseadores[index].tarifaHora.toStringAsFixed(2)} por hora',
                      rating: paseadores[index].calificacion,
                      isSelected: selectedPaseadorIndex == index,
                      onTap:
                          () => setState(() {
                            selectedPaseadorIndex =
                                selectedPaseadorIndex == index ? null : index;
                          }),
                      onRatingChanged: (rating) {
                        setState(() {
                          paseadores[index].calificacion = rating;
                        });
                      },
                      accentColor: Colors.green,
                      ratingLabel: 'Califica a este paseador:',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          selectedPaseadorIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.pets, color: Colors.white),
                label: const Text(
                  'Contratar Servicio',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green.shade600,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AgendarCitaDialog(
                          paquete:
                              selectedPaseadorIndex != null
                                  ? paseadores[selectedPaseadorIndex!].nombre
                                  : '',
                        ),
                  );
                },
              )
              : null,
    );
  }
}
