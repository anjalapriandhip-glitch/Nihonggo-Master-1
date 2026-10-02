
import 'package:flutter/material.dart';
import '../models.dart';
import '../services/data_service.dart';
import '../services/progress_service.dart';
import '../widgets/level_chips.dart';

class KotobaScreen extends StatefulWidget {
  const KotobaScreen({super.key});

  @override
  State<KotobaScreen> createState() => _KotobaScreenState();
}

class _KotobaScreenState extends State<KotobaScreen> {
  String level = 'ALL';
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kotoba • Kosakata'),
      ),
      body: FutureBuilder<List<Kotoba>>(
        future: DataService.kotoba(),
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
                        '${x.kanji} ${x.kana} ${x.romaji} ${x.meaning}'
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
                    hintText: 'Cari kosakata...',
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
                        onExpansionChanged: (open) {
                          if (open) {
                            ProgressService.addLearned();
                          }
                        },
                        title: Text(
                          '${item.kanji}  ${item.kana}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${item.meaning} • ${item.level}',
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
                                Text(
                                  item.romaji,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.example,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(item.exampleMeaning),
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
