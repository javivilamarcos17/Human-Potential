# Auditoría de Coherencia — Documentos de Negocio

> Revisión cruzada de los 13 documentos de negocio creados + PROPUESTA_DE_VALOR,
> PLAN_PILOTO, ROADMAP, SYSTEM_VISION y ESPECIFICACION_MVP.
> **Este documento NO corrige nada — solo lista las incoherencias. El organizador decide.**
>
> Fuente de autoridad cuando hay conflicto: ESPECIFICACION_MVP > SYSTEM_VISION > resto.

---

## INCOHERENCIAS CRÍTICAS (afectan a números, funcionalidades o promesas al usuario)

---

### IC-1 — Número de fases del avatar: 20 vs 30

**Gravedad:** 🔴 Alta — afecta al coste de arte, al motor de gamificación y a las promesas al equipo de desarrollo.

| Documento | Dice | Correcto |
|-----------|------|---------|
| `PROPUESTA_DE_VALOR.md` §6 A4 | "Avatar / Guardián (20 fases)" | ❌ |
| `PROPUESTA_DE_VALOR.md` §6 D1 | "Arte de avatares (20 fases × arquetipo)" | ❌ |
| `SYSTEM_VISION.md` D3 | "20 fases visuales (Huevo → Forja → Olimpo/Nivel 100)" | ❌ |
| `SYSTEM_VISION.md` D5 | "ilustraciones finales (20 fases × familia)" | ❌ |
| `ROADMAP.md` Sprint 4 | "30 fases en 6 etapas mayores" | ✅ |
| `SYSTEM_VISION.md` D9 | "Season 0 lanza simple (3-4 formas); las 30 fases son el mapa" | ✅ |
| `supabase/migrations/0001` | `fase_visual between 1 and 30` | ✅ autoritativo |
| `RIESGOS_Y_MITIGACIONES.md` P5 | "las 20 fases completas" | ❌ |
| `KPIS_NEGOCIO.md` §7 | "30 fases" | ✅ |

**Raíz:** el número original era 20; D9 lo elevó a 30 sin propagar la corrección.

**Corrección propuesta:** actualizar PROPUESTA_DE_VALOR A4, D1, SYSTEM_VISION D3/D5 y RIESGOS P5 a "30 fases". **Además**, añadir en todos que el MVP (Season 0) arranca con 3-4 formas base, no con las 30 completas.

---

### IC-2 — Alcance del arte del avatar en el MVP: 20 fases vs 3-4 formas (Season 0)

**Gravedad:** 🔴 Alta — afecta directamente a los presupuestos de arte.

| Documento | Dice | Correcto |
|-----------|------|---------|
| `PROYECCIONES_FINANCIERAS.md` §4 | "Arte de avatares (20 fases × 3 arquetipos) 3.000-8.000 €" | ❌ |
| `DOSSIER_DESARROLLO.md` §2 | "Arte de avatares (ilustrador humano, 20 fases × 3 arquetipos) 3.000-8.000 €" | ❌ |
| `SYSTEM_VISION.md` D9 | "Season 0 lanza simple (3-4 formas); las 30 fases son el mapa al que se crece" | ✅ autoritativo |

**Raíz:** PROYECCIONES y DOSSIER se escribieron antes de que D9 aclarara que el MVP solo necesita 3-4 formas base, no las 30 fases completas.

**Corrección propuesta:** en PROYECCIONES y DOSSIER, cambiar la línea de arte a "Arte de avatares MVP Season 0 (3-4 formas × 3 arquetipos)". El coste 3.000-8.000 € puede mantenerse como rango orientativo, pero la descripción debe reflejar el alcance real.

---

### IC-3 — Umbral del semáforo rojo: "7 o más" vs ">7" (≥8)

**Gravedad:** 🔴 Alta — es una regla de negocio que el equipo de desarrollo implementará literalmente.

