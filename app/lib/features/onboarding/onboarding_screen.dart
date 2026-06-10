// onboarding_screen.dart — Flujo 1: Alta y Auditoría de Vitalidad.
//
// QUÉ HACE (boceto):
//  1. Login con email + "Código de Honor" que da la clínica.
//  2. Anamnesis (preguntas de salud).
//  3. Test físico interactivo con 3-4 micro-vídeos (grabar o marcar Sí/No).
//  4. Calcula la Auditoría de Vitalidad (1-100) y crea el avatar "Huevo Nivel 1".
//  5. "Sombrero Seleccionador": asigna familia y ofrece 3 guardianes → el usuario elige 1.
//
// Pantalla de partida. El equipo la dividirá en varios pasos (wizard).

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido a Anti Frágil')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Onboarding + Auditoría de Vitalidad\n\n'
            '(login + Código de Honor → anamnesis → test físico → '
            'tu Guardián nace como Huevo Nivel 1)',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
