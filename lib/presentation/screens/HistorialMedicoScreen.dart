import 'package:flutter/material.dart';

class HistorialMedicoScreen extends StatefulWidget {
  const HistorialMedicoScreen({super.key});

  @override
  State<HistorialMedicoScreen> createState() => _HistorialMedicoScreenState();
}

class _HistorialMedicoScreenState extends State<HistorialMedicoScreen> {
  bool estaEsterilizado = true;
  List<String> vacunas = ['Rabia', 'Parvovirus', 'Múltiple'];
  List<String> tratamientos = ['Desparasitación', 'Antibióticos - 03/08/2024'];
  List<String> archivosAdjuntos = ['Certificado Rabia.pdf', 'Receta Vet.jpeg'];

  void _mostrarDialogoAgregarElemento(String tipo, List<String> lista) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Agregar $tipo'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre del $tipo',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                child: const Text('Agregar'),
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      lista.add(controller.text.trim());
                    });
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
    );
  }

  Widget _seccion(
    String titulo,
    List<String> items,
    IconData icono,
    VoidCallback onAdd,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ExpansionTile(
        leading: Icon(icono, color: Colors.purple),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add, color: Colors.purple),
          onPressed: onAdd,
        ),
        children:
            items
                .map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text(item),
                  ),
                )
                .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial Médico'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.pets, color: Colors.purple),
              title: const Text('Nombre de la mascota: Rocky'),
              subtitle: const Text('Edad: 3 años • Raza: Labrador'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.medical_services, color: Colors.purple),
            title: const Text('Esterilización'),
            trailing: Switch(
              value: estaEsterilizado,
              onChanged: (valor) {
                setState(() {
                  estaEsterilizado = valor;
                });
              },
            ),
          ),
          _seccion(
            'Vacunas Aplicadas',
            vacunas,
            Icons.vaccines,
            () => _mostrarDialogoAgregarElemento('vacuna', vacunas),
          ),
          _seccion(
            'Tratamientos',
            tratamientos,
            Icons.healing,
            () => _mostrarDialogoAgregarElemento('tratamiento', tratamientos),
          ),
          _seccion(
            'Archivos Adjuntos',
            archivosAdjuntos,
            Icons.attach_file,
            () => _mostrarDialogoAgregarElemento('archivo', archivosAdjuntos),
          ),
        ],
      ),
    );
  }
}
