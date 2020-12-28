import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (value) {
        uiProvider.selectedMenuOpt = value;
      },
      elevation: 0,
      currentIndex: currentIndex,
      items: [
        //tiene que haber por lo menos dos items si no botara error
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapa')),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_compact), title: Text('Direcciones'))
      ],
    );
  }
}
