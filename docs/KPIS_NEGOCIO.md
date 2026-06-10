# KPIs de Negocio — Anti Frágil

> Las métricas que importan: qué miden, cómo se obtienen y qué nivel indica que el
> negocio está funcionando. Las metas son orientativas — se calibran con los datos
> reales del piloto. Un KPI sin forma de medirlo no es un KPI: es un deseo.

---

## ⭐ Métrica Norte Estrella

> La métrica norte estrella es **una sola cifra** que, si sube, significa que el
> producto está entregando valor real. Todo lo demás la alimenta o la explica.

### Sesiones de rutina completadas por paciente activo por semana

**Qué mide:** que los pacientes hacen sus ejercicios prescritos de forma constante.
Es el corazón del producto — si esto no ocurre, nada más importa. La adherencia
es el problema que Anti Frágil resuelve; esta métrica confirma si lo está resolviendo.

**Cómo se mide:** `total de sesiones completadas en la semana / nº de pacientes activos
esa semana`. Un paciente es "activo" si ha abierto la app al menos una vez en los
últimos 7 días.

**Meta orientativa:**
- Semana 2 del piloto: ≥ 2,0 sesiones/paciente/semana
- Semana 6: ≥ 2,5 sesiones/paciente/semana
- Estado saludable en producción: ≥ 3,0 sesiones/paciente/semana

**Señal de alarma:** si baja de 1,5 durante dos semanas consecutivas, hay un problema
estructural (onboarding, fricción en el triaje, contenido insuficiente o gamificación
que no engancha).

---

## KPIs de adherencia y retención del paciente

### 1. Tasa de adherencia semanal

**Qué mide:** del total de sesiones prescritas esa semana, cuántas completó el paciente.
Diferencia entre "está usando la app" y "está cumpliendo su tratamiento".

**Cómo se mide:** `sesiones completadas / sesiones prescritas × 100`.

**Metas orientativas:**
| Período | Umbral mínimo | Estado saludable |
|---------|--------------|-----------------|
| Semana 2 | 50 % | 65 % |
| Semana 4 | 60 % | 75 % |
| Semana 8 | 55 % | 70 % |

*(Es normal una ligera bajada entre semana 4 y 8 — el entusiasmo inicial se asienta.
Lo preocupante es una caída sostenida.)*

---

### 2. Retención a 4 semanas (D28)

**Qué mide:** de los pacientes que se registraron, cuántos siguen activos 28 días después.
Es el indicador más fiable de si la gamificación y el vínculo con el avatar están funcionando.

**Cómo se mide:** `pacientes activos en día 28 / pacientes registrados × 100`.

**Metas orientativas:** ≥ 50 % (umbral mínimo del piloto, ver [`PLAN_PILOTO.md`](PLAN_PILOTO.md)).
En producción madura: ≥ 60 %.

---

### 3. Retención a 8 semanas (D56)

**Qué mide:** la retención real más allá del efecto novedad. A las 8 semanas, el paciente
que sigue es un usuario genuinamente comprometido.

**Cómo se mide:** `pacientes activos en día 56 / pacientes registrados × 100`.

**Metas orientativas:** ≥ 35 % (umbral mínimo del piloto). En producción madura: ≥ 45 %.

---

### 4. Tasa de activación (tiempo hasta primer triaje)

**Qué mide:** si el paciente completa su primer triaje diario dentro de las primeras
48 horas. Las primeras 48 horas son el momento de mayor abandono; si el paciente no
hace el triaje en ese período, la probabilidad de retención cae drásticamente.

**Cómo se mide:** `pacientes con triaje completado en primeras 48h / total registrados × 100`.

**Meta orientativa:** ≥ 75 %. Si está por debajo, revisar el onboarding y las
notificaciones push de bienvenida.

---

### 5. Evolución del dolor (delta clínico)

**Qué mide:** si los pacientes reportan menos dolor a lo largo del tiempo. Es la métrica
que conecta el uso de la app con el resultado clínico real — el argumento más fuerte
para el profesional y para el inversor.

