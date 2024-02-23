// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/biodata_controller.dart';

class BiodataView extends StatelessWidget {
  BiodataView({Key? key}) : super(key: key);

  final BiodataController biodataController = BiodataController();

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BiodataView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nama'),
                    onChanged: (value) => biodataController.nama.value = value,
                  ),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: () => biodataController.selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        hintText: 'Pilih Tanggal',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tanggal Lahir'),
                          Obx(() => Text(biodataController.tanggalLahir.value)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField(
                    items: ['Islam', 'Kristen', 'Hindu', 'Buddha', 'Lainnya']
                        .map((agama) =>
                            DropdownMenuItem(value: agama, child: Text(agama)))
                        .toList(),
                    onChanged: (value) =>
                        biodataController.agama.value = value.toString(),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Obx(() => Radio(
                            value: 'Laki-Laki',
                            groupValue: biodataController.jenisKelamin.value,
                            onChanged: (value) =>
                                biodataController.jenisKelamin.value = value!,
                          )),
                      Text('laki-laki'),
                      Obx(() => Radio(
                            value: 'Perempuan',
                            groupValue: biodataController.jenisKelamin.value,
                            onChanged: (value) =>
                                biodataController.jenisKelamin.value = value!,
                          )),
                      Text('Perempuan'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(labelText: 'Alamat'),
                    onChanged: (value) =>
                        biodataController.alamat.value = value,
                  ),
                  SizedBox(height: 16.0),
                  for (String hobi in biodataController.getHobiList())
                    Obx(() => CheckboxListTile(
                          title: Text(hobi),
                          value: biodataController.hobi.contains(hobi),
                          onChanged: (value) =>
                              biodataController.toggleHobi(hobi),
                        )),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => biodataController.submitForm(),
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Obx(() {
              if (biodataController.isFormSubmitted.value) {
                return Text(
                  'Output: ${biodataController.nama}, ${biodataController.tanggalLahir}, ${biodataController.agama}, ${biodataController.jenisKelamin}, ${biodataController.alamat}, ${biodataController.hobi}',
                  style: TextStyle(fontSize: 16.0),
                );
              } else {
                return SizedBox.shrink();
              }
            })
          ],
        ),
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