| Documento | Dice | Correcto |
|-----------|------|---------|
| `ESPECIFICACION_MVP.md` A6 | `≥8 → semáforo rojo` | ✅ autoritativo |
| `SYSTEM_VISION.md` §5 | `>7` (= ≥8 para enteros) | ✅ equivalente |
| `KPIS_NEGOCIO.md` §11 | `dolor > 7` (= ≥8 para enteros) | ✅ equivalente |
| `CHECKLIST_LANZAMIENTO.md` §2 | `dolor > 7` (= ≥8 para enteros) | ✅ equivalente |
| **`GUION_DEMO_CLINICAS.md` línea 94** | **"Si el dolor sube a 7 o más" (= ≥7)** | **❌ incorrecto** |

**Raíz:** "7 o más" en el guion incluye el 7, lo que dispararía alertas con un nivel que el spec no considera rojo.

**Corrección propuesta:** `GUION_DEMO_CLINICAS.md` línea 94: cambiar "7 o más" por "más de 7" o "8 o más".

---

### IC-4 — Número de pacientes en el piloto: 20-30 vs 20-40

**Gravedad:** 🟡 Media — el guion de ventas promete un alcance menor al planificado.

| Documento | Dice | Correcto |
|-----------|------|---------|
| `PLAN_PILOTO.md` §1 y §4.2 | "20-40 pacientes" | ✅ autoritativo |
| `ONBOARDING_CLINICA.md` §0.5 | "20-40 pacientes" | ✅ |
| `CHECKLIST_LANZAMIENTO.md` §3 | "20-40 pacientes" | ✅ |
| **`GUION_DEMO_CLINICAS.md` líneas 128 y 137** | **"20-30 pacientes"** | **❌** |

**Corrección propuesta:** `GUION_DEMO_CLINICAS.md` líneas 128 y 137: cambiar a "20-40 pacientes".

---

### IC-5 — Duración del piloto: "8-12 semanas" vs "10 semanas" dentro del mismo documento

**Gravedad:** 🟡 Media — inconsistencia interna en PLAN_PILOTO.

| Documento | Dice |
|-----------|------|
| `PLAN_PILOTO.md` §1 (objetivo) | "Con 8-12 semanas y 20-40 pacientes…" |
| `PLAN_PILOTO.md` §4 (plan) | "Duración total: 10 semanas." |

El resto de documentos (CHECKLIST, GUION_DEMO, ONBOARDING, FAQ_CLINICAS) dicen uniformemente "10 semanas".

**Corrección propuesta:** `PLAN_PILOTO.md` §1: cambiar "8-12 semanas" a "10 semanas" para alinear con la sección de plan del mismo documento.

---

### IC-6 — Precio techo: 250 € vs 300 €/mes

**Gravedad:** 🟡 Media — puede crear expectativas contradictorias en ventas.

| Documento | Dice |
|-----------|------|
| `MODELO_PRECIOS.md` | Plan más alto con precio visible = Profesional 250 €/mes. Plan Cadena = "precio negociado" (sin cifra). |
| `PROYECCIONES_FINANCIERAS.md` §2 | "Cuota mensual por clínica: 150-300 €/mes" |
| `GUION_DEMO_CLINICAS.md` cierre precio | "hablamos de 150-250 €/mes" |

El rango de PROYECCIONES incluye 300€ pero MODELO_PRECIOS no muestra ningún plan a 300€. Un inversor o clínica que lea ambos documentos verá cifras diferentes.

**Corrección propuesta:** en PROYECCIONES, cambiar "150-300 €/mes" a "150-250 €/mes (plan Cadena: precio negociado)" para alinear con MODELO_PRECIOS.

---

### IC-7 — Hora configurable de notificaciones: no está en el spec

**Gravedad:** 🟡 Media — promesa de UX no especificada que el equipo de desarrollo podría ignorar.

| Documento | Dice |
|-----------|------|
| `FAQ_PACIENTES.md` línea 74 | "La app te manda una notificación de recordatorio cada día **a la hora que tú elijas**." |
| `ESPECIFICACION_MVP.md` A6 | Solo dice "Notificaciones push funcionando (recordatorio diario de triaje)." Sin mencionar hora configurable. |
| `CHECKLIST_LANZAMIENTO.md` | "Notificaciones push funcionando" — sin hora configurable. |

**Corrección propuesta:** o (a) añadir la hora configurable como requisito en ESPECIFICACION_MVP A6, o (b) cambiar FAQ_PACIENTES a "a una hora fija" o simplemente "cada día" hasta que el requisito esté especificado.

---

