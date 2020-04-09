create or replace view daily_metrics as

select
  to_date(transaction_dttm) as txn_date,
  merchant_category_xcd as mcc_cde,
  sum(transaction_amt - coalesce(transaction_cashback_amt, 0)) as net_amt,
  count(distinct account_reference_xid) as card_cnt,
  count(distinct fi_transaction_id) as txn_cnt

from
  signal_monetization.public.signal_master_hist_tagged as signal

where
  decision_xcd = 'T' -- only approved transactions
  and txn_date > to_date('2014-12-31') -- panel was 1/3 of the size before 2015
  and transaction_amt < 1e5 -- assume that anything above $100k is an error
  and transaction_iso_currency_xcd = '840' -- USD; there are CAD ('124') transactions too
  
group by
  txn_date, mcc_cde;
