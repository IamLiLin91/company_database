USE shipping_company;

/* Clear previous data */
DELETE FROM shipping_order;
DELETE FROM payment;
DELETE FROM order_detail;
DELETE FROM product;
DELETE FROM customer;
DELETE FROM employee;

/* Populate the tables with our data */

/* employee table ----------------------------------------------------------------*/
INSERT INTO employee VALUES ('00000001', 'Jimmie', 'Blair', '+65 9976-8421');
INSERT INTO employee VALUES ('00000002', 'Lorena', 'Cohen', '+65 8451-1221');
INSERT INTO employee VALUES ('00000003', 'Lynette', 'Franco', '+65 8421-4224');
INSERT INTO employee VALUES ('00000004', 'Thompson', 'Richards', '+65 8934-5872');
INSERT INTO employee VALUES ('00000005', 'Madden', 'Stone', '+65 9732-1431');
INSERT INTO employee VALUES ('00000006', 'Simon', 'Dyer', '+65 9782-2132');


/* customer table ----------------------------------------------------------------*/
INSERT INTO customer VALUES ('00004001', 'BOVIS', '236 Hegeman Avenue, Poland', '(924) 533-2805');
INSERT INTO customer VALUES ('00004002', 'ISOTRONIC', '859 Strickland Avenue, Qatar', '(985) 580-3482');
INSERT INTO customer VALUES ('00004003', 'AQUASSEUR', '544 Bushwick Place, Honduras', '(58) 974-1224');
INSERT INTO customer VALUES ('00004004', 'INTRAWEAR', '538 Noel Avenue, Germany', '(014) 855-9644');
INSERT INTO customer VALUES ('00004005', 'OCTOCORE', '547 Porter Avenue, Latvia', '(756) 132-1475');


/* product table ----------------------------------------------------------------*/
INSERT INTO product VALUES ('00000901', 'Betamax', 52.36, 90, 150);
INSERT INTO product VALUES ('00000902', 'NES', 200.50, 50, 100);
INSERT INTO product VALUES ('00000903', 'Federal Style Bull\'s Eye Mirrors', 500.60, 100, 150);
INSERT INTO product VALUES ('00000904', 'Duck Decoys', 20.99, 100, 200);
INSERT INTO product VALUES ('00000905', 'RCA Victor Radios', 60.79, 50, 100);
INSERT INTO product VALUES ('00000906', 'PS/2 Keyboards', 30.99, 30, 100);


/* order_detail table ----------------------------------------------------------------*/
INSERT INTO order_detail (order_detail_id, employee_id, product_id, cust_id, quantity, unit_price, discount) VALUES ('x0000001', '00000003', '00000901', '00004001', 10, 52.36, 0);


/* payment table ----------------------------------------------------------------*/
INSERT INTO payment (order_detail_id, pay_method, pay_amt, cc_no, cc_exp_date, cc_owner_name) VALUES ('x0000001', 'CASH', 523.60, NULL, NULL, NULL);

/* shipping_order table ----------------------------------------------------------------*/
INSERT INTO shipping_order (order_detail_id, shipping_method, shipping_addr) VALUES ('x0000001', 'Fedex', '236 Hegeman Avenue, Poland');