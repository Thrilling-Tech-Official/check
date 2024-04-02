// class SurahTranslationList{
//   final List<SurahTranslation> translationList;
//
//   SurahTranslationList({required this.translationList});
//
//   factory SurahTranslationList.fromJson(Map<String,dynamic> map){
//     Iterable translation = map['result'];
//     List<SurahTranslation> list = translation.map((e) =>SurahTranslation.fromJson(e)).toList();
//     return SurahTranslationList(translationList: list);
//   }
// }
//
// class SurahTranslation{
//   String? sura;
//   String? aya;
//   String? arabic_text;
//   String? translation;
//
//   SurahTranslation({this.sura, this.aya, this.arabic_text, this.translation});
//
//   factory SurahTranslation.fromJson(Map<String,dynamic> json){
//     return SurahTranslation(
//       sura: json['sura'],
//       aya: json['aya'],
//       arabic_text: json['arabic_text'],
//       translation: json['translation'],
//     );
//   }
// }
///api
///// ///For getting translation of surahs
// //   Future<SurahTranslationList> getTranslation(
// //       int index) async {
// //     final url = "https://quranenc.com/api/translation/sura/urdu_junagarhi/$index";
// //     var res = await http.get(Uri.parse(url));
// //     if (res.statusCode == 200) {
// //       print(json.decode(res.body));
// //       return SurahTranslationList.fromJson(json.decode(res.body));
// //
// //     } else {
// //       throw ("Can't get Data");
// //     }
// //   }