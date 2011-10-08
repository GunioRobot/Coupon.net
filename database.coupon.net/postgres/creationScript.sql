--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.1
-- Started on 2011-08-28 22:57:00

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1937 (class 1262 OID 16392)
-- Name: DB_storeColetiva; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "coupon.net_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE "coupon.net_db" OWNER TO postgres;

\connect "coupon.net_db"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 16393)
-- Name: store; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA store;


ALTER SCHEMA store OWNER TO postgres;

--
-- TOC entry 357 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = store, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1560 (class 1259 OID 16535)
-- Dependencies: 7
-- Name: tbReview; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbReview" (
    "user_id" integer NOT NULL,
    "deal_id" integer NOT NULL,
    "review_dt" date NOT NULL,
    "review_st" smallint,
    "text_ds" character varying(2000)
);


ALTER TABLE store."tbReview" OWNER TO postgres;

--
-- TOC entry 1566 (class 1259 OID 16609)
-- Dependencies: 7
-- Name: tbBank; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbBank" (
    "bank_id" serial NOT NULL,
    "bank_nm" character varying(50) NOT NULL,
    "url_logo_ds" character varying(255),
    "febraban_id" smallint
);


ALTER TABLE store."tbBank" OWNER TO postgres;

--
-- TOC entry 1554 (class 1259 OID 16446)
-- Dependencies: 7
-- Name: tbCategory; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCategory" (
    "category_id" serial NOT NULL,
    "category_nm" character varying(50) NOT NULL,
    "superior_category_id" integer
);


ALTER TABLE store."tbCategory" OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 16394)
-- Dependencies: 7
-- Name: tbCustomer; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCustomer" (
    "customer_id" serial NOT NULL,
    "cpf_nr" bigint,
    "customer_nm" character varying(255) NOT NULL,
    "user_id" integer NOT NULL
);


ALTER TABLE store."tbCustomer" OWNER TO postgres;

--
-- TOC entry 1555 (class 1259 OID 16463)
-- Dependencies: 7
-- Name: tbContract; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbContract" (
    "contract_id" serial NOT NULL,
    "start_contract_dt" date NOT NULL,
    "end_contract_dt" date,
    "perc_gain_vl" numeric(3,2) NOT NULL,
    "partner_id" integer NOT NULL
);


ALTER TABLE store."tbContract" OWNER TO postgres;

--
-- TOC entry 1561 (class 1259 OID 16554)
-- Dependencies: 7
-- Name: tbCoupon; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCoupon" (
    "coupon_id" serial NOT NULL,
    "deal_id" integer NOT NULL,
    "user_id" integer,
    "coupon_nr" integer NOT NULL,
    "expiration_dt" date NOT NULL,
    "used_dt" date,
    "coupon_st" smallint NOT NULL,
    "payment_id" integer NOT NULL
);


ALTER TABLE store."tbCoupon" OWNER TO postgres;

--
-- TOC entry 1569 (class 1259 OID 16649)
-- Dependencies: 7
-- Name: tbRestriction; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbRestriction" (
    "deal_id" integer NOT NULL,
    "minimum_qt" smallint,
    "maximum_qt" smallint,
    "maximum_per_customer_qt" smallint NOT NULL,
    "start_dt" date NOT NULL,
    "end_dt" date NOT NULL
);


ALTER TABLE store."tbRestriction" OWNER TO postgres;

--
-- TOC entry 1553 (class 1259 OID 16428)
-- Dependencies: 7
-- Name: tbDeal; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbDeal" (
    "deal_id" serial NOT NULL,
    "deal_nm" character varying(100) NOT NULL,
    "text_ds" character varying(2000) NOT NULL,
    "market_vl" numeric(9,2) NOT NULL,
    "discount_vl" numeric(9,2) NOT NULL,
    "image_url_ds" character varying(255),
    "info_url_ds" character varying(255),
    "deal_st" smallint NOT NULL,
    "contract_id" integer NOT NULL,
    "category_id" integer
);


ALTER TABLE store."tbDeal" OWNER TO postgres;

