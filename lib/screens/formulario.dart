import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajo_lps/models/personas.dart';
import 'package:trabajo_lps/utils.dart';

class Formulario extends StatefulWidget {
  final ValueChanged<Persona> personaChange;

  Formulario(this.personaChange);

  @override
  VerDatosState createState() => VerDatosState();
}

class VerDatosState extends State<Formulario> {
  TextEditingController nombre = TextEditingController();
  TextEditingController descripcion = TextEditingController();
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
              alignment: Alignment.topCenter,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // to apply margin in the main axis of the wrap
                runSpacing: 20,
                children: <Widget>[
                  CupertinoTextField(
                    clearButtonMode: OverlayVisibilityMode.editing,
                    padding: EdgeInsets.all(16),
                    placeholder: "Nombre y Apellidos",
                    controller: nombre,
                  ),
                  CupertinoTextField(
                    maxLines: 8,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    padding: EdgeInsets.all(16),
                    placeholder: "Descripción",
                    controller: descripcion,
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
                            2: Text("No binario"),
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
                      Text(edad.toInt().toString()),
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
                                    child: Text("Guardar"),
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

  void popUp() {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Aviso'),
        content: const Text('¿Desea guardar esta persona?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Sí'),
            onPressed: () {
              if (nombre != "") {
                String sexoString = "";

                if (sexo == 0) {
                  sexoString = "Mujer";
                } else if (sexo == 1) {
                  sexoString = "Hombre";
                } else {
                  sexoString = "No Binario";
                }
                Persona p = Persona(nombre.text, edad.toInt(), mascota,
                    sexoString, esEstudiante, descripcion.text);

                widget.personaChange(p);
                nombre.clear();
                edad = 0.0;
                mascota = "Ninguna";
                esEstudiante = false;
                sexo = 0;
                descripcion.clear();
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
