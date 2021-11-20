import 'package:flutter/cupertino.dart';

class VerDatos extends StatefulWidget {
  @override
  VerDatosState createState() => VerDatosState();
}

class VerDatosState extends State<VerDatos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Ver Datos'),
      ),
      child: Center(
          child:
              CupertinoButton.filled(child: Text("Boton"), onPressed: () {})),
    );
  }
}
