import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/user_controller.dart';
import 'user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<UserController>().getUsers(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Consumer<UserController>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                key: Key('progress-indicator'),
              ),
            );
          }
          return ListView.builder(
            itemCount: notifier.users.length,
            itemBuilder: (_, index) {
              final user = notifier.users[index];
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => UserScreen(user: user),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(
                      user.email,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
          );
        },
      ),
    );
  }
}
