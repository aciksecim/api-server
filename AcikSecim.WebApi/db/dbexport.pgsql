--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

--
-- Name: Adaylar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Adaylar" (
    "Id" integer NOT NULL,
    "Ad" character varying(50),
    "Ad2" character varying(50),
    "Soyad" bytea,
    "Partisi" character varying(50),
    "Ittifaki" character varying(50)
);


ALTER TABLE public."Adaylar" OWNER TO postgres;

--
-- Name: Adaylar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Adaylar_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Adaylar_Id_seq" OWNER TO postgres;

--
-- Name: Adaylar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Adaylar_Id_seq" OWNED BY public."Adaylar"."Id";


--
-- Name: Ilceler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilceler" (
    "Id" integer NOT NULL,
    "SehirId" integer,
    "IlceAdi" character varying(50) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."Ilceler" OWNER TO postgres;

--
-- Name: Ilceler_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ilceler_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ilceler_Id_seq" OWNER TO postgres;

--
-- Name: Ilceler_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ilceler_Id_seq" OWNED BY public."Ilceler"."Id";


--
-- Name: Kullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kullanicilar" (
    "Id" bigint NOT NULL,
    "Ad" character varying(50),
    "Ad2" character varying(50),
    "Soyad" character varying(50),
    "TcNo" character varying(11),
    "Email" character varying(50),
    "TelNo" character varying(11),
    "Durum" integer,
    "KayitTarihi" timestamp without time zone,
    "KullaniciPuani" integer,
    "MahalleId" integer,
    "RolId" integer
);


ALTER TABLE public."Kullanicilar" OWNER TO postgres;

--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kullanicilar_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kullanicilar_Id_seq" OWNER TO postgres;

--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kullanicilar_Id_seq" OWNED BY public."Kullanicilar"."Id";


--
-- Name: Mahalleler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mahalleler" (
    "Id" integer NOT NULL,
    "IlceId" integer,
    "MahalleAdi" character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."Mahalleler" OWNER TO postgres;

--
-- Name: Mahalleler_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Mahalleler_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Mahalleler_Id_seq" OWNER TO postgres;

--
-- Name: Mahalleler_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Mahalleler_Id_seq" OWNED BY public."Mahalleler"."Id";


--
-- Name: Oturumlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oturumlar" (
    "Id" bigint NOT NULL,
    "KullaniciId" bigint,
    "OturumZamani" timestamp without time zone,
    "OturumIp" character varying(50),
    "OturumTarayicisi" character varying(50)
);


ALTER TABLE public."Oturumlar" OWNER TO postgres;

--
-- Name: Oturumlar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Oturumlar_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Oturumlar_Id_seq" OWNER TO postgres;

--
-- Name: Oturumlar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Oturumlar_Id_seq" OWNED BY public."Oturumlar"."Id";


--
-- Name: Roller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roller" (
    "Id" integer DEFAULT 0 NOT NULL,
    "RolAdi" character varying(20) DEFAULT ''::character varying NOT NULL,
    "Haklari" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Roller" OWNER TO postgres;

--
-- Name: SandikDurumu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SandikDurumu" (
    "Id" integer NOT NULL,
    "SandikId" bigint,
    "KullaniciId" bigint,
    "GecerliOySayisi" integer,
    "GecersizOySayisi" integer,
    "ToplamSecmenSayisi" integer
);


ALTER TABLE public."SandikDurumu" OWNER TO postgres;

--
-- Name: SandikDurumu_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SandikDurumu_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SandikDurumu_Id_seq" OWNER TO postgres;

--
-- Name: SandikDurumu_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SandikDurumu_Id_seq" OWNED BY public."SandikDurumu"."Id";


--
-- Name: Sandiklar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sandiklar" (
    "Id" bigint NOT NULL,
    "SandikNo" integer DEFAULT 0 NOT NULL,
    "MahalleId" integer
);


ALTER TABLE public."Sandiklar" OWNER TO postgres;

--
-- Name: Sandiklar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sandiklar_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sandiklar_Id_seq" OWNER TO postgres;

--
-- Name: Sandiklar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sandiklar_Id_seq" OWNED BY public."Sandiklar"."Id";


--
-- Name: Sehirler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sehirler" (
    "Id" integer NOT NULL,
    "SehirAdi" character varying(50) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."Sehirler" OWNER TO postgres;

--
-- Name: Sehirler_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sehirler_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sehirler_Id_seq" OWNER TO postgres;

--
-- Name: Sehirler_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sehirler_Id_seq" OWNED BY public."Sehirler"."Id";


