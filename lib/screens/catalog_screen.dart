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
      title: 'Озеро Байкал',
      description: 'Самое глубокое озеро на планете с чистейшей водой.',
      imageUrl: 'https://picsum.photos/id/1018/600/400',
      likeCount: 42,
    ),
    Sight(
      id: '2',
      title: 'Кавказские горы',
      description: 'Величественные горные вершины и живописные ущелья.',
      imageUrl: 'https://picsum.photos/id/1015/600/400',
      likeCount: 18,
    ),
    Sight(
      id: '3',
      title: 'Амурский залив',
      description: 'Живописный залив Японского моря на Дальнем Востоке.',
      imageUrl: 'https://picsum.photos/id/1039/600/400',
      likeCount: 25,
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
            content: Text('Вы добавили в избранное: ${sight.title}'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        sight.likeCount--;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Вы удалили из избранного: ${sight.title}'),
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
        title: const Text('Каталог мест'),
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