# Diccionario de Datos de la Base de Datos Gestión Empresarial

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

El sistema administra la información de los empleados, departamentos y proyectos de una empresa.

Permite controlar:

- Empleados
- Departamentos
- Proyectos

Cada empleado pertenece a un departamento y puede participar en distintos proyectos.

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

## Tabla: Department

*Descripción:* Almacena la información de los departamentos de la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Identificador del departamento |
| Name | VARCHAR | 50 | NN | Nombre del departamento |
| MgrSSN | INT | - | FK | Gerente del departamento |

---

## Tabla: Employee

*Descripción:* Almacena la información de los empleados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSN | INT | - | PK, NN | Identificador del empleado |
| Name | VARCHAR | 50 | NN | Nombre del empleado |
| Salary | DECIMAL | 10,2 | NN | Salario del empleado |
| SuperSSN | INT | - | FK | Supervisor del empleado |
| Dno | INT | - | FK, NN | Departamento al que pertenece |

---

## Tabla: Project

*Descripción:* Almacena la información de los proyectos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Identificador del proyecto |
| Name | VARCHAR | 60 | NN | Nombre del proyecto |
| Location | VARCHAR | 60 | NN | Ubicación del proyecto |
| Dnum | INT | - | FK, NN | Departamento responsable |

---

# 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Department → Employee | 1:N | Un departamento tiene muchos empleados. |
| Department → Project | 1:N | Un departamento administra varios proyectos. |
| Employee → Employee | 1:N | Un supervisor puede supervisar varios empleados. |
| Employee → Department | 1:1 | Un empleado puede ser gerente de un departamento. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | Dno | Department (Number) |
| Employee | SuperSSN | Employee (SSN) |
| Department | MgrSSN | Employee (SSN) |
| Project | Dnum | Department (Number) |

---

# 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | Todo empleado debe pertenecer a un departamento existente. |
| IR-02 | Todo proyecto debe pertenecer a un departamento existente. |
| IR-03 | El gerente asignado debe existir como empleado. |
| IR-04 | El supervisor debe existir como empleado. |

---

# 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un departamento puede tener varios empleados. |
| RN-02 | Un departamento administra varios proyectos. |
| RN-03 | Un empleado puede supervisar varios empleados. |
| RN-04 | Cada departamento tiene un gerente. |
| RN-05 | Todo proyecto pertenece a un solo departamento. |

---

# 9. Diagrama Relacional

Department (1) ───────< Employee

Department (1) ───────< Project

Employee (1) ───────< Employee

Employee (1) ─────── Department