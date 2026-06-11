# Biblioteca de microcopy — Anti Frágil

> Este documento es la fuente de verdad para todo el texto de la app.
> Organizado por pantalla del Core Loop. Cada mensaje usa variables de personalización
> entre llaves para que nada sea genérico.
>
> **Principio único de tono:** cálido y profesional, nunca culpa.
> Si un mensaje puede hacer sentir mal a alguien, no es el mensaje correcto.

---

## Variables de personalización

| Variable | Descripción | Ejemplo canónico |
|----------|-------------|-----------------|
| `{nombre}` | Nombre del paciente | Javi |
| `{fisio}` | Fisioterapeuta (con título) | Dra. Elena Ruiz |
| `{clinica}` | Nombre de la clínica | MovePlus |
| `{racha}` | Días consecutivos activos | 24 |
| `{arquetipo}` | Arquetipo del paciente | Agua |
| `{avatar_nombre}` | Nombre del Guardián | Kael el Fluido |
| `{nivel}` | Nivel actual del avatar | 50 |
| `{nombre_fase}` | Nombre de la fase actual | Guardián Pleno |
| `{xp}` | XP ganada en la acción | 120 |
| `{xp_bono}` | XP extra por bono de racha | 30 |
| `{score_anterior}` | Puntuación de Auditoría anterior | 58 |
| `{score_hoy}` | Puntuación de Auditoría actual | 67 |
| `{diferencia_score}` | Diferencia entre Auditorías | +9 |
| `{dolor_ayer}` | Puntuación de dolor del triaje previo | 4 |
| `{zona_tratamiento}` | Zona corporal de tratamiento | zona lumbar |
| `{num_ejercicios}` | Ejercicios en la rutina | 5 |
| `{duracion_estimada}` | Duración estimada (min) | 20 |
| `{duracion_real}` | Duración real tras completarla (min) | 18 |
| `{nota_fisio}` | Nota del fisio para un ejercicio | "Mantén las rodillas alineadas" |
| `{codigo}` | Código de honor del paciente | 8823 |
| `{semanas}` | Semanas desde la Auditoría anterior | 6 |

---

## 1. Onboarding

### 1.1 Bienvenida (primera apertura)

| Elemento | Texto |
|----------|-------|
| Título | Hola, {nombre}. |
| Subtítulo | {clinica} te ha preparado algo especial. |
| Cuerpo | Tu fisioterapeuta, {fisio}, ha diseñado un programa pensado para ti. Aquí vas a entrenar. Pero sobre todo, vas a notar la diferencia. |
| CTA principal | Empezar |

---

### 1.2 Presentación del código de honor

| Elemento | Texto |
|----------|-------|
| Título | Este es tu código. |
| Valor | AF-{codigo} |
| Cuerpo | Con él, {fisio} puede ver tu progreso y ajustar tu programa cuando lo necesites. |
| CTA | Entendido |

---

### 1.3 Introducción a la Primera Auditoría

| Elemento | Texto |
|----------|-------|
| Título | Antes de empezar, vamos a conocerte. |
| Cuerpo | Vamos a hacer tu primera Auditoría: un test breve para entender cómo está tu cuerpo hoy. Con esos datos, nacerá tu Guardián. |
| Aviso | Solo tarda unos minutos. No hay respuestas correctas ni incorrectas. |
| CTA | Comenzar la Auditoría |

---

## 2. Auditoría

### 2.1 Encabezado de bloque

*Cada bloque tiene su propia intro. Variables: {nombre_bloque}, {bloque_actual}, {total_bloques}.*

| Elemento | Texto |
|----------|-------|
| Título | {nombre_bloque} |
| Cuerpo | Evalúa cómo está tu cuerpo en esta área hoy. Sé honesto: cuanto más fiel sea el retrato, mejor será tu programa. |
| Progreso | Bloque {bloque_actual} de {total_bloques} |

---

### 2.2 Pregunta con slider

| Elemento | Texto |
|----------|-------|
| Pregunta | ¿Cuánto te molesta esta zona hoy? |
| Extremo izquierdo (0) | Sin molestia |
| Extremo derecho (10) | Molestia máxima |
| Aviso si puntuación ≥ 7 | Anotamos esto. {fisio} lo verá. |