--
-- Name: Sonuclar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sonuclar" (
    "Id" integer NOT NULL,
    "KullaniciId" bigint,
    "SandikId" bigint,
    "AdayId" integer,
    "OySayisi" integer
);


ALTER TABLE public."Sonuclar" OWNER TO postgres;

--
-- Name: Sonuclar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sonuclar_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sonuclar_Id_seq" OWNER TO postgres;

--
-- Name: Sonuclar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sonuclar_Id_seq" OWNED BY public."Sonuclar"."Id";


--
-- Name: Tutanaklar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tutanaklar" (
    "Id" bigint NOT NULL,
    "SandikId" bigint,
    "KullaniciId" bigint,
    "Resim" character varying(300),
    "GonderilmeTarihi" timestamp without time zone,
    "OnayliMi" boolean,
    "OnayTarihi" timestamp without time zone,
    "OnaylayanId" bigint
);


ALTER TABLE public."Tutanaklar" OWNER TO postgres;

--
-- Name: Tutanaklar_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tutanaklar_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tutanaklar_Id_seq" OWNER TO postgres;

--
-- Name: Tutanaklar_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tutanaklar_Id_seq" OWNED BY public."Tutanaklar"."Id";


--
-- Name: Adaylar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adaylar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Adaylar_Id_seq"'::regclass);


--
-- Name: Ilceler Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilceler" ALTER COLUMN "Id" SET DEFAULT nextval('public."Ilceler_Id_seq"'::regclass);


--
-- Name: Kullanicilar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Kullanicilar_Id_seq"'::regclass);


--
-- Name: Mahalleler Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahalleler" ALTER COLUMN "Id" SET DEFAULT nextval('public."Mahalleler_Id_seq"'::regclass);


--
-- Name: Oturumlar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oturumlar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Oturumlar_Id_seq"'::regclass);


--
-- Name: SandikDurumu Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SandikDurumu" ALTER COLUMN "Id" SET DEFAULT nextval('public."SandikDurumu_Id_seq"'::regclass);


--
-- Name: Sandiklar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sandiklar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Sandiklar_Id_seq"'::regclass);


--
-- Name: Sehirler Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sehirler" ALTER COLUMN "Id" SET DEFAULT nextval('public."Sehirler_Id_seq"'::regclass);


--
-- Name: Sonuclar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sonuclar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Sonuclar_Id_seq"'::regclass);


--
-- Name: Tutanaklar Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tutanaklar" ALTER COLUMN "Id" SET DEFAULT nextval('public."Tutanaklar_Id_seq"'::regclass);


--
-- Data for Name: Adaylar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Adaylar" ("Id", "Ad", "Ad2", "Soyad", "Partisi", "Ittifaki") FROM stdin;
\.


--
-- Data for Name: Ilceler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ilceler" ("Id", "SehirId", "IlceAdi") FROM stdin;
\.


--
-- Data for Name: Kullanicilar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kullanicilar" ("Id", "Ad", "Ad2", "Soyad", "TcNo", "Email", "TelNo", "Durum", "KayitTarihi", "KullaniciPuani", "MahalleId", "RolId") FROM stdin;
\.


--
-- Data for Name: Mahalleler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mahalleler" ("Id", "IlceId", "MahalleAdi") FROM stdin;
\.


--
-- Data for Name: Oturumlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oturumlar" ("Id", "KullaniciId", "OturumZamani", "OturumIp", "OturumTarayicisi") FROM stdin;
\.


--
-- Data for Name: Roller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roller" ("Id", "RolAdi", "Haklari") FROM stdin;
\.


--
-- Data for Name: SandikDurumu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SandikDurumu" ("Id", "SandikId", "KullaniciId", "GecerliOySayisi", "GecersizOySayisi", "ToplamSecmenSayisi") FROM stdin;
\.


--
-- Data for Name: Sandiklar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sandiklar" ("Id", "SandikNo", "MahalleId") FROM stdin;
\.


--
-- Data for Name: Sehirler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sehirler" ("Id", "SehirAdi") FROM stdin;
\.


--
-- Data for Name: Sonuclar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sonuclar" ("Id", "KullaniciId", "SandikId", "AdayId", "OySayisi") FROM stdin;
\.


--
-- Data for Name: Tutanaklar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tutanaklar" ("Id", "SandikId", "KullaniciId", "Resim", "GonderilmeTarihi", "OnayliMi", "OnayTarihi", "OnaylayanId") FROM stdin;
\.


--
-- Name: Adaylar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Adaylar_Id_seq"', 1, false);


--
-- Name: Ilceler_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ilceler_Id_seq"', 1, false);


--
-- Name: Kullanicilar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kullanicilar_Id_seq"', 1, false);


