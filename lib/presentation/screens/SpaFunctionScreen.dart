import 'package:flutter/material.dart';
import 'package:pets_go/Models/Generic_Card.dart';
import 'package:pets_go/Models/spa_service.dart';
import 'package:pets_go/Widgets/FilterGeneric.dart';
import 'package:pets_go/Widgets/agendar_cita_dialog.dart';

class SpaFunctionScreen extends StatefulWidget {
  const SpaFunctionScreen({super.key});

  @override
  State<SpaFunctionScreen> createState() => _SpaFunctionState();
}

class _SpaFunctionState extends State<SpaFunctionScreen> {
  int? selectedSpaIndex;
  String selectedFiltro = 'Todos';

  List<SpaService> servicios = SpaService.spasEjemplo();

  final List<String> filtros = [
    'Todos',
    'Cercanos',
    'Mejor valorados',
    'Servicio',
    'Precio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Servicios de Spa',
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
              // Acción de búsqueda
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
                  itemCount: servicios.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return GenericServiceCard(
                      title: servicios[index].name,
                      subtitle: servicios[index].tipo ?? 'Servicio general',
                      description: servicios[index].description,
                      priceText:
                          '\$${servicios[index].tarifa.toStringAsFixed(2)}',
                      rating: servicios[index].rating.toInt(),
                      isSelected: selectedSpaIndex == index,
                      onTap: () {
                        setState(() {
                          selectedSpaIndex =
                              selectedSpaIndex == index ? null : index;
                        });
                      },
                      onRatingChanged: (rating) {
                        setState(() {
                          servicios[index].rating = rating.toDouble();
                        });
                      },
                      accentColor: Colors.purple,
                      ratingLabel: 'Califica este spa:',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          selectedSpaIndex != null
              ? FloatingActionButton.extended(
                icon: const Icon(Icons.spa, color: Colors.white),
                label: const Text(
                  'Reservar Servicio',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.purple.shade600,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AgendarCitaDialog(
                          paquete: servicios[selectedSpaIndex!].name,
                        ),
                  );
                },
              )
              : null,
    );
  }
}
