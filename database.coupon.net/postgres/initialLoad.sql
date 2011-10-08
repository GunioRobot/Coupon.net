INSERT INTO store."tbBank"  ("bank_nm", "url_logo_ds", "febraban_id")
VALUES ('Banese', NULL, 491);
INSERT INTO store."tbBank"  ("bank_nm", "url_logo_ds", "febraban_id")
VALUES ('Banco do Brasil', NULL, 1);

INSERT INTO store."tbCategory" ("category_nm") VALUES ('Eletrônicos');

INSERT INTO store."tbCardOperator" ("operator_nm") VALUES ('MasterCard');
INSERT INTO store."tbCardOperator" ("operator_nm") VALUES ('Visa');

INSERT INTO store."tbPartner" ("fantasy_nm", "cnpj_nr", "site_url_ds", "complete_address_ds")
VALUES ('DATAPEL', 10446469000102, 'http://www.datapel.com.br/', 'Rua Tal, nº tal, Bairro Tal, Aracaju/SE');

INSERT INTO store."tbProduct" ("product_ds", "product_nm")
VALUES ('Macbook Air 13"", 128 GB HD SSD, 4 GB RAM, Mac OS X Lion', 'Macbook Air 13"""');

INSERT INTO store."tbPhoneContact" ("ddi_nr", "ddd_nr", "phone_nr")
VALUES (55,79,88880000);

INSERT INTO store."tbUser" ("user_nm", "email_ds", "pass_ds", "user_st", "user_tp")
VALUES ('Administrador', 'admin@admin.com', '123456', 1, 1);
INSERT INTO store."tbUser" ("user_nm", "email_ds", "pass_ds", "user_st", "user_tp")
VALUES ('Cliente01', 'cliente@zeroum.com', '123456', 0, 0);

INSERT INTO store."tbContract" ("start_contract_dt", "perc_gain_vl", "partner_id" )
VALUES ('2011-06-01', 0.5, 1);

INSERT INTO store."tbDeal" ("deal_nm", "text_ds", "market_vl", "discount_vl", 
"deal_st", "contract_id", "category_id")
VALUES ('Macbook incrível a 70%!', 'Lorem ipsur bacon', 3500.00, 2450.00, 
1,1,1);

INSERT INTO store."tbProductDeal" ("deal_id", "product_id") VALUES (1,1);

INSERT INTO store."tbPartnerPhoneContact" ("partner_id", "phone_id") VALUES (1,1);

INSERT INTO store."tbPartnerAdminUser" ("partner_id", "user_id") VALUES (1,1);

INSERT INTO store."tbPayment"  VALUES (1,1,1);

INSERT INTO store."tbPaymentCard"  ("payment_id", "card_holder_nm", "card_nr", "security_id", "expiration_dt")
VALUES (1,'ERICK MENDONCA', '4123135454', '451', '2013-01-01');

INSERT INTO store."tbCoupon"  ("deal_id", "user_id", "coupon_nr", "expiration_dt", "coupon_st", "payment_id")
VALUES (1,2,400,'2011-12-01', 0,1);

INSERT INTO store."tbCustomer" ("cpf_nr", "customer_nm", "user_id")
VALUES (70020896760, 'Ariosvaldo Santana', 2);