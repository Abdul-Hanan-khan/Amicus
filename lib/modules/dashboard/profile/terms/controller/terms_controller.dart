import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TermsController extends GetxController {
  var termsList = <TermsSection>[].obs;

  @override
  void onInit() {
    loadTerms();
    super.onInit();
  }

  Future<void> loadTerms() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/json/terms.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      termsList.value = (jsonData["terms_conditions"] as List)
          .map((item) => TermsSection.fromJson(item))
          .toList();
    } catch (e) {
      print("Error loading terms: $e");
    }
  }
}

class TermsSection {
  final String title;
  final List<String> content;
  final List<String> bulletPoints;

  TermsSection({required this.title, required this.content, required this.bulletPoints});

  factory TermsSection.fromJson(Map<String, dynamic> json) {
    return TermsSection(
      title: json["title"],
      content: List<String>.from(json["content"]),
      bulletPoints: json.containsKey("bullet_points")
          ? List<String>.from(json["bullet_points"])
          : [],
    );
  }
}
