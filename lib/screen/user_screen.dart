import 'package:flutter/material.dart';

import '../model/user.dart';


class UserScreen extends StatelessWidget {
  final User user;

  const UserScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Text(
              user.id.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(user.website),
          ],
        ),
      ),
    );
  }
}
