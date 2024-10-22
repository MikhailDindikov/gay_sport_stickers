import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_sport_stickers/sg_controller.dart';
import 'package:gay_sport_stickers/sg_sys/sg_sys_screen.dart';
import 'package:get/get.dart';

class SgPremScreen extends StatefulWidget {
  const SgPremScreen({super.key});

  @override
  State<SgPremScreen> createState() => _SgPremScreenState();
}

class _SgPremScreenState extends State<SgPremScreen> {
  final _sgController = Get.find<SgController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
      body: SafeArea(
        child: GetBuilder<SgController>(builder: (_) {
          return SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28).copyWith(top: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'sg_assets/sg_images/pack_3.png',
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (!_sgController.sgPacks[2].sgBought)
                        GestureDetector(
                          onTap: () {
                            if (!_sgController.sportGayBuyLoad) {
                              _sgController.buySgPack();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
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
                            child: _sgController.sportGayBuyLoad
                                ? const Center(
                                    child: CupertinoActivityIndicator(),
                                  )
                                : const Text(
                                    'GET PACK FOR \$0,99',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        )
                      else
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(vertical: 14),
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
                          child: Text(
                            'Bought'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(86, 86, 86, 1),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.to(() => const SGSysScreen(
                                  sgt: 'pp',
                                ));
                          },
                          child: const Text(
                            'Privacy policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            if (!_sgController.sportGayRestLoad) {
                              _sgController.restSgPack();
                            }
                          },
                          child: _sgController.sportGayRestLoad
                              ? const CupertinoActivityIndicator()
                              : const Text(
                                  'Restore purchases',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.to(() => const SGSysScreen(
                                  sgt: 'tu',
                                ));
                          },
                          child: const Text(
                            'Terms of use',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