---

### 2.3 Cierre de la primera Auditoría

| Elemento | Texto |
|----------|-------|
| Título | Auditoría completada. |
| Cuerpo | {nombre}, tienes un perfil único. A partir de aquí, cada cosa en esta app está pensada para ti. |
| Puntuación | Tu puntuación inicial: {score_hoy} |
| CTA | Ver mi Guardián |

---

### 2.4 Re-Auditoría — introducción

| Elemento | Texto |
|----------|-------|
| Título | Han pasado {semanas} semanas. Es hora de ver cómo has evolucionado. |
| Cuerpo | Cuando hagas este test, podremos mostrarte exactamente cuánto ha mejorado tu cuerpo desde que empezaste. |
| CTA | Hacer la Auditoría |

---

### 2.5 Re-Auditoría — cierre con mejora

| Elemento | Texto |
|----------|-------|
| Título | {nombre}, esto es lo que has conseguido. |
| Cuerpo | Hace {semanas} semanas: {score_anterior}. Hoy: {score_hoy}. Una mejora de {diferencia_score} puntos en vitalidad. |
| Aviso | Tu avatar ha evolucionado. {fisio} ya puede ver estos resultados. |
| CTA | Ver mi progreso |

*Ejemplo canónico: "Hace 6 semanas: 58. Hoy: 67. Una mejora de +9 puntos en vitalidad."*

---

### 2.6 Re-Auditoría — cierre sin mejora o estable

| Elemento | Texto |
|----------|-------|
| Título | Los resultados son honestos. |
| Cuerpo | Tu puntuación se mantiene en {score_hoy}. Eso también es información valiosa: {fisio} puede ajustar tu programa a partir de aquí. |
| Aviso | El cuerpo tiene sus tiempos. Lo importante es seguir. |
| CTA | Ver mi progreso |

---

## 3. Sombrero (nacimiento del Guardián)

*Pantalla de revelación del arquetipo y el avatar. Momento emocional clave del onboarding.*

### 3.1 Animación de generación

| Elemento | Texto |
|----------|-------|
| Título | Analizando tu perfil... |
| Subtítulo | Tu Guardián está tomando forma. |

---

### 3.2 Revelación del arquetipo

| Elemento | Texto |
|----------|-------|
| Título | {nombre}, tu Guardián ha nacido. |
| Intro | De tu Auditoría de hoy ha emergido algo propio de ti. Tu esencia es la del **{arquetipo}**. |

**Variantes por arquetipo:**

| Arquetipo | Cuerpo |
|-----------|--------|
| **Agua** | Eres del Agua. Fluidez, movilidad y adaptación: estas son tus fortalezas. Tu Guardián se llama **Kael, el Fluido**. |
| **Tierra** | Eres de la Tierra. Estabilidad, constancia y solidez: estas son tus fortalezas. Tu Guardián se llama **[Guardián Tierra — nombre PENDIENTE de aprobación del dueño]**. |
| **Viento** | Eres del Viento. Agilidad, coordinación y precisión: estas son tus fortalezas. Tu Guardián se llama **[Guardián Viento — nombre PENDIENTE de aprobación del dueño]**. |

| Elemento | Texto |
|----------|-------|
| CTA | Conocer a {avatar_nombre} |

---

### 3.3 Presentación del Guardián

| Elemento | Texto |
|----------|-------|
| Título | Este es {avatar_nombre}. |
| Cuerpo | Cada día que cuides tu cuerpo, él evoluciona contigo. Es la prueba visual de todo lo que estás construyendo. |
| Estado inicial | Fase 1 · Huevo. El viaje acaba de empezar. |
| CTA | Ir a mi tablero |

---

## 4. Dashboard

*Pantalla principal. Se ve cada día. Debe sentirse personal, vivo y motivador.*

### 4.1 Saludo del día

**Sin triaje hecho (primera visita del día):**

