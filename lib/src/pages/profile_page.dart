import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _titulo = const TextStyle(
    fontSize: 25,
    color: Color(0xffffffff),
    fontWeight: FontWeight.w600,
  );
  final _titulo2 = const TextStyle(
    fontSize: 25,
    color: Color(0xff7ddbec),
    fontWeight: FontWeight.w600,
  );
  final _titulo2Subrayado = const TextStyle(
    fontSize: 25,
    color: Color(0xff7ddbec),
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );
  final _texto = const TextStyle(
    fontSize: 20,
    color: Color(0xff415B7A),
    fontWeight: FontWeight.w600,
  );
  final _texto2 = const TextStyle(
    fontSize: 15,
    color: Color(0xff415B7A),
    fontWeight: FontWeight.w600,
  );

  Gradient degradado() {
    return const LinearGradient(
        colors: [Color(0xffe8f1f7), Color(0xffb4e1ee)],
        stops: [0.65, 0.8],
        begin: Alignment.topLeft,
        end: Alignment.topRight);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _espaciadoLateral = size.width * 0.05;
    final _iconSize = size.width * 0.1;

    return Container(
      // Background
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo_perfil.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // Contenido
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                // Espaciado lateral izquierdo
                SizedBox(width: _espaciadoLateral),
                // Contenido
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Título
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Mi perfil", style: _titulo)],
                      ),
                      // Espaciado vertical
                      SizedBox(height: size.width * 0.03),
                      // Tarjeta de datos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              // Redondeado
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                gradient: degradado(),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0),
                                // Imagen - Datos
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 40%
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          // Imagen
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/perfil_default.png',
                                                fit: BoxFit.cover,
                                              ),
                                              Text("Nombre(s)", style: _texto2),
                                              Text("Apellidos", style: _texto2),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Datos
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            Container(
                                              color: const Color(0x99ffffff),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Edad",
                                                      style: _texto,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Espaciado vertical
                                            SizedBox(height: size.width * 0.01),
                                            Container(
                                              color: const Color(0x99ffffff),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Peso",
                                                      style: _texto,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Espaciado vertical
                                            SizedBox(height: size.width * 0.01),
                                            Container(
                                              color: const Color(0x99ffffff),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Estatura",
                                                      style: _texto,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.width * 0.05,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.07,
                                                    child: Image.asset(
                                                      'assets/estrella gris.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.07,
                                                    child: Image.asset(
                                                      'assets/estrella gris.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.07,
                                                    child: Image.asset(
                                                      'assets/estrella gris.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.07,
                                                    child: Image.asset(
                                                      'assets/estrella gris.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: size.width * 0.07,
                                                    child: Image.asset(
                                                      'assets/estrella gris.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Espaciado vertical
                      SizedBox(height: size.width * 0.07),
                      // Menu
                      Container(
                        decoration: BoxDecoration(
                          gradient: degradado(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Column(
                            children: [
                              // Titulo sección
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Mi cuenta", style: _titulo2),
                                  ],
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              /* *************** Opciones *************** */
                              // Healthy coins
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/healthy-coins'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_coins.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Healthy Coins",
                                              style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Direcciones
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/direcciones'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_direcciones.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Direcciones",
                                              style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Tarjeta
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/tarjeta'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_tarjeta.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Tarjeta", style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Cuenta
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/cuenta'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_cuenta.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Cuenta", style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Favoritos
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/favoritos'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_favoritos.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text("Favoritos", style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Registro de consultas
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch(
                                      'https://healthy.com/historial-consultas'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_registro.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Registro de consultas",
                                              style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Centro de ayuda
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch('https://healthy.com/Ayuda'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_ayuda.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Ayuda", style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Espaciado vertical
                              SizedBox(height: size.width * 0.02),
                              // Términos y condiciones
                              RaisedButton(
                                color: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => {
                                  launch(
                                      'https://healthy.com/Terminos-y-condiciones'),
                                },
                                child: Container(
                                  color: const Color(0x99ffffff),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // 20% Imagen
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(children: [
                                            Image.asset(
                                              'assets/menu_info.png',
                                              fit: BoxFit.cover,
                                              height: _iconSize,
                                            ),
                                          ]),
                                        ),
                                      ),
                                      // 80% Leyenda
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Términos y condiciones",
                                              style: _texto),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Espaciado lateral derecho
                SizedBox(width: _espaciadoLateral),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cerrar sesión",
                  style: _titulo2Subrayado,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
