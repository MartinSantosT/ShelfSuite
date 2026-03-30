# HISTORIAL DE DESARROLLO — SHELFSUITE

**Actualizado:** 2026-03-25 (Sesion 2)

---

## v1.0 — "Proof of Concept" (Febrero-Marzo 2026)

**Desarrollado con:** Google Gemini
**Publicado en:** GitHub (github.com/MartinSantosT/ShelfSuite)

### Que se construyo

- Tres modulos independientes: Folders, Programs, Files
- Sistema de tabs funcional con switching por click
- Tres paletas de color tematicas (Deep Ocean, Forest, Terracotta)
- Hover animation en iconos (3px Y offset)
- Esquinas redondeadas en backgrounds y tabs
- 8 iconos genericos compartidos en @Resources
- README profesional con badges, screenshots, instrucciones
- Licencia MIT

### Que NO se incluyo (por diseno)

- Sin Lua (todo INI puro)
- Sin .rmskin package
- Sin configuracion dinamica
- Sin auto-hide
- Sin iconos reales de aplicaciones

### Contexto

ShelfSuite nacio como parte de un esfuerzo mas grande de customizacion del escritorio que incluyo tambien FuturisticDesktop (Programs launcher, System monitor, Disks, Network). ShelfSuite fue el primer componente publicado en GitHub como proyecto open source independiente.

La experiencia de construir FuturisticDesktop con Lua demostro que el modelo dinamico es superior al estatico, lo cual motiva la v2.0.

---

## Sesion 1 con Claude — 2026-03-25

### Que se hizo

- Revision completa del codigo de v1.0
- Analisis de fortalezas y debilidades
- Investigacion del ecosistema Rainmeter 2025-2026
- Creacion del continuity-package completo
- Definicion de la vision y plan para v2.0
- Analisis competitivo (Fences, DeskFrame, Altay, Droptop)

---

## Sesion 2 con Claude — 2026-03-25 (continuacion)

### v2.0 COMPLETADA — Motor Lua dinamico + Configurador visual

Sesion extensa que cubrio la implementacion completa de v2.0. Se dividio en dos bloques de contexto (compaction) por la cantidad de trabajo.

### Bloque 1: Motor core + Migracion + Configurador

**ShelfEngine.lua — Motor core creado:**
- `Initialize()` carga config.lua via `dofile()` desde cada carpeta Shelf
- `SwitchTab(n)` cambia pestana activa, actualiza colores y contenido
- `UpdateTabs()` genera dinamicamente nombres, posiciones, colores y visibilidad de hasta 5 tabs
- `GenerateContent()` posiciona iconos en grid configurable (default 6 columnas)
- `CalculateHeight()` auto-calcula altura del widget segun el tab con mas items
- `GetIconPath()` busca icono custom, si no usa generico
- MaxSlots = 48 iconos por tab

**Migracion completa desde Fences:**
- Los datos reales de Martin (no los de GitHub) estaban en `Rainmeter/Skins/Fences/` (carpetas, programas, archivos)
- Se migraron los 3 modulos completos:
  - Shelf1 (Carpetas): 3 tabs — Tython, OneDrive-P, OneDrive-T / tema DeepOcean
  - Shelf2 (Programas): 4 tabs — Games, Streaming, Social, Musica / tema Forest
  - Shelf3 (Archivos): 3 tabs — Diario, Router, Server / tema Terracotta
- 34 iconos custom copiados desde Fences (steam.png, discord.png, spotify.png, etc.)

**Separacion personal vs distribuible:**
- `config.lua` = datos personales de Martin (gitignored)
- `config.example.lua` = ejemplos genericos para GitHub
- `.gitignore` configurado: `**/config.lua` + `*.ini.bak`

**Variables.inc compartido:**
- FontName, TabWidth, TabHeight, TabSpacing, CornerRadius, IconSize, IconSpacing, etc.
- Colores de texto compartidos: ActiveTextColor, InactiveTextColor, IconTextColor

**4 temas .inc creados:**
- DeepOcean (azul), Forest (verde), Terracotta (rojo), Obsidian (negro/gris)
- Cada uno define: MainBackground, ActiveTabColor, InactiveTabColor (formato RGBA)

**3 archivos Shelf.ini creados:**
- Estructura estandar: [Rainmeter] con @IncludeVars + @IncludeTheme, [MeasureEngine] con Lua, 5 tab meters, 18 icon slots
- MeterSettingsGear (engrane) abre el configurador HTML

### Bloque 2: Configurador visual + Temas automaticos + Tabs dinamicos

**Configurador HTML creado (`@Resources/configurator.html`):**
- App single-file (~2400 lineas) con sidebar navigation, dark theme UI
- Secciones: Shelf 1, Shelf 2, Shelf 3, Temas, Importar/Exportar, Manual
- Editor visual: tab pills, item grid con iconos, add/edit/delete items y tabs
- Pre-cargado con los datos personales de Martin en DEFAULT_DATA
- Selector de temas con 4 presets + colores personalizados con alpha sliders
- Live preview del tema personalizado
- Export genera config.lua con escaping correcto de backslashes

