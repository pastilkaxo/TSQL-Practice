-- 1:

select  Count(*)as [Колличество товаров], SALESREPS.EMPL_NUM , OFFICES.OFFICE from PRODUCTS 
inner join ORDERS on ORDERS.PRODUCT = PRODUCTS.PRODUCT_ID and ORDERS.MFR = PRODUCTS.MFR_ID
inner join SALESREPS on SALESREPS.EMPL_NUM = ORDERS.REP
inner join OFFICES on OFFICES.OFFICE = SALESREPS.REP_OFFICE
group by SALESREPS.EMPL_NUM , OFFICES.OFFICE
order by count(*)  desc

select OFFICES.OFFICE, SALESREPS.EMPL_NUM , count(ORDERS.PRODUCT) from ORDERS 
left join SALESREPS on SALESREPS.EMPL_NUM = ORDERS.REP
inner join OFFICES on OFFICES.OFFICE = SALESREPS.REP_OFFICE
group by OFFICES.OFFICE,SALESREPS.EMPL_NUM  
order by count(ORDERS.PRODUCT)  desc


-- 2:

select * , ORDERS.ORDER_DATE from OFFICES 
inner join SALESREPS on SALESREPS.REP_OFFICE = OFFICES.OFFICE
inner join ORDERS on ORDERS.REP = SALESREPS.EMPL_NUM 
where ORDERS.ORDER_DATE between '2007-01-01' and '2008-01-01'

----------------------------

select sum(ORDERS.QTY) as [Колличество товаров], OFFICES.OFFICE, OFFICES.CITY from ORDERS 
inner join SALESREPS on SALESREPS.EMPL_NUM = ORDERS.REP
inner join OFFICES on OFFICES.OFFICE = SALESREPS.REP_OFFICE
group by  OFFICES.OFFICE, OFFICES.CITY
order by OFFICES.CITY