**Cómo se mide:** media del nivel de dolor reportado en el triaje (semana 1) vs. media
de las últimas 2 semanas del piloto. Escala 1-10.

**Meta orientativa:** bajada media ≥ 1,5 puntos en el grupo piloto a las 8 semanas.

---

### 6. Tasa de triaje diario completado

**Qué mide:** consistencia del hábito más básico de la app. El triaje es el "check-in"
diario que alimenta todos los demás sistemas (semáforos, evolución del avatar, alertas).

**Cómo se mide:** `días con triaje completado / días activos del usuario × 100`.

**Meta orientativa:** ≥ 70 % en usuarios con retención > 4 semanas.

---

## KPIs de gamificación

### 7. Distribución de fases del avatar

**Qué mide:** en qué etapa de evolución están los pacientes activos. Si la mayoría está
atascada en las primeras fases, el motor de XP puede estar mal calibrado (demasiado lento)
o los pacientes no están completando suficientes sesiones.

**Cómo se mide:** histograma de las 30 fases con el % de usuarios activos en cada una.
Revisión mensual.

**Señal de alarma:** si > 60 % de los usuarios llevan 4 semanas en fase 1-3, el motor
de evolución necesita recalibración.

---

### 8. Rachas activas (promedio)

**Qué mide:** el promedio de días consecutivos de uso en los pacientes activos. Las
rachas son el mecanismo de aversión a la pérdida más inmediato — el paciente no quiere
"romperla".

**Cómo se mide:** media de la racha actual (días consecutivos sin romper) en el conjunto
de usuarios activos.

**Meta orientativa:** racha media ≥ 5 días en usuarios con retención > 4 semanas.

---

### 9. Tarjetas Épicas compartidas

**Qué mide:** el potencial viral orgánico. Cada Tarjeta Épica compartida en Instagram
o TikTok es publicidad gratuita con credibilidad social.

**Cómo se mide:** nº de Tarjetas Épicas generadas y nº de veces compartidas (si la
plataforma lo permite rastrear). En el piloto, dato informativo — no hay meta.

---

## KPIs B2B (uso de la clínica)

### 10. Frecuencia de uso del panel por el profesional

**Qué mide:** si el fisio está usando activamente la herramienta o si la adoptó al
principio y la abandonó. Es el predictor más fiable del churn de la clínica: una clínica
que no usa el panel, no renueva.

**Cómo se mide:** nº de sesiones del profesional en el panel web por semana.

**Meta orientativa:** ≥ 3 accesos/semana en los primeros 2 meses. Si baja de 1/semana
durante 2 semanas, contacto proactivo inmediato.

---

### 11. Alertas de semáforo actuadas

**Qué mide:** cuando la app genera una alerta roja (dolor > 7 o molestia nueva), si el
profesional la revisa y actúa. Esto mide si el panel de semáforos está generando valor
clínico real.

**Cómo se mide:** `alertas revisadas por el fisio en < 48h / alertas totales × 100`.

**Meta orientativa:** ≥ 80 %.

---

### 12. NPS del profesional

**Qué mide:** la probabilidad de que el fisio recomiende Anti Frágil a otro colega de
profesión. Es el indicador más directo del crecimiento B2B por boca a boca.

**Cómo se mide:** encuesta de 1 pregunta al cierre del piloto y cada 3 meses en
producción ("¿Con qué probabilidad recomendarías Anti Frágil a otro profesional?", 0-10).
NPS = % promotores (9-10) − % detractores (0-6).

**Meta orientativa:** NPS ≥ 30 al cierre del piloto. En producción madura: ≥ 50.

---

## KPIs de negocio y crecimiento

### 13. MRR (Monthly Recurring Revenue — ingresos mensuales recurrentes)

**Qué mide:** la salud financiera del negocio en un momento dado. Es la métrica que
los inversores miran primero.

