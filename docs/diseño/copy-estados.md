# Copy de estados — Anti Frágil

> Estados vacíos, de carga y de error redactados con calidez.
> Un error nunca debe frustrar. Una pantalla vacía debe invitar, no desanimar.
> **Principio:** el usuario siempre sabe qué pasó y qué puede hacer a continuación.

---

## 1. Estados vacíos

*Aparecen cuando no hay datos todavía — generalmente en el primer uso o en secciones aún sin contenido.*

### 1.1 Dashboard — sin rutina asignada (cuenta nueva, fisio no ha prescrito aún)

```
Icono/avatar: Kael en postura de espera
Título:       {clinica} está preparando tu programa.
Cuerpo:       {fisio} configurará tu rutina en breve. Cuando esté lista, te avisamos.
Acción:       — (no hay CTA; el usuario no puede hacer nada aquí)
```

---

### 1.2 Historial — sin sesiones registradas aún

```
Icono/avatar: Avatar pequeño, gesto tranquilo
Título:       Todavía no hay historial.
Cuerpo:       Cuando completes tu primera rutina, aquí verás tu evolución.
Acción:       Ir a mi rutina de hoy  →  deep link a Triaje
```

---

### 1.3 Retos — sin retos activos

```
Icono/avatar: Avatar con gesto de calma
Título:       No hay retos activos ahora mismo.
Cuerpo:       {fisio} irá añadiendo retos a medida que avances. Sigue con tu rutina.
Acción:       — (sin CTA)
```

---

### 1.4 Notificaciones / actividad — bandeja vacía

```
Icono/avatar: Icono de sobre vacío o avatar tranquilo
Título:       Todo al día por aquí.
Cuerpo:       Cuando {fisio} o el sistema tengan algo para ti, aparecerá aquí.
Acción:       — (sin CTA)
```

---

### 1.5 Re-Auditoría — aún no disponible

```
Título:       Todavía no toca re-evaluar.
Cuerpo:       Tu próxima Auditoría estará disponible en {dias_restantes} días.
              {fisio} te avisará cuando sea el momento.
Acción:       — (sin CTA)
```

---

## 2. Estados de carga

*El usuario nunca debe ver una pantalla en blanco sin explicación. Cada carga tiene su mensaje.*

### 2.1 Carga general de la app (splash / inicio)

```
Texto:   Cargando tu programa...
Subtexto (opcional, si tarda > 3 s): Preparando todo para ti, {nombre}.
```

---

### 2.2 Cargando la rutina del día

```
Texto:   Buscando tu rutina de hoy...
Subtexto (opcional): {fisio} la tiene preparada.
```

---

### 2.3 Generando el Guardián (post-Auditoría)

```
Texto:   Analizando tu perfil...
Subtexto: Tu Guardián está tomando forma.
```

*Esta pantalla tiene animación prominente — el texto debe ser breve y dejar espacio visual.*

---

### 2.4 Guardando el feedback (post-rutina)

```
Texto:   Enviando tu feedback...
Subtexto: {fisio} lo tendrá en cuanto se guarde.
```

---

### 2.5 Sincronizando con el servidor (genérico)

```
Texto:   Un momento...
```

*Sin más. No asustar al usuario con tecnicismos.*

---

## 3. Estados de error

*El error más pequeño puede romper la confianza. El tono nunca puede ser frío, técnico ni culpabilizante.*

### 3.1 Sin conexión a internet

```
Icono:   Icono de nube sin señal (no una X roja)
Título:  Sin conexión.
Cuerpo:  Comprueba tu conexión y vuelve a intentarlo. Tu progreso está a salvo.
Acción:  Reintentar
```

> ⚠️ **Crítico:** "Tu progreso está a salvo" es la frase más importante de este error.
> El mayor miedo del usuario es perder lo que ha hecho. Hay que decirlo explícitamente.

---

### 3.2 Error al cargar la rutina

```
Título:  No pudimos cargar tu rutina.
Cuerpo:  Algo ha fallado de nuestro lado. Inténtalo de nuevo — si persiste, avisa a {clinica}.
Acción:  Reintentar
```

---

### 3.3 Error al guardar el feedback

```
Título:  No se pudo enviar tu feedback.
Cuerpo:  Tu sesión ya está guardada. Solo el feedback no llegó a {fisio}. Puedes reintentarlo.
Acción:  Reintentar  |  Omitir por hoy
```

> La rutina completada **nunca se pierde** aunque el feedback falle. Dejar claro que
> los Puntos de Vitalidad y la racha están a salvo — solo falta el feedback clínico.

---

### 3.4 Error de sesión expirada / no autenticado

```
Título:  Tu sesión ha caducado.
Cuerpo:  Por seguridad, necesitas volver a entrar. Solo tardará un segundo.
Acción:  Iniciar sesión
```

*Sin tecnicismos ("token expirado", "401", etc.). El usuario solo necesita saber qué hacer.*

---

### 3.5 Error genérico de servidor

```
Título:  Algo ha fallado.
Cuerpo:  No es culpa tuya. Estamos en ello. Inténtalo de nuevo en unos minutos.
Acción:  Reintentar
```

---

### 3.6 Error al completar la Auditoría (datos no guardados)

```
Título:  No pudimos guardar tu Auditoría.
Cuerpo:  Tus respuestas no se perdieron. Conéctate y pulsa "Reintentar" para guardarlas.
Acción:  Reintentar
```

> ⚠️ Este es el error más crítico de todos. Perder una Auditoría hace daño real al
> usuario (tiempo invertido + inicio del journey). La app **debe** guardar las respuestas
> localmente antes de intentar el envío al servidor.

---

## Checklist de calidad

- [ ] ¿El usuario sabe exactamente qué pasó?
- [ ] ¿Sabe qué puede hacer a continuación (o que no hay nada que hacer)?
- [ ] ¿"Tu progreso está a salvo" cuando aplica?
- [ ] ¿Cero tecnicismos (códigos de error, nombres de sistema)?
- [ ] ¿Cero culpa ("has fallado", "error del usuario")?
- [ ] ¿El tono es cálido incluso en el peor error?
