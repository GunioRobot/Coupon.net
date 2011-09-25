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
-- Name: DB_CompraColetiva; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DB_ComprasColetivas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE "DB_ComprasColetivas" OWNER TO postgres;

\connect "DB_ComprasColetivas"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 16393)
-- Name: compra; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA compra;


ALTER SCHEMA compra OWNER TO postgres;

--
-- TOC entry 357 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = compra, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1560 (class 1259 OID 16535)
-- Dependencies: 7
-- Name: tbAvaliacao; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbAvaliacao" (
    "cdUsuario" integer NOT NULL,
    "cdOferta" integer NOT NULL,
    "dtAvaliacao" date NOT NULL,
    "stNivelAvaliacao" smallint,
    "dsTexto" character varying(2000)
);


ALTER TABLE compra."tbAvaliacao" OWNER TO postgres;

--
-- TOC entry 1566 (class 1259 OID 16609)
-- Dependencies: 7
-- Name: tbBanco; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbBanco" (
    "cdBanco" serial NOT NULL,
    "nmBanco" character varying(50) NOT NULL,
    "dsUrlLogo" character varying(255),
    "cdFebraban" smallint
);


ALTER TABLE compra."tbBanco" OWNER TO postgres;

--
-- TOC entry 1554 (class 1259 OID 16446)
-- Dependencies: 7
-- Name: tbCategoria; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCategoria" (
    "cdCategoria" serial NOT NULL,
    "nmCategoria" character varying(50) NOT NULL,
    "cdCategoriaSuperior" integer
);


ALTER TABLE compra."tbCategoria" OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 16394)
-- Dependencies: 7
-- Name: tbCliente; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCliente" (
    "cdCliente" serial NOT NULL,
    "nrCpf" bigint,
    "nmCliente" character varying(255) NOT NULL,
    "cdUsuario" integer NOT NULL
);


ALTER TABLE compra."tbCliente" OWNER TO postgres;

--
-- TOC entry 1555 (class 1259 OID 16463)
-- Dependencies: 7
-- Name: tbContrato; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbContrato" (
    "cdContrato" serial NOT NULL,
    "dtInicioContrato" date NOT NULL,
    "dtFimContrato" date,
    "vlPercentualLucro" numeric(3,2) NOT NULL,
    "cdParceiro" integer NOT NULL
);


ALTER TABLE compra."tbContrato" OWNER TO postgres;

--
-- TOC entry 1561 (class 1259 OID 16554)
-- Dependencies: 7
-- Name: tbCupom; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbCupom" (
    "cdCupom" serial NOT NULL,
    "cdOferta" integer NOT NULL,
    "cdUsuario" integer,
    "nrCupom" integer NOT NULL,
    "dtValidade" date NOT NULL,
    "dtUtilizado" date,
    "stCupom" smallint NOT NULL,
    "cdPagamento" integer NOT NULL
);


ALTER TABLE compra."tbCupom" OWNER TO postgres;

--
-- TOC entry 1569 (class 1259 OID 16649)
-- Dependencies: 7
-- Name: tbLimite; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbLimite" (
    "cdOferta" integer NOT NULL,
    "qtMinima" smallint,
    "qtMaxima" smallint,
    "qtMaxPorCliente" smallint NOT NULL,
    "dtInicio" date NOT NULL,
    "dtFim" date NOT NULL
);


ALTER TABLE compra."tbLimite" OWNER TO postgres;

--
-- TOC entry 1553 (class 1259 OID 16428)
-- Dependencies: 7
-- Name: tbOferta; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbOferta" (
    "cdOferta" serial NOT NULL,
    "nmOferta" character varying(100) NOT NULL,
    "dsTexto" character varying(2000) NOT NULL,
    "vlMercado" numeric(9,2) NOT NULL,
    "vlDesconto" numeric(9,2) NOT NULL,
    "dsUrlImagem" character varying(255),
    "dsUrlInformacoes" character varying(255),
    "stOferta" smallint NOT NULL,
    "cdContrato" integer NOT NULL,
    "cdCategoria" integer
);


ALTER TABLE compra."tbOferta" OWNER TO postgres;

--
-- TOC entry 1567 (class 1259 OID 16619)
-- Dependencies: 7
-- Name: tbOfertaProduto; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbOfertaProduto" (
    "cdOferta" integer NOT NULL,
    "cdProduto" integer NOT NULL
);


