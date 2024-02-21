// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learn_getx/app/modules/invoice/views/invoice_outpur_view.dart';

class InvoiceController extends GetxController {
  // state for personal information
  var fullname = ''.obs;
  var pob = ''.obs;
  var age = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;
  var email = ''.obs;
  var nationality = ''.obs;
  var isFormSubmitted = false.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final currentDate = DateTime.now();
      final ageResult = currentDate.year -
          picked.year -
          ((currentDate.month > picked.month ||
                  (currentDate.month == picked.month &&
                      currentDate.day >= picked.day))
              ? 0
              : 1);

      dob.value = DateFormat('yyyy-MM-dd')
          .format(picked); // Format tanggal sebagai String
      age.value = ageResult.toString();
    }
  }

  //state for type of membership
  var membership = ''.obs;
  var payment = ''.obs;
  var benefit = ''.obs;
  void setMembership(String type) {
    membership.value = type;

    if (type == 'Reguler') {
      payment.value = '50000';
      benefit.value = 'member 1 month';
    } else if (type == 'Gold') {
      payment.value = '150000';
      benefit.value = 'member 1 month + free snacks';
    } else if (type == 'Platinum') {
      payment.value = '250000';
      benefit.value = 'member 2 month + free snacks + free wifi';
    } else if (type == 'VIP') {
      payment.value = '500000';
      benefit.value =
          'member 3 month + free snacks + free wifi + ticket conceert';
    } else {
      payment.value = '';
      benefit.value = '';
    }
  }

  //state for payment details
  var card_number = ''.obs;
  var expired_date = ''.obs;
  Future<void> ExpiredDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(Duration(days: 7) as int),
    );

    if (picked != null) {
      final expired = picked.add(Duration(days: 7));
      final formattedDate = DateFormat('yyyy-MM-dd').format(expired);
      expired_date.value = formattedDate;
    }
  }

  // reset form data
  void resetData() {
    fullname.value = '';
    pob.value = '';
    dob.value = '';
    gender.value = '';
    email.value = '';
    nationality.value = '';
    membership.value = '';
    card_number.value = '';
    expired_date.value = '';
    payment.value = '';
    benefit.value = '';
  }

  void submitForm() {
    print(
        '$fullname, $pob, $dob, $gender, $email, $nationality, $membership, $card_number, $expired_date, $payment');
    isFormSubmitted.value = true;
    Get.to(OutPut());
  }
}
