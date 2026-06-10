# Onboarding y registro — Anti Frágil

> El embudo de entrada: desde que la clínica da de alta al paciente hasta que tiene su
> Guardián listo y entra al Core Loop. Pieza MVP (A1). La primera impresión: si es larga o
> fría, el paciente abandona el minuto uno. Diseño editable.

---

## 1. El embudo completo

```
[CLÍNICA, panel web]                 [PACIENTE, app móvil]
1. Da de alta al paciente   ───►   2. Descarga la app
   → genera Código de Honor          3. Mete email + Código de Honor  → queda vinculado a su clínica
                                      4. Anamnesis (cuestionario corto)
                                      5. Auditoría de Vitalidad (3-4 micro-tests)
                                      6. Sombrero Seleccionador: familia + elige 1 de 3 Guardianes
                                      7. ¡Avatar Huevo listo! → entra al Dashboard
```

> El paciente **no se registra solo desde cero**: entra **invitado por su clínica** (Código
> de Honor). Eso filtra (solo pacientes reales), vincula al tenant correcto y refuerza la
> autoridad clínica desde el segundo uno.

---

## 2. Principios para que no abandone

- **Corto y guiado:** un paso por pantalla, barra de progreso, "te quedan 2 minutos".
- **Promesa visible:** desde el inicio se ve que al final "nace tu Guardián" (recompensa clara).
- **Sin fricción innecesaria:** lo mínimo imprescindible; el resto se pide más adelante.
- **Empatía, no formulario médico frío:** tono cálido (coherente con el resto del producto).

---

## 3. Código de Honor (cómo funciona)

- Lo genera la clínica al dar de alta (campo `codigo_honor` en `pacientes`, único).
- El paciente lo introduce una vez → su cuenta queda ligada a esa clínica (multi-tenant).
- Editable: la clínica puede regenerarlo o invalidarlo si hace falta.

---

## 4. Qué pasa al terminar

- Se crea el registro en `auditorias_vitalidad` (puntuación 0-100).
- Se crea el `avatar` en Fase 1 (Huevo), con arquetipo asignado y XP de partida.
  → lógica en `sombrero_seleccionador.dart` y `auditoria_vitalidad.dart`.
- Se inicializan `monedero` (saldo 0) y `referido` (código único del paciente).
- El paciente aterriza en el Dashboard, listo para su primer Triaje.

---

## 5. Dónde vive

Pantallas en `app/lib/features/onboarding/`. Lógica de cálculo y asignación ya esbozada
(`auditoria_vitalidad.dart`, `sombrero_seleccionador.dart`). Datos: `pacientes`,
`auditorias_vitalidad`, `avatares` (`supabase/migrations/0001…`).

> MVP: registro con email + Código de Honor. Login social (Google/Apple) y recuperación
> avanzada de cuenta se pueden añadir después sin rehacer nada.
