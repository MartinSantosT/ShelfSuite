# REGISTRO DE DECISIONES — SHELFSUITE

**Actualizado:** 2026-03-25 (Sesion 2)

> Cada decision tiene contexto y trade-offs. Leer antes de proponer cambios.

---

## D-001: Tres modulos independientes (v1.0)

**Decision:** Crear tres skins separados (Folders, Programs, Files) en lugar de un solo skin monolitico
**Razon:** Rainmeter carga cada .ini como un skin independiente. Esto permite al usuario cargar solo los que necesita y posicionarlos libremente en el escritorio
**Trade-off:** Codigo duplicado entre los tres modulos (la logica de tabs es identica)
**Estado:** Funcional. Se resolvera en v2.0 con ShelfEngine.lua compartido

## D-002: Paletas de color por modulo

**Decision:** Cada modulo tiene su propio tema de color (Deep Ocean, Forest, Terracotta)
**Razon:** Diferenciacion visual inmediata — el usuario identifica el modulo por color sin leer
**Inspiracion:** Tonos naturales, no neon ni sinteticos. Coherencia con estetica dark mode
**Estado:** Permanente. En v2.0 se mantienen como presets pero se permite customizacion

## D-003: Hover animation con Y offset

**Decision:** Al pasar el mouse sobre un icono, se mueve 3px hacia arriba
**Razon:** Feedback visual sutil que indica interactividad sin ser invasivo
**Implementacion:** MouseOverAction cambia Y de 65 a 62, MouseLeaveAction lo regresa
**Trade-off:** Requiere UpdateMeterGroup + Redraw en cada hover (impacto minimo en rendimiento)

## D-004: Iconos genericos en lugar de iconos reales

**Decision:** Usar 8 iconos genericos (folder.png, web.png, etc.) para todo
**Razon:** Simplifica distribucion — no hay iconos con copyright ni necesidad de extraer .ico de ejecutables
**Trade-off:** Pierde reconocimiento visual. El usuario ve "folder" para Documents y Pictures igual
**Estado:** Se mejorara en v2.0 con soporte para iconos custom del usuario

## D-005: Segoe UI como fuente unica

**Decision:** Usar Segoe UI (fuente de sistema de Windows) para todo el texto
**Razon:** Garantiza que se renderiza correctamente en cualquier PC con Windows 10/11 sin instalar fuentes
**Estado:** Permanente

## D-006: MIT License

**Decision:** Licencia MIT (la mas permisiva)
**Razon:** Maximizar adopcion. La comunidad de Rainmeter valora poder modificar y redistribuir libremente
**Trade-off:** Alguien podria tomar el codigo y venderlo. Aceptable — el valor esta en la comunidad, no en la licencia

## D-007: Migrar a Lua en v2.0

**Decision:** Reescribir la logica de tabs y contenido en Lua en lugar de INI puro
**Razon:**
- INI es declarativo, no puede generar contenido dinamicamente
- Agregar un icono en v1.0 requiere 15+ lineas de INI; en Lua sera 1 linea
- Lua permite calcular posiciones, alturas, y numero de columnas automaticamente
- FuturisticDesktop (proyecto hermano) ya demuestra que Lua funciona bien para esto
**Trade-off:** Mayor complejidad inicial. Usuarios que quieran modificar el engine necesitan entender Lua
**Mitigacion:** La configuracion del usuario sigue siendo una tabla simple, no necesita saber Lua

## D-008: .rmskin package para distribucion

**Decision:** Crear un paquete .rmskin instalable con doble click
**Razon:** Es el estandar de la comunidad Rainmeter. Instalacion manual ahuyenta usuarios casuales
**Herramienta:** Rainmeter Skin Packager (incluido en Rainmeter)

## D-009: dofile() en lugar de Measure=Script separado para config

**Decision:** Cargar config.lua con dofile() dentro de ShelfEngine.lua en lugar de un Measure=Script independiente
**Razon:** Rainmeter ejecuta cada Measure=Script en un Lua state aislado — globals no se comparten. Con dofile() el config se carga en el mismo state que el engine
**Trade-off:** dofile() es blocking, pero config.lua es pequeno (~50 lineas) asi que el impacto es nulo
**Estado:** Permanente

## D-010: config.lua personal separado de config.example.lua distribuible

**Decision:** Gitignorear config.lua y distribuir config.example.lua como template
**Razon:** Martin tiene datos personales (rutas, IPs de homelab) que no deben ir a GitHub. Los usuarios nuevos necesitan un ejemplo funcional
**Implementacion:** `.gitignore` con `**/config.lua`
**Estado:** Permanente

## D-011: Configurador HTML en lugar de edicion directa de Lua

**Decision:** Crear un configurador visual como pagina HTML local en lugar de esperar que el usuario edite config.lua manualmente
**Razon:** La gran mayoria de usuarios de Rainmeter no saben Lua. Un editor visual baja drasticamente la barrera de entrada
**Trade-off:** El HTML no puede escribir archivos por seguridad del navegador. Se mitigo con File System Access API (Chrome/Edge) y !WriteKeyValue para temas
**Estado:** Funcional. Se puede mejorar con mas automatizacion

## D-012: !WriteKeyValue para cambio de tema automatico

**Decision:** Usar el bang !WriteKeyValue de Rainmeter en un menu contextual en lugar de edicion manual del .ini
**Razon:** El usuario quiere cambiar temas con un clic, no editando archivos. !WriteKeyValue puede modificar el propio .ini del skin
**Requisito critico:** La linea @IncludeTheme DEBE estar dentro de la seccion [Rainmeter] para que !WriteKeyValue la encuentre
**Estado:** Funcional para los 4 temas preset

## D-013: Tabs dinamicos con Hidden=1 + Lua ShowMeter

**Decision:** Definir 5 tab meters (el maximo) en el .ini con Hidden=1 y que Lua controle cuales se muestran
**Razon:** Rainmeter no puede crear meters en runtime. Se necesitan meters "pre-creados" que Lua active segun la config
**Trade-off:** Limite maximo de 5 tabs por shelf. Si se necesitan mas, hay que agregar meters al .ini
**Regla critica:** Meter=Shape y Meter=String NO se heredan de MeterStyle — cada meter debe declararlos explicitamente
**Estado:** Permanente

## D-014: File System Access API para escritura directa

**Decision:** Usar la File System Access API del navegador (showDirectoryPicker) para leer y escribir config.lua desde el configurador
**Razon:** Elimina el proceso manual de copiar/pegar/guardar. El usuario conecta la carpeta una vez y despues solo hace clic en "Guardar"
**Trade-off:** Solo funciona en Chrome/Edge. Firefox y otros navegadores no soportan esta API. Se implemento fallback (showSaveFilePicker o download)
**Estado:** Funcional

---

*Creado: 2026-03-25 — Sesion 1 con Claude*
*Actualizado: 2026-03-25 — Sesion 2 con Claude (6 decisiones nuevas: D-009 a D-014)*
