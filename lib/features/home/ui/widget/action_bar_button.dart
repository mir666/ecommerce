import 'package:flutter/material.dart';

class ActionBarButton extends StatelessWidget {
  const ActionBarButton({
    super.key, required this.icon, required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.withOpacity(0.3),
        child: Icon(
          icon,
          color: Colors.black45,
          size: 20,
        ),
      ),
    );
  }
}
