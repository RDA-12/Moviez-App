import 'package:flutter/material.dart';

class InteractiveCard extends StatelessWidget {
  const InteractiveCard({
    Key? key,
    this.onTap,
    this.onLongPress,
    this.color,
    required this.child,
  }) : super(key: key);

  final Function()? onTap;
  final Function()? onLongPress;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        overlayColor: MaterialStateColor.resolveWith(
          (_) => Theme.of(context).colorScheme.primary,
        ),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Card(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
