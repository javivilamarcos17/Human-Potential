// rutinas_screen.dart — Reproductor de rutinas (Packs prescritos).
//
// QUÉ HACE (boceto):
//  · Muestra el Pack de rutina que prescribió la clínica.
//  · Reproduce los vídeos (enlaces de Vimeo/AWS) en orden.
//  · Al terminar, lleva al feedback RPE (obligatorio).
//
// Es el corazón "clínico" del Core Loop.

import 'package:flutter/material.dart';

class RutinasScreen extends StatelessWidget {
  const RutinasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tu rutina de hoy')),
      body: const Center(
        child: Text(
          'Reproductor de rutinas\n\n(Pack prescrito · vídeos Vimeo/AWS en orden)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
