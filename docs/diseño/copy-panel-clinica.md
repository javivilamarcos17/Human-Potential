# Copy del panel de la clínica — Anti Frágil

> Textos del lado B2B: el panel web del fisio.
> **Tono:** profesional y claro. El lector es un sanitario ocupado que necesita entender
> el estado de sus pacientes en segundos. Sin florituras — pero sin frialdad de sistema médico.
> Variables disponibles: `{nombre_paciente}`, `{fisio}`, `{clinica}`, `{racha}`,
> `{dias_inactivo}`, `{dolor_hoy}`, `{zona}`, `{rpe}`, `{score_auditoria}`.

---

## 1. Semáforos — vista de pacientes (B4)

*Pantalla de inicio del fisio. Cada fila es un paciente con su color.*

### 1.1 Etiquetas de estado

| Color | Etiqueta corta | Significado visible en la fila |
|-------|---------------|-------------------------------|
| 🔴 Rojo | **Atención hoy** | Requiere revisión antes de su próxima sesión |
| 🟡 Ámbar | **Seguimiento** | Situación a vigilar; no urgente |
| 🟢 Verde | **En orden** | Sin incidencias |

---

### 1.2 Causas de alerta y su descripción en tooltip

**🔴 Rojo — posibles causas (se muestra la más prioritaria):**

| Causa | Texto del tooltip |
|-------|------------------|
| Dolor alto en triaje (≥ 7) | "Reportó dolor {dolor_hoy}/10 en {zona} hoy." |
| Molestia nueva no reportada antes | "Primera vez que reporta molestia en {zona}." |
| Abandono inminente (≥ 5 días inactivo) | "Sin actividad desde hace {dias_inactivo} días." |
| RPE extremo (≥ 9) | "Reportó un esfuerzo de {rpe}/10 en la última sesión." |

**🟡 Ámbar — posibles causas:**

| Causa | Texto del tooltip |
|-------|------------------|
| Dolor moderado sostenido (4–6, ≥ 3 días) | "Dolor moderado en {zona} durante {dias} días seguidos." |
| Inactividad moderada (2–4 días) | "Sin actividad desde hace {dias_inactivo} días." |
| RPE alto (7–8) | "Reportó un esfuerzo elevado ({rpe}/10) ayer." |
| Racha rota tras una racha larga (≥ 14 días) | "Racha de {racha_previa} días interrumpida hace {dias_inactivo} días." |

**🟢 Verde:**

| Causa | Texto del tooltip |
|-------|------------------|
| Sin incidencias | "Activo. Último triaje sin alertas." |

> ⚠️ Los tooltips son la segunda línea de información — deben leerse en < 3 segundos.
> No incluir jerga técnica ni referencias a IDs internos.

---

### 1.3 Cabeceras de la tabla de pacientes

| Columna | Etiqueta | Tooltip |
|---------|----------|---------|
| Estado | Estado | "Calculado a partir del triaje diario, RPE y actividad." |
| Nombre | Paciente | — |
| Última sesión | Última sesión | "Fecha en que completó el Core Loop por última vez." |
| Racha | Racha | "Días consecutivos con el Core Loop completado." |
| Dolor (hoy) | Dolor hoy | "Puntuación del triaje de hoy (0–10). — si no ha hecho el triaje." |
| Fase avatar | Fase | "Fase actual de su Guardián (1–30)." |

---

### 1.4 Filtros de la lista

| Filtro | Etiqueta | Descripción |
|--------|----------|-------------|
| Mostrar solo rojos | Solo alertas | Muestra únicamente los pacientes con estado rojo |
| Mostrar solo ámbar | Seguimiento | Muestra ámbar (sin rojo) |
| Todos | Todos los pacientes | Vista completa |
| Buscador | Buscar paciente... | Placeholder del campo de búsqueda |

---

## 2. Ficha del paciente (B3)

*Vista detallada de un paciente concreto. El fisio la abre desde la tabla.*

### 2.1 Cabecera de la ficha

```
{nombre_paciente}  ·  AF-{codigo}
{clinica}  ·  {fisio}
Estado actual: [chip de semáforo]    Racha: {racha} días    Fase: {nombre_fase}
```

