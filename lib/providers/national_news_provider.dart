// national_news_provider.dart

import 'dart:convert';
import 'package:cenw_app/models/national_news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NationalNewsProvider with ChangeNotifier {
  List<NationalNewsModel> _nationalList = [];
  bool _isLoading = false;

  List<NationalNewsModel> get nationalList => _nationalList;
  bool get isLoading => _isLoading;

  Future<void> fetchNationalNews() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://api-berita-indonesia.vercel.app/cnn/nasional/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _nationalList = [NationalNewsModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
