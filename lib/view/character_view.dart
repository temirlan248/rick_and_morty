import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

class CharacterView extends StatelessWidget {
  final Character character;

  const CharacterView(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              character.image,
              errorBuilder: (context, _, stackTrace) {
                return Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                final progress = (loadingProgress?.cumulativeBytesLoaded ?? 1) /
                    (loadingProgress?.expectedTotalBytes ?? 1);

                if (progress < 1) {
                  return SizedBox.square(
                    dimension: 48,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: progress,
                      ),
                    ),
                  );
                }
                return child;
              },
            ),
          ),
          Text(
            character.name,
          ),
        ],
      ),
    );
  }
}
