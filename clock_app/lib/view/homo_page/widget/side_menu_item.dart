import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.icon,
    required this.text,
    required this.size,
    required this.colors,
  });
  final IconData icon;
  final String text;
  final double size;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 80,
        width: 100,
        child: Column(
          children: [
            Icon(
              icon,
              color: colors,
              size: size,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: colors),
            )
          ],
        ),
      ),
    );
  }
}