---

### 2.2 Bloque de Auditoría de Vitalidad

| Elemento | Texto |
|----------|-------|
| Título del bloque | Auditoría de Vitalidad |
| Puntuación global | Puntuación total: {score}/100 |
| Comparativa | Inicial: {score_inicial} → Última: {score_actual} ({diferencia} puntos) |
| Sin re-Auditoría | *"Solo hay datos de la Auditoría inicial. La re-Auditoría aún no se ha realizado."* |
| Tooltip puntuación | "Suma de los cuatro bloques (Movilidad, Fuerza, Resistencia, Bienestar). Máx. 100." |
| Tooltip bloque individual | "Puntuación de este bloque en la última Auditoría. Máx. {max_bloque}." |

---

### 2.3 Bloque de historial de dolor y energía

| Elemento | Texto |
|----------|-------|
| Título | Historial de dolor y energía |
| Eje X del gráfico | Fecha |
| Eje Y (dolor) | Dolor (0–10) |
| Eje Y (energía) | Energía |
| Sin datos | *"Sin datos de triaje todavía. {nombre_paciente} aún no ha completado el check-in diario."* |
| Tooltip punto de dato | "{fecha} — Dolor: {dolor}/10 · Energía: {energia}" |

---

### 2.4 Bloque de sesiones y feedback RPE

| Elemento | Texto |
|----------|-------|
| Título | Sesiones y feedback |
| Cabecera columna fecha | Fecha |
| Cabecera columna pack | Pack prescrito |
| Cabecera columna rpe | Esfuerzo (RPE) |
| Cabecera columna nota | Nota del paciente |
| Sin sesiones | *"{nombre_paciente} aún no ha completado ninguna sesión."* |
| RPE muy bajo (≤ 3) | chip: "Demasiado fácil" |
| RPE óptimo (5–7) | chip: "Bien exigida" |
| RPE alto (8) | chip: "Exigente" |
| RPE extremo (≥ 9) | chip: "Muy exigente" — color ámbar |

---

### 2.5 Bloque de avatar y adherencia

| Elemento | Texto |
|----------|-------|
| Título | Adherencia y avatar |
| Racha | Racha actual: {racha} días |
| Mejor racha | Mejor racha: {mejor_racha} días |
| Tasa de adherencia | Adherencia últimos 30 días: {porcentaje}% |
| Fase y nivel | {nombre_fase} · Nivel {nivel} |
| Tooltip adherencia | "Porcentaje de días activos sobre los últimos 30 días naturales." |

---

### 2.6 Acciones en la ficha

| Acción | Etiqueta del botón | Confirmación |
|--------|--------------------|-------------|
| Ajustar Pack activo | Cambiar prescripción | — (abre selector de Pack) |
| Enviar aviso manual | Enviar aviso | — (abre modal de texto libre) |
| Marcar para revisión | Marcar revisión | — |
| Ver Auditoría completa | Ver Auditoría completa | — (expande o abre vista detallada) |

---

## 3. Alertas automáticas

*Aparecen en la fila del paciente y/o como notificación interna al fisio.*
*Formato: qué pasó + contexto de cuándo. Directo. Sin dramatismo.*

### 3.1 Alertas de dolor

| Situación | Texto de la alerta |
|-----------|--------------------|
| Dolor alto en triaje (≥ 7) | "{nombre_paciente} reportó dolor {dolor_hoy}/10 en {zona} hoy." |
| Dolor alto tras sesión (RPE + dolor) | "{nombre_paciente}: dolor {dolor_hoy}/10 y esfuerzo {rpe}/10 tras la sesión de ayer." |
| Primera vez con dolor en nueva zona | "{nombre_paciente} reporta molestia nueva en {zona} por primera vez." |
| Dolor sostenido (≥ 3 días con dolor ≥ 4) | "{nombre_paciente} lleva {dias} días con dolor ≥ 4 en {zona}." |

---

### 3.2 Alertas de abandono