--
-- TOC entry 1567 (class 1259 OID 16619)
-- Dependencies: 7
-- Name: tbProductDeal; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbProductDeal" (
    "deal_id" integer NOT NULL,
    "product_id" integer NOT NULL
);


ALTER TABLE store."tbProductDeal" OWNER TO postgres;

--
-- TOC entry 1568 (class 1259 OID 16634)
-- Dependencies: 7
-- Name: tbServiceDeal; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbServiceDeal" (
    "deal_id" integer NOT NULL,
    "service_id" integer NOT NULL
);


ALTER TABLE store."tbServiceDeal" OWNER TO postgres;

--
-- TOC entry 1564 (class 1259 OID 16589)
-- Dependencies: 7
-- Name: tbCardOperator; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCardOperator" (
    "card_operator_id" serial NOT NULL,
    "operator_nm" character varying(50) NOT NULL
);


ALTER TABLE store."tbCardOperator" OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 16569)
-- Dependencies: 7
-- Name: tbPayment; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPayment" (
    "payment_id" serial NOT NULL,
    "payment_tp" smallint NOT NULL,
    "payment_st" smallint NOT NULL
);


ALTER TABLE store."tbPayment" OWNER TO postgres;

--
-- TOC entry 1565 (class 1259 OID 16599)
-- Dependencies: 7
-- Name: tbPaymentBillet; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPaymentBillet" (
    "payment_id" integer NOT NULL,
    "barcode_nr" character varying(100) NOT NULL,
    "expiration_dt" date NOT NULL,
    "bank_id" integer NOT NULL
);


ALTER TABLE store."tbPaymentBillet" OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 16579)
-- Dependencies: 7
-- Name: tbPaymentCard; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPaymentCard" (
    "payment_id" integer NOT NULL,
    "card_holder_nm" character varying(100) NOT NULL,
    "card_nr" character varying(20) NOT NULL,
    "security_id" character varying(5) NOT NULL,
    "expiration_dt" date NOT NULL,
    "card_operator_id" integer
);


ALTER TABLE store."tbPaymentCard" OWNER TO postgres;

--
-- TOC entry 1556 (class 1259 OID 16468)
-- Dependencies: 7
-- Name: tbPartner; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPartner" (
    "partner_id" serial NOT NULL,
    "fantasy_nm" character varying(255) NOT NULL,
    "cnpj_nr" bigint NOT NULL,
    "site_url_ds" character varying(255) NOT NULL,
    "complete_address_ds" character varying(1000) NOT NULL,
    "url_logo_ds" character varying(255)
);


ALTER TABLE store."tbPartner" OWNER TO postgres;

--
-- TOC entry 1558 (class 1259 OID 16489)
-- Dependencies: 7
-- Name: tbPartnerContactPhone; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPartnerContactPhone" (
    "partner_id" integer NOT NULL,
    "phone_id" integer NOT NULL,
    "contact_id" character varying(500)
);


ALTER TABLE store."tbPartnerContactPhone" OWNER TO postgres;

--
-- TOC entry 1559 (class 1259 OID 16507)
-- Dependencies: 7
-- Name: tbPartnerAdminUser; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPartnerAdminUser" (
    "partner_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "responsible_ds" character varying(500)
);


ALTER TABLE store."tbPartnerAdminUser" OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 16412)
-- Dependencies: 7
-- Name: tbProduct; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbProduct" (
    "product_id" serial NOT NULL,
    "product_ds" character varying(2000) NOT NULL,
    "product_nm" character varying(255) NOT NULL,
    "brand_nm" character varying(100),
    "info_url_ds" character varying(500)
);


ALTER TABLE store."tbProduct" OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 16420)
-- Dependencies: 7
-- Name: tbService; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbService" (
    "service_id" serial NOT NULL,
    "service_ds" character varying(2000) NOT NULL,
    "service_nm" character varying(255) NOT NULL,
    "provider_nm" character varying(100) NOT NULL,
    "info_url_ds" character varying(500) NOT NULL
);


