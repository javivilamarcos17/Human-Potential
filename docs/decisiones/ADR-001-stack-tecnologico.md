# ADR-001 — Stack tecnológico: Flutter + Supabase

**Fecha:** 2026-06-10
**Estado:** Aceptada

## Contexto

Anti Frágil necesita lanzar un MVP (v1.5) lo más rápido y barato posible, con dos
piezas de software:

1. **App móvil para pacientes** — tiene que funcionar en iPhone y Android desde el día uno.
2. **Panel web para las clínicas** — donde el profesional da de alta pacientes y asigna rutinas.

El proyecto lo arrancará un equipo de desarrollo externo, así que el stack debe ser
**popular, bien documentado y fácil de contratar**. Además, el dueño del negocio no es
técnico: la prioridad es velocidad de entrega y bajo coste de mantenimiento, no
sofisticación técnica.

## Decisión

- **App móvil:** **Flutter** (lenguaje Dart). Un solo código para iPhone y Android.
- **Panel web de clínica:** **Flutter Web** (mismo código base) en el MVP. Si más
  adelante el panel crece mucho, se puede migrar a un framework web dedicado sin tocar
  la app móvil.
- **Backend (servidor + base de datos + login):** **Supabase**. Es una plataforma
  "todo en uno" que nos da base de datos (PostgreSQL), sistema de login, almacenamiento
  de archivos y permisos de seguridad sin tener que programar un servidor desde cero.

## Alternativas consideradas

- **React Native (móvil)** — descartada porque, aunque es válida, Flutter da una
  experiencia visual más consistente entre iPhone y Android (clave para una app cuyo
  corazón es un avatar animado y bonito) y nos permite reutilizar el mismo código para
  el panel web.
- **Backend propio a medida (Node.js / Python + servidor)** — descartada para el MVP
  porque multiplica el tiempo y el coste: habría que programar login, permisos,
  servidor y base de datos manualmente. Supabase nos lo da hecho. Si algún día
  necesitamos algo muy a medida, Supabase usa PostgreSQL estándar, así que migrar no
  nos deja atrapados.
- **Firebase (de Google)** — descartada como primera opción porque su base de datos
  (NoSQL) encaja peor con datos muy relacionados como los nuestros (paciente → clínica →
  rutina → registro de dolor). Supabase usa una base de datos relacional (SQL) que
  modela esto de forma más natural y nos deja hacer consultas complejas el día de mañana
  (ej. los estudios del "Instituto Anti Frágil" de la visión a futuro).

## Consecuencias

**Bueno:**
- Un solo equipo y un solo lenguaje (Dart) cubre móvil + web → menos coste.
- Supabase acelera el arranque semanas o meses.
- Base de datos SQL estándar: no quedamos "atrapados" en un proveedor.

**A tener en cuenta:**
- Flutter Web es bueno para un panel de gestión interno, pero no es ideal para una web
  pública de marketing con mucho SEO. Esa web (si se hace) iría aparte.
- Supabase es un servicio gestionado: hay una cuota mensual cuando crezca el número de
  usuarios. Es un coste predecible y mucho menor que mantener servidores propios en esta
  fase.
- **Importante:** ni Flutter ni Dart están instalados todavía en el equipo del dueño.
  Este repositorio contiene el **esqueleto y el plan**; compilar y ejecutar la app lo
  hará el equipo de desarrollo cuando instale las herramientas.
