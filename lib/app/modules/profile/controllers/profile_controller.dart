// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn_getx/app/data/user_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var user = User().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      final userDetail = localStorage.getString('user');
      Map<String, dynamic> responseData = jsonDecode(userDetail!);
      user.value.name = responseData['name'];
      user.value.email = responseData['email'];
    } catch (e) {
      print('Error During fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      // Clear token or user data from local storage
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      //navigate to login page
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