ALTER TABLE store."tbService" OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 16481)
-- Dependencies: 7
-- Name: tbPhoneContact; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPhoneContact" (
    "phone_id" serial NOT NULL,
    "ddi_nr" smallint,
    "ddd_nr" smallint NOT NULL,
    "phone_nr" integer NOT NULL,
    "additional_info_ds" character varying(1000)
);


ALTER TABLE store."tbPhoneContact" OWNER TO postgres;

--
-- TOC entry 1550 (class 1259 OID 16399)
-- Dependencies: 7
-- Name: tbUser; Type: TABLE; Schema: store; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbUser" (
    "user_id" serial NOT NULL,
    "user_nm" character varying(50) NOT NULL,
    "email_ds" character varying(255) NOT NULL,
    "pass_ds" character varying(255) NOT NULL,
    "user_st" smallint NOT NULL,
    "user_tp" smallint NOT NULL
);


ALTER TABLE store."tbUser" OWNER TO postgres;

--
-- TOC entry 1925 (class 0 OID 16535)
-- Dependencies: 1560
-- Data for Name: tbReview; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbReview" ("user_id", "deal_id", "review_dt", "review_st", "text_ds") FROM stdin;
\.


--
-- TOC entry 1931 (class 0 OID 16609)
-- Dependencies: 1566
-- Data for Name: tbBank; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbBank" ("bank_id", "bank_nm", "url_logo_ds", "febraban_id") FROM stdin;
\.


--
-- TOC entry 1919 (class 0 OID 16446)
-- Dependencies: 1554
-- Data for Name: tbCategory; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbCategory" ("category_id", "category_nm", "superior_category_id") FROM stdin;
\.


--
-- TOC entry 1914 (class 0 OID 16394)
-- Dependencies: 1549
-- Data for Name: tbCustomer; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbCustomer" ("customer_id", "cpf_nr", "customer_nm", "user_id") FROM stdin;
\.


--
-- TOC entry 1920 (class 0 OID 16463)
-- Dependencies: 1555
-- Data for Name: tbContract; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbContract" ("contract_id", "start_contract_dt", "end_contract_dt", "perc_gain_vl", "partner_id") FROM stdin;
\.


--
-- TOC entry 1926 (class 0 OID 16554)
-- Dependencies: 1561
-- Data for Name: tbCoupon; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbCoupon" ("coupon_id", "deal_id", "user_id", "coupon_nr", "expiration_dt", "used_dt", "coupon_st", "payment_id") FROM stdin;
\.


--
-- TOC entry 1934 (class 0 OID 16649)
-- Dependencies: 1569
-- Data for Name: tbRestriction; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbRestriction" ("deal_id", "minimum_qt", "maximum_qt", "maximum_per_customer_qt", "start_dt", "end_dt") FROM stdin;
\.


--
-- TOC entry 1918 (class 0 OID 16428)
-- Dependencies: 1553
-- Data for Name: tbDeal; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbDeal" ("deal_id", "deal_nm", "text_ds", "market_vl", "discount_vl", "image_url_ds", "info_url_ds", "deal_st", "contract_id", "category_id") FROM stdin;
\.


--
-- TOC entry 1932 (class 0 OID 16619)
-- Dependencies: 1567
-- Data for Name: tbProductDeal; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbProductDeal" ("deal_id", "product_id") FROM stdin;
\.


--
-- TOC entry 1933 (class 0 OID 16634)
-- Dependencies: 1568
-- Data for Name: tbServiceDeal; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbServiceDeal" ("deal_id", "service_id") FROM stdin;
\.


--
-- TOC entry 1929 (class 0 OID 16589)
-- Dependencies: 1564
-- Data for Name: tbCardOperator; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbCardOperator" ("card_operator_id", "operator_nm") FROM stdin;
\.


--
-- TOC entry 1927 (class 0 OID 16569)
-- Dependencies: 1562
-- Data for Name: tbPayment; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPayment" ("payment_id", "payment_tp", "payment_st") FROM stdin;
\.


--
-- TOC entry 1930 (class 0 OID 16599)
-- Dependencies: 1565
-- Data for Name: tbPaymentBillet; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPaymentBillet" ("payment_id", "barcode_nr", "expiration_dt", "bank_id") FROM stdin;
\.


