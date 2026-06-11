# Onboarding de Clínica Nueva — Anti Frágil

> Guía operativa para activar una clínica desde el acuerdo hasta los primeros pacientes
> usando la app a diario. Semana a semana, con quién hace qué y cómo saber que está hecho.

**Leyenda de responsables:**
- 🏢 Anti Frágil (dueño del proyecto o equipo de soporte)
- 👨‍⚕️ Profesional / clínica
- 🤝 Ambos juntos

**Criterio de "clínica activada":** al menos 10 pacientes con triaje completado en los
primeros 7 días tras el alta. Por debajo de ese umbral, hay que actuar antes de la semana 2.

---

## Semana 0 — Preparación (antes del primer paciente)

> Todo esto ocurre antes de dar de alta a ningún paciente. Si algo de esta semana
> no está listo, el arranque se retrasa — no se improvisa.

### Paso 0.1 — Firma del DPA y acuerdo de piloto
- 🤝 Firmar el **DPA (Acuerdo de Encargado de Tratamiento)** entre Anti Frágil y la clínica.
- 🤝 Firmar el acuerdo de piloto: duración, gratuidad, contraprestación, condición de conversión.
- **Criterio de hecho:** documentos firmados en papel o firma digital. Sin esto no se abre el acceso.

### Paso 0.2 — Creación del perfil de la clínica
- 🏢 Crear la clínica en el panel de administración de Supabase.
- 🏢 Crear el usuario profesional con rol `admin_clinica`.
- 🏢 Enviar las credenciales de acceso al panel web por canal seguro (no email sin cifrar).
- **Criterio de hecho:** el profesional entra al panel y ve su clínica vacía.

### Paso 0.3 — Sesión de formación inicial (60-90 min, presencial o videollamada)
- 🤝 Recorrido guiado del panel: alta de pacientes, panel de semáforos, prescripción de packs.
- 🤝 El profesional crea su primera plantilla de Auditoría de Vitalidad (los 4 bloques base).
- 🤝 El profesional sube los primeros 5 vídeos de ejercicios al panel.
- 🏢 Habilitar canal de soporte directo (WhatsApp o Slack) y presentar el protocolo de ayuda.
- **Criterio de hecho:** el profesional ha navegado el panel sin ayuda durante 10 minutos y ha creado al menos 1 pack.

### Paso 0.4 — Preparación de contenido mínimo
- 👨‍⚕️ Grabar y subir **mínimo 10 vídeos** de ejercicios (pueden ser en móvil, duración 1-5 min).
- 👨‍⚕️ Crear **mínimo 3 Packs** de rutina listos para prescribir (ej. Pack Lumbar, Pack Hombro, Pack General).
- 🏢 Enviar guía de grabación de vídeos si el profesional no tiene experiencia.
- **Criterio de hecho:** el panel tiene ≥ 10 vídeos y ≥ 3 packs activos.

### Paso 0.5 — Selección de los primeros pacientes
- 👨‍⚕️ Identificar 20-40 pacientes candidatos: lesiones recurrentes, dolor postural crónico, rehabilitación activa.
- 👨‍⚕️ Descartar: pacientes puntuales sin seguimiento, pacientes en alta temporal, pacientes con muy baja adherencia previsible.
- 🏢 Compartir con el profesional el modelo de consentimiento informado (papel) para que los pacientes firmen en consulta.
- **Criterio de hecho:** lista de pacientes candidatos acordada con Anti Frágil.

---

## Semana 1 — Arranque

> Objetivo: primeros 10-20 pacientes activos con su Guardián asignado.

### Día 1-2 — Primeros altas (en consulta, con el fisio presente)
- 🤝 Alta de los primeros 5-10 pacientes en el panel: nombre, email, generación del Código de Honor.
- 👨‍⚕️ El profesional entrega el Código de Honor al paciente **en persona durante la consulta**.
- 🤝 El paciente descarga la app y completa el onboarding **con el fisio presente** (5-10 min).
  - Registro → consentimiento → Código de Honor → Auditoría de Vitalidad → Sombrero Seleccionador → Guardián asignado.
- 👨‍⚕️ El profesional asigna el primer Pack al paciente antes de que salga de consulta.
- **Criterio de hecho:** el paciente sale de consulta con su Guardián asignado y una rutina prescrita.

