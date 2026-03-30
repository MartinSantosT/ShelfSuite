# ARQUITECTURA — SHELFSUITE

**Actualizado:** 2026-03-25 (Sesion 2 — v2.0 implementada)

---

## Estado actual: v2.0 (Dinamica) — IMPLEMENTADA

### Estructura de archivos

```
ShelfSuite/
├── @Resources/
│   ├── Variables.inc              # Variables compartidas (fuentes, dimensiones, colores texto)
│   ├── ShelfEngine.lua            # Motor Lua: genera tabs e iconos dinamicamente
│   ├── configurator.html          # Configurador visual (single-file, ~2400 lineas)
│   ├── Themes/
│   │   ├── DeepOcean.inc          # Tema azul (Main: 25,40,55 / Active: 71,126,199)
│   │   ├── Forest.inc             # Tema verde (Main: 25,45,35 / Active: 95,155,110)
│   │   ├── Terracotta.inc         # Tema terracota (Main: 50,30,35 / Active: 210,90,100)
│   │   └── Obsidian.inc           # Tema negro/gris (Main: 18,18,22 / Active: 100,100,115)
│   └── Icons/
│       ├── folder.png, code.png, media.png, system.png, file.png, web.png, ...
│       ├── steam.png, discord.png, spotify.png, obs.png, ...  (34 iconos custom)
│       └── (el usuario puede agregar mas .png aqui)
├── Shelf1/
│   ├── Shelf.ini                  # Instancia 1 — Carpetas (DeepOcean)
│   ├── config.lua                 # Config personal (gitignored)
│   └── config.example.lua         # Config ejemplo para distribucion
├── Shelf2/
│   ├── Shelf.ini                  # Instancia 2 — Programas (Forest)
│   ├── config.lua
│   └── config.example.lua
├── Shelf3/
│   ├── Shelf.ini                  # Instancia 3 — Archivos (Terracotta)
│   ├── config.lua
│   └── config.example.lua
├── .gitignore                     # Excluye **/config.lua y *.ini.bak
├── README.md
└── LICENSE
```

### Flujo de datos

```
config.lua ──dofile()──> ShelfEngine.lua ──!SetOption/!ShowMeter──> Shelf.ini meters
                              │
                              ├── Initialize(): lee config, calcula altura, muestra tab 1
                              ├── SwitchTab(n): cambia tab activo
                              ├── UpdateTabs(): nombres, colores, posiciones, visibilidad
                              └── GenerateContent(): posiciona iconos en grid
```

### Componentes del ShelfEngine.lua (implementado)

| Funcion | Responsabilidad |
|---|---|
| Initialize() | Carga config.lua via dofile(), lee variables de Rainmeter, calcula altura, muestra tab 1 |
| CalculateHeight() | Encuentra el tab con mas items, calcula filas, ajusta WidgetHeight y MeterBackground |
| SwitchTab(tabIndex) | Cambia ActiveTab, llama UpdateTabs() + GenerateContent(), refresca |
| UpdateTabs() | Para cada tab: nombre (!SetOption Text), color (activo/inactivo), posicion X/Y, !ShowMeter/!HideMeter |
| GenerateContent() | Para cada item del tab activo: posiciona icono (Image) y label (String) en grid, asigna LeftMouseUpAction, hover animation |
| GetIconPath() | Resuelve icono: custom > especificado > default |

### Modelo de datos (config.lua)

```lua
ShelfConfig = {
    defaultIcon = "folder.png",
    tabs = {
        {
            name = "Tython",
            items = {
                { label = "Documentos", action = "C:\\Users\\Martin\\Documents", icon = "folder.png" },
                { label = "Fotos", action = "C:\\Users\\Martin\\Pictures", icon = "folder.png" },
            }
        },
        {
            name = "OneDrive-P",
            items = { ... }
        }
    }
}
```

### Shelf.ini — Estructura estandar

```ini
[Rainmeter]
OnRefreshAction=[!CommandMeasure MeasureEngine "SwitchTab(1)"]
ContextTitle=Tema: DeepOcean          # Menu contextual para cambio de tema
ContextAction=[!WriteKeyValue "Rainmeter" "@IncludeTheme" "#@#Themes\DeepOcean.inc"][!Refresh]
@IncludeVars=#@#Variables.inc         # DEBE estar en [Rainmeter] para que !WriteKeyValue funcione
@IncludeTheme=#@#Themes\DeepOcean.inc

[MeasureEngine]
Measure=Script
ScriptFile=#@#ShelfEngine.lua
ConfigFile=config.lua

[MeterBackground]        # Shape Rectangle, tamano auto-calculado por Lua
[MeterSettingsGear]      # Engrane (⚙) que abre configurator.html
[MeterTab1-5 Bg/Text]   # 5 tab meters (Hidden=1 default, Lua muestra los necesarios)
[MeterIcon1-18]          # 18 icon slots (Hidden=1 default, Lua muestra los necesarios)
```

### Configurador HTML

App single-file vanilla JS con dark UI:
- **Sidebar:** Shelf 1, Shelf 2, Shelf 3, Temas, Importar/Exportar, Manual
- **Editor visual:** tab pills, item grid, add/edit/delete, modal forms
- **Temas:** 4 presets con asignacion por shelf + color picker custom con alpha
- **File System Access API:** conectar carpeta, leer configs desde disco, guardar directo
- **Export:** genera config.lua con escaping correcto, download per-shelf

### Variables.inc

```ini
[Variables]
FontName=Segoe UI
TabWidth=85 / TabHeight=30 / TabSpacing=10
IconSize=40 / IconSpacing=75 / IconRowHeight=70
Columns=6 / WidgetWidth=480
PaddingX=15 / PaddingY=10 / ContentStartY=55
HoverOffset=3 / CornerRadius=6
ActiveTextColor=255,255,255,255
InactiveTextColor=190,200,210,255
IconTextColor=220,230,240,255
```

### Temas (.inc)

Cada tema define 3 colores en formato RGBA:
- **MainBackground** — fondo del widget
- **ActiveTabColor** — pestana seleccionada
- **InactiveTabColor** — pestanas no seleccionadas

---

## Reglas tecnicas importantes (lecciones aprendidas)

1. **Meter= NO se hereda de MeterStyle** — cada meter debe declarar su propio Meter=Shape o Meter=String
2. **@Include debe estar dentro de [Rainmeter]** si quieres usar !WriteKeyValue para modificarlo
3. **dofile() es la forma correcta de compartir datos entre scripts** — Lua states son aislados entre Measure=Script
4. **SELF:GetOption()** para opciones del Script measure, **SKIN:GetVariable()** para [Variables]
5. **File System Access API** requiere Chrome/Edge y permiso del usuario, pero permite lectura/escritura directa

---

## Dependencias

- **Rainmeter 4.5+** (Shape meter, DynamicVariables, !WriteKeyValue)
- **Lua 5.1** (incluido en Rainmeter)
- **Chrome/Edge** (para File System Access API en configurador — opcional, tiene fallback)
- **Sin dependencias externas**

---

*Creado: 2026-03-25 — Sesion 1 con Claude*
*Actualizado: 2026-03-25 — Sesion 2 con Claude (arquitectura v2.0 implementada)*
