# 📋 TABLERO — visión global (lo mantiene el organizador)

> Quién hace qué y en qué estado. Actualizado: 2026-06-11 (relevo ejecutado; QA cruzado aplicándose).

## ⚡ Estado actual
- Relevo completado: AUDITORIA_COHERENCIA recibida y revisada; lexico-marca recibido (I1-I5); evolucion.html ✔ pasa el listón; REVISION_CRITICA.md restaurado (estaba vaciado por accidente).
- Correcciones del organizador aplicadas: PROPUESTA_DE_VALOR + SYSTEM_VISION → 30 fases/Season 0 (IC-1); ESPECIFICACION_MVP A11 → pie firma clínica (IC-8).
- Esquema Maestro modular D8-D11 (SYSTEM_VISION §7 + diseño/arquitectura-modular.md + migración 0005). Lidomare = partner real.
- Servidor demo: `python -m http.server 8080` → mockups/demo.html.
- Vigía: bucle de `git fetch` en background para detectar pushes de agentes (rearmar tras cada push propio).
- PR abierto: feat/boceto-mvp → master (merge SOLO con aprobación del dueño).

| Agente | Track | Tarea en curso | Estado |
|--------|-------|----------------|--------|
| Organizador | TODO (modo solitario por eficiencia de tokens) | Construcción directa | 🔄 activo |
| Agentes 1-3 | — | Pausados (bloqueos de permisos; el organizador absorbió sus pendientes) | ⏸️ |

**Hecho en modo solitario (2026-06-11):** RLS completa (migración 0006) · monedero.html premium ·
correcciones IC-2…IC-7 + I2 aplicadas · hub demo con evolución y monedero · index.html verificado al listón.

## Entregado y verificado ✅
- **Visual:** prototipo navegable v0.2 (8 pantallas, persona canónica, pulido C3-C5) · maqueta panorámica · IDENTIDAD_VISUAL
- **Negocio:** PITCH_DECK · ONE_PAGER · DOSSIER_DESARROLLO · PLAN_PILOTO · FAQ_CLINICAS · PROYECCIONES · COMPETENCIA · RIESGOS · KPIS · MODELO_PRECIOS
- **Producto (organizador):** PROPUESTA_DE_VALOR · ESPECIFICACION_MVP · 8 docs de diseño · esqueleto Flutter + lógica · 4 migraciones SQL · REVISION_CRITICA

## Backlog por agente
- **A1:** clinica.html → moodboard-avatares → evolucion.html (galería + re-Auditoría wow)
- **A2:** GO_TO_MARKET → PRIVACIDAD_RGPD → CHECKLIST_LANZAMIENTO
- **A3:** microcopy-app → copy-notificaciones → copy-estados → copy-tarjetas-epicas

## Cómo ver el proyecto (dueño)
Servidor local activo: **http://localhost:8080/mockups/prototipo/index.html** (F5 para refrescar tras cada pull).

## Incoherencias corregidas (QA): C1-C7 — ver `docs/REVISION_CRITICA.md`
