# Motor de Entrenamiento — intensidad, Lidomare y dolor→movimiento

> Cómo Anti Frágil **sustituye de verdad** una sesión de gimnasio, se conecta con las
> actividades de Lidomare, y resuelve las molestias **a través del movimiento** antes de
> derivar a presencial. Diseño canónico (del dueño, 2026-06-13). Editable.

---

## 1. Escala de intensidad — de la recuperación al CrossFit

Para reemplazar una sesión de gym (y un CrossFit es cañero), no basta con rutinas suaves:
hay que cubrir **todo el espectro**. El motor elige el nivel según el cliente y el día.

| Nivel | Para quién / cuándo | Formato | Duración |
|-------|--------------------|---------|----------|
| **0 · Recuperación** | Dolor, regreso, mal sueño | Movilidad, respiración, descompresión | 5-10 min |
| **1 · Base** | Principiante, día normal | Fuerza funcional básica, técnica | 15-20 min |
| **2 · Desarrollo** | Progresando | Más carga y volumen, tempo | 20-30 min |
| **3 · Reto** | Avanzado | Circuitos, superseries | 30-40 min |
| **4 · Metcon (cañera)** | Élite — **sustituye CrossFit** | AMRAP / EMOM / Tabata, alta intensidad | 30-45 min |
| **★ Lidomare** | Replica una clase concreta del centro | Espejo en casa de la sesión presencial | según clase |

**Qué decide el nivel:**
- **Vitalidad inicial** y **fase del avatar** (techo de intensidad ganado con constancia).
- **Objetivo** (elemento): Fuego/transformación y Rayo/cardio empujan a niveles altos; Agua/recuperación se mantiene terapéutica hasta que el dolor lo permita.
- **Estado del día** (triaje + micro-pregunta): el motor puede SUBIR si el cliente llega fuerte, o BAJAR si llega tocado — nunca al revés sin avisar.

> **Regla de oro:** la intensidad se gana, no se regala. Un metcon solo se desbloquea cuando
> el cuerpo ha demostrado constancia y ausencia de dolor (puerta clínica) — igual que las fases.

---

## 2. Relación con Lidomare (el gimnasio) — gemelo digital de cada actividad

Cada actividad del centro tiene su **equivalente en casa** adaptado al nivel del cliente.
Cuando el cliente **no puede ir**, la app no le deja sin entrenar: le ofrece el gemelo.

| Actividad Lidomare | Gemelo digital en casa | Nivel |
|--------------------|------------------------|-------|
| CrossFit / WOD | **Metcon en casa** (AMRAP peso corporal + mancuernas) | 4 |
| Sala de fuerza guiada | Pack de fuerza progresivo | 2-3 |
| Pilates máquina | Rutina de control y core | 1-2 |
| Movilidad / yoga | Rutina de movilidad | 0-1 |
| Fisioterapia | *No se sustituye* — se deriva si el dolor no cede | — |

**Cómo se vive en la app:**
> "Hoy en Lidomare tocaba **CrossFit**. ¿No puedes ir? Aquí tienes tu **Metcon en casa**,
> adaptado a tu nivel de hoy." → el cliente entrena igual, el centro no lo pierde, y sus
> datos siguen fluyendo. Si SÍ va al centro, registra la asistencia (QR) y cuenta igual.

Esto ya tiene base de datos: `equivalencias_servicio` y `servicios_centro` (migración 0005).
**Dial editable:** la tabla de equivalencias por centro vive en `CONFIG.centros[x].actividades`
(cada una con su `nivel` y su `equivalenteCasa`).

---

## 3. Protocolo Dolor → Movimiento (lo diferencial)

> Filosofía: **intentamos resolver la molestia a través del movimiento.** A pesar de ofrecer
> siempre la consulta presencial, el primer recurso es el movimiento terapéutico bien dosificado
> — porque moverse bien suele ser parte de la solución, no del problema.

### El escalado (iterativo: probar → medir al día siguiente → ajustar)
| Dolor hoy | Qué hace la app | Presencial |
|-----------|----------------|------------|
| **1-4 (leve)** | Sigue la rutina; puede sustituir 1 ejercicio molesto por uno equivalente sin dolor. **El movimiento ayuda.** | No |
| **5-7 (moderado)** | Cambia a **movimiento terapéutico dirigido a la zona** (ej. lumbar → básculas, gato-camello, descompresión). Baja intensidad, no para. | Se ofrece como opción |
| **8-9 (alto)** | Rutina muy suave / movilidad mínima. Acompaña sin forzar. | Se ofrece con más énfasis |
| **Banderas rojas** | **Para.** Deriva a profesional / 112. | Obligatorio |

### El bucle de adaptación (cómo "vamos cambiando la rutina")
1. La app aplica el movimiento terapéutico de la zona dolorida.
2. **Mide el dolor al día siguiente** (triaje).
3. **¿Baja?** → progresa poco a poco hacia la rutina normal. El movimiento está funcionando.
4. **¿Sigue igual 3-4 días?** → intensifica la sugerencia de sesión presencial, **sin dejar de
   acompañar** con micro-movimiento. ("Llevamos unos días y la zona no cede: unas manos
   expertas pueden encontrar lo que al movimiento se le escapa.")
5. **¿Empeora o aparece bandera roja?** → stop y derivación inmediata.

> Esto convierte el dolor en un diálogo, no en un muro: el cliente nunca se queda solo ni
> parado, y la derivación presencial llega solo cuando el movimiento ha demostrado no bastar.

**Dónde vive hoy:** `decidirRutina()` en `app-funcional.html` ya hace la parte de
selección por dolor/energía/molestia/estancamiento. El paso pendiente de programar es el
**movimiento terapéutico dirigido por zona** (un `packTerapeutico` por zona corporal) y la
medición explícita "¿bajó el dolor respecto a ayer?" para progresar o intensificar.

---

## 4. Próximos pasos de implementación (cuando se valide este diseño)
1. Añadir a `CONFIG` los **niveles de intensidad** (pack por nivel 0-4) + `packMetcon` cañero.
2. Añadir `packTerapeutico` por zona (lumbar, cervical, hombro, rodilla, cadera).
3. En `decidirRutina`: elegir nivel por (fase + objetivo + estado) y aplicar el bucle dolor→movimiento.
4. Equivalencias Lidomare en `CONFIG.centros` (actividad → nivel → gemelo en casa).
5. Validación clínica de los protocolos terapéuticos por un fisio antes del piloto.

> Relacionado: [`departamentos/entrenamiento.md`](../departamentos/entrenamiento.md) ·
> [`departamentos/fisioterapia.md`](../departamentos/fisioterapia.md) ·
> [`diseño/rutinas-packs.md`](rutinas-packs.md) · migración `0005_arquitectura_modular.sql`.
