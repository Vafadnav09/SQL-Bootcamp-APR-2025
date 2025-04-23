--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-23 11:40:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16782)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "customerID" text,
    "employeeID" integer,
    "orderDate" date,
    "requiredDate" date,
    "shippedDate" date,
    "shipperID" integer,
    freight numeric(10,2),
    "orderID" integer NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16886)
-- Name: Orders_orderID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_orderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_orderID_seq" OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 224
-- Name: Orders_orderID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_orderID_seq" OWNED BY public."Orders"."orderID";


--
-- TOC entry 220 (class 1259 OID 16801)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    "categoryID" integer NOT NULL,
    "categoryName" text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16822)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    "customerID" text NOT NULL,
    "companyName" text,
    "contactName" text,
    "contactTitle" text,
    city text,
    country text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16794)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    "employeeID" integer NOT NULL,
    "employeeName" text NOT NULL,
    title text NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    "reportsTo" integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16808)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    "orderID" integer NOT NULL,
    "productID" integer NOT NULL,
    "unitPrice" numeric(10,2),
    quantity integer NOT NULL,
    discount numeric(10,2) NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16850)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    "productID" integer NOT NULL,
    "productName" text,
    "quantityPerUnit" text,
    "unitPrice" numeric(10,2),
    discontinued integer,
    "categoryID" integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16789)
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    "shipperID" integer NOT NULL,
    "companyName" character varying(100)
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- TOC entry 4766 (class 2604 OID 16887)
-- Name: Orders orderID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "orderID" SET DEFAULT nextval('public."Orders_orderID_seq"'::regclass);


--
-- TOC entry 4768 (class 2606 OID 16894)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("orderID");


--
-- TOC entry 4774 (class 2606 OID 16807)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY ("categoryID");


--
-- TOC entry 4778 (class 2606 OID 16843)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("customerID");


--
-- TOC entry 4772 (class 2606 OID 16800)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY ("employeeID");


--
-- TOC entry 4776 (class 2606 OID 16906)
-- Name: order_details orderdetails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT orderdetails_pk PRIMARY KEY ("orderID", "productID") INCLUDE ("orderID", "productID");


--
-- TOC entry 4780 (class 2606 OID 16856)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productID");


--
-- TOC entry 4770 (class 2606 OID 16793)
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY ("shipperID");


--
-- TOC entry 4787 (class 2606 OID 16874)
-- Name: products categoryID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "categoryID" FOREIGN KEY ("categoryID") REFERENCES public.categories("categoryID") NOT VALID;


--
-- TOC entry 4781 (class 2606 OID 16864)
-- Name: Orders customerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "customerID" FOREIGN KEY ("customerID") REFERENCES public.customers("customerID") NOT VALID;


--
-- TOC entry 4782 (class 2606 OID 16829)
-- Name: Orders employeeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "employeeID" FOREIGN KEY ("employeeID") REFERENCES public.employees("employeeID") NOT VALID;


--
-- TOC entry 4785 (class 2606 OID 16895)
-- Name: order_details orderID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "orderID" FOREIGN KEY ("orderID") REFERENCES public."Orders"("orderID") NOT VALID;


--
-- TOC entry 4786 (class 2606 OID 16900)
-- Name: order_details productID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "productID" FOREIGN KEY ("productID") REFERENCES public.products("productID") NOT VALID;


--
-- TOC entry 4784 (class 2606 OID 16879)
-- Name: employees reportsTo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "reportsTo" FOREIGN KEY ("reportsTo") REFERENCES public.employees("employeeID") NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 16869)
-- Name: Orders shipperID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "shipperID" FOREIGN KEY ("shipperID") REFERENCES public.shippers("shipperID") NOT VALID;


-- Completed on 2025-04-23 11:40:23

--
-- PostgreSQL database dump complete
--

