// triaje_screen.dart — Triaje diario (popup al abrir la app).
//
// QUÉ HACE (boceto):
//  · Pregunta Nivel de Dolor (1-10) y Nivel de Energía (1-10).
//  · Guarda el triaje del día (tabla `triajes`).
//  · Si el dolor es alto, alimenta el panel de semáforos de la clínica.
//
// Es la primera interacción del Core Loop diario.

import 'package:flutter/material.dart';

class TriajeScreen extends StatelessWidget {
  const TriajeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¿Cómo estás hoy?')),
      body: const Center(
        child: Text(
          'Triaje diario\n\n(Dolor 1-10  ·  Energía 1-10)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
