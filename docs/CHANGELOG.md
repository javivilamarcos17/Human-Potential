# Changelog — Historial de cambios

> Registro de todos los cambios significativos del proyecto.
> El más reciente siempre arriba.
> Formato: [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)

---

## [Sin publicar]

> Los cambios en desarrollo van aquí hasta que se publican.

### MVP funcional v1.0 — DEPURADO y listo para piloto (2026-06-13)
- **QA de cierre:** auditoría sin botones muertos / pantallas fantasma / IDs rotos (12 pantallas). Simulador E2E de 60 días + humo de UI (7 pantallas no petan): 🟢 TODO OK.
- **Hardening:** red de seguridad en el arranque (ningún fallo deja pantalla en blanco), localStorage protegido en modo privado iOS, herramientas de simulación ocultas salvo `?debug=1` (pacientes no las ven).
- **Coherencia:** nombre del Guardián dinámico en todos los textos (fin del "Kael" hardcodeado), "Vitalidad provisional" (afinada en la Semana de Eclosión).
- **Nuevas piezas:** reproductor de rutina guiado paso a paso (trabajo/descanso), banderas rojas clínicas (deriva a profesional/112), álbum de Retos Maestros, tutorial de bienvenida (60s), huevo reactivo.
- **Avatares (arte del dueño, generado):** 41/75 fases recibidas — Fuego y Rayo completos; sistema de carga de imágenes con fallback SVG listo (`mockups/avatares/`, INVENTARIO.md).

### MVP funcional testeable con pacientes (2026-06-12)
- **`app-funcional.html`** evolucionado a producto testeable: alta exprés autónoma (mini-Auditoría 30/30/20/20), motor de adaptación digital (6 reglas: dolor/energía/RPE/molestia/progresión/estancamiento), rutina amoldada al tiempo real (5/15/30 min), modo Centro B2B2C (código LIDOMARE26, actividades del centro, opción "hoy no puedo ir"), datos al centro vía WhatsApp (alertas + resumen 7 días), pantalla Mi Progreso (gráfico dolor/energía 14 días + nudge presencial), Tarjeta Épica funcional (canvas + Web Share).
- **Avatares**: siluetas atléticas con épica creciente (6 etapas), huevo con 4 sub-fases vivas (runas→grietas→temblor), celebración de evolución a pantalla completa, **líneas evolutivas Brote/Atlas/Apex** según Auditoría inicial (documentadas en moodboard como dirección de arte).
- Fix: migración defensiva del estado guardado (desbloquea "simular día" en navegadores con versión previa).
- **`docs/PILOTO_EXPRESS.md`**: guía para testear con 2-3 pacientes reales esta semana (GitHub Pages, 0 €).

### Inventario visual del MVP completo: A1-A12 con pantalla premium (2026-06-11)
- **`mockups/prototipo/sombrero.html`** (A3): revelación del arquetipo (Agua, ligada a la Auditoría 62/100) + elección 1 de 3 Guardianes con SVG propios. Solo Kael oficial; los otros dos marcados "(nombre provisional)" según el léxico.
- **`mockups/prototipo/upselling.html`** (A12): banner empático tras dolor alto 2 días — invita a sesión presencial con la Dra. Elena Ruiz; reserva fuera de la app (D6). Era la última pieza del MVP sin representación visual.
- **Flujo conectado**: el dashboard de `index.html` ahora enlaza a `evolucion.html` y `tarjeta-epica.html` (botones que antes eran demoAlert).
- **QA de enlaces**: todos los href de demo.html y los 8 prototipos verificados — 0 rotos.

### Modo solitario: RLS + monedero + QA aplicado (2026-06-11)
- **Migración 0006 — políticas RLS completas**: aislamiento multi-clínica en las 29 tablas (paciente ve lo suyo; profesional solo su clínica; pacientes B2C invisibles para clínicas — D8; catálogos solo lectura) + batería de pruebas obligatoria pre-despliegue. Cumple ESPECIFICACION_MVP §C y PRIVACIDAD_RGPD §7.
- **`mockups/prototipo/monedero.html`** (A9): Descuento Sudado al listón premium — cuota 12→4 € con suelo protegido, desglose (racha/referidos/reto), código JAVI-AF-2026 copiable, CTA a Tarjeta Épica, nota D6.
- **QA aplicado en los docs**: IC-2…IC-7 de AUDITORIA_COHERENCIA (umbral semáforo ≥8 en demo, 20-40 pacientes, 10 semanas, precios 150-250 €, arte Season 0, notificación sin hora prometida) + I2 (Fuego marcado Visión Norte en copy-tarjetas-epicas).
- **Hub de demo**: cards de evolución y monedero añadidas; títulos deduplicados.

