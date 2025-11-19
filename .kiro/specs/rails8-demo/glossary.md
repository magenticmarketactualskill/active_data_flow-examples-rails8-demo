# Glossary

## System Components

- **Rails_App**: The Rails 8 web application that hosts the demo
- **Web_Interface**: The browser-based user interface for viewing products and exports

## Data Entities

- **Product_Catalog**: The source database table containing product information
- **Product_Export_Table**: The destination database table containing transformed product data
- **Active_Product**: A product record where the active field equals true

## DataFlow Components

- **DataFlow**: An ActiveDataflow process that reads, transforms, and writes data
- **Product_Sync_Flow**: The specific DataFlow implementation that syncs products to exports
- **Heartbeat_Endpoint**: An HTTP endpoint that triggers DataFlow execution

## Data Transformations

- **Price_Cents**: Product price converted from dollars to cents (multiplied by 100)
- **Category_Slug**: A URL-friendly version of the category name
