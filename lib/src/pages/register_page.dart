import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 2.5),
              Row(
                children: [
                  SizedBox(width: size.width / 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: const [
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Nombre',
                                      ),
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Apellidos',
                                      ),
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Email',
                                      ),
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Teléfono (opcional)',
                                      ),
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Contraseña',
                                      ),
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        // Para rellenar el input
                                        filled: false,
                                        fillColor: Color(0xFF000000),
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        hintText: 'Repetir contraseña',
                                        // Cuando textField no este activo
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        // Cuando textField esté activo
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Color(0xff415B7A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: const Color(0xBFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: size.width / 10),
                ],
              ),
              SizedBox(height: size.width / 7),
              Row(
                children: [
                  SizedBox(width: size.width / 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login_page');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 35.0, left: 35.0, top: 5.0, bottom: 5.0),
                        child: Text('Crear cuenta', style: _botones),
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
                  SizedBox(width: size.width / 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
