# Arquitectura Modular — el Esquema Maestro del MVP

> Directriz del dueño (2026-06-11): **no construimos un bloque de cemento, sino piezas de
> Lego.** Salimos con funciones básicas que FUNCIONEN y gusten, pero la base de datos y la
> interfaz están preparadas para actualizarse por módulos/Temporadas sin reescribir nada
> (*plug & play*). Lo sanitario (tests, valoración, acompañamiento clínico) se mantiene
> fuerte desde el día 0 — lo que se simplifica es la tecnología, no el cuidado.
>
> Sandbox real B2B2C: el centro **Lidomare** (código de ejemplo: `LIDOMARE26`).

---

## Módulo 1 · Registro dual (B2C + B2B2C) — Decisión D8

| Vía | Cómo entra | Qué ve |
|-----|-----------|--------|
| **Abierta (B2C)** | Email + contraseña, sin código. | Interfaz estándar Anti Frágil. |
| **Partner (B2B2C)** | Email + **Código de Centro** (ej. `LIDOMARE26`). | Acentos de color del centro, **avatar/skin exclusivo del partner**, opciones presenciales priorizadas. |

- En datos: `pacientes.clinica_id` pasa a ser **opcional** (un B2C no tiene centro) y se añade
  `origen` (`b2c` | `partner`). El Código de Honor individual sigue existiendo para altas
  hechas por la clínica; el Código de Centro es colectivo y da de alta en autoservicio.
- La personalización por centro usa `clinicas.marca` (ya previsto en D2 — marca blanca suave).

## Módulo 2 · Menú de Movimiento (bifurcación diaria) — Decisión D10

Tras el triaje diario (que NO cambia: dolor/energía 1-10, guardando el dato para el futuro
algoritmo), el usuario elige cómo cumple hoy:

- **Opción A · Presencial:** "Hoy entreno/voy a sesión en {centro}". Se verifica **escaneando
  el QR impreso en recepción** (ver decisión abajo). Genera registro en `asistencias`.
- **Opción B · En casa:** vídeo (Vimeo embebido) o PDF visual de su rutina, gestionado por el
  equipo clínico desde el panel (low-tech: contenido estático bien presentado).

**Verificación presencial = QR estático en recepción** (recomendación del arquitecto,
validada por la regla "el avatar es el espejo honesto"): botón de honor solo como excepción
configurable y marcado como "no verificado".

**Recomendación inteligente de servicios del centro (D8b):** la app conoce el catálogo del
partner (en Lidomare — lidomare.es —: sus clases, fisioterapia, entrenos) vía la tabla
`servicios_centro`. Si el usuario es del centro, sus rutinas recomiendan **actividades reales
de SU centro** según el objetivo del día ("hoy toca movilidad → Pilates 19h en Lidomare"),
con su **equivalente en casa** (`equivalencias_servicio`) si no puede ir. Eso convierte la
app en canal de venta del centro (cross-selling B2B2C) sin perder al usuario B2C, que recibe
siempre la versión en casa.

## Módulo 3 · Gamificación por Temporadas — Decisión D9

El código NO está atado a "un avatar de N niveles". Estructura:

- Tabla `seasons`: cada temporada de avatares tiene su `season_id`, sus fases y su arte.
- **Season 0 (lanzamiento):** versión simple del sistema de 30 fases — salimos con
  **3-4 cambios visuales** (Huevo → Cría/Blob → Guardián básico → forma final S0) condicionados
  por XP. El sistema de 30 fases (`fases_avatar`) queda como el mapa completo al que se
  migra en temporadas siguientes sin reescribir nada (el catálogo ya es data, no código).
- **Skins de partner:** identificador en datos para texturas/colores exclusivos (ej. "Avatar
  Exclusivo Lidomare").
- **El Legado / Vitrina de Trofeos:** al cambiar de temporada, el avatar anterior se archiva
  y se muestra en la vitrina del perfil. Nada se pierde — la colección es retención pura.

## Módulo 4 · Módulo clínico low-tech (con vistas al futuro) — Decisión D11

- Pestañas **"Nutrición"** y **"Fisioterapia Avanzada"** visibles desde el día 0.
- Estado MVP: contenido estático curado (PDFs visuales, vídeos básicos) — el acompañamiento
  sanitario completo lo ponen las personas, no la tecnología.
- **Placeholders medibles:** botones "Próximamente" (ej. *"Escaneo de platos con IA"*,
  *"Algoritmo preventivo de lesiones"*) que **registran los clics** → validamos interés real
  antes de gastar en programarlo.

## Módulo 5 · Motor económico y retención visual (sin cambios de fondo)

- **Descuento Sudado** (la "Billetera de Sudor" — mismo concepto, el léxico oficial lo fija
  `diseño/lexico-marca.md`): bajada de cuota simulada en pantalla; cobro real en recepción
  del centro o web externa (D6 intacta).
- **Compartir logros:** exportar la Tarjeta Épica / captura del avatar a Instagram/WhatsApp.

## Límites de desarrollo (sin cambios — la Nevera sigue cerrada)

1. Nada de IA / ML / visión computacional. 2. Nada de wearables. 3. Nada de pagos in-app.
4. Cero social interno (sin amigos, chat ni rankings globales todavía).

---

## Qué cambia respecto a los documentos anteriores (conciliación)

| Antes | Ahora |
|-------|-------|
| Solo alta vía clínica (Código de Honor). | **Registro dual**: B2C libre + Código de Centro (D8). El Código de Honor individual se mantiene para altas clínicas. |
| Avatar: 30 fases desde el día 1. | Las 30 fases siguen siendo el mapa; **Season 0 lanza con 3-4 formas** y se expande por temporadas (D9). El coste de arte inicial baja muchísimo. |
| Rutina = solo vídeos prescritos en app. | **Bifurcación diaria casa/presencial** con verificación QR (D10). |
| Sin módulo de nutrición en MVP. | Pestañas low-tech con contenido estático + placeholders que miden interés (D11). |

> Los prototipos y docs existentes siguen siendo válidos como visión; el equipo construye la
> Season 0 con este esquema. La especificación fina se actualiza en `ESPECIFICACION_MVP.md`.
