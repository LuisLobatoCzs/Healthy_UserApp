import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyButton extends StatefulWidget {
  static String id = 'emergencyButton';
  @override
  _EmergencyButtonState createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton> {
  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: Expanded(
              child: IconButton(
                icon: Image.asset(
                  'assets/ambulancia3.png',
                ),
                onPressed: () => {
                  launch('tel://911'),
                },
              ),
            ),
          ),
        ],
      ),
      // Espaciador para despegar los botones del BottomNavigation
      SizedBox(height: 60),
    ]);
  }
}
