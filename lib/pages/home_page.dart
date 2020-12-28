import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu op
    final uiProvider = Provider.of<UiProvider>(context);
    // cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    final tempScan = new ScanModel(valor: 'https://oftalmicenter.com');

    //OPERACIONES CON LAS BASE DE DATOS DESDE EL PROVIDER
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanById(1).then((value) => print(value.valor));
    //DBProvider.db.getAllScans().then((value) => print(value));
    //DBProvider.db.deleteAllScans().then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
