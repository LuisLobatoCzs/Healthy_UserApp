import 'package:flutter/material.dart';
import 'dart:io';

class CoinsPage extends StatefulWidget {
  const CoinsPage({Key? key}) : super(key: key);

  @override
  createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  final _titulo = const TextStyle(
    fontSize: 50,
    color: Colors.white,
  );
  final _leyenda = const TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  final _texto = const TextStyle(
    fontSize: 30,
    color: Color(0xff415B7A),
  );
  final _texto2 = const TextStyle(
    fontSize: 30,
    color: Color(0xff8ABBC7),
    fontWeight: FontWeight.w600,
  );
  final _botones = const TextStyle(
    fontSize: 23,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo_coins.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: size.height *
                          0.12), // Espaciado superior del 5% de la pantalla
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Comparte y Gana',
                            style: TextStyle(
                              fontSize: size.width * 0.08,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Historial de recompensas',
                            style: _leyenda,
                          )
                        ],
                      ),
                    ],
                  ),
                  // Espaciado del 10% entre título y num de monedas
                  SizedBox(height: size.height * 0.10),
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
                                    Text(
                                      '00.00',
                                      style: _texto,
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
                                  color: Color(0xff8ABBC7),
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
                      SizedBox(width: size.width * 0.06)
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
                              Color(0xff415B7A),
                            ),
                          ),
                        ),
                      ),
                      // Espaciado derecho del botón añadir
                      SizedBox(width: size.width * 0.1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
