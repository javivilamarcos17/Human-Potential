# Privacidad y RGPD — Anti Frágil

> ⚠️ **AVISO LEGAL OBLIGATORIO:** Este documento es un **borrador de trabajo** elaborado
> para identificar los puntos críticos de cumplimiento. **NO es asesoría jurídica.**
> Debe ser revisado y validado por un abogado especialista en protección de datos y
> derecho sanitario **antes de recoger un solo dato de un paciente real.**
> La normativa aplicable incluye el RGPD (UE 2016/679), la LOPDGDD (LO 3/2018) y,
> en materia sanitaria, la Ley 41/2002 de Autonomía del Paciente.

---

## 1. Por qué este documento existe

Anti Frágil recoge **datos de salud**: niveles de dolor, capacidad física, historial de
ejercicios y feedback clínico. El RGPD clasifica los datos de salud como **categoría
especial** (Art. 9), sujetos al nivel más alto de protección. Un error aquí no es solo
técnico: puede suponer sanciones de hasta 20 millones de euros o el 4 % de la facturación
global, y —más importante— una traición a la confianza del paciente.

---

## 2. Qué datos se recogen (inventario exacto del esquema actual)

> Basado en `supabase/migrations/0001_esquema_inicial.sql`. Si el esquema cambia,
> este inventario debe actualizarse.

### 2A. Datos de categoría especial — SALUD (Art. 9 RGPD)

Estos datos requieren **consentimiento explícito** del paciente, diferenciado del
consentimiento general. No basta con que el paciente acepte unos términos de uso.

| Tabla | Campo(s) | Dato | Sensibilidad |
|-------|----------|------|-------------|
| `auditorias_vitalidad` | `fuerza`, `aerobico`, `movilidad`, `constancia`, `total` | Capacidad física evaluada (0-100) | 🔴 Dato de salud |
| `triajes` | `dolor` (1-10) | Nivel de dolor diario | 🔴 Dato de salud |
| `triajes` | `energia` (1-10) | Nivel de energía percibida | 🔴 Dato de salud (indicador funcional) |
| `feedback_rpe` | `esfuerzo` (1-10) | Esfuerzo percibido post-sesión | 🔴 Dato de salud |
| `feedback_rpe` | `molestia_nueva` (boolean) | Aparición de nueva molestia | 🔴 Dato de salud |
| `feedback_rpe` | `nota` (texto libre) | Descripción libre de molestias | 🔴 Dato de salud — **máxima sensibilidad** (texto no estructurado) |

### 2B. Datos personales ordinarios (Art. 6 RGPD)

| Tabla | Campo(s) | Dato |
|-------|----------|------|
| `pacientes` | `nombre`, `email` | Identidad del paciente |
| `profesionales` | `nombre`, `email`, `rol` | Identidad del profesional |
| `sesiones` | `completada`, `fecha` | Historial de uso de la app |
| `prescripciones` | `pack_id`, `profesional_id`, `fecha` | Qué rutinas ha tenido asignadas |
| `avatares` | `nivel`, `fase_visual`, `puntos_vitalidad`, `racha_dias` | Progreso en la gamificación |
| `monederos` | `saldo_descuento` | Descuento acumulado (informativo, sin valor económico real) |
| `referidos` | `codigo`, `referido_por_id` | Red de invitaciones |

---

## 3. Roles de responsabilidad bajo RGPD

Este punto es crítico y debe ser acordado contractualmente con cada clínica.

### La clínica = Responsable del tratamiento (Controller)
La clínica da de alta a sus pacientes, les prescribe rutinas y accede a sus datos de
salud. Es quien tiene la **relación directa con el paciente** y quien debe:
- Obtener el consentimiento explícito del paciente antes de darle de alta en la app.
- Informar al paciente de sus derechos.
- Responder ante el paciente y ante la AEPD si hay un incidente.

### Anti Frágil = Encargado del tratamiento (Processor)
Anti Frágil procesa los datos **por cuenta y bajo instrucciones de la clínica**. No
decide para qué se usan los datos — los almacena y los hace accesibles a quien la
clínica autorice.

**Consecuencia práctica:** antes del inicio de cualquier piloto, Anti Frágil y la clínica
deben firmar un **DPA (Data Processing Agreement / Acuerdo de Encargado de Tratamiento)**,
obligatorio bajo RGPD Art. 28. Sin DPA firmado, no se puede recoger datos reales.

El DPA debe cubrir como mínimo:
- Objeto y duración del tratamiento.
- Naturaleza y finalidad del tratamiento.
- Tipo de datos y categorías de interesados.
- Obligaciones y derechos del responsable.
- Medidas de seguridad técnicas y organizativas.
- Condiciones de subencargo (Supabase, Vimeo/AWS como sub-encargados).
- Procedimiento ante brechas de seguridad.

---

## 4. Base legal para cada tratamiento

