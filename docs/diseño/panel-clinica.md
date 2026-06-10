# Panel web de la clínica — Anti Frágil

> La herramienta del profesional (fisio/clínica). Es la mitad B2B del producto: lo que hace
> que una clínica pague y retenga pacientes. Piezas MVP B1–B6b. Diseño editable.

---

## 1. Secciones del panel

| # | Sección | Qué permite |
|---|---------|-------------|
| B1 | **Login profesional** | Acceso del fisio/clínica (su tenant). |
| B4 | **Pacientes (semáforos)** | Lista de pacientes ordenada por alerta (rojo arriba). Vista de inicio. |
| B3 | **Ficha del paciente** | Todo sobre un paciente: Auditoría, histórico de dolor, sesiones y feedback. |
| B2 | **Alta de paciente** | Crear paciente + generar Código de Honor. |
| B5 | **Librería de vídeos** | Catálogo de ejercicios (enlaces Vimeo/AWS). |
| B6 | **Packs y prescripción** | Crear protocolos y asignarlos a pacientes. |
| B6b | **Plantillas de Auditoría** | Crear/editar sus propios tests (D7). |

---

## 2. La pantalla clave: Pacientes con semáforos 🚦

Es la pantalla de inicio del fisio. Cada paciente, una fila con su color:

- 🔴 **Rojo** (arriba): dolor alto o molestia nueva → atención hoy.
- 🟡 **Ámbar**: dolor medio sostenido o riesgo de abandono (días sin actividad).
- 🟢 **Verde**: todo en orden.

> Convierte la app en un **sistema de alerta temprana**: el fisio dedica su tiempo a quien
> lo necesita y **detecta abandonos antes de que ocurran**. Lógica en `alertas_semaforo.dart`.

---

## 3. La ficha del paciente (B3)

Reúne en un sitio:
- **Auditoría de Vitalidad**: inicial y re-auditorías (ver evolución 0-100 por bloques).
- **Histórico de dolor/energía**: del triaje diario (gráfico de tendencia).
- **Sesiones y feedback RPE**: qué hizo, su esfuerzo y molestias reportadas.
- **Avatar/adherencia**: fase, racha, constancia (indicador de enganche).
- Acciones: ajustar Pack, mandar mensaje/aviso, marcar revisión.

---

## 4. Configurable por profesional (D7)

Cada clínica gestiona **su propia** librería de vídeos, sus Packs y sus plantillas de
Auditoría. Nada se comparte ni se ve entre clínicas (aislamiento multi-tenant, ADR-002).

---

## 5. Técnico

- Mismo código base que la app móvil (Flutter Web — ADR-001), navegación con menú lateral.
- Esqueleto en `app/lib/features/clinica/panel_clinica_screen.dart`.
- Datos: `profesionales`, `pacientes`, `auditorias_vitalidad`, `triajes`, `sesiones`,
  `feedback_rpe`, `videos`, `packs`, `prescripciones`, `plantillas_auditoria`.
- Seguridad: un profesional solo ve pacientes de su `clinica_id` (reglas RLS).

> MVP: panel funcional y claro. Métricas de negocio avanzadas (adherencia agregada,
> informes) quedan para Fase 2.
