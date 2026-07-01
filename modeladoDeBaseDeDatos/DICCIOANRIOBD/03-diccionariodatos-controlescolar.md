# Diccionario de Datos de Base de Datos Control Escolar 

1. informacion  general

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Version | 1.0 | 
| Fecha | Junio 2026 |
| Elaboro | Ing. Alexis Daniel Martinez Mendoza, MIT |
| SGBD | SQLServer |
|
---
2. Descripccion del Sistema de Base de Datos 

El sistema administra:

- Carreras 
- Alumnos
- Profesores 
- Materias 
- Grupos 
- Inscripciones

Permite controla la oferta educativa y la inscripccion de los estudiantes 
---
3. Catalogo de restriccciones utilizadas 

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check  |
| DF | Default |
|
---
4. Diccio0nario de datos 

**Tabla:** Carrera 

**Desccripccion:** __Almacena las carreras ofertadas por las universidad__

| Campo | Tipo | Longitud | Restricciones | Descripccion |
| :--- | :--- | :--- | :--- | :--- |
| id_carrera | INT | - | PK,AI,NN | Identificador unico de la carrera |
| nombre | VARCHAR | 100 | UNQ, NN | Nombre de la carrera  |
| duracion_cuatrimestre | INT | - | NN, CK(>0) | Duracion del cuatrimestre |
| Campo | Tipo | Longitud | Restricciones | Descripccion |
|
---
**Tabla:** Alumno 

**Desccripccion:** __Almacena la informacion de los estudiantes__

| Campo | Tipo | Longitud | Restricciones | Descripccion |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK,AI,NN | Identificador unico del alumon |
| matricula | VARCHAR | 10 | UNQ, NN |  Matricula institucinal |
| nombre | VARCHAR | 50 | NN |   Nombre del estudiante  |
| apellido_paterno | VARCHAR | 50 | Null | Apellido paterno  |
| apellido_materno | VARCHAR | 50 | Null | Apellido materno  |
| Correo | VARCHAR | 100 | UNQ, NN | Correo institucional |
| fecha_nacimineto | DATE | - | NN | Fecha de nacimiento |
| id_carrera | INT | - | FK, NN | Carrera a la que pertenece |
|
---
5. Relaciones 

| Relacion | Cardinalidad | Descripcion  |
| :------- | :----------: | :----------- |
| Carrera -> Alumno     |   1:N   |  Una carrera tiene muchos alumnos       |
| Carrera -> Materia    |   1:N   |  Una carrera tiene muchas materias      |
| Profesor -> Grupo     |   1:N   |  Una profesor tiene muchos grupos       |
| Materia -> Grupo      |   1:N   |  Una materia  tiene muchos grupos       |
| Alumno -> Inscripcion |   1:N   |  Una alumno tiene muchas inscripciones  |
| Grupo -> Inscripcion  |   1:N   |  Una grupo puede tener muchos alumnos   |
|
---
6. Matriz de claves Foraneas 

| Tabla            | Campo FK    | Descripcion                  |
| :-------         | :---------: | :-----------                 |
| Alumno           | id_carrera  |  Carrera   (id_carrera)      |
| Materia          | id_carrera  |  Carrera   (id_carrera)      |
| Grupo            | id_profesor |  Profesor  (id_profesor)     |
| Grupo            | id_materia  |  Materia   (id_materia)      |
| Inscripccion     | id_alumno   |  Alumno    (id_alumno)       |
| Inscripccion     | id_grupo    |  Grupo     (id_grupo)        |
|
---
7. Integridad referencial

| Regla            | Descripcion             |
| :-------         | :---------: |
| IR-01 | No se puede eregistrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |
|
---
8. Reglas del negocio

| Codigo | Regla                                        |
| :----- | :---------:                                  |
| RN-01  | Un alumno pertyenece solo a una sola carrera |
| RN-02  | Una carrera puede tener muchoos alumnos      |
| RN-03  | Una carrera puede tener muchas materias      |
|

9. Diagrama  Relacional 