ALTER TABLE compra."tbOfertaProduto" OWNER TO postgres;

--
-- TOC entry 1568 (class 1259 OID 16634)
-- Dependencies: 7
-- Name: tbOfertaServico; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbOfertaServico" (
    "cdOferta" integer NOT NULL,
    "cdServico" integer NOT NULL
);


ALTER TABLE compra."tbOfertaServico" OWNER TO postgres;

--
-- TOC entry 1564 (class 1259 OID 16589)
-- Dependencies: 7
-- Name: tbOperadoraCartao; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbOperadoraCartao" (
    "cdOperadoraCartao" serial NOT NULL,
    "nmOperadora" character varying(50) NOT NULL
);


ALTER TABLE compra."tbOperadoraCartao" OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 16569)
-- Dependencies: 7
-- Name: tbPagamento; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPagamento" (
    "cdPagamento" serial NOT NULL,
    "tpTipoPagamento" smallint NOT NULL,
    "stPagamento" smallint NOT NULL
);


ALTER TABLE compra."tbPagamento" OWNER TO postgres;

--
-- TOC entry 1565 (class 1259 OID 16599)
-- Dependencies: 7
-- Name: tbPagamentoBoleto; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPagamentoBoleto" (
    "cdPagamento" integer NOT NULL,
    "nrCodigoBarras" character varying(100) NOT NULL,
    "dtVencimento" date NOT NULL,
    "cdBanco" integer NOT NULL
);


ALTER TABLE compra."tbPagamentoBoleto" OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 16579)
-- Dependencies: 7
-- Name: tbPagamentoCartao; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbPagamentoCartao" (
    "cdPagamento" integer NOT NULL,
    "nmTitularCartao" character varying(100) NOT NULL,
    "nrCartao" character varying(20) NOT NULL,
    "cdSeguranca" character varying(5) NOT NULL,
    "dtVencimento" date NOT NULL,
    "cdOperadoraCartao" integer
);


ALTER TABLE compra."tbPagamentoCartao" OWNER TO postgres;

--
-- TOC entry 1556 (class 1259 OID 16468)
-- Dependencies: 7
-- Name: tbParceiro; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbParceiro" (
    "cdParceiro" serial NOT NULL,
    "nmFantasia" character varying(255) NOT NULL,
    "nrCnpj" bigint NOT NULL,
    "dsUrlSite" character varying(255) NOT NULL,
    "dsEnderecoCompleto" character varying(1000) NOT NULL,
    "dsUrlLogo" character varying(255)
);


ALTER TABLE compra."tbParceiro" OWNER TO postgres;

--
-- TOC entry 1558 (class 1259 OID 16489)
-- Dependencies: 7
-- Name: tbParceiroTelefoneContato; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbParceiroTelefoneContato" (
    "cdParceiro" integer NOT NULL,
    "cdTelefone" integer NOT NULL,
    "dsContato" character varying(500)
);


ALTER TABLE compra."tbParceiroTelefoneContato" OWNER TO postgres;

--
-- TOC entry 1559 (class 1259 OID 16507)
-- Dependencies: 7
-- Name: tbParceiroUsuarioResponsavel; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbParceiroUsuarioResponsavel" (
    "cdParceiro" integer NOT NULL,
    "cdUsuario" integer NOT NULL,
    "dsResponsavel" character varying(500)
);


ALTER TABLE compra."tbParceiroUsuarioResponsavel" OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 16412)
-- Dependencies: 7
-- Name: tbProduto; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbProduto" (
    "cdProduto" serial NOT NULL,
    "dsProduto" character varying(2000) NOT NULL,
    "nmProduto" character varying(255) NOT NULL,
    "nmMarca" character varying(100),
    "dsUrlInformacoes" character varying(500)
);


ALTER TABLE compra."tbProduto" OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 16420)
-- Dependencies: 7
-- Name: tbServico; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbServico" (
    "cdServico" serial NOT NULL,
    "dsServico" character varying(2000) NOT NULL,
    "nmServico" character varying(255) NOT NULL,
    "nmPrestador" character varying(100) NOT NULL,
    "dsUrlInformacoes" character varying(500) NOT NULL
);


