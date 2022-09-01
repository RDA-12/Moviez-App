import 'package:flutter/material.dart';
import 'package:moviez_app/presentation/views/widgets/horizontal_space.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key? key, required this.rating}) : super(key: key);

  final String rating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Theme.of(context).colorScheme.onBackground,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Theme.of(context).colorScheme.background,
              ),
              const HorizontalSpace(width: 5),
              Text(
                rating,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
