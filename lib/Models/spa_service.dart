class SpaService {
  String id;
  String name;
  String description;
  String? imageUrl;
  double rating;
  double tarifa;
  String tipo;

  SpaService({
    required this.id,
    required this.name,
    required this.description,
    required this.tarifa,
    required this.tipo,
    this.imageUrl,
    this.rating = 0.0,
  });

  static List<SpaService> spasEjemplo() {
    return [
      SpaService(
        id: 'spa1',
        name: 'Relax Pet Spa',
        description: 'Baño relajante y corte de pelo.',
        tarifa: 150.00,
        tipo: 'Baño y corte',
      ),
      SpaService(
        id: 'spa2',
        name: 'Happy Paws Grooming',
        description: 'Estilismo y cuidado completo.',
        rating: 4.8,
        tarifa: 150.00,
        tipo: 'Estilismo',
      ),
      SpaService(
        id: 'spa3',
        name: 'Aqua Dog Spa',
        description: 'Hidroterapia y masajes.',
        rating: 4.2,
        tarifa: 150.00,
        tipo: 'Hidroterapia',
      ),
      SpaService(
        id: 'spa4',
        name: 'Zen Garden Pets',
        description: 'Tratamientos holísticos.',
        rating: 4.6,
        tarifa: 150.00,
        tipo: 'Holístico',
      ),
    ];
  }
}
