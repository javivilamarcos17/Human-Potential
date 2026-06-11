# Guion de Demo para Clínicas — Anti Frágil

> Paso a paso para presentar Anti Frágil a un profesional en 20-30 minutos.
> Usa el prototipo navegable en `mockups/demo.html`. No es un discurso: es una
> conversación guiada donde el fisio habla más que tú.

---

## Antes de empezar

**Preparación (5 min antes):**
- Abre `mockups/demo.html` en el navegador y comprueba que carga bien.
- Ten preparado el nombre de la clínica y del profesional para personalizar.
- Silencia el móvil. No hay nada que vender — hay algo que mostrar.

**Mentalidad:**
El objetivo de la demo no es impresionar. Es que el profesional diga "esto resuelve un
problema que yo tengo". Si no conectas su problema con lo que muestras, la demo fracasa
aunque el producto sea bueno.

---

## PARTE 1 — Abre con su problema (5-7 min)

> No abras el prototipo todavía. Habla primero.

**Pregunta de apertura (elige una según el contexto):**
- "Antes de enseñarte nada — ¿cuántos pacientes empiezas que desaparecen cuando mejoran un poco?"
- "¿Cómo te enteras de que un paciente ha tenido una recaída? ¿Te llama él, o lo descubres cuando vuelve?"
- "¿Cuánto tiempo pasas a la semana intentando saber cómo están tus pacientes entre sesiones?"

**Escucha activamente.** No interrumpas. Toma nota mental de sus palabras exactas — las usarás
en la parte 2 para conectar el producto con su realidad.

**Señales de que puedes avanzar:**
- El fisio ha descrito un problema concreto (abandono, falta de seguimiento, recaídas).
- Ha usado palabras como "no sé qué hacen en casa", "cuando vuelven ya están peor", "se olvidan".

**Si no emerge ningún problema:** pregunta directamente: "¿Tienes alguna forma de saber si
tus pacientes están haciendo los ejercicios que les mandas?" La respuesta casi siempre abre la conversación.

---

## PARTE 2 — Panel de la clínica (8-10 min)

> Abre `mockups/demo.html` y navega por el panel del profesional.

### 2.1 El panel de semáforos

**Qué mostrar:** la vista de semáforos con 2-3 pacientes ficticios, uno en rojo.

**Qué decir:**
> "Imagina que abres esto por la mañana y ves a [nombre ficticio] en rojo. Ha reportado
> un dolor de 8 dos días seguidos. ¿Qué harías con eso?"

*Deja que responda. No contestes tú.*

**Por qué funciona:** el fisio visualiza una acción concreta que puede tomar. El semáforo
no es una funcionalidad — es la respuesta a "¿cómo me entero antes de que el paciente me llame?"

### 2.2 La ficha del paciente

**Qué mostrar:** histórico de triajes (dolor y energía a lo largo del tiempo), feedback RPE,
sesiones completadas.

**Qué decir:**
> "Esto es lo que el paciente te manda sin tener que escribirte. Cada vez que hace el triaje
> —30 segundos, dos deslizadores— esto se actualiza. Tú lo ves cuando quieras."

### 2.3 Prescripción de una rutina

**Qué mostrar:** crear un Pack y asignárselo a un paciente.

**Qué decir:**
> "Tú creas los packs con tus vídeos — los que ya tienes grabados sirven. El paciente
> solo ve lo que tú le prescribes. No hay contenido genérico de internet."

**Pregunta de comprobación:** "¿Tienes ya vídeos grabados de los ejercicios que más mandas?"
*(Si dice que sí: "Perfecto, eso es todo lo que necesitas para empezar.")*
*(Si dice que no: "Se pueden grabar con el móvil. Te ayudamos.")*

---

## PARTE 3 — App del paciente (5-7 min)

> Navega a la vista del paciente en `mockups/demo.html`.

### 3.1 El triaje diario

**Qué mostrar:** la pantalla de triaje (dolor 1-10, energía 1-10).

**Qué decir:**
> "Esto es lo primero que ve el paciente al abrir la app. Treinta segundos. Dos deslizadores.
> Si el dolor sube a 7 o más, tú recibes la alerta de semáforo que acabamos de ver."

### 3.2 El Guardián (el avatar)

