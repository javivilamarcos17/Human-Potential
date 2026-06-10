// upselling_banner.dart — Banner de upselling hacia la clínica.
//
// QUÉ HACE (boceto):
//  · Aparece automáticamente si el usuario reporta dolor alto o se estanca.
//  · Invita a reservar una sesión presencial → redirige a web/WhatsApp de la clínica.
//
// El cierre comercial ocurre FUERA de la app (D6). Es un widget reutilizable, no una
// pantalla completa.

import 'package:flutter/material.dart';

class UpsellingBanner extends StatelessWidget {
  const UpsellingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.health_and_safety_outlined),
        title: const Text('¿Te vendría bien una sesión presencial?'),
        subtitle: const Text('Reserva con tu clínica'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO(equipo): abrir web/WhatsApp de la clínica.
        },
      ),
    );
  }
}
