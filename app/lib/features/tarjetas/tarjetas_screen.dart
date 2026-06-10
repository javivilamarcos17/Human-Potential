// tarjetas_screen.dart — Tarjetas Épicas para compartir.
//
// QUÉ HACE (boceto):
//  · Genera una imagen vertical (Avatar + Nivel + frase de superación).
//  · Permite compartirla en Instagram/TikTok (share_plus).
//
// Es el motor de viralidad: la difusión ocurre FUERA de la app, en redes externas.

import 'package:flutter/material.dart';

class TarjetasScreen extends StatelessWidget {
  const TarjetasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tu Tarjeta Épica')),
      body: const Center(
        child: Text(
          'Tarjetas Épicas compartibles\n\n'
          '(avatar + nivel + frase → Instagram / TikTok)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
