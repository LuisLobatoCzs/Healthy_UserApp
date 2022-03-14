import 'package:flutter/material.dart';

import 'package:healthy/src/widgets/bottom_navigation.dart' as bnb;

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  final _texto = const TextStyle(
    fontSize: 30,
    color: Color(0xff415B7A),
    //color: Color(0xff8ABBC7),
    //fontWeight: FontWeight.w600,
  );
  final _botones = const TextStyle(
    fontSize: 23,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          // Color de fondo
          backgroundColor: const Color(0xffe7f0f8),
          // Habilita la transparencia en el Appbar
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            // Altura del banner
            preferredSize: Size.fromHeight(size.height * 0.17),
            child: navHeader(),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Espaciado superior para que el contenido no quede oculto por el appBar
                SizedBox(height: size.width * 0.55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Espaciado lateral izquierdo
                    SizedBox(width: size.width * 0.06),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Row(
                          children: [
                            // Espaciado izquierdo del logo de coins
                            SizedBox(width: size.width * 0.05),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    // Dimensiones del recuadro con monedas disponibles
                                    height: size.height * 0.12,
                                    width: size.width,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/healthy_coins.png'),
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Símbolo $
                                      Text(
                                        String.fromCharCodes(
                                          Runes('\u0024'),
                                        ),
                                        style: _texto,
                                      ),
                                      // Monto
                                      Text(
                                        '00.00',
                                        style: _texto,
                                      ),
                                    ],
                                  ),
                                  // Padding inferior de las coins
                                  SizedBox(height: size.height * 0.02),
                                ],
                              ),
                            ),
                            // Espaciado derecho del logo de coins
                            SizedBox(width: size.width * 0.05),
                          ],
                        ),
                      ),
                    ),
                    // Espaciado lateral derecho
                    SizedBox(width: size.width * 0.06),
                  ],
                ),
                // Separador del recuadro blanco
                SizedBox(height: size.height * 0.055),
                Text('Mi código', style: _texto),
                // Separador del codigo healthy
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Espaciado izquierdo CODE
                    SizedBox(width: size.width * 0.20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEALTHYCODE',
                              style: TextStyle(
                                fontSize: size.width * 0.065,
                                color: const Color(0xff8ABBC7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Espaciado derecho CODE
                    SizedBox(width: size.width * 0.20),
                  ],
                ),
                InkWell(
                  child: const Text(
                    'COMPARTE TU CODIGO Y GANA MAS COINS',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () =>
                      ('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                ),
                // Espaciado entre código y añadir
                SizedBox(height: size.height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // Tamaño del símbolo de +
                      height: size.width * 0.09,
                      width: size.width * 0.09,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/AddCodeButton.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('Añadir código', style: _texto),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.06),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          // Para rellenar el input
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          hintText: '',
                          // Cuando textField no este activo
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          // Cuando textField esté activo
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        obscureText: false,
                        style: TextStyle(
                          color: Color(0xff415B7A),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.06),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                Row(
                  children: [
                    // Espaciado izquierdo del botón añadir
                    SizedBox(width: size.width * 0.1),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('Iniciar sesión');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 35.0, left: 35.0, top: 5.0, bottom: 5.0),
                          child: Text('Añadir', style: _botones),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
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
                    // Espaciado derecho del botón añadir
                    SizedBox(width: size.width * 0.1),
                  ],
                ),
                // Espaciado inferior
                SizedBox(height: size.width * 0.1),
              ],
            ),
          ),
          bottomNavigationBar: bnb.NavigationBar(),
        ),
      ],
    );
  }

  AppBar navHeader() {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.transparent,
      //backgroundColor: const Color(0x00000000),
      // Sombreado del banner
      elevation: 0,

      flexibleSpace: Container(
        // Background banner
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
          image: DecorationImage(
            image: AssetImage('assets/fondo_arriba.png'),
            fit: BoxFit.cover,
          ),
        ),
        // Contenido banner
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.width * 0.09,
                    ),
                    Text(
                      'Comparte y Gana',
                      style: TextStyle(
                        fontSize: size.width * 0.09,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Historial de recompensas',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // Título del banner
      title: const Text(''),
    );
  }
}
