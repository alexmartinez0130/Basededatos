# Diccionario de Datos de la Base de Datos Control de Cursos

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Control de Cursos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Alexis Daniel Martinez Mendoza |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de profesores, cursos y especialidades.

Permite controlar:

- Profesores
- Cursos
- Especialidades

El sistema permite asignar una especialidad a cada profesor y administrar los cursos que imparten.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

---

# 4. Diccionario de Datos

## Tabla: Especialidad

*Descripción:* Almacena las especialidades disponibles para los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdEspecialidad | INT | - | PK, NN | Identificador de la especialidad |
| NombreEsp | VARCHAR | 50 | NN | Nombre de la especialidad |

---

## Tabla: Profesor

*Descripción:* Almacena la información de los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdProfesor | INT | - | PK, NN | Identificador del profesor |
| Nombre | VARCHAR | 30 | NN | Nombre del profesor |
| Apellido | VARCHAR | 30 | NN | Apellido del profesor |
| IdEspecialidad | INT | - | FK, NN | Especialidad del profesor |

---

## Tabla: Curso

*Descripción:* Almacena la información de los cursos impartidos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdCurso | INT | - | PK, NN | Identificador del curso |
| NombreCurso | VARCHAR | 50 | NN | Nombre del curso |
| Horas | INT | - | NN | Número de horas del curso |
| IdProfesor | INT | - | FK, NN | Profesor que imparte el curso |

---

# 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Especialidad → Profesor | 1:N | Una especialidad puede pertenecer a varios profesores. |
| Profesor → Curso | 1:N | Un profesor puede impartir varios cursos. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Profesor | IdEspecialidad | Especialidad (IdEspecialidad) |
| Curso | IdProfesor | Profesor (IdProfesor) |

---

# 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un profesor con una especialidad inexistente. |
| IR-02 | No se puede registrar un curso para un profesor inexistente. |

---

# 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada profesor pertenece a una sola especialidad. |
| RN-02 | Una especialidad puede tener varios profesores. |
| RN-03 | Un profesor puede impartir varios cursos. |
| RN-04 | Todo curso debe estar asignado a un profesor. |

---

# 9. Diagrama Relacional

Especialidad (1) ────────< Profesor (1) ────────< Curso

Especialidad
- IdEspecialidad (PK)
- NombreEsp

Profesor
- IdProfesor (PK)
- Nombre
- Apellido
- IdEspecialidad (FK)

Curso
- IdCurso (PK)
- NombreCurso
- Horas
- IdProfesor (FK)