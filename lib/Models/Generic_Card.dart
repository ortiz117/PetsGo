import 'package:flutter/material.dart';

class GenericServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String? priceText;
  final int rating;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<int>? onRatingChanged;
  final Color accentColor;
  final String ratingLabel;

  const GenericServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    this.priceText,
    required this.rating,
    required this.isSelected,
    required this.onTap,
    this.onRatingChanged,
    this.accentColor = Colors.blue,
    this.ratingLabel = 'Califica este servicio:',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? accentColor : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con foto y nombre
              Row(
                children: [
                  CircleAvatar(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        if (priceText != null)
                          Text(
                            priceText!,
                            style: TextStyle(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (isSelected) Icon(Icons.check_circle, color: accentColor),
                ],
              ),

              const SizedBox(height: 12),

              // Descripción
              Text(description, style: const TextStyle(fontSize: 14)),

              const SizedBox(height: 12),

              // Calificación
              if (onRatingChanged != null) ...[
                const Divider(),
                _buildRatingSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ratingLabel, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 30,
              ),
              onPressed: () {
                if (onRatingChanged != null) {
                  onRatingChanged!(index + 1);
                }
              },
            );
          }),
        ),
      ],
    );
  }
}
