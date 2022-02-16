import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class DocPage extends StatefulWidget {
  @override
  State<DocPage> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  MapboxMapController? mapController;

  // Posición inicial del mapa
  final here = LatLng(18.991412, -98.201622);
  // Url del mapa de Mapbox
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  // Token Mapbox
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';

  // Definición de estilo para botón central
  final _botones = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Obtener dimensiones de la pantalla
    final media = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            //Tamaño de la barra superior
            preferredSize: Size.fromHeight(media.width * 0.7),
            child: navHeader(),
          ),
          body: Stack(
            children: [
              // Mapa
              map(),
              // Botones
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      // Pedir ya
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '');
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 50.0,
                                  left: 50.0,
                                  top: 0.0,
                                  bottom: 0.0),
                              child: Text('Pedir ya!', style: _botones),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff415B7A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Espaciador para despegar los botones del BottomNavigation
                  SizedBox(height: 70),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90.0,
                      width: 90.0,
                      child: Expanded(
                        child: IconButton(
                          icon: Image.asset(
                            'assets/ambulancia.png',
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
        // BottomNavigation fuera del Scaffold para poder ocultar la leyenda que muestra Mapbox
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            navBarPersonalizado(),
          ],
        ),
      ],
    );
  }

  // Estilos del BottomNavigation
  Theme navBarPersonalizado() {
    return Theme(
      data: Theme.of(context).copyWith(
        // Background
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
    );
  }

  MapboxMap map() {
    return MapboxMap(
      styleString: styleMap,
      accessToken: secret,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: here, zoom: 16),
    );
  }

  // Barra de navegación superior
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