### QA cruzado + relevo de organizador ejecutado (2026-06-11)
- **`docs/AUDITORIA_COHERENCIA.md`** (agente 2): auditoría cruzada de los 13 docs de negocio — 8 incoherencias (IC-1…IC-8) con archivo:línea y corrección propuesta.
- **Correcciones del organizador aplicadas**: PROPUESTA_DE_VALOR (A4/D1) y SYSTEM_VISION (Core Loop, D3, D5) actualizados de 20 → **30 fases** con nota Season 0 (D9); ESPECIFICACION_MVP A11 ahora incluye el pie de firma clínica en la Tarjeta Épica (IC-8, alineado con copy-tarjetas-epicas y guion de demo).
- **`docs/REVISION_CRITICA.md` restaurado** — había quedado vaciado por accidente en el commit f37dbf6; recuperado del historial (bb8352c).
- **Colas repartidas**: A1 → index.html v0.3 premium + monedero.html (evolucion.html ✔ pasa el listón); A2 → aplicar IC-2…IC-7 en sus docs; A3 → aplicar I1-I5 del léxico en sus copys (Aire→Viento, Fuego fuera del MVP, nombres no aprobados a placeholder).

### Añadido — Esquema Maestro modular (D8-D11) + ráfaga final de agentes (2026-06-11)
- **Decisiones D8-D11** (SYSTEM_VISION §7): registro dual B2C/B2B2C (Código de Centro, ej. LIDOMARE26), gamificación por **Temporadas** (Season 0 simple + Vitrina de Trofeos), bifurcación diaria **presencial (QR en recepción)/casa**, módulo clínico low-tech con placeholders medibles. Detalle: `docs/diseño/arquitectura-modular.md` + **migración 0005** (incluye `servicios_centro` y equivalencias presencial↔casa para recomendar las actividades de Lidomare).
- **Agente 1**: `moodboard-avatares.md` (estética "Pokémon moderno") + `mockups/prototipo/evolucion.html` (galería de evolución; QA pendiente).
- **Agente 2 (track completo)**: CHECKLIST_LANZAMIENTO · GUION_DEMO_CLINICAS · ONBOARDING_CLINICA · FAQ_PACIENTES. En curso: AUDITORIA_COHERENCIA.
- **Agente 3 (6 copys)**: microcopy-app · notificaciones · estados · tarjetas épicas · panel clínica · anamnesis · emails · ficha de tiendas. En curso: lexico-marca.
- Relevo de organizador documentado en `coordinacion/TABLERO.md` (sección ⚡ RELEVO).

### Añadido — Sistema de diseño, prototipos premium y cierre del track de negocio (2026-06-11)
- **Sistema de diseño**: `docs/diseño/sistema-diseno.md` + `mockups/prototipo/tokens.css` (tabla maestra de la estética; cambiarla en el futuro = un archivo) + tema Flutter espejo (`app_theme.dart`, paleta oscura premium).
- **Listón visual oficial**: `mockups/prototipo/board-premium.html` (board del paciente con avatar SVG, aurora animada, cristal). Dirección de arte fijada: **"Pokémon moderno"**, arco huevo→tipado→mono→guerrero→épico.
- **Prototipos**: pulido v0.2 del flujo (`index.html`, C3-C5 cerrados) · panel del fisio (`clinica.html`, QA aprobado) · **Tarjeta Épica** (`tarjeta-epica.html`, motor viral) · **hub de demo** (`mockups/demo.html`) para reuniones.
- **Track negocio (agente 2) completo hasta checklist**: MODELO_PRECIOS · PLAN_GO_TO_MARKET · PRIVACIDAD_RGPD (borrador, con 10 acciones bloqueantes pre-piloto).
- QA: C7 corregido (descuento del código alineado con MODELO_PRECIOS). Persona de demo canónica en todas las piezas.

### Añadido — UX como prioridad #1 + Riesgos (2026-06-11)
- **`docs/diseño/experiencia-usuario.md`** — la experiencia de usuario, lo visual y la personalización declaradas **prioridad #1 del MVP**: sensación objetivo, principios UX, momentos clave, microinteracciones y checklist de "pantalla terminada".
- **`docs/RIESGOS_Y_MITIGACIONES.md`** (agente 2) integrado en el índice; agente 2 avanza a KPIS.

