select customer_name, price_per_month, subscription_length FROM
subscriptions join
(select orders.subscription_id, customers.customer_name from orders join customers
on orders.customer_id = customers.customer_id
where orders.order_status = "unpaid") unpaid
on subscriptions.subscription_id = unpaid.subscription_id;