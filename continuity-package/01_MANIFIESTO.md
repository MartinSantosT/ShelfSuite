# MANIFIESTO SHELFSUITE

> **Este documento es la brujula del proyecto. Cada feature, cada decision de diseno, cada linea de codigo debe pasar por este filtro: le devuelve al usuario el control de su escritorio?**

---

## La verdad que nadie mas ve

El escritorio de Windows es un desastre. Iconos regados sin logica, accesos directos que se acumulan, archivos temporales que nunca se borran. Microsoft no ha innovado en la organizacion del escritorio en 30 anos — sigues teniendo una cuadricula plana de iconos.

Fences de Stardock resolvio esto en 2009: areas visuales donde agrupas iconos. Genial. Pero cuesta $14.99 USD, es software propietario, consume recursos, y con los anos se ha vuelto bloated con features que nadie pidio.

La comunidad de Rainmeter lleva anos creando skins hermosos — relojes, monitores de sistema, reproductores de musica — pero nadie ha creado una alternativa seria a Fences. Los intentos existentes (DeskFrame, FileView skins) son rudimentarios o abandonados.

**ShelfSuite existe para llenar ese vacio: organizacion de escritorio elegante, modular, y gratuita.**

---

## Lo que ShelfSuite es

ShelfSuite es un **sistema de organizacion de escritorio por zonas tematicas** construido como skin de Rainmeter. Cada modulo ("shelf") agrupa accesos a carpetas, programas o archivos en una interfaz con pestanas, colores propios y navegacion por un solo click.

No es un reemplazo de escritorio completo. No es un dock. No es un launcher con buscador. Es algo mas simple y especifico: **estantes visuales donde tu decides que va y donde**.

---

## Principios de diseno

**1. Cero friccion para personalizar.**
Si el usuario tiene que editar XML para agregar un acceso directo, fallamos. La configuracion debe ser tan simple como editar una lista de texto o, idealmente, click derecho → agregar.

**2. Ligero como el aire.**
Rainmeter ya corre en segundo plano. ShelfSuite no debe agregar lag perceptible. Cero dependencias externas, cero llamadas a red, cero archivos temporales.

**3. Cada modulo es independiente.**
El usuario puede usar Folders sin Programs, o Files solo. Los modulos no dependen entre si. Puedes cargar uno, dos, o los tres.

**4. Belleza con identidad.**
Cada modulo tiene su paleta de color derivada de tonos naturales (oceano, bosque, terracota). No es solo "dark mode generico" — es un lenguaje visual coherente que se siente como un producto, no como un skin casero.

**5. Open source por conviccion.**
Fences cobra por algo que deberia ser gratis. ShelfSuite es MIT. La comunidad puede forkear, modificar, y distribuir sin restricciones.

---

## Como esto guia el roadmap

| Feature | Encaja? | Por que |
|---|---|---|
| Configuracion via Lua (sin editar .ini) | Totalmente | Principio 1: cero friccion |
| Iconos dinamicos del .exe real | Totalmente | UX: reconocimiento visual instantaneo |
| Auto-hide / toggle de modulos | Si | Limpieza visual, el escritorio respira |
| Temas configurables | Si | Personalizacion sin codigo |
| Drag & drop para reordenar | Parcial | Deseable pero limitado por Rainmeter API |
| Integracion con feeds/APIs | No | Principio 2: ligero, sin red |
| Buscador de programas | No | Eso es un launcher, no un shelf. Es otro producto (FuturisticDesktop) |
| Monitor de sistema | No | Fuera de alcance. Hay 100 skins para eso |

---

## Posicionamiento en el mercado

**Competidor directo:** Fences ($14.99, propietario)
**Alternativas Rainmeter:** Ninguna seria que combine tabs + modulos + temas
**Mercado objetivo:** Usuarios de Rainmeter que quieren organizacion sin pagar Fences
**Distribucion:** GitHub (repo publico), DeviantArt, Rainmeter Forums, .rmskin package

---

## La frase que lo resume

**"Tu escritorio, organizado. Sin pagar, sin bloat, sin complicaciones."**

---

*Este documento es permanente. Solo se modifica si la vision evoluciona, no por features o sprints.*
*Creado: 2026-03-25 — Sesion 1 con Claude*