--
-- TOC entry 1928 (class 0 OID 16579)
-- Dependencies: 1563
-- Data for Name: tbPaymentCard; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPaymentCard" ("payment_id", "card_holder_nm", "card_nr", "security_id", "expiration_dt", "card_operator_id") FROM stdin;
\.


--
-- TOC entry 1921 (class 0 OID 16468)
-- Dependencies: 1556
-- Data for Name: tbPartner; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPartner" ("partner_id", "fantasy_nm", "cnpj_nr", "site_url_ds", "complete_address_ds", "url_logo_ds") FROM stdin;
\.


--
-- TOC entry 1923 (class 0 OID 16489)
-- Dependencies: 1558
-- Data for Name: tbPartnerContactPhone; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPartnerContactPhone" ("partner_id", "phone_id", "contact_id") FROM stdin;
\.


--
-- TOC entry 1924 (class 0 OID 16507)
-- Dependencies: 1559
-- Data for Name: tbPartnerAdminUser; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPartnerAdminUser" ("partner_id", "user_id", "responsible_ds") FROM stdin;
\.


--
-- TOC entry 1916 (class 0 OID 16412)
-- Dependencies: 1551
-- Data for Name: tbProduct; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbProduct" ("product_id", "product_ds", "product_nm", "brand_nm", "info_url_ds") FROM stdin;
\.


--
-- TOC entry 1917 (class 0 OID 16420)
-- Dependencies: 1552
-- Data for Name: tbService; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbService" ("service_id", "service_ds", "service_nm", "provider_nm", "info_url_ds") FROM stdin;
\.


--
-- TOC entry 1922 (class 0 OID 16481)
-- Dependencies: 1557
-- Data for Name: tbPhoneContact; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbPhoneContact" ("phone_id", "ddi_nr", "ddd_nr", "phone_nr", "additional_info_ds") FROM stdin;
\.


--
-- TOC entry 1915 (class 0 OID 16399)
-- Dependencies: 1550
-- Data for Name: tbUser; Type: TABLE DATA; Schema: store; Owner: postgres
--

COPY "tbUser" ("user_id", "user_nm", "email_ds", "pass_ds", "user_st", "user_tp") FROM stdin;
\.


--
-- TOC entry 1872 (class 2606 OID 16542)
-- Dependencies: 1560 1560 1560
-- Name: pkAvaliacao; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbReview"
    ADD CONSTRAINT "pkAvaliacao" PRIMARY KEY ("user_id", "deal_id");


--
-- TOC entry 1884 (class 2606 OID 16613)
-- Dependencies: 1566 1566
-- Name: pkBanco; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbBank"
    ADD CONSTRAINT "pkBanco" PRIMARY KEY ("bank_id");


--
-- TOC entry 1860 (class 2606 OID 16450)
-- Dependencies: 1554 1554
-- Name: pkCategoria; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCategory"
    ADD CONSTRAINT "pkCategoria" PRIMARY KEY ("category_id");


--
-- TOC entry 1848 (class 2606 OID 16398)
-- Dependencies: 1549 1549
-- Name: pkCliente; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCustomer"
    ADD CONSTRAINT "pkCliente" PRIMARY KEY ("customer_id");


--
-- TOC entry 1862 (class 2606 OID 16467)
-- Dependencies: 1555 1555
-- Name: pkContrato; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbContract"
    ADD CONSTRAINT "pkContrato" PRIMARY KEY ("contract_id");


--
-- TOC entry 1874 (class 2606 OID 16558)
-- Dependencies: 1561 1561
-- Name: pkCupom; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCoupon"
    ADD CONSTRAINT "pkCupom" PRIMARY KEY ("coupon_id");


--
-- TOC entry 1890 (class 2606 OID 16653)
-- Dependencies: 1569 1569
-- Name: pkLimite; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbRestriction"
    ADD CONSTRAINT "pkLimite" PRIMARY KEY ("deal_id");