**Qué mostrar:** el dashboard con el avatar, la barra de XP y la racha.

**Qué decir:**
> "Este es el Guardián del paciente. No sube por abrir la app — sube por completar las
> rutinas que tú le prescribes. Es literalmente el espejo de su constancia."

*Pausa. Deja que lo observe.*

> "La gracia es que el paciente no quiere que su Guardián muera. Lo ha construido con
> semanas de esfuerzo. Eso es lo que le hace volver aunque no tenga dolor."

### 3.3 Una Tarjeta Épica (opcional si hay tiempo)

**Qué mostrar:** la pantalla de Tarjeta Épica compartible.

**Qué decir:**
> "Cuando el paciente sube de fase, genera esto y lo comparte en Instagram. El nombre de
> tu clínica va ahí. Es publicidad gratuita con credibilidad real."

---

## PARTE 4 — El cierre (3-5 min)

> No presiones. El objetivo es conseguir el "sí al piloto", no firmar nada hoy.

**Pregunta de cierre:**
> "¿Ves cómo esto encaja con lo que me contabas al principio sobre [usa sus palabras exactas]?"

*Escucha. Si la respuesta es positiva, avanza:*

> "Lo que te propongo es probarlo durante 10 semanas con 20-30 de tus pacientes, sin coste.
> Al final, si ves que funciona, hablamos de continuar. ¿Cuándo podríamos empezar?"

---

## Cierres según reacción del profesional

### "Me interesa, ¿cuándo empezamos?"
→ Concretar fecha de la sesión de onboarding (máximo 2 semanas).
→ Pedir lista de 20-30 pacientes candidatos.
→ Confirmar que tiene vídeos o disponibilidad para grabarlos.

### "Me interesa pero necesito pensarlo"
→ No presionar. Dejar espacio.
→ "¿Qué necesitarías ver para sentirte seguro/a?" — escucha la objeción real.
→ Enviar un resumen por WhatsApp esa misma tarde (no un PDF largo — 3 líneas + enlace al mockup).
→ Seguimiento en 5-7 días.

### "¿Qué pasa con la privacidad de mis pacientes?"
→ "Los datos de tus pacientes son solo tuyos — ninguna otra clínica los ve. Antes de
   empezar firmamos un acuerdo de protección de datos."
→ Ver detalles en [`PRIVACIDAD_RGPD.md`](PRIVACIDAD_RGPD.md).

### "Mis pacientes no saben usar apps"
→ "El onboarding lo hacemos tú y yo con el paciente delante, en consulta. Cinco minutos
   y ya está configurado. Para los menos digitales, ese momento es todo lo que necesitan."

### "No tenemos tiempo para grabar vídeos"
→ "Para empezar necesitas 10 vídeos. Con 2 horas de grabación con el móvil tienes suficiente.
   Te mandamos una guía de cómo hacerlo. Y puedes ir añadiendo más poco a poco."

### "¿Cuánto cuesta?"
→ "El piloto es gratis. Si al final del piloto ves que funciona, hablamos de 150-250 €/mes
   según el tamaño de la clínica. Si no ves el valor, no hay nada que pagar."
→ Ver [`MODELO_PRECIOS.md`](MODELO_PRECIOS.md) y [`FAQ_CLINICAS.md`](FAQ_CLINICAS.md).

### "Ya usamos otro software de gestión"
→ "Anti Frágil no sustituye tu software de gestión de citas — lo complementa. Uno gestiona
   tu agenda; este hace que los pacientes hagan sus ejercicios en casa y vuelvan."

---

## Lo que NO hacer en la demo

- No leer el guion — es una referencia, no un script.
- No hablar más de 3 minutos seguidos sin hacer una pregunta.
- No mostrar más pantallas de las indicadas — menos es más.
- No mencionar precio hasta que el fisio lo pregunte o hasta el cierre.
- No hacer promesas sobre funcionalidades que no están en el MVP.

---

*Documentos relacionados: [`FAQ_CLINICAS.md`](FAQ_CLINICAS.md),
[`PLAN_GO_TO_MARKET.md`](PLAN_GO_TO_MARKET.md), [`MODELO_PRECIOS.md`](MODELO_PRECIOS.md).*
