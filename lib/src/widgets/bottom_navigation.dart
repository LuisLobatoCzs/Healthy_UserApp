import 'package:flutter/material.dart';
import 'package:healthy/src/pages/doc_page.dart';
import 'package:healthy/src/pages/login_page.dart';
import 'package:healthy/src/pages/welcome_page.dart';

class NavigationBar extends StatefulWidget {
  static String id = 'navigationBar';
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int navigationIndex = 0;

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 4,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/promotion.png', width: 47.0, height: 47.0),
          label: 'Promociones',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/perfil.png', width: 47.0, height: 47.0),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/homes.png', width: 47.0, height: 47.0),
          label: 'Inicio',
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => DocPage(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => WelcomePage(),
              ),
            );
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Background color
        canvasColor: const Color(0xff98cdd6),
        // Color del item activo se `Brightness` es light
        primaryColor: Colors.red,
        // Estilos de texto
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: const TextStyle(color: Colors.yellow),
            ),
      ),
      // BottomNavigation al que se aplica el estilo
      child: navigationBar(),
    );
  }
}
