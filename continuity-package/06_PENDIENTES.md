# BACKLOG — SHELFSUITE

**Actualizado:** 2026-03-29 (Sesion 3)

> Prioridad: P0 = critico para v2.0, P1 = importante, P2 = nice-to-have

---

## v2.0 — Core Engine

| # | Tarea | Prioridad | Estado |
|---|---|---|---|
| 01 | Crear ShelfEngine.lua — motor que genera tabs e iconos desde tabla Lua | P0 | **COMPLETADO** |
| 02 | Crear Variables.inc compartido (fuentes, dimensiones base) | P0 | **COMPLETADO** |
| 03 | Crear sistema de temas (.inc por tema) con al menos 4 presets | P0 | **COMPLETADO** |
| 04 | Migrar Folders a Shelf1 usando ShelfEngine | P0 | **COMPLETADO** |
| 05 | Migrar Programs a Shelf2 usando ShelfEngine | P0 | **COMPLETADO** |
| 06 | Migrar Files a Shelf3 usando ShelfEngine | P0 | **COMPLETADO** |
| 07 | Auto-calculo de altura del widget segun numero de items | P0 | **COMPLETADO** |
| 08 | Columnas configurables (3-8 por fila) | P1 | **COMPLETADO** (default 6, variable en Variables.inc) |

## v2.0 — UX

| # | Tarea | Prioridad | Estado |
|---|---|---|---|
| 09 | Soporte para iconos custom del usuario (.png por item) | P1 | **COMPLETADO** (34 iconos migrados de Fences) |
| 10 | Auto-hide: ocultar widget al hacer doble click en escritorio | P1 | Movido a v3.0 |
| 11 | Toggle visibility: click derecho o hotkey para mostrar/ocultar | P1 | Movido a v3.0 |
| 12 | Tooltip con ruta completa al hacer hover sobre icono | P2 | **COMPLETADO** (ToolTipText=action) |
| 13 | Animacion de transicion al cambiar de tab (fade o slide) | P2 | Movido a v3.0 |
| 26 | Configurador visual HTML con editor de tabs e items | P0 | **COMPLETADO** |
| 27 | Conexion directa configurador-disco via File System Access API | P1 | **COMPLETADO** |
| 28 | Cambio de tema en un clic (menu contextual Rainmeter) | P0 | **COMPLETADO** |
| 29 | Tabs 100% dinamicos (nombres, cantidad, visibilidad desde Lua) | P0 | **COMPLETADO** |
| 30 | Separacion config personal vs distribuible (.gitignore) | P1 | **COMPLETADO** |

## v2.0 — Distribucion

| # | Tarea | Prioridad | Estado |
|---|---|---|---|
| 14 | Crear .rmskin package instalable (Martin via Skin Packager GUI, con "Merge skins" habilitado) | P0 | Pendiente |
| 15 | Screenshots actualizados de v2.0 para README | P1 | Pendiente |
| 16 | Post en r/Rainmeter con preview | P1 | Pendiente |
| 17 | Publicar en DeviantArt | P1 | Pendiente |
| 18 | Publicar en VisualSkins.com | P2 | Pendiente |
| 19 | Publicar en Rainmeter Forums (hilo oficial) | P1 | Pendiente |
| 31 | Actualizar README.md con instrucciones de v2.0 y configurador | P1 | Pendiente |
| 32 | Limpiar carpetas v1.0 (Folders/, Programs/, Files/) de Dev y Rainmeter | P1 | **COMPLETADO** (Sesion 3: eliminadas carpetas legacy + iconos copyright + configs personales) |
| 36 | Limpiar carpeta "Shelf Suite v1.0 - BACKUP" del repo | P1 | Pendiente |
| 37 | Evaluar si la liga de DeviantArt (v1.0) se rompe al actualizar repo | P2 | Pendiente |

## Futuro (v3.0+)

| # | Tarea | Prioridad | Estado |
|---|---|---|---|
| 10 | Auto-hide: ocultar widget al hacer doble click en escritorio | P1 | v3.0 |
| 11 | Toggle visibility: click derecho o hotkey para mostrar/ocultar | P1 | v3.0 |
| 13 | Animacion de transicion al cambiar de tab (fade o slide) | P2 | v3.0 |
| 20 | "Edit mode" — agregar items con InputText sin tocar archivos | P1 | Futuro (parcialmente cubierto por configurador HTML) |
| 21 | Drag entre modulos (si Rainmeter API lo permite) | P2 | Investigar |
| 22 | Import/export de configuracion (compartir setups) | P2 | Removido en Sesion 3 (reemplazado por instrucciones manuales en Tools) |
| 23 | Theme creator: UI para crear temas custom | P2 | Removido en Sesion 3 (reemplazado por selector de tema por shelf) |
| 24 | Multi-row tabs (cuando hay mas de 4-5 tabs) | P2 | Futuro |
| 25 | Integracion con FuturisticDesktop como suite completa | P1 | Futuro |
| 33 | Parser Lua completo para importar config.lua en el configurador | P2 | Futuro (actual es line-by-line regex) |
| 34 | Soporte para temas custom desde menu contextual Rainmeter | P2 | Futuro (requiere generacion de .inc + WriteKeyValue) |
| 35 | Auto-refresh: detectar cambios en config.lua y refrescar automaticamente | P2 | Futuro |

---

*Creado: 2026-03-25 — Sesion 1 con Claude*
*Actualizado: 2026-03-25 — Sesion 2 con Claude (14 tareas completadas, 8 nuevas agregadas)*
*Actualizado: 2026-03-29 — Sesion 3: Fase 3 cerrada, pendientes UX movidos a v3.0, tareas 22/23 removidas, tarea 32 completada, agregadas tareas 36-37*

---

## Notas de distribucion (Sesion 3)

- **Comportamiento .rmskin:** Default borra carpeta existente. Con "Merge skins" solo sobreescribe archivos incluidos.
- **config.lua del usuario se preserva** porque el .rmskin solo incluye config.example.lua (config.lua esta en .gitignore).
- **Iconos genericos:** 19 iconos de Google Material Icons (Apache 2.0) reemplazan los iconos con copyright.
- **Configurador traducido** completamente a ingles.
- **ShelfEngine.lua fallback:** intenta config.lua, si no existe carga config.example.lua.
- **Flujo de prueba:** Martin copia su version personal a Skins/, instala .rmskin v2.0 con Merge, verifica que config.lua sobrevive.
