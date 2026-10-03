import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Каталог аквариумных рыбок',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CatalogScreen(),
    );
  }
}

class CatalogItemData {
  final String title;
  final String subtitle;
  final IconData categoryIcon;
  final Color color;

  const CatalogItemData({
    required this.title,
    required this.subtitle,
    required this.categoryIcon,
    required this.color,
  });
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<CatalogItemData> items = const [
    CatalogItemData(
      title: 'Неон голубой (Paracheirodon innesi)',
      subtitle: 'Яркая стайная рыбка с неоновой светящейся полосой',
      categoryIcon: Icons.water_drop,
      color: Colors.blue,
    ),
    CatalogItemData(
      title: 'Скалярия обыкновенная королевская',
      subtitle: 'Грациозная рыбка-ангел для просторных аквариумов',
      categoryIcon: Icons.set_meal,
      color: Colors.purple,
    ),
    CatalogItemData(
      title: 'Гуппи элитный вуалевый',
      subtitle: 'Популярная живородящая рыбка с пышным ярким хвостом',
      categoryIcon: Icons.pets,
      color: Colors.orange,
    ),
    CatalogItemData(
      title: 'Петушок сиамский (Betta splendens)',
      subtitle: 'Красивая бойцовая рыбка с яркими вуалевыми плавниками',
      categoryIcon: Icons.flash_on,
      color: Colors.red,
    ),
    CatalogItemData(
      title: 'Коридорас крапчатый сомик',
      subtitle: 'Миролюбивый донный сомик для очистки аквариумного грунта',
      categoryIcon: Icons.cleaning_services,
      color: Colors.teal,
    ),
    CatalogItemData(
      title: 'Анциструс обыкновенный',
      subtitle: 'Полезный сомик-прилипала, поедающий водорослевый налет',
      categoryIcon: Icons.shield,
      color: Colors.blueGrey,
    ),
    CatalogItemData(
      title: 'Боция-клоун тигровая полосатая',
      subtitle: 'Подвижная и общительная рыбка с яркими полосками',
      categoryIcon: Icons.attractions,
      color: Colors.deepOrange,
    ),
    CatalogItemData(
      title: 'Дискус королевский голубой',
      subtitle: 'Элитная дисковидная рыбка с неповторимым ярким узором',
      categoryIcon: Icons.star,
      color: Colors.cyan,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аквариумные рыбки'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CatalogCard(item: items[index]);
        },
      ),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final CatalogItemData item;

  const CatalogCard({
    super.key,
    required this.item,
  });

   @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 85,
              height: 85,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          item.color.withOpacity(0.4),
                          item.color.withOpacity(0.1),
                        ],
                         begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: item.color, width: 1.5),
                    ),
                  ),
                  Center(
                    child: Text(
                      item.title.isNotEmpty ? item.title[0] : '?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: item.color,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        item.categoryIcon,
                        size: 16,
                        color: item.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Категория',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}