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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.asset(
              sight.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sight.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  sight.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            sight.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: sight.isLiked ? Colors.red : Colors.grey,
                          ),
                          onPressed: onLikePressed,
                        ),
                        Text('${sight.likeCount}'),
                      ],
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