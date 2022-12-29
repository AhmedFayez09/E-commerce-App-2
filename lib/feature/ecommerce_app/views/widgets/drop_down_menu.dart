// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropdownButtonComponant extends StatelessWidget {
  DropdownButtonComponant(
      {super.key,
      required this.onChanged,
      required this.items,
      required this.hintText});
  void Function(String?)? onChanged;
  final List<String> items;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      
      style: Theme.of(context).textTheme.bodyLarge,
      hint: Text(hintText),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          
          child: Text(value),
        );
      }).toList(),
    );
  }
}