| Situación | Texto de la alerta |
|-----------|--------------------|
| 2 días sin actividad | "{nombre_paciente} no ha completado el programa en 2 días." |
| 5 días sin actividad | "{nombre_paciente} lleva 5 días inactivo. Riesgo de abandono." |
| 7+ días sin actividad | "{nombre_paciente} lleva {dias_inactivo} días sin actividad." |
| Racha larga interrumpida | "{nombre_paciente} tenía una racha de {racha_previa} días. Lleva {dias_inactivo} días inactivo." |

> ⚠️ Las alertas de abandono son las más valiosas para el negocio de la clínica.
> El texto "Riesgo de abandono" es clínico y directo — es B2B, el fisio necesita
> entenderlo así para actuar. No suavizar en exceso.

---

### 3.3 Alertas de progreso positivo (opcionales, para reforzar el uso del panel)

| Situación | Texto |
|-----------|-------|
| Re-Auditoría con mejora notable (≥ 10 pts) | "{nombre_paciente} mejoró {diferencia} puntos en la re-Auditoría de hoy." |
| Hito de racha (30 días) | "{nombre_paciente} cumplió 30 días de adherencia." |
| Subida de fase del avatar | "{nombre_paciente} ha alcanzado la {nombre_fase}." |

---

## 4. Estados vacíos del panel

### 4.1 Panel nuevo — sin pacientes dados de alta

```
Icono:   Silueta de paciente vacía
Título:  Aún no hay pacientes en {clinica}.
Cuerpo:  Da de alta al primer paciente para generar su Código de Honor
         y empezar a hacer seguimiento.
Acción:  Dar de alta paciente
```

---

### 4.2 Lista de pacientes — resultado de búsqueda vacío

```
Título:  No hay resultados para "{busqueda}".
Cuerpo:  Comprueba el nombre o el código de honor (AF-XXXX).
Acción:  Limpiar búsqueda
```

---

### 4.3 Ficha de paciente — sin sesiones

```
Texto:   {nombre_paciente} aún no ha completado ninguna sesión.
         Cuando lo haga, aquí verás su historial de RPE y notas.
```

---

### 4.4 Ficha de paciente — sin triajes

```
Texto:   {nombre_paciente} aún no ha registrado su check-in diario.
         El historial de dolor y energía aparecerá aquí cuando lo haga.
```

---

### 4.5 Ficha de paciente — sin re-Auditoría

```
Texto:   Solo hay datos de la Auditoría inicial.
         La comparativa de evolución estará disponible tras la primera re-Auditoría.
```

---

## 5. Tooltips de elementos del panel

| Elemento | Tooltip |
|----------|---------|
| Código de Honor (AF-XXXX) | "Identificador único del paciente en Anti Frágil. Se genera al darlo de alta." |
| Semáforo | "Estado calculado automáticamente a partir del triaje, RPE y actividad de las últimas 24–48h." |
| Racha | "Días consecutivos con el Core Loop completado (triaje + rutina + feedback)." |
| RPE | "Esfuerzo percibido reportado por el paciente al terminar la sesión (escala 1–10)." |
| Fase del avatar | "Refleja la adherencia acumulada. 30 fases en total. No es un dato clínico — es un indicador de motivación y constancia." |
| Auditoría de Vitalidad | "Test de 4 bloques (Movilidad, Fuerza, Resistencia, Bienestar). Puntuación total sobre 100. Se repite periódicamente para medir evolución." |
| Plantilla de Auditoría | "La plantilla define qué preguntas componen la Auditoría de tus pacientes. Cada clínica gestiona las suyas." |
| Pack / prescripción | "Conjunto de ejercicios asignados a este paciente. Puedes cambiar la prescripción activa en cualquier momento." |

---

## Checklist de calidad

- [ ] ¿Cada texto es legible en < 3 segundos?
- [ ] ¿Las alertas dicen exactamente qué pasó y cuándo (sin ambigüedad)?
- [ ] ¿Los estados vacíos proponen una acción cuando hay algo que hacer?
- [ ] ¿Los tooltips explican el "qué es" sin usar jerga técnica interna?
- [ ] ¿Ningún texto culpa al paciente ni al fisio?
