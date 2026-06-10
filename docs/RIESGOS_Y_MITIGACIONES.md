# Riesgos y Mitigaciones — Anti Frágil

> Mapa de riesgos del proyecto: qué puede salir mal, con qué probabilidad e impacto,
> y qué haremos antes de que ocurra. Un riesgo identificado a tiempo es una decisión
> pendiente, no una catástrofe. Este documento es un **artefacto vivo**: se revisa
> tras cada sprint, piloto y decisión relevante.

**Escala usada:**
- Impacto: 🔴 Alto (amenaza la viabilidad del proyecto) · 🟡 Medio (retraso o coste significativo) · 🟢 Bajo (molestia manejable)
- Probabilidad: Alta · Media · Baja

---

## 1. Riesgos de producto

| # | Riesgo | Impacto | Probabilidad | Mitigación |
|---|--------|---------|--------------|------------|
| P1 | **La gamificación no engancha a pacientes de fisio** — el avatar y el juego conectan con jugadores, pero los pacientes de 40-60 años con lesiones pueden vivir el sistema como infantil o irrelevante. | 🔴 Alto | Media | Validar en el piloto con perfil demográfico real. Diseñar el onboarding para que el vínculo con el avatar sea progresivo, no inmediato. Tener preparado un "modo funcional" con menos gamificación si el feedback lo exige. |
| P2 | **El triaje diario se convierte en fricción** — si rellenar dolor y energía cada día se siente como tarea, el usuario lo abandona y todo el sistema pierde datos. | 🔴 Alto | Media | Máxima simplificación: 2 deslizadores, menos de 10 segundos. El triaje debe ser lo primero que ve el usuario al abrir la app, no un paso enterrado. Medir tiempo medio de completado en las primeras semanas del piloto. |
| P3 | **Los vídeos de ejercicios son de baja calidad o insuficientes** — si la clínica piloto no tiene vídeos o los hace mal, la experiencia del paciente falla antes de llegar a la gamificación. | 🟡 Medio | Alta | Antes del piloto: ayudar activamente a la clínica a grabar un mínimo de 10-15 vídeos base. Crear una guía de grabación sencilla (móvil, iluminación, duración). El panel debe funcionar con pocos vídeos al principio. |
| P4 | **El motor de evolución del avatar no refleja progreso real** — si el avatar sube aunque el paciente no mejore, o no sube aunque sí mejore, el sistema pierde credibilidad clínica. | 🔴 Alto | Media | El algoritmo de XP y las "puertas clínicas" (umbrales para subir de fase) deben estar revisados por al menos un fisioterapeuta antes del lanzamiento. Iterar con datos del piloto. |
| P5 | **Las ilustraciones del avatar llegan tarde o no son suficientemente buenas** — el arte del Guardián es el corazón emocional del producto; unos placeholders malos rompen la magia. | 🟡 Medio | Media | Contratar al ilustrador con suficiente antelación (decisión D5 ya cerrada). Definir el estilo y las especificaciones visuales **antes** de empezar el desarrollo (el código usa placeholders intercambiables — D5). Validar el estilo con 2-3 personas del público objetivo antes de encargar las 20 fases completas. |
| P6 | **La app es estéticamente imperfecta en el MVP** — dado que la estética es parte central de la propuesta de valor, entregar algo visualmente mediocre es un fracaso estratégico, no solo estético. | 🔴 Alto | Media | El sistema de diseño (paleta, tipografía, espaciado, animaciones) debe definirse **antes** del Sprint 1, no durante. El equipo de desarrollo debe tener una guía de estilo aprobada. Cada sprint incluye revisión de calidad visual por el dueño del proyecto antes de darlo por cerrado. |
| P7 | **Dependencia de Vimeo/AWS para vídeos** — si el proveedor cambia precios o tiene caídas, el reproductor de rutinas falla para todos los pacientes. | 🟢 Bajo | Baja | Diseñar el reproductor con una capa de abstracción: que cambiar el proveedor de vídeo sea un cambio de configuración, no una reescritura. Monitorizar uptime en producción. |

---

## 2. Riesgos de mercado y adopción

