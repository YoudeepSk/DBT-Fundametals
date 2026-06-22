# DBT Fundamentals – Legacy Model Refactoring

This project demonstrates how a legacy SQL model can be refactored into a modern dbt architecture using staging, intermediate, and mart layers.

---

## Project Goal

The project began with a single legacy model:

📄 [`customer_orders_legacy.sql`](./Refactor/models/legacy/customer_orders_legacy.sql)

The objective was to transform this monolithic SQL query into a modular, maintainable dbt project.

---

## Refactoring Journey

### 1. Legacy Model

The original model contained all business logic in one SQL file.

➡️ [`models/legacy/customer_orders_legacy.sql`](./Refactor/models/legacy/customer_orders_legacy.sql)

---

### 2. Source Data

Raw source tables:

- `jaffle_shop.customers`
- `jaffle_shop.orders`
- `stripe.payment`

---

### 3. Staging Layer

The staging layer standardizes and cleans source data.

- [`stg_customers.sql`](./Refactor/models/staging/stg_customers.sql)
- [`stg_orders.sql`](./Refactor/models/staging/stg_orders.sql)
- [`stg_payments.sql`](./Refactor/models/staging/stg_payments.sql)

---

### 4. Intermediate Layer

Business logic is isolated into reusable models.

- [`int_orders.sql`](./Refactor/models/marts/intermediate/int_orders.sql)

---

### 5. Final Mart

The final fact model produces customer order metrics.

- [`fct_customer_orders.sql`](./Refactor/models/marts/fct_customer_orders.sql)

---

### 6. Auditing

Two audit models were created to validate the refactored output against the legacy implementation.

- [`audit.sql`](./Refactor/analyses/audit.sql)
- [`audit2.sql`](./Refactor/analyses/audit2.sql)

The project also utilizes the `audit_helper` package to compare datasets and validate results.

---

# Project Structure

```text
models/
│
├── legacy/
│   └── customer_orders_legacy.sql
│
├── staging/
│   ├── stg_customers.sql
│   ├── stg_orders.sql
│   └── stg_payments.sql
│
└── marts/
    ├── intermediate/
    │   └── int_orders.sql
    │
    └── fct_customer_orders.sql

analyses/
├── audit.sql
└── audit2.sql
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

---

# Skills Demonstrated

✅ Legacy SQL refactoring

✅ Data modeling

✅ Layered dbt architecture

✅ Source-to-mart lineage

✅ Data validation and auditing

✅ Git version control

✅ Documentation and project organization

---

# Running the Project

```bash
dbt deps
dbt debug
dbt run
dbt test
dbt docs generate
dbt docs serve
```

<img width="1227" height="622" alt="image" src="https://github.com/user-attachments/assets/8c358c4e-efe1-400e-b5e1-2283eecd135d" />
