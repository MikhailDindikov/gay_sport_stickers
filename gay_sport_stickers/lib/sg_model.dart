class SgModel {
  final String sgTitle;
  final String sgDetTitle;
  final String sgTopTitle;
  final String sgDesc;
  final int sgIndex;
  final String sgPackPhoto;
  final List<String> sgPackStickers;
  bool sgSelect;
  bool sgBought;

  SgModel({
    required this.sgTitle,
    required this.sgDetTitle,
    required this.sgTopTitle,
    required this.sgDesc,
    required this.sgIndex,
    required this.sgPackPhoto,
    required this.sgPackStickers,
    required this.sgSelect,
    required this.sgBought,
  });
}
