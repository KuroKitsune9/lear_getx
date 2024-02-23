import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/data/user_model.dart';
import 'package:learn_getx/app/modules/user/controllers/user_controller.dart';

class EditUserView extends StatelessWidget {
  final User user;
  final UserController controller = Get.find<UserController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  EditUserView({required this.user}) {
    nameController.text = user.name!;
    emailController.text = user.email!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
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
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (_validatedInput()) {
                  controller.editUser(user, nameController.text,
                      emailController.text, passwordController.text);
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  bool _validatedInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('eror', 'Semua field harus di isi');
      return false;
    }
    return true;
  }
}