| Tratamiento | Base legal propuesta | Artículo RGPD | Notas |
|-------------|---------------------|---------------|-------|
| Recogida de datos de salud (triaje, RPE, auditoría) | **Consentimiento explícito** del paciente | Art. 9.2.a | El consentimiento debe ser granular, específico y revocable. Se recoge durante el onboarding. |
| Acceso del profesional a los datos del paciente | **Ejecución del contrato** de atención sanitaria clínica-paciente | Art. 6.1.b + Art. 9.2.h | El fisio accede en el contexto de la prestación de servicios sanitarios. Revisar con abogado si aplica Art. 9.2.h. |
| Datos de identidad (nombre, email) | **Ejecución del contrato** entre paciente y clínica | Art. 6.1.b | Necesarios para prestar el servicio. |
| Referidos y gamificación | **Interés legítimo** o **consentimiento** | Art. 6.1.f o Art. 6.1.a | Revisar con abogado cuál aplica mejor. |
| Analítica de uso (sesiones completadas, adherencia) | **Interés legítimo** del responsable (la clínica) | Art. 6.1.f | Siempre que no prevalezcan los derechos del interesado. |

> **Nota crítica:** el campo `nota` (texto libre en `feedback_rpe`) puede contener
> cualquier información de salud que el paciente quiera escribir. Este campo eleva
> el riesgo del tratamiento — valorar si es estrictamente necesario en el MVP o si
> puede aplazarse.

---

## 5. Derechos del paciente y cómo ejercerlos

El paciente tiene los siguientes derechos reconocidos por el RGPD. Anti Frágil y la
clínica deben tener un procedimiento documentado para responder en los plazos legales
(máximo 1 mes, prorrogable a 3 en casos complejos).

| Derecho | Qué implica para Anti Frágil |
|---------|------------------------------|
| **Acceso** (Art. 15) | El paciente puede pedir una copia de todos sus datos. Debe haber un mecanismo de exportación. |
| **Rectificación** (Art. 16) | El paciente puede corregir datos incorrectos (nombre, email). |
| **Supresión / derecho al olvido** (Art. 17) | El paciente puede pedir que se borren sus datos. ⚠️ En datos sanitarios, la Ley 41/2002 impone conservar la historia clínica un mínimo de 5 años. Revisar con abogado cómo compatibilizar. |
| **Portabilidad** (Art. 20) | El paciente puede pedir sus datos en formato estructurado y legible (CSV/JSON). |
| **Oposición** (Art. 21) | El paciente puede oponerse a ciertos tratamientos (p. ej. analítica de uso). |
| **Limitación del tratamiento** (Art. 18) | El paciente puede pedir que solo se conserven sus datos sin procesarlos activamente. |
| **Retirada del consentimiento** | El paciente puede retirar el consentimiento en cualquier momento sin consecuencias. La retirada no afecta a la licitud del tratamiento anterior. |

**Canal para ejercer derechos:** debe habilitarse una dirección de email (p. ej.
privacidad@antifragil.es) y un proceso documentado de respuesta. La clínica es el
punto de contacto principal; Anti Frágil le da soporte técnico para ejecutar las
solicitudes.

---

## 6. Retención y eliminación de datos

| Categoría | Plazo de retención propuesto | Fundamento |
|-----------|------------------------------|-----------|
| Datos de salud activos (paciente con clínica activa) | Durante la relación clínica + 5 años | Ley 41/2002 (historia clínica mínimo 5 años) |
| Datos de salud tras baja del paciente | 5 años desde la última consulta | Ley 41/2002 |
| Datos de identidad (nombre, email) | Igual que los datos de salud | Coherencia del historial |
| Datos de gamificación (avatar, XP, rachas) | A criterio del paciente (puede borrarse antes) | Sin obligación de conservar |
| Datos de referidos y monedero | Hasta que el paciente solicite su supresión | Sin obligación de conservar |
| Logs y registros técnicos | Máximo 12 meses | Seguridad operativa |

> **Pendiente de revisión legal:** el plazo de 5 años de la Ley 41/2002 aplica a la
> historia clínica. Determinar exactamente qué datos de Anti Frágil tienen esa
> consideración requiere criterio jurídico especializado.

---

## 7. Aislamiento de datos entre clínicas (RLS)

La arquitectura multi-clínica (Decisión D2) usa **Row Level Security (RLS)** de
PostgreSQL/Supabase para garantizar que ninguna clínica puede acceder a los datos
de otra.

**Estado actual del esquema:** el SQL de `0001_esquema_inicial.sql` incluye un esbozo
de RLS con un `TODO` explícito. **Las políticas RLS no están implementadas todavía.**

> ⚠️ **Punto crítico de seguridad:** las políticas RLS deben estar completamente
> implementadas, probadas y auditadas **antes de cualquier despliegue con datos
> reales**. Un error en RLS podría exponer datos de salud de pacientes de una clínica
> a otra. Este es el riesgo técnico de privacidad más alto del sistema.

---

