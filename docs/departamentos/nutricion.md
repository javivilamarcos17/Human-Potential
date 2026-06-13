# 🥗 Nutrición — panel de mandos

> Marco para integrar nutrición. Hoy el MVP **aún no tiene módulo de nutrición completo**,
> pero ya captura señales de vida y la arquitectura está lista para crecer aquí.

## Lo que YA existe (base sobre la que construir)
La micro-pregunta de vida diaria ya recoge señales relevantes (lista `preguntasDia`):
**agua** ("¿bebiste suficiente agua ayer?") y **comida** ("¿cómo comiste ayer?").
Esos datos se guardan y viajan al centro — son el germen del seguimiento nutricional.

## Diales que puedo activar cuando lo decidas
1. **Consejo del día:** un mensaje nutricional según la respuesta ("comiste mal ayer →
   hoy prioriza proteína y agua"). Editable como las reglas de entrenamiento.
2. **Objetivos sencillos:** vasos de agua/día, piezas de fruta, etc., con su propia mini-racha.
3. **Integración con el elemento Fuego** (perfil transformación corporal): consejos de déficit/superávit.
4. **Profesional nutricionista:** mismo modelo que el fisio — el centro puede ser una consulta
   de nutrición que da de alta clientes y ve sus hábitos (encaja con D7: tests configurables por profesional).

## Cómo pedírmelo
*"en nutrición, activa un consejo diario según cómo comió"* · *"añade objetivo de 8 vasos de agua
con racha propia"* · *"crea el rol de nutricionista en el panel del centro"*.

## Nota clínica importante
Nutrición toca salud: cualquier consejo concreto debe validarlo un profesional. El MVP debe
limitarse a hábitos generales y a registrar, no a pautar dietas (igual criterio que las
banderas rojas en fisio). Lo dejamos marcado para no cruzar esa línea sin un nutricionista detrás.
