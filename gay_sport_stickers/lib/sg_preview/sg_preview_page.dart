import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SGPreviewPage extends StatelessWidget {
  final int sg_index;
  final void Function() onSgContTap;
  const SGPreviewPage(
      {super.key, required this.sg_index, required this.onSgContTap});

  String get sgPathImg => sg_index == 0
      ? 'sg_assets/sg_images/1.png'
      : sg_index == 1
          ? 'sg_assets/sg_images/2.png'
          : 'sg_assets/sg_images/3.png';

  String get sgText => sg_index == 0
      ? 'Explore our collection of stickers that reflect moments of tenderness, support and mutual care. Find the ones that best convey your feelings.'
      : sg_index == 1
          ? 'Send stickers to your partner and create bright and unforgettable moments of communication. Each sticker is a way to show love.'
          : 'We support your right to be unique. Customize your space and socialize the way you feel comfortable.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Image.asset(
            sgPathImg,
            height: 375,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          sgText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        
      ],
    );
  }
}
