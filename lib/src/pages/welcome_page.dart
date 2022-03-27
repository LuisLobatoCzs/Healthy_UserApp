import 'package:flutter/material.dart';
import 'package:healthy/src/widgets/emergency_button.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:healthy/src/widgets/bottom_navigation.dart' as bnb;
import 'package:location/location.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  MapboxMapController? mapController;

  // Ubicación a mostrar en el mapa
  final here = const LatLng(18.991412, -98.201622);
  // Url a los estilos del mapa
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  // Token privado
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';

  Future<LatLng> acquireCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;

    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return const LatLng(0.0, 0.0);
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return const LatLng(0.0, 0.0);
      }
    }

    // Gets the current location of the user
    final locationData = await location.getLocation();
    return LatLng(locationData.latitude!, locationData.longitude!);
  }

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
    final result = await acquireCurrentLocation();
    print("*****************************************");
    print(result.latitude);
    print(result.longitude);
    print("*****************************************");
    await controller.animateCamera(
      CameraUpdate.newLatLng(result),
    );

    // Indicador de la ubicación actual
    await controller.addCircle(
      CircleOptions(
        circleRadius: 12.0,
        circleColor: '#415B7A',
        circleOpacity: 1.0,
        geometry: result,
        draggable: false,
      ),
    );
  }

  // Instancia del mapa
  MapboxMap map() {
    return MapboxMap(
      styleString: styleMap,
      accessToken: secret,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: here, zoom: 17),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          // Habilita la transparencia en el Appbar
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            // Altura del banner
            preferredSize: Size.fromHeight(media.width * 0.47),
            child: navHeader(),
          ),
          body: Stack(
            children: [
              map(),
              EmergencyButton(),
            ],
          ),
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
        /* 
          Bottom Navigation Bar
          |-> Queda fuera del Scaffold para ocultar la leyenda de Mapbox
        */
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            bnb.NavigationBar(),
          ],
        ),
      ],
    );
  }

  AppBar navHeader() {
    return AppBar(
      backgroundColor: const Color(0x00000000),
      // Sombreado del banner
      elevation: 0,
      flexibleSpace: Container(
        // Background banner
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(250, 50),
            bottomRight: Radius.elliptical(250, 50),
          ),
          image: DecorationImage(
            image: AssetImage('assets/up.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Contenido banner
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
              height: 80,
            ),
            // Espaciado entre el logo y los botones
            SizedBox(height: 5), // Botones de servicio
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Médico
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Expanded(
                    child: IconButton(
                      icon: Image.asset(
                        'assets/doc.png',
                      ),
                      onPressed: () => {
                        Navigator.pushNamed(context, 'doc_page'),
                      },
                    ),
                  ),
                ),
                // Fisioterapia
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          'assets/fisio2.png',
                        ),
                        onPressed: () => {
                          Navigator.pushNamed(context, 'fisio_page'),
                        },
                      ),
                    ),
                  ),
                ),
                // Enfermería
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Expanded(
                    child: IconButton(
                      icon: Image.asset(
                        'assets/enfermera.png',
                      ),
                      onPressed: () => {
                        Navigator.pushNamed(context, 'nurse_page'),
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Título del banner
      title: Text(''),
    );
  }
}
