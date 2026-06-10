# Motor viral y económico — Anti Frágil

> Cómo la app crece sola (referidos + tarjetas para redes) y cómo premia la constancia
> bajando la cuota ("Descuento Sudado"). Piezas MVP A9 · A10 · A11. Diseño editable.
>
> ⚠️ **Recordatorio (D6):** dentro de la app NO se cobra ni se paga. Solo se muestran
> saldos y descuentos. El cobro real ocurre fuera (web/recepción de la clínica).

---

## 1. Descuento Sudado (el monedero visual)

Un panel donde el paciente ve cómo **su cuota baja** cuanto más constante es y más amigos
trae. No es dinero real en la app: es un **saldo informativo** que la clínica aplica al cobrar.

**De dónde sale el descuento (reglas de ejemplo, editables por la clínica):**
| Origen | Descuento orientativo |
|--------|------------------------|
| Mantener racha mensual (constancia) | −X € / mes |
| Cada amigo que se da de alta con tu código | −Y € |
| Hitos (Retos Maestros, subir de etapa mayor) | bonus puntual |

> Tope configurable: el descuento nunca baja la cuota por debajo de un mínimo que define la
> clínica (para proteger su margen).

---

## 2. Referidos (el crecimiento B2C)

- Cada paciente tiene un **código único** de invitación.
- Quien se da de alta con ese código → **descuento para ambos** (el que invita y el invitado).
- Se registra quién trajo a quién (tabla `referidos`) para aplicar el descuento y medir viralidad.

> Es crecimiento barato: los propios pacientes traen pacientes, sin gasto en publicidad.

---

## 3. Tarjetas Épicas (la viralidad en redes)

- La app genera una **imagen vertical** lista para Instagram/TikTok: avatar + nivel/fase +
  una frase de superación + (opcional) el código de referido.
- Momentos que invitan a compartir: subir de **etapa mayor**, superar un **Reto Maestro**,
  alcanzar una **racha** redonda.
- La viralidad ocurre **fuera** de la app (no hay red social interna — está en la Nevera).

---

## 4. Upselling (conecta con la caja de la clínica)

- Si el paciente reporta dolor alto o se estanca → banner que **invita a una sesión presencial**
  y redirige a la web/WhatsApp de la clínica.
- También: ciertos **ítems del avatar** se desbloquean al contratar un servicio en la clínica
  (engancha la gamificación con el cross-selling — ver `avatar-evolucion.md`).

---

## 5. Cómo se guarda (ya en el modelo de datos)

- `monederos` — saldo de Descuento Sudado por paciente (informativo).
- `referidos` — código único y quién invitó a quién.
- Avatar/ítems para tarjetas y desbloqueos: `avatares`, `items_avatar`, `avatar_items`.

Ver `supabase/migrations/0001_esquema_inicial.sql`. Pantallas en
`app/lib/features/monedero/`, `tarjetas/` y `upselling/`.
