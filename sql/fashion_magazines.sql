select customer_name, sum(total) from
(select customer_name, price_per_month*subscription_length as total
 from subscriptions join
(select customer_name, subscription_id
from orders join customers
on orders.customer_id = customers.customer_id
where orders.order_status = "unpaid") unpaid
on unpaid.subscription_id = subscriptions.subscription_id)
group by customer_name