--
-- TOC entry 1857 (class 2606 OID 16435)
-- Dependencies: 1553 1553
-- Name: pkOferta; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbDeal"
    ADD CONSTRAINT "pkOferta" PRIMARY KEY ("deal_id");


--
-- TOC entry 1886 (class 2606 OID 16623)
-- Dependencies: 1567 1567 1567
-- Name: pkOfertaProduto; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbProductDeal"
    ADD CONSTRAINT "pkOfertaProduto" PRIMARY KEY ("deal_id", "product_id");


--
-- TOC entry 1888 (class 2606 OID 16638)
-- Dependencies: 1568 1568 1568
-- Name: pkOfertaServico; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbServiceDeal"
    ADD CONSTRAINT "pkOfertaServico" PRIMARY KEY ("deal_id", "service_id");


--
-- TOC entry 1880 (class 2606 OID 16593)
-- Dependencies: 1564 1564
-- Name: pkOperadoraCartao; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCardOperator"
    ADD CONSTRAINT "pkOperadoraCartao" PRIMARY KEY ("card_operator_id");


--
-- TOC entry 1876 (class 2606 OID 16573)
-- Dependencies: 1562 1562
-- Name: pkPagamento; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPayment"
    ADD CONSTRAINT "pkPagamento" PRIMARY KEY ("payment_id");


--
-- TOC entry 1882 (class 2606 OID 16603)
-- Dependencies: 1565 1565
-- Name: pkPagamentoBoleto; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPaymentBillet"
    ADD CONSTRAINT "pkPagamentoBoleto" PRIMARY KEY ("payment_id");


--
-- TOC entry 1878 (class 2606 OID 16583)
-- Dependencies: 1563 1563
-- Name: pkPagamentoCartao; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPaymentCard"
    ADD CONSTRAINT "pkPagamentoCartao" PRIMARY KEY ("payment_id");


--
-- TOC entry 1864 (class 2606 OID 16475)
-- Dependencies: 1556 1556
-- Name: pkParceiro; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPartner"
    ADD CONSTRAINT "pkParceiro" PRIMARY KEY ("partner_id");


--
-- TOC entry 1868 (class 2606 OID 16496)
-- Dependencies: 1558 1558 1558
-- Name: pkParceiroTelefone; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPartnerContactPhone"
    ADD CONSTRAINT "pkParceiroTelefone" PRIMARY KEY ("partner_id", "phone_id");


--
-- TOC entry 1870 (class 2606 OID 16514)
-- Dependencies: 1559 1559 1559
-- Name: pkParceiroUsuarioResponsavel; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPartnerAdminUser"
    ADD CONSTRAINT "pkParceiroUsuarioResponsavel" PRIMARY KEY ("partner_id", "user_id");


--
-- TOC entry 1852 (class 2606 OID 16419)
-- Dependencies: 1551 1551
-- Name: pkProduto; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbProduct"
    ADD CONSTRAINT "pkProduto" PRIMARY KEY ("product_id");


--
-- TOC entry 1854 (class 2606 OID 16427)
-- Dependencies: 1552 1552
-- Name: pkServico; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbService"
    ADD CONSTRAINT "pkServico" PRIMARY KEY ("service_id");


--
-- TOC entry 1866 (class 2606 OID 16485)
-- Dependencies: 1557 1557
-- Name: pkTelefone; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPhoneContact"
    ADD CONSTRAINT "pkTelefone" PRIMARY KEY ("phone_id");


--
-- TOC entry 1850 (class 2606 OID 16406)
-- Dependencies: 1550 1550
-- Name: pkUsuario; Type: CONSTRAINT; Schema: store; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbUser"
    ADD CONSTRAINT "pkUsuario" PRIMARY KEY ("user_id");


--
-- TOC entry 1858 (class 1259 OID 16456)
-- Dependencies: 1554
-- Name: fki_fkCategoriaCategoria; Type: INDEX; Schema: store; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_fkCategoriaCategoria" ON "tbCategory" USING btree ("superior_category_id");


