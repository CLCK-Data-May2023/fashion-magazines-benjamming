select c.customer_name as "Customer", 
printf("$%d.00", sum(unpaid.due)) as "Amount Due"
from customers c join
    (select o.customer_id,
    s.price_per_month*s.subscription_length as due, 
    o.order_status
    from orders o join subscriptions s 
    on o.subscription_id = s.subscription_id
    where o.order_status = "unpaid"
    and s.description="Fashion Magazine") unpaid
on c.customer_id = unpaid.customer_id
group by c.customer_name;