import 'package:flutter/material.dart';
import '../models/sight.dart';
import '../widgets/catalog_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Sight> _sights = [
    Sight(
      id: '1',
      title: 'Гуппи',
      description: 'Неприхотливая и яркая живородящая рыбка для любого аквариума.',
      imageUrl: 'assets/images/istockphoto-178152778-612x612.jpg',
      likeCount: 15,
    ),
    Sight(
      id: '2',
      title: 'Скалярия',
      description: 'Грациозная рыбка-ангел с красивыми плавниками и спокойным нравом.',
      imageUrl: 'assets/images/istockphoto-178152778-612x612.jpg',
      likeCount: 24,
    ),
    Sight(
      id: '3',
      title: 'Золотая рыбка',
      description: 'Классическая обитательница аквариумов с роскошным хвостом.',
      imageUrl: 'assets/images/istockphoto-178152778-612x612.jpg',
      likeCount: 31,
    ),
  ];

  void _toggleLike(String id) {
    setState(() {
      final sight = _sights.firstWhere((s) => s.id == id);
      sight.isLiked = !sight.isLiked;
      if (sight.isLiked) {
        sight.likeCount++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('В избранное добавлено: ${sight.title}'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        sight.likeCount--;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Удалено из избранного: ${sight.title}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог рыбок'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _sights.length,
        itemBuilder: (context, index) {
          final sight = _sights[index];
          return CatalogCard(
            sight: sight,
            onLikePressed: () => _toggleLike(sight.id),
          );
        },
      ),
    );
  }
}