ALTER TABLE compra."tbServico" OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 16481)
-- Dependencies: 7
-- Name: tbTelefoneContato; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbTelefoneContato" (
    "cdTelefone" serial NOT NULL,
    "nrDdi" smallint,
    "nrDdd" smallint NOT NULL,
    "nrTelefone" integer NOT NULL,
    "dsInformacoesAdicionais" character varying(1000)
);


ALTER TABLE compra."tbTelefoneContato" OWNER TO postgres;

--
-- TOC entry 1550 (class 1259 OID 16399)
-- Dependencies: 7
-- Name: tbUsuario; Type: TABLE; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE TABLE "tbUsuario" (
    "cdUsuario" serial NOT NULL,
    "nmUsuario" character varying(50) NOT NULL,
    "dsEmail" character varying(255) NOT NULL,
    "dsSenha" character varying(255) NOT NULL,
    "stUsuario" smallint NOT NULL,
    "tpUsuario" smallint NOT NULL
);


ALTER TABLE compra."tbUsuario" OWNER TO postgres;

--
-- TOC entry 1925 (class 0 OID 16535)
-- Dependencies: 1560
-- Data for Name: tbAvaliacao; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbAvaliacao" ("cdUsuario", "cdOferta", "dtAvaliacao", "stNivelAvaliacao", "dsTexto") FROM stdin;
\.


--
-- TOC entry 1931 (class 0 OID 16609)
-- Dependencies: 1566
-- Data for Name: tbBanco; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbBanco" ("cdBanco", "nmBanco", "dsUrlLogo", "cdFebraban") FROM stdin;
\.


--
-- TOC entry 1919 (class 0 OID 16446)
-- Dependencies: 1554
-- Data for Name: tbCategoria; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbCategoria" ("cdCategoria", "nmCategoria", "cdCategoriaSuperior") FROM stdin;
\.


--
-- TOC entry 1914 (class 0 OID 16394)
-- Dependencies: 1549
-- Data for Name: tbCliente; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbCliente" ("cdCliente", "nrCpf", "nmCliente", "cdUsuario") FROM stdin;
\.


--
-- TOC entry 1920 (class 0 OID 16463)
-- Dependencies: 1555
-- Data for Name: tbContrato; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbContrato" ("cdContrato", "dtInicioContrato", "dtFimContrato", "vlPercentualLucro", "cdParceiro") FROM stdin;
\.


--
-- TOC entry 1926 (class 0 OID 16554)
-- Dependencies: 1561
-- Data for Name: tbCupom; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbCupom" ("cdCupom", "cdOferta", "cdUsuario", "nrCupom", "dtValidade", "dtUtilizado", "stCupom", "cdPagamento") FROM stdin;
\.


--
-- TOC entry 1934 (class 0 OID 16649)
-- Dependencies: 1569
-- Data for Name: tbLimite; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbLimite" ("cdOferta", "qtMinima", "qtMaxima", "qtMaxPorCliente", "dtInicio", "dtFim") FROM stdin;
\.


--
-- TOC entry 1918 (class 0 OID 16428)
-- Dependencies: 1553
-- Data for Name: tbOferta; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbOferta" ("cdOferta", "nmOferta", "dsTexto", "vlMercado", "vlDesconto", "dsUrlImagem", "dsUrlInformacoes", "stOferta", "cdContrato", "cdCategoria") FROM stdin;
\.


--
-- TOC entry 1932 (class 0 OID 16619)
-- Dependencies: 1567
-- Data for Name: tbOfertaProduto; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbOfertaProduto" ("cdOferta", "cdProduto") FROM stdin;
\.


--
-- TOC entry 1933 (class 0 OID 16634)
-- Dependencies: 1568
-- Data for Name: tbOfertaServico; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbOfertaServico" ("cdOferta", "cdServico") FROM stdin;
\.


--
-- TOC entry 1929 (class 0 OID 16589)
-- Dependencies: 1564
-- Data for Name: tbOperadoraCartao; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbOperadoraCartao" ("cdOperadoraCartao", "nmOperadora") FROM stdin;
\.


--
-- TOC entry 1927 (class 0 OID 16569)
-- Dependencies: 1562
-- Data for Name: tbPagamento; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbPagamento" ("cdPagamento", "tpTipoPagamento", "stPagamento") FROM stdin;
\.


