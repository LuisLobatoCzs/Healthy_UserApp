import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  MapboxMapController? mapController;

  final here = LatLng(18.991412, -98.201622);
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(media.width * 0.77),
            child: navHeader(),
          ),
          body: map(),
          bottomNavigationBar: navBarPersonalizado(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Theme navBarPersonalizado() {
    return Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xff98cdd6),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.red,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: const TextStyle(
                  color: Colors
                      .yellow))), // sets the inactive color of the `BottomNavigationBar`
      child: navigationBar(),
    );
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/promotion.png', width: 50.0, height: 50.0),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/perfil.png', width: 50.0, height: 50.0),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/homes.png', width: 50.0, height: 50.0),
          label: '',
        ),
      ],
    );
  }

  MapboxMap map() {
    return MapboxMap(
      styleString: styleMap,
      accessToken: secret,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: here, zoom: 17),
    );
  }

  AppBar navHeader() {
    return AppBar(
      backgroundColor: Colors.transparent,
//    backgroundColor: Color(0x44000000),
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/up.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
              height: 95,
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('')),
            Row(
              children: [
                Image.asset(
                  'assets/doc.png',
                  fit: BoxFit.cover,
                  height: 95,
                ),
                Image.asset(
                  'assets/fisio.png',
                  fit: BoxFit.cover,
                  height: 95,
                ),
                Image.asset(
                  'assets/enfermera.png',
                  fit: BoxFit.cover,
                  height: 95,
                ),
              ],
            ),
          ],
        ),
      ),
      title: Text(''),
    );
  }
}