--
-- TOC entry 1855 (class 1259 OID 16462)
-- Dependencies: 1553
-- Name: fki_fkOfertaCategoria; Type: INDEX; Schema: store; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_fkOfertaCategoria" ON "tbDeal" USING btree ("category_id");


--
-- TOC entry 1901 (class 2606 OID 16548)
-- Dependencies: 1560 1856 1553
-- Name: fkAvaliacaoOferta; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbReview"
    ADD CONSTRAINT "fkAvaliacaoOferta" FOREIGN KEY ("deal_id") REFERENCES "tbDeal"("deal_id");


--
-- TOC entry 1900 (class 2606 OID 16543)
-- Dependencies: 1550 1849 1560
-- Name: fkAvaliacaoUsuario; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbReview"
    ADD CONSTRAINT "fkAvaliacaoUsuario" FOREIGN KEY ("user_id") REFERENCES "tbUser"("user_id");


--
-- TOC entry 1894 (class 2606 OID 16451)
-- Dependencies: 1859 1554 1554
-- Name: fkCategoriaCategoria; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbCategory"
    ADD CONSTRAINT "fkCategoriaCategoria" FOREIGN KEY ("superior_category_id") REFERENCES "tbCategory"("category_id");


--
-- TOC entry 1891 (class 2606 OID 16407)
-- Dependencies: 1849 1549 1550
-- Name: fkClienteUsuario; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbCustomer"
    ADD CONSTRAINT "fkClienteUsuario" FOREIGN KEY ("user_id") REFERENCES "tbUser"("user_id");


--
-- TOC entry 1895 (class 2606 OID 16525)
-- Dependencies: 1556 1863 1555
-- Name: fkContratoParceiro; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbContract"
    ADD CONSTRAINT "fkContratoParceiro" FOREIGN KEY ("partner_id") REFERENCES "tbPartner"("partner_id");


--
-- TOC entry 1903 (class 2606 OID 16564)
-- Dependencies: 1856 1561 1553
-- Name: fkCupomOferta; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbCoupon"
    ADD CONSTRAINT "fkCupomOferta" FOREIGN KEY ("deal_id") REFERENCES "tbDeal"("deal_id");


--
-- TOC entry 1904 (class 2606 OID 16574)
-- Dependencies: 1875 1561 1562
-- Name: fkCupomPagamento; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbCoupon"
    ADD CONSTRAINT "fkCupomPagamento" FOREIGN KEY ("payment_id") REFERENCES "tbPayment"("payment_id");


--
-- TOC entry 1902 (class 2606 OID 16559)
-- Dependencies: 1849 1550 1561
-- Name: fkCupomUsuario; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbCoupon"
    ADD CONSTRAINT "fkCupomUsuario" FOREIGN KEY ("user_id") REFERENCES "tbUser"("user_id");


--
-- TOC entry 1892 (class 2606 OID 16457)
-- Dependencies: 1859 1553 1554
-- Name: fkOfertaCategoria; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbDeal"
    ADD CONSTRAINT "fkOfertaCategoria" FOREIGN KEY ("category_id") REFERENCES "tbCategory"("category_id");


--
-- TOC entry 1893 (class 2606 OID 16530)
-- Dependencies: 1553 1555 1861
-- Name: fkOfertaContrato; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbDeal"
    ADD CONSTRAINT "fkOfertaContrato" FOREIGN KEY ("contract_id") REFERENCES "tbContract"("contract_id");


--
-- TOC entry 1909 (class 2606 OID 16624)
-- Dependencies: 1856 1553 1567
-- Name: fkOfertaProdutoOferta; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbProductDeal"
    ADD CONSTRAINT "fkOfertaProdutoOferta" FOREIGN KEY ("deal_id") REFERENCES "tbDeal"("deal_id");


--
-- TOC entry 1910 (class 2606 OID 16629)
-- Dependencies: 1551 1851 1567
-- Name: fkOfertaProdutoProduto; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbProductDeal"
    ADD CONSTRAINT "fkOfertaProdutoProduto" FOREIGN KEY ("product_id") REFERENCES "tbProduct"("product_id");