--
-- TOC entry 1930 (class 0 OID 16599)
-- Dependencies: 1565
-- Data for Name: tbPagamentoBoleto; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbPagamentoBoleto" ("cdPagamento", "nrCodigoBarras", "dtVencimento", "cdBanco") FROM stdin;
\.


--
-- TOC entry 1928 (class 0 OID 16579)
-- Dependencies: 1563
-- Data for Name: tbPagamentoCartao; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbPagamentoCartao" ("cdPagamento", "nmTitularCartao", "nrCartao", "cdSeguranca", "dtVencimento", "cdOperadoraCartao") FROM stdin;
\.


--
-- TOC entry 1921 (class 0 OID 16468)
-- Dependencies: 1556
-- Data for Name: tbParceiro; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbParceiro" ("cdParceiro", "nmFantasia", "nrCnpj", "dsUrlSite", "dsEnderecoCompleto", "dsUrlLogo") FROM stdin;
\.


--
-- TOC entry 1923 (class 0 OID 16489)
-- Dependencies: 1558
-- Data for Name: tbParceiroTelefoneContato; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbParceiroTelefoneContato" ("cdParceiro", "cdTelefone", "dsContato") FROM stdin;
\.


--
-- TOC entry 1924 (class 0 OID 16507)
-- Dependencies: 1559
-- Data for Name: tbParceiroUsuarioResponsavel; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbParceiroUsuarioResponsavel" ("cdParceiro", "cdUsuario", "dsResponsavel") FROM stdin;
\.


--
-- TOC entry 1916 (class 0 OID 16412)
-- Dependencies: 1551
-- Data for Name: tbProduto; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbProduto" ("cdProduto", "dsProduto", "nmProduto", "nmMarca", "dsUrlInformacoes") FROM stdin;
\.


--
-- TOC entry 1917 (class 0 OID 16420)
-- Dependencies: 1552
-- Data for Name: tbServico; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbServico" ("cdServico", "dsServico", "nmServico", "nmPrestador", "dsUrlInformacoes") FROM stdin;
\.


--
-- TOC entry 1922 (class 0 OID 16481)
-- Dependencies: 1557
-- Data for Name: tbTelefoneContato; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbTelefoneContato" ("cdTelefone", "nrDdi", "nrDdd", "nrTelefone", "dsInformacoesAdicionais") FROM stdin;
\.


--
-- TOC entry 1915 (class 0 OID 16399)
-- Dependencies: 1550
-- Data for Name: tbUsuario; Type: TABLE DATA; Schema: compra; Owner: postgres
--

COPY "tbUsuario" ("cdUsuario", "nmUsuario", "dsEmail", "dsSenha", "stUsuario", "tpUsuario") FROM stdin;
\.


--
-- TOC entry 1872 (class 2606 OID 16542)
-- Dependencies: 1560 1560 1560
-- Name: pkAvaliacao; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbAvaliacao"
    ADD CONSTRAINT "pkAvaliacao" PRIMARY KEY ("cdUsuario", "cdOferta");


--
-- TOC entry 1884 (class 2606 OID 16613)
-- Dependencies: 1566 1566
-- Name: pkBanco; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbBanco"
    ADD CONSTRAINT "pkBanco" PRIMARY KEY ("cdBanco");


--
-- TOC entry 1860 (class 2606 OID 16450)
-- Dependencies: 1554 1554
-- Name: pkCategoria; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCategoria"
    ADD CONSTRAINT "pkCategoria" PRIMARY KEY ("cdCategoria");


--
-- TOC entry 1848 (class 2606 OID 16398)
-- Dependencies: 1549 1549
-- Name: pkCliente; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCliente"
    ADD CONSTRAINT "pkCliente" PRIMARY KEY ("cdCliente");


--
-- TOC entry 1862 (class 2606 OID 16467)
-- Dependencies: 1555 1555
-- Name: pkContrato; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbContrato"
    ADD CONSTRAINT "pkContrato" PRIMARY KEY ("cdContrato");


--
-- TOC entry 1874 (class 2606 OID 16558)
-- Dependencies: 1561 1561
-- Name: pkCupom; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbCupom"
    ADD CONSTRAINT "pkCupom" PRIMARY KEY ("cdCupom");


