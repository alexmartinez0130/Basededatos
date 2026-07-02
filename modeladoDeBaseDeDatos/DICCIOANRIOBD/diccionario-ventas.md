# Diccionario de Datos de la Base de Datos Sistema de Ventas

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Ventas |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Alexis Daniel Martinez Mendoza |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de los clientes, productos, pedidos y el detalle de cada pedido.

Permite controlar:

- Clientes
- Productos
- Pedidos
- Detalle de Pedidos

El sistema permite registrar los pedidos realizados por los clientes y los productos que forman parte de cada uno.

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

## Tabla: Cliente

*Descripción:* Almacena la información de los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdCliente | INT | - | PK, NN | Identificador único del cliente |
| Nombre | VARCHAR | 50 | NN | Nombre del cliente |
| Telefono | VARCHAR | 15 | NULL | Número telefónico |
| Direccion | VARCHAR | 100 | NULL | Dirección del cliente |

---

## Tabla: Producto

*Descripción:* Almacena la información de los productos disponibles.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdProducto | INT | - | PK, NN | Identificador del producto |
| NombreProducto | VARCHAR | 50 | NN | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN | Precio del producto |
| Existencia | INT | - | NN | Cantidad disponible |

---

## Tabla: Pedido

*Descripción:* Almacena los pedidos realizados por los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdPedido | INT | - | PK, NN | Identificador del pedido |
| FechaPedido | DATE | - | NN | Fecha del pedido |
| IdCliente | INT | - | FK, NN | Cliente que realizó el pedido |

---

## Tabla: DetallePedido

*Descripción:* Almacena los productos incluidos en cada pedido.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdDetalle | INT | - | PK, NN | Identificador del detalle |
| Cantidad | INT | - | NN | Cantidad solicitada |
| PrecioUnitario | DECIMAL | 10,2 | NN | Precio unitario del producto |
| IdPedido | INT | - | FK, NN | Pedido al que pertenece |
| IdProducto | INT | - | FK, NN | Producto solicitado |

---

# 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Cliente → Pedido | 1:N | Un cliente puede realizar varios pedidos. |
| Pedido → DetallePedido | 1:N | Un pedido puede contener varios productos. |
| Producto → DetallePedido | 1:N | Un producto puede aparecer en varios pedidos. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | IdCliente | Cliente (IdCliente) |
| DetallePedido | IdPedido | Pedido (IdPedido) |
| DetallePedido | IdProducto | Producto (IdProducto) |

---

# 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un pedido para un cliente inexistente. |
| IR-02 | No se puede registrar un detalle para un pedido inexistente. |
| IR-03 | No se puede registrar un producto inexistente en un detalle de pedido. |

---

# 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar varios pedidos. |
| RN-02 | Todo pedido debe pertenecer a un cliente registrado. |
| RN-03 | Un pedido debe contener al menos un producto. |
| RN-04 | Un producto puede formar parte de varios pedidos. |
| RN-05 | La cantidad de productos debe ser mayor que cero. |

---

# 9. Diagrama Relacional

Cliente (1) ───────────< Pedido (1) ───────────< DetallePedido >─────────── (1) Producto

Cliente
- IdCliente (PK)
- Nombre
- Telefono
- Direccion

Pedido
- IdPedido (PK)
- FechaPedido
- IdCliente (FK)

Producto
- IdProducto (PK)
- NombreProducto
- Precio
- Existencia

DetallePedido
- IdDetalle (PK)
- Cantidad
- PrecioUnitario
- IdPedido (FK)
- IdProducto (FK)