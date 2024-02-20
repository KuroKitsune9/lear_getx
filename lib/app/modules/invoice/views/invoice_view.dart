// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  InvoiceView({Key? key}) : super(key: key);

  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        color: Colors.green,
                        child: Text(
                          "Personal Information",
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'FullName'),
                          onChanged: (value) =>
                              invoiceController.fullname.value = value,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Place of Birth'),
                          onChanged: (value) =>
                              invoiceController.pob.value = value,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () => invoiceController.selectDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Date of birth',
                              hintText: 'Pilih Tanggal',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(invoiceController.dob.value)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(bottom: 10, top: 0),
                              child: Text(
                                "Gender",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Man',
                                      groupValue:
                                          invoiceController.gender.value,
                                      onChanged: (value) => invoiceController
                                          .gender.value = value!,
                                    )),
                                Text('Man'),
                                Obx(() => Radio(
                                      value: 'Woman',
                                      groupValue:
                                          invoiceController.gender.value,
                                      onChanged: (value) => invoiceController
                                          .gender.value = value!,
                                    )),
                                Text('Woman'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          onChanged: (value) =>
                              invoiceController.email.value = value,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Nationality'),
                          onChanged: (value) =>
                              invoiceController.nationality.value = value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text(
                  "Type Of payment",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Reguler',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.setMembership(value!),
                            )),
                        Text('Reguler'),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Gold',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.setMembership(value!),
                            )),
                        Text('Gold'),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Platinum',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.setMembership(value!),
                            )),
                        Text('Platinum'),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'VIP',
                              groupValue: invoiceController.membership.value,
                              onChanged: (value) =>
                                  invoiceController.setMembership(value!),
                            )),
                        Text('VIP'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text(
                  "Payment Deail",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Card Number'),
                  onChanged: (value) =>
                      invoiceController.card_number.value = value,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () => invoiceController.ExpiredDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Expired Date',
                      hintText: 'Pilih Tanggal',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(invoiceController.expired_date.value)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text("payment : "),
                      Obx(() => Text(invoiceController.payment.value)),
                    ],
                  )),
              ElevatedButton(
                onPressed: () => invoiceController.submitForm(),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
