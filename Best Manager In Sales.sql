-- Manager whose region performed best in sales
Use sales_transaction_data;

Select rm.region,
	   rm.manager as Region_Manager_Name,
       round(Sum(st.sales),0) as Total_Regional_sales
From sales_transaction st
	Join regional_manager rm
		On st.region=rm.region
	Join returned_item ri
        On st.order_id=ri.order_id
Where ri.order_status= "Delivered"
Group by st.region
Order by Total_regional_sales desc
Limit 1