| Racha | Título | Subtítulo |
|-------|--------|-----------|
| ≥ 1 día | Buenos días, {nombre}. | Llevas {racha} días cuidándote. Hoy es el {racha+1}. |
| 0 (vuelta tras pausa) | Hola de nuevo, {nombre}. | {avatar_nombre} se alegra de verte. Hoy empezamos de nuevo. |

*Nunca mencionar el tiempo perdido. Cero reproche.*

---

### 4.2 Mensajes de racha por tramos

| Tramo | Mensaje |
|-------|---------|
| 1–3 días | *"{nombre}, el primer paso es el más importante. Ya lo has dado."* |
| 4–6 días | *"Tres días seguidos. Tu cuerpo ya empieza a notar la diferencia."* |
| 7 días | *"Una semana completa. {fisio} va a ver un progreso real."* |
| 14 días | *"Dos semanas sin parar. Esto ya es un hábito, {nombre}."* |
| 21 días | *"21 días. Lo que empezó como una obligación ya forma parte de ti."* |
| 30 días | *"Un mes. {nombre}, esto es extraordinario. {clinica} lo sabe."* |
| > 30 días | *"{racha} días seguidos, {nombre}. Tu {zona_tratamiento} lo nota. {avatar_nombre} también."* |

*Ejemplo canónico (racha 24, zona lumbar): "24 días seguidos, Javi. Tu zona lumbar lo nota. Kael también."*

---

### 4.3 Estado del avatar según triaje

| Estado del triaje | Texto del avatar |
|-------------------|-----------------|
| Sin triaje hecho | *(Avatar neutral, durmiendo)* — pequeño indicador: *"¿Cómo estás hoy?"* |
| Dolor 0–3, energía buena | *"Buen estado hoy, {nombre}. Aprovéchalo."* |
| Dolor 4–6 | *"Estás notando algo. Hoy iremos con calma."* |
| Dolor 7–10 | *"Hoy el cuerpo pide respeto. {fisio} ya lo sabe."* |

---

### 4.4 CTA principal del día

| Estado | Botón | Mensaje secundario |
|--------|-------|--------------------|
| Rutina pendiente | Hacer mi rutina de hoy | — |
| Rutina completada | *(inactivo)* Rutina completada | *"Bien hecho, {nombre}. {avatar_nombre} ha ganado {xp} XP."* |

---

### 4.5 Bloque de progreso (nivel y fase)

| Elemento | Texto |
|----------|-------|
| Etiqueta | Tu nivel |
| Valor | Nivel {nivel} · {nombre_fase} |
| Barra | {xp_actual} / {xp_siguiente} XP |
| Mensaje (< 30% del siguiente nivel) | *"Sigues creciendo."* |
| Mensaje (> 80% del siguiente nivel) | *"Casi en el siguiente nivel."* |

---

## 5. Triaje

*Check-in diario. Debe completarse en menos de 1 minuto. Es un cuidado, no un formulario.*

### 5.1 Apertura

| Elemento | Texto |
|----------|-------|
| Título | ¿Cómo está tu cuerpo hoy, {nombre}? |
| Subtítulo | Tómate un momento. Esto es para ti. |

---

### 5.2 Pregunta de dolor

| Elemento | Texto |
|----------|-------|
| Pregunta (genérica) | ¿Cómo está tu zona de tratamiento hoy? |
| Pregunta (con datos) | ¿Cómo está tu {zona_tratamiento} hoy? |
| Referencia al día anterior | *"Ayer lo dejaste en {dolor_ayer}. ¿Cómo amanece hoy?"* |
| Extremo 0 | Sin molestia |
| Extremo 10 | Muy molesta |
| Aviso si puntuación ≥ 7 | *"Anotamos esto. {fisio} recibirá una alerta."* |

---

### 5.3 Pregunta de energía

| Elemento | Texto |
|----------|-------|
| Pregunta | ¿Cómo tienes la energía? |
| Opción A | Lleno de energía |
| Opción B | Bien, como siempre |
| Opción C | Un poco cansado |
| Opción D | Muy cansado |

---

### 5.4 Pregunta de sueño (configurable por clínica)

| Elemento | Texto |
|----------|-------|
| Pregunta | ¿Cómo dormiste anoche? |
| Opción A | Muy bien |
| Opción B | Bien |
| Opción C | Regular |
| Opción D | Mal |

