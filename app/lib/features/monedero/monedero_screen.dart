// monedero_screen.dart — Monedero "Descuento Sudado" + referidos.
//
// QUÉ HACE (boceto):
//  · Muestra el saldo de descuento acumulado (SOLO visual — el pago es fuera, D6).
//  · El saldo sube con rachas y con referidos.
//  · Muestra el código de referido único del usuario para invitar a amigos.
//
// NO hay pasarela de pago dentro de la app.

import 'package:flutter/material.dart';

class MonederoScreen extends StatelessWidget {
  const MonederoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Descuento Sudado')),
      body: const Center(
        child: Text(
          'Monedero (visual) + Referidos\n\n'
          '(saldo de descuento · tu código de invitación)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
