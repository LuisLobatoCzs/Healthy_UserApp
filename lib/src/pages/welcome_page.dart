import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:healthy/src/widgets/bottom_navigation.dart';

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
            preferredSize: Size.fromHeight(media.width * 0.65),
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
