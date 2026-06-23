
<img width="1227" height="622" alt="image" src="https://github.com/user-attachments/assets/8c358c4e-efe1-400e-b5e1-2283eecd135d" />

# DBT Fundamentals – Legacy SQL Refactoring

## Project Overview

DBT guided project - https://learn.getdbt.com/courses/refactoring-sql-for-modularity-vs-code

This project demonstrates how a monolithic legacy SQL model can be refactored into a modern dbt architecture using layered data modeling techniques.

The project begins with a single legacy model and progressively transforms it into:

- Sources
- Staging models
- Intermediate models
- Final marts
- Data audits

---

# Starting Point

The original business logic existed in one large SQL file:

📄 [customer_orders_legacy.sql](./Refactor/models/legacy/customer_orders_legacy.sql)

This model was difficult to maintain, test, and extend.

---

# Source Layer

Source definitions establish the connection to the raw source tables.

### Jaffle Shop Sources

📄 [jaffle_shop/sources.yml](./Refactor/models/staging/jaffle_shop/sources.yml)

### Stripe Sources

📄 [stripe/sources.yml](./Refactor/models/staging/stripe/sources.yml)

The source files define:

- customers
- orders
- payments

and provide documentation and lineage within dbt.

---

# Staging Layer

The staging layer standardizes and cleans raw data.

### Jaffle Shop

- 📄 [stg_customers.sql](./Refactor/models/staging/jaffle_shop/stg_customers.sql)
- 📄 [stg_orders.sql](./Refactor/models/staging/jaffle_shop/stg_orders.sql)

### Stripe

- 📄 [stg_payments.sql](./Refactor/models/staging/stripe/stg_payments.sql)

Responsibilities:

- Rename columns
- Standardize naming conventions
- Remove unnecessary fields
- Prepare data for transformations

---

# Intermediate Layer

Business logic is isolated into reusable models.

📄 [int_orders.sql](./Refactor/models/marts/intermediate/int_orders.sql)

This model combines order and payment information before creating the final mart.

---

# Final Mart Layer

The final analytics model:

📄 [fct_customer_orders.sql](./Refactor/models/marts/fct_customer_orders.sql)

This model produces customer order metrics used for reporting and analysis.

---

# Auditing

To validate the refactored models against the legacy implementation, two audit queries were created.

- 📄 [audit.sql](./Refactor/analyses/audit.sql)
- 📄 [audit2.sql](./Refactor/analyses/audit2.sql)

The project also uses the **audit_helper** package to compare model outputs and verify that the refactored logic produces identical results.

---

# Project Structure

```text
Refactor/
│
├── analyses/
│   ├── audit.sql
│   └── audit2.sql
│
├── models/
│   │
│   ├── legacy/
│   │   └── customer_orders_legacy.sql
│   │
│   ├── staging/
│   │   ├── jaffle_shop/
│   │   │   ├── sources.yml
│   │   │   ├── stg_customers.sql
│   │   │   └── stg_orders.sql
│   │   │
│   │   └── stripe/
│   │       ├── sources.yml
│   │       └── stg_payments.sql
│   │
│   └── marts/
│       ├── intermediate/
│       │   └── int_orders.sql
│       │
│       └── fct_customer_orders.sql
```

---

# Lineage Graph

![Lineage Graph](images/lineage.png)

---

# Technologies Used

- dbt Core
- Snowflake
- SQL
- Git & GitHub
- audit_helper package

