--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: NewEmployees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NewEmployees" (
    nik integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    "dateOfBirth" date,
    "placeOfBirth" character varying(255) DEFAULT 'INDONESIA'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."NewEmployees" OWNER TO postgres;

--
-- Name: NewEmployees_nik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NewEmployees_nik_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."NewEmployees_nik_seq" OWNER TO postgres;

--
-- Name: NewEmployees_nik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NewEmployees_nik_seq" OWNED BY public."NewEmployees".nik;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    nik integer NOT NULL,
    "companyId" integer,
    "firstName" character varying(255),
    sex character varying(255) DEFAULT 'unknown'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_nik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_nik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_nik_seq OWNER TO postgres;

--
-- Name: companies_nik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_nik_seq OWNED BY public.companies.nik;


--
-- Name: NewEmployees nik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NewEmployees" ALTER COLUMN nik SET DEFAULT nextval('public."NewEmployees_nik_seq"'::regclass);


--
-- Name: companies nik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN nik SET DEFAULT nextval('public.companies_nik_seq'::regclass);


--
-- Data for Name: NewEmployees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NewEmployees" (nik, "firstName", "lastName", "dateOfBirth", "placeOfBirth", "createdAt", "updatedAt") FROM stdin;
4	Eko	p	2020-09-10	Jakarta	2020-09-21 10:40:25.785+07	2020-09-21 10:40:25.785+07
3	Edi	P	2020-09-11	singapore	2020-09-21 10:38:48.532+07	2020-09-21 10:42:07.737+07
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (nik, "companyId", "firstName", sex, "createdAt", "updatedAt") FROM stdin;
4	\N	Eko	male	2020-09-21 10:40:25.796+07	2020-09-21 10:40:25.796+07
3	1001	Edi	Male	2020-09-21 10:38:48.548+07	2020-09-21 10:42:07.745+07
\.


--
-- Name: NewEmployees_nik_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."NewEmployees_nik_seq"', 4, true);


--
-- Name: companies_nik_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_nik_seq', 4, true);


--
-- Name: NewEmployees NewEmployees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NewEmployees"
    ADD CONSTRAINT "NewEmployees_pkey" PRIMARY KEY (nik);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (nik);


--
-- Name: companies companies_nik_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_nik_fkey FOREIGN KEY (nik) REFERENCES public."NewEmployees"(nik) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

