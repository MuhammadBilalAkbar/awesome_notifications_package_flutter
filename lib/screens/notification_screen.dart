import 'package:awesome_notifications_package_flutter/main.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Page'),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Colors.grey[200]!,
              ],
            )),
        child: SizedBox(
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Spacer(),
              const Center(
                child: Text("Navigated from notification"),
              ),
              // This icon button has been added fot ios navigation
              IconButton(
                onPressed: () => MyApp.navigatorKey.currentState?.pop(),
                icon: const Icon(Icons.arrow_circle_left_outlined),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
