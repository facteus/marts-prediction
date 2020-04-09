create or replace view nonstore_daily as

select
  to_date(transaction_dttm) as txn_date,
  merchant_category_xcd as mcc_cde,
  sum(transaction_amt - coalesce(transaction_cashback_amt, 0)) as net_amt

from
  signal_monetization.public.signal_master_hist_tagged as signal

where
  decision_xcd = 'T' -- only approved transactions
  and txn_date > to_date('2017-12-31') -- no need to go back further
  and transaction_amt < 5e4 -- assume that anything above $50k is an error
  and transaction_iso_currency_xcd = '840' -- USD; there are CAD ('124') transactions too
  and (merchant_name like '%WALMART.COM%' or merchant_name like '%TARGET.COM%' or
      arm_merchant_id in
      ('1005',
       '1132',
       '1135',
       '1139',
       '1148',
       '122',
       '1256',
       '1297',
       '1325',
       '1353',
       '1563',
       '1564',
       '1565',
       '1566',
       '1579',
       '1581',
       '182',
       '183',
       '189',
       '217',
       '268',
       '332',
       '345',
       '349',
       '358',
       '361',
       '368',
       '461',
       '484',
       '52',
       '523',
       '526',
       '532',
       '589',
       '713',
       '736',
       '749',
       '766',
       '776',
       '849',
       '870')
  )

group by
  txn_date, mcc_cde;
