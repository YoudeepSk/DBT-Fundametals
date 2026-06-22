
WITH 

orders as 
    (select * from {{ ref('stg_orders') }}
    ),

payments as 
    (select * from {{ ref('stg_payments') }}
    ),




-- logical cte


 payment_totals as (select order_id, 
        max(payment_created_at) as payment_finalized_date, 
        sum(payment_amount) / 100.0 as total_amount_paid

        from payments

        where payment_status <> 'fail'
        group by 1
    ),



 paid_orders as 

    (select orders.order_id as order_id,
        orders.customer_id    as customer_id,
        orders.order_placed_at as order_placed_at,
        orders.order_status as order_status,
        payment_totals.total_amount_paid,
        payment_totals.payment_finalized_date

    from orders
    
    left join payment_totals
    on orders.order_id = payment_totals.order_id
    
    )

select * from paid_orders
