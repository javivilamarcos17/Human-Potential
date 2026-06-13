# Estado del MVP — Anti Frágil

> Sello de estado del MVP funcional. Actualizado: 2026-06-13.
> App funcional: `mockups/prototipo/app-funcional.html` (abrir con servidor local o GitHub Pages).

## ✅ MVP funcional v1.0 — LISTO para piloto

El ciclo completo del paciente funciona de extremo a extremo, verificado por simulador
automático (`tests/sim-paciente.js`: 60 días + humo de UI · 🟢 30 checks verdes · 0 errores).
Auditoría de integridad: **0 botones muertos, 0 pantallas fantasma, 0 IDs rotos** (13 pantallas).

### Qué hace, pieza por pieza
| Área | Estado |
|------|--------|
| Alta exprés + consentimiento RGPD (bloqueante) | ✅ |
| Elemento por objetivo de salud (5 elementos) + huevo misterioso reactivo | ✅ |
| Semana de Eclosión (7 pruebas reales que afinan la Vitalidad) | ✅ |
| Triaje diario + micro-pregunta de vida | ✅ |
| Motor adaptativo (dolor/energía/sueño/estrés/tiempo/regreso/estancamiento) | ✅ |
| Reproductor de rutina guiado (trabajo/descanso) + marcado manual | ✅ |
| Banderas rojas clínicas → deriva a profesional / 112 | ✅ |
| Gamificación: 5 elem × 3 líneas × 30 fases + sub-fases + Retos Maestros + re-Auditoría | ✅ |
| Ficha del Guardián (nombre, especie, lore, progreso) | ✅ |
| Celebración de evolución + huevo con sub-fases | ✅ |
| PC (colección por temporadas) + cierre de season con herencia | ✅ |
| Mi Progreso (gráfico dolor/energía) + nudge presencial | ✅ |
| Tarjeta Épica funcional (canvas + compartir) | ✅ |
| Modo Centro B2B2C (código, actividades, "hoy no puedo ir") | ✅ |
| Datos al centro vía WhatsApp + sync a Supabase | ✅ |
| Panel del profesional con datos vivos (`panel-piloto.html`) | ✅ |
| Tutorial de bienvenida (60s) | ✅ |
| PWA instalable + offline + red de seguridad en arranque | ✅ |
| Herramientas de debug ocultas para pacientes (`?debug=1`) | ✅ |

### Avatares (arte generado por el dueño con el brief)
**69/75 fases** recibidas. Completos: Fuego, Rayo, Hierba, Roca (60) + Agua 9.
Faltan 6 (todas de Agua) — ver `mockups/avatares/INVENTARIO.md`.
Sistema de carga de imágenes con fallback a SVG: listo. Al guardar los PNG transparentes
en su carpeta, la app los muestra sin tocar código.

## 🚀 Para soltar a un paciente real (pasos del dueño — ~15 min)
1. **Supabase:** crear proyecto (región EU) → aplicar `supabase/migrations/0007_piloto_express.sql`.
2. Pegar URL + anon key en el bloque `CONFIG.supabase` de `app-funcional.html`.
3. **Publicar:** GitHub Pages (Settings → Pages → rama `feat/boceto-mvp`) → enviar el link al paciente.
4. (Opcional) Guardar los PNG de avatares en `mockups/avatares/<elemento>-<linea>/`.
5. Panel del profesional: abrir `panel-piloto.html` con la service_role key.

Guía detallada: `docs/PILOTO_EXPRESS.md`.

## ⏭️ Fuera del MVP (siguiente fase, requiere equipo/backend)
- App nativa Flutter (tiendas), login real, push notifications en segundo plano.
- Las 6 fases de Agua restantes + micro-fases del arte (~225) + integración real con el centro.
- Validación legal del consentimiento por abogado (hoy es borrador piloto).