---

### 5.5 Cierre del triaje

**Variante: todo bien (dolor 0–3):**

| Elemento | Texto |
|----------|-------|
| Título | Perfecto, {nombre}. |
| Cuerpo | Tu programa de hoy está listo. {fisio} ha preparado algo especial para este momento. |
| CTA | Ver mi rutina |

**Variante: dolor moderado (4–6):**

| Elemento | Texto |
|----------|-------|
| Título | Gracias por ser honesto, {nombre}. |
| Cuerpo | Vamos a adaptar la rutina de hoy para que te sientas mejor, no peor. |
| CTA | Ver mi rutina adaptada |

**Variante: dolor alto (7–10):**

| Elemento | Texto |
|----------|-------|
| Título | El cuerpo habla, y nosotros escuchamos. |
| Cuerpo | Hoy no es día de forzar. {fisio} ya tiene tu alerta. La rutina de hoy es suave y pensada para que te recuperes. |
| Aviso | {fisio} puede contactarte si lo considera necesario. |
| CTA | Ver la rutina de recuperación |

---

## 6. Rutina

### 6.1 Presentación de la rutina del día

| Elemento | Texto |
|----------|-------|
| Título | Tu rutina de hoy, {nombre}. |
| Subtítulo | Prescrita por {fisio} · {clinica} |
| Metadatos | {num_ejercicios} ejercicios · aprox. {duracion_estimada} min |
| CTA | Empezar |

---

### 6.2 Encabezado de cada ejercicio

| Elemento | Texto |
|----------|-------|
| Nombre | {nombre_ejercicio} |
| Parámetros | {series}×{repeticiones} |
| Descripción | {descripcion_breve} |
| Nota del fisio (si existe) | Nota de {fisio}: *"{nota_fisio}"* |

---

### 6.3 Mensajes durante la rutina

| Momento | Texto |
|---------|-------|
| Descanso entre series | *"Respira. Tu cuerpo lo está haciendo bien."* |
| Último ejercicio | *"Último ejercicio. {nombre}, lo estás haciendo genial."* |

---

### 6.4 Rutina adaptada (dolor moderado)

| Elemento | Texto |
|----------|-------|
| Aviso | Hoy tu rutina es la versión adaptada. Mismos beneficios, menor intensidad. |
| Subtítulo | Adaptada por {fisio} para días como hoy. |

---

### 6.5 Rutina de recuperación (dolor alto)

| Elemento | Texto |
|----------|-------|
| Título | Rutina de recuperación para hoy. |
| Cuerpo | Movilidad suave y descanso activo. No pierdes el día: lo inviertes en recuperarte bien. |
| Subtítulo | Preparada por {fisio} · {clinica} |

---

### 6.6 Finalización de la rutina

| Elemento | Texto |
|----------|-------|
| Título | Rutina completada, {nombre}. |
| Cuerpo | {num_ejercicios} ejercicios. {duracion_real} minutos. Un día más. |
| CTA | Dar mi feedback |

---

## 7. Feedback (RPE)

*Cierra el círculo clínico. El usuario sabe que su fisio verá esto.*

### 7.1 Pregunta de esfuerzo percibido

| Elemento | Texto |
|----------|-------|
| Título | ¿Cómo fue la rutina de hoy? |
| Subtítulo | Del 1 al 10, ¿cuánto esfuerzo sentiste? |
| Extremo 1 | Demasiado fácil |
| Extremo 10 | Al límite |
| Zona óptima (5–7) | *(indicador visual)* Bien exigida |

---

### 7.2 Nota libre

| Elemento | Texto |
|----------|-------|
| Placeholder | ¿Algo que {fisio} deba saber? (opcional) |

---

### 7.3 Cierre del feedback

| Elemento | Texto |
|----------|-------|
| Título | Gracias, {nombre}. |
| Cuerpo | {fisio} verá esto y ajustará si hace falta. Tu programa nunca es fijo: evoluciona contigo. |
| CTA | Ver mi progreso |

---

## 8. Recompensa

*Los momentos de recompensa son los más emocionales. Proporcionales al hito.*

