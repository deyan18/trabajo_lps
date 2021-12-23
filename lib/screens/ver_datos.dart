import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajo_lps/models/personas.dart';

class VerDatos extends StatefulWidget {
  List<Persona> personaLista;

  VerDatos(this.personaLista);

  @override
  VerDatosState createState() => VerDatosState();
}

class VerDatosState extends State<VerDatos> {
  TextEditingController busqueda = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSearchTextField(
          controller: busqueda,
          //focusNode: focusNode,
          onChanged: (v) {
            setState(() {});
          },
        ),
      ),
      child: Material(
        child: Container(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if (busqueda.text != "" &&
                    widget.personaLista[index].nombre
                        .toLowerCase()
                        .startsWith(busqueda.text.toLowerCase())) {
                  return CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                          child: Text(
                        widget.personaLista[index].descripcion,
                        style: TextStyle(fontSize: 15),
                      ))
                    ],
                    child: Material(
                      child: ListTile(
                          title: Text(widget.personaLista[index].nombre),
                          subtitle: Text(
                              "Edad: ${widget.personaLista[index].edad}, Sexo: ${widget.personaLista[index].sexo}${widget.personaLista[index].mascota == "Ninguna" ? "" : ", Mascota: ${widget.personaLista[index].mascota}"}${widget.personaLista[index].esEstudiante ? ", Estudiante" : ""}")),
                    ),
                  );
                } else if (busqueda.text == "") {
                  return CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                          child: Text(
                        widget.personaLista[index].descripcion,
                        style: TextStyle(fontSize: 15),
                      ))
                    ],
                    child: Material(
                      child: ListTile(
                          title: Text(widget.personaLista[index].nombre),
                          subtitle: Text(
                              "Edad: ${widget.personaLista[index].edad}, Sexo: ${widget.personaLista[index].sexo}${widget.personaLista[index].mascota == "Ninguna" ? "" : ", Mascota: ${widget.personaLista[index].mascota}"}${widget.personaLista[index].esEstudiante ? ", Estudiante" : ""}")),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (context, index) {
                if ((busqueda.text != "" &&
                        widget.personaLista[index].nombre
                            .toLowerCase()
                            .startsWith(busqueda.text.toLowerCase())) ||
                    busqueda.text == "") {
                  return Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  );
                } else {
                  return Container();
                }
              },
              itemCount: widget.personaLista.length),
        ),
      ),
    );
  }
}
