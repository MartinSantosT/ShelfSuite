# SHELFSUITE — Indice de Documentacion

### Tu escritorio, organizado. Sin pagar, sin bloat, sin complicaciones.
**Proyecto de:** Martin Santos
**Inicio desarrollo:** Febrero 2026 (v1.0 con Gemini)
**Repositorio:** github.com/MartinSantosT/ShelfSuite (publico, MIT)
**Stack:** Rainmeter 4.5+ / INI / Lua
**Version actual:** v2.0 (motor Lua dinamico — Fases 1-3 completadas)
**Proxima version:** v2.0 Fase 4 (distribucion)

---

## Documentos del Proyecto

| # | Documento | Descripcion | Estado |
|---|-----------|-------------|--------|
| 01 | [MANIFIESTO](./01_MANIFIESTO.md) | Brujula del proyecto. Vision, principios de diseno, posicionamiento | Permanente |
| 02 | [COMPETENCIA](./02_COMPETENCIA.md) | Analisis competitivo: Fences, DeskFrame, Altay, Droptop. Brecha de mercado | Completo |
| 03 | [ARQUITECTURA](./03_ARQUITECTURA.md) | Arquitectura v2.0 implementada: ShelfEngine.lua, flujo de datos, configurador HTML | Completo |
| 04 | [DECISIONES](./04_DECISIONES.md) | Decisiones tecnicas con contexto y trade-offs (14 registradas: D-001 a D-014) | Activo |
| 05 | [HISTORIAL](./05_HISTORIAL.md) | Historia del desarrollo: v1.0 + 3 sesiones con Claude (v2.0 implementada, Fase 4 en progreso) | Activo |
| 06 | [PENDIENTES](./06_PENDIENTES.md) | Backlog priorizado: 37 tareas, 23 completadas, 2 removidas, 12 pendientes/futuro | Activo |
| 07 | [PLAN_V2](./07_PLAN_V2.md) | Roadmap v2.0: Fases 1-3 completadas, Fase 4 (distribucion) pendiente | Completo |

---

## Estado del Proyecto

### Resumen ejecutivo

ShelfSuite es una alternativa gratuita y open source a Fences (Stardock) construida como skin de Rainmeter. Organiza el escritorio en zonas tematicas con pestanas, colores propios y navegacion por click. La v2.0 ya esta implementada con un motor Lua dinamico (ShelfEngine.lua), configurador visual HTML, cambio de temas en un clic, y tabs 100% dinamicos. Queda pendiente la Fase 4 de distribucion.

### v1.0 — Completada (legacy)

- 3 modulos funcionales (Folders, Programs, Files)
- 3 temas de color (Deep Ocean, Forest, Terracotta)
- Tabs con switching, hover animation, iconos genericos
- Publicado en GitHub con README profesional
- **Superada por v2.0** — carpetas v1.0 eliminadas (Sesion 3)

### v2.0 — En progreso (Fases 1-3 completadas, Fase 4 en progreso)

| Fase | Contenido | Estado |
|------|-----------|--------|
| 1 | ShelfEngine.lua (motor core) + Variables.inc + 4 Temas | **COMPLETADA** |
| 2 | Migracion de los 3 modulos al engine + 34 iconos custom | **COMPLETADA** |
| 3 | Features: configurador HTML, temas en 1 clic, tabs dinamicos, File System Access API | **COMPLETADA** (auto-hide, hotkey, animaciones diferidos a v3.0) |
| 4 | Distribucion: .rmskin, README, screenshots, Reddit, DeviantArt, Forums | **EN PROGRESO** (repo limpio, configurador traducido, iconos genericos listos; falta .rmskin, README, screenshots, publicar) |

---

## Como usar esta documentacion

1. **Leer este indice** para el panorama general
2. **Leer 01_MANIFIESTO** para entender la vision (obligatorio antes de proponer features)
3. **Leer el documento especifico** del tema de la sesion
4. Para pendientes activos: `06_PENDIENTES.md`
5. Para el plan tecnico: `03_ARQUITECTURA.md` + `07_PLAN_V2.md`

### Reglas de actualizacion

- Despues de cada sesion: actualizar 05_HISTORIAL y 06_PENDIENTES
- Decisiones tecnicas nuevas: agregar a 04_DECISIONES
- El MANIFIESTO solo se modifica si la vision evoluciona

---

## Proyecto hermano: FuturisticDesktop

No es parte de ShelfSuite pero comparte filosofia. Es una sidebar de sistema con:
- Launcher de programas con buscador y base de datos Lua (71 programas)
- Monitor de CPU/RAM/SWAP
- Monitor de discos
- Monitor de red

Ubicacion: `C:\Users\Martin\Documents\Rainmeter\Skins\FuturisticDesktop\`
No tiene repo publico (por ahora).

---

*Ultima actualizacion: 2026-03-29 — Sesion 3: Fase 3 cerrada (UX diferido a v3.0), Fase 4 en progreso (repo limpio, configurador reescrito en ingles, iconos genericos)*
