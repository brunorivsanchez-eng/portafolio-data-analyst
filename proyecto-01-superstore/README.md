# Proyecto 01 — Análisis de Ventas Superstore

## Contexto / Problema de negocio
Análisis de datos de ventas de una tienda retail (Superstore) para identificar
patrones de ventas, rentabilidad por categoría/región, y comportamiento de clientes.
Proyecto realizado como parte de mi transición desde soporte técnico hacia análisis
de datos, con foco en aplicar SQL y modelado de datos a un caso real.

## Fuente de datos
Dataset "Sample Superstore" obtenido de Kaggle:
[https://www.kaggle.com/datasets/himanshuuike/superstore-sales-dataset?resource=download]

Contiene ~10.200 registros de ventas de una tienda retail durante varios años,
con información de clientes, productos, ubicación geográfica y transacciones.

## Herramientas usadas
- PostgreSQL (alojado en Neon) — modelado y consultas
- pgAdmin — administración de base de datos
- Power BI — dashboards [pendiente]

## Proceso

1. **Carga inicial (staging)**: se importaron los datos crudos del CSV a una
   tabla plana (`staging_superstore`) sin modificar su estructura original.

2. **Modelado de datos**: se diseñó un modelo relacional tipo estrella (star
   schema) a partir de la tabla plana, separando la información en:
   - `Cliente` (dimensión)
   - `Producto` (dimensión)
   - `Ubicacion` (dimensión)
   - `Venta` (tabla de hechos, conectada a las 3 dimensiones anteriores)

3. **Limpieza y control de calidad de datos**: antes de cargar las tablas
   normalizadas, se validó la integridad de las claves propuestas.

## Hallazgos de calidad de datos

- Se detectó que un **1.72% de los `product_id`** (32 de 1.862) tenían más de
  un `product_name` asociado, afectando 343 filas (3.4% del total) —
  posiblemente por errores de captura o reutilización de códigos en el
  sistema origen. Se determinó que el identificador seguía siendo confiable
  como clave única; se resolvió aplicando `MAX(product_name)` para garantizar
  unicidad sin perder integridad del modelo.

- `Order ID` no es único por fila (un mismo pedido puede incluir varios
  productos), por lo que se utilizó `Row ID` como clave primaria de la tabla
  de hechos `Venta`.

## Insights del análisis
[completar una vez que tengamos las queries de análisis y el dashboard]

## Cómo ver el proyecto
- Consultas SQL: [`/sql/consultas.sql`](./sql/consultas.sql)
- Dashboard Power BI: [pendiente]
