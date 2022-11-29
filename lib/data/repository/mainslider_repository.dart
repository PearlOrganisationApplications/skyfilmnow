// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:skyfilmnow/models/mainslider/mainslider.dart';
// import 'package:skyfilmnow/urlLinks/links.dart';
// import 'package:http/http.dart' as http;

// class MainSliderRepository {
//   Future<List<MainSlider>> getMainSlider() async {
//     final response = await http.get(Uri.parse(WebLinks.mainslider));
//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body)['Message'];
//       return result.map((e) => MainSlider.fromJson(e)).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
