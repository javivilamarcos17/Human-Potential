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

## 7. Decisiones Técnicas Pendientes
* Selección del Stack Tecnológico (Sugerido: Flutter/React Native para frontend móvil híbrido; Firebase/Supabase para backend rápido y gestión de autenticación).
* Estructura exacta de la base de datos para relacionar Pacientes -> Clínicos -> Rutinas -> Registro de dolor.
