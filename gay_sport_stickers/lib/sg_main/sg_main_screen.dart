import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_sport_stickers/sg_controller.dart';
import 'package:gay_sport_stickers/sg_detail/sg_detail_screen.dart';
import 'package:gay_sport_stickers/sg_model.dart';
import 'package:gay_sport_stickers/sg_prem/sg_prem_screen.dart';
import 'package:gay_sport_stickers/sg_sys/sg_sys_screen.dart';
import 'package:get/get.dart';

class SgMainScreen extends StatefulWidget {
  const SgMainScreen({super.key});

  @override
  State<SgMainScreen> createState() => _SgMainScreenState();
}

class _SgMainScreenState extends State<SgMainScreen> {
  final _sgController = Get.put(SgController());
  final GlobalKey<ScaffoldState> _keySc = GlobalKey();
  final _sgPageController = PageController();
  final _sgCurPage = 0.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _sgController.sgInit();
    });

    _sgPageController.addListener(() {
      if (_sgCurPage.value != _sgPageController.page!.round()) {
        _sgCurPage.value = _sgPageController.page!.round();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keySc,
      backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28).copyWith(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _keySc.currentState!.closeDrawer();
                  },
                  child: Image.asset(
                    'sg_assets/sg_icons/sett_open.png',
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SGSysScreen(
                          sgt: 'pp',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(190, 196, 255, 1),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Privacy policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(190, 196, 255, 1),
                          ),
                        ),
                        Image.asset(
                          'sg_assets/sg_icons/r_arr.png',
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SGSysScreen(
                          sgt: 'tu',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(190, 196, 255, 1),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Terms of use',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(190, 196, 255, 1),
                          ),
                        ),
                        Image.asset(
                          'sg_assets/sg_icons/r_arr.png',
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SGSysScreen(
                          sgt: 'su',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(190, 196, 255, 1),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Support',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(190, 196, 255, 1),
                          ),
                        ),
                        Image.asset(
                          'sg_assets/sg_icons/r_arr.png',
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<SgController>(
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        if (!_sgController.sportGayRestLoad) {
                          _sgController.restSgPack();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(190, 196, 255, 1),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _sgController.sportGayRestLoad
                                ? const CupertinoActivityIndicator()
                                : const Text(
                                    'Restore',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(190, 196, 255, 1),
                                    ),
                                  ),
                            Image.asset(
                              'sg_assets/sg_icons/r_arr.png',
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SgController>(builder: (_) {
          return _sgController.sportGayLoad
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28)
                        .copyWith(top: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          itemCount: 3,
                          controller: _sgPageController,
                          itemBuilder: (context, index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'sg_assets/sg_images/pack_${index + 1}.png',
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_sgController.sgPacks[index].sgBought) {
                                    Get.to(() => SGDetailScreen(sgInd: index));
                                  } else if (!_sgController.sportGayBuyLoad) {
                                    _sgController.buySgPack();
                                  }
                                },
                                child: Container(
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
                                  child: !_sgController
                                              .sgPacks[index].sgBought &&
                                          _sgController.sportGayBuyLoad
                                      ? const Center(
                                          child: CupertinoActivityIndicator(),
                                        )
                                      : Text(
                                          _sgController.sgPacks[index].sgBought
                                              ? 'See now'
                                              : 'GET PACK FOR \$0,99',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                        : const Color.fromRGBO(
                                            237, 237, 237, 1),
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
                                        : const Color.fromRGBO(
                                            237, 237, 237, 1),
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
                                        : const Color.fromRGBO(
                                            237, 237, 237, 1),
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
                                  _keySc.currentState!.openDrawer();
                                },
                                child: Image.asset(
                                  'sg_assets/sg_icons/sett_close.png',
                                  height: 40,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SgPremScreen());
                                },
                                child: Image.asset(
                                  'sg_assets/sg_icons/prem.png',
                                  height: 40,
                                ),
                              ),
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
