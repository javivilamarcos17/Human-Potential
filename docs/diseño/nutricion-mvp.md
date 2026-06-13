# Nutrición en el MVP — acompañar y medir sin agobiar

> Cómo Anti Frágil acompaña la nutrición del cliente y le ayuda a contar/medir calorías,
> sin pretender ser una app de dietas médicas. Diseño (del dueño, 2026-06-14). Editable.

---

## Principio
**Acompañar, no recetar.** El MVP ayuda al cliente a tomar conciencia y a sostener un
hábito, con la mínima fricción posible. Pautas concretas de dieta = nutricionista (igual
criterio que las banderas rojas en fisio). Lo que sí hacemos: estimar, registrar fácil,
dar feedback y gamificar la constancia.

## 1. Objetivo calórico estimado (el número de partida)
Con 4 datos del alta opcional (peso, altura, edad, sexo) + nivel de actividad + objetivo,
calculamos su gasto y un objetivo diario:
- **Metabolismo basal** con la fórmula Mifflin-St Jeor (estándar y fiable).
- **× factor de actividad** (sedentario 1.2 … muy activo 1.7).
- **Ajuste por objetivo** (ligado al elemento): 🔥 Fuego/transformación → déficit (−15-20%);
  🪨 Roca/fuerza → ligero superávit; resto → mantenimiento.
> Resultado: "Tu objetivo orientativo: ~2.100 kcal/día". Editable y siempre marcado como estimación.

## 2. Registro rápido (la clave: que no dé pereza)
Tres niveles, de menos a más esfuerzo — el cliente elige el suyo:
1. **Semáforo de comidas** (1 toque/comida): 🟢 saludable · 🟡 normal · 🔴 capricho.
   Sin números. Construye conciencia y racha. *(Ya existe el germen: micro-pregunta "¿cómo comiste ayer?")*
2. **Raciones** (rápido): porciones de proteína / carbohidrato / verdura / grasa por comida
   → estimación calórica aproximada por raciones estándar. Sin pesar nada.
3. **Calorías** (preciso, opcional): introducir kcal o elegir de una lista corta de alimentos
   frecuentes. El escaneo de códigos de barras / base de datos enorme → Fase 2.

## 3. Balance y acompañamiento diario
- Anillo/barra: **consumido vs objetivo** del día (estilo "anillo de actividad").
- Mensaje empático según el balance ("vas equilibrado", "hoy te pasaste, mañana compensamos
  con movimiento" — **cero culpa**, conecta con la rutina: más metcon quema más).
- Suma a la **constancia** (un día registrado = racha nutricional, su propia mini-recompensa).
- Hidratación: objetivo de vasos de agua/día con su racha (la micro-pregunta de agua ya existe).

## 4. Integración con el resto del producto
- **Con el avatar:** la constancia nutricional alimenta XP (un hábito más que cuida el Guardián).
- **Con el entrenamiento:** el balance calórico habla con la intensidad (déficit alto + metcon
  diario = aviso de recuperación; el sistema cuida de no quemar al cliente).
- **Con el centro:** si Lidomare tiene nutricionista, es un profesional más que da de alta
  clientes y ve sus hábitos (mismo modelo que el fisio — D7, tests configurables por profesional).

## 5. Límites (la línea que no cruzamos en el MVP)
- No pautamos dietas ni cantidades médicas sin nutricionista detrás.
- Sin diagnósticos. Sin "deberías pesar X". Tono de acompañamiento, no de báscula que juzga.
- Datos de alimentación = datos de salud (RGPD) → mismo consentimiento y aislamiento que el resto.

## 6. Implementación por fases
- **MVP v1:** objetivo calórico estimado + semáforo de comidas (1 toque) + agua + balance visual + racha.
- **MVP v1.5:** registro por raciones con estimación calórica.
- **Fase 2:** lista de alimentos / códigos de barras, recetas, integración con wearables (gasto real).

> Relacionado: [`departamentos/nutricion.md`](../departamentos/nutricion.md) ·
> [`diseño/motor-entrenamiento.md`](motor-entrenamiento.md) (balance ↔ intensidad).