| # | Riesgo | Impacto | Probabilidad | Mitigación |
|---|--------|---------|--------------|------------|
| M1 | **Las clínicas no adoptan** — el fisio no tiene tiempo, no ve el valor o no quiere cambiar su flujo de trabajo habitual. La resistencia al cambio en salud es alta. | 🔴 Alto | Alta | El piloto debe ser con una clínica de confianza real (no un contacto frío). El onboarding para el profesional debe ser guiado y rápido (< 2 horas para estar operativo). El valor debe ser evidente en la primera semana: el panel de semáforos tiene que mostrar algo útil desde el primer día. |
| M2 | **El paciente no usa la app fuera de la consulta** — el profesional la adopta, pero los pacientes no la abren entre sesiones, vaciando el valor de seguimiento. | 🔴 Alto | Alta | El onboarding del paciente debe hacerse en consulta, no enviándole un link. El fisio lo inicia con el paciente delante. Las primeras 48 horas son críticas: notificación push de bienvenida + triaje inmediato. Medir tasa de activación (primer triaje completado) como métrica de alarma temprana. |
| M3 | **El mercado español de fisioterapia privada es más conservador de lo esperado** — las clínicas no ven la adherencia del paciente como su problema sino como responsabilidad del paciente. | 🟡 Medio | Media | Reencuadrar el mensaje de venta: el problema no es "que el paciente se constante" sino "que el paciente no vuelve a la clínica cuando mejora". El ingreso recurrente perdido es el argumento, no la adherencia en abstracto. |
| M4 | **Una gran competidora lanza un producto similar** — Hinge Health, Kaia o un actor nuevo ataca el mercado B2B2C español de clínicas con recursos superiores. | 🟡 Medio | Baja | El foso defensivo no es el producto — es la relación con las clínicas y los datos acumulados. Acelerar la construcción de esa red antes de que llegue competencia. La velocidad de los primeros 12 meses es crítica. |
| M5 | **El canal viral (Tarjetas Épicas, referidos) no funciona** — los pacientes no comparten su progreso en redes sociales, limitando el crecimiento orgánico. | 🟢 Bajo | Media | El crecimiento viral es importante pero no es la única palanca. El canal B2B de clínicas no depende de él. Si no funciona, no cambia el modelo core; se invierte más en el canal de clínicas. Testear el viral en el piloto con un grupo pequeño antes de apostar por él. |

---

## 3. Riesgos de ejecución y equipo

