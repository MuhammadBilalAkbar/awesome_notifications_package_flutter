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

  static const title = 'Awesome Notifications Package';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(title: title),
      );
}
