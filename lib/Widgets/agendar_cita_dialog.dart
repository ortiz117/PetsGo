import 'package:flutter/material.dart';

class AgendarCitaDialog extends StatefulWidget {
  final String paquete;

  const AgendarCitaDialog({super.key, required this.paquete});

  @override
  State<AgendarCitaDialog> createState() => _AgendarCitaDialogState();
}

class _AgendarCitaDialogState extends State<AgendarCitaDialog> {
  DateTime? _fechaSeleccionada;
  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agendar cita para: ${widget.paquete}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre completo'),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  _fechaSeleccionada != null
                      ? 'Fecha: ${_fechaSeleccionada!.day}/${_fechaSeleccionada!.month}/${_fechaSeleccionada!.year}'
                      : 'No hay fecha seleccionada',
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? fecha = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (fecha != null) {
                    setState(() {
                      _fechaSeleccionada = fecha;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('Confirmar'),
          onPressed: () {
            if (_nombreController.text.isEmpty || _fechaSeleccionada == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Completa todos los campos')),
              );
              return;
            }

            Navigator.pop(context); // Cierra el diálogo

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Cita agendada para ${_nombreController.text} el ${_fechaSeleccionada!.day}/${_fechaSeleccionada!.month}/${_fechaSeleccionada!.year}',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
