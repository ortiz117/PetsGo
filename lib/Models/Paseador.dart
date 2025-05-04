class Paseador {
  final String nombre;
  final String experiencia;
  final String descripcion;
  final String? imagen;
  int calificacion;
  final double tarifaHora;

  Paseador({
    required this.nombre,
    required this.experiencia,
    required this.descripcion,
    this.imagen,
    this.calificacion = 0,
    required this.tarifaHora,
  });

  static List<Paseador> paseadoresEjemplo() {
    return [
      Paseador(
        nombre: 'Carlos Méndez',
        experiencia: '5 años de experiencia',
        descripcion:
            'Especializado en paseos para perros grandes y activos. Certificado en primeros auxilios caninos.',
        // imagen: 'assets/paseador1.jpg',
        tarifaHora: 120.00,
      ),
      Paseador(
        nombre: 'Ana Torres',
        experiencia: '3 años de experiencia',
        descripcion:
            'Paseos personalizados según necesidades del perro. Experiencia con perros reactivos.',
        //imagen: 'assets/paseador2.jpg',
        tarifaHora: 100.00,
      ),
      Paseador(
        nombre: 'Luis Ramírez',
        experiencia: '7 años de experiencia',
        descripcion:
            'Servicio de paseo grupal para socialización canina. Incluye reporte de comportamiento.',
        // imagen: 'assets/paseador3.jpg',
        tarifaHora: 150.00,
      ),
      Paseador(
        nombre: 'María Sánchez',
        experiencia: '2 años de experiencia',
        descripcion:
            'Paseos recreativos con juegos y ejercicios. Ideal para perros jóvenes.',
        //  imagen: 'assets/paseador4.jpg',
        tarifaHora: 90.00,
      ),
    ];
  }
}
