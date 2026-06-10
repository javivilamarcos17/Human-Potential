# 🗂️ Sala de Coordinación — Anti Frágil

> Sistema para trabajar con varios "agentes" (chats de Claude) en paralelo sin pisarse.
> El **organizador** (chat principal) reparte tareas; cada **agente** ejecuta y confirma.

## Cómo funciona

- Cada agente tiene su carpeta: `coordinacion/agente-1/`, `coordinacion/agente-2/`…
- Dentro hay dos archivos:
  - **`TAREAS.md`** → lo escribe SOLO el organizador. El agente solo lo LEE. Es su cola.
  - **`ESTADO.md`** → lo escribe SOLO el agente. El organizador solo lo LEE. Sus confirmaciones.
- **`TABLERO.md`** (esta carpeta) → la vista global que mantiene el organizador.

## Reglas de oro (anti-choque)

1. Cada agente **solo crea sus archivos nuevos asignados** + escribe en su propio `ESTADO.md`.
2. **Nadie edita archivos compartidos** (CHANGELOG, índices…) salvo el organizador.
3. Todos en la rama `feat/boceto-mvp`. Antes de guardar: `git pull --rebase`, luego push.
4. Propiedad separada de archivos = cero conflictos: TAREAS (organizador) ≠ ESTADO (agente).

## Ciclo de trabajo

```
Organizador escribe TAREAS.md  →  Agente hace la tarea  →  Agente confirma en ESTADO.md + push
        ▲                                                                 │
        └──────────  Organizador hace git pull, lee ESTADO, asigna la siguiente  ◄──┘
```

El usuario solo dice al agente "**lee tu carpeta y haz la siguiente**" cuando el organizador
haya dejado nueva tarea.
