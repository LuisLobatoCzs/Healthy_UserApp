import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class DocPage extends StatefulWidget {
  @override
  State<DocPage> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  MapboxMapController? mapController;

  final here = LatLng(18.991412, -98.201622);
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';
  final _botones = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
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
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            navBarPersonalizado(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {}, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ambulancia.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 50.0, left: 50.0, top: 0.0, bottom: 0.0),
                  child: Text('Pedir ya', style: _botones),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff415B7A),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        )
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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 8,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/promotion.png', width: 50.0, height: 50.0),
          label: 'Promociones',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/perfil.png', width: 50.0, height: 50.0),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/homes.png', width: 50.0, height: 50.0),
          label: 'Inicio',
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
              height: 60,
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'assets/MedicoGeneral.png',
                    fit: BoxFit.cover,
                    height: 150,
                  ),
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
