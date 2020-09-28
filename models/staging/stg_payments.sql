select 
    orderid, 
    id as customer_id,
    sum(amount) as payment
from raw.stripe.payment