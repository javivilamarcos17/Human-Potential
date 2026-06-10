# App — Anti Frágil (Flutter)

> Esqueleto de la app móvil (paciente) y el panel web (clínica). **Boceto editable.**

## ⚠️ Estado

Esto es el **esqueleto del flujo**, no una app compilable todavía. Contiene la estructura
de carpetas y pantallas vacías comentadas que marcan el camino. El equipo de desarrollo
instalará Flutter, completará las pantallas y conectará con Supabase.

## Estructura

```
lib/
├── main.dart                 ← punto de entrada
├── core/                     ← tema, configuración, cliente Supabase
├── data/                     ← modelos y acceso a datos
│   ├── models/
│   └── repositories/
├── features/                 ← una carpeta por pantalla del flujo
│   ├── onboarding/           ← login + Código de Honor + Auditoría de Vitalidad
│   ├── dashboard/            ← avatar + XP + racha
│   ├── triaje/               ← popup diario dolor/energía
│   ├── rutinas/              ← reproductor de vídeos + Packs
│   ├── feedback/             ← RPE post-sesión
│   ├── monedero/             ← Descuento Sudado + referidos
│   ├── tarjetas/             ← tarjetas épicas para compartir
│   └── upselling/            ← banners hacia servicios de clínica
└── shared/                   ← widgets reutilizables
```

## Arrancar (cuando Flutter esté instalado)

```bash
flutter pub get
flutter run            # móvil
flutter run -d chrome  # panel web
```

Ver `docs/ARQUITECTURA.md` para el detalle técnico y `docs/ROADMAP.md` para el plan.