--
-- TOC entry 1890 (class 2606 OID 16653)
-- Dependencies: 1569 1569
-- Name: pkLimite; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbLimite"
    ADD CONSTRAINT "pkLimite" PRIMARY KEY ("cdOferta");


--
-- TOC entry 1857 (class 2606 OID 16435)
-- Dependencies: 1553 1553
-- Name: pkOferta; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbOferta"
    ADD CONSTRAINT "pkOferta" PRIMARY KEY ("cdOferta");


--
-- TOC entry 1886 (class 2606 OID 16623)
-- Dependencies: 1567 1567 1567
-- Name: pkOfertaProduto; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbOfertaProduto"
    ADD CONSTRAINT "pkOfertaProduto" PRIMARY KEY ("cdOferta", "cdProduto");


--
-- TOC entry 1888 (class 2606 OID 16638)
-- Dependencies: 1568 1568 1568
-- Name: pkOfertaServico; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbOfertaServico"
    ADD CONSTRAINT "pkOfertaServico" PRIMARY KEY ("cdOferta", "cdServico");


--
-- TOC entry 1880 (class 2606 OID 16593)
-- Dependencies: 1564 1564
-- Name: pkOperadoraCartao; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbOperadoraCartao"
    ADD CONSTRAINT "pkOperadoraCartao" PRIMARY KEY ("cdOperadoraCartao");


--
-- TOC entry 1876 (class 2606 OID 16573)
-- Dependencies: 1562 1562
-- Name: pkPagamento; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPagamento"
    ADD CONSTRAINT "pkPagamento" PRIMARY KEY ("cdPagamento");


--
-- TOC entry 1882 (class 2606 OID 16603)
-- Dependencies: 1565 1565
-- Name: pkPagamentoBoleto; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPagamentoBoleto"
    ADD CONSTRAINT "pkPagamentoBoleto" PRIMARY KEY ("cdPagamento");


--
-- TOC entry 1878 (class 2606 OID 16583)
-- Dependencies: 1563 1563
-- Name: pkPagamentoCartao; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbPagamentoCartao"
    ADD CONSTRAINT "pkPagamentoCartao" PRIMARY KEY ("cdPagamento");


--
-- TOC entry 1864 (class 2606 OID 16475)
-- Dependencies: 1556 1556
-- Name: pkParceiro; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbParceiro"
    ADD CONSTRAINT "pkParceiro" PRIMARY KEY ("cdParceiro");


--
-- TOC entry 1868 (class 2606 OID 16496)
-- Dependencies: 1558 1558 1558
-- Name: pkParceiroTelefone; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbParceiroTelefoneContato"
    ADD CONSTRAINT "pkParceiroTelefone" PRIMARY KEY ("cdParceiro", "cdTelefone");


--
-- TOC entry 1870 (class 2606 OID 16514)
-- Dependencies: 1559 1559 1559
-- Name: pkParceiroUsuarioResponsavel; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbParceiroUsuarioResponsavel"
    ADD CONSTRAINT "pkParceiroUsuarioResponsavel" PRIMARY KEY ("cdParceiro", "cdUsuario");


--
-- TOC entry 1852 (class 2606 OID 16419)
-- Dependencies: 1551 1551
-- Name: pkProduto; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbProduto"
    ADD CONSTRAINT "pkProduto" PRIMARY KEY ("cdProduto");


--
-- TOC entry 1854 (class 2606 OID 16427)
-- Dependencies: 1552 1552
-- Name: pkServico; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbServico"
    ADD CONSTRAINT "pkServico" PRIMARY KEY ("cdServico");


--
-- TOC entry 1866 (class 2606 OID 16485)
-- Dependencies: 1557 1557
-- Name: pkTelefone; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbTelefoneContato"
    ADD CONSTRAINT "pkTelefone" PRIMARY KEY ("cdTelefone");


--
-- TOC entry 1850 (class 2606 OID 16406)
-- Dependencies: 1550 1550
-- Name: pkUsuario; Type: CONSTRAINT; Schema: compra; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tbUsuario"
    ADD CONSTRAINT "pkUsuario" PRIMARY KEY ("cdUsuario");


--
-- TOC entry 1858 (class 1259 OID 16456)
-- Dependencies: 1554
-- Name: fki_fkCategoriaCategoria; Type: INDEX; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_fkCategoriaCategoria" ON "tbCategoria" USING btree ("cdCategoriaSuperior");


