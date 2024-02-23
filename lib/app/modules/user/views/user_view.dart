import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learn_getx/app/modules/user/views/user_edit.dart';
import 'package:learn_getx/app/modules/user/views/user_show.dart';

import '../controllers/user_controller.dart';

class UserView extends StatelessWidget {
  UserView({Key? key}) : super(key: key);

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar User'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/tambah-user');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Obx(() => controller.userList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.userList.length,
              itemBuilder: (context, index) {
                var user = controller.userList[index];
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(user.name.toString()),
                      ),
                      Expanded(
                        child: Text(user.email.toString()),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => EditUserView(user: user));
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(DetailUserView(user: user));
                        },
                        icon: Icon(Icons.visibility),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.deleteUser(user);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              // gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.accessibility_new,
                  text: 'User',
                ),
                GButton(
                  icon: Icons.add_box_outlined,
                  text: 'Counter',
                ),
                GButton(
                  icon: Icons.account_box_sharp,
                  text: 'Biodata',
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                switch (index) {
                  case 0:
                    Get.toNamed('/home');
                    break;
                  case 1:
                    Get.toNamed('/user');
                    break;
                  case 2:
                    Get.toNamed('/counter');
                    break;
                  case 3:
                    Get.toNamed('/biodata');
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
