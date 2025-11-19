# Glossary - Data Models

## Model Components

- **Product_Model**: The ActiveRecord model representing products in the catalog (app/models/product.rb)
- **ProductExport_Model**: The ActiveRecord model representing exported product data (app/models/product_export.rb)

## Product Model Fields

- **name**: A string field storing the product's display name
- **sku**: A string field storing the Stock Keeping Unit, a unique identifier for the product
- **price**: A decimal field storing the product price in dollars with 2 decimal places
- **category**: A string field storing the product's category classification
- **active**: A boolean field indicating whether the product is currently active in the catalog

## ProductExport Model Fields

- **product_id**: An integer field storing the foreign key reference to the source Product record
- **name**: A string field storing the exported product name
- **sku**: A string field storing the exported product SKU
- **price_cents**: An integer field storing the product price converted to cents (price * 100)
- **category_slug**: A string field storing the URL-friendly version of the category name
- **exported_at**: A datetime field storing when the export occurred

## Query Scopes

- **active_scope**: A query scope that filters products where active equals true
- **inactive_scope**: A query scope that filters products where active equals false
- **by_category_scope**: A query scope that filters products by a specific category
- **recent_scope**: A query scope that orders products by creation date descending
- **price_range_scope**: A query scope that filters products within a specified price range

## Associations

- **product_association**: The belongs_to relationship from ProductExport to Product
- **product_exports_association**: The has_many relationship from Product to ProductExport

## Database Constraints

- **unique_constraint**: A database-level constraint ensuring no duplicate values in a column
- **null_constraint**: A database-level constraint preventing null values in a column
- **foreign_key_constraint**: A database-level constraint ensuring referential integrity between tables
