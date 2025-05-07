class Veterinario {
  String nombre;
  String especialidad;
  String descripcion;
  String? imagen;
  int calificacion;
  double tarifaHora;

  Veterinario({
    required this.nombre,
    required this.especialidad,
    required this.descripcion,
    required this.tarifaHora,
    this.imagen,
    this.calificacion = 0,
  });

  static List<Veterinario> veterinariosEjemplo() {
    return [
      Veterinario(
        nombre: 'Dr. Martínez',
        especialidad: 'Cardiólogo Veterinario',
        descripcion:
            'Especializado en cardiología animal con más de 10 años de experiencia. Graduado de la Universidad Nacional.',
        tarifaHora: 200.00,
        imagen: 'https://picsum.photos/seed/drmartinez/100/100',
        calificacion: 5,
      ),
      Veterinario(
        nombre: 'Dra. García',
        especialidad: 'Dermatóloga Veterinaria',
        descripcion:
            'Experta en problemas de piel y alergias en mascotas. Realizó sus estudios de posgrado en España.',
        tarifaHora: 200.00,
        imagen: 'https://picsum.photos/seed/dragarcia/100/100',
        calificacion: 4,
      ),
      Veterinario(
        nombre: 'Dr. López',
        especialidad: 'Cirujano Veterinario',
        descripcion:
            'Especialista en cirugías de tejidos blandos y ortopedia. Ha realizado más de 500 cirugías exitosas.',
        tarifaHora: 200.00,
        imagen: 'https://picsum.photos/seed/drlopez/100/100',
        calificacion: 5,
      ),
      Veterinario(
        nombre: 'Dra. Rodríguez',
        especialidad: 'Oftalmóloga Veterinaria',
        descripcion:
            'Especialista en problemas oculares en animales pequeños y exóticos. Miembro de la asociación internacional.',
        tarifaHora: 200.00,
        imagen: 'https://api.dicebear.com/7.x/personas/svg?seed=drodriguez',
        calificacion: 4,
      ),
      Veterinario(
        nombre: 'Dr. Pet',
        especialidad: 'Generalista',
        descripcion: 'Consulta general, vacunas, desparasitación.',
        tarifaHora: 100.00,
        imagen: 'https://api.dicebear.com/7.x/personas/svg?seed=drpet',
        calificacion: 5,
      ),
    ];
  }
}
