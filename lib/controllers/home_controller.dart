import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:universities/models/college.dart';

import '../models/colleges_response.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxList<CollegesResponse> colleges = <CollegesResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadColleges();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void loadColleges() async {
    var url = Uri.http(
        'universities.hipolabs.com', '/search', {'country': 'Colombia'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      colleges.value = List<CollegesResponse>.from(
          parsed.map((model) => CollegesResponse.fromMap(model)));
    }
  }

  void searchCollegeByName(String name) async {
    var url =
        Uri.http('universities.hipolabs.com', '/search', {'country': name});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      colleges.value = List<CollegesResponse>.from(
          parsed.map((model) => CollegesResponse.fromMap(model)));
    }
  }
}
