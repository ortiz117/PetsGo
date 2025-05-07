class ServicioFunebre {
  final String titulo;
  final String subtitulo;
  final String descripcion;
  final String? precio;

  ServicioFunebre({
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
    this.precio,
  });
}

final List<ServicioFunebre> serviciosFunebres = [
  ServicioFunebre(
    titulo: 'Ceremonia básica',
    subtitulo: 'Incluye ataúd y sala de velación',
    descripcion: 'Ceremonia tradicional con todos los elementos esenciales.',
    precio: '\$5,000',
  ),
  ServicioFunebre(
    titulo: 'Despedida Esencial',
    subtitulo: 'Cremación individual con entrega de cenizas',
    descripcion:
        'Incluye recogida en domicilio, cremación individual en horno especializado y urna básica biodegradable.',
    precio: '\$3,800',
  ),
  ServicioFunebre(
    titulo: 'Ceremonia premium',
    subtitulo: 'Todo incluido con transporte y arreglos florales',
    descripcion: 'Servicio completo con atención personalizada.',
    precio: '\$10,000',
  ),
  ServicioFunebre(
    titulo: 'Ceremonia Diamante',
    subtitulo: 'Servicio completo con memorial digital',
    descripcion: '''
  - Recogida con vehículo acondicionado
  - Sala de velación con arreglos florales
  - Video-homenaje con 20 fotos
  - Urna de madera tallada con placa grabada
  - Certificado de cremación con huella pawprint''',
    precio: '\$12,500',
  ),
  ServicioFunebre(
    titulo: 'Entierro Ecológico',
    subtitulo: 'Funeral sostenible en jardín memorial',
    descripcion:
        'Ataúd de materiales biodegradables, siembra de árbol nativo como memorial y ceremonia en bosque autorizado.',
    precio: '\$8,200',
  ),
  ServicioFunebre(
    titulo: 'Plan Caballos',
    subtitulo: 'Transporte y cremación especializada',
    descripcion:
        'Equipo especial para traslado, cremación en horno industrial y urnas XL con opción a joyería conmemorativa.',
    precio: '\$15,000+',
  ),
  ServicioFunebre(
    titulo: 'Atención Inmediata',
    subtitulo: 'Recogida urgente las 24 horas',
    descripcion:
        'Servicio express con recogida en menos de 2 horas (incluye conservación temporal y gestión de documentos).',
    precio: '\$4,500',
  ),
];
