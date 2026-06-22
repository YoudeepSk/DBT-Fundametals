-------------------------------------------------
-- Compare row counts 
-----------------------------------------------

{% set old_relation = adapter.get_relation(
      database = "REFACTORING",
      schema = "DEMO",
      identifier = "CUSTOMER_ORDERS_LEGACY"
) -%}

{% set dbt_relation = ref('fct_customer_orders') %}

{{ audit_helper.compare_row_counts(
    a_relation = old_relation,
    b_relation = dbt_relation
) }}

-------------------------------------------------
-- Compare column values 
-----------------------------------------------
