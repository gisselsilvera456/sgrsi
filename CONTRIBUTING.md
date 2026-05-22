# Flujo de Trabajo - Equipo Cronos

## Estrategia de Ramas
- `main` → solo versiones estables listas para entrega
- `dev` → integración continua del equipo
- `feature/RFXX-nombre` → desarrollo por requerimiento funcional
- `hotfix/correccion-xxx` → arreglos urgentes
- `docs/actualizacion-xxx` → documentación académica

## Convención de Commits
`<tipo>(alcance): <descripción>`
Tipos: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
Ejemplos:
- `feat(tickets): agregar selector de prioridad y actualización de estado`
- `fix(login): redirección infinita al expirar sesión`
- `docs(requisitos): completar IEEE 830 para RF-01 a RF-06`

## Etiquetado
Versionado semántico para hitos académicos: `v0.1.0-mvp`, `v0.2.0-entrega-parcial`, `v1.0.0-final`