## 8. Infraestructura y transferencias internacionales

| Proveedor | Rol | Consideración RGPD |
|-----------|-----|--------------------|
| **Supabase** (PostgreSQL) | Almacenamiento de todos los datos | ⚠️ Supabase usa AWS. Antes del lanzamiento, confirmar que la región del proyecto es **EU** (eu-central-1 Frankfurt o eu-west-1 Irlanda). Si se usa una región de EE.UU., se requieren garantías adicionales (SCC — cláusulas contractuales tipo). |
| **Vimeo / AWS** | Almacenamiento y streaming de vídeos de ejercicios | Los vídeos son contenido de la clínica, no datos de salud del paciente. Menor riesgo. Confirmar región. |

**Acción requerida antes del lanzamiento:** confirmar la región de Supabase y obtener
el DPA de Supabase (lo ofrecen en sus planes de pago) para incluirlo como sub-encargado
en los DPAs con las clínicas.

---

## 9. Notificación de brechas de seguridad

Bajo RGPD Art. 33, si se produce una brecha de seguridad que afecte a datos personales:

- **Plazo:** notificar a la AEPD en un máximo de **72 horas** desde que se tiene conocimiento.
- **Si hay riesgo alto para los afectados:** notificar también a los pacientes afectados
  (Art. 34).
- **Registro:** mantener un registro interno de todas las brechas, aunque no se notifiquen.

**Acción requerida:** definir un protocolo de respuesta ante incidentes antes del
lanzamiento (quién lo detecta, quién decide notificar, quién redacta la notificación).

---

## 10. Consentimiento en el onboarding (diseño mínimo requerido)

El consentimiento debe obtenerse **antes de que el paciente introduzca cualquier dato
de salud**. Elementos obligatorios:

1. **Identidad del responsable** (la clínica) y del encargado (Anti Frágil).
2. **Finalidad** del tratamiento (seguimiento clínico, motivación, prevención de abandono).
3. **Categoría de datos** que se van a recoger (datos de salud — nivel de dolor, capacidad
   física, historial de ejercicios).
4. **Derechos del paciente** y cómo ejercerlos.
5. **Casilla de consentimiento explícita y no pre-marcada** para los datos de salud.
6. **Casilla separada** si se prevé uso futuro para investigación anónima (Instituto Anti
   Frágil, Fase 3) — no puede incluirse en el consentimiento del tratamiento actual.

> El "Código de Honor" que el paciente introduce para vincularse a su clínica **no es
> un mecanismo de consentimiento** — es solo de autenticación. El consentimiento debe
> ser una pantalla explícita posterior.

---

## 11. Sobre el Instituto Anti Frágil (Fase 3) — aviso anticipado

La Fase 3 prevé analizar datos anónimos de pacientes para investigación. Esto requiere:

- Que la **anonimización sea real e irreversible** (la mera seudonimización no basta).
- Un **consentimiento específico y separado** para este uso, recogido en el onboarding
  o en el momento en que se active esta función.
- Posiblemente, un **DPO (Delegado de Protección de Datos)** si el tratamiento de datos
  a gran escala es sistemático — obligatorio en ciertos supuestos del Art. 37 RGPD.

Este bloque no bloquea el MVP pero debe estar diseñado correctamente desde el principio
para no tener que rediseñar el flujo de consentimiento más adelante.

---

## 12. Acciones pendientes antes del lanzamiento del piloto

> Esta lista es el mínimo legal. Sin completarla, el piloto no debe arrancar.

- [ ] **Contratar asesor legal RGPD + derecho sanitario** para revisar este borrador.
- [ ] **Redactar y firmar el DPA** entre Anti Frágil y la clínica piloto (antes de dar de alta al primer paciente).
- [ ] **Confirmar región EU de Supabase** y obtener el DPA de Supabase.
- [ ] **Implementar las políticas RLS completas** en todas las tablas con datos sensibles.
- [ ] **Diseñar la pantalla de consentimiento** en el onboarding (casillas separadas, no pre-marcadas).
- [ ] **Redactar la política de privacidad** pública (la que el paciente puede leer antes de aceptar).
- [ ] **Definir el protocolo de respuesta ante brechas** (quién, qué, en cuánto tiempo).
- [ ] **Habilitar el canal de derechos** (email de privacidad + proceso documentado de respuesta).
- [ ] **Valorar con el abogado** si el campo `nota` (texto libre en RPE) es necesario en el MVP.
- [ ] **Documentar el Registro de Actividades de Tratamiento** (obligatorio bajo Art. 30 RGPD para encargados).

---

*Documentos relacionados: [`RIESGOS_Y_MITIGACIONES.md`](RIESGOS_Y_MITIGACIONES.md) (riesgo L1, L2, L4),
[`PLAN_PILOTO.md`](PLAN_PILOTO.md), [`CHECKLIST_LANZAMIENTO.md`](CHECKLIST_LANZAMIENTO.md) (pendiente).*
