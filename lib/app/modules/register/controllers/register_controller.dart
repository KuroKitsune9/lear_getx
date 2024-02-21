import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final formKey = GlobalKey<FormState>();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onNamedChanged(String value) {
    name.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);
      print(responseBody);

      if (response.statusCode == 201) {
        Get.snackbar('success', 'Registration successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed('/login');
      } else {
        Get.snackbar(
            'error', 'Registration failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = '/auth/register';
    var requestBody = {
      'name': name.value,
      'password': password.value,
      'email': email.value
    };

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}