### Revisión crítica + integración (2026-06-10)
- **`docs/REVISION_CRITICA.md`** — control de calidad vivo. Detectadas y **corregidas** 2 incoherencias del avatar al pasar de 20 a 30 fases: maqueta ("Fase 10 = Guardián Pleno" → Fase 16) y datos de demo (nivel 47/fase 10 → nivel 50/fase 16, coherente con `fases_avatar`).
- **`docs/PROYECCIONES_FINANCIERAS.md`** (agente 2) integrado en el índice; siguiente en su cola: ANALISIS_COMPETENCIA.

### Añadido — Índice de docs + datos de demo + personalización (2026-06-10)
- **`docs/README.md`** — índice maestro de toda la documentación (mapa de navegación del proyecto).
- **`supabase/migrations/0004_datos_demo.sql`** — datos de ejemplo (clínica + paciente + avatar a media evolución + rutina + triajes) para enseñar el MVP/prototipo con datos realistas.
- **`docs/diseño/personalizacion-y-detalles.md`** — principio rector: autoridad clínica + máxima personalización; las 4 capas, detalles pantalla por pantalla, tono y regla de oro del equipo.

### Añadido — Especificación del MVP al milímetro (2026-06-10)
- **`docs/ESPECIFICACION_MVP.md`** — plano preciso pantalla por pantalla (app paciente A1-A12, panel clínica B1-B6b, backend) con campos, validaciones y la "definición de terminado" del MVP. Manda sobre los diseños si algo choca.

### Añadido — Documentos de negocio (trabajo en paralelo de agentes) (2026-06-10)
- **`docs/PITCH_DECK.md`** — guion de Pitch Deck para inversores (13 diapositivas).
- **`docs/DOSSIER_DESARROLLO.md`** — dossier para pedir presupuesto a equipos de desarrollo (alcance, sprints, criterios, preguntas).
- **`docs/PLAN_PILOTO.md`** — plan de validación con la primera clínica (objetivo, métricas, 5 fases en 10 semanas, criterios de éxito).
- **`docs/IDENTIDAD_VISUAL.md`** — guía de marca (personalidad, paleta por arquetipo, tipografía, estilo de ilustración, copy sin culpa, Tarjetas Épicas).
- **`coordinacion/`** — sistema de coordinación de agentes en paralelo (carpeta + cola por agente).

### Añadido — Panel web de la clínica al detalle (2026-06-10)
- **`docs/diseño/panel-clinica.md`**: secciones del panel (B1–B6b), la pantalla de semáforos como alerta temprana, la ficha del paciente y la configurabilidad por profesional (D7).

### Añadido — Onboarding y registro (2026-06-10)
- **`docs/diseño/onboarding-registro.md`**: embudo de entrada (Código de Honor → registro → anamnesis → Auditoría → Sombrero Seleccionador → avatar listo), principios anti-abandono y qué se inicializa al terminar (A1).

### Añadido — Motor viral y económico (2026-06-10)
- **`docs/diseño/motor-viral-economico.md`**: Descuento Sudado (saldo visual, D6), referidos con código único, Tarjetas Épicas para redes y upselling a la clínica (A9·A10·A11).
- **`app/lib/features/monedero/descuento_sudado.dart`**: cálculo del descuento (constancia + referidos + hitos) con suelo que protege el margen de la clínica.

### Añadido — Diseño de Rutinas y Packs (2026-06-10)
- **`docs/diseño/rutinas-packs.md`**: cómo el profesional crea vídeos, los agrupa en Packs y los prescribe (A7·B5·B6); configurable por profesional (D7); límites MVP (sin visión artificial). Usa el modelo de datos ya existente.

### Añadido — Maqueta visual navegable (2026-06-10)
- **`mockups/anti-fragil.html`**: boceto visual que se abre en el navegador (sin instalar nada) con las pantallas clave (Dashboard/avatar, Triaje, Feedback, Panel clínica con semáforos) y el visor de evolución del avatar (6 etapas mayores → 30 fases). Placeholders editables; arte final por ilustrador humano (D5).

### Añadido — Diseño del Core Loop diario (2026-06-10)
- **`docs/diseño/core-loop-diario.md`**: el ciclo diario paso a paso (triaje → dashboard → rutina → feedback RPE → recompensa), economía de Puntos de Vitalidad, reglas de racha "sin tiranía", semáforos de alerta a la clínica y reenganche amable del abandono.
- **`app/lib/features/dashboard/economia_puntos.dart`**: lógica de XP por acción + bonus de racha + XP por re-Auditoría + actualización de racha (con descanso protegido).
- **`app/lib/features/clinica/alertas_semaforo.dart`**: lógica de semáforo (rojo/ámbar/verde) como sistema de alerta temprana para el profesional.

