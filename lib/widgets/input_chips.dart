import 'package:flutter/material.dart';

class InputChip extends StatefulWidget {
  const InputChip({super.key});

  @override
  State<InputChip> createState() => _InputChipState();
}

class _InputChipState extends State<InputChip> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<String> _options = ['Oat Milk', 'Soy Milk', 'Almond Milk'];

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          _options[i],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(choiceChip);
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: chips,
    );
  }
}
