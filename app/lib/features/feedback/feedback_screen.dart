// feedback_screen.dart — Feedback RPE post-sesión (obligatorio).
//
// QUÉ HACE (boceto):
//  · Pregunta el Esfuerzo percibido (RPE 1-10).
//  · Pregunta si hubo "molestia nueva" (sí/no) → si sí, alerta al panel de la clínica.
//  · Al guardar, otorga Puntos de Vitalidad y, si toca, evoluciona el avatar.
//
// Cierra el Core Loop diario.

import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¿Qué tal la sesión?')),
      body: const Center(
        child: Text(
          'Feedback RPE\n\n(Esfuerzo 1-10  ·  ¿molestia nueva?)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
