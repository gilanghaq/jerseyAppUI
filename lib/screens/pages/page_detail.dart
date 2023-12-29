import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jerseyshop/screens/widgets/item_size.dart';
import 'package:jerseyshop/shared/theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _playerNumAnimationController;
  late Animation<double> _playerNumFadeInAnimation;
  late AnimationController _playerImgAnimationController;
  late Animation<double> _playerImgFadeInAnimation;
  late AnimationController _jerseyInfoAnimationController;
  late Animation<double> _jerseyInfoFadeInAnimation;

  @override
  void initState() {
    super.initState();
    _playerNumAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _playerNumFadeInAnimation = CurvedAnimation(
      parent: _playerNumAnimationController,
      curve: Curves.easeIn,
    );
    _playerNumAnimationController.forward();

    _playerImgAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _playerImgFadeInAnimation = CurvedAnimation(
      parent: _playerImgAnimationController,
      curve: Curves.easeIn,
    );
    _playerImgAnimationController.forward();

    _jerseyInfoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _jerseyInfoFadeInAnimation = CurvedAnimation(
      parent: _jerseyInfoAnimationController,
      curve: Curves.easeIn,
    );
    _jerseyInfoAnimationController.forward();
  }

  @override
  void dispose() {
    _playerNumAnimationController.dispose();
    _playerImgAnimationController.dispose();
    _jerseyInfoAnimationController.dispose();
    super.dispose();
  }

  Widget backButton({required BuildContext context}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(top: 40, left: 8),
        child: IconButton(
          onPressed: (() => Navigator.of(context).pop()),
          icon: SvgPicture.asset(
            'assets/svgs/ic_back.svg',
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }

  Widget playerImg() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 382 * 0.86,
        height: 759 * 0.86,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/imgs/img_ronaldo4.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget jerseyInfo() {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 247),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 55 * 1.2,
              height: 77 * 1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/imgs/img_logo1.png',
                  ),
                ),
              ),
            ),
            Text(
              'Christiano\nRonaldo',
              style: darkText.copyWith(
                fontSize: 32,
                fontWeight: bold,
              ),
            ),
            Text(
              'Al-Nassr Yellow Jersey',
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playerNum() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 229 * 1.2,
        width: 82 * 1.2,
        margin: EdgeInsets.only(right: 24, top: 240),
        child: Opacity(
          opacity: 0.2,
          child: SvgPicture.asset(
            'assets/svgs/ic_7.svg',
          ),
        ),
      ),
    );
  }

  Widget orderSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(right: 24, left: 24, top: 48),
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
          color: grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Available Size',
              style: greyText.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: SizeItem(size: 'S'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: SizeItem(size: 'M'),
                ),
                SizeItem(size: 'L'),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: SizeItem(size: 'XL'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: SizeItem(size: '2XL'),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp 240.000',
                        style: darkText.copyWith(
                          fontSize: 24,
                          fontWeight: semibold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Player sign included',
                        style: greyText.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Order Now',
                    style: whiteText.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          backButton(context: context),
          AnimatedBuilder(
            animation: _playerNumFadeInAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _playerNumFadeInAnimation.value,
                child: child,
              );
            },
            child: playerNum(),
          ),
          AnimatedBuilder(
            animation: _playerImgFadeInAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _playerImgFadeInAnimation.value,
                child: child,
              );
            },
            child: playerImg(),
          ),
          AnimatedBuilder(
            animation: _jerseyInfoFadeInAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _jerseyInfoFadeInAnimation.value,
                child: child,
              );
            },
            child: jerseyInfo(),
          ),
          orderSection(),
        ],
      ),
    );
  }
}
