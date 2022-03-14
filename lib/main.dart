import 'package:flutter/material.dart';
import 'package:healthy/src/app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await Permission.location.request().isGranted) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(const MyApp());
  }
}
