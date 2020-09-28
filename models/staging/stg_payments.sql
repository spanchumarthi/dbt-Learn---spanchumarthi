select 
    orderid, 
    id as customer_id,
    amount as payment
from raw.stripe.payment
where status = 'success'