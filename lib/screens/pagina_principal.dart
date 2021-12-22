import 'package:flutter/cupertino.dart';
import 'package:trabajo_lps/models/personas.dart';
import 'package:trabajo_lps/screens/formulario.dart';
import 'package:trabajo_lps/screens/ver_datos.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  late ValueChanged<Persona> personaChange;
  List<Persona> personaLista = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    personaChange = (value) {
      setState(() {
        personaLista.add(value);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                label: "Formulario", icon: Icon(CupertinoIcons.doc)),
            BottomNavigationBarItem(
                label: "Ver datos", icon: Icon(CupertinoIcons.eye))
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return Formulario(personaChange);
            case 1:
              return VerDatos(personaLista);
            default:
              return Formulario(personaChange);
          }
        });
  }
}
