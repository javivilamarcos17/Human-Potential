# 📣 Marketing y Comercial — panel de mandos

> Todo lo que hace crecer la app, retiene y vende. Dile a Claude "en marketing, …".

## 1. Viralidad — Tarjeta Épica
**Qué controlas:** la imagen compartible (avatar + nombre + racha + frase + código del centro).
**Diales:** los momentos que invitan a compartir (hoy: pico de evolución) y el texto de la tarjeta.
**Cómo pedírmelo:** *"que también se pueda compartir al superar un Reto Maestro"* · *"cambia la frase de la tarjeta"*.

## 2. Referidos
**Dial:** código único por paciente (ej. JAVI-AF-2026); alta con código → descuento a ambos.
**Cómo pedírmelo:** *"el referido da 2 meses de descuento en vez de 1"*.

## 3. Descuento Sudado (retención económica)
**Diales** (`descuento_sudado` + `MODELO_PRECIOS.md`): cuota base **12 €** → suelo **4 €**.
Baja por: racha mensual (−2 €), cada amigo activo (−1 €, máx 4), Reto/hito (bono).
**Cómo pedírmelo:** *"sube el suelo a 6 €"* · *"que la racha de 30 días dé −3 €"*.

## 4. Modo Centro (B2B2C — Lidomare)
**Qué controlas:** qué centros existen, qué actividades ofrecen dentro de la app y a dónde van los datos.
**Diales** (`CONFIG.centros`): por centro → `nombre`, `whatsapp`, lista de `actividades`
(`{nombre, detalle, cta}`). El cliente entra con el código del centro; sus datos van al WhatsApp del centro.
**Cómo pedírmelo:** *"añade el centro 'X' con código X26 y estas 3 actividades"* · *"cambia el CTA a 'Reservar'"*.

## 5. Venta presencial guiada (cross-selling)
**Dial:** cuándo aparece el empujón a sesión presencial (hoy: dolor alto, molestia, estancamiento).
Siempre con tono de cuidado, nunca publicidad. Ver `upselling.html`.
**Cómo pedírmelo:** *"que el banner aparezca también si lleva 2 semanas mejorando, para subir de nivel con un pro"*.

## 6. Tono y mensajes
**Principio (innegociable):** empatía clínica, **cero culpa**. Variables {nombre}{fisio}{clinica}{racha}.
Biblioteca completa: `docs/diseño/microcopy-app.md` + `lexico-marca.md` (nombres oficiales).
**Cómo pedírmelo:** *"suaviza el mensaje de re-enganche"* · *"añade un mensaje para la racha de 50"*.

---
**Documentos de negocio ya listos:** PITCH_DECK · ONE_PAGER · MODELO_PRECIOS · PLAN_GO_TO_MARKET ·
PROYECCIONES · COMPETENCIA · FAQ_CLINICAS · FAQ_PACIENTES · GUION_DEMO_CLINICAS (en `docs/`).
