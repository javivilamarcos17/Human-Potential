# La Auditoría de Vitalidad — Anti Frágil

> El "carnet de identidad físico" del paciente al entrar. Es la puerta de entrada de todo:
> de ella nacen el **nivel de partida**, el **arquetipo** (Sombrero Seleccionador) y el
> punto cero contra el que se mide toda la mejora futura (las puertas clínicas del avatar).
>
> ⚠️ **IMPORTANTE — pushback de Claude:** yo NO soy clínico. Los valores, ejercicios y
> umbrales de este documento son una **propuesta de partida editable** para que la validen
> los fisioterapeutas del proyecto. El dueño y su equipo clínico deben revisarla y ajustarla.
> Aquí aporto la *estructura* y la *lógica de puntuación*; la validez médica la ponéis vosotros.

---

## 1. Qué es y para qué sirve

Una puntuación única de **0 a 100** que resume el estado físico del paciente, compuesta por
cuatro bloques. Se hace al entrar (Auditoría inicial) y se repite cada cierto tiempo
(re-Auditorías) para medir el progreso real.

| Bloque | Peso | Qué mide |
|--------|------|----------|
| 💪 Fuerza Base | 0–30 | Fuerza funcional (tren inferior, core, tren superior). |
| 🫁 Capacidad Aeróbica | 0–30 | Resistencia cardiovascular. |
| 🤸 Movilidad / Ausencia de dolor | 0–20 | Rango de movimiento y nivel de dolor. |
| 🔁 Constancia / Hábitos | 0–20 | Estilo de vida y adherencia previa. |
| | **= 100** | **Vitalidad total** |

> Los tres primeros bloques se miden con **micro-tests** (el paciente graba un vídeo corto
> o marca un resultado). El cuarto sale de la **anamnesis** (cuestionario inicial).

---

## 2. La anamnesis (cuestionario previo — antes de los tests)

Preguntas para conocer al paciente, detectar banderas rojas y alimentar el bloque de
Constancia y el Sombrero Seleccionador. **Borrador editable por el equipo clínico:**

**Datos y objetivos**
- Edad, sexo (opcional), objetivo principal (quitar dolor / ganar fuerza / moverme mejor / mantenerme).

**Salud (banderas rojas → avisan a la clínica, no puntúan)**
- ¿Tienes alguna lesión o dolor activo ahora mismo? ¿Dónde?
- ¿Te ha operado o te ha prohibido algún ejercicio un médico?
- ¿Dolor de espalda frecuente? (alimenta arquetipo Agua)

**Estilo de vida (alimenta Constancia 0–20 y el arquetipo)**
- ¿Cuántos días a la semana te mueves/entrenas hoy? (0 → 5+)
- ¿Cuántas horas pasas sentado al día?
- ¿Qué actividad disfrutas más? (fuerza / cardio-correr / yoga-pilates / natación / ninguna)
- ¿Cómo duermes (1–5)?

---

## 3. Los micro-tests (los 3-4 ejercicios grabados)

> Cada test: instrucción en vídeo + el paciente **graba su intento** o **marca el resultado**
> (Sí/No o número). La clínica puede revisar el vídeo después. Pensado para hacerse en casa,
> sin material. **Ejercicios de ejemplo — el equipo clínico elige los definitivos.**

### Test A — Fuerza Base (0–30)
Tres micro-pruebas, 10 puntos cada una:
| Prueba | Cómo se mide | Puntos |
|--------|--------------|--------|
| Sentadillas en 30 s | nº de repeticiones con buena forma | 0–10 |
| Plancha (core) | segundos aguantados | 0–10 |
| Flexiones (rodillas o completas) en 30 s | nº de repeticiones | 0–10 |

### Test B — Capacidad Aeróbica (0–30)
| Prueba | Cómo se mide | Puntos |
|--------|--------------|--------|
| Step-test / marcha 3 min | pulsaciones al acabar (o esfuerzo percibido si no hay pulsómetro) | 0–20 |
| ¿Llegas sin pararte a subir 3 pisos? | escala 0–10 según facilidad | 0–10 |

### Test C — Movilidad / Ausencia de dolor (0–20)
| Prueba | Cómo se mide | Puntos |
|--------|--------------|--------|
| Tocar los dedos de los pies / sentadilla profunda | rango alcanzado (Sí/parcial/No) | 0–10 |
| Dolor habitual (autovaloración) | 10 − (dolor 0-10 del triaje base) | 0–10 |

> El bloque de Movilidad **penaliza el dolor**: a más dolor habitual, menos puntos. Así la
> Vitalidad baja refleja honestamente a quien llega con molestias, y subirla es una victoria.

---

## 4. Cómo se calcula la puntuación final

```
Vitalidad (0-100) = Fuerza(0-30) + Aeróbico(0-30) + Movilidad(0-20) + Constancia(0-20)
```

Esa cifra se guarda en la tabla `auditorias_vitalidad` (con cada bloque por separado, para
poder analizar después qué mejora más). El campo `total` se calcula solo en la base de datos.

**Interpretación orientativa (editable):**
| Rango | Lectura |
|-------|---------|
| 0–25 | Punto de partida frágil. Gran margen de mejora (¡y de enganche!). |
| 26–50 | Base media. El trabajo dará frutos visibles pronto. |
| 51–75 | Buena forma. Foco en consolidar y prevenir. |
| 76–100 | Vitalidad alta. Mantenimiento y retos de élite. |

---

## 5. Qué desencadena la Auditoría (conexión con el resto del sistema)

1. **Nivel de partida del avatar:** la Vitalidad inicial da algo de XP de salida (quien
   llega más en forma arranca con ventaja), pero **todos nacen en Huevo (Fase 1)**.
   → ver `sombrero_seleccionador.dart` (`xpDePartida`).
2. **Arquetipo:** los datos de la anamnesis + bloques deciden la familia (Tierra/Agua/Viento).
   → ver `sombrero_seleccionador.dart` (`asignarArquetipo`).
3. **Punto cero de mejora:** las **puertas clínicas** del avatar (ej. "Auditoría ≥ +10 pts
   vs inicio", "Auditoría ≥ 70/100") comparan contra esta primera Auditoría.
   → ver `diseño/avatar-evolucion.md`.

---

## 6. Las re-Auditorías (medir el progreso)

- Se repiten cada **4–6 semanas** (frecuencia editable por la clínica).
- Mismos tests → comparación directa contra la inicial.
- Mejorar en una re-Auditoría da **mucha XP** y puede **desbloquear fases** del avatar.
- Es el momento "wow": el paciente *ve con números* que ha mejorado. Refuerza la adherencia
  y da a la clínica un argumento medible de valor.

---

## 7. Dónde vive esto en el proyecto

- Cuestionario y tests: pantalla `app/lib/features/onboarding/` (boceto).
- Cálculo: `app/lib/features/onboarding/auditoria_vitalidad.dart` (lógica de puntuación).
- Almacenamiento: tabla `auditorias_vitalidad` (`supabase/migrations/0001_esquema_inicial.sql`).
- Uso posterior: motor del avatar (`avatar_evolucion.dart`) y Sombrero (`sombrero_seleccionador.dart`).
