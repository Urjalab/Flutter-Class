import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPress;
  const ItemTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
