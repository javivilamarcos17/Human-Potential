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
| Organizador | Diseño producto + QA + integración | Vigía + integrar correcciones de agentes | 🔄 activo |
| Agente 1 | Marca & prototipo visual | index.html → v0.3 premium; luego monedero.html | ▶ asignada |
| Agente 2 | Negocio | Aplicar IC-2…IC-7 de AUDITORIA_COHERENCIA en sus docs | ▶ asignada |
| Agente 3 | Contenido & voz (copy) | Aplicar I1-I5 del léxico en sus copys | ▶ asignada |

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