--
-- Name: Mahalleler_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Mahalleler_Id_seq"', 1, false);


--
-- Name: Oturumlar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Oturumlar_Id_seq"', 1, false);


--
-- Name: SandikDurumu_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SandikDurumu_Id_seq"', 1, false);


--
-- Name: Sandiklar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sandiklar_Id_seq"', 1, false);


--
-- Name: Sehirler_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sehirler_Id_seq"', 1, false);


--
-- Name: Sonuclar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sonuclar_Id_seq"', 1, false);


--
-- Name: Tutanaklar_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tutanaklar_Id_seq"', 1, false);


--
-- Name: Adaylar PK_public.Adaylar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adaylar"
    ADD CONSTRAINT "PK_public.Adaylar" PRIMARY KEY ("Id");


--
-- Name: Ilceler PK_public.Ilceler; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilceler"
    ADD CONSTRAINT "PK_public.Ilceler" PRIMARY KEY ("Id");


--
-- Name: Kullanicilar PK_public.Kullanicilar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar"
    ADD CONSTRAINT "PK_public.Kullanicilar" PRIMARY KEY ("Id");


--
-- Name: Mahalleler PK_public.Mahalleler; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahalleler"
    ADD CONSTRAINT "PK_public.Mahalleler" PRIMARY KEY ("Id");


--
-- Name: Oturumlar PK_public.Oturumlar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oturumlar"
    ADD CONSTRAINT "PK_public.Oturumlar" PRIMARY KEY ("Id");


--
-- Name: Roller PK_public.Roller; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roller"
    ADD CONSTRAINT "PK_public.Roller" PRIMARY KEY ("Id");


--
-- Name: SandikDurumu PK_public.SandikDurumu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SandikDurumu"
    ADD CONSTRAINT "PK_public.SandikDurumu" PRIMARY KEY ("Id");


--
-- Name: Sandiklar PK_public.Sandiklar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sandiklar"
    ADD CONSTRAINT "PK_public.Sandiklar" PRIMARY KEY ("Id");


--
-- Name: Sehirler PK_public.Sehirler; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sehirler"
    ADD CONSTRAINT "PK_public.Sehirler" PRIMARY KEY ("Id");


--
-- Name: Sonuclar PK_public.Sonuclar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sonuclar"
    ADD CONSTRAINT "PK_public.Sonuclar" PRIMARY KEY ("Id");


--
-- Name: Tutanaklar PK_public.Tutanaklar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tutanaklar"
    ADD CONSTRAINT "PK_public.Tutanaklar" PRIMARY KEY ("Id");


--
-- Name: Ilceler_IX_SehirId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Ilceler_IX_SehirId" ON public."Ilceler" USING btree ("SehirId");


--
-- Name: Kullanicilar_IX_MahalleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Kullanicilar_IX_MahalleId" ON public."Kullanicilar" USING btree ("MahalleId");


--
-- Name: Kullanicilar_IX_RolId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Kullanicilar_IX_RolId" ON public."Kullanicilar" USING btree ("RolId");


--
-- Name: Mahalleler_IX_IlceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Mahalleler_IX_IlceId" ON public."Mahalleler" USING btree ("IlceId");


--
-- Name: Oturumlar_IX_KullaniciId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Oturumlar_IX_KullaniciId" ON public."Oturumlar" USING btree ("KullaniciId");


--
-- Name: SandikDurumu_IX_KullaniciId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SandikDurumu_IX_KullaniciId" ON public."SandikDurumu" USING btree ("KullaniciId");


--
-- Name: SandikDurumu_IX_SandikId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SandikDurumu_IX_SandikId" ON public."SandikDurumu" USING btree ("SandikId");


--
-- Name: Sandiklar_IX_MahalleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Sandiklar_IX_MahalleId" ON public."Sandiklar" USING btree ("MahalleId");


--
-- Name: Sonuclar_IX_AdayId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Sonuclar_IX_AdayId" ON public."Sonuclar" USING btree ("AdayId");


--
-- Name: Sonuclar_IX_KullaniciId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Sonuclar_IX_KullaniciId" ON public."Sonuclar" USING btree ("KullaniciId");


--
-- Name: Sonuclar_IX_SandikId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Sonuclar_IX_SandikId" ON public."Sonuclar" USING btree ("SandikId");


--
-- Name: Tutanaklar_IX_KullaniciId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tutanaklar_IX_KullaniciId" ON public."Tutanaklar" USING btree ("KullaniciId");


--
-- Name: Tutanaklar_IX_OnaylayanId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tutanaklar_IX_OnaylayanId" ON public."Tutanaklar" USING btree ("OnaylayanId");


