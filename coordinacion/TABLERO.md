# 📋 TABLERO — visión global (lo mantiene el organizador)

> Quién hace qué y en qué estado. El organizador lo actualiza tras cada `git pull`.

| Agente | Track | Tarea en curso | Estado |
|--------|-------|----------------|--------|
| Organizador | Diseño producto + integración + spec MVP al milímetro | `docs/ESPECIFICACION_MVP.md` | 🔄 activo |
| Agente 1 | Marca & prototipo visual | `mockups/prototipo/` (prototipo navegable) | ▶ asignada |
| Agente 2 | Negocio | `docs/PROYECCIONES_FINANCIERAS.md` | ▶ asignada |

## Entregables ya en el repo
PITCH_DECK ✅ · DOSSIER_DESARROLLO ✅ · PLAN_PILOTO ✅ · IDENTIDAD_VISUAL ✅ · ONE_PAGER ✅ · FAQ_CLINICAS ✅

## Backlog por agente
- **Agente 1 (visual):** prototipo navegable → `mockups/prototipo/clinica.html` → `docs/diseño/moodboard-avatares.md`
- **Agente 2 (negocio):** PROYECCIONES → ANALISIS_COMPETENCIA → RIESGOS_Y_MITIGACIONES → KPIS_NEGOCIO

## Aviso automático (los agentes "avisan" al organizador)
Cuando un agente termina, escribe en su `ESTADO.md` y hace push. El organizador tiene un
**vigía** (proceso en segundo plano) que detecta el cambio en el repositorio remoto y le
avisa para hacer `git pull`, leer el `ESTADO.md` y asignar la siguiente tarea. El usuario ya
no tiene que hacer de puente (aunque puede decir "continua" para acelerar).
