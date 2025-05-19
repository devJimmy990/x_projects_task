import 'package:flutter/material.dart';
import 'package:x_projects_task/core/helper/localization.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 100, color: Colors.red),
            Text(
              Localization.errorOffline,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
