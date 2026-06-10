# Revisión crítica — control de calidad del proyecto

> Documento vivo de QA. Estamos construyendo la base de una app "muy top": **sin prisa y
> medido al milímetro.** Aquí se registran incoherencias detectadas, decisiones a afinar y
> cosas a vigilar. Cada cosa que se haga (mía o de los agentes) debe pasar el filtro crítico.

## Principio
- **Sé crítico con todo.** Antes de dar algo por bueno: ¿es coherente con el resto? ¿se
  siente personal y profesional? ¿hay números que no cuadran? Si dudas, revísalo.

---

## ✅ Incoherencias detectadas y corregidas

| # | Problema | Corrección | Fecha |
|---|----------|-----------|-------|
| C1 | Al pasar de 20 a 30 fases, la maqueta decía "Fase 10 = Guardián Pleno" (en el catálogo de 30, fase 10 = "Forma Incipiente"; Guardián Pleno = fase 16). | Maqueta actualizada a "Fase 16 · Guardián Pleno · Nivel 50". | 2026-06-10 |
| C2 | Datos de demo: avatar nivel 47 con fase 10 (incoherente; nivel 47 ≈ fase 15 según `nivel_min`). | Demo ajustada a nivel 50 / fase 16 (coherente con `fases_avatar`). | 2026-06-10 |

---

## ⚠️ Puntos a afinar (no son errores, pero hay que calibrarlos)

- **Curva XP→nivel** (`avatar_evolucion.dart`) vs `nivel_min` de las 30 fases: hay que
  calibrar con datos del piloto para que los saltos de fase ocurran a un ritmo motivador
  (ni demasiado rápido ni eterno). Hoy son valores de ejemplo.
- **Economía de puntos** (`economia_puntos.dart`): los XP por acción son orientativos;
  validar que la "regla de oro" (mejora real > actividad) se cumple en la práctica.
- **Puertas clínicas**: los umbrales (rachas, mejoras de Auditoría) los debe validar el
  equipo clínico — no son verdad médica todavía.
- **Plantillas de Auditoría (D7)**: cada bloque no debe superar su tope (30/30/20/20). El
  panel de la clínica debe validar esto al crear plantillas.

---

## 🔭 Cosas a vigilar en lo que viene

- Coherencia de los documentos de los agentes con `ESPECIFICACION_MVP.md` (manda la spec).
- Que ninguna pantalla quede "genérica" (ver `diseño/personalizacion-y-detalles.md`).
- Que no se cuele nada de la Nevera/Visión Norte en el alcance del MVP.
- Consistencia de nombres de fases entre: catálogo SQL (`0002`), doc (`avatar-evolucion.md`),
  lógica (`avatar_evolucion.dart`) y maquetas.

> Para los agentes: antes de confirmar una tarea, repasad este filtro. Si algo no cuadra con
> la spec o con el catálogo de fases, avisad en vuestro `ESTADO.md`.
