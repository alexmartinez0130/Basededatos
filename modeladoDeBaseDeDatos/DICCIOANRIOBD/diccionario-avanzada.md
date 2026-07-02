# Diccionario de Datos de la Base de Datos Gestión Empresarial Avanzada

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Gestión Empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Alexis Daniel Martinez Mendoza |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de empleados, departamentos, proyectos, dependientes y la asignación de empleados a proyectos.

Permite controlar:

- Empleados
- Departamentos
- Proyectos
- Dependientes
- Asignaciones de trabajo
- Ubicaciones de departamentos

El sistema facilita el control de la estructura organizacional de la empresa y la participación de los empleados en distintos proyectos.

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

## Tabla: Empleado

*Descripción:* Almacena la información de los empleados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NSS | INT | - | PK, NN | Número de Seguro Social del empleado |
| Nombre | VARCHAR | 40 | NN | Nombre del empleado |
| Apellido | VARCHAR | 40 | NN | Apellido del empleado |
| Dirección | VARCHAR | 100 | NN | Dirección del empleado |
| Salario | DECIMAL | 10,2 | NN | Salario |
| Sexo | CHAR | 1 | NN | Sexo del empleado |
| FechaNacimiento | DATE | - | NN | Fecha de nacimiento |
| NSSSupervisor | INT | - | FK | Supervisor del empleado |
| NumDepartamento | INT | - | FK | Departamento al que pertenece |

---

## Tabla: Departamento

*Descripción:* Almacena la información de los departamentos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDepartamento | INT | - | PK, NN | Identificador del departamento |
| NombreDepartamento | VARCHAR | 50 | NN | Nombre del departamento |
| NSSGerente | INT | - | FK | Gerente del departamento |
| FechaInicioGerencia | DATE | - | NN | Fecha de inicio del gerente |

---

## Tabla: Proyecto

*Descripción:* Almacena los proyectos desarrollados por la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProyecto | INT | - | PK, NN | Identificador del proyecto |
| NombreProyecto | VARCHAR | 60 | NN | Nombre del proyecto |
| Ubicacion | VARCHAR | 60 | NN | Lugar donde se desarrolla |
| NumDepartamento | INT | - | FK | Departamento responsable |

---

## Tabla: Dependiente

*Descripción:* Almacena los dependientes de cada empleado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NSS | INT | - | PK, FK | Empleado titular |
| NombreDependiente | VARCHAR | 50 | PK, NN | Nombre del dependiente |
| Sexo | CHAR | 1 | NN | Sexo |
| FechaNacimiento | DATE | - | NN | Fecha de nacimiento |
| Parentesco | VARCHAR | 30 | NN | Relación con el empleado |

---

## Tabla: TrabajaEn

*Descripción:* Registra las horas trabajadas por cada empleado en los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NSS | INT | - | PK, FK | Empleado |
| NumProyecto | INT | - | PK, FK | Proyecto |
| Horas | DECIMAL | 4,1 | NN | Horas trabajadas |

---

## Tabla: UbicacionDepartamento

*Descripción:* Almacena las ubicaciones físicas de los departamentos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDepartamento | INT | - | PK, FK | Departamento |
| Ubicacion | VARCHAR | 50 | PK, NN | Ubicación física |

---

# 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Departamento → Empleado | 1:N | Un departamento tiene muchos empleados. |
| Departamento → Proyecto | 1:N | Un departamento administra varios proyectos. |
| Departamento → UbicacionDepartamento | 1:N | Un departamento puede tener varias ubicaciones. |
| Empleado → Dependiente | 1:N | Un empleado puede tener varios dependientes. |
| Empleado → TrabajaEn | 1:N | Un empleado puede trabajar en varios proyectos. |
| Proyecto → TrabajaEn | 1:N | Un proyecto puede tener varios empleados asignados. |
| Empleado → Empleado | 1:N | Un supervisor puede supervisar a varios empleados. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Empleado | NumDepartamento | Departamento (NumDepartamento) |
| Empleado | NSSSupervisor | Empleado (NSS) |
| Departamento | NSSGerente | Empleado (NSS) |
| Proyecto | NumDepartamento | Departamento (NumDepartamento) |
| Dependiente | NSS | Empleado (NSS) |
| TrabajaEn | NSS | Empleado (NSS) |
| TrabajaEn | NumProyecto | Proyecto (NumProyecto) |
| UbicacionDepartamento | NumDepartamento | Departamento (NumDepartamento) |

---

# 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | Todo empleado debe pertenecer a un departamento existente. |
| IR-02 | Todo gerente debe existir como empleado. |
| IR-03 | Todo proyecto debe pertenecer a un departamento existente. |
| IR-04 | No puede existir un dependiente sin un empleado registrado. |
| IR-05 | No puede registrarse un trabajo en un proyecto inexistente. |
| IR-06 | No puede registrarse una ubicación para un departamento inexistente. |

---

# 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un empleado pertenece a un solo departamento. |
| RN-02 | Un departamento puede tener muchos empleados. |
| RN-03 | Un empleado puede participar en varios proyectos. |
| RN-04 | Un proyecto puede tener varios empleados asignados. |
| RN-05 | Un empleado puede registrar varios dependientes. |
| RN-06 | Un departamento puede tener varias ubicaciones. |
| RN-07 | Cada departamento tiene un gerente responsable. |

---

# 9. Diagrama Relacional

Departamento (1) ─────────< Empleado

Departamento (1) ─────────< Proyecto

Departamento (1) ─────────< UbicacionDepartamento

Empleado (1) ─────────< Dependiente

Empleado (N) >────────< (N) Proyecto
          (TrabajaEn)

Empleado (1) ─────────< Empleado