| # | Riesgo | Impacto | Probabilidad | Mitigación |
|---|--------|---------|--------------|------------|
| E1 | **El equipo de desarrollo entrega tarde o por debajo del nivel** — retrasos en los sprints o código de baja calidad que dificulta la escalabilidad. | 🔴 Alto | Media | Selección de equipo con portfolio demostrable en Flutter y Supabase (ver [`DOSSIER_DESARROLLO.md`](DOSSIER_DESARROLLO.md)). Contratos por entregables verificables, no por horas. Revisión obligatoria al final de cada sprint con demo real. |
| E2 | **El alcance del MVP se expande durante el desarrollo** — el dueño del proyecto pide funcionalidades nuevas mid-sprint; el equipo las acepta sin revaluar el plazo. | 🟡 Medio | Alta | Las decisiones cerradas (D1-D7) y el alcance del MVP están documentados y son vinculantes. Cualquier cambio de alcance requiere una decisión explícita con evaluación de impacto en tiempo y coste. El documento [`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md) §6 es la referencia única. |
| E3 | **Un proveedor clave (ilustrador, copywriter) falla** — el arte del avatar o los textos llegan tarde o no están a la altura, bloqueando sprints dependientes. | 🟡 Medio | Media | Contratar con suficiente antelación. Pedir y aprobar una muestra del estilo antes del encargo completo. El sistema de placeholders (D5) permite que el desarrollo avance sin el arte final. |
| E4 | **Dependencia excesiva de un solo desarrollador** — si el equipo es pequeño y una persona clave se va, el proyecto se paraliza. | 🟡 Medio | Media | Exigir documentación técnica mínima desde el Sprint 1. El código en GitHub es la fuente de verdad (no en la cabeza de nadie). Evaluar si el tamaño del equipo justifica un segundo desarrollador de respaldo. |
| E5 | **El dueño del proyecto no tiene tiempo suficiente** — el proyecto requiere decisiones rápidas y feedback constante; si el dueño está desbordado, los sprints se atascan esperando validación. | 🟡 Medio | Media | Definir con el equipo una cadencia clara: demo al final de cada sprint (fecha fija), máximo 48 horas para feedback. Las decisiones de negocio no bloquean código si están documentadas de antemano. |

---

## 4. Riesgos legales y de datos sanitarios

| # | Riesgo | Impacto | Probabilidad | Mitigación |
|---|--------|---------|--------------|------------|
| L1 | **Los datos de salud requieren tratamiento especial bajo RGPD** — el dolor, el historial de ejercicios y la Auditoría de Vitalidad son datos de categoría especial (art. 9 RGPD). Una gestión incorrecta puede derivar en sanciones graves. | 🔴 Alto | Alta | Consultar a un abogado especialista en RGPD y datos sanitarios **antes del lanzamiento**. Redactar política de privacidad, consentimiento informado y DPA (Data Processing Agreement) con las clínicas. Ver borrador en [`docs/PRIVACIDAD_RGPD.md`](PRIVACIDAD_RGPD.md) (pendiente de revisión legal). |
| L2 | **Responsabilidad si un paciente se lesiona siguiendo la app** — si el sistema prescribe un ejercicio y el paciente se hace daño, ¿quién responde? | 🔴 Alto | Baja | El modelo B2B2C es clave aquí: la app no prescribe — el **profesional** prescribe a través de la app. Los Packs los crea y asigna el fisio. Los textos de la app deben dejar claro que no sustituye al criterio clínico. Incluir un aviso legal en el onboarding. Revisar con abogado. |
| L3 | **Las tiendas de apps (Apple/Google) pueden rechazar o retirar la app** — las apps de salud tienen revisiones más estrictas; reclamaciones médicas, sin el respaldo clínico adecuado, pueden causar rechazo. | 🟡 Medio | Media | Revisar las políticas de apps de salud de Apple y Google antes del Sprint 1 (hay requisitos específicos). El posicionamiento de Anti Frágil es "herramienta de apoyo profesional", no "diagnóstico médico". Preparar la documentación necesaria para la revisión. |
| L4 | **Brecha de seguridad en datos de pacientes** — un acceso no autorizado a la base de datos expone información clínica sensible. | 🔴 Alto | Baja | Row Level Security (RLS) de Supabase es una primera capa de aislamiento (decisión D2). Auditoría de seguridad antes del lanzamiento. Política de accesos mínimos. Plan de respuesta ante incidentes definido antes de lanzar. |

---

## 5. Riesgos financieros

| # | Riesgo | Impacto | Probabilidad | Mitigación |
|---|--------|---------|--------------|------------|
| F1 | **El coste de desarrollo supera el presupuesto** — los 7 sprints resultan más complejos de lo estimado; el equipo cobra más de lo acordado o el proyecto se alarga. | 🔴 Alto | Media | Contratos por entregables cerrados, no por horas abiertas. Los sprints 1-3 (cimientos + onboarding + core loop) son los más críticos y los más predecibles; los riesgos técnicos mayores aparecen en Sprint 4 (motor de avatar). Tener un margen de contingencia del 20 % en el presupuesto. |
| F2 | **La clínica piloto no paga al terminar el piloto** — el piloto es gratuito, pero si la clínica no se convierte en cliente de pago, el modelo no se valida económicamente. | 🟡 Medio | Media | El piloto debe tener una conversación explícita sobre precio desde la semana 4. No sorprender a la clínica con una factura al final. La pregunta "¿pagarías por esto?" es parte del protocolo de seguimiento (ver [`PLAN_PILOTO.md`](PLAN_PILOTO.md)). |
| F3 | **El churn de clínicas es alto** — las clínicas prueban la herramienta pero la abandonan antes de los 6 meses, haciendo el modelo insostenible. | 🔴 Alto | Media | El churn de clínicas está directamente ligado al uso activo del profesional. Si el fisio no abre el panel 3+ veces por semana, la clínica abandona. Monitorizar esa métrica desde el día uno del piloto y actuar antes de que se enfríe. |
| F4 | **No se consigue financiación para escalar** — el piloto funciona pero sin inversión externa no hay capacidad para contratar equipo de ventas y crecer. | 🟡 Medio | Media | El conjunto de documentos de este repositorio (visión, proyecciones, análisis de competencia, plan de piloto) es ya la base de un pitch deck. Construir el caso de inversión en paralelo al piloto, con datos reales del piloto como prueba. |

---

## 6. Mapa de calor consolidado

> Los riesgos más urgentes (alto impacto + alta o media probabilidad) son los que
> necesitan acción ahora, antes del primer sprint.

| Urgencia | Riesgos | Acción inmediata |
|----------|---------|-----------------|
| 🚨 **Actuar antes del Sprint 1** | L1 (RGPD), L2 (responsabilidad), P6 (estética), E1 (selección equipo) | Contratar asesor legal, definir sistema de diseño, seleccionar equipo con portfolio demostrable. |
| ⚠️ **Actuar antes del piloto** | P1 (gamificación), P2 (triaje), P4 (motor avatar), M1 (adopción clínica), M2 (activación paciente) | Validar con fisioterapeutas el motor de XP; preparar onboarding guiado; plan de activación semana 1. |
| 📋 **Monitorizar desde el lanzamiento** | M3, E2, E3, F1, F3 | Métricas de seguimiento definidas; revisión mensual de este documento. |
| 🔭 **Vigilar a largo plazo** | M4 (competencia), F4 (inversión), P7 (dependencia vídeo) | No requieren acción inmediata pero hay que tenerlos en el radar. |

---

*Documentos relacionados: [`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md),
[`PLAN_PILOTO.md`](PLAN_PILOTO.md), [`DOSSIER_DESARROLLO.md`](DOSSIER_DESARROLLO.md),
[`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md).*