--
-- TOC entry 1911 (class 2606 OID 16639)
-- Dependencies: 1856 1553 1568
-- Name: fkOfertaServicoOferta; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbServiceDeal"
    ADD CONSTRAINT "fkOfertaServicoOferta" FOREIGN KEY ("deal_id") REFERENCES "tbDeal"("deal_id");


--
-- TOC entry 1912 (class 2606 OID 16644)
-- Dependencies: 1568 1552 1853
-- Name: fkOfertaServicoServico; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbServiceDeal"
    ADD CONSTRAINT "fkOfertaServicoServico" FOREIGN KEY ("service_id") REFERENCES "tbService"("service_id");


--
-- TOC entry 1906 (class 2606 OID 16594)
-- Dependencies: 1563 1564 1879
-- Name: fkPagamentoCartaoOperadoraCartao; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPaymentCard"
    ADD CONSTRAINT "fkPagamentoCartaoOperadoraCartao" FOREIGN KEY ("card_operator_id") REFERENCES "tbCardOperator"("card_operator_id");


--
-- TOC entry 1905 (class 2606 OID 16584)
-- Dependencies: 1563 1875 1562
-- Name: fkPagamentoCartaoPagamento; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPaymentCard"
    ADD CONSTRAINT "fkPagamentoCartaoPagamento" FOREIGN KEY ("payment_id") REFERENCES "tbPayment"("payment_id");


--
-- TOC entry 1897 (class 2606 OID 16502)
-- Dependencies: 1863 1556 1558
-- Name: fkParceiroTelefoneParceiro; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPartnerContactPhone"
    ADD CONSTRAINT "fkParceiroTelefoneParceiro" FOREIGN KEY ("partner_id") REFERENCES "tbPartner"("partner_id");


--
-- TOC entry 1896 (class 2606 OID 16497)
-- Dependencies: 1558 1865 1557
-- Name: fkParceiroTelefoneTelefoneContato; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPartnerContactPhone"
    ADD CONSTRAINT "fkParceiroTelefoneTelefoneContato" FOREIGN KEY ("phone_id") REFERENCES "tbPhoneContact"("phone_id");


--
-- TOC entry 1899 (class 2606 OID 16520)
-- Dependencies: 1863 1556 1559
-- Name: fkParceiroUsuarioResponsavelParceiro; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPartnerAdminUser"
    ADD CONSTRAINT "fkParceiroUsuarioResponsavelParceiro" FOREIGN KEY ("partner_id") REFERENCES "tbPartner"("partner_id");


--
-- TOC entry 1898 (class 2606 OID 16515)
-- Dependencies: 1849 1550 1559
-- Name: fkParceiroUsuarioResponsavelUsuario; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPartnerAdminUser"
    ADD CONSTRAINT "fkParceiroUsuarioResponsavelUsuario" FOREIGN KEY ("user_id") REFERENCES "tbUser"("user_id");


--
-- TOC entry 1913 (class 2606 OID 16654)
-- Dependencies: 1569 1553 1856
-- Name: flLimiteOferta; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbRestriction"
    ADD CONSTRAINT "flLimiteOferta" FOREIGN KEY ("deal_id") REFERENCES "tbDeal"("deal_id");


--
-- TOC entry 1908 (class 2606 OID 16614)
-- Dependencies: 1566 1565 1883
-- Name: pkPagamentoBoletoBanco; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPaymentBillet"
    ADD CONSTRAINT "pkPagamentoBoletoBanco" FOREIGN KEY ("bank_id") REFERENCES "tbBank"("bank_id");


--
-- TOC entry 1907 (class 2606 OID 16604)
-- Dependencies: 1562 1565 1875
-- Name: pkPagamentoBoletoPagamento; Type: FK CONSTRAINT; Schema: store; Owner: postgres
--

ALTER TABLE ONLY "tbPaymentBillet"
    ADD CONSTRAINT "pkPagamentoBoletoPagamento" FOREIGN KEY ("payment_id") REFERENCES "tbPayment"("payment_id");


--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-08-28 22:57:00

--
-- PostgreSQL database dump complete
--

