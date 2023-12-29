import 'package:flutter/material.dart';
import 'package:jerseyshop/shared/theme.dart';

class SizeItem extends StatefulWidget {
  final String size;

  const SizeItem({
    super.key,
    required this.size,
  });

  @override
  State<SizeItem> createState() => _SizeItemState();
}

class _SizeItemState extends State<SizeItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12, left: 12),
        alignment: Alignment.center,
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: _isSelected ? secondary : grey,
          borderRadius: BorderRadius.circular(104),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          widget.size,
          style: _isSelected
              ? darkText.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                )
              : whiteText.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
        ),
      ),
    );
  }
}
