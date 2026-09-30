-- Bronze layer: land raw files incrementally. Built in lab 01.
-- ${raw_path} comes from the pipeline configuration in resources/ingestion.pipeline.yml.

-- Reference data (small, re-read on every update)
CREATE OR REFRESH MATERIALIZED VIEW customers
COMMENT "Customer master data from the raw volume"
AS SELECT *
FROM read_files('${raw_path}/customers/', format => 'json');

CREATE OR REFRESH MATERIALIZED VIEW products
COMMENT "Product catalogue from the raw volume"
AS SELECT *
FROM read_files('${raw_path}/products/', format => 'json');

-- TODO (lab-01): Create the streaming table orders_bronze with Auto Loader (STREAM read_files) over '${raw_path}/orders/' in JSON, with schemaEvolutionMode 'addNewColumns', plus source_file and ingested_at columns.