**File System Access API integrado:**
- Boton "Conectar Carpeta" en el header del configurador
- Al conectar, lee automaticamente los 3 config.lua desde disco
- Parser de Lua integrado (line-by-line regex) para cargar datos reales
- Boton "Guardar Shelf X" escribe config.lua directo a disco via la API del navegador
- Fallback: showSaveFilePicker o download regular si la API no esta disponible
- Toast notifications (success/error/info)

**Cambio de temas automatico via Rainmeter:**
- Menu contextual (clic derecho) en cada Shelf con opciones de tema
- Usa `!WriteKeyValue "Rainmeter" "@IncludeTheme" "#@#Themes\Tema.inc"` + `!Refresh`
- Las lineas @IncludeVars y @IncludeTheme movidas dentro de [Rainmeter] para que !WriteKeyValue las encuentre
- Tambien tiene "Abrir Configurador" en el menu contextual

**Tabs 100% dinamicos:**
- UpdateTabs() ahora escribe nombre, posicion, color, y visibilidad de cada tab
- 5 tab meters definidos en cada .ini (Hidden=1 por default, Lua los muestra)
- Bug encontrado y resuelto: `Meter=Shape`/`Meter=String` NO se hereda de MeterStyle en Rainmeter — hay que declararlo en cada meter

