import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _titulos = const TextStyle(
    fontSize: 30,
    color: Color(0xff415B7A),
  );
  final _etiquetas = const TextStyle(
    fontSize: 20,
    color: Color(0xff415B7A),
  );
  final _leyendas = const TextStyle(
    fontSize: 15,
    color: Color(0xff415B7A),
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
              image: AssetImage('assets/fondo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                // Separa el botón del suelo un 10%
                SizedBox(height: size.height * 0.3),
                Row(
                  children: [
                    // Margen izquierdo del 10%
                    SizedBox(width: size.width / 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Iniciar sesión', style: _titulos),
                            // Espaciador para el título
                            SizedBox(height: size.height * 0.03),
                            Row(
                              children: [
                                Text('Email o teléfono', style: _etiquetas),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: const TextField(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 25,
                                      ),
                                    ),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Color(0xBFFFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Espaciador entre inputs
                            SizedBox(height: size.height * 0.04),
                            Row(
                              children: [
                                Text('Contraseña', style: _etiquetas),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: const TextField(
                                      obscureText:
                                          true, // Para ofuscar la contraseña
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 25,
                                      ),
                                    ),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Color(0xBFFFFFFF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Separa los inputs de la recuperación de contraseña
                            SizedBox(height: size.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Olvidaste tu contraseña?',
                                    style: _leyendas),
                              ],
                            ),
                            // Separador del botón
                            SizedBox(height: size.height * 0.06),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'coins_page');
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 35.0,
                                          left: 35.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Text('Iniciar sesión',
                                          style: _botones),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color(0xff415B7A),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Margen derecho del 10%
                    SizedBox(width: size.width * 0.10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
