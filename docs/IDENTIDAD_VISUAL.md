# IDENTIDAD VISUAL — Anti Frágil

> Guía práctica para diseñador e ilustrador. Define quiénes somos visualmente,
> cómo hablamos y qué sensación debe provocar cada elemento de la marca.
> Documento vivo: actualizar cuando el equipo de diseño tome decisiones definitivas.

---

## 1. Personalidad de marca — quién es Anti Frágil

Anti Frágil no es una app de fitness. No es una clínica fría. Es algo nuevo:
**un compañero de recuperación que entiende que la vida real no es lineal**.

La marca tiene tres facetas que conviven:

| Faceta | Qué significa | Cómo se nota |
|--------|--------------|--------------|
| **Empatía clínica** | Hablamos con la autoridad de un profesional de salud, pero sin juzgar. | Tono cálido y directo. Sin "fallaste". Sin números rojos que asustan. |
| **Nostalgia de criatura** | Ese vínculo emocional con un ser que crece contigo, como un Tamagotchi con sentido clínico. | El Guardián es lo primero que ves. Su estado importa más que cualquier métrica. |
| **Orgullo de progreso real** | Cada evolución del avatar se ha ganado de verdad. No es cosmética: es un logro físico medible. | Los hitos se celebran con contundencia. El ascenso se siente épico. |

### Arquetipo de marca: el mentor que ya estuvo donde estás tú.

No es el entrenador que grita. No es la app que te juzga. Es el guía que sabe lo que cuesta levantarse con dolor y te dice *"hoy hacemos lo que puedas, y eso es suficiente"*.

---

## 2. Paleta de colores

### Colores principales

| Nombre | Hex | Uso |
|--------|-----|-----|
| **Verde Vitalidad** | `#2ECC8F` | Color de marca principal. CTA, niveles, XP, éxito. |
| **Azul Clínico** | `#1A2E4A` | Fondo oscuro principal. Panel de la clínica. Autoridad. |
| **Blanco Cálido** | `#F5F3EE` | Fondo claro. Texto sobre oscuro. Limpieza sin frialdad. |
| **Gris Neutro** | `#8A9BB0` | Texto secundario, etiquetas, separadores. |

### Colores de acento (semáforos y estado)

| Nombre | Hex | Uso |
|--------|-----|-----|
| **Rojo Alerta** | `#E53935` | Dolor alto (>7). Alerta clínica. Solo cuando importa de verdad. |
| **Ámbar Precaución** | `#FFA726` | Dolor medio, racha pausada. Aviso, no castigo. |
| **Índigo Épico** | `#5C6BC0` | Hitos legendarios, fase Deidad, Tarjetas Épicas. Magia y rareza. |
| **Dorado Logro** | `#F4C430` | Desbloqueables, Retos Maestros superados, la Trinidad del Nivel 100. |

### Colores por arquetipo (tinte del avatar y UI asociada)

| Arquetipo | Color base | Hex | Sensación |
|-----------|-----------|-----|-----------|
| **Tierra** 🪨 | Terracota profundo | `#8B4513` → `#C4813A` | Sólido, imparable, mineral. |
| **Agua** 💧 | Azul turquesa suave | `#0097A7` → `#80DEEA` | Fluido, calmante, adaptable. |
| **Viento** 🌬️ | Verde jade vivo | `#43A047` → `#A5D6A7` | Rápido, explosivo, vivo. |
| *(Fuego — Fase 2)* | Naranja bermellón | `#D84315` → `#FF8A65` | Reservado. |
| *(Metal — Fase 3)* | Plateado acerado | `#455A64` → `#B0BEC5` | Reservado. |

> Regla: el color del arquetipo tiñe el avatar y sus efectos visuales (aura, brillo, partículas), pero **nunca reemplaza** los colores de marca en la UI funcional.

### Regla de uso del rojo

El rojo `#E53935` se reserva exclusivamente para **alertas clínicas reales** (dolor >7, molestia nueva). Usarlo para decoración o error trivial destruye su señal. Si algo no requiere acción urgente del profesional, usa ámbar.

---

## 3. Tipografía

### Tipografías propuestas (ambas gratuitas en Google Fonts)

| Rol | Familia | Peso | Uso |
|-----|---------|------|-----|
| **Titulares** | `Nunito` | Bold (700) / ExtraBold (800) | Nombre del Guardián, fases, hitos épicos, pantalla de logro. |
| **Cuerpo y UI** | `Inter` | Regular (400) / Medium (500) / SemiBold (600) | Todo el texto funcional: triaje, labels, mensajes, botones. |
| **Números y métricas** | `Inter` | Bold (700) con variante tabular (`font-variant-numeric: tabular-nums`) | XP, nivel, puntuación de auditoría, dolor (1-10). |

### Escala tipográfica (móvil)

