import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CustomIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
    );
  }
}
