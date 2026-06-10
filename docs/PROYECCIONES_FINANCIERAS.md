# Proyecciones Financieras — Anti Frágil

> **Aviso importante:** estas cifras son estimaciones orientativas para planificar y
> buscar inversión. No son previsiones contables. Todos los números deben validarse
> con el piloto real y con clínicas reales antes de usarlos en decisiones críticas.

---

## 1. Vías de ingreso

Anti Frágil tiene tres fuentes de ingreso, con distinto peso según la fase:

| Vía | Mecánica | Cuándo | Peso estimado Año 1 |
|-----|----------|--------|---------------------|
| **Cuota B2B de clínicas** | Tarifa mensual por clínica activa | Desde el lanzamiento | 70-80 % |
| **Suscripción del paciente ("Descuento Sudado")** | Cuota mensual del paciente que baja con constancia y referidos | Desde el lanzamiento | 15-20 % |
| **Cross-selling a sesiones presenciales** | Comisión o acuerdo por cada reserva generada vía upselling de la app | Año 1-2 (negociable con clínicas piloto) | 5-10 % |
| **Datos anónimos / Instituto Anti Frágil** | Licencias estadísticas a universidades / aseguradoras | Fase 3 (largo plazo) | — |

---

## 2. Supuestos clave

Antes de los escenarios, los parámetros que los mueven:

| Parámetro | Valor usado | Notas |
|-----------|-------------|-------|
| Cuota mensual por clínica | 150-300 € / mes | Rango a validar. Referencia: CRMs de fisio cuestan 80-200 €/mes sin el valor de retención. |
| Pacientes por clínica activa | 30-80 | Clínica pequeña-mediana. |
| Cuota mensual del paciente | 9-15 € / mes | Solo si la clínica repercute el coste; muchas lo absorberán como diferencial. |
| Tasa de adopción de pacientes | 40-70 % de los pacientes de la clínica | Depende del onboarding y la implicación del profesional. |
| Costes de infraestructura (Supabase + Vimeo/AWS) | ~200-500 € / mes | Escala con el número de usuarios activos. |
| Coste de soporte / operaciones | 1 persona a media jornada en Año 1 | Cubre atención a clínicas y corrección de bugs menores. |

---

## 3. Escenarios Año 1 (12 meses desde lanzamiento del MVP)

> Todos los escenarios asumen: MVP lanzado en el mes 1, sin inversión publicitaria
> significativa — crecimiento por canal directo (relaciones del dueño del proyecto) y
> boca a boca entre clínicas.

### Escenario A — Conservador
> 5-8 clínicas activas al cierre del año. Adopción baja de pacientes. Sin acuerdo de
> cross-selling todavía.

| Concepto | Mes 6 | Mes 12 |
|----------|-------|--------|
| Clínicas activas | 3 | 6 |
| Pacientes activos totales | ~120 | ~280 |
| Ingresos mensuales recurrentes (MRR) | ~600 € | ~1.200 € |
| Ingresos acumulados Año 1 | — | ~8.000 € |
| Costes fijos mensuales (infra + soporte) | ~700 € | ~900 € |
| Resultado | Negativo | Cerca del punto de equilibrio operativo |

**Conclusión:** viable solo si los costes de desarrollo ya están amortizados (equipo
contratado por proyecto cerrado) y el dueño del proyecto opera sin sueldo el primer año.
Suficiente para validar el modelo y levantar inversión.

---

### Escenario B — Base *(el más probable si el piloto funciona)*
> 15-20 clínicas activas al cierre del año. Adopción media de pacientes (~50 %).
> Algún acuerdo de cross-selling puntual.

| Concepto | Mes 6 | Mes 12 |
|----------|-------|--------|
| Clínicas activas | 8 | 18 |
| Pacientes activos totales | ~400 | ~900 |
| MRR (clínicas + pacientes) | ~2.200 € | ~5.000 € |
| Ingresos acumulados Año 1 | — | ~25.000 € |
| Costes fijos mensuales | ~900 € | ~1.500 € |
| Resultado | Positivo desde mes 8-9 | Rentable operativamente |

**Conclusión:** permite reinvertir en producto y en equipo de ventas. Es la base para
una ronda de inversión seed con números reales.

---

### Escenario C — Optimista
> 40+ clínicas activas. Una cadena o franquicia de clínicas entra como cliente.
> Adopción alta de pacientes (~65 %). Cross-selling activo y medido.

| Concepto | Mes 6 | Mes 12 |
|----------|-------|--------|
| Clínicas activas | 20 | 45 |
| Pacientes activos totales | ~1.500 | ~3.500 |
| MRR | ~8.000 € | ~18.000 € |
| Ingresos acumulados Año 1 | — | ~90.000 € |
| Costes fijos mensuales | ~2.000 € | ~5.000 € |
| Resultado | Claramente rentable | Base para escalar con inversión |

**Conclusión:** requiere que una cadena o grupo de clínicas adopte la herramienta en
bloque. Posible si el piloto genera un caso de éxito sólido y documentado.

---

## 4. Costes de desarrollo (no operativos — inversión inicial)

> Estos son costes únicos para construir el MVP, no recurrentes.

| Concepto | Estimación orientativa | Notas |
|----------|------------------------|-------|
| Desarrollo del MVP (Sprint 1-7, ~14 semanas) | 20.000-50.000 € | Depende del equipo (agencia vs. freelancers). Ver [`DOSSIER_DESARROLLO.md`](DOSSIER_DESARROLLO.md). |
| Arte de avatares (ilustrador humano, 20 fases × 3 arquetipos) | 3.000-8.000 € | Muy variable según el ilustrador y el estilo. |
| Diseño de identidad visual | 2.000-5.000 € | Logo, paleta, guía de estilo. |
| Publicación en App Store / Google Play | ~130 € / año | Cuentas de desarrollador Apple + Google. |
| **Total inversión inicial estimada** | **~25.000-65.000 €** | Rango amplio — el dossier de desarrollo precisará la cifra. |

---

## 5. Punto de equilibrio operativo

Una vez lanzado el MVP, ¿cuántas clínicas necesitamos para cubrir costes corrientes?

Con costes fijos de ~1.000 €/mes (infra + soporte mínimo) y una cuota media de
200 €/clínica/mes:

> **~5 clínicas activas cubren los costes operativos.**

Eso significa que con el piloto (1 clínica gratuita) y 5-6 clínicas de pago,
el negocio se sostiene solo. El crecimiento a partir de ahí es margen.

---

## 6. Métricas que mueven el modelo

Tres variables que hay que vigilar desde el día uno:

1. **Churn de clínicas** (cuántas clínicas dejan de pagar cada mes) — si supera el 5 %
   mensual, el modelo no funciona.
2. **Adopción de pacientes por clínica** — si es menor del 30 %, el valor percibido por
   la clínica es bajo y el churn sube.
3. **Coste de adquisición de clínica (CAC)** — en Año 1 debe ser < 3 meses de cuota
   (< 600 € por clínica) para que el LTV tenga sentido.

---

*Documentos relacionados: [`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md) §5,
[`DOSSIER_DESARROLLO.md`](DOSSIER_DESARROLLO.md), [`PLAN_PILOTO.md`](PLAN_PILOTO.md).*
