import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_sport_stickers/sg_main/sg_main_screen.dart';
import 'package:gay_sport_stickers/sg_preview/sg_preview_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SGPreviewScreen extends StatefulWidget {
  const SGPreviewScreen({super.key});

  @override
  State<SGPreviewScreen> createState() => _SGPreviewScreenState();
}

class _SGPreviewScreenState extends State<SGPreviewScreen> {
  final _sgPageController = PageController();
  final _sgCurPage = 0.obs;

  @override
  void initState() {
    super.initState();

    _sgPageController.addListener(() {
      if (_sgCurPage.value != _sgPageController.page!.round()) {
        _sgCurPage.value = _sgPageController.page!.round();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 8, bottom: 17),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _sgPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SGPreviewPage(
                      sg_index: 0,
                      onSgContTap: () {
                        _sgPageController.nextPage(
                          duration: 300.milliseconds,
                          curve: Curves.linear,
                        );
                      },
                    ),
                    SGPreviewPage(
                      sg_index: 1,
                      onSgContTap: () {
                        _sgPageController.nextPage(
                          duration: 300.milliseconds,
                          curve: Curves.linear,
                        );
                      },
                    ),
                    SGPreviewPage(
                      sg_index: 2,
                      onSgContTap: () async {
                        final sgSP = await SharedPreferences.getInstance();
                        sgSP.setBool('sgShowIntro', false);

                        Get.offAll(() => const SgMainScreen());
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (_sgCurPage.value != 2) {
                    _sgPageController.nextPage(
                      duration: 300.milliseconds,
                      curve: Curves.linear,
                    );
                  } else {
                    final sgSP = await SharedPreferences.getInstance();
                    sgSP.setBool('sgShowIntro', false);

                    Get.offAll(() => const SgMainScreen());
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: const Color.fromRGBO(45, 86, 225, 1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => AnimatedContainer(
                          duration: 300.milliseconds,
                          height: 8,
                          width: _sgCurPage.value == 0 ? 30 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _sgCurPage.value == 0
                                ? const Color.fromRGBO(57, 112, 231, 1)
                                : const Color.fromRGBO(237, 237, 237, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Obx(
                        () => AnimatedContainer(
                          duration: 300.milliseconds,
                          height: 8,
                          width: _sgCurPage.value == 1 ? 30 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _sgCurPage.value == 1
                                ? const Color.fromRGBO(57, 112, 231, 1)
                                : const Color.fromRGBO(237, 237, 237, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Obx(
                        () => AnimatedContainer(
                          duration: 300.milliseconds,
                          height: 8,
                          width: _sgCurPage.value == 2 ? 30 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _sgCurPage.value == 2
                                ? const Color.fromRGBO(57, 112, 231, 1)
                                : const Color.fromRGBO(237, 237, 237, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final sgSP = await SharedPreferences.getInstance();
                      sgSP.setBool('sgShowIntro', false);

                      Get.offAll(() => const SgMainScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 40),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(112, 174, 255, 0.32),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
