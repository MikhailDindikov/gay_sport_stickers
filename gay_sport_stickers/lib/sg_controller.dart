import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/material.dart';
import 'package:gay_sport_stickers/sg_model.dart';
import 'package:get/get.dart';
import 'package:shared_preference_app_group/shared_preference_app_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SgController extends GetxController {
  bool sportGayLoad = true;
  bool sportGayBuyLoad = false;
  bool sportGayRestLoad = false;
  List<SgModel> sgPacks = [];

  Future<void> sgSelect(int sgIndex) async {
    if (!sgPacks[sgIndex].sgSelect) {
      sgPacks[0].sgSelect = false;
      sgPacks[1].sgSelect = false;
      sgPacks[2].sgSelect = false;
      sgPacks[sgIndex].sgSelect = true;
      update();
      //await SharedPreferenceAppGroup.setAppGroup('group.gaysSportPacks');
      await SharedPreferenceAppGroup.setInt('sportGayType', sgIndex);
      print(await SharedPreferenceAppGroup.getInt('sportGayType'));
    }
  }

  Future<void> buySgPack() async {
    sportGayBuyLoad = true;
    update();
    final pwlsSportGay = await Apphud.rawPaywalls();
    print(pwlsSportGay?.paywalls.first.products!);

    final purSportGay = await Apphud.purchase(
      product: pwlsSportGay?.paywalls.first.products!.first,
    );
    if (purSportGay.error == null) {
      final sportGayPrefs = await SharedPreferences.getInstance();
      await sportGayPrefs.setBool('interB', true);
      sgPacks[2].sgBought = true;
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
        message: 'Hooray!',
        messageText: const Text(
          'Hooray!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
        message: 'Some error happens',
        messageText: const Text(
          'Some error happens',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    }

    sportGayBuyLoad = false;
    update();
  }

  Future<void> restSgPack() async {
    sportGayRestLoad = true;
    update();
    final ApphudComposite restPuSportGays = await Apphud.restorePurchases();

    bool failPuSportGays = true;

    if (restPuSportGays.purchases.isNotEmpty) {
      for (final pu in restPuSportGays.purchases) {
        if (pu.productId == 'premium') {
          failPuSportGays = false;
          final sportGayPrefs = await SharedPreferences.getInstance();
          await sportGayPrefs.setBool('interB', true);
          sgPacks[2].sgBought = true;
          break;
        }
      }
    }

    if (failPuSportGays) {
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
        message: 'No purchases found',
        messageText: const Text(
          'No purchases found',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
        message: 'Purchase restored!',
        messageText: const Text(
          'Purchase restored!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    }

    sportGayRestLoad = false;
    update();
  }

  Future<void> sgInit() async {
    final gPrefs = await SharedPreferences.getInstance();
    final interB = gPrefs.getBool('interB') ?? false;

    await SharedPreferenceAppGroup.setAppGroup('group.gaysSportPacks');
    final sportGayType =
        await SharedPreferenceAppGroup.getInt('sportGayType') ?? 0;

    sgPacks = [
      SgModel(
        sgTitle: 'Sports gays',
        sgDetTitle: 'Sports\ngays',
        sgTopTitle: 'gays',
        sgDesc:
            'A bright and positive collection celebrating the LGBTQ+ community in sports. Each sticker features fun characters, athletes.',
        sgIndex: 0,
        sgPackPhoto: 'dsfsdfq111234dsa',
        sgPackStickers: [
          'g1.png',
          'g2.png',
          'g3.png',
          'g4.png',
          'g5.png',
          'g6.png',
          'g7.png',
          'g8.png',
        ],
        sgSelect: sportGayType == 0,
        sgBought: true,
      ),
      SgModel(
        sgTitle: 'lesbians',
        sgDetTitle: 'lesbians',
        sgTopTitle: 'lesbians',
        sgDesc:
            'The Lesbian stickerpack is a tender and inspiring collection of couple stickers symbolizing love and unity between girls.',
        sgIndex: 1,
        sgPackPhoto: 'dsfsdfq111234dsa',
        sgPackStickers: [
          'l1.png',
          'l2.png',
          'l3.png',
          'l4.png',
          'l5.png',
          'l6.png',
          'l7.png',
          'l8.png',
        ],
        sgSelect: sportGayType == 1,
        sgBought: true,
      ),
      SgModel(
        sgTitle: 'intersex',
        sgDetTitle: 'intersex',
        sgTopTitle: 'intersex',
        sgDesc:
            'The intersex is a unique collection of stickers designed for couples who celebrate their love and identity across borders.',
        sgIndex: 2,
        sgPackPhoto: 'dsdss232478trueyrtewr',
        sgPackStickers: [
          'i1.png',
          'i2.png',
          'i3.png',
          'i4.png',
          'i5.png',
          'i6.png',
          'i7.png',
          'i8.png',
        ],
        sgSelect: sportGayType == 2,
        sgBought: interB,
      ),
    ];

    sportGayLoad = false;
    update();
  }
}