> ⚠️ **Regla crítica:** el onboarding del paciente siempre en consulta, nunca enviando
> un link por WhatsApp sin acompañamiento. Las primeras 48 horas son el momento de mayor
> abandono — el fisio presente multiplica la activación.

### Día 3-5 — Seguimiento de activación
- 🏢 Verificar que los pacientes dados de alta han completado al menos 1 triaje.
- 🏢 Si algún paciente no ha hecho el triaje en 48h: avisar al profesional para que le contacte.
- 👨‍⚕️ Continuar dando de alta al resto de pacientes candidatos durante la semana.
- **Criterio de hecho al día 7:** ≥ 10 pacientes con al menos 1 triaje completado.

### Reunión de seguimiento — Final de semana 1 (30 min)
- 🤝 Revisar: ¿cuántos pacientes activos? ¿algún problema técnico? ¿algún paciente confundido?
- 🤝 Ajustar si hay fricción evidente antes de que escale.
- 🏢 Mostrar al profesional los primeros datos del panel de semáforos.

---

## Semana 2-3 — Consolidación

> Objetivo: el profesional opera el panel de forma autónoma. Los pacientes tienen hábito.

- 👨‍⚕️ El profesional revisa el panel de semáforos al menos 3 veces/semana de forma autónoma.
- 👨‍⚕️ El profesional actúa ante las alertas rojas (contacto con el paciente o ajuste de rutina).
- 👨‍⚕️ El profesional da de alta a los pacientes restantes de la lista (sin ayuda de Anti Frágil).
- 🏢 Monitorizar la métrica norte estrella (sesiones/paciente/semana). Si < 1,5 dos semanas seguidas → acción inmediata.
- **Criterio de hecho:** el profesional gestiona el panel sin llamar a soporte.

### Reunión de seguimiento — Semana 2 (30 min)
- 🤝 Revisar primeras métricas: adherencia, retención, alertas actuadas.
- 🤝 Recoger primeras impresiones del profesional y de 2-3 pacientes.
- 🏢 Identificar el cuello de botella principal si lo hay (triaje, contenido, gamificación).

---

## Semana 4 — Primera revisión de métricas

- 🏢 Presentar al profesional el informe de las primeras 4 semanas:
  - Nº pacientes activos vs. dados de alta.
  - Tasa de adherencia semanal.
  - Evolución media del dolor.
  - Alertas generadas y actuadas.
- 🤝 Conversación sobre continuidad: "¿Ves el valor? ¿Qué mejorarías?"
- 🏢 Si los datos son positivos: introducir conversación suave sobre precio post-piloto.
- **Criterio de hecho:** el profesional puede leer e interpretar sus propias métricas sin ayuda.

---

## Criterios de "clínica activada" (resumen)

| Criterio | Cuándo verificar | Umbral |
|----------|-----------------|--------|
| Pacientes con triaje completado en primeras 48h | Día 7 | ≥ 10 pacientes |
| Profesional abre el panel de forma autónoma | Semana 2 | ≥ 3 veces/semana |
| Adherencia semanal (sesiones completadas/prescritas) | Semana 4 | ≥ 50 % |
| Alertas rojas actuadas por el profesional | Semana 4 | ≥ 80 % |

Si algún criterio no se cumple, no se declara la clínica como "activada" — se identifica
el problema específico y se actúa antes de continuar.

---

## Señales de peligro y cómo actuar

| Señal | Cuándo | Acción |
|-------|--------|--------|
| < 5 pacientes con triaje en primeros 7 días | Día 7 | Llamada al profesional ese mismo día. Revisar si el onboarding se hizo en consulta o por link. |
| Profesional no abre el panel en 5 días | Semana 2 | Contacto proactivo. ¿Hay un problema técnico? ¿Ha perdido la motivación? |
| Adherencia < 30 % en semana 3 | Semana 3 | Entrevista con 2-3 pacientes para entender la fricción. Revisión del contenido de los packs. |
| El profesional pide cancelar | Cualquier momento | Escuchar sin presionar. Entender el motivo. Si es técnico, resolver. Si es de valor, documentar y aprender. |

---

*Documentos relacionados: [`CHECKLIST_LANZAMIENTO.md`](CHECKLIST_LANZAMIENTO.md),
[`PLAN_PILOTO.md`](PLAN_PILOTO.md), [`PRIVACIDAD_RGPD.md`](PRIVACIDAD_RGPD.md),
[`GUION_DEMO_CLINICAS.md`](GUION_DEMO_CLINICAS.md).*