| Nivel | Tamaño | Uso |
|-------|--------|-----|
| Display | 32–40 sp | Nombre del arquetipo en pantalla de bienvenida. |
| H1 | 24 sp | Nombre de fase del avatar. |
| H2 | 20 sp | Título de sección (triaje, pack de rutina). |
| Body | 16 sp | Texto principal de mensajes y UI. |
| Caption | 13 sp | Etiquetas, timestamps, texto secundario. |

> En Flutter, usar `ThemeData.textTheme` con `fontFamily: 'Inter'` para body y definir un `displayLarge` con `Nunito` para titulares.

---

## 4. Iconografía y estilo visual general

- **Estilo de iconos:** línea redondeada (2 px), esquinas suaves. Sin aristas. Biblioteca recomendada: [Lucide Icons](https://lucide.dev) (Flutter: `lucide_flutter`).
- **Bordes y tarjetas:** `border-radius` generoso (16–24 px). Todo es suave; no hay ángulos agresivos.
- **Sombras:** suaves y bajas (elevación 2–4 dp). Nunca sombras duras que parezcan Web de los 2000.
- **Fondos:** el fondo oscuro (`#1A2E4A`) en el panel de la clínica; el fondo cálido (`#F5F3EE`) en la app del paciente durante el onboarding y el triaje. El avatar siempre sobre fondo oscuro o degradado para que brille.
- **Degradados:** permitidos solo en el avatar y en las Tarjetas Épicas. En el resto de la UI, fondos planos.

---

## 5. El Guardián (avatar) — guía para el ilustrador

### Principio central

> El avatar es un espejo honesto, no una mascota simpática.
> Tiene que sentirse **vivo, con peso emocional**, no decorativo.

### Estilo de ilustración

- **Técnica:** ilustración digital 2D. Limpia, con líneas definidas pero no rígidas. Inspiración: criaturas de juegos de rol estilizados (no infantiles, no hiperrealistas). Punto de referencia tonal: *Hollow Knight*, *Ori*, primeras generaciones de *Pokémon* — profundidad emocional en formas simples.
- **Proporciones:** cabeza grande, cuerpo compacto. Transmite fragilidad en las primeras fases, potencia y presencia en las últimas.
- **Expresión:** los ojos son la clave. En fases bajas: curiosos, inseguros. En fases altas: serenos, poderosos. **Nunca agresivos.** La fortaleza no se muestra con rabia, sino con calma.
- **Líneas:** peso de línea variable (más grueso en el contorno exterior, más fino en detalles internos). Sin outlines rígidas iguales en todo.

### Los 4 arcos de evolución visual

| Arco | Etapa | Fases | Sensación que debe transmitir |
|------|-------|-------|-------------------------------|
| 🌱 **La Semilla** | Huevo → Cría | 1–9 | Fragilidad, potencial oculto. Algo que está a punto de nacer. |
| 🔨 **La Forja** | Joven → Guardián | 10–20 | Crecimiento, determinación, materializando una identidad. |
| 🕊️ **El Ascenso** | Alado | 21–27 | Ligereza ganada, no regalada. La salud como modo de vida. |
| 👑 **El Olimpo** | Deidad | 28–30 + Legendario | Trascendencia serena. No arrogancia: completitud. |

### Los 3 arquetipos — sensación cromática y de forma

| Arquetipo | Forma | Textura | Paleta | Nota para el ilustrador |
|-----------|-------|---------|--------|------------------------|
| **Tierra** 🪨 | Maciza, baja, anclada al suelo. | Piedra, roca, corteza. | Terracotas, ocres, marrones profundos. | Comunica permanencia. En fases altas, imponente como un monolito vivo. |
| **Agua** 💧 | Fluida, curvas suaves, sin ángulos. | Agua, niebla, cristal. | Azules y turquesas, con reflejos internos. | Comunica adaptación. En fases altas, translúcida y envolvente. |
| **Viento** 🌬️ | Ligera, dinámica, silueta en tensión. | Plumas, hojas, corrientes de aire. | Verdes vivos, blancos, con trazos de velocidad. | Comunica energía contenida. En fases altas, casi incorpórea, como si fuera a volar. |

### El estado "aletargado" (cuando abandona)

El Guardián no muere. **Se adormece.** Guía visual:
- Pierde saturación de color (desvanece hacia gris, ~40% opacidad en el color de arquetipo).
- Los ojos se cierran o miran hacia abajo.
- Una pequeña animación de respiración lenta (loop idle) lo mantiene vivo.
- Al volver: animación de despertar cálida (se sacude, abre los ojos, el color vuelve).

> El mensaje visual: *"Te estaba esperando."* Nunca: *"Me fallaste."*

### Capas de efectos para las sub-fases (coste de arte controlado)

El ilustrador entrega **6 bases × 3 arquetipos = 18 piezas principales**. Las sub-fases se construyen con capas superpuestas:

| Tipo de capa | Ejemplos |
|-------------|---------|
| **Brillo / aura** | Halo suave que crece en intensidad con la fase. |
| **Accesorios** | Pequeña marca en la frente, símbolo en el pecho, marca en los ojos. |
| **Grietas luminosas** | En el huevo, grietas que dejan escapar luz. |
| **Postura** | El mismo arte base, ligeramente inclinado hacia adelante (fases jóvenes) o erguido (fases adultas). |
| **Partículas** | Pequeños fragmentos flotando alrededor (chispas, hojas, gotas) en fases altas. |

---

## 6. Guía de copy — mensajes que NO culpan

### El principio fundamental

> El usuario ya se siente mal cuando no cumple. Nuestra única tarea es que **siga**.
> Castigar = abandono definitivo. Acoger = recuperación.

### Lo que hacemos vs. lo que nunca hacemos

| Situación | ❌ NUNCA digas | ✅ SÍ di |
|-----------|--------------|---------|
| No entró ayer | "Rompiste tu racha de 5 días" | "Tu Guardián te echó de menos. ¿Empezamos hoy?" |
| Dolor alto reportado | "Hoy no puedes entrenar" | "Con ese dolor, hoy toca cuidarse. Tu clínica lo sabe." |
| Terminó una sesión difícil | "¡Completaste tu rutina!" (neutro) | "Lo lograste. Eso que sientes ahora se llama antifrágil." |
| Primer día | "Completa tu perfil" | "Tu Guardián está a punto de nacer. Cuéntanos cómo estás." |
| Desbloquea una fase | "Nueva fase desbloqueada" | "Tu [nombre del Guardián] acaba de evolucionar. No es magia: eres tú." |
| Semana sin entrar | "Llevas 7 días sin actividad" | "Sabemos que la vida complica. Tu Guardián sigue aquí. Sin juicios." |
| RPE muy alto | "Esfuerzo excesivo detectado" | "Eso requirió mucho de ti hoy. ¿Todo bien? Tu clínica lo ve." |
| Referido que se une | — | "Alguien que cuidas empieza su viaje. Eso también cuenta." |

### Tono por pantalla

| Pantalla | Tono | Ejemplo |
|----------|------|---------|
| **Triaje diario** | Cercano, sin juicio | "Hola. Antes de empezar: ¿cómo está tu cuerpo hoy?" |
| **Rutina en marcha** | Motivador, presente | "Vas bien. Un paso más." |
| **Post-sesión** | Cálido, celebratorio con medida | "Hecho. Tu Guardián lo notará." |
| **Alerta clínica** | Claro, sin alarmar | "Tu fisio puede ver esto. Si tienes dudas, escríbele." |
| **Hito épico** | Épico, con peso emocional | "Nivel 20. La Forja ha terminado. Esto ya no desaparece." |
| **Panel clínica** | Profesional, directo | "3 pacientes con dolor >7 esta semana. Revisión recomendada." |

### Voz de la marca — 5 adjetivos

1. **Honesta** — sin eufemismos, sin promesas imposibles.
2. **Cálida** — como un profesional que conoce tu nombre.
3. **Épica con moderación** — los hitos grandes merecen grandeza; lo cotidiano, sencillez.
4. **Clínica sin frialdad** — la autoridad viene de los datos, no del tono.
5. **Paciente** — nunca urgente, nunca ansiosa.

### Palabras que usamos / que evitamos

| ✅ Usamos | ❌ Evitamos |
|-----------|------------|
| Guardián, evolución, constancia | Fallar, retraso, incumplir |
| Vitalidad, progreso, cuidado | Calorías quemadas, déficit |
| Antifrágil, fortaleza, superación | Perfecto, ideal, sin excusas |
| Hoy, un día a la vez | Siempre, nunca, tienes que |
| Tu clínica, tu equipo | El sistema, la plataforma |

---

## 7. Las Tarjetas Épicas — guía visual para el equipo

Las imágenes que el usuario comparte en Instagram/TikTok son **la publicidad orgánica de Anti Frágil**. Deben ser bellas por sí solas.

- **Formato:** vertical (9:16), optimizado para stories.
- **Composición:** avatar centrado (ocupa el 50–60% de la altura), nombre de la fase en tipografía grande (`Nunito ExtraBold`), nivel y arquetipo en la esquina inferior, frase épica generada en la parte baja.
- **Fondo:** degradado oscuro del arquetipo (ej. azul profundo para Agua, terracota para Tierra) con partículas o efectos del arquetipo.
- **Logo:** pequeño, esquina superior. Nunca protagonista: el protagonista es el Guardián del usuario.
- **Frase épica:** una línea. Ejemplos de tono: *"La Forja ha terminado."* / *"Un año. Un cuerpo nuevo."* / *"Lo que no te rompe, te define."*

---

*Documento creado para el equipo de diseño e ilustración del MVP v1.5.*
*Actualizar cuando el diseñador valide o cambie paleta, tipografía o estilo del avatar.*
