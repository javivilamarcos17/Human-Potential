# Avatares — assets de arte (brief: docs/diseño/brief-arte-avatares.md)

La app (`app-funcional.html`) carga automáticamente estas imágenes si existen,
y cae al SVG placeholder donde aún no hay arte. **No hay que tocar código.**

## Convención de carpeta y nombre
```
mockups/avatares/<elemento>-<linea>/<etapa>.png
```
- elemento: `agua` `fuego` `rayo` `hierba` `roca`
- linea:    `mistica` `heroica` `guerrera`
- etapa:    `cria` `juvenil` `desarrollo` `adulto` `apex`  (el huevo sigue siendo SVG)

## Formato recomendado
- PNG con **fondo transparente**, cuadrado (~512×512), criatura centrada.
- Recortar el fondo blanco de las generaciones (quitar el blanco → alfa).

## Ejemplo — línea piloto Ajolote (Agua · Mística)
```
agua-mistica/cria.png        ← Ajolín  (fase 5)
agua-mistica/juvenil.png     ← Ajolune (fase 9)   ✅ ya generado
agua-mistica/desarrollo.png  ← Ajondra (fase 13)  ✅ ya generado
agua-mistica/adulto.png      ← Ajomar  (fase 17)  ✅ ya generado
agua-mistica/apex.png        ← Ajomarea(fase 20)  ✅ ya generado
```
Guarda cada imagen con su nombre exacto en `agua-mistica/` y la app la mostrará
sola al alcanzar esa etapa. Falta generar la cría (Ajolín, prompt fase 5 en el brief).
