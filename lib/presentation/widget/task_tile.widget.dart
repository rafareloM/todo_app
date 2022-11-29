import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;

  final bool isSelected;

  final Function() onTap;

  const TaskTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank),
      selected: isSelected,
      title: Text(title),
      onTap: onTap,
      selectedTileColor: Colors.greenAccent,
      autofocus: false,
    );
  }
}