--
-- TOC entry 1855 (class 1259 OID 16462)
-- Dependencies: 1553
-- Name: fki_fkOfertaCategoria; Type: INDEX; Schema: compra; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_fkOfertaCategoria" ON "tbOferta" USING btree ("cdCategoria");


--
-- TOC entry 1901 (class 2606 OID 16548)
-- Dependencies: 1560 1856 1553
-- Name: fkAvaliacaoOferta; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbAvaliacao"
    ADD CONSTRAINT "fkAvaliacaoOferta" FOREIGN KEY ("cdOferta") REFERENCES "tbOferta"("cdOferta");


--
-- TOC entry 1900 (class 2606 OID 16543)
-- Dependencies: 1550 1849 1560
-- Name: fkAvaliacaoUsuario; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbAvaliacao"
    ADD CONSTRAINT "fkAvaliacaoUsuario" FOREIGN KEY ("cdUsuario") REFERENCES "tbUsuario"("cdUsuario");


--
-- TOC entry 1894 (class 2606 OID 16451)
-- Dependencies: 1859 1554 1554
-- Name: fkCategoriaCategoria; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbCategoria"
    ADD CONSTRAINT "fkCategoriaCategoria" FOREIGN KEY ("cdCategoriaSuperior") REFERENCES "tbCategoria"("cdCategoria");


--
-- TOC entry 1891 (class 2606 OID 16407)
-- Dependencies: 1849 1549 1550
-- Name: fkClienteUsuario; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbCliente"
    ADD CONSTRAINT "fkClienteUsuario" FOREIGN KEY ("cdUsuario") REFERENCES "tbUsuario"("cdUsuario");


--
-- TOC entry 1895 (class 2606 OID 16525)
-- Dependencies: 1556 1863 1555
-- Name: fkContratoParceiro; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbContrato"
    ADD CONSTRAINT "fkContratoParceiro" FOREIGN KEY ("cdParceiro") REFERENCES "tbParceiro"("cdParceiro");


--
-- TOC entry 1903 (class 2606 OID 16564)
-- Dependencies: 1856 1561 1553
-- Name: fkCupomOferta; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbCupom"
    ADD CONSTRAINT "fkCupomOferta" FOREIGN KEY ("cdOferta") REFERENCES "tbOferta"("cdOferta");


--
-- TOC entry 1904 (class 2606 OID 16574)
-- Dependencies: 1875 1561 1562
-- Name: fkCupomPagamento; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbCupom"
    ADD CONSTRAINT "fkCupomPagamento" FOREIGN KEY ("cdPagamento") REFERENCES "tbPagamento"("cdPagamento");


--
-- TOC entry 1902 (class 2606 OID 16559)
-- Dependencies: 1849 1550 1561
-- Name: fkCupomUsuario; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbCupom"
    ADD CONSTRAINT "fkCupomUsuario" FOREIGN KEY ("cdUsuario") REFERENCES "tbUsuario"("cdUsuario");


--
-- TOC entry 1892 (class 2606 OID 16457)
-- Dependencies: 1859 1553 1554
-- Name: fkOfertaCategoria; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOferta"
    ADD CONSTRAINT "fkOfertaCategoria" FOREIGN KEY ("cdCategoria") REFERENCES "tbCategoria"("cdCategoria");


--
-- TOC entry 1893 (class 2606 OID 16530)
-- Dependencies: 1553 1555 1861
-- Name: fkOfertaContrato; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOferta"
    ADD CONSTRAINT "fkOfertaContrato" FOREIGN KEY ("cdContrato") REFERENCES "tbContrato"("cdContrato");


--
-- TOC entry 1909 (class 2606 OID 16624)
-- Dependencies: 1856 1553 1567
-- Name: fkOfertaProdutoOferta; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOfertaProduto"
    ADD CONSTRAINT "fkOfertaProdutoOferta" FOREIGN KEY ("cdOferta") REFERENCES "tbOferta"("cdOferta");


--
-- TOC entry 1910 (class 2606 OID 16629)
-- Dependencies: 1551 1851 1567
-- Name: fkOfertaProdutoProduto; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOfertaProduto"
    ADD CONSTRAINT "fkOfertaProdutoProduto" FOREIGN KEY ("cdProduto") REFERENCES "tbProduto"("cdProduto");


