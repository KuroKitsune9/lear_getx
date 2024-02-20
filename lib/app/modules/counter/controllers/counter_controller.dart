import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 1.obs;

  void increment() {
    count.value++;
    if (count > 100) {
      Get.snackbar("Over Heat", "Dont add more or your laptop will explode",
          colorText: Colors.black,
          backgroundColor: Colors.redAccent[700],
          duration: Duration(seconds: 1));
      count.value--;
    }
  }

  void decrement() {
    count.value--;
    if (count < 1) {
      Get.snackbar("less", "you cannot do less anymore than 0",
          colorText: Colors.black,
          backgroundColor: Colors.redAccent[700],
          duration: Duration(seconds: 1));
      count.value++;
    }
  }
}
