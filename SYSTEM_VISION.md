# SYSTEM_VISION.md — Visión del Proyecto
# Visión del Proyecto: ANTI FRÁGIL (MVP v1.5)

## 1. ¿Qué es este proyecto?
Anti Frágil es una aplicación móvil (ecosistema B2B2C) que soluciona el abandono en la industria de la salud física. Sustituye la "culpa" de las apps de fitness tradicionales por "empatía clínica" y gamificación. El usuario interactúa con un "Guardián Digital" (Avatar) que evoluciona visualmente a medida que el usuario cumple sus rutinas de prevención y recuperación, generando aversión a la pérdida y una fuerte retención a largo plazo.

## 2. Público Objetivo
* **Usuarios Finales (Pacientes):** Personas con dolores posturales, lesiones previas o sedentarias que buscan recuperar su vitalidad sin castigos inflexibles.
* **Profesionales (B2B):** Clínicas de fisioterapia, entrenadores y nutricionistas que usan la app para prescribir rutinas, monitorizar el dolor de sus pacientes y retenerlos.

## 3. Core Loop (El flujo principal del usuario)
1. **Triaje Diario:** Al entrar, el usuario reporta su Nivel de Dolor (1-10) y Energía (1-10).
2. **Acción:** Reproduce un vídeo o "Pack de Rutina" asignado previamente por su clínico.
3. **Feedback:** Al terminar, indica su Esfuerzo (RPE) y si hubo molestias.
4. **Recompensa:** Gana "Puntos de Vitalidad" (XP). Su Avatar evoluciona a lo largo de 20 etapas visuales según la constancia.

## 4. Motor de Monetización y Viralidad
* **El Descuento Sudado:** Un panel visual donde el usuario ve cómo su cuota baja al traer referidos o mantener rachas.
* **Tarjetas Épicas:** Generación de imágenes verticales dinámicas (Avatar + Nivel + Frase de superación) listas para compartir en Instagram/TikTok.
* **Upselling Quirúrgico:** Banners automáticos que saltan si el usuario reporta mucho dolor o se estanca, invitándole a reservar una sesión presencial con la clínica (fuera de la app).

## 5. Panel Administrativo (Back-Office Web)
* Dashboard para que los profesionales den de alta pacientes (generando un Código de Honor).
* Asignación de rutinas (enlaces a vídeos de Vimeo/AWS).
* Panel de Semáforos: Alertas en rojo si un paciente reporta un dolor >7 en su triaje.

## 6. LÍMITES ESTRICTOS (Qué NO vamos a construir en este MVP)
Claude, es imperativo que NO añadas ni sugieras programar estas funcionalidades en esta fase para controlar los costes y el tiempo de entrega:
* **NO hay IA generativa:** El avatar no habla ni razona. Todo funciona por lógica condicional tradicional.
* **NO hay Wearables:** Sin integración con Apple Health, Google Fit, ni biosensores.
* **NO hay pasarelas de pago in-app:** Ni Stripe, ni IAP (In-App Purchases) de Apple/Google. Todo el pago se hace fuera de la plataforma. La app solo muestra saldos/descuentos visuales.
* **NO hay comunidad social interna:** Ni chats, ni ligas de empresas, ni muros de noticias. La viralidad ocurre exportando imágenes a redes sociales externas.

## 7. Decisiones Cerradas (D1–Dxx)

> Una vez una decisión está aquí, **no se reabre** sin información nueva explícita.
> El detalle técnico de cada una está en `docs/decisiones/` (ADRs).

| # | Decisión | Detalle | Fecha |
|---|----------|---------|-------|
| **D1** | **Stack: Flutter + Supabase** | App móvil y panel web en Flutter (Dart); backend, base de datos, login y almacenamiento en Supabase (PostgreSQL). | 2026-06-10 · [ADR-001](docs/decisiones/ADR-001-stack-tecnologico.md) |
| **D2** | **Arquitectura multi-clínica desde el día uno** | La base de datos soporta muchas clínicas (multi-tenant) con datos aislados. El MVP lanza con una sola marca; la marca blanca es un interruptor futuro. | 2026-06-10 · [ADR-002](docs/decisiones/ADR-002-arquitectura-multi-tenant.md) |
| **D3** | **Avatar = reflejo de datos clínicos, no catálogo** | El Guardián nace de la Auditoría de Vitalidad y evoluciona por constancia. 20 fases visuales (Huevo → Forja → Olimpo/Nivel 100). El arquetipo lo asigna el algoritmo ("Sombrero Seleccionador") y el usuario elige 1 de 3 dentro de su familia. | 2026-06-10 |
| **D4** | **Nº de arquetipos = configurable** | El arquetipo es un dato editable, no fijo en código. El MVP arranca con 3 familias (Tierra, Agua, Viento); añadir Fuego/Metal más adelante no requiere reprogramar, solo arte e ilustración nueva. | 2026-06-10 |
| **D5** | **Arte de avatares: ilustrador humano** | El sistema deja *placeholders* intercambiables. Las ilustraciones finales (20 fases × familia) las hace un ilustrador humano, no IA. | 2026-06-10 |
| **D6** | **Pagos siempre fuera de la app** | En el MVP no hay pasarela de pago in-app (ni Stripe in-app ni IAP). La app solo muestra saldos y descuentos visuales ("Descuento Sudado"). El cobro real ocurre en la web/recepción de la clínica. | 2026-06-10 |

## 8. Auditoría de Vitalidad (puntuación 1–100)

El "carnet de identidad" físico del usuario al entrar. Define su nivel de partida y de
ella nace el avatar. Se compone de cuatro bloques:

| Bloque | Peso | Qué mide |
|--------|------|----------|
| Fuerza Base | 0–30 | Capacidad de fuerza funcional |
| Capacidad Aeróbica | 0–30 | Resistencia cardiovascular |
| Movilidad / Ausencia de dolor | 0–20 | Rango de movimiento y dolor |
| Constancia / Hábitos | 0–20 | Adherencia y rutina de vida |

## 9. Decisiones de negocio pendientes (no bloquean el MVP)

* **Marca blanca**: cuándo activar el modo white-label (arquitectura ya preparada — D2).
* **Nº final de arquetipos** (3 vs 5) — depende del presupuesto de ilustración (D4).
* **Vía de monetización núcleo del Año 1** — recomendación de Claude: cross-selling a
  servicios físicos de la clínica antes que suscripción masiva.
