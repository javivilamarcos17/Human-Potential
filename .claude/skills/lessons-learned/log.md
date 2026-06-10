# Lessons Learned — Log de lecciones aprendidas

> Este archivo es la memoria persistente del proyecto.
> Claude lo lee al inicio de cada sesión para no repetir errores.
> **No borrar entradas antiguas** — son el historial de aprendizaje.

---

## Cómo añadir una lección

Di a Claude: `/nueva-leccion`
O directamente: *"Anota esto como lección aprendida: [descripción]"*

## Formato estándar

```markdown
## YYYY-MM-DD HH:MM — [Título corto]

**Error o aprendizaje:** [Qué pasó]
**Causa raíz:** [Por qué ocurrió]
**Lección:** [Qué hacer diferente en el futuro]
**Contexto:** [Dónde aplica — siempre, en ciertos módulos, etc.]
```

---

<!-- Las lecciones se añaden debajo de esta línea -->

## 2026-06-10 15:30 — La Auditoría/tests son configurables por profesional, no un test fijo

**Error o aprendizaje:** Diseñé la Auditoría de Vitalidad como una rúbrica cerrada y única (ejercicios y umbrales fijos para todos). El dueño aclaró que la Auditoría y los tests se especializarán muchísimo por profesionales: cada clínica/profesional define sus propios protocolos según su especialidad.
**Causa raíz:** Asumí un test estándar único en lugar de preguntar por el grado de personalización que necesita el negocio. En un producto B2B2C para clínicas heterogéneas, la configurabilidad es un requisito de base, no un extra.
**Lección:** Lo estable es el MARCO (4 bloques, escala 0-100, ejes constancia/mejora). Lo VARIABLE (ejercicios concretos, preguntas, umbrales, protocolos) debe ser configurable por clínica/profesional desde el diseño y el modelo de datos. Ante diseños de dominio, preguntar el grado de personalización antes de fijar contenido.
**Contexto:** Aplica a Auditoría de Vitalidad, micro-tests, Packs/rutinas y, en general, a todo "contenido clínico": debe poder especializarse por profesional. Ver docs/diseño/auditoria-vitalidad.md.
