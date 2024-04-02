// import 'dart:convert';
//
// import 'ayatModel.dart';
//
//
// List<Surah> surahFromJson(String str) =>
//     List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));
//
// String surahToJson(List<Surah> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Surah {
//   Surah(
//       {required this.nomor,
//         required this.nama,
//         required this.namaLatin,
//         required this.jumlahAyat,
//         // required this.tempatTurun,
//         required this.arti,
//         required this.deskripsi,
//         required this.audio,
//         this.ayat});
//
//   int nomor;
//   String nama;
//   String namaLatin;
//   int jumlahAyat;
//   // TempatTurun tempatTurun;
//   String arti;
//   String deskripsi;
//   String audio;
//   List<Ayat>? ayat;
//
//   factory Surah.fromJson(Map<String, dynamic> json) => Surah(
//       nomor: json["nomor"],
//       nama: json["nama"],
//       namaLatin: json["nama_latin"],
//       jumlahAyat: json["jumlah_ayat"],
//       // tempatTurun: tempatTurunValues.map[json["tempat_turun"]]!,
//       arti: json["arti"],
//       deskripsi: json["deskripsi"],
//       audio: json["audio"],
//       ayat: json.containsKey('ayat')
//           ? List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromJson(x)))
//           : null);
//
//   Map<String, dynamic> toJson() => {
//     "nomor": nomor,
//     "nama": nama,
//     "nama_latin": namaLatin,
//     "jumlah_ayat": jumlahAyat,
//     // "tempat_turun": tempatTurunValues.reverse[tempatTurun],
//     "arti": arti,
//     "deskripsi": deskripsi,
//     "audio": audio,
//     "ayat":
//     ayat != null ? List<dynamic>.from(ayat!.map((e) => e.toJson())) : []
//   };
// }
//
// // enum TempatTurun { MEKAH, MADINAH }
// //
// // final tempatTurunValues =
// // EnumValues({"madinah": TempatTurun.MADINAH, "mekah": TempatTurun.MEKAH});
// //
// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;
// //
// //   EnumValues(this.map);
// //
// //   Map<T, String> get reverse {
// //     if (reverseMap == null) {
// //       reverseMap = map.map((k, v) => new MapEntry(v, k));
// //     }
// //     return reverseMap;
// //   }
// // }
///ayat
///// class Ayat {
// //   Ayat({
// //     // required this.id,
// //     // required this.surah,
// //     // required this.nomor,
// //     // required this.ar,
// //     // required this.tr,
// //     // required this.idn,
// // required this.audioayat,
// //     required this.numb
// //   });
// //
// //   // int id;
// //   // int surah;
// //   // int nomor;
// //   // String ar;
// //   // String tr;
// //   // String idn;
// //
// //   int numb;
// //   String audioayat;
// //   factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
// //     // id: json["id"],
// //     // surah: json["surah"],
// //     // nomor: json["nomor"],
// //     // ar: json["ar"],
// //     // tr: json["tr"],
// //     // idn: json["idn"],
// //     numb: json['numb'],
// //     audioayat:  json['audioayat']
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     // "id": id,
// //     // "surah": surah,
// //     // "nomor": nomor,
// //     // "ar": ar,
// //     // "tr": tr,
// //     // "idn": idn,
// //     'numb' :numb,
// //     'audioayat' : audioayat
// //   };
// // }
///services
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../Models/surahDetails.dart';
//
// Future<surahDetails> fetchData(int index) async {
//   final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah/$index/editions/quran-uthmani,ur.maududi,ar.alafasy'));
//
//   if (response.statusCode == 200) {
//     print(json.decode(response.body));
//     return surahDetails.fromJson(json.decode(response.body));
//
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
// Future<surahDetails> fetchAudioData() async {
//   final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah/114/ar.alafasy'));
//
//   if (response.statusCode == 200) {
//     print(json.decode(response.body));
//     return surahDetails.fromJson(json.decode(response.body));
//
//   } else {
//     throw Exception('Failed to load data');
//   }
// }