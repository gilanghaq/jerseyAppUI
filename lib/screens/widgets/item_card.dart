import 'package:flutter/material.dart';
import 'package:jerseyshop/shared/theme.dart';

class CardItem extends StatelessWidget {
  final String imgJersey;
  final Color bgColor;
  final String nameJersey;
  final String imgPlayer;

  const CardItem({
    Key? key,
    required this.imgJersey,
    required this.bgColor,
    required this.nameJersey,
    required this.imgPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 254,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imgJersey),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: Text(
              nameJersey,
              style: darkText.copyWith(
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(104),
                  image: DecorationImage(
                    image: AssetImage(
                      imgPlayer,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Center Forward',
                    style: greyText.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    'Christiano Ronaldo',
                    style: darkText.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
