

{% set old_relation = adapter.get_relation(
      database = "REFACTORING",
      schema = "DEMO",
      identifier = "CUSTOMER_ORDERS_LEGACY"
) -%}

{% set dbt_relation = ref('fct_customer_orders') %}


{% if execute %}

{{ audit_helper.compare_all_columns(
    a_relation = old_relation,
    b_relation = dbt_relation,
    primary_key = "order_id"
) }}

{% endif %}