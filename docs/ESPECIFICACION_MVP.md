# Especificación del MVP v1.5 — al milímetro

> El "plano de obra" preciso: pantalla por pantalla, campo por campo, regla por regla.
> Objetivo: que un equipo pueda construir el MVP **sin interpretar nada**. Documento vivo.
> Complementa (no repite) los diseños de `docs/diseño/`. Si algo choca, manda este documento.

**Alcance:** solo lo marcado 🟢 MVP en `PROPUESTA_DE_VALOR.md` §6. Nada de la Nevera/Visión Norte.

---

## A. App del paciente (Flutter móvil)

### A1 · Onboarding / Registro
**Pantallas:** Bienvenida → Código de Honor → Anamnesis → Auditoría → Sombrero → Avatar listo.
| Campo / acción | Tipo | Validación / regla |
|----------------|------|--------------------|
| Email | texto | formato email; único por clínica |
| Código de Honor | texto | debe existir y estar activo; vincula a `clinica_id` |
| Anamnesis (objetivo, salud, hábitos) | formulario | banderas rojas → marca aviso a clínica |
| Resultado | — | crea `paciente`, `auditoria`, `avatar` (fase 1), `monedero`, `referido` |

**Hecho cuando:** el usuario aterriza en el Dashboard con su Guardián (Huevo) asignado.

### A2 · Auditoría de Vitalidad
- 4 bloques → total 0-100 (ver `diseño/auditoria-vitalidad.md`).
- Usa la **plantilla por defecto** de la clínica (`plantillas_auditoria.es_default`).
- Cada ítem: enunciado + (vídeo de instrucción opcional) + respuesta (número/segundos/Sí-No/escala).
- Guarda `auditoria` + `auditoria_respuestas`. MVP: cálculo con plantilla de ejemplo fija.

### A3 · Sombrero Seleccionador
- Algoritmo asigna arquetipo (`sombrero_seleccionador.dart`) → ofrece 3 Guardianes → elige 1.
- Regla: el avatar nace en **fase 1**; XP de partida según Auditoría.

### A5 · Dashboard
**Muestra:** avatar (según `fase_visual`), barra XP (al siguiente nivel), racha, botón "rutina de hoy", acceso a monedero/tarjetas.

### A6 · Triaje diario
| Campo | Tipo | Regla |
|-------|------|-------|
| Dolor | 1-10 | obligatorio; ≥8 → semáforo rojo |
| Energía | 1-10 | obligatorio |
- 1 por día. Si dolor alto/energía baja → sugiere rutina suave. Suma XP triaje (+5).

### A7 · Rutina (Pack prescrito)
- Reproduce vídeos del Pack activo (`prescripciones.activa = true`) en orden.
- Marca cada ejercicio hecho → crea `sesion`. Al acabar → A8 (obligatorio).

### A8 · Feedback RPE
| Campo | Tipo | Regla |
|-------|------|-------|
| Esfuerzo (RPE) | 1-10 | obligatorio |
| Molestia nueva | Sí/No | Sí → semáforo rojo a la clínica |
| Nota | texto | opcional |
- Guarda `feedback_rpe`. Otorga XP (rutina+feedback+bonus racha). Recalcula nivel/fase.

### A9 · Monedero (Descuento Sudado)
- Muestra saldo (visual, sin pago). Lógica en `descuento_sudado.dart`. Suelo de cuota protegido.

### A10 · Referidos
- Muestra código único del paciente. Alta con código → descuento a ambos (`referidos`).

### A11 · Tarjetas Épicas
- Genera imagen vertical (avatar+nivel+frase) → compartir (share_plus). Sin red social interna.
- Pie de tarjeta: firma de autoridad clínica con nombre de la clínica (ver `diseño/copy-tarjetas-epicas.md`) + (opcional) código de referido.

### A12 · Upselling
- Banner si dolor alto o estancamiento → enlace a web/WhatsApp de la clínica.

---

## B. Panel web de la clínica (Flutter Web)

| Pantalla | Contenido / reglas |
|----------|--------------------|
| B1 Login | profesional ligado a su `clinica_id` |
| B4 Pacientes (semáforos) | lista ordenada por alerta (rojo→ámbar→verde); lógica `alertas_semaforo.dart` |
| B3 Ficha paciente | Auditoría + histórico dolor + sesiones + feedback + avatar/adherencia |
| B2 Alta paciente | crear paciente + generar Código de Honor único |
| B5 Librería vídeos | CRUD de vídeos (título, url Vimeo/AWS, objetivo) |
| B6 Packs + prescripción | crear Pack (vídeos+orden) y asignar a paciente |
| B6b Plantillas Auditoría | crear/editar tests propios (D7) |

**Regla transversal:** un profesional solo ve datos de **su** `clinica_id` (RLS).

---

## C. Backend (Supabase)
- Esquema: `supabase/migrations/0001`, `0002` (avatar), `0003` (plantillas).
- **RLS obligatoria** en todas las tablas con datos de paciente antes de cualquier despliegue.
- Almacenamiento: imágenes de avatar (placeholders) y miniaturas.

---

## D. Definición de "Terminado" del MVP
El MVP está listo para el piloto cuando:
1. Un paciente puede: registrarse con Código de Honor → hacer Auditoría → recibir avatar →
   completar el Core Loop diario (triaje+rutina+feedback) → ver su avatar evolucionar.
2. Una clínica puede: dar de alta pacientes, crear/prescribir Packs, editar su plantilla de
   Auditoría y ver los semáforos.
3. RLS activa (aislamiento entre clínicas verificado).
4. Publicado en App Store / Google Play (o build instalable para el piloto).

> Lo que NO entra (verificar que no se cuela): pagos in-app, wearables, IA generativa,
> red social interna, visión artificial. (Nevera / Visión Norte.)