**Colores personalizados mejorados:**
- Defaults cambiados de tonos oscuros/azulados a purpura/magenta vibrante (#2D1B4E, #E040FB, #7C4DFF)
- Seccion custom con borde y fondo purpura para contrastar con la pagina oscura

### Bugs encontrados y resueltos en esta sesion

| Bug | Causa | Solucion |
|-----|-------|----------|
| ShelfConfig global no compartida entre scripts | Lua states aislados entre Measure=Script | Usar dofile() dentro de ShelfEngine.lua |
| SELF:GetOption vs SKIN:GetVariable | ConfigFile es opcion del Script, no variable Rainmeter | Cambiar a SELF:GetOption() |
| Datos de v1.0 no corresponden a los reales | Datos venian de Git/Dev, no de Fences activo | Migrar desde Rainmeter/Skins/Fences/ |
| Shelf 2 y 3 no renderizan en configurador | showSection() no llamaba renderShelf() | Agregar render al cambiar seccion |
| Tema no cambia al seleccionar | HTML no puede escribir archivos | Agregar !WriteKeyValue al menu contextual |
| !WriteKeyValue no encuentra @IncludeTheme | Linea estaba fuera de seccion [Rainmeter] | Mover @Include dentro de [Rainmeter] |
| Tabs desaparecen al refrescar | Meter= no se hereda de MeterStyle | Agregar Meter=Shape/String a cada meter |
| Tab names hardcoded en INI | UpdateTabs() solo cambiaba colores | Agregar !SetOption Text + !ShowMeter/!HideMeter |
| Shelf3 tab1 dice "Docs" pero config dice "Diario" | Mismatch INI vs config.lua | Corregir en INI |

---

## Sesion 3 con Claude — 2026-03-29

### Cierre de Fase 3 + Fase 4 (distribucion) en progreso

Sesion extensa con 2 compactions. Cerro la Fase 3 (UX items 10, 11, 13 diferidos a v3.0) y avanzo significativamente en Fase 4 (distribucion).

### Limpieza del repositorio para distribucion

- Eliminadas carpetas legacy v1.0: `Files/`, `Folders/`, `Programs/`, `structure.txt`
- Eliminados todos los config.lua personales de Martin
- Eliminados todos los iconos con copyright (steam, discord, spotify, etc. ~30 iconos)
- Creados 19 iconos genericos de Google Material Icons (64x64, white on transparent): calculator, calendar, chat, cloud, code, download, file, game, link, mail, music, news, office, photo, settings, storage, terminal, video, web
- Rediseñados los 3 config.example.lua desde cero con estructura universal:
  - Shelf1 (Folders): Personal (Documents, Pictures, Music, Videos, Downloads), Cloud (Google Drive, Dropbox, OneDrive), Drives (Local Disk, External, Network)
  - Shelf2 (Apps): Internet (Browser, Email, Chat), Work (Word, Excel, PowerPoint, Notepad), Entertain (Music, Videos, Games), Tools (Settings, Terminal, Explorer, Calc)
  - Shelf3 (Bookmarks): Social (YouTube, Reddit, Twitter, Instagram), Work (Gmail, Calendar, GitHub, Notion), News (Google N., TechNews, Reddit T.)

### ShelfEngine.lua — Fallback para distribucion

- Modificado Initialize() para intentar config.lua primero, si no existe carga config.example.lua
- Usa io.open() para verificar existencia del archivo
- Corregido MaxSlots de 48 a 18 (debe coincidir con MeterIcon slots definidos en INI)

### Configurador HTML — Reescritura completa

- **Todo el texto traducido de español a ingles** para distribucion
- **Nueva pagina Setup** como landing page: Connect Folder como primera accion
- **Shelves dinamicos**: crear y eliminar shelves desde el configurador, genera Shelf.ini + config.lua
- **Tema por shelf**: dropdown en el header de cada shelf (DeepOcean, Forest, Terracotta, Obsidian), eliminada seccion Themes separada
- **Tabs editables**: rename (lapiz) y delete (X) en cada tab pill, con hover para mostrar botones
- **Modal de confirmacion peligrosa** para todas las operaciones de borrado (tabs, items, shelves) — modal estilizado rojo con icono de advertencia, cuenta items afectados, reemplaza confirm() del browser
- **Modal de refresh reminder** despues de cada operacion que modifica datos — modal con checkmark verde y boton OK, reemplaza toast que se cortaba
- **Eliminado Browse button** del campo Action — File System Access API no puede devolver rutas completas del sistema (limitacion de seguridad del browser)
- **updateShelfIniTheme()** — cuando se cambia tema, actualiza @IncludeTheme en el Shelf.ini del disco
- **deleteShelf()** ahora elimina la carpeta ShelfX del disco via folderHandle.removeEntry()
- **Eliminado Backup & Restore** (export JSON/import) — reemplazado por seccion Tools con instrucciones simples de backup manual y actualizacion via .rmskin con merge
- **Help reescrito completo** con documentacion v2.0: 9 secciones cubriendo setup, shelves, tabs, items, temas, refresh, iconos, troubleshooting, recursos

### Shelf.ini — Traduccion a ingles (3 archivos)

- Context menu: "Tema:" → "Theme:", "Abrir Configurador" → "Open Configurator"
- Tooltip: "Abrir Configurador ShelfSuite" → "Open ShelfSuite Configurator"
- Metadata descriptions actualizados

### Bugs encontrados y resueltos

| Bug | Causa | Solucion |
|-----|-------|---------|
| Folder picker se abre 2 veces | saveConnectionState() llamaba showDirectoryPicker() otra vez | Eliminada funcion saveConnectionState() (FileSystemHandle no se serializa) |
| Tab click hace desaparecer el contenido | renderShelfSections() no restauraba clase .active en la seccion visible | Guardar seccion activa antes del re-render y restaurarla |
| parseLuaConfig() retorna shelf vacio | Solo buscaba comentario de tema, no parseaba tabs/items | Reescrito parser line-by-line con regex para name= y label=/action=/icon= |
| generateSingleShelfLua() genera formato incorrecto | Generaba formato plano en vez de ShelfConfig = { tabs = { ... } } | Reescrito para generar formato correcto que dofile() espera |
| THEME_DATA[theme].colors undefined | Propiedades main/active/inactive son directas, no anidadas en .colors | Cambiado a extraer directamente de THEME_DATA[theme] |
| shelf.colors.main undefined para shelves nuevos | Shelf recien creado no tenia .colors populado | Agregado fallback: (shelf.colors && shelf.colors.main) || THEME_DATA[theme]?.main |
| Modal de refresh aparece 2 veces | saveConfigToDisk y la funcion llamadora ambos mostraban modal | Eliminado modal de saveConfigToDisk, solo lo muestra la funcion de accion |

### Investigacion: Actualizacion de .rmskin

- Investigado comportamiento del instalador .rmskin:
  - Default: borra carpeta existente y reemplaza (con backup opcional)
  - Con "Merge skins": solo pone archivos nuevos encima, no borra existentes
  - config.lua del usuario se preserva porque el .rmskin no lo incluye (solo config.example.lua)
- Decision: empaquetar .rmskin con "Merge skins" habilitado por default
- Instrucciones de actualizacion simplificadas en seccion Tools del configurador

### Pendiente para proxima sesion

- Crear .rmskin package v2.0 (requiere Skin Packager GUI de Rainmeter — lo hace Martin)
- Probar actualizacion: Martin tiene copia de su version personal como si fuera usuario existente
- Actualizar README.md de GitHub para v2.0
- Limpiar carpeta "Shelf Suite v1.0 - BACKUP" del repo
- Evaluar si la liga de DeviantArt (v1.0) se rompe al actualizar repo
- Screenshots nuevos para README
- Publicar en Reddit, DeviantArt, Rainmeter Forums

---

*Creado: 2026-03-25 — Sesion 1 con Claude*
*Actualizado: 2026-03-25 — Sesion 2 con Claude (implementacion completa de v2.0)*
*Actualizado: 2026-03-29 — Sesion 3 con Claude (limpieza distribucion, configurador reescrito, Fase 4 en progreso)*
