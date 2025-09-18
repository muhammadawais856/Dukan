import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/banner/bannerlist.dart';


class BannerListService {
  String baseUrl = "https://karyana-apis-backend.vercel.app";
  Future<Bannerlist > getBanners(String token) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/banners'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Bannerlist.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      rethrow;
    }
  }
}

