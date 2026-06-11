# Piloto Exprés — testear con pacientes ESTA semana

> Cómo poner el MVP funcional (`mockups/prototipo/app-funcional.html`) en manos de
> 2-3 pacientes reales sin esperar al desarrollo Flutter. Coste: 0 €. Tiempo: 1 tarde.

---

## Qué es (y qué no es)

**Es:** el Core Loop completo funcionando en el navegador del móvil del paciente —
triaje diario, rutina prescrita con vídeos, feedback RPE, XP real que se acumula,
racha por calendario y el Guardián evolucionando por las 30 fases con sus puertas reales.
El progreso se guarda en el propio móvil del paciente (localStorage).

**No es:** la app de las tiendas. No hay login, no hay panel de clínica conectado, los
datos no salen del móvil del paciente. Para el semáforo, el paciente reporta y la app
le muestra "aviso enviado" — el aviso real aún no viaja (se simula).

**Para qué sirve:** validar EN SEMANAS la pregunta más importante del negocio —
*¿el paciente vuelve cada día y completa su rutina?* — antes de gastar un euro en desarrollo.

---

## Paso 1 — Personalizar para tu paciente (5 min)

Abre `mockups/prototipo/app-funcional.html` con cualquier editor de texto y localiza el
bloque `CONFIG` al inicio del `<script>` (está señalizado con un recuadro de comentarios).
Cambia sin miedo — no hay que tocar nada más:

```js
const CONFIG = {
  paciente: 'María',                  // nombre real del paciente
  fisio:    'Javi Vila',              // tú o el profesional
  clinica:  'Tu clínica',             // nombre del centro
  zona:     'cervicales',             // zona de tratamiento
  pack: {
    nombre: 'Pack Cervical',
    ejercicios: [
      {nombre:'...', detalle:'2 series · 10 reps', video:'https://vimeo.com/...'},
      // añade o quita ejercicios — la app se adapta sola
    ]
  },
  packSuave: { ... }                  // la rutina para días de dolor alto (≥8)
};
```

`video` es opcional: si pegas un enlace (Vimeo, YouTube, lo que sea), aparece el botón
**▶ Ver** junto al ejercicio. Guarda una copia del archivo por paciente
(`app-maria.html`, `app-pedro.html`).

## Paso 2 — Hacérselo llegar (10 min, gratis)

Opción A — **GitHub Pages** (recomendada): en el repo, Settings → Pages → rama
`feat/boceto-mvp` → carpeta raíz. El paciente recibe una URL tipo
`https://javivilamarcos17.github.io/Human-Potential/mockups/prototipo/app-funcional.html`
y la abre en su móvil. En iPhone/Android: "Añadir a pantalla de inicio" → icono como
una app más.

Opción B — enviar el archivo HTML por WhatsApp/email (funciona offline, menos cómodo).

## Paso 3 — El experimento (2-3 semanas)

1. Onboarding en persona (igual que el piloto grande): tú le instalas el acceso directo
   y hacéis juntos la primera jornada.
2. El paciente lo usa a diario. Tú NO le recuerdas nada — eso es lo que estamos midiendo.
3. Una vez por semana, pídele un pantallazo de su pantalla de inicio: ahí está su racha,
   sesiones y XP (esa es tu "base de datos" del piloto exprés).

**Qué mirar (las 3 métricas del PLAN_PILOTO en versión manual):**
- ¿Cuántos días seguidos volvió? (racha)
- ¿Completó las rutinas o solo abría la app? (sesiones vs días)
- Pregunta abierta a la semana 2: *"¿qué te hace volver — el Guardián, la rutina o yo?"*

## Limitaciones honestas (para no engañarnos)

- Si el paciente borra los datos del navegador, pierde su progreso (avísale).
- La racha usa la fecha del móvil — el botón "Simular día siguiente" es solo para demos;
  escóndeselo al paciente o pídele que no lo toque.
- Sin panel: el dolor alto NO te llega de verdad. Dile que si marca dolor ≥8 te escriba.
- 2-3 pacientes no validan estadística — validan **comportamiento y enganche**. Para
  números de verdad: el piloto completo con la app real (PLAN_PILOTO.md).

---

*Siguiente nivel: conectar este mismo HTML a Supabase (login + triaje guardado en la
nube + semáforo real) es un paso intermedio barato antes del Flutter completo. Pedirlo
cuando el exprés valide el enganche.*

---

## Conectar a Supabase (datos en tu nube, 15 min, gratis)

1. Crea cuenta en supabase.com → "New project" → **región EU (Frankfurt)** → espera 2 min.
2. En el panel: SQL Editor → pega el contenido de `supabase/migrations/0007_piloto_express.sql` → Run.
3. En Settings → API copia la **URL** y la **anon public key**.
4. Pégalas en el CONFIG de `app-funcional.html`: `supabase: { url:'https://xxxx.supabase.co', anonKey:'eyJ...' }`.
5. Listo: cada alta, jornada diaria, prueba de eclosión y alerta de dolor de TODOS los
   pacientes aparece en Table Editor → `piloto_eventos` (con qué dispositivo, qué centro y cuándo).

Seguridad: la clave pública solo permite ESCRIBIR en ese buzón — nadie puede leer los
datos sin tu acceso de administrador. Si no pegas las claves, todo sigue 100% local.
