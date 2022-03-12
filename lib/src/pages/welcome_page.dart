import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:healthy/src/widgets/bottom_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  MapboxMapController? mapController;

  // Ubicación a mostrar en el mapa
  final here = LatLng(18.991412, -98.201622);
  // Url a los estilos del mapa
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  // Token privado
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';

  // Definición de estilo para botón central
  final _botones = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );

  final _leyenda = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
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
            preferredSize: Size.fromHeight(media.width * 0.64),
            child: navHeader(),
          ),
          body: Stack(
            children: [
              map(),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 90.0,
                          width: 90.0,
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
                  ],
                ),
                // Espaciador para despegar los botones del BottomNavigation
                SizedBox(height: 60),
              ]),
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
            NavigationBar(),
          ],
        ),
      ],
    );
  }

  AppBar navHeader() {
    return AppBar(
      backgroundColor: Colors.transparent,
//      backgroundColor: const Color(0x00000000),
      // Sombreado del banner
      elevation: 0,
      flexibleSpace: Container(
        // Background banner
        decoration: const BoxDecoration(
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
              height: 95,
            ),
            // Espaciado entre el logo y los botones
            Container(padding: const EdgeInsets.all(8.0), child: Text('')),
            // Botones de servicio
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Médico
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    height: 95.0,
                    width: 95.0,
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
                ),
                // Fisioterapia
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: SizedBox(
                    height: 95.0,
                    width: 95.0,
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
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    height: 95.0,
                    width: 95.0,
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