### 8.1 XP al finalizar el día

| Elemento | Texto |
|----------|-------|
| Título | +{xp} XP para {avatar_nombre} |
| Subtítulo | Por completar tu rutina de hoy. |
| Bono de racha (si aplica) | +{xp_bono} XP extra por tu racha de {racha} días. |

---

### 8.2 Subida de nivel (celebración pequeña)

| Elemento | Texto |
|----------|-------|
| Título | ¡Nuevo nivel! |
| Cuerpo | {nombre}, ahora eres Nivel {nivel}. {avatar_nombre} está creciendo contigo. |
| CTA | Continuar |

---

### 8.3 Subida de fase (celebración grande — pantalla completa)

| Elemento | Texto |
|----------|-------|
| Título | {avatar_nombre} ha evolucionado. |
| Subtítulo | {nombre_fase_anterior} → {nombre_fase_nueva} |
| Cuerpo | {nombre}, lo que estás construyendo es real. Cada día ha contado para llegar aquí. {fisio} puede ver este hito. |
| CTA | Ver mi nuevo Guardián |

*Ejemplo canónico: "Kael ha evolucionado. Forma Incipiente → Guardián Despierto. Javi, lo que estás construyendo es real."*

---

### 8.4 Hitos de racha

| Racha | Título | Cuerpo |
|-------|--------|--------|
| 7 días | Una semana sin parar. | *"{nombre}, 7 días seguidos. Tu cuerpo ya está respondiendo. Esto es solo el principio."* |
| 14 días | Dos semanas de constancia. | *"{nombre}, dos semanas. {avatar_nombre} lo nota. {fisio} también."* |
| 30 días | Un mes. Extraordinario. | *"{nombre}, 30 días de constancia. En {clinica} lo saben. Tu cuerpo lo nota. {avatar_nombre} ha alcanzado un nuevo poder."* |

---

### 8.5 Volver tras una pausa (racha = 0)

*Cero reproche. Tono de bienvenida.*

| Elemento | Texto |
|----------|-------|
| Título | {avatar_nombre} se alegra de verte. |
| Cuerpo | *"{nombre}, hoy es el día 1 de una nueva racha. El brillo de {avatar_nombre} vuelve contigo."* |
| CTA | Empezar de nuevo |

---

### 8.6 Tarjetas Épicas (compartibles)

*Se generan al alcanzar hitos. Llevan nombre del paciente, nivel, frase y avatar.*

| Arquetipo | Hito | Frase |
|-----------|------|-------|
| Agua | 7 días | *"7 días de fluidez. El agua siempre encuentra su camino."* |
| Agua | 30 días | *"30 días de movimiento. Nada me detiene."* |
| Agua | Fase 10 | *"El Agua toma su forma. Yo también."* |
| Agua | Fase 16 | *"Guardián Pleno. Kael y yo hemos llegado juntos."* |
| Tierra | 7 días | *"7 días firme. La constancia construye montañas."* |
| Tierra | 30 días | *"30 días de tierra. Sólido como siempre."* |
| Viento | 7 días | *"7 días en movimiento. Ligero y preciso."* |
| Viento | 30 días | *"30 días sin parar. El viento nunca descansa."* |

> 🔮 **VISIÓN NORTE (Fase 2/3 — NO usar en MVP):** las frases de Fuego (Ignis el Incandescente) están en `copy-tarjetas-epicas.md` § Visión Norte.

**Pie de tarjeta (todas):** Prescrito por {fisio} · {clinica} · Anti Frágil

---

## Checklist de calidad por mensaje

Antes de implementar cualquier texto de esta biblioteca, verificar:

- [ ] ¿Lleva el nombre del paciente o del fisio donde tiene sentido?
- [ ] ¿El tono es cálido y nunca culpabilizante?
- [ ] ¿El profesional está presente (mencionado o implícito)?
- [ ] ¿Puede leerse y que el usuario sienta *"esto está escrito para mí"*?
- [ ] ¿Es coherente con la persona canónica (Javi · MovePlus · Dra. Elena Ruiz · Kael)?

> Si falla alguno: reescribir antes de entregar.
