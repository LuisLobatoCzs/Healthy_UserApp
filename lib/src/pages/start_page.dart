import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _estiloTexto = const TextStyle(
    fontSize: 23,
  );

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: botones(media)),
        ),
      ],
    );
  }

  Widget botones(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: size.width / 17),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login_page');
                },
                child: const SizedBox(
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Iniciar Sesión",
                        textAlign: TextAlign.center,
                        textScaleFactor:
                            1.7, // Para ajustar el tamaño de letra sin desbordar
                      ),
                    ),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff8ABBC7)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ),
            SizedBox(width: size.width / 17),
          ],
        ),
        SizedBox(height: size.height / 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: size.width / 17),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'register_page');
                },
                child: const SizedBox(
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Crear cuenta",
                        textAlign: TextAlign.center,
                        textScaleFactor:
                            1.7, // Para ajustar el tamaño de letra sin desbordar
                      ),
                    ),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff8ABBC7)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ),
            SizedBox(width: size.width / 17),
          ],
        ),
        SizedBox(height: size.height / 6),
      ],
    );
  }
}
