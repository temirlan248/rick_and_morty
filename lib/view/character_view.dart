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
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 150,
              child: Image.network(
                character.image,
                errorBuilder: (context, _, stackTrace) {
                  return Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  final progress =
                      (loadingProgress?.cumulativeBytesLoaded ?? 1) /
                          (loadingProgress?.expectedTotalBytes ?? 1);

                  if (progress < 1) {
                    return SizedBox.square(
                      dimension: 48,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
