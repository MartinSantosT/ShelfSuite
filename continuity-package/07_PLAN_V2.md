# PLAN v2.0 — SHELFSUITE

**"De skin estatico a herramienta configurable"**

---

## Objetivo

Reescribir ShelfSuite usando un motor Lua compartido que permita:
- Configuracion sin editar INI
- Temas intercambiables
- Tamano auto-adaptable
- Distribucion como .rmskin

---

## Fases de desarrollo

### Fase 1: ShelfEngine (Core) — COMPLETADA

**Objetivo:** Crear el motor Lua que reemplaza la logica hardcoded.

**Entregables:**
1. `ShelfEngine.lua` — Motor completo con Initialize, SwitchTab, UpdateTabs, GenerateContent, CalculateHeight
2. `Variables.inc` — Variables compartidas (fuentes, dimensiones, colores de texto)
3. `Themes/*.inc` — 4 temas: DeepOcean, Forest, Terracotta, Obsidian

**Resultado:** Un Shelf.ini + config.lua que replica y supera la funcionalidad de v1.0

### Fase 2: Migracion de los 3 modulos — COMPLETADA

**Objetivo:** Migrar Folders, Programs y Files al nuevo engine.

**Entregables:**
1. `Shelf1/Shelf.ini` + `config.lua` — Carpetas (DeepOcean) — 3 tabs, datos reales migrados de Fences
2. `Shelf2/Shelf.ini` + `config.lua` — Programas (Forest) — 4 tabs, 25+ items con iconos custom
3. `Shelf3/Shelf.ini` + `config.lua` — Archivos (Terracotta) — 3 tabs, homelab IPs y URLs
4. 34 iconos custom migrados desde Fences

**Resultado:** Los tres modulos funcionan con el motor Lua, 80%+ menos codigo en los .ini

### Fase 3: Features nuevas — COMPLETADA

**Objetivo:** Agregar lo que v1.0 no tenia.

**Completado:**
1. Iconos custom — 34 iconos especificos migrados, soporte para agregar mas
2. Columnas configurables — variable Columns en Variables.inc (default: 6)
3. Configurador visual HTML — editor completo con File System Access API
4. Cambio de tema en un clic — menu contextual con !WriteKeyValue
5. Tabs 100% dinamicos — hasta 5 por shelf, nombres y visibilidad desde Lua
6. Import/export de configuracion
7. Theme creator con color picker y alpha sliders
8. Tooltips con ruta completa en hover

**Diferido a v3.0:**
1. Auto-hide — doble click en escritorio oculta/muestra los shelves
2. Toggle con hotkey
3. Animacion de transicion al cambiar de tab

### Fase 4: Distribucion — PENDIENTE

**Objetivo:** Hacer ShelfSuite facil de instalar y descubrir.

**Entregables:**
1. `.rmskin` package con el Rainmeter Skin Packager
2. Screenshots actualizados (minimo 3: vista general, detalle de tabs, temas)
3. README actualizado con instrucciones de v2.0 y configurador
4. Limpieza de carpetas v1.0 (Folders/, Programs/, Files/)
5. Posts en: r/Rainmeter, DeviantArt, Rainmeter Forums, VisualSkins.com

---

## Relacion con FuturisticDesktop

FuturisticDesktop (Programs launcher, System, Disks, Network) NO es parte de ShelfSuite. Son proyectos separados:

- **ShelfSuite** = organizador de escritorio por zonas (alternativa a Fences)
- **FuturisticDesktop** = sidebar de sistema con launcher de programas

La experiencia de Lua en FuturisticDesktop fue directamente transferible a ShelfEngine.lua.

---

## Metricas de exito

| Metrica | Objetivo v2.0 |
|---|---|
| Estrellas en GitHub | 50+ |
| Descargas .rmskin | 500+ |
| Posts en r/Rainmeter | 1 con 50+ upvotes |
| Issues/PRs de la comunidad | Cualquier contribucion externa |
| Tiempo para agregar un icono | < 30 segundos (1 linea de Lua o via configurador) |
| Tiempo para cambiar tema | < 5 segundos (1 clic derecho) |

---

*Creado: 2026-03-25 — Sesion 1 con Claude*
*Actualizado: 2026-03-25 — Sesion 2 con Claude (Fases 1-3 completadas)*
