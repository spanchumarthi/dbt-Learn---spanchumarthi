select 
orderid, 
sum(case when paymentmethod = 'credit_card' then amount else 0 end) as credit_card__amount,
sum(case when paymentmethod = 'coupon' then amount else 0 end) as coupon_amount,
sum(case when paymentmethod = 'bank_transfer' then amount else 0 end) as bank_transfer__amount,
sum(case when paymentmethod = 'gift_card' then amount else 0 end) as gift_card__amount, 
sum(amount) as total_amount
from {{ source('stripe', 'payment') }}
group by orderid