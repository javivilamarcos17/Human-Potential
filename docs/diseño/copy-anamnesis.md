# Copy de la anamnesis — Anti Frágil

> El cuestionario inicial antes de los micro-tests. Es la primera vez que el paciente
> habla con la app sobre sí mismo. El tono debe sentirse como una conversación, no como
> un formulario médico.
>
> **Regla de oro:** si la pregunta parece una consulta médica, está mal escrita.
> Ningún paciente debería necesitar diccionario para responder.
>
> Las **banderas rojas** (preguntas de salud) no afectan a la puntuación final —
> solo avisan a la clínica. Hay que dejar claro que ser honesto ayuda, no penaliza.

---

## Introducción a la anamnesis

*Pantalla inicial antes de empezar las preguntas.*

```
Título:  Antes de los tests, cuéntanos un poco sobre ti.
Cuerpo:  Son unas pocas preguntas. Con tus respuestas, {clinica} y {fisio}
         podrán adaptar tu programa desde el primer día.
Aviso:   Tus respuestas son confidenciales y solo las ve {fisio}.
CTA:     Empezar
```

---

## Bloque 1 — Sobre ti y tu objetivo

*Recoge datos básicos y la meta del paciente. Tono: curioso y amable.*

---

**Pregunta 1.1 — Edad**

```
Pregunta: ¿Cuántos años tienes?
Tipo:     Campo numérico (teclado numérico)
Placeholder: Tu edad
```

---

**Pregunta 1.2 — Sexo biológico** *(opcional — para adaptar referencias de valores)*

```
Pregunta: ¿Con qué sexo biológico te identificas?
Aviso:    (Opcional. Solo lo usamos para ajustar los valores de referencia de los tests.)
Opciones:
  - Hombre
  - Mujer
  - Prefiero no decirlo
```

---

**Pregunta 1.3 — Objetivo principal**

```
Pregunta: ¿Qué quieres conseguir con tu programa?
Aviso:    Elige la que más se acerque. Podrás detallarla con {fisio}.
Opciones:
  - Quitar o reducir el dolor
  - Ganar fuerza y sentirme más capaz
  - Moverme mejor y con más soltura
  - Mantener lo que tengo y no perderlo
  - Volver a entrenar tras una lesión o pausa
```

---

## Bloque 2 — Tu salud (banderas rojas)

*Estas preguntas NO puntúan. Solo sirven para que {fisio} esté al tanto desde el primer día.*

*Texto introductorio del bloque:*

```
Título:  Ahora unas preguntas sobre tu cuerpo.
Cuerpo:  Son rápidas y no hay respuestas buenas ni malas.
         Ser honesto aquí ayuda a {fisio} a cuidarte mejor.
```

---

**Pregunta 2.1 — Dolor o molestia activa**

```
Pregunta: ¿Tienes algún dolor o molestia en este momento?
Opciones:
  - No, me encuentro bien
  - Sí, algo leve que no me limita
  - Sí, algo que me limita en el día a día

[Si responde "Sí, algo leve" o "Sí, algo que me limita" → mostrar pregunta 2.1b]
```

**Pregunta 2.1b — Zona del dolor** *(condicional)*

```
Pregunta: ¿En qué zona lo notas principalmente?
Opciones:
  - Espalda baja o lumbar
  - Espalda alta o cervical
  - Rodilla o cadera
  - Hombro o brazo
  - Otra zona
```

**Mensaje de bandera roja (dolor que limita):**

```
Texto:   Anotado. {fisio} lo tendrá en cuenta para preparar tu programa.
         Si es algo que te preocupa, {clinica} puede revisarlo contigo antes de empezar.
Tono:    Tranquilizador. No alarmista. Seguimos con el cuestionario.
```

---

**Pregunta 2.2 — Operaciones o restricciones médicas**

```
Pregunta: ¿Algún médico te ha operado o te ha indicado que no hagas
          algún tipo de ejercicio?
Opciones:
  - No
  - Sí, me han operado hace menos de un año
  - Sí, tengo indicación de no hacer algún ejercicio concreto
  - Sí, las dos cosas
```

**Mensaje de bandera roja (operación reciente o restricción):**

```
Texto:   Entendido. Avisaremos a {fisio} para que lo revise contigo
         antes de asignarte los ejercicios. Tu programa se adaptará a esto.
Tono:    Claro y tranquilizador. El paciente sabe que hay seguimiento real.
```

---

**Pregunta 2.3 — Dolor de espalda frecuente** *(alimenta arquetipo Agua)*

```
Pregunta: ¿Sufres de dolor de espalda con frecuencia?
Opciones:
  - Rara vez o nunca
  - A veces, pero no me limita
  - Sí, con bastante frecuencia
  - Sí, es algo que me preocupa
```

*Esta pregunta no genera mensaje de bandera roja salvo que se combine con 2.1 (dolor que limita).
Alimenta el arquetipo internamente — no explicar al usuario.*

---

## Bloque 3 — Tu estilo de vida

*Alimenta el bloque de Constancia (0–20) y el arquetipo. Tono: curioso, sin juzgar.*

*Texto introductorio del bloque:*

```
Título:  Ya casi terminamos. Ahora cuéntanos cómo es tu día a día.
```

---

**Pregunta 3.1 — Actividad física actual**

```
Pregunta: ¿Cuántos días a la semana te mueves o haces ejercicio ahora mismo?
Opciones:
  - Casi ninguno (0–1 días)
  - Un poco (2–3 días)
  - Bastante (4–5 días)
  - Todos los días o casi
```

---

**Pregunta 3.2 — Horas sentado**

```
Pregunta: ¿Cuántas horas al día pasas sentado, aproximadamente?
Opciones:
  - Menos de 4 horas
  - Entre 4 y 7 horas
  - Más de 7 horas
```

---

**Pregunta 3.3 — Actividad favorita**

```
Pregunta: ¿Qué tipo de movimiento disfrutas más?
Aviso:    (Aunque ahora no lo practiques)
Opciones:
  - Fuerza y pesas
  - Correr o caminar rápido
  - Yoga, pilates o estiramientos
  - Natación o agua
  - No tengo ninguna preferencia
```

---

**Pregunta 3.4 — Calidad del sueño**

```
Pregunta: ¿Cómo describes tu sueño en general?
Opciones:
  - Duermo muy bien
  - Bien, sin problemas
  - Regular, podría mejorar
  - Mal, me cuesta dormir o descansar
```

---

## Cierre de la anamnesis

*Transición hacia los micro-tests.*

```
Título:  ¡Perfecto, {nombre}!
Cuerpo:  {fisio} ya tiene una primera imagen de tu punto de partida.
         Ahora vienen 3 tests cortos para medir cómo está tu cuerpo hoy.
         Hazlos con honestidad — no hay que ser perfecto, hay que ser real.
Aviso:   Solo necesitas un poco de espacio. Sin material, desde casa.
CTA:     Empezar los tests
```

---

## Mensajes de bandera roja — resumen y principios

*Cuando una respuesta activa alerta, se muestra el mensaje inmediatamente debajo de la pregunta
(no al final). El paciente continúa el cuestionario sin interrupciones salvo que el protocolo
de la clínica indique pausar.*

| Situación | Mensaje al paciente |
|-----------|---------------------|
| Dolor que limita el día a día | *"Anotado. {fisio} lo tendrá en cuenta para preparar tu programa. Si te preocupa, {clinica} puede revisarlo contigo."* |
| Operación reciente (< 1 año) o restricción médica | *"Entendido. Avisaremos a {fisio} para que lo revise antes de asignarte los ejercicios."* |
| Las dos anteriores combinadas | *"Anotado todo. {fisio} revisará tu situación antes de confirmar tu programa. Seguimos."* |

**Principios para los mensajes de bandera roja:**
1. Siempre mencionar a {fisio} o {clinica} — refuerza que hay un humano real al otro lado.
2. Nunca decir "esto es grave" ni "necesitas revisión médica urgente" — eso lo decide el fisio.
3. El cuestionario continúa — no bloquear al usuario con la alerta.
4. El fisio recibe la alerta en su panel (semáforo rojo o ámbar, según la gravedad).

---

## Checklist de calidad

- [ ] ¿Cada pregunta puede leerla alguien sin formación médica y entenderla de inmediato?
- [ ] ¿Las opciones de respuesta cubren el 95% de los casos reales?
- [ ] ¿Los mensajes de bandera roja tranquilizan sin minimizar?
- [ ] ¿En ningún momento el paciente siente que "responder mal" le penaliza?
- [ ] ¿Cada pregunta necesita a {fisio}/{clinica} donde tiene sentido?
