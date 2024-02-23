import 'package:flutter/material.dart';
import 'package:learn_getx/app/data/user_model.dart';

class DetailUserView extends StatelessWidget {
  final User user;

  DetailUserView({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('id: ${user.id}'),
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('created: ${user.createdAt}')
          ],
        ),
      ),
    );
  }
}
