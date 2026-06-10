# Cola de tareas — Agente 1 · TRACK MARCA & PROTOTIPO VISUAL

> Lo escribe SOLO el organizador. Tú (agente) solo LEES esto y haces la tarea ▶ EN CURSO.
> Al terminar, confirma en `ESTADO.md`, push, y dime "listo agente-1". No edites este archivo.
> ⚠️ GITHUB = javivilamarcos17, SIEMPRE. NO PREGUNTES NUNCA POR LA CUENTA.
> PRIORIDAD #1 DEL MVP: experiencia de usuario, calidad, practicidad, modernidad y estética.
> Lee `docs/diseño/experiencia-usuario.md` y pasa su checklist antes de confirmar cualquier pantalla.
>
> 🎨 **LISTÓN VISUAL OBLIGATORIO (feedback del dueño: "la visual es muy pobre"):** abre
> `mockups/prototipo/board-premium.html` — esa es la calidad mínima exigida a partir de ahora.
> Nada de emojis como avatar principal (usa SVG dibujado), fondo vivo (aurora/gradientes
> animados), cristal esmerilado (backdrop-filter), microanimaciones (flotar, brillo, pulso),
> tipografía Nunito/Inter. Si una pantalla tuya no está a esa altura, no la confirmes: súbela.

## ▶ EN CURSO
- **Crea `mockups/prototipo/clinica.html`** — el panel del fisio, navegable y con la misma
  calidad estética que `index.html` (es la otra mitad del producto: lo que ve la clínica).
  Pantallas/secciones a incluir (clicables entre sí):
  1. **Pacientes con semáforos**: lista ordenada (🔴 arriba) — usa varios pacientes ficticios
     y entre ellos a **Javi (verde, racha 24)**; un rojo con "dolor 8/10 hoy" y un ámbar
     "4 días sin actividad". Cada fila → abre la ficha.
  2. **Ficha del paciente (Javi)**: Auditoría 62/100 con sus 4 bloques, gráfico simple de
     tendencia del dolor (7→3, los datos de demo), última sesión con RPE, avatar Kael fase 16,
     y botones (ajustar Pack / mensaje) con overlay "Próximamente".
  3. Detalle visual: cabecera con **Dra. Elena Ruiz · MovePlus**.
  - Persona canónica SIEMPRE (ver `docs/REVISION_CRITICA.md`). Contexto: `docs/diseño/panel-clinica.md`.
  - Archivo standalone: NO toques `index.html`.

## ⬜ COLA (en orden; no empieces hasta que pase a EN CURSO)
1. **`docs/diseño/moodboard-avatares.md`** — guía de estilo para el ilustrador.
   🎯 **DIRECCIÓN DE ARTE DEL DUEÑO:** estética tipo **"Pokémon moderno"** — NO Pokémon
   literales, sino esa idea: criaturas adorables y coleccionables con evoluciones claras y
   emocionantes, acabado moderno y limpio (no retro pixelado). Muchas fases (nuestras 30 en
   6 etapas mayores) para que el usuario participe y mejore durante mucho tiempo.
   Detalla: las 6 etapas mayores × 3 arquetipos (Tierra/Agua/Viento), paleta por arquetipo
   (de IDENTIDAD_VISUAL), sensación de cada etapa, y qué cambia visualmente entre sub-fases
   (brillo/grietas/accesorios — baratas de producir). Referencia de calidad: el SVG de Kael en
   `board-premium.html`. Contexto: `avatar-evolucion.md`.
2. **`mockups/prototipo/evolucion.html`** — galería visual de la evolución: las 6 etapas
   mayores del arquetipo Agua con sus sub-fases (placeholders), el "momento evolución"
   (celebración) y la pantalla de re-Auditoría "wow" (62→67, +5 vitalidad). Misma estética.

## ✅ Hecho: PITCH_DECK · IDENTIDAD_VISUAL · ONE_PAGER · prototipo index.html + pulido C3-C6

## Reglas
- Solo creas archivos NUEVOS de tu tarea + tu `ESTADO.md`. No toques CHANGELOG ni archivos de otros.
- Rama `feat/boceto-mvp`. Antes de push: `git pull --rebase`. Cuenta javivilamarcos17 (no preguntar).
