import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/notification_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Awesome Notifications Package Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen(title: 'Awesome Notifications Package Flutter'),
      );
}
