# Modelo de Precios — Anti Frágil

> Qué paga cada actor, cuándo y cómo. Coherente con las proyecciones financieras
> ([`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md)) y con el motor viral
> ([`diseño/motor-viral-economico.md`](diseño/motor-viral-economico.md)).
>
> **Recordatorio irrenunciable (Decisión D6):** dentro de la app NO se cobra ni se
> paga nunca. Toda transacción ocurre fuera: en la web o recepción de la clínica.
> La app solo muestra saldos y descuentos visuales.

---

## 1. Quién paga qué

Anti Frágil tiene dos clientes con lógicas de precio distintas:

| Actor | Qué paga | Cuándo | Canal de cobro |
|-------|----------|--------|----------------|
| **La clínica** | Licencia mensual por usar la herramienta con sus pacientes | Mensual, domiciliado | Factura a la clínica (web / transferencia) |
| **El paciente** | Cuota mensual por el acceso a la app (opcional según modelo de la clínica) | Mensual | En la recepción o web de la clínica — nunca dentro de la app |

---

## 2. Precio para la clínica (B2B)

### Principio de diseño
El precio de la clínica debe ser:
- **Predecible** — tarifa plana mensual, sin sorpresas por número de pacientes activos.
- **Pequeño comparado con el valor** — retener un solo paciente al mes (~50-80 €/sesión
  presencial) ya cubre varias veces la cuota.
- **Con una barrera de entrada baja** — el piloto gratuito elimina el riesgo percibido.

### Estructura de planes

| Plan | A quién va | Precio | Qué incluye |
|------|-----------|--------|-------------|
| **Piloto** | Primera clínica / clínica de validación | **Gratis** (10 semanas) | Acceso completo. A cambio: feedback activo y disponibilidad para entrevistas. |
| **Starter** | Clínica pequeña (< 30 pacientes activos/mes) | **150 €/mes** | Hasta 30 pacientes activos simultáneos. Panel completo. Soporte por email/chat. |
| **Profesional** | Clínica mediana (30-80 pacientes/mes) | **250 €/mes** | Hasta 80 pacientes activos. Panel completo. Soporte prioritario. Onboarding guiado. |
| **Clínica+ / Cadena** | Cadena multisede o grupo con > 80 pacientes | **Precio negociado** | Pacientes ilimitados. Soporte dedicado. Posibilidad de marca blanca (cuando esté disponible). |

> **Suelo de precio:** ningún plan baja de 150 €/mes. Por debajo de ese umbral, el coste
> de soporte y operaciones no se cubre. Esto protege el margen y comunica valor.

### Transición piloto → de pago
Al terminar las 10 semanas de piloto, la clínica recibe una propuesta formal. Si acepta
en los primeros 30 días: 1 mes gratis adicional como bono de conversión. Si no decide
en ese plazo: acceso pausado hasta que formalice.

---

## 3. Precio para el paciente ("Descuento Sudado")

### Principio de diseño
El paciente **puede pagar o no**, según cómo decida posicionarlo la clínica:

- **Modelo A — la clínica absorbe el coste:** la cuota del paciente es 0 €. Anti Frágil
  es un servicio incluido, como el WiFi de la sala de espera. La clínica lo amortiza con
  retención y upselling.
- **Modelo B — la clínica repercute el coste parcialmente:** el paciente paga una cuota
  mensual pequeña que la clínica gestiona fuera de la app.

En ambos casos, el **"Descuento Sudado"** es el mecanismo que premia la constancia:
la cuota visible en la app **baja** cuanto más se cumple. Si la cuota base es 0 €,
el Descuento Sudado genera crédito positivo (bonos de fidelidad, descuentos en sesiones).

### Cuota base orientativa del paciente (Modelo B)

| Perfil | Cuota base | Con Descuento Sudado máximo |
|--------|-----------|----------------------------|
| Paciente estándar | 12 €/mes | Hasta 6 €/mes |
| Paciente con racha + 2 referidos activos | 12 €/mes | Hasta 4 €/mes |

### Cómo se calcula el Descuento Sudado

Las reglas son **configurables por la clínica** (no son fijas en el código). Ejemplo
de reglas por defecto que la clínica puede editar:

| Origen del descuento | Reducción orientativa |
|---------------------|----------------------|
| Mantener racha de 30 días (mes completo sin romper) | −2 €/mes |
| Cada amigo activo traído con código de referido | −1 €/mes (hasta 4 amigos) |
| Superar un Reto Maestro o subir de etapa mayor | Bono puntual (decide la clínica) |

> **Tope configurable:** la clínica fija el precio mínimo por debajo del cual el
> descuento no puede bajar (para proteger su margen). Por defecto: 4 €/mes.

> **El descuento es informativo en la app.** La app muestra el saldo. El cobro real —
> con el descuento aplicado — lo gestiona la clínica en su sistema (recepción, web,
> TPV). Esto es la Decisión D6 y no cambia.

---

## 4. Por qué este modelo protege el margen

| Escenario | Ingresos por clínica | Costes operativos / clínica | Margen |
|-----------|---------------------|----------------------------|--------|
| Plan Starter (150 €/mes) | 150 € | ~30-50 € (infra + soporte prorrateado) | ~100-120 € |
| Plan Profesional (250 €/mes) | 250 € | ~50-70 € | ~180-200 € |
| 20 clínicas Plan Profesional | 5.000 €/mes | ~1.000-1.400 €/mes | ~3.600-4.000 €/mes |

> Ver proyección completa en [`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md).

---

## 5. Lo que NO hace este modelo de precios

- **No hay pago in-app** — ni suscripción de Stripe, ni IAP de Apple/Google (Decisión D6).
- **No hay freemium indefinido para clínicas** — el piloto tiene fecha de fin. Una clínica
  que no paga después del piloto no puede seguir usando la herramienta.
- **No hay precio por paciente variable** — la tarifa plana elimina la incertidumbre para
  la clínica y simplifica la gestión.
- **No hay descuento del 100 %** para el paciente — el Descuento Sudado tiene un suelo.
  Un precio cero envía la señal de que la app no vale nada.

---

## 6. Preguntas frecuentes sobre el precio (para ventas)

**"150 € al mes es caro para nuestra clínica pequeña."**
Un paciente que vuelve una vez más al mes genera entre 40 y 80 € de ingreso adicional.
Con que Anti Frágil retenga a 2-3 pacientes que de otro modo habrían abandonado, la
herramienta se paga sola. El piloto gratuito elimina el riesgo de probarlo.

**"¿Qué pasa si tenemos meses con pocos pacientes activos?"**
La tarifa es plana — no sube si tienes más pacientes ni baja si tienes menos. Eso
os da previsibilidad. A cambio, el modelo solo funciona bien si la clínica usa la
herramienta de forma activa con sus pacientes.

**"¿Podemos probar antes de comprometernos?"**
Sí. El piloto de 10 semanas es exactamente eso. Sin contrato, sin permanencia. Si al
final del piloto no veis el valor, no hay nada que firmar. Ver detalles en
[`PLAN_PILOTO.md`](PLAN_PILOTO.md).

**"¿Qué pasa con el precio si el negocio crece y subís las tarifas?"**
Las clínicas que entren en los primeros 12 meses (early adopters) tendrán precio
bloqueado durante su primer año. Es un compromiso que se formaliza en el contrato.

---

*Documentos relacionados: [`PROYECCIONES_FINANCIERAS.md`](PROYECCIONES_FINANCIERAS.md),
[`diseño/motor-viral-economico.md`](diseño/motor-viral-economico.md),
[`FAQ_CLINICAS.md`](FAQ_CLINICAS.md), [`PLAN_PILOTO.md`](PLAN_PILOTO.md).*
