import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jerseyshop/models/item_clubdata.dart';
import 'package:jerseyshop/models/item_data.dart';
import 'package:jerseyshop/screens/pages/page_detail.dart';
import 'package:jerseyshop/screens/widgets/item_card.dart';
import 'package:jerseyshop/shared/theme.dart';

class Homepage extends StatefulWidget {
  final List<ItemData> cardItems = [
    ItemData(
      imgJersey: 'assets/imgs/img_jersey1.png',
      bgColor: secondary,
      nameJersey: 'Yellow Jersey',
      imgPlayer: 'assets/imgs/img_ronaldo1.png',
    ),
    ItemData(
      imgJersey: 'assets/imgs/img_jersey2.png',
      bgColor: grey,
      nameJersey: 'White Jersey',
      imgPlayer: 'assets/imgs/img_ronaldo2.png',
    ),
    ItemData(
      imgJersey: 'assets/imgs/img_jersey3.png',
      bgColor: primary,
      nameJersey: 'Blue Jersey',
      imgPlayer: 'assets/imgs/img_ronaldo3.png',
    )
  ];

  final List<ClubData> clubItem = [
    ClubData(
      logo: 'assets/imgs/img_logo5.png',
    ),
    ClubData(
      logo: 'assets/imgs/img_logo4.png',
    ),
    ClubData(
      logo: 'assets/imgs/img_logo1.png',
    ),
    ClubData(
      logo: 'assets/imgs/img_logo2.png',
    ),
    ClubData(
      logo: 'assets/imgs/img_logo3.png',
    ),
  ];

  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/imgs/img_logo.png',
              width: 72,
              height: 24,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svgs/ic_menu.svg',
                width: 32,
                height: 32,
              ),
            ),
          ],
        ),
      );
    }

    Widget tabBar() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        height: 82,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.clubItem.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final isSelected = index == _selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(104),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: isSelected ? secondary : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      widget.clubItem[index].logo,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    Widget card() {
      return CarouselSlider(
        options: CarouselOptions(
          height: 450,
          aspectRatio: 16 / 9,
          viewportFraction: 0.72,
          enlargeCenterPage: true,
        ),
        items: widget.cardItems.map((item) {
          return Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(),
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Container(
                    width: 272,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: CardItem(
                      bgColor: item.bgColor,
                      imgJersey: item.imgJersey,
                      imgPlayer: item.imgPlayer,
                      nameJersey: item.nameJersey,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    }

    Widget nextButton() {
      return Container(
        width: 40,
        height: 40,
        child: SvgPicture.asset('assets/svgs/ic_next.svg'),
      );
    }

    Widget nextPlayer() {
      return Opacity(
        opacity: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(104),
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/img_gonzalo.png'),
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
                    'Central Midfielder',
                    style: greyText.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    'Gonzalo Pity Martinez',
                    style: darkText.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            height: 640,
            margin: EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.2),
                  blurRadius: 60,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                tabBar(),
                card(),
                nextButton(),
              ],
            ),
          ),
          nextPlayer(),
        ],
      ),
    );
  }
}
