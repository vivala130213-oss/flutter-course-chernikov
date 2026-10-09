import 'package:flutter/material.dart';
import '../models/sight.dart';

class CatalogCard extends StatelessWidget {
  final Sight sight;
  final VoidCallback onLikePressed;

  const CatalogCard({
    super.key,
    required this.sight,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAlignment.start,
        children: [
          Image.network(
            sight.imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 180,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAlignment.start,
              children: [
                Text(
                  sight.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  sight.description,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          sight.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: sight.isLiked ? Colors.red : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text('${sight.likeCount}'),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        sight.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: sight.isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: onLikePressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
