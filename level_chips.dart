
import 'package:flutter/material.dart';

class LevelChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;
  const LevelChips({super.key, required this.selected, required this.onChanged});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: ['ALL','N5','N4','N3'].map((l)=>Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(label: Text(l), selected: selected==l, onSelected: (_)=>onChanged(l)),
    )).toList()),
  );
}
