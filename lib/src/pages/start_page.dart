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
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 35.0, left: 35.0, top: 5.0, bottom: 5.0),
                  child: Text('Iniciar sesión', style: _estiloTexto),
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
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 35.0, left: 35.0, top: 5.0, bottom: 5.0),
                  child: Text('Crear cuenta', style: _estiloTexto),
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
