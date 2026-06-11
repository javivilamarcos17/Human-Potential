# Checklist de Lanzamiento del Piloto — Anti Frágil

> Lista de comprobación para arrancar el piloto con la primera clínica.
> Cada ítem tiene un responsable y un criterio claro de "hecho".
> **Nada de esto es opcional.** Si un ítem está sin marcar, el piloto no arranca.

**Leyenda de responsables:**
- 🛠️ Equipo de desarrollo
- 👨‍⚕️ Clínica piloto
- ⚖️ Asesor legal
- 🏢 Anti Frágil (dueño del proyecto)

---

## BLOQUE 1 — Legal y privacidad
> Bloqueante absoluto. Sin esto, recoger datos de salud es ilegal.

- [ ] ⚖️ Borrador de `PRIVACIDAD_RGPD.md` revisado y validado por abogado especialista en RGPD + derecho sanitario.
- [ ] ⚖️ **DPA (Acuerdo de Encargado de Tratamiento)** redactado y firmado entre Anti Frágil y la clínica piloto antes del primer alta de paciente.
- [ ] 🛠️ Región de Supabase confirmada como **EU** (eu-central-1 Frankfurt o eu-west-1 Irlanda). Captura de pantalla del panel de Supabase como evidencia.
- [ ] ⚖️ DPA de Supabase obtenido e incluido como sub-encargado en el DPA con la clínica.
- [ ] ⚖️ Política de privacidad pública redactada y disponible en URL accesible antes del onboarding.
- [ ] 🛠️ Pantalla de consentimiento explícito implementada en el onboarding: casillas no pre-marcadas, separadas para datos de salud y (si aplica) investigación futura.
- [ ] 🏢 Email de privacidad habilitado (ej. privacidad@antifragil.es) con proceso documentado de respuesta en ≤ 30 días.
- [ ] ⚖️ Protocolo de respuesta ante brechas de seguridad documentado (quién notifica a la AEPD, en qué plazo, con qué contenido).
- [ ] ⚖️ Registro de Actividades de Tratamiento (Art. 30 RGPD) iniciado con este tratamiento.
- [ ] ⚖️ Aviso legal de la app revisado: Anti Frágil no es dispositivo médico, no sustituye criterio clínico.

---

## BLOQUE 2 — Técnico
> Bloqueante. Un fallo de seguridad o un build roto impide el piloto.

### Seguridad y base de datos
- [ ] 🛠️ **RLS (Row Level Security) completamente implementada** en todas las tablas con datos de salud: `triajes`, `auditorias_vitalidad`, `feedback_rpe`, `sesiones`, `prescripciones`, `pacientes`, `profesionales`.
- [ ] 🛠️ RLS **probada** con al menos dos clínicas ficticias: verificar que un profesional de la clínica A no puede ver datos de la clínica B.
- [ ] 🛠️ RLS **probada** con paciente: verificar que un paciente solo ve sus propios datos.
- [ ] 🛠️ Migración `0001_esquema_inicial.sql` aplicada en el entorno de producción de Supabase.
- [ ] 🛠️ Variables de entorno (URL de Supabase, claves) gestionadas como secrets — nunca en el código.

### App móvil (iOS y Android)
- [ ] 🛠️ Build de producción generado sin errores en iOS y Android.
- [ ] 🛠️ Probado en dispositivo físico real (no solo emulador): al menos un iPhone y un Android.
- [ ] 🛠️ Flujo completo de onboarding probado de principio a fin: registro → consentimiento → Código de Honor → Auditoría → Guardián asignado.
- [ ] 🛠️ Core loop diario probado completo: triaje → rutina → feedback RPE → actualización de avatar.
- [ ] 🛠️ Notificaciones push funcionando (recordatorio diario de triaje).
- [ ] 🛠️ App enviada a **TestFlight** (iOS) y **Google Play Internal Testing** (Android) para revisión previa al piloto.

