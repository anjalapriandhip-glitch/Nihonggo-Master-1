
import 'package:flutter/material.dart';
import '../models.dart';
import '../services/data_service.dart';
import '../widgets/level_chips.dart';

class BunpoScreen extends StatefulWidget {
  const BunpoScreen({super.key});

  @override
  State<BunpoScreen> createState() => _BunpoScreenState();
}

class _BunpoScreenState extends State<BunpoScreen> {
  String level = 'ALL';
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bunpō • 文法'),
      ),
      body: FutureBuilder<List<Bunpo>>(
        future: DataService.bunpo(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!
              .where(
                (x) =>
                    (level == 'ALL' || x.level == level) &&
                    (query.isEmpty ||
                        '${x.pattern} ${x.formula} ${x.meaning}'
                            .toLowerCase()
                            .contains(query.toLowerCase())),
              )
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari pola bunpō...',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: LevelChips(
                  selected: level,
                  onChanged: (value) {
                    setState(() {
                      level = value;
                    });
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];

                    return Card(
                      child: ExpansionTile(
                        title: Text(
                          item.pattern,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${item.level} • ${item.meaning}',
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              18,
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Rumus',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(item.formula),
                                const SizedBox(height: 10),
                                Text(
                                  item.example,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(item.exampleMeaning),
                                const SizedBox(height: 8),
                                Text(item.meaning),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