--
-- TOC entry 1911 (class 2606 OID 16639)
-- Dependencies: 1856 1553 1568
-- Name: fkOfertaServicoOferta; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOfertaServico"
    ADD CONSTRAINT "fkOfertaServicoOferta" FOREIGN KEY ("cdOferta") REFERENCES "tbOferta"("cdOferta");


--
-- TOC entry 1912 (class 2606 OID 16644)
-- Dependencies: 1568 1552 1853
-- Name: fkOfertaServicoServico; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbOfertaServico"
    ADD CONSTRAINT "fkOfertaServicoServico" FOREIGN KEY ("cdServico") REFERENCES "tbServico"("cdServico");


--
-- TOC entry 1906 (class 2606 OID 16594)
-- Dependencies: 1563 1564 1879
-- Name: fkPagamentoCartaoOperadoraCartao; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbPagamentoCartao"
    ADD CONSTRAINT "fkPagamentoCartaoOperadoraCartao" FOREIGN KEY ("cdOperadoraCartao") REFERENCES "tbOperadoraCartao"("cdOperadoraCartao");


--
-- TOC entry 1905 (class 2606 OID 16584)
-- Dependencies: 1563 1875 1562
-- Name: fkPagamentoCartaoPagamento; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbPagamentoCartao"
    ADD CONSTRAINT "fkPagamentoCartaoPagamento" FOREIGN KEY ("cdPagamento") REFERENCES "tbPagamento"("cdPagamento");


--
-- TOC entry 1897 (class 2606 OID 16502)
-- Dependencies: 1863 1556 1558
-- Name: fkParceiroTelefoneParceiro; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbParceiroTelefoneContato"
    ADD CONSTRAINT "fkParceiroTelefoneParceiro" FOREIGN KEY ("cdParceiro") REFERENCES "tbParceiro"("cdParceiro");


--
-- TOC entry 1896 (class 2606 OID 16497)
-- Dependencies: 1558 1865 1557
-- Name: fkParceiroTelefoneTelefoneContato; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbParceiroTelefoneContato"
    ADD CONSTRAINT "fkParceiroTelefoneTelefoneContato" FOREIGN KEY ("cdTelefone") REFERENCES "tbTelefoneContato"("cdTelefone");


--
-- TOC entry 1899 (class 2606 OID 16520)
-- Dependencies: 1863 1556 1559
-- Name: fkParceiroUsuarioResponsavelParceiro; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbParceiroUsuarioResponsavel"
    ADD CONSTRAINT "fkParceiroUsuarioResponsavelParceiro" FOREIGN KEY ("cdParceiro") REFERENCES "tbParceiro"("cdParceiro");


--
-- TOC entry 1898 (class 2606 OID 16515)
-- Dependencies: 1849 1550 1559
-- Name: fkParceiroUsuarioResponsavelUsuario; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbParceiroUsuarioResponsavel"
    ADD CONSTRAINT "fkParceiroUsuarioResponsavelUsuario" FOREIGN KEY ("cdUsuario") REFERENCES "tbUsuario"("cdUsuario");


--
-- TOC entry 1913 (class 2606 OID 16654)
-- Dependencies: 1569 1553 1856
-- Name: flLimiteOferta; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbLimite"
    ADD CONSTRAINT "flLimiteOferta" FOREIGN KEY ("cdOferta") REFERENCES "tbOferta"("cdOferta");


--
-- TOC entry 1908 (class 2606 OID 16614)
-- Dependencies: 1566 1565 1883
-- Name: pkPagamentoBoletoBanco; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbPagamentoBoleto"
    ADD CONSTRAINT "pkPagamentoBoletoBanco" FOREIGN KEY ("cdBanco") REFERENCES "tbBanco"("cdBanco");


--
-- TOC entry 1907 (class 2606 OID 16604)
-- Dependencies: 1562 1565 1875
-- Name: pkPagamentoBoletoPagamento; Type: FK CONSTRAINT; Schema: compra; Owner: postgres
--

ALTER TABLE ONLY "tbPagamentoBoleto"
    ADD CONSTRAINT "pkPagamentoBoletoPagamento" FOREIGN KEY ("cdPagamento") REFERENCES "tbPagamento"("cdPagamento");


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

