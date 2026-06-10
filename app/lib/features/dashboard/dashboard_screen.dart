// dashboard_screen.dart — Pantalla principal (gamificación).
//
// QUÉ HACE (boceto):
//  · Avatar (Guardián) al centro, según su fase visual (1-20) y arquetipo.
//  · Barra de Puntos de Vitalidad (XP).
//  · Contador de racha de días.
//  · Accesos al triaje del día, a la rutina prescrita, al monedero y a las tarjetas.
//
// Es el "hogar" al que vuelve el usuario cada día.

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Guardián')),
      body: const Center(
        child: Text(
          'Dashboard de gamificación\n\n'
          '(avatar central · barra de XP · racha · accesos a rutina y triaje)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
