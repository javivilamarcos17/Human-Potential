# 🩺 Fisioterapia — panel de mandos

> Todo lo clínico: cómo medimos al paciente, qué consideramos alarma y cómo respondemos.
> Dile a Claude "en fisio, …".

## 1. Triaje diario
**Qué controlas:** las preguntas de cada día y sus escalas.
**Diales actuales:** Dolor **1-10** · Energía **1-10** · 1 micro-pregunta de vida rotativa
(sueño, horas sentado, estrés, agua, ánimo, comida, tipo de día — lista `preguntasDia`).
**Cómo pedírmelo:** *"añade una pregunta de calidad del sueño fija"* · *"cambia la escala de dolor a caras"*.

## 2. Semáforo de alerta (lo que ve la clínica)
**Dial:** dolor **≥8** o molestia nueva → 🔴 alerta al profesional (espejo en `panel-piloto.html`).
Es la regla de `ESPECIFICACION_MVP` (≥8 = rojo). 5-7 = ámbar implícito.
**Cómo pedírmelo:** *"baja el umbral rojo a 7"* · *"que 3 días de dolor 5 también alerte"*.

## 3. Banderas rojas (seguridad — deriva fuera de la app)
**Qué controlas:** los síntomas de alarma que aparecen si dolor ≥9, y la respuesta.
**Diales actuales** (checklist en el triaje): hormigueo/pérdida de fuerza · dolor tras golpe ·
dolor nocturno · **pérdida de control de esfínteres (URGENTE → botón 112)**.
Si marca alguno → para el juego, pantalla de seguridad, WhatsApp al profesional.
**Cómo pedírmelo:** *"añade 'fiebre con dolor de espalda' como bandera roja"* · *"que la urgencia llame también al centro"*.

## 4. Auditoría de Vitalidad (foto física inicial)
**Dial:** 4 bloques con su peso → Fuerza **0-30** · Aeróbico **0-30** · Movilidad **0-20** · Constancia **0-20** = 0-100.
**Cómo pedírmelo:** *"sube el peso de movilidad a 30 y baja aeróbico a 20"*.

## 5. Semana de Eclosión (pruebas reales que afinan la Vitalidad)
**Dial:** 7 micro-pruebas (`CONFIG.pruebas`), 1/día. Cada una: enunciado, unidad, máximo y
fórmula a puntos (ej. sentadillas en 45s → fuerza; flexión de tronco → movilidad).
Re-Auditoría automática **cada 28 días** (compara marcas nuevas vs viejas = mejora real).
**Cómo pedírmelo:** *"cambia la prueba de plancha por una de equilibrio"* · *"re-auditoría cada 21 días"*.

## 6. Feedback post-rutina
**Dial:** Esfuerzo (RPE) **1-10** + ¿molestia nueva? (sí → alerta). Coherencia: sesión muy
corta + RPE alto → marca "sesión exprés (revisar)" en el resumen al fisio.
**Cómo pedírmelo:** *"pregunta también la zona de la molestia nueva"*.

---
**Lo que llega al profesional:** alertas de dolor y resumen semanal (medias de dolor/energía/RPE,
banderas, sesiones exprés) por WhatsApp + Supabase. Borrador legal: `docs/PRIVACIDAD_RGPD.md`.
**Dónde vive:** `app-funcional.html` + `panel-piloto.html`.