### Panel web de la clínica
- [ ] 🛠️ Login del profesional funcionando.
- [ ] 🛠️ Alta de paciente + generación de Código de Honor probada.
- [ ] 🛠️ Panel de semáforos mostrando alertas correctamente cuando dolor > 7 o molestia_nueva = true.
- [ ] 🛠️ Creación y prescripción de Packs probada de extremo a extremo.
- [ ] 🛠️ Gestión de plantillas de Auditoría: el profesional puede crear/editar su propio test.

### Infraestructura
- [ ] 🛠️ Backup automático de Supabase configurado y verificado.
- [ ] 🛠️ Monitorización de errores activa (Sentry o equivalente) en app móvil y panel web.
- [ ] 🏢 Canal de soporte directo habilitado (WhatsApp o Slack) para la clínica piloto.

---

## BLOQUE 3 — Clínico y contenido
> Bloqueante funcional. Sin contenido, el paciente no puede hacer ninguna rutina.

- [ ] 👨‍⚕️ Plantilla de Auditoría de Vitalidad creada por el profesional piloto en su panel (al menos los 4 bloques base: fuerza, aeróbico, movilidad, constancia).
- [ ] 👨‍⚕️ **Mínimo 10 vídeos de ejercicios** grabados, subidos a Vimeo/AWS y añadidos a la librería del panel.
- [ ] 👨‍⚕️ **Mínimo 3 Packs** de rutina creados y listos para prescribir (ej. Pack Lumbar, Pack Hombro, Pack General).
- [ ] 👨‍⚕️ Profesional ha completado el onboarding del panel de forma autónoma (sin ayuda del equipo Anti Frágil).
- [ ] 🏢 Sesión de formación de 60-90 min realizada con el profesional: triaje, panel de semáforos, prescripción, gestión de alertas.
- [ ] 👨‍⚕️ Lista de los primeros 20-40 pacientes candidatos identificada y comunicada a Anti Frágil.
- [ ] 👨‍⚕️ Consentimiento informado físico (papel) preparado para que los pacientes firmen en consulta, complementando el consentimiento digital.

---

## BLOQUE 4 — Comercial y operativo
> No bloqueante técnico, pero sí estratégico para la validación del modelo de negocio.

- [ ] 🏢 Acuerdo de piloto firmado con la clínica: duración (10 semanas), gratuidad, contraprestación (feedback activo, entrevistas), condición de conversión a pago.
- [ ] 🏢 Calendario de seguimiento acordado: reuniones quincenales en semanas 2, 4, 6, 8 y 10.
- [ ] 🏢 Métricas de éxito del piloto comunicadas a la clínica (ver [`PLAN_PILOTO.md`](PLAN_PILOTO.md) §6).
- [ ] 🏢 Protocolo de escalada definido: si un paciente reporta dolor ≥ 9 dos días seguidos, quién actúa y cómo.
- [ ] 🏢 Precio de conversión post-piloto acordado con la clínica antes de empezar (sin sorpresas al final). Ver [`MODELO_PRECIOS.md`](MODELO_PRECIOS.md).

---

## Criterio de "listo para arrancar"

> El piloto puede arrancar cuando **todos los ítems del Bloque 1 y Bloque 2 estén marcados**
> y al menos el 80 % del Bloque 3. Los ítems del Bloque 4 deben estar marcados antes de
> la semana 4 del piloto como máximo.

| Bloque | Ítems | Bloqueante |
|--------|-------|-----------|
| 1 — Legal | 10 | Sí — 100 % requerido |
| 2 — Técnico | 18 | Sí — 100 % requerido |
| 3 — Clínico | 7 | Parcial — mínimo 80 % |
| 4 — Comercial | 5 | No bloqueante al inicio |

---

*Documentos relacionados: [`PRIVACIDAD_RGPD.md`](PRIVACIDAD_RGPD.md),
[`PLAN_PILOTO.md`](PLAN_PILOTO.md), [`RIESGOS_Y_MITIGACIONES.md`](RIESGOS_Y_MITIGACIONES.md).*
