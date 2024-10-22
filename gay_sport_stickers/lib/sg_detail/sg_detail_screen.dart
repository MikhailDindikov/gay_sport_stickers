import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_sport_stickers/sg_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preference_app_group/shared_preference_app_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SGDetailScreen extends StatefulWidget {
  final int sgInd;
  const SGDetailScreen({super.key, required this.sgInd});

  @override
  State<SGDetailScreen> createState() => _SGDetailScreenState();
}

class _SGDetailScreenState extends State<SGDetailScreen> {
  final _sgShowTitlePerc = 0.0.obs;
  final _sgScrollC = ScrollController();
  final _sgController = Get.find<SgController>();

  @override
  void initState() {
    super.initState();
    _sgScrollC.addListener(() {
      _sgShowTitlePerc.value =
          min(1, _sgScrollC.offset > 0 ? _sgScrollC.offset / 255 : 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
      body: SafeArea(
        child: SizedBox(
          child: GetBuilder<SgController>(builder: (_) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28).copyWith(top: 16),
              child: Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: SingleChildScrollView(
                      controller: _sgScrollC,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 228,
                                  width: 228,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 61.6,
                                        color:
                                            Color.fromRGBO(146, 180, 255, 0.3),
                                      )
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'sg_assets/sg_images/d_${widget.sgInd + 1}.png',
                                  height: 251,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            _sgController.sgPacks[widget.sgInd].sgDetTitle
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 48,
                              height: 1,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            _sgController.sgPacks[widget.sgInd].sgDesc,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(190, 196, 255, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(31),
                              color: const Color.fromRGBO(24, 58, 101, 1),
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 16),
                              itemCount: _sgController
                                  .sgPacks[widget.sgInd].sgPackStickers.length,
                              itemBuilder: (ctx, index) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.1),
                                  ),
                                  child: Image.asset(
                                      'sg_assets/sg_stickers/${_sgController.sgPacks[widget.sgInd].sgPackStickers[index]}')),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Opacity(
                            opacity: 0,
                            child: IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  gradient: const RadialGradient(
                                    center: Alignment.topCenter,
                                    radius: 2,
                                    colors: [
                                      Color.fromRGBO(99, 202, 239, 1),
                                      Color.fromRGBO(65, 99, 233, 1),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Download',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: 200.milliseconds,
                        color:
                            Color.fromRGBO(14, 31, 53, _sgShowTitlePerc.value),
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Image.asset(
                                    'sg_assets/sg_icons/back.png',
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  _sgController.sgPacks[widget.sgInd].sgTopTitle
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 36,
                                    height: 1,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white
                                        .withOpacity(_sgShowTitlePerc.value),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(),
                            // Image.asset(
                            //   'sg_assets/sg_icons/share.png',
                            //   height: 40,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {},
                      child: IntrinsicHeight(
                        child: _sgController.sgPacks[widget.sgInd].sgSelect
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  gradient: const RadialGradient(
                                    center: Alignment.topCenter,
                                    radius: 2,
                                    colors: [
                                      Color.fromRGBO(253, 253, 253, 1),
                                      Color.fromRGBO(182, 182, 182, 1),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Selected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(86, 86, 86, 1),
                                  ),
                                ),
                              )
                            : GestureDetector(
                              onTap: () {
                                _sgController.sgSelect(widget.sgInd);
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    gradient: const RadialGradient(
                                      center: Alignment.topCenter,
                                      radius: 2,
                                      colors: [
                                        Color.fromRGBO(99, 202, 239, 1),
                                        Color.fromRGBO(65, 99, 233, 1),
                                      ],
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Download',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