### Cambiado — Auditoría configurable por profesional (D7) (2026-06-10)
- **Decisión D7** en `SYSTEM_VISION.md`: la Auditoría y sus tests se especializan por clínica/profesional. Lo estable es el marco (4 bloques, 0-100); el contenido es configurable vía plantillas.
- **`supabase/migrations/0003_plantillas_auditoria.sql`**: tablas `plantillas_auditoria`, `plantilla_items`, `auditoria_respuestas` + columna `plantilla_id` en `auditorias_vitalidad`.
- `docs/diseño/auditoria-vitalidad.md` reescrito: separa el marco estable del contenido configurable; los micro-tests pasan a ser una "plantilla de ejemplo".
- Inventario (PROPUESTA_DE_VALOR §6): A2 marcado como configurable + nueva pieza B6b (gestión de plantillas en el panel de la clínica).
- Lección registrada en `lessons-learned/log.md`.

### Añadido — Diseño de la Auditoría de Vitalidad (2026-06-10)
- **`docs/diseño/auditoria-vitalidad.md`** — diseño completo del test de entrada: anamnesis, 3-4 micro-tests (fuerza, aeróbico, movilidad/dolor), rúbrica de puntuación de los 4 bloques (0-100), interpretación por rangos, re-Auditorías y conexión con avatar/arquetipo. Marcado como borrador a validar por el equipo clínico.
- **`app/lib/features/onboarding/auditoria_vitalidad.dart`** — lógica de cálculo de la puntuación (resultados crudos → 4 bloques → total), con umbrales editables.

### Añadido — Profundización del boceto (2026-06-10)
- **`docs/PROPUESTA_DE_VALOR.md`** — propuesta de valor completa (problema, solución, mecanismo único, fosos defensivos, modelo de negocio) + **inventario completo de todo lo que hay que crear** (app paciente, panel clínica, backend, contenido) marcado por fase (MVP/Nevera/Visión Norte).
- **`docs/diseño/avatar-evolucion.md`** — sistema de evolución del avatar con sentido clínico: doble eje (constancia + mejora real), **30 fases en 6 etapas mayores** (modelo de dos capas para muchas fases sin disparar el coste de arte), puertas clínicas, estado Legendario (Trinidad del Nivel 100) y asignación por test/valoraciones (Sombrero Seleccionador).
- **`supabase/migrations/0002_catalogo_avatar.sql`** — tabla catálogo `fases_avatar` (30 fases) + datos de ejemplo: 3 arquetipos y 10 retos maestros.
- **Motor de evolución en Dart** (`app/lib/features/dashboard/avatar_evolucion.dart`): cálculo XP→nivel→fase con puertas clínicas y estado Legendario.
- **Sombrero Seleccionador en Dart** (`app/lib/features/onboarding/sombrero_seleccionador.dart`): asignación de arquetipo por valoración + XP de partida.
- **Esqueleto del panel web de la clínica** (`app/lib/features/clinica/panel_clinica_screen.dart`, B1-B6).
- Ampliado `avatares.fase_visual` de 1-20 a 1-30.

### Añadido — Boceto inicial del MVP v1.5 (2026-06-10)
- **Decisiones cerradas D1–D6** en `SYSTEM_VISION.md` (stack, multi-clínica, avatar, arquetipos, arte, pagos fuera).
- **ADR-001** — Stack Flutter + Supabase.
- **ADR-002** — Arquitectura multi-clínica (multi-tenant) desde el día uno.
- **Modelo de datos completo** documentado en `docs/ARQUITECTURA.md` (clínica, profesional, paciente, auditoría, avatar/items/retos, triaje, vídeos/packs, prescripciones/sesiones, feedback RPE, monedero, referidos).
- **Esquema SQL inicial** en `supabase/migrations/0001_esquema_inicial.sql`.
- **Esqueleto Flutter** del flujo principal en `app/` (onboarding, dashboard, triaje, rutinas, feedback, monedero, tarjetas, upselling) + tema y configuración.
- **Roadmap de creación** por fases (Fase 0 cimientos → Fase 1 MVP en 7 sprints → Fase 2 "Nevera" → Fase 3 "Visión Norte").

---

<!-- Claude añade entradas aquí siguiendo este formato:

## [1.0.0] — YYYY-MM-DD

### Añadido
- Nueva funcionalidad X que permite Y

### Cambiado
- El flujo de Z ahora funciona así en lugar de asá

### Corregido
- El error que ocurría cuando...

### Eliminado
- Se eliminó la funcionalidad X porque...

-->
