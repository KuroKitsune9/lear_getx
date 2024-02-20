import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/invoice/views/invoice_view.dart';
import '../controllers/invoice_controller.dart';

class OutPut extends StatelessWidget {
  final InvoiceController invoice = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Invoice"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('FullName : ${invoice.fullname.value}'),
                    ),
                    ListTile(
                      title: Text('Place Of Birth : ${invoice.pob.value}'),
                    ),
                    ListTile(
                      title: Text('Date Of Birth : ${invoice.dob.value}'),
                    ),
                    ListTile(
                      title: Text('Age : ${invoice.age.value}'),
                    ),
                    ListTile(
                      title: Text('Gander : ${invoice.gender.value}'),
                    ),
                    ListTile(
                      title: Text('Email : ${invoice.email.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Nationality : ${invoice.nationality.value} '),
                    ),
                    ListTile(
                      title: Text('MemberShip : ${invoice.membership.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Card Number : ${invoice.card_number.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Expired Date : ${invoice.expired_date.value} '),
                    ),
                    ListTile(
                      title: Text('Payment : ${invoice.payment.value} '),
                    ),
                    ListTile(
                      title: Text('Benefits : ${invoice.benefit.value} '),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          invoice.resetData();
                          Get.to(InvoiceView());
                        },
                        child: Text("Back to Invoice"))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
