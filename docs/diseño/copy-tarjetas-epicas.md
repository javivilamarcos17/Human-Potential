# Copy de Tarjetas Épicas — Anti Frágil

> Las Tarjetas Épicas son el contenido compartible de la app: imagen con el avatar,
> el nivel y una frase. Son la prueba pública de que algo real ha pasado en el cuerpo
> del usuario.
>
> **Criterio de calidad:** la frase debe poder publicarse en redes sociales y que quien
> la lea sienta algo — aunque no conozca la app. Sin referencias internas ("nivel 7",
> "fase 3"): el hito se narra, no se etiqueta.

---

## Anatomía de una Tarjeta Épica

```
┌─────────────────────────────────┐
│  [Avatar del Guardián]          │
│                                 │
│  {nombre}                       │
│  Nivel {nivel} · {nombre_fase}  │
│                                 │
│  "{frase épica}"                │
│                                 │
│  Prescrito por {fisio}          │
│  {clinica} · Anti Frágil        │
└─────────────────────────────────┘
```

**Variables disponibles:** `{nombre}`, `{nivel}`, `{nombre_fase}`, `{fisio}`, `{clinica}`, `{arquetipo}`, `{avatar_nombre}`, `{racha}`.

**Regla:** la frase épica varía por **arquetipo** × **hito**. Nada genérico.

---

## Hitos que generan Tarjeta Épica

| Código | Hito | Trigger |
|--------|------|---------|
| `R7` | Racha 7 días | Core Loop completado. racha == 7 |
| `R14` | Racha 14 días | racha == 14 |
| `R21` | Racha 21 días | racha == 21 |
| `R30` | Racha 30 días | racha == 30 |
| `R60` | Racha 60 días | racha == 60 |
| `R90` | Racha 90 días | racha == 90 |
| `F5` | Fase 5 desbloqueada | Avatar sube a Fase 5 |
| `F10` | Fase 10 desbloqueada | Avatar sube a Fase 10 |
| `F16` | Fase 16 — Guardián Pleno | Avatar sube a Fase 16 |
| `F30` | Fase 30 — Guardián Supremo | Avatar sube a Fase 30 |
| `A1` | Primera Re-Auditoría con mejora | score_hoy > score_anterior |
| `A+` | Mejora de +10 puntos en Auditoría | diferencia_score >= 10 |

---

## Frases por arquetipo

### Arquetipo AGUA · Guardián: Kael el Fluido

| Hito | Frase |
|------|-------|
| R7 | *"Siete días de fluidez. El agua siempre encuentra su camino."* |
| R14 | *"Dos semanas. La corriente no para."* |
| R21 | *"Veintiún días seguidos. El agua moldea la roca."* |
| R30 | *"Un mes en movimiento. Nada me detiene."* |
| R60 | *"Dos meses de fluidez constante. Ya soy el río."* |
| R90 | *"Noventa días. El agua que fluye no se oxida."* |
| F5 | *"El agua toma su forma. Yo también."* |
| F10 | *"En el fondo del río, todo es calma y fuerza."* |
| F16 | *"Guardián Pleno. Kael y yo hemos llegado juntos."* |
| F30 | *"El agua ha alcanzado el océano. Nada queda por temer."* |
| A1 | *"Los números no mienten. Mi cuerpo ha cambiado."* |
| A+ | *"Diez puntos arriba. La fluidez tiene recompensa."* |

---

### Arquetipo FUEGO · Guardián: Ignis el Incandescente

| Hito | Frase |
|------|-------|
| R7 | *"Siete días de fuego. Esto apenas empieza."* |
| R14 | *"Dos semanas encendido. El fuego no pide permiso."* |
| R21 | *"Veintiún días. La llama que no se apaga ya es una hoguera."* |
| R30 | *"Un mes de fuego. La fuerza no es un accidente."* |
| R60 | *"Sesenta días ardiendo. El fuego ya es parte de mí."* |
| R90 | *"Noventa días. Lo que empezó como una chispa ya es un incendio."* |
| F5 | *"El fuego ha encontrado su centro."* |
| F10 | *"A esta temperatura, nada se rompe. Todo se forja."* |
| F16 | *"Guardián Pleno. Ignis y yo somos lo mismo."* |
| F30 | *"El fuego ha alcanzado su forma suprema. Imparable."* |
| A1 | *"Los números no mienten. Mi cuerpo responde."* |
| A+ | *"Diez puntos arriba. El fuego tiene recompensa."* |