### IC-8 — Nombre de la clínica en la Tarjeta Épica: promesa no especificada

**Gravedad:** 🟡 Media — puede generar expectativas en la demo que el MVP no cumplirá.

| Documento | Dice |
|-----------|------|
| `GUION_DEMO_CLINICAS.md` línea 113 | "El nombre de tu clínica va ahí. Es publicidad gratuita con credibilidad real." |
| `ESPECIFICACION_MVP.md` A11 | "imagen vertical (avatar + nivel + frase)" — sin mención a nombre de clínica. |
| `PROPUESTA_DE_VALOR.md` A11 | "Imagen compartible (avatar + nivel + frase)" — sin mención a nombre de clínica. |

Si el MVP no incluye el nombre de la clínica en la Tarjeta Épica y el comercial lo ha prometido en la demo, habrá un problema de expectativas.

**Corrección propuesta:** o (a) añadir "nombre de clínica (opcional)" a ESPECIFICACION_MVP A11 si es un requisito real, o (b) eliminar esa frase del guion de demo.

---

## INCOHERENCIAS MENORES (terminología y formato)

---

### IM-1 — Capitalización de "Código de Honor"

Todos los documentos de negocio usan "Código de Honor" (capitalizado) de forma consistente. ✅ Sin corrección necesaria.

### IM-2 — "Descuento Sudado" vs "descuento sudado"

La mayoría usa "Descuento Sudado" (capitalizado como nombre propio). Algunos contextos usan minúsculas en medio de frase — es aceptable. Sin corrección crítica.

### IM-3 — Referencias cruzadas entre documentos

Varios documentos mencionan archivos que no existen aún (ej. `docs/REVISION_CRITICA.md` estaba vacío cuando se auditó). Sin impacto en el contenido.

---

## VERIFICACIÓN DE ALCANCE MVP (nada de Nevera/Fase 3 prometido como MVP)

| Documento | ¿Promete algo de Nevera/Fase 3? | Veredicto |
|-----------|--------------------------------|-----------|
| ANALISIS_COMPETENCIA | Wearables mencionados como futura ventaja, no MVP | ✅ |
| PROYECCIONES | Instituto Anti Frágil etiquetado como Fase 3 | ✅ |
| PRIVACIDAD_RGPD | Instituto como Fase 3, aviso anticipado correcto | ✅ |
| KPIS_NEGOCIO | Sin mencionar funcionalidades de Nevera | ✅ |
| GUION_DEMO | Sin mencionar IA, wearables ni comunidad social | ✅ |
| FAQ_PACIENTES | Sin mencionar IA ni wearables | ✅ |
| RIESGOS | Fase 3 correctamente etiquetada | ✅ |

**Conclusión de alcance:** ningún documento promete funcionalidades de Nevera o Fase 3 como parte del MVP. ✅

---

## Resumen ejecutivo

| # | Gravedad | Archivos afectados | Acción |
|---|----------|--------------------|--------|
| IC-1 | 🔴 Alta | PROPUESTA_DE_VALOR, SYSTEM_VISION D3/D5, RIESGOS P5 | Cambiar 20 → 30 fases; aclarar Season 0 = 3-4 formas |
| IC-2 | 🔴 Alta | PROYECCIONES, DOSSIER_DESARROLLO | Cambiar "20 fases × 3 arquetipos" → "3-4 formas × 3 arquetipos (Season 0)" |
| IC-3 | 🔴 Alta | GUION_DEMO_CLINICAS línea 94 | "7 o más" → "más de 7" (= ≥8) |
| IC-4 | 🟡 Media | GUION_DEMO_CLINICAS líneas 128, 137 | "20-30" → "20-40 pacientes" |
| IC-5 | 🟡 Media | PLAN_PILOTO §1 | "8-12 semanas" → "10 semanas" |
| IC-6 | 🟡 Media | PROYECCIONES §2 | "150-300 €" → "150-250 €/mes (Cadena: precio negociado)" |
| IC-7 | 🟡 Media | FAQ_PACIENTES línea 74 | Clarificar si hora configurable está en el spec |
| IC-8 | 🟡 Media | GUION_DEMO_CLINICAS línea 113 | Confirmar si nombre de clínica en Tarjeta Épica es MVP |