--
-- Name: Tutanaklar_IX_SandikId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Tutanaklar_IX_SandikId" ON public."Tutanaklar" USING btree ("SandikId");


--
-- Name: Ilceler FK_public.Ilceler_public.Sehirler_SehirId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilceler"
    ADD CONSTRAINT "FK_public.Ilceler_public.Sehirler_SehirId" FOREIGN KEY ("SehirId") REFERENCES public."Sehirler"("Id");


--
-- Name: Kullanicilar FK_public.Kullanicilar_public.Mahalleler_MahalleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar"
    ADD CONSTRAINT "FK_public.Kullanicilar_public.Mahalleler_MahalleId" FOREIGN KEY ("MahalleId") REFERENCES public."Mahalleler"("Id");


--
-- Name: Kullanicilar FK_public.Kullanicilar_public.Roller_RolId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanicilar"
    ADD CONSTRAINT "FK_public.Kullanicilar_public.Roller_RolId" FOREIGN KEY ("RolId") REFERENCES public."Roller"("Id");


--
-- Name: Mahalleler FK_public.Mahalleler_public.Ilceler_IlceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahalleler"
    ADD CONSTRAINT "FK_public.Mahalleler_public.Ilceler_IlceId" FOREIGN KEY ("IlceId") REFERENCES public."Ilceler"("Id");


--
-- Name: Oturumlar FK_public.Oturumlar_public.Kullanicilar_KullaniciId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oturumlar"
    ADD CONSTRAINT "FK_public.Oturumlar_public.Kullanicilar_KullaniciId" FOREIGN KEY ("KullaniciId") REFERENCES public."Kullanicilar"("Id");


--
-- Name: SandikDurumu FK_public.SandikDurumu_public.Kullanicilar_KullaniciId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SandikDurumu"
    ADD CONSTRAINT "FK_public.SandikDurumu_public.Kullanicilar_KullaniciId" FOREIGN KEY ("KullaniciId") REFERENCES public."Kullanicilar"("Id");


--
-- Name: SandikDurumu FK_public.SandikDurumu_public.Sandiklar_SandikId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SandikDurumu"
    ADD CONSTRAINT "FK_public.SandikDurumu_public.Sandiklar_SandikId" FOREIGN KEY ("SandikId") REFERENCES public."Sandiklar"("Id");


--
-- Name: Sandiklar FK_public.Sandiklar_public.Mahalleler_MahalleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sandiklar"
    ADD CONSTRAINT "FK_public.Sandiklar_public.Mahalleler_MahalleId" FOREIGN KEY ("MahalleId") REFERENCES public."Mahalleler"("Id");


--
-- Name: Sonuclar FK_public.Sonuclar_public.Adaylar_AdayId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sonuclar"
    ADD CONSTRAINT "FK_public.Sonuclar_public.Adaylar_AdayId" FOREIGN KEY ("AdayId") REFERENCES public."Adaylar"("Id");


--
-- Name: Sonuclar FK_public.Sonuclar_public.Kullanicilar_KullaniciId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sonuclar"
    ADD CONSTRAINT "FK_public.Sonuclar_public.Kullanicilar_KullaniciId" FOREIGN KEY ("KullaniciId") REFERENCES public."Kullanicilar"("Id");


--
-- Name: Sonuclar FK_public.Sonuclar_public.Sandiklar_SandikId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sonuclar"
    ADD CONSTRAINT "FK_public.Sonuclar_public.Sandiklar_SandikId" FOREIGN KEY ("SandikId") REFERENCES public."Sandiklar"("Id");


--
-- Name: Tutanaklar FK_public.Tutanaklar_public.Kullanicilar_KullaniciId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tutanaklar"
    ADD CONSTRAINT "FK_public.Tutanaklar_public.Kullanicilar_KullaniciId" FOREIGN KEY ("KullaniciId") REFERENCES public."Kullanicilar"("Id");


--
-- Name: Tutanaklar FK_public.Tutanaklar_public.Kullanicilar_OnaylayanId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tutanaklar"
    ADD CONSTRAINT "FK_public.Tutanaklar_public.Kullanicilar_OnaylayanId" FOREIGN KEY ("OnaylayanId") REFERENCES public."Kullanicilar"("Id");


--
-- Name: Tutanaklar FK_public.Tutanaklar_public.Sandiklar_SandikId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tutanaklar"
    ADD CONSTRAINT "FK_public.Tutanaklar_public.Sandiklar_SandikId" FOREIGN KEY ("SandikId") REFERENCES public."Sandiklar"("Id");


--
-- PostgreSQL database dump complete
--