**Cómo se mide:** suma de todas las cuotas mensuales activas (clínicas + pacientes con
suscripción). Ver escenarios en [`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md).

**Metas orientativas (escenario base):**
- Mes 6: ~2.200 €/mes
- Mes 12: ~5.000 €/mes

---

### 14. Churn mensual de clínicas

**Qué mide:** cuántas clínicas dejan de pagar cada mes. Es el riesgo financiero más
importante del modelo B2B — un churn alto hace el negocio insostenible aunque crezcan
las altas.

**Cómo se mide:** `clínicas que cancelan en el mes / clínicas activas a inicio del mes × 100`.

**Meta orientativa:** < 3 % mensual (equivale a un LTV medio > 33 meses por clínica).
Si supera el 5 %, es una señal de crisis que requiere análisis inmediato.

---

### 15. CAC de clínica (Coste de Adquisición)

**Qué mide:** cuánto cuesta, en tiempo y dinero, conseguir una nueva clínica de pago.
En Año 1 el canal es principalmente relaciones personales — el CAC debe ser bajo.

**Cómo se mide:** `coste total de ventas y marketing en el período / nº de clínicas nuevas
conseguidas en ese período`.

**Meta orientativa:** < 600 € por clínica (< 3 meses de cuota media de 200 €/mes).

---

### 16. Referidos de paciente (tasa de conversión)

**Qué mide:** cuántos pacientes usan su código de referido y cuántos de esos referidos
se convierten en usuarios activos. Es la palanca de crecimiento orgánico más medible.

**Cómo se mide:** `pacientes registrados vía código de referido / total registrados × 100`.
Y separado: `referidos que completan el onboarding / referidos registrados × 100`.

**Meta orientativa:** en el piloto, dato informativo. En producción: > 15 % de nuevos
registros vía referido indica un motor viral saludable.

---

### 17. Conversión de upselling (banner → reserva presencial)

**Qué mide:** si los banners de upselling dentro de la app están generando reservas
reales de sesiones presenciales en la clínica. Es el cross-selling medible más directo.

**Cómo se mide:** depende de la integración con la clínica. Mínimo viable: preguntar
al fisio mensualmente cuántas reservas llegan mencionando la app o el banner. En
producción: tracking de clics en el banner.

**Meta orientativa:** ≥ 1 reserva por clínica por cada 20 pacientes activos al mes.

---

## Cuadro de mando resumido

> Para revisar semanalmente durante el piloto y mensualmente en producción.

| Categoría | KPI | Frecuencia de revisión | Señal de alarma |
|-----------|-----|------------------------|-----------------|
| ⭐ Norte estrella | Sesiones completadas / paciente activo / semana | Semanal | < 1,5 dos semanas seguidas |
| Adherencia | Tasa de adherencia semanal | Semanal | < 50 % en semana 4 |
| Retención | Retención D28 | Mensual | < 40 % |
| Retención | Retención D56 | Mensual | < 25 % |
| Activación | Triaje en primeras 48h | Por cohorte | < 65 % |
| Clínico | Delta de dolor (semana 1 vs. fin) | Por piloto/trimestre | Sin bajada |
| Gamificación | Racha media activos | Mensual | < 3 días |
| B2B | Accesos semanales del profesional | Semanal | < 1/semana |
| B2B | Alertas actuadas | Semanal | < 70 % |
| B2B | NPS profesional | Trimestral | < 10 |
| Negocio | MRR | Mensual | Según escenario base |
| Negocio | Churn clínicas | Mensual | > 5 % |
| Negocio | CAC clínica | Trimestral | > 600 € |

---

*Documentos relacionados: [`PLAN_PILOTO.md`](PLAN_PILOTO.md) (umbrales del piloto),
[`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md) (metas financieras),
[`RIESGOS_Y_MITIGACIONES.md`](RIESGOS_Y_MITIGACIONES.md) (señales de alarma y planes de contingencia).*
