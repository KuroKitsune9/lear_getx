import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/user/controllers/user_controller.dart';

class TambahView extends StatelessWidget {
  TambahView({super.key});

  final UserController controller = Get.put(UserController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    controller.tambahUser(
                      namaController.text,
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: Text(
                  'Simpan',
                ))
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (namaController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('error', 'Semua Field Harus di isi');
      return false;
    }
    return true;
  }
}