---

### Arquetipo TIERRA · Guardián: Gaia la Firme

| Hito | Frase |
|------|-------|
| R7 | *"Siete días firme. La constancia construye montañas."* |
| R14 | *"Dos semanas de tierra. Sólido como siempre."* |
| R21 | *"Veintiún días. La tierra no tiembla."* |
| R30 | *"Un mes. La constancia es mi superpoder."* |
| R60 | *"Sesenta días. Ya soy la montaña."* |
| R90 | *"Noventa días de tierra. Lo que se construye despacio, dura para siempre."* |
| F5 | *"La tierra ha echado raíces. Nadie me mueve."* |
| F10 | *"En la profundidad de la tierra, todo tiene fundamento."* |
| F16 | *"Guardián Plena. Gaia y yo compartimos la misma fuerza."* |
| F30 | *"La tierra ha alcanzado su cima. Inamovible."* |
| A1 | *"Los números no mienten. Mi cuerpo se sostiene."* |
| A+ | *"Diez puntos arriba. La constancia tiene recompensa."* |

---

### Arquetipo AIRE · Guardián: Zeph el Veloz

| Hito | Frase |
|------|-------|
| R7 | *"Siete días en movimiento. Ligero y preciso."* |
| R14 | *"Dos semanas. El aire nunca descansa."* |
| R21 | *"Veintiún días. Lo que vuela no puede pararse."* |
| R30 | *"Un mes sin parar. La agilidad es un arte."* |
| R60 | *"Sesenta días. Ya soy el viento."* |
| R90 | *"Noventa días. El aire que se mueve no envejece."* |
| F5 | *"El aire ha encontrado su corriente."* |
| F10 | *"A esta altura, la perspectiva lo cambia todo."* |
| F16 | *"Guardián Pleno. Zeph y yo somos velocidad con propósito."* |
| F30 | *"El aire ha alcanzado su libertad máxima. Sin límites."* |
| A1 | *"Los números no mienten. Mi cuerpo se mueve mejor."* |
| A+ | *"Diez puntos arriba. La agilidad tiene recompensa."* |

---

## Notas de diseño y tono

**Lo que hacen bien estas frases:**
- Hablan en primera persona del usuario, no del avatar ni de la app.
- Son cortas: caben en una imagen y se leen de un vistazo en redes.
- No referencian la app ni el sistema de puntos — son universales.
- La frase de Auditoría es siempre la misma base (*"Los números no mienten"*) con una variante final por arquetipo — refuerza la identidad sin sonar repetitivo.

**Lo que hay que evitar:**
- Frases con jerga de la app ("he subido al nivel X", "he completado la fase Y").
- Frases que suenen a publicidad ("Anti Frágil me ha cambiado la vida").
- Frases genéricas que podrían ser de cualquier app de fitness.

**Pie de tarjeta (fijo en todas):**
`Prescrito por {fisio} · {clinica} · Anti Frágil`

> Este pie es la firma de autoridad clínica. No es publicidad: es la prueba de que
> detrás hay un profesional real. No eliminarlo ni acortarlo.

---

## Checklist antes de añadir una frase nueva

- [ ] ¿Habla en primera persona del usuario?
- [ ] ¿Puede leerse sin saber nada de la app y aun así impactar?
- [ ] ¿Es coherente con el arquetipo (metáforas de agua, fuego, tierra, aire)?
- [ ] ¿Tiene menos de 70 caracteres? (para que quepa bien en la imagen)
- [ ] ¿Evita mencionar números internos del sistema (nivel, XP, fase)?
