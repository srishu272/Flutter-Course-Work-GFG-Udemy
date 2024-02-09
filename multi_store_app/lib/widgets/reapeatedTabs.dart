import 'package:flutter/material.dart';

class RepeatedTab extends StatelessWidget {
  const RepeatedTab({super.key, required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabName,
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );
  }
}