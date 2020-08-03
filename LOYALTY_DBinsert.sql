use loyalty2;


INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (21225, 'HARRY', 'POSTPAID', '223-3234', '2017', 'Y');
INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (21226, 'JOHN', 'HYBRID', '215-8995', '2018', 'Y');
INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (21231, 'SHAUN', 'PREPAID', '228-3245', '2017', 'Y');
INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (21344, 'RON', 'POSTPAID', '889-2546', '2018', 'Y');
INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (22567, 'DON', 'PREPAID', '678-1419', '2018', 'Y');
INSERT INTO `loyalty2`.`customer`(`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_TYPE`, `CUSTOMER_PHONE`, `CUSTOMER_START_DATE`, `CUSTOMER_STATUS`) VALUES (23119, 'ERIC', 'POSTPAID', '678-3998', '2019', 'Y');


SELECT * FROM CUSTOMER;

INSERT INTO `loyalty2`.`purchase`(`PURCHASE_ID`, `CUSTOMER_ID`, `PURCHASE_VAS_TYPE`, `PURCHASE_PAYMENT_TYPE`, `PURCHASE_COUNT`, `PURCHASE_DATE`,`DEAL_ID`,`POINTS_EARNED`,`POINTS_REDEMEED`) VALUES (100, 21225, 'Data3', 'Upfront', '3', '3-10-2018','ABC123',10,20);
INSERT INTO `loyalty2`.`purchase`(`PURCHASE_ID`, `CUSTOMER_ID`, `PURCHASE_VAS_TYPE`, `PURCHASE_PAYMENT_TYPE`, `PURCHASE_COUNT`, `PURCHASE_DATE`,`DEAL_ID`,`POINTS_EARNED`,`POINTS_REDEMEED`)VALUES (100, 21231, 'Talk8', 'Upfront', '2', '7-10-2018','ABD123',5,15);	

select * from purchase;
update loyalty2.purchase set PURCHASE_ID='101' where CUSTOMER_ID=21231;

INSERT INTO `loyalty2`.`deal`(`DEAL_ID`, `DEAL_START_DATE`, `DEAL_DURATION`, `DEAL_TYPE`, `DEAL_VAS`) VALUES ('ABC123',12/12/2017, '5', 'POSTPAIDDEAL','VALID');
INSERT INTO `loyalty2`.`deal`(`DEAL_ID`, `DEAL_START_DATE`, `DEAL_DURATION`, `DEAL_TYPE`, `DEAL_VAS`) VALUES ('ABR123', 05/12/2018, '9', 'POSTPAIDDEAL','VALID');

select * from deal;

INSERT INTO `loyalty2`.`loyalty_points`(`LP_ID`, `LOYALTY_POINTS_VALUE`, `LOYALTY_POINT_DEFAULT_VALUE`, `REDEMPTION_LAST_DATE`, `POINTS_REDEMPTION_ELGIBILITY`,`POINTS_REDEMPTION_METHOD`,`FINAL_VAL`) VALUES ('LP1',NULL, NULL, '06-08-2019','Y','Adjustment',NULL);
INSERT INTO `loyalty2`.`loyalty_points`(`LP_ID`, `LOYALTY_POINTS_VALUE`, `LOYALTY_POINT_DEFAULT_VALUE`, `REDEMPTION_LAST_DATE`, `POINTS_REDEMPTION_ELGIBILITY`,`POINTS_REDEMPTION_METHOD`,`FINAL_VAL`) VALUES ('LP5',NULL, NULL, '07-10-2019','Y','Adjustment',NULL);

select * from loyalty_points;

INSERT INTO `loyalty2`.`customer_has_loyalty_points`(`customer_CUSTOMER_ID`, `loyalty_points_LP_ID`) VALUES (21225, 'LP1');
INSERT INTO `loyalty2`.`customer_has_loyalty_points`(`customer_CUSTOMER_ID`, `loyalty_points_LP_ID`) VALUES (21231, 'LP5');

select * from customer_has_loyalty_points;


INSERT INTO `loyalty2`.`purchase_has_DEAL`(`purchase_PURCHASE_ID`, `purchase_CUSTOMER_ID`) VALUES (100,21225);
INSERT INTO `loyalty2`.`purchase_has_DEAL`(`purchase_PURCHASE_ID`, `purchase_CUSTOMER_ID`) VALUES (101, 21231);

select * from purchase_has_DEAL;
update `loyalty2`.`purchase_has_DEAL` set `DEAL_ID`='ABR123' where `purchase_CUSTOMER_ID`=21231;

INSERT INTO `loyalty2`.`value added services`(`PLAN_ID`, `PLAN_TYPE`,`VAS`,`PAYMENT_AMOUNT`,`PLAN_DESCRIPTION`) VALUES (200,3,'Data3','3 without tax','Data Plan');
INSERT INTO `loyalty2`.`value added services`(`PLAN_ID`, `PLAN_TYPE`,`VAS`,`PAYMENT_AMOUNT`,`PLAN_DESCRIPTION`) VALUES (201,8,'Talk8','8 without tax','Talktime Plan');

select * from `loyalty2`.`value added services`;

INSERT INTO `loyalty2`.`purchase_has_value added services`(`purchase_PURCHASE_ID`, `purchase_customer_CUSTOMER_ID`,`Value Added Services_PLAN_ID`) VALUES (100,21225,200);
INSERT INTO `loyalty2`.`purchase_has_value added services`(`purchase_PURCHASE_ID`, `purchase_customer_CUSTOMER_ID`,`Value Added Services_PLAN_ID`) VALUES (101,21231,201);

select * from `loyalty2`.`purchase_has_value added services`;

INSERT INTO `loyalty2`.`deal_has_value added services`(`DEAL_purchase_PURCHASE_ID`, `DEAL_purchase_customer_CUSTOMER_ID`,`DEAL_ID`,`Value Added Services_PLAN_ID`) VALUES (100,21225,'ABC123',200);
INSERT INTO `loyalty2`.`deal_has_value added services`(`DEAL_purchase_PURCHASE_ID`, `DEAL_purchase_customer_CUSTOMER_ID`,`DEAL_ID`,`Value Added Services_PLAN_ID`) VALUES (101,21231,'ABR123',201);
select * from `loyalty2`.`deal_has_value added services`;



