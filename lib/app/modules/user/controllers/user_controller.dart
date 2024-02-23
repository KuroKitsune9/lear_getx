// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:learn_getx/app/data/user_model.dart';
import 'package:learn_getx/app/modules/user/views/user_show.dart';
import 'package:learn_getx/app/modules/user/views/user_view.dart';
import 'package:learn_getx/app/providers/api.dart';
import 'package:http/http.dart' as http;
import 'package:learn_getx/app/routes/app_pages.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/auth';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        userList.assignAll(jsonResponse.map((model) => User.fromJson(model)));
      } else {
        throw Exception('Failed to load pasien');
      }
    } catch (e) {
      print('Error during fetching pasien: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahUser(
    String nama,
    String email,
    String password,
  ) async {
    try {
      if (nama.isEmpty || email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/auth/register';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': nama,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'User berhasil ditambahkan');
        fetchData(); //Redirect ke halaman pasien
        Get.offAndToNamed('/user');
      } else {
        throw Exception('Failed to add pasien');
      }
    } catch (e) {
      print('Error during tambah pasien: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit pasien
  Future<void> editUser(
    User user,
    String name,
    String email,
    String password,
  ) async {
    try {
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/auth/${user.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'User berhasil diubah');
        fetchData(); // Refresh the pasienList
        Get.offAndToNamed('/user');
      } else {
        throw Exception('Failed to edit user');
      }
    } catch (e) {
      print('Error during edit user: $e');
    }
  }

  //show User
  void showUserDetails(User user) {
    Get.to(() => DetailUserView(user: user));
  }

  //Delete User
  Future<void> deleteUser(User user) async {
    try {
      var apiUrL = '${Api.baseUrl}/auth/${user.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrL),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Succes', 'User Has been successfully deleted');
        fetchData();
        Get.to(UserView());
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      print('Error during delete user ${e}');
    }
  }
}
