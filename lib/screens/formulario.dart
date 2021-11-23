import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajo_lps/utils.dart';

class Formulario extends StatefulWidget {
  @override
  VerDatosState createState() => VerDatosState();
}

class VerDatosState extends State<Formulario> {
  String nombre = "";
  double edad = 0.0;
  String mascota = "Ninguna";
  int? sexo = 0;
  bool esEstudiante = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text("Guardar"),
            onPressed: popUp,
          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sexo: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Spacer(),
                      CupertinoSlidingSegmentedControl(
                          padding: EdgeInsets.all(10),
                          groupValue: sexo,
                          children: {
                            0: Text("Mujer"),
                            1: Text("Hombre"),
                            2: Text("Otro"),
                          },
                          onValueChanged: (value) {
                            setState(() => this.sexo = value as int?);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edad:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      CupertinoSlider(
                        value: edad,
                        onChanged: (edadNueva) {
                          setState(() => edad = edadNueva);
                        },
                        min: 0.0,
                        max: 100.0,
                      ),
                      Text(edad.toStringAsFixed(0)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Es estudiante:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                          value: esEstudiante,
                          onChanged: (value) =>
                              setState(() => esEstudiante = value)),
                    ],
                  ),
                  CupertinoButton.filled(
                      padding: EdgeInsets.symmetric(horizontal: 134),
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

  void popUp() {}
}
