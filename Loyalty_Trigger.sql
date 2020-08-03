
delimiter |
create trigger trg_wf_22
before update on purchase
for each row 
	IF new.purchase_count > 3 THEN 
		set new.purchase_count=0;
     END IF   
|


delimiter |	
create trigger trg_wf_23
before update on loyalty_points
for each row 
set new.FINAL_VAL=new.LOYALTY_POINTS_VALUE+new.LOYALTY_POINT_DEFAULT_VALUE
|







