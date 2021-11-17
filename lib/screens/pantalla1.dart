import 'package:flutter/cupertino.dart';

class Pantalla1 extends StatefulWidget {
  @override
  _Pantalla1State createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
          child:
              CupertinoButton.filled(child: Text("Boton"), onPressed: () {})),
    );
  }
}
