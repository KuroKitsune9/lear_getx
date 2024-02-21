import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: Card(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Login Page",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextFormField(
                            onChanged: (value) =>
                                registerController.onNamedChanged(value),
                            decoration: InputDecoration(
                              labelText: 'name',
                              hintText: "Name",
                              border: OutlineInputBorder(),
                            ),
                            // ignore: body_might_complete_normally_nullable
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextFormField(
                            onChanged: (value) =>
                                registerController.onEmailChanged(value),
                            decoration: InputDecoration(
                              labelText: 'email',
                              hintText: "Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextFormField(
                            onChanged: (value) =>
                                registerController.onPasswordChanged(value),
                            decoration: InputDecoration(
                              labelText: 'password',
                              hintText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input password';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                          child: Text("Register"),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              registerController.goToLogin();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
