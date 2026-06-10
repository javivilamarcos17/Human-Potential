// panel_clinica_screen.dart — Panel web de la clínica (Flutter Web).
//
// QUÉ HACE (boceto del MVP, piezas B1-B6 de la propuesta de valor):
//  B1 · Login del profesional.
//  B2 · Alta de pacientes + generación de Código de Honor.
//  B3 · Ficha maestra del paciente (test inicial, histórico de dolor, feedback RPE).
//  B4 · Panel de semáforos (rojo si dolor alto o molestia nueva).
//  B5 · Librería de vídeos (enlaces Vimeo/AWS).
//  B6 · Creación y prescripción de Packs.
//
// Es la herramienta de trabajo del fisio. El equipo la desarrollará como una app web
// con menú lateral y estas secciones. Aquí va el esqueleto de navegación.

import 'package:flutter/material.dart';

class PanelClinicaScreen extends StatelessWidget {
  const PanelClinicaScreen({super.key});

  // Secciones del panel (boceto de la navegación principal).
  static const _secciones = <String>[
    'Pacientes (semáforos)', // B4 + lista
    'Ficha del paciente', // B3
    'Alta de paciente', // B2
    'Librería de vídeos', // B5
    'Packs y prescripción', // B6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de la Clínica — Anti Frágil')),
      body: Row(
        children: [
          // Menú lateral (boceto)
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (_) {},
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.people_outline), label: Text('Pacientes')),
              NavigationRailDestination(
                  icon: Icon(Icons.folder_shared_outlined), label: Text('Ficha')),
              NavigationRailDestination(
                  icon: Icon(Icons.person_add_alt), label: Text('Alta')),
              NavigationRailDestination(
                  icon: Icon(Icons.video_library_outlined), label: Text('Vídeos')),
              NavigationRailDestination(
                  icon: Icon(Icons.assignment_outlined), label: Text('Packs')),
            ],
          ),
          const VerticalDivider(width: 1),
          // Contenido (boceto)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Panel web de la clínica\n\nSecciones:\n• ${_secciones.join('\n• ')}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
