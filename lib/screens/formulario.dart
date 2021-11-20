import 'package:flutter/cupertino.dart';
import 'package:trabajo_lps/utils.dart';

class Formulario extends StatefulWidget {
  @override
  VerDatosState createState() => VerDatosState();
}

class VerDatosState extends State<Formulario> {
  String nombre = "";
  int edad = 0;
  String mascota = "Ninguna";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Formulario'),
        ),
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // to apply margin in the main axis of the wrap
                runSpacing: 20,
                children: <Widget>[
                  CupertinoTextField(
                    padding: EdgeInsets.all(16),
                    placeholder: "Nombre y Apellidos",
                    onChanged: (value) => setState(() => this.nombre = value),
                  ),
                  CupertinoButton.filled(
                      child: Text("Elegir mascota"),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                                  actions: [elegirMascota()],
                                  cancelButton: CupertinoActionSheetAction(
                                    child: Text("Volver"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ));
                      }),
                ],
              )),
        ));
  }

  Widget elegirMascota() {
    final mascotas = ["Ninguna", "Gato", "Perro", "Ardilla"];
    return SizedBox(
      height: 150,
      child: CupertinoPicker(
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() {
              mascota = mascotas[index];
            });
          },
          children: mascotas.map((item) => Center(child: Text(item))).toList()),
    );
  }
}
