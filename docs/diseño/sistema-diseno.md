# Sistema de Diseño — Anti Frágil

> **La tabla maestra de la estética.** Todos los valores visuales del producto (colores,
> tipografía, espaciados, sombras, movimiento) viven AQUÍ y en `mockups/prototipo/tokens.css`.
> Nadie inventa un color o un margen: se usa el token. Así la elegancia es consistente en
> todos los aspectos, cada detalle está medido, y **cambiar la estética del futuro = cambiar
> esta tabla** (base de la marca blanca, D2).
>
> Regla: si un valor visual no está aquí, no existe. Si hace falta uno nuevo, se añade aquí primero.

---

## 1. Color (paleta oficial)

### Base (modo oscuro premium — el de `board-premium.html`)
| Token | Valor | Uso |
|-------|-------|-----|
| `--af-bg` | `#0A1626` | Fondo principal de la app. |
| `--af-panel` | `rgba(255,255,255,.055)` | Tarjetas/paneles (cristal). |
| `--af-line` | `rgba(255,255,255,.09)` | Bordes sutiles. |
| `--af-texto` | `#F2F6FA` | Texto principal. |
| `--af-texto-suave` | `#8DA2B8` | Texto secundario. |

### Marca y acción
| Token | Valor | Uso |
|-------|-------|-----|
| `--af-primario` | `#2ECC8F` | Verde vital: botón principal, éxito, XP. |
| `--af-primario-osc` | `#1AA870` | Hover/gradiente del primario. |
| `--af-dorado` | `#F4C430` | Racha, logros, celebración. |

### Arquetipos (cada Guardián tiñe su mundo)
| Token | Valor | Arquetipo |
|-------|-------|-----------|
| `--af-agua` / `--af-agua-osc` | `#5BD0E8` / `#2E86C1` | Agua 💧 |
| `--af-tierra` / `--af-tierra-osc` | `#C9A36B` / `#8A6B3F` | Tierra 🪨 |
| `--af-viento` / `--af-viento-osc` | `#B8C6F2` / `#5C6BC0` | Viento 🌬️ |

### Estados clínicos (semáforos — siempre con icono/texto, nunca solo color)
| Token | Valor | Significado |
|-------|-------|-------------|
| `--af-rojo` | `#E53935` | Dolor alto / alerta. |
| `--af-ambar` | `#FFA726` | Vigilancia / riesgo de abandono. |
| `--af-verde-ok` | `#2ECC8F` | Todo en orden. |

---

## 2. Tipografía
| Token | Valor | Uso |
|-------|-------|-----|
| `--af-font-display` | `'Nunito', sans-serif` (800-900) | Títulos, números grandes, nombre del avatar. Cálida y redonda. |
| `--af-font-texto` | `'Inter', sans-serif` (400-700) | Cuerpo, botones, datos. Limpia y legible. |

**Escala (px):** 11 (micro) · 13 (secundario) · 15 (cuerpo) · 17 (destacado) · 22 (título sección) · 28 (título pantalla) · 44 (número héroe, ej. dolor del triaje).
**Regla:** no usar tamaños fuera de la escala.

## 3. Espaciado (escala de 4)
**Valores permitidos (px):** 4 · 8 · 12 · 16 · 20 · 24 · 32 · 48.
Margen lateral estándar de pantalla: **22-28px**. Separación entre tarjetas: **11-12px**.

## 4. Radios y sombras
| Token | Valor | Uso |
|-------|-------|-----|
| `--af-radio-s` | `12px` | Chips, inputs pequeños. |
| `--af-radio-m` | `16px` | Botones, tarjetas pequeñas. |
| `--af-radio-l` | `22px` | Tarjetas principales. |
| `--af-radio-xl` | `36px` | Caja del avatar, héroes. |
| `--af-sombra-flotante` | `0 14px 34px rgba(46,204,143,.30)` | Botón principal. |
| `--af-cristal` | `backdrop-filter: blur(10px)` | Paneles translúcidos. |

## 5. Movimiento (microanimaciones medidas)
| Token | Valor | Uso |
|-------|-------|-----|
| `--af-t-rapida` | `150-180ms ease` | Pulsar botón, hover. |
| `--af-t-media` | `320ms ease` | Transición entre pantallas. |
| Respiración avatar | `5.2s ease-in-out infinite` (±12px flotar) | El Guardián SIEMPRE vivo. |
| Pulso de halo | `4.5s` | Aura del avatar. |
| Brillo de barra XP | `2.8s` | Barra de vitalidad. |

**Regla:** nada aparece "de golpe"; nada tarda más de 350ms en responder al usuario.

## 6. Componentes canon (inventario)
Botón principal (verde, radio-m, sombra flotante) · Botón fantasma · Tarjeta cristal ·
Chip de fase/estado · Barra de vitalidad con brillo · Slider 1-10 · Semáforo (punto+texto) ·
Tarjeta de mensaje del fisio (violeta) · Overlay "Próximamente" · Avatar con halo.

> La implementación de referencia de TODOS estos componentes es `mockups/prototipo/board-premium.html`
> y los tokens reutilizables están en `mockups/prototipo/tokens.css`.

## 7. Cómo se cambia la estética en el futuro (o por clínica — marca blanca)
1. **Prototipos/maquetas:** editar `tokens.css` (un solo archivo).
2. **App Flutter:** los mismos tokens viven en `app/lib/core/theme/app_theme.dart` (espejo).
3. **Marca blanca (D2):** el campo `clinicas.marca` (JSON) sobreescribirá tokens por clínica
   (logo, primario, acento). Nada más que tocar.

**Regla de oro:** si para cambiar un color hay que tocar más de un sitio por plataforma,
algo está mal hecho — arreglarlo antes de seguir.
