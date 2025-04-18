--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.4 (Homebrew)

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
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    sender character varying(100) NOT NULL,
    message text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    chat_token text
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ChatMessages_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ChatMessages_Id_seq" OWNER TO postgres;

--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ChatMessages_Id_seq" OWNED BY public.chat_messages.id;


--
-- Name: fordon_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fordon_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    reg_nummer text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.fordon_forms OWNER TO postgres;

--
-- Name: FordonForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FordonForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."FordonForms_Id_seq" OWNER TO postgres;

--
-- Name: FordonForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FordonForms_Id_seq" OWNED BY public.fordon_forms."Id";


--
-- Name: forsakrings_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forsakrings_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    insurance_type text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.forsakrings_forms OWNER TO postgres;

--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ForsakringsForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ForsakringsForms_Id_seq" OWNER TO postgres;

--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ForsakringsForms_Id_seq" OWNED BY public.forsakrings_forms."Id";


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    company_role character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Role_id_seq" OWNER TO postgres;

--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_id_seq" OWNED BY public.role.id;


--
-- Name: tele_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tele_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    service_type text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.tele_forms OWNER TO postgres;

--
-- Name: TeleForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TeleForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TeleForms_Id_seq" OWNER TO postgres;

--
-- Name: TeleForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TeleForms_Id_seq" OWNED BY public.tele_forms."Id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "Id" integer NOT NULL,
    first_name character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    company character varying(50) DEFAULT ''::character varying NOT NULL,
    role_id smallint,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_Id_seq" OWNER TO postgres;

--
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public.users."Id";


--
-- Name: chat_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_ratings (
    id integer NOT NULL,
    chat_token text NOT NULL,
    rating integer,
    feedback text,
    submitted_at timestamp without time zone DEFAULT now(),
    CONSTRAINT chat_ratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.chat_ratings OWNER TO postgres;

--
-- Name: dynamicforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dynamicforms (
    id integer NOT NULL,
    formtype character varying(50) NOT NULL,
    firstname character varying(100) NOT NULL,
    companytype character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    fields jsonb NOT NULL,
    message text,
    chattoken character varying(100) NOT NULL,
    submittedat timestamp without time zone NOT NULL,
    ischatactive boolean DEFAULT true NOT NULL
);


ALTER TABLE public.dynamicforms OWNER TO postgres;

--
-- Name: admin_tickets; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.admin_tickets AS
 SELECT cr.chat_token,
    cr.rating,
    cr.feedback,
    u.first_name
   FROM (public.chat_ratings cr
     JOIN public.users u ON (((u.email)::text = ( SELECT all_forms.email
           FROM ( SELECT fordon_forms.email,
                    fordon_forms.chat_token
                   FROM public.fordon_forms
                UNION ALL
                 SELECT forsakrings_forms.email,
                    forsakrings_forms.chat_token
                   FROM public.forsakrings_forms
                UNION ALL
                 SELECT tele_forms.email,
                    tele_forms.chat_token
                   FROM public.tele_forms
                UNION ALL
                 SELECT dynamicforms.email,
                    cr.chat_token
                   FROM public.dynamicforms) all_forms
          WHERE (all_forms.chat_token = cr.chat_token)
         LIMIT 1))));


ALTER VIEW public.admin_tickets OWNER TO postgres;

--
-- Name: archived_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archived_tickets (
    id integer NOT NULL,
    original_id integer,
    original_table text,
    form_type text NOT NULL,
    first_name text,
    email text,
    issue_type text,
    message text,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone,
    resolved_at timestamp with time zone,
    company_type text,
    resolution_notes text,
    service_type text,
    reg_nummer text,
    insurance_type text
);


ALTER TABLE public.archived_tickets OWNER TO postgres;

--
-- Name: archived_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archived_tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archived_tickets_id_seq OWNER TO postgres;

--
-- Name: archived_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archived_tickets_id_seq OWNED BY public.archived_tickets.id;


--
-- Name: chat_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_ratings_id_seq OWNER TO postgres;

--
-- Name: chat_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_ratings_id_seq OWNED BY public.chat_ratings.id;


--
-- Name: dynamicforms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dynamicforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dynamicforms_id_seq OWNER TO postgres;

--
-- Name: dynamicforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dynamicforms_id_seq OWNED BY public.dynamicforms.id;


--
-- Name: fordon_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fordon_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."fordon_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: forsakrings_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.forsakrings_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."forsakrings_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: initial_form_messages; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.initial_form_messages AS
 SELECT ff.chat_token,
    ff.first_name AS sender,
    ff.message,
    ff.submitted_at,
    ff.issue_type,
    ff.email,
    'Fordonsservice'::text AS form_type
   FROM public.fordon_forms ff
  WHERE (ff.is_chat_active = true)
UNION ALL
 SELECT tf.chat_token,
    tf.first_name AS sender,
    tf.message,
    tf.submitted_at,
    tf.issue_type,
    tf.email,
    'Tele/Bredband'::text AS form_type
   FROM public.tele_forms tf
  WHERE (tf.is_chat_active = true)
UNION ALL
 SELECT f.chat_token,
    f.first_name AS sender,
    f.message,
    f.submitted_at,
    f.issue_type,
    f.email,
    'Försäkringsärenden'::text AS form_type
   FROM public.forsakrings_forms f
  WHERE (f.is_chat_active = true);


ALTER VIEW public.initial_form_messages OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.role ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tele_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tele_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."tele_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: archived_tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archived_tickets ALTER COLUMN id SET DEFAULT nextval('public.archived_tickets_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public."ChatMessages_Id_seq"'::regclass);


--
-- Name: chat_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_ratings ALTER COLUMN id SET DEFAULT nextval('public.chat_ratings_id_seq'::regclass);


--
-- Name: dynamicforms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms ALTER COLUMN id SET DEFAULT nextval('public.dynamicforms_id_seq'::regclass);


--
-- Data for Name: archived_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archived_tickets (id, original_id, original_table, form_type, first_name, email, issue_type, message, chat_token, submitted_at, resolved_at, company_type, resolution_notes, service_type, reg_nummer, insurance_type) FROM stdin;
15	\N	\N	Fordonsservice	Ville	ville.eliasson99@gmail.com	Ville - Fordonsservice	test2	51cedfa1-83b4-46ab-9a61-32671be6d84d	2025-03-11 13:59:41.056198+00	2025-03-13 09:37:35.250546+00		\N		\N	\N
16	\N	\N	Fordonsservice	Kajsa	shaabaan_@hotmail.com	Kajsa - Fordonsservice	Min motor har lagt av	8f18cf90-57c1-4e4c-bd85-370bc07428e1	2025-03-12 10:08:49.417935+00	2025-03-13 10:08:49.417938+00		Closed from dashboard		\N	\N
17	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	26f10f19-4da8-444d-adb5-7f92249dd78f	2025-03-12 11:26:17.919047+00	2025-03-13 11:26:17.91905+00		Closed from dashboard		\N	\N
18	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	qwerty	9ef97352-21fb-471c-b84a-d1a2c33630b2	2025-03-12 11:30:33.300514+00	2025-03-13 11:30:33.300517+00		Closed from dashboard		\N	\N
19	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	26f10f19-4da8-444d-adb5-7f92249dd78f	2025-03-12 11:43:14.838161+00	2025-03-13 11:43:14.838167+00		Closed from dashboard		\N	\N
20	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	f3d71325-de6f-4e14-ace9-4eec711d2cc2	2025-03-12 11:46:12.125167+00	2025-03-13 11:46:12.12517+00		Closed from dashboard		\N	\N
21	1	initial_form_messages	Fordonsservice	test3	shaabaan_@hotmail.com	test3 - Fordonsservice	test	2a9924d3-fb94-4fcc-ac75-86740a259673	2025-03-12 12:05:14.263141+00	2025-03-13 12:05:14.263144+00		Closed from dashboard		\N	\N
22	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	hjälp mig 	269a695d-2b24-4ce2-afab-8f6cb7b370fc	2025-03-12 13:11:44.950864+00	2025-03-13 13:11:44.950867+00		Closed from dashboard		\N	\N
23	1	initial_form_messages	Tele/Bredband	Sebastian	sebbe_97@outlook.com	Sebastian - Tele/Bredband	hjälp mig	be3f79da-4e76-495a-a0c1-e913e850214f	2025-03-12 13:13:31.777068+00	2025-03-13 13:13:31.77707+00		Closed from dashboard		\N	\N
24	1	initial_form_messages	Tele/Bredband	Kevin	maadridista@gmail.com	Kevin - Tele/Bredband	testing ...	8d5adaa4-1eed-47ac-8530-775d163db4b7	2025-03-12 13:19:57.987995+00	2025-03-13 13:19:57.988008+00		Closed from dashboard		\N	\N
27	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	hjälp mig 	269a695d-2b24-4ce2-afab-8f6cb7b370fc	2025-03-13 12:38:39.277333+00	2025-03-14 12:38:39.277341+00		Closed from dashboard		\N	\N
28	1	initial_form_messages	Fordonsservice	testing	testing8@gmail.com	testing - Fordonsservice	321	fe177498-183d-4391-9c80-c62e9afeffdf	2025-03-13 14:13:14.317201+00	2025-03-14 14:13:14.317204+00		Closed from dashboard		\N	\N
29	1	initial_form_messages	Tele/Bredband	Kalle	shaabaan_@hotmail.com	Kalle - Tele/Bredband	hjälp mig!!	126897f3-92e7-410f-b04c-114f70ca6bc9	2025-03-16 10:23:39.501063+00	2025-03-17 10:23:39.501066+00		Closed from dashboard		\N	\N
30	1	initial_form_messages	Tele/Bredband	Pontus	shaabaan_@hotmail.com	Pontus - Tele/Bredband	Min faktura är för dyr	b93c9d1f-8043-4541-92e0-f01f64436928	2025-03-17 13:38:11.287765+00	2025-03-18 13:38:11.287774+00		Closed from dashboard		\N	\N
31	1	initial_form_messages	Tele/Bredband	Putte	shaabaan_@hotmail.com	Putte - Tele/Bredband	Hej min faktura är för dyr	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022	2025-03-23 19:23:13.100143+00	2025-03-24 19:23:13.100149+00		Closed from dashboard		\N	\N
32	1	initial_form_messages	Fordonsservice	Löken	löken.test@gmail.com	Garantiärende	Bilen låter konstigt när jag startar den.	5cc2b330-9b56-4fe9-8872-6da640a91bfa	2025-04-06 08:47:45.467994+00	2025-04-07 08:47:45.46814+00	Fordonsservice	Closed from dashboard		\N	\N
34	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-12 14:17:49.372464+00	2025-04-13 14:17:49.372824+00		Closed from dashboard		\N	\N
35	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 09:09:10.090478+00	2025-04-14 09:09:10.090482+00		Closed from dashboard		\N	\N
36	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 09:37:47.21876+00	2025-04-14 09:37:47.218921+00		Closed from dashboard		\N	\N
37	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 10:13:33.889976+00	2025-04-14 10:13:33.889978+00		Closed from dashboard		\N	\N
38	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 10:15:23.238798+00	2025-04-14 10:15:23.238811+00		Closed from dashboard		\N	\N
39	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 10:27:42.381175+00	2025-04-14 10:27:42.381179+00	Fordonsservice	Closed from dashboard		\N	\N
40	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 10:29:50.321114+00	2025-04-14 10:29:50.321117+00		Closed from dashboard		\N	\N
41	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 10:31:37.346324+00	2025-04-14 10:31:37.346327+00		Closed from dashboard		\N	\N
42	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 10:36:47.177601+00	2025-04-14 10:36:47.177605+00	Fordonsservice	Closed from dashboard		\N	\N
43	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 10:48:59.306846+00	2025-04-14 10:48:59.30685+00	Fordonsservice	Closed from dashboard		\N	\N
44	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 10:55:51.37519+00	2025-04-14 10:55:51.375236+00	Fordonsservice	Closed from dashboard		\N	\N
45	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 10:59:55.897686+00	2025-04-14 10:59:55.89769+00	Fordonsservice	Closed from dashboard		\N	\N
46	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 11:03:58.107778+00	2025-04-14 11:03:58.107783+00	Fordonsservice	Closed from dashboard		\N	\N
47	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 11:08:50.037185+00	2025-04-14 11:08:50.037189+00	Fordonsservice	Closed from dashboard		\N	\N
48	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 11:12:49.610912+00	2025-04-14 11:12:49.610916+00	Fordonsservice	Closed from dashboard		\N	\N
49	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 11:18:12.61491+00	2025-04-14 11:18:12.614921+00	Fordonsservice	Closed from dashboard		\N	\N
50	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 11:26:46.385264+00	2025-04-14 11:26:46.385268+00	Fordonsservice	Closed from dashboard		\N	\N
51	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:13:35.382621+00	2025-04-14 13:13:35.382625+00	Fordonsservice	Closed from dashboard		\N	\N
52	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:18:13.324896+00	2025-04-14 13:18:13.324899+00	Fordonsservice	Closed from dashboard		\N	\N
53	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:28:11.847134+00	2025-04-14 13:28:11.847137+00	Fordonsservice	Closed from dashboard		\N	\N
54	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:37:03.300229+00	2025-04-14 13:37:03.300232+00	Fordonsservice	Closed from dashboard		\N	\N
55	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:37:19.144138+00	2025-04-14 13:37:19.144142+00	Fordonsservice	Closed from dashboard		\N	\N
56	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 13:43:16.991145+00	2025-04-14 13:43:16.991149+00	Fordonsservice	Closed from dashboard		\N	\N
57	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:00:52.727718+00	2025-04-14 14:00:52.727722+00	Fordonsservice	Closed from dashboard		\N	\N
58	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:01:48.302563+00	2025-04-14 14:01:48.302567+00	Fordonsservice	Closed from dashboard		\N	\N
59	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:04:02.594531+00	2025-04-14 14:04:02.594535+00	Fordonsservice	Closed from dashboard		\N	\N
60	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:14:46.439647+00	2025-04-14 14:14:46.439651+00	Fordonsservice	Closed from dashboard		\N	\N
61	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:34:12.841381+00	2025-04-14 14:34:12.841384+00	Fordonsservice	Closed from dashboard		\N	\N
62	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:42:03.657982+00	2025-04-14 14:42:03.657987+00	Fordonsservice	Closed from dashboard		\N	\N
63	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 14:53:43.420894+00	2025-04-14 14:53:43.420898+00	Fordonsservice	Closed from dashboard		\N	\N
64	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 15:09:47.74428+00	2025-04-14 15:09:47.744284+00	Fordonsservice	Closed from dashboard		\N	\N
65	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 15:23:06.963207+00	2025-04-14 15:23:06.963212+00	Fordonsservice	Closed from dashboard		\N	\N
66	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 15:37:30.693048+00	2025-04-14 15:37:30.693051+00	Fordonsservice	Closed from dashboard		\N	\N
67	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:25:09.037735+00	2025-04-14 18:25:09.037921+00		Closed from dashboard		\N	\N
68	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:28:16.354469+00	2025-04-14 18:28:16.354788+00		Closed from dashboard		\N	\N
69	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:32:57.354573+00	2025-04-14 18:32:57.354597+00		Closed from dashboard		\N	\N
70	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:35:48.223369+00	2025-04-14 18:35:48.223409+00		Closed from dashboard		\N	\N
71	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-13 18:39:08.774464+00	2025-04-14 18:39:08.774497+00		Closed from dashboard		\N	\N
72	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 18:42:44.864235+00	2025-04-14 18:42:44.86424+00	Fordonsservice	Closed from dashboard		\N	\N
73	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:44:41.09187+00	2025-04-14 18:44:41.091893+00		Closed from dashboard		\N	\N
74	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:45:24.244458+00	2025-04-14 18:45:24.24448+00		Closed from dashboard		\N	\N
75	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 18:50:10.237481+00	2025-04-14 18:50:10.237484+00		Closed from dashboard		\N	\N
76	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:04:40.515658+00	2025-04-14 19:04:40.51568+00		Closed from dashboard		\N	\N
77	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:08:18.579081+00	2025-04-14 19:08:18.57915+00		Closed from dashboard		\N	\N
78	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:10:24.366654+00	2025-04-14 19:10:24.36669+00		Closed from dashboard		\N	\N
79	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:12:46.582428+00	2025-04-14 19:12:46.583341+00		Closed from dashboard		\N	\N
80	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:14:07.919967+00	2025-04-14 19:14:07.920027+00		Closed from dashboard		\N	\N
81	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:34:19.104043+00	2025-04-14 19:34:19.104057+00		Closed from dashboard		\N	\N
82	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-13 19:37:18.043575+00	2025-04-14 19:37:18.044218+00		Closed from dashboard		\N	\N
83	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:02:01.052329+00	2025-04-14 20:02:01.052333+00	Fordonsservice	Closed from dashboard		\N	\N
84	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:02:06.776028+00	2025-04-14 20:02:06.776032+00	Fordonsservice	Closed from dashboard		\N	\N
85	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:08:00.656856+00	2025-04-14 20:08:00.65686+00	Fordonsservice	Closed from dashboard		\N	\N
86	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:13:20.083282+00	2025-04-14 20:13:20.083286+00	Fordonsservice	Closed from dashboard		\N	\N
87	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:28:13.972997+00	2025-04-14 20:28:13.973006+00	Fordonsservice	Closed from dashboard		\N	\N
88	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:33:20.045395+00	2025-04-14 20:33:20.045398+00	Fordonsservice	Closed from dashboard		\N	\N
89	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:37:15.335043+00	2025-04-14 20:37:15.335046+00	Fordonsservice	Closed from dashboard		\N	\N
90	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-13 20:49:35.547215+00	2025-04-14 20:49:35.547219+00	Fordonsservice	Closed from dashboard		\N	\N
91	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 07:48:04.091691+00	2025-04-15 07:48:04.091695+00	Fordonsservice	Closed from dashboard		\N	\N
92	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 07:59:38.391783+00	2025-04-15 07:59:38.391786+00	Fordonsservice	Closed from dashboard		\N	\N
93	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 08:14:08.139409+00	2025-04-15 08:14:08.139413+00	Fordonsservice	Closed from dashboard		\N	\N
94	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 09:05:29.169392+00	2025-04-15 09:05:29.169395+00	Fordonsservice	Closed from dashboard		\N	\N
95	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 09:16:32.267654+00	2025-04-15 09:16:32.267658+00	Fordonsservice	Closed from dashboard		\N	\N
96	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 09:34:31.067627+00	2025-04-15 09:34:31.067631+00	Fordonsservice	Closed from dashboard		\N	\N
97	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 09:49:51.785321+00	2025-04-15 09:49:51.785325+00	Fordonsservice	Closed from dashboard		\N	\N
98	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 09:50:27.198792+00	2025-04-15 09:50:27.198796+00	Fordonsservice	Closed from dashboard		\N	\N
99	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 10:01:30.504881+00	2025-04-15 10:01:30.504885+00	Fordonsservice	Closed from dashboard		\N	\N
100	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 10:12:36.907865+00	2025-04-15 10:12:36.90787+00	Fordonsservice	Closed from dashboard		\N	\N
101	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 10:30:04.084661+00	2025-04-15 10:30:04.084665+00	Fordonsservice	Closed from dashboard		\N	\N
102	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 10:43:11.000271+00	2025-04-15 10:43:11.000275+00	Fordonsservice	Closed from dashboard		\N	\N
103	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 10:54:43.915667+00	2025-04-15 10:54:43.915671+00	Fordonsservice	Closed from dashboard		\N	\N
104	1	initial_form_messages	Fordonsservice	Löken	löken.test@gmail.com	Garantiärende	Bilen låter konstigt när jag startar den.	a3981e4d-e776-4640-b6d7-bc67d28306d3	2025-04-14 12:39:32.101194+00	2025-04-15 12:39:32.101197+00	Fordonsservice	Closed from dashboard		\N	\N
105	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 13:01:36.676976+00	2025-04-15 13:01:36.67698+00	Fordonsservice	Closed from dashboard		\N	\N
106	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 13:44:53.139964+00	2025-04-15 13:44:53.139968+00	Fordonsservice	Closed from dashboard		\N	\N
107	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-14 13:55:51.965238+00	2025-04-15 13:55:51.965245+00		Closed from dashboard		\N	\N
108	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 14:06:49.457386+00	2025-04-15 14:06:49.45739+00	Fordonsservice	Closed from dashboard		\N	\N
109	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-14 15:07:18.996896+00	2025-04-15 15:07:18.9969+00	Fordonsservice	Closed from dashboard		\N	\N
110	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 08:11:04.168413+00	2025-04-16 08:11:04.168424+00	Fordonsservice	Closed from dashboard		\N	\N
111	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 08:20:27.982192+00	2025-04-16 08:20:27.982196+00	Fordonsservice	Closed from dashboard		\N	\N
112	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 08:25:57.208886+00	2025-04-16 08:25:57.20889+00	Fordonsservice	Closed from dashboard		\N	\N
113	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 08:35:48.330387+00	2025-04-16 08:35:48.330399+00	Fordonsservice	Closed from dashboard		\N	\N
114	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 08:57:17.514353+00	2025-04-16 08:57:17.514357+00	Fordonsservice	Closed from dashboard		\N	\N
115	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 09:07:08.80058+00	2025-04-16 09:07:08.800583+00	Fordonsservice	Closed from dashboard		\N	\N
116	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 09:15:01.710179+00	2025-04-16 09:15:01.710183+00	Fordonsservice	Closed from dashboard		\N	\N
117	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 09:25:48.32371+00	2025-04-16 09:25:48.323714+00	Fordonsservice	Closed from dashboard		\N	\N
118	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 09:34:18.203642+00	2025-04-16 09:34:18.203645+00	Fordonsservice	Closed from dashboard		\N	\N
119	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 09:42:17.647072+00	2025-04-16 09:42:17.647076+00	Fordonsservice	Closed from dashboard		\N	\N
120	1	initial_form_messages	Fordonsservice	Löken	löken.test@gmail.com	Garantiärende	Bilen låter konstigt när jag startar den.	f433cba8-8112-4951-956d-d5e5992de422	2025-04-15 12:48:54.350959+00	2025-04-16 12:48:54.350962+00	Fordonsservice	Closed from dashboard		\N	\N
121	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 12:52:10.905097+00	2025-04-16 12:52:10.905101+00	Fordonsservice	Closed from dashboard		\N	\N
122	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 13:07:09.036791+00	2025-04-16 13:07:09.036794+00	Fordonsservice	Closed from dashboard		\N	\N
123	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 13:16:17.68597+00	2025-04-16 13:16:17.685974+00	Fordonsservice	Closed from dashboard		\N	\N
124	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 13:21:33.071868+00	2025-04-16 13:21:33.071872+00	Fordonsservice	Closed from dashboard		\N	\N
125	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 13:26:12.619359+00	2025-04-16 13:26:12.619362+00	Fordonsservice	Closed from dashboard		\N	\N
126	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 13:32:45.684381+00	2025-04-16 13:32:45.684385+00	Fordonsservice	Closed from dashboard		\N	\N
127	1	initial_form_messages	Tele/Bredband	TestKund	testkund@example.com	Tekniskt problem	Testar ett ärende	0b521eed-ff49-4938-aae4-dafea2ee417e	2025-04-15 13:43:01.158451+00	2025-04-16 13:43:01.158469+00		Ärendet har lösts under testning		\N	\N
128	1	initial_form_messages	Tele/Bredband	TestKund	testkund@example.com	Tekniskt problem	Testar ett ärende	8da45d66-cb3c-4e88-962d-bafeb49f599f	2025-04-15 13:46:44.963513+00	2025-04-16 13:46:44.963515+00		Ärendet har lösts under testning		\N	\N
129	1	initial_form_messages	Tele/Bredband	TestKund	testkund@example.com	Tekniskt problem	Testar ett ärende	a25b5f1c-2f83-49ca-bc28-c464fdb43867	2025-04-15 14:07:42.925982+00	2025-04-16 14:07:42.925992+00		Ärendet har lösts under testning		\N	\N
130	1	initial_form_messages	Tele/Bredband	TestKund	testkund@example.com	Tekniskt problem	Testar ett ärende	f1354356-62fd-4fcc-a357-0163adeeaee3	2025-04-15 14:08:03.140217+00	2025-04-16 14:08:03.14022+00		Ärendet har lösts under testning		\N	\N
131	1	initial_form_messages	Fordonsservice	Ville	ville.eliasson99@gmail.com	Ville - Fordonsservice	Jag behöver hjälp nu.	2885815c-1181-4101-b473-54947e6cb33c	2025-04-15 14:11:42.417007+00	2025-04-16 14:11:42.417021+00		Closed from dashboard		\N	\N
132	1	initial_form_messages	Fordonsservice	Ville	ville.eliasson99@gmail.com	Ville - Fordonsservice	Jag behöver hjälp nu.	2885815c-1181-4101-b473-54947e6cb33c	2025-04-15 14:31:38.600919+00	2025-04-16 14:31:38.600934+00		Closed from dashboard		\N	\N
133	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-15 14:37:38.3027+00	2025-04-16 14:37:38.302863+00		Closed from dashboard		\N	\N
134	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-15 14:58:37.065893+00	2025-04-16 14:58:37.065906+00		Closed from dashboard		\N	\N
135	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-15 15:04:26.269655+00	2025-04-16 15:04:26.269661+00		Closed from dashboard		\N	\N
136	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-15 15:34:08.804846+00	2025-04-16 15:34:08.80485+00		Closed from dashboard		\N	\N
137	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-15 15:42:28.056368+00	2025-04-16 15:42:28.056373+00		Closed from dashboard		\N	\N
138	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-15 15:46:01.251658+00	2025-04-16 15:46:01.251662+00	Fordonsservice	Closed from dashboard		\N	\N
139	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-16 08:08:03.462679+00	2025-04-17 08:08:03.462695+00		Closed from dashboard		\N	\N
140	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-16 10:18:59.403064+00	2025-04-17 10:18:59.403329+00		Closed from dashboard		\N	\N
141	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-16 10:22:15.155841+00	2025-04-17 10:22:15.155846+00		Closed from dashboard		\N	\N
142	1	initial_form_messages	Tele/Bredband	TestKund	testkund@example.com	Tekniskt problem	Testar ett ärende	4f0b95b3-2897-4001-b63b-6ceb2a78dc05	2025-04-16 10:40:49.475273+00	2025-04-17 10:40:49.475282+00		Ärendet har lösts under testning		\N	\N
143	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-16 10:44:09.412595+00	2025-04-17 10:44:09.412599+00	Fordonsservice	Closed from dashboard		\N	\N
144	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-16 10:56:28.467758+00	2025-04-17 10:56:28.467764+00		Closed from dashboard		\N	\N
145	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-16 11:00:35.911948+00	2025-04-17 11:00:35.911952+00		Closed from dashboard		\N	\N
146	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-17 12:23:34.616227+00	2025-04-18 12:23:34.616231+00		Closed from dashboard		\N	\N
147	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-17 12:31:22.754355+00	2025-04-18 12:31:22.75436+00		Closed from dashboard		\N	\N
148	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 13:47:28.328467+00	2025-04-18 13:47:28.328471+00	Fordonsservice	Closed from dashboard		\N	\N
149	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 13:50:07.375953+00	2025-04-18 13:50:07.375956+00	Fordonsservice	Closed from dashboard		\N	\N
150	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 13:51:58.012645+00	2025-04-18 13:51:58.012649+00	Fordonsservice	Closed from dashboard		\N	\N
151	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 13:52:45.760163+00	2025-04-18 13:52:45.760167+00	Fordonsservice	Closed from dashboard		\N	\N
152	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 13:54:25.729115+00	2025-04-18 13:54:25.729118+00	Fordonsservice	Closed from dashboard		\N	\N
153	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 14:07:42.672108+00	2025-04-18 14:07:42.672112+00	Fordonsservice	Closed from dashboard		\N	\N
154	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 14:08:15.73773+00	2025-04-18 14:08:15.737734+00	Fordonsservice	Closed from dashboard		\N	\N
155	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 14:08:38.860165+00	2025-04-18 14:08:38.860169+00	Fordonsservice	Closed from dashboard		\N	\N
156	1	initial_form_messages	Unknown	Unknown	hultberg.80@gmail.com	Övrigt	Hej, jag har en fråga om min beställning.	80755554-44e8-4fff-b18a-a46ef6efdeda	2025-04-17 14:10:39.480794+00	2025-04-18 14:10:39.480798+00	Fordonsservice	Closed from dashboard		\N	\N
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, sender, message, submitted_at, chat_token) FROM stdin;
1	Max	jag vill inte betala pengar.	2025-03-06 15:40:42.125928+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
2	Support	Skit i det då	2025-03-06 15:42:17.949626+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
3	Support	Nä ja vill inte skita i det	2025-03-06 15:42:29.61804+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
4	Support	gör inte det då	2025-03-06 15:42:38.252898+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
5	Support	jo	2025-03-06 15:42:45.663309+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
6	Sebbe	test	2025-03-07 08:24:16.326936+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
7	Support	tjena mister	2025-03-07 08:25:23.203778+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
8	Support	test1	2025-03-07 08:25:42.816498+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
9	Support	2	2025-03-07 08:25:43.934082+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
10	Support	3	2025-03-07 08:25:44.553525+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
11	Support	4	2025-03-07 08:25:45.250256+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
12	Support	5	2025-03-07 08:25:46.000529+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
13	Support	6	2025-03-07 08:25:46.6961+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
14	Support	7	2025-03-07 08:25:47.326373+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
15	Support	8	2025-03-07 08:25:47.922348+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
16	Support	9	2025-03-07 08:25:48.541107+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
17	Support	10	2025-03-07 08:25:50.439403+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
18	Support	11	2025-03-07 08:25:51.306309+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
19	Support	12	2025-03-07 08:25:51.947903+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
20	Support	13	2025-03-07 08:25:52.632071+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
21	Sebbe	test	2025-03-07 08:40:43.432123+00	26f10f19-4da8-444d-adb5-7f92249dd78f
22	Support	1	2025-03-07 09:33:37.378636+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
23	Support	2	2025-03-07 09:33:48.776901+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
24	Support	3	2025-03-07 09:33:53.610332+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
25	Support	4	2025-03-07 09:33:53.997311+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
26	Support	5	2025-03-07 09:33:54.436103+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
27	Support	6	2025-03-07 09:33:54.749892+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
28	Support	7	2025-03-07 09:33:55.588238+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
29	Support	8	2025-03-07 09:33:55.946663+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
30	Support	9	2025-03-07 09:33:56.54285+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
31	Support	10	2025-03-07 09:33:57.486123+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
32	Support	11	2025-03-07 09:34:03.593701+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
33	Support	12	2025-03-07 09:34:04.402294+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
34	Support	13	2025-03-07 09:34:04.928572+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
35	Support	14	2025-03-07 09:34:05.349283+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
36	Support	15	2025-03-07 09:34:05.843289+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
37	Ville	test	2025-03-07 09:36:11.376561+00	0131b2dc-29f7-418e-9064-c490463f48e2
38	Support	1	2025-03-07 09:36:27.674681+00	0131b2dc-29f7-418e-9064-c490463f48e2
39	Ville	qwerty	2025-03-07 10:19:45.83401+00	9ef97352-21fb-471c-b84a-d1a2c33630b2
40	Support	123	2025-03-07 10:19:59.713521+00	9ef97352-21fb-471c-b84a-d1a2c33630b2
41	Ville	hjälp mig 	2025-03-07 12:16:55.206413+00	269a695d-2b24-4ce2-afab-8f6cb7b370fc
42	Ville	hjälp mig 2	2025-03-07 12:18:13.752398+00	fbda28b2-db2d-4606-aed7-6637c085332c
43	Sebastian	hjälp mig	2025-03-07 12:20:02.985099+00	be3f79da-4e76-495a-a0c1-e913e850214f
44	Ville	12345	2025-03-07 12:23:56.53387+00	be47881c-cd53-4e25-96dd-20cd223f2420
45	testshaban	test test test	2025-03-07 12:24:14.871478+00	a6bb745c-9a15-475a-87f0-801434651f0f
46	Support	1	2025-03-07 12:24:25.996039+00	fbda28b2-db2d-4606-aed7-6637c085332c
47	Support	2	2025-03-07 12:24:26.273911+00	fbda28b2-db2d-4606-aed7-6637c085332c
48	Support	3	2025-03-07 12:24:26.557096+00	fbda28b2-db2d-4606-aed7-6637c085332c
49	Support	4	2025-03-07 12:24:26.902601+00	fbda28b2-db2d-4606-aed7-6637c085332c
50	Support	56	2025-03-07 12:24:27.462203+00	fbda28b2-db2d-4606-aed7-6637c085332c
51	Support	7	2025-03-07 12:24:28.030888+00	fbda28b2-db2d-4606-aed7-6637c085332c
52	Support	8	2025-03-07 12:24:28.67972+00	fbda28b2-db2d-4606-aed7-6637c085332c
53	Support	9	2025-03-07 12:24:29.063967+00	fbda28b2-db2d-4606-aed7-6637c085332c
54	Support	0	2025-03-07 12:24:29.612647+00	fbda28b2-db2d-4606-aed7-6637c085332c
55	Support	10	2025-03-07 12:24:31.002317+00	fbda28b2-db2d-4606-aed7-6637c085332c
56	Support	12	2025-03-07 12:24:31.48331+00	fbda28b2-db2d-4606-aed7-6637c085332c
57	Support	1	2025-03-07 12:24:32.122649+00	a6bb745c-9a15-475a-87f0-801434651f0f
58	Support	1	2025-03-07 12:24:32.179288+00	fbda28b2-db2d-4606-aed7-6637c085332c
59	Support	2	2025-03-07 12:24:32.826942+00	a6bb745c-9a15-475a-87f0-801434651f0f
60	Support	12	2025-03-07 12:24:32.618334+00	fbda28b2-db2d-4606-aed7-6637c085332c
61	Support	3	2025-03-07 12:24:33.4505+00	a6bb745c-9a15-475a-87f0-801434651f0f
62	Support	14	2025-03-07 12:24:33.261827+00	fbda28b2-db2d-4606-aed7-6637c085332c
63	Support	4	2025-03-07 12:24:34.174086+00	a6bb745c-9a15-475a-87f0-801434651f0f
64	Support	51	2025-03-07 12:24:34.149816+00	fbda28b2-db2d-4606-aed7-6637c085332c
65	Support	5	2025-03-07 12:24:34.757745+00	a6bb745c-9a15-475a-87f0-801434651f0f
66	Support	6	2025-03-07 12:24:35.126503+00	fbda28b2-db2d-4606-aed7-6637c085332c
67	Support	26	2025-03-07 12:24:35.506807+00	fbda28b2-db2d-4606-aed7-6637c085332c
68	Support	6	2025-03-07 12:24:36.049854+00	a6bb745c-9a15-475a-87f0-801434651f0f
69	Support	7	2025-03-07 12:24:36.686376+00	a6bb745c-9a15-475a-87f0-801434651f0f
70	Support	8	2025-03-07 12:24:37.421993+00	a6bb745c-9a15-475a-87f0-801434651f0f
71	Support	9	2025-03-07 12:24:38.118582+00	a6bb745c-9a15-475a-87f0-801434651f0f
72	Support	10	2025-03-07 12:24:38.886606+00	a6bb745c-9a15-475a-87f0-801434651f0f
73	Support	11	2025-03-07 12:24:39.669483+00	a6bb745c-9a15-475a-87f0-801434651f0f
74	Support	12	2025-03-07 12:24:40.397694+00	a6bb745c-9a15-475a-87f0-801434651f0f
75	Support	13	2025-03-07 12:24:41.015186+00	a6bb745c-9a15-475a-87f0-801434651f0f
76	Support	45	2025-03-07 12:24:41.925325+00	a6bb745c-9a15-475a-87f0-801434651f0f
77	Support	14	2025-03-07 12:24:43.982163+00	a6bb745c-9a15-475a-87f0-801434651f0f
78	Support	15	2025-03-07 12:24:44.790791+00	a6bb745c-9a15-475a-87f0-801434651f0f
79	Support	16	2025-03-07 12:24:45.46607+00	a6bb745c-9a15-475a-87f0-801434651f0f
80	Support	17	2025-03-07 12:24:46.577675+00	a6bb745c-9a15-475a-87f0-801434651f0f
81	Support	18	2025-03-07 12:24:47.657357+00	a6bb745c-9a15-475a-87f0-801434651f0f
82	Support	19	2025-03-07 12:24:48.503029+00	a6bb745c-9a15-475a-87f0-801434651f0f
83	Support	20	2025-03-07 12:24:49.194004+00	a6bb745c-9a15-475a-87f0-801434651f0f
84	Support	test1	2025-03-07 12:34:03.638696+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
85	Support	test2	2025-03-07 12:34:09.755129+00	f3d71325-de6f-4e14-ace9-4eec711d2cc2
86	Support	test3	2025-03-07 12:34:15.571387+00	0131b2dc-29f7-418e-9064-c490463f48e2
87	Kajsa	Min motor har lagt av	2025-03-07 12:39:55.027154+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
88	Support	När gjorde den det?	2025-03-07 12:40:20.905492+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
89	Support	1	2025-03-07 12:45:39.939328+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
90	Support	2	2025-03-07 12:45:40.350028+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
91	Support	3	2025-03-07 12:45:40.73439+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
92	Support	4	2025-03-07 12:45:41.454788+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
93	Support	5	2025-03-07 12:45:41.887103+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
94	Support	6	2025-03-07 12:45:42.28817+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
95	Support	74	2025-03-07 12:45:42.860435+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
96	Support	8	2025-03-07 12:45:43.740766+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
97	Support	9	2025-03-07 12:45:44.238359+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
98	Support	10	2025-03-07 12:45:44.794861+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
99	Support	11	2025-03-07 12:45:45.321475+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
100	Support	12	2025-03-07 12:45:45.872736+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
101	Support	13	2025-03-07 12:45:46.55964+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
102	Support	14	2025-03-07 12:45:47.374519+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
103	Support	15	2025-03-07 12:45:47.964267+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
104	Support	16	2025-03-07 12:45:48.652422+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
105	Support	17	2025-03-07 12:45:49.406981+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
106	Support	18	2025-03-07 12:45:49.941757+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
107	Support	19	2025-03-07 12:45:52.165674+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
108	Support	20	2025-03-07 12:45:52.935123+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
109	Support	1	2025-03-10 09:00:24.987159+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
110	Support	2	2025-03-10 09:00:25.533781+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
111	Support	3	2025-03-10 09:00:26.342048+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
112	Support	4	2025-03-10 09:00:27.085817+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
113	Support	5	2025-03-10 09:00:27.62788+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
114	Support	6	2025-03-10 09:00:28.207417+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
115	Support	7	2025-03-10 09:00:28.936772+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
116	Support	8	2025-03-10 09:00:29.639403+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
117	Support	9	2025-03-10 09:00:30.243614+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
118	Support	10	2025-03-10 09:00:31.315772+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
119	Support	11	2025-03-10 09:00:32.413011+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
120	Support	12	2025-03-10 09:00:33.539993+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
121	Support	13	2025-03-10 09:00:35.078776+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
122	Kevin	testing ...	2025-03-10 09:52:05.416422+00	8d5adaa4-1eed-47ac-8530-775d163db4b7
123	Support	hej	2025-03-10 09:53:50.93432+00	8d5adaa4-1eed-47ac-8530-775d163db4b7
124	Support	🙂	2025-03-10 10:07:41.936189+00	8d5adaa4-1eed-47ac-8530-775d163db4b7
125	Support	ads	2025-03-10 10:38:11.341444+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
126	test	test	2025-03-10 14:27:00.865745+00	5c2350a8-c839-44a6-933d-2a76dfdc8823
127	SHABAN	test	2025-03-11 09:25:54.590619+00	af993dea-60f8-44a6-b00f-995a459c83b3
128	testesttest	test	2025-03-11 09:38:39.070898+00	7b36d71b-6ba4-4bbc-bdb1-3d86aa4225bd
129	test3	test	2025-03-11 09:38:59.915701+00	2a9924d3-fb94-4fcc-ac75-86740a259673
130	test4	test	2025-03-11 09:40:27.806688+00	6a61e316-feb1-45fb-8940-bcbf3a3e2590
131	Martin	test	2025-03-11 10:35:19.429965+00	f7b5b7ba-1375-4d89-abcc-ddda172b9c53
132	Ville	test	2025-03-11 12:43:05.282214+00	80ed8c7f-7ad1-4322-a6ef-c2b6f356b623
133	Ville	test2	2025-03-11 12:59:41.056198+00	51cedfa1-83b4-46ab-9a61-32671be6d84d
134	Ville	123	2025-03-11 13:02:44.478051+00	6b582888-6d5a-47ee-b7dd-a9fc7829956a
135	Ville	12345	2025-03-11 13:20:34.887069+00	cb9b72c0-8086-4360-9ca6-1e9269273c85
136	Ville	321	2025-03-11 13:23:15.607046+00	becd306d-4a72-4e4e-9a69-77a3357b8e7a
137	Ville	test100	2025-03-11 13:36:25.799714+00	1a936b00-0ac4-4073-b824-63f99d6cf614
138	Support	hej där	2025-03-11 13:37:27.725109+00	1a936b00-0ac4-4073-b824-63f99d6cf614
139	Support	1	2025-03-11 13:37:45.511101+00	1a936b00-0ac4-4073-b824-63f99d6cf614
140	Support	2	2025-03-11 13:37:58.805415+00	1a936b00-0ac4-4073-b824-63f99d6cf614
141	Support	3	2025-03-11 13:38:02.651214+00	1a936b00-0ac4-4073-b824-63f99d6cf614
142	Support	4	2025-03-11 13:43:11.629121+00	1a936b00-0ac4-4073-b824-63f99d6cf614
143	Support	5	2025-03-11 13:43:17.768383+00	1a936b00-0ac4-4073-b824-63f99d6cf614
144	Support	6	2025-03-11 13:44:47.65512+00	1a936b00-0ac4-4073-b824-63f99d6cf614
145	Shaban	test test test	2025-03-11 13:45:51.501656+00	77409ef6-b2a9-45a1-b71f-08c1c868597e
146	Support	Hej	2025-03-11 13:46:45.889375+00	77409ef6-b2a9-45a1-b71f-08c1c868597e
147	Ville	123	2025-03-11 14:01:40.027985+00	9cd1cdb3-5f55-4a4a-83e3-e2dcd94ab27f
148	Support	hejsan	2025-03-11 14:02:50.257945+00	9cd1cdb3-5f55-4a4a-83e3-e2dcd94ab27f
149	Ville	test1000	2025-03-11 14:26:55.115993+00	54b8124e-c3f2-4087-b668-949b24a2921d
150	Support	2	2025-03-11 14:27:17.368776+00	54b8124e-c3f2-4087-b668-949b24a2921d
151	Ville	321	2025-03-11 14:34:24.605894+00	5dd5d40f-dc41-493e-ac40-4263c47b91b1
152	Support	123	2025-03-11 14:34:39.670285+00	5dd5d40f-dc41-493e-ac40-4263c47b91b1
153	Support	1	2025-03-11 14:36:38.718478+00	5dd5d40f-dc41-493e-ac40-4263c47b91b1
154	Support	2	2025-03-11 14:36:38.932631+00	5dd5d40f-dc41-493e-ac40-4263c47b91b1
155	Shaban	test	2025-03-11 14:48:18.968432+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
156	Shaban	test1	2025-03-11 14:48:51.455131+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
157	Shaban	test3	2025-03-11 14:49:47.245931+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
158	villetest	test 4	2025-03-11 15:06:47.048202+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
159	villetest	test 6	2025-03-11 15:07:22.473899+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
160	villetest	test7	2025-03-11 15:07:55.953446+00	8d6317f1-6a63-49c7-a4f4-8472cba90f10
161	shabantest	test1	2025-03-11 15:08:31.901442+00	4b481480-f82a-47d3-a5f1-f65f022b1f77
162	villetest	test2	2025-03-11 15:08:47.922231+00	4b481480-f82a-47d3-a5f1-f65f022b1f77
163	villetest	test3	2025-03-11 15:08:49.379536+00	4b481480-f82a-47d3-a5f1-f65f022b1f77
164	villetest	test4	2025-03-11 15:08:50.697114+00	4b481480-f82a-47d3-a5f1-f65f022b1f77
165	villetest	test5	2025-03-11 15:09:47.481395+00	4b481480-f82a-47d3-a5f1-f65f022b1f77
166	shaban	test	2025-03-11 15:11:37.67317+00	27545849-b72b-4249-8a9e-ddedd9670209
167	shaban2	testtest	2025-03-11 15:14:36.276464+00	75090666-ff27-4ee7-9dfc-83f07371813d
168	shaban2	test2	2025-03-11 15:14:58.142414+00	75090666-ff27-4ee7-9dfc-83f07371813d
169	shaban2	test4	2025-03-11 15:15:12.397601+00	75090666-ff27-4ee7-9dfc-83f07371813d
170	villetest	test5	2025-03-11 15:15:34.995156+00	75090666-ff27-4ee7-9dfc-83f07371813d
171	villetest	test6	2025-03-11 15:15:51.71184+00	75090666-ff27-4ee7-9dfc-83f07371813d
172	shaban2	hej	2025-03-11 17:02:26.389685+00	75090666-ff27-4ee7-9dfc-83f07371813d
173	Shaban	test	2025-03-11 17:04:20.251729+00	a594a67a-6222-4370-bb37-b27cce77bab2
174	Shaban	test	2025-03-11 17:04:32.399663+00	a594a67a-6222-4370-bb37-b27cce77bab2
175	Shaban	test	2025-03-11 17:04:34.572717+00	a594a67a-6222-4370-bb37-b27cce77bab2
176	Shaban	test 3	2025-03-11 17:04:44.459956+00	a594a67a-6222-4370-bb37-b27cce77bab2
177	villetest	test4	2025-03-11 17:05:16.775747+00	a594a67a-6222-4370-bb37-b27cce77bab2
178	villetest	test5	2025-03-11 17:05:47.318569+00	a594a67a-6222-4370-bb37-b27cce77bab2
179	villetest	test 6	2025-03-11 17:05:56.666739+00	a594a67a-6222-4370-bb37-b27cce77bab2
180	testson	test	2025-03-11 17:07:49.931543+00	e1a1b422-817a-44b4-8431-d75957431a8f
181	testson	test 1	2025-03-11 17:08:03.293393+00	e1a1b422-817a-44b4-8431-d75957431a8f
182	testson	test 2	2025-03-11 17:08:04.553222+00	e1a1b422-817a-44b4-8431-d75957431a8f
183	testson	test 3	2025-03-11 17:08:05.747484+00	e1a1b422-817a-44b4-8431-d75957431a8f
184	villetest	test 4	2025-03-11 17:08:28.505424+00	e1a1b422-817a-44b4-8431-d75957431a8f
185	villetest	tett 5	2025-03-11 17:08:31.240882+00	e1a1b422-817a-44b4-8431-d75957431a8f
186	villetest	test 6	2025-03-11 17:08:32.912916+00	e1a1b422-817a-44b4-8431-d75957431a8f
187	testson	test 7	2025-03-11 17:09:08.050502+00	e1a1b422-817a-44b4-8431-d75957431a8f
188	testson	test 8	2025-03-11 17:09:10.33416+00	e1a1b422-817a-44b4-8431-d75957431a8f
189	testson	test 9	2025-03-11 17:09:14.622139+00	e1a1b422-817a-44b4-8431-d75957431a8f
190	test10	test	2025-03-11 17:19:33.28041+00	146e4e27-a58f-48a5-9ed3-854365675e4b
191	test10	test 2	2025-03-11 17:20:05.040987+00	146e4e27-a58f-48a5-9ed3-854365675e4b
192	test10	test 3	2025-03-11 17:20:06.464355+00	146e4e27-a58f-48a5-9ed3-854365675e4b
193	villetest	test 4	2025-03-11 17:20:47.12625+00	146e4e27-a58f-48a5-9ed3-854365675e4b
194	villetest	test 5	2025-03-11 17:20:50.208381+00	146e4e27-a58f-48a5-9ed3-854365675e4b
195	test10	test 6	2025-03-11 17:21:04.951786+00	146e4e27-a58f-48a5-9ed3-854365675e4b
196	test10	test 7	2025-03-11 17:21:06.840047+00	146e4e27-a58f-48a5-9ed3-854365675e4b
197	test10	test 8	2025-03-11 17:21:11.795983+00	146e4e27-a58f-48a5-9ed3-854365675e4b
198	villetest	test	2025-03-11 17:26:12.694188+00	146e4e27-a58f-48a5-9ed3-854365675e4b
199	villetest	test	2025-03-11 17:26:19.556342+00	146e4e27-a58f-48a5-9ed3-854365675e4b
200	Kevin	Funkar?	2025-03-12 07:52:49.505591+00	3091eeed-9f48-4585-abbd-93377b06fe05
201	KevinAdmin	Yes!	2025-03-12 07:53:14.215149+00	3091eeed-9f48-4585-abbd-93377b06fe05
202	KevinAdmin	Wohoo!	2025-03-12 07:54:07.922334+00	3091eeed-9f48-4585-abbd-93377b06fe05
203	Martin	inget uttag\n	2025-03-12 08:10:05.646993+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
204	Martin	jag hittar inte uttaget?	2025-03-12 08:11:12.166558+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
205	Martin	försöker koppla min mobil in i väggen... det går inte	2025-03-12 08:11:35.056313+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
206	villetest	TJENAAA	2025-03-12 08:12:10.090436+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
207	Martin	hallå!	2025-03-12 08:12:20.677812+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
208	Martin	det va en jävla tid det tog!	2025-03-12 08:12:28.632077+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
209	villetest	Hur är lägeeet o sååånt	2025-03-12 08:12:32.965632+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
210	Martin	hur löser vi detta då?	2025-03-12 08:12:36.385331+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
211	Martin	jojo.. det är bra	2025-03-12 08:12:44.53002+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
212	Martin	nu brinner min telefon..	2025-03-12 08:12:50.201528+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
213	Martin	HJÄÄÄÄÄÄÄÄLP	2025-03-12 08:12:57.658898+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
214	villetest	har du testat med att slänga den i sjön?	2025-03-12 08:13:01.196182+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
215	villetest	test	2025-03-12 08:15:34.484343+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
216	TEST	hej	2025-03-12 08:16:53.518126+00	6156a8ec-3098-4da3-ae93-22a3e28d3daa
217	Ville	fgh	2025-03-12 08:35:43.688462+00	dfe4d43e-19a8-4605-83e0-35294b79e31d
218	Ville	sdf	2025-03-12 08:51:14.293023+00	a2b3603d-a110-432d-ae24-21c1923f6a1a
219	Saban	test	2025-03-12 09:02:02.93447+00	17cf34e5-da9c-4418-ab54-6a6965055d77
220	TEST	what seems to be the problem officer?	2025-03-12 09:15:46.634426+00	17cf34e5-da9c-4418-ab54-6a6965055d77
221	Saban	fix my merge plz	2025-03-12 09:16:08.010487+00	17cf34e5-da9c-4418-ab54-6a6965055d77
222	TEST	I did	2025-03-12 09:16:14.241367+00	17cf34e5-da9c-4418-ab54-6a6965055d77
223	TEST	its ok now	2025-03-12 09:16:21.233257+00	17cf34e5-da9c-4418-ab54-6a6965055d77
224	Saban	yeaaaaaaah	2025-03-12 09:16:29.206022+00	17cf34e5-da9c-4418-ab54-6a6965055d77
225	TEST	🤩	2025-03-12 09:16:32.807444+00	17cf34e5-da9c-4418-ab54-6a6965055d77
226	TEST	🍆	2025-03-12 09:16:47.007541+00	17cf34e5-da9c-4418-ab54-6a6965055d77
227	Saban	🍑	2025-03-12 09:17:11.67094+00	17cf34e5-da9c-4418-ab54-6a6965055d77
228	TEST	👉	2025-03-12 09:17:36.558439+00	17cf34e5-da9c-4418-ab54-6a6965055d77
229	TEST	👌	2025-03-12 09:17:46.794602+00	17cf34e5-da9c-4418-ab54-6a6965055d77
230	TEST	👉👌	2025-03-12 09:17:58.007945+00	17cf34e5-da9c-4418-ab54-6a6965055d77
231	Saban	😲	2025-03-12 09:18:12.22946+00	17cf34e5-da9c-4418-ab54-6a6965055d77
232	Sebastian	test	2025-03-12 10:26:19.612936+00	4fcc165e-4092-448b-a18f-f615f53021f2
233	KevinAdmin	Din dator e redo för upphämtning. Haha skojja bara 😆	2025-03-12 13:00:12.363016+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
234	Ville	test	2025-03-12 13:03:02.950496+00	8f76fb7b-2027-4754-90ba-b6d5da1ce0b9
235	Admino5	🤢	2025-03-12 13:36:00.468723+00	8f18cf90-57c1-4e4c-bd85-370bc07428e1
236	Hampus	Min telefon är sönder	2025-03-12 14:06:29.40353+00	98f8b254-efb5-4260-9851-e29f461f141a
237	Hampus	Kan ni hjälpa mig?	2025-03-12 14:06:59.739052+00	98f8b254-efb5-4260-9851-e29f461f141a
238	villetest	Ge mig din faktura nummer?	2025-03-12 14:07:50.634521+00	98f8b254-efb5-4260-9851-e29f461f141a
239	villetest	0993214	2025-03-12 14:08:14.649909+00	98f8b254-efb5-4260-9851-e29f461f141a
240	Ville	hjk	2025-03-13 08:35:41.297643+00	e57a238a-3df1-40bb-be02-91e4914e460e
241	Ville	fd	2025-03-13 08:36:26.274553+00	e57a238a-3df1-40bb-be02-91e4914e460e
242	Ville	qwe	2025-03-13 09:14:15.632009+00	449e6de1-17ed-4dd4-a11e-5c0789eaa53e
243	villetest	d	2025-03-13 09:32:10.978781+00	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
244	Ville	test1	2025-03-13 10:38:30.820555+00	1e126622-8e2c-4bd4-a662-f3483ca8fb07
245	Ville	hejsan	2025-03-13 10:38:45.064093+00	1e126622-8e2c-4bd4-a662-f3483ca8fb07
246	Ville	1	2025-03-13 10:38:45.958306+00	1e126622-8e2c-4bd4-a662-f3483ca8fb07
247	Ville2	qwe321	2025-03-13 10:56:08.133724+00	62c481ab-04e3-4290-9455-81bb208c36fa
248	Ville2	ds	2025-03-13 10:56:27.841747+00	62c481ab-04e3-4290-9455-81bb208c36fa
249	Ville	ljk	2025-03-13 12:14:11.274572+00	89f99fed-04b9-4c2c-ae30-b181e7f0cf80
250	villetest	lk	2025-03-13 12:14:28.871229+00	89f99fed-04b9-4c2c-ae30-b181e7f0cf80
251	Ville	hejhej	2025-03-13 13:11:55.533611+00	be47881c-cd53-4e25-96dd-20cd223f2420
252	Test	test	2025-03-13 13:20:28.488193+00	f2bc2a55-18b3-499e-bdd5-f79e5e246115
253	test2	test	2025-03-13 13:20:53.078736+00	402b0388-fa1e-4c09-95ba-ebca8e53f43d
254	test3	test	2025-03-13 13:21:11.394601+00	652a398f-29b8-45aa-9253-8f8d00d9d31d
255	test4	test	2025-03-13 13:21:31.421709+00	cb5ffbee-c4d9-419b-a5fa-95d2fca72f49
256	villetest	hej	2025-03-13 13:31:17.400426+00	269a695d-2b24-4ce2-afab-8f6cb7b370fc
257	Ville	test100000	2025-03-13 13:32:11.459291+00	e4191a14-a25f-4a92-bdff-c29a3957c8c4
258	villetest	testigen	2025-03-13 13:32:39.00125+00	e4191a14-a25f-4a92-bdff-c29a3957c8c4
259	Villeapa	hjälp mig!!1	2025-03-13 13:35:17.453798+00	fd04e15b-eead-4468-a664-cfa94a07d445
260	villetest	Hej tjena	2025-03-13 13:35:57.952745+00	fd04e15b-eead-4468-a664-cfa94a07d445
261	villetest	hejsan	2025-03-13 13:36:09.401478+00	fd04e15b-eead-4468-a664-cfa94a07d445
262	villetest	123	2025-03-13 13:37:09.873454+00	fd04e15b-eead-4468-a664-cfa94a07d445
263	Ville100	321	2025-03-13 13:38:39.476047+00	9736d3bd-75b2-4d48-a940-14e439a633a3
264	villetest	hej hej hej	2025-03-13 13:39:19.743406+00	9736d3bd-75b2-4d48-a940-14e439a633a3
265	Ville100	hejsan	2025-03-13 13:39:25.251296+00	9736d3bd-75b2-4d48-a940-14e439a633a3
266	villetest	123234	2025-03-13 13:39:44.799269+00	9736d3bd-75b2-4d48-a940-14e439a633a3
267	Ville100	56789	2025-03-13 13:39:50.882386+00	9736d3bd-75b2-4d48-a940-14e439a633a3
268	Ville100	1	2025-03-13 13:40:02.528347+00	9736d3bd-75b2-4d48-a940-14e439a633a3
269	Ville100	🫠	2025-03-13 13:40:19.29096+00	9736d3bd-75b2-4d48-a940-14e439a633a3
270	Ville100	🫵💩	2025-03-13 13:40:53.580908+00	9736d3bd-75b2-4d48-a940-14e439a633a3
271	testing	123	2025-03-13 14:07:19.675215+00	4578ad10-3f90-45e5-83be-e6dab9468710
272	testing	321	2025-03-13 14:23:21.867761+00	fe177498-183d-4391-9c80-c62e9afeffdf
273	Admino	hjälp	2025-03-13 14:28:28.165661+00	04e093b4-9721-480d-b68b-c877a9034a36
274	test	test inital message	2025-03-14 08:47:57.437214+00	94046ae9-1cdf-4ad2-9284-0185d528a025
275	test2	test inital messeage	2025-03-14 08:51:01.635269+00	e477a435-fef1-44cd-a693-b8849f368993
276	testchat.jsx	test chat.jsx	2025-03-14 12:31:11.200837+00	a0be9179-3fd7-4a3c-a51f-11317e7669cc
277	testchat	test chat	2025-03-14 12:33:17.171427+00	73a321dd-e9e8-4733-a863-6ce1c893224c
278	TEST	hej	2025-03-14 12:33:48.852011+00	73a321dd-e9e8-4733-a863-6ce1c893224c
279	testchat	TEST	2025-03-14 12:34:01.197429+00	73a321dd-e9e8-4733-a863-6ce1c893224c
280	TEST	hej igen	2025-03-14 12:34:23.638592+00	73a321dd-e9e8-4733-a863-6ce1c893224c
281	testchat	HEJ HEJ HEJ	2025-03-14 12:34:33.958513+00	73a321dd-e9e8-4733-a863-6ce1c893224c
282	TEST	ta bort chat.jsx	2025-03-14 12:34:53.35509+00	73a321dd-e9e8-4733-a863-6ce1c893224c
283	test utan chat.jsx	test utan chat	2025-03-14 12:55:10.743541+00	1cbf2368-d879-413f-aed4-286955f8a03e
284	villetest	hejsan	2025-03-14 12:55:28.67652+00	1cbf2368-d879-413f-aed4-286955f8a03e
285	test utan chat.jsx	hej hej hej	2025-03-14 12:55:36.270532+00	1cbf2368-d879-413f-aed4-286955f8a03e
286	villetest	🫵💩	2025-03-14 12:55:45.036282+00	1cbf2368-d879-413f-aed4-286955f8a03e
287	test utan chat.jsx	sista test	2025-03-14 12:55:55.52814+00	1cbf2368-d879-413f-aed4-286955f8a03e
288	Kevin	asas	2025-03-14 13:11:06.683747+00	7dddc3ba-b548-44f0-84a9-e9f1ba585651
289	Admino	hej	2025-03-14 14:42:17.769007+00	04e093b4-9721-480d-b68b-c877a9034a36
290	KevinAdmin	hej	2025-03-14 14:42:40.921315+00	af993dea-60f8-44a6-b00f-995a459c83b3
291	villetest	hejsan	2025-03-14 14:45:10.817331+00	269a695d-2b24-4ce2-afab-8f6cb7b370fc
292	last check	last last	2025-03-14 14:46:56.030782+00	ec93425e-6d66-4623-bda0-6ef7f947822f
293	villetest	godafton	2025-03-14 14:47:21.151817+00	ec93425e-6d66-4623-bda0-6ef7f947822f
294	last check	faaaaan	2025-03-14 14:48:04.125489+00	ec93425e-6d66-4623-bda0-6ef7f947822f
295	villetest	🫵🐭	2025-03-14 14:48:15.979321+00	ec93425e-6d66-4623-bda0-6ef7f947822f
296	lastlast	test test test	2025-03-14 14:49:59.646171+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
297	last check	hej igen	2025-03-14 14:50:22.257361+00	ec93425e-6d66-4623-bda0-6ef7f947822f
298	villetest	hej igen	2025-03-14 14:51:11.490893+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
299	villetest	2	2025-03-14 14:51:34.654387+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
300	villetest	3	2025-03-14 14:51:40.711192+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
301	lastlast	hej hej hej	2025-03-14 14:52:39.80432+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
302	villetest	e	2025-03-14 14:53:05.825643+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
303	villetest	hej kevin	2025-03-14 14:53:47.335687+00	7dddc3ba-b548-44f0-84a9-e9f1ba585651
304	Oskar	hej 	2025-03-14 14:56:11.810157+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
305	Ville	hej	2025-03-14 14:56:37.670398+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
306	Oskar	1	2025-03-14 14:56:54.394989+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
307	Ville	2	2025-03-14 14:57:04.512954+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
308	Oskar	3	2025-03-14 14:57:09.270276+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
309	Ville	4	2025-03-14 14:57:20.477901+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
310	Ville	hej	2025-03-14 14:57:39.030332+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
311	lastlast	test	2025-03-14 14:58:11.272741+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
312	Ville	2	2025-03-14 14:58:16.958029+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
313	KevinSuper	hej	2025-03-14 15:05:52.203323+00	fe177498-183d-4391-9c80-c62e9afeffdf
314	Ville	1	2025-03-14 15:16:32.214793+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
315	Ville	3	2025-03-14 15:16:48.359171+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
316	Ville	4	2025-03-14 15:16:50.444097+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
317	Ville	5	2025-03-14 15:16:50.881977+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
318	Ville	6	2025-03-14 15:16:51.152103+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
319	Ville	k	2025-03-14 15:17:04.309716+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
320	Ville	j	2025-03-14 15:17:10.021982+00	735c801f-73bd-4f8d-9fbc-7be5df2603e8
321	Oskar	supaabase	2025-03-14 15:17:26.337361+00	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
1292	Ville	Hej	2025-04-16 12:48:50.876508+00	abc123
328	Ville	123	2025-03-17 09:40:26.646817+00	764c78db-de5f-40c9-8e62-53a472e5373a
329	Ville	hej	2025-03-17 09:41:08.013859+00	764c78db-de5f-40c9-8e62-53a472e5373a
330	Ville	wh	2025-03-17 09:41:29.09573+00	764c78db-de5f-40c9-8e62-53a472e5373a
331	Ville	fkfk	2025-03-17 09:41:34.046097+00	764c78db-de5f-40c9-8e62-53a472e5373a
332	Shaban	test	2025-03-17 09:41:59.911811+00	c53f9af1-59ef-4446-b92f-ab2f69ab799c
333	Ville	test	2025-03-17 09:43:09.04997+00	c53f9af1-59ef-4446-b92f-ab2f69ab799c
334	Shaban	hej d	2025-03-17 09:43:16.080045+00	c53f9af1-59ef-4446-b92f-ab2f69ab799c
335	Ville	test2	2025-03-17 09:43:29.538884+00	c53f9af1-59ef-4446-b92f-ab2f69ab799c
336	Shaban	hej hej hej	2025-03-17 09:43:38.416201+00	c53f9af1-59ef-4446-b92f-ab2f69ab799c
337	Oskar	test	2025-03-17 10:09:40.573162+00	093c334e-2973-4218-b663-40689b07452e
338	Kalle	hjälp mig!!	2025-03-17 10:20:56.63672+00	126897f3-92e7-410f-b04c-114f70ca6bc9
339	Ville	Vad vill du ha hjälp med?	2025-03-17 10:22:51.448835+00	126897f3-92e7-410f-b04c-114f70ca6bc9
340	Ville	jhg😀	2025-03-18 10:33:31.025046+00	764c78db-de5f-40c9-8e62-53a472e5373a
341	Pontus	Min faktura är för dyr	2025-03-18 13:35:52.89517+00	b93c9d1f-8043-4541-92e0-f01f64436928
342	Ville	Hej pontus vilken faktura gäller det?	2025-03-18 13:37:41.409101+00	b93c9d1f-8043-4541-92e0-f01f64436928
343	Putte	Hej min faktura är för dyr	2025-03-24 19:20:51.359099+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
344	Ville	Hej Putte , kan du ge mig din faktura nummer	2025-03-24 19:22:34.829522+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
345	Putte	Hej Ville , mitt faktura nummer är 4155	2025-03-24 19:22:58.124515+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
346	Ville	Okej har löst det	2025-03-24 19:23:10.893277+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
347	Martin	Tejena	2025-04-03 13:49:05.530155+00	
348	Putte	Tjena tjena	2025-04-03 14:02:55.328971+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
349	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 08:30:52.877901+00	83aa8278-897a-4e9d-ae37-d2bc824130b5
350	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 08:31:03.2023+00	732038c4-7238-465b-8519-ef108df59080
351	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 08:31:09.766236+00	9a97700f-86e0-42db-b81f-696069b81f91
352	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:39:39.077465+00	e704bd17-941b-4560-a8e4-f6146f91b28c
353	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:39:50.365101+00	9d858bed-d66f-498a-9dc8-106fdee169da
354	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:39:56.461446+00	48f781c8-9522-45d3-b595-db21ac86ceb8
355	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:46:15.870457+00	abf231a6-326a-4664-9531-8bce471973b2
356	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:46:26.447453+00	8f9ba308-0e77-4d5e-970b-07422ace6946
357	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:46:32.180228+00	4fd6aea6-a808-485e-aa39-a44eeb816b7f
358	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:48:19.237983+00	b612a8ab-43be-45ad-89a3-05f1673810dd
359	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:48:29.1923+00	f924af61-ded1-40d0-909c-8db14d680842
360	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:48:37.612535+00	1692f76f-d7f8-4aaa-bebf-0e14e2764557
361	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:54:24.062139+00	403681da-e3b4-482c-884e-a26147f2ff96
362	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:54:36.695774+00	fa9c7493-7171-4ef7-9d48-cfdb01b357a5
363	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 20:54:44.827413+00	a5c9a8b4-d9fe-4990-8bcb-96d69ae93380
364	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:07:06.766112+00	74ecc0e5-e8b2-41e5-8815-ff9a2d6aed5c
365	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:07:14.517366+00	4e913ca0-0c55-4b1e-bd47-e2a56fbdcbfb
366	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:07:20.58267+00	7bd90d73-84c9-45e7-ad8c-777ad1981fb8
367	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:10:48.6669+00	d83e7323-5e4c-479d-bd6e-9ff4391a1cbe
368	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:10:54.906135+00	f58866fb-d7d9-469c-baf6-759552c0ad97
369	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 21:11:02.773225+00	ca6e1315-ecd5-4d6b-acf7-f20dd4dbfeaa
370	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:08.901329+00	7f371c84-951c-4d61-890f-2f8433ee7d91
371	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:20.259053+00	b35efc1c-f756-4aad-904a-f49867674c8f
372	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:27.054219+00	d746f089-c5aa-4cb0-9585-2783dc852a88
373	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:27:37.503845+00	258058f9-abb9-4e17-8b95-01549b29a088
374	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:27:47.683319+00	49abd3cb-0481-4adc-87a0-96ba3afbcf41
375	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:27:53.377642+00	c8f213c6-5ebb-401e-b307-c5268b1c3fe9
376	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:29:30.178527+00	48bc5380-3657-4c90-a33a-e93f88d2a351
377	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:43:03.698546+00	1a316d7b-8421-400b-8dfd-70707657c0b4
378	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:43:16.243301+00	345936b7-368d-4ecc-8780-1da1522b7b2e
379	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:43:21.894812+00	a4256dde-d989-4340-a8bc-c74822fe6130
380	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:55:39.864092+00	a7703890-ec75-4c7f-b349-e866ee653565
381	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:55:51.042389+00	d8cdd1bf-82d4-42ad-80fe-8502b93c3faf
382	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:55:59.323113+00	6f7b8da6-3460-4389-a6e0-518eb524e355
383	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:58:08.088544+00	34a802e3-b63a-4b28-8cc9-cb9f8519983b
384	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:58:17.611266+00	411b0fdc-729f-4cc1-a4d6-fce63213f4e1
385	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:58:22.945213+00	454f4780-b2e2-4f21-8582-d9a2e6b5b09a
386	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:11:44.560046+00	47cff9dd-d2e2-43f6-b7c6-d49a05a0c53d
1121	Martin	Tjena tjena	2025-04-15 09:05:28.27174+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
387	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:11:56.026668+00	4abcb647-2001-4e8b-ac8f-235d7e0bc1c5
388	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:12:01.176466+00	e9d78982-b97e-4b10-967f-319e646f3eb6
389	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:24:38.14248+00	3906e146-7d23-40e6-a9de-458ce5c09a8f
390	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:24:48.394336+00	55f143d3-fcdd-4287-a0b7-8c938a519681
391	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:24:54.041446+00	a144f288-90cc-4239-85cc-0fe6f9a30b5c
392	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:32:30.833963+00	db450373-20f3-4d2f-b6ce-3f7e168d6553
393	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:32:40.483316+00	57164468-4c45-4a89-8cc4-d40a892f393a
394	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:32:47.085156+00	e444d31b-30fe-4703-96a3-07f04b61b2ac
395	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:38:07.047096+00	0ec12ad7-ad21-4073-89d3-5ee4acc051d4
396	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:38:18.224035+00	eed9eba9-0a3f-4989-9cfc-9c40447d6402
397	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:38:24.956877+00	63a6de7e-5824-4d06-a69a-9f6e4c75b82f
398	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:42:11.865088+00	9c9ac440-ad0b-44a9-a4f0-a9e64b995669
399	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:42:21.858926+00	7c66481e-3ba7-4c08-a74d-1ef204667093
400	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 00:42:27.54959+00	44152e81-3afa-4cef-b7c3-3b0b7a1a757c
401	Ville	Hej	2025-04-07 07:04:21.068521+00	abc123
402	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:21:06.19594+00	1c870de7-d3c4-48a9-b6c2-621b5e95c5bc
403	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:22:32.875531+00	e910419e-961d-460f-ae76-311051e0c94a
404	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:23:25.029323+00	869fcd64-7ed9-46fa-ae17-435b7395706d
405	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:24:13.463372+00	b48f594e-6bb7-42a0-be4f-663ca2269a39
406	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:24:39.237714+00	a611bb74-5a8d-4e13-b20b-a942d4f0a790
407	Löken	inget fungerar.	2025-04-07 08:30:23.509119+00	162979b2-a9ff-4756-a630-49a67aae4a18
408	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:31:34.034389+00	75a2e98c-cfcb-4e53-b6d3-c0305626cb4b
409	Löken	hjälp mig	2025-04-07 08:34:19.304266+00	cb001359-6042-4c6c-bb58-2cd4a4e939b6
410	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 08:49:19.845247+00	f2f6e662-133b-40f6-8fe7-16b7c285ffca
411	Löken	inget fungerar.	2025-04-07 09:39:28.434902+00	f44a26e8-118c-47d3-a31c-9790ef3ae766
412	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 09:57:09.68085+00	59ab7dbf-86ba-4f01-9c75-c8f079616aa0
413	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 09:57:23.127798+00	a186a64a-0119-478b-9f62-8a877a02021b
414	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 09:57:30.463886+00	124b2899-d539-47a6-bc33-9f273ac82c21
415	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:06:26.970292+00	f45a837e-0417-44f9-a4c6-5b2a73c56ab2
416	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:06:38.619671+00	bede35f2-abc1-4ab6-be99-9fd8eef4a092
417	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:06:45.136775+00	2a90ee55-09f6-4285-b9f1-5e410bdf7856
418	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:07:23.077492+00	853fdf23-a8fb-4e33-92bf-c85ee0c0dee0
419	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:07:34.365027+00	f1a4999b-bd0c-4434-8f75-c5ed8c0c2958
420	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:07:41.081518+00	301d59a9-6ae8-4b77-8fe2-76bd94a75840
421	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:50:17.585236+00	9525c3d5-51c4-4464-a9df-90eaab676fbc
422	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:50:34.714116+00	24788fb7-3b58-4253-acbf-ce1e7521b870
423	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 10:50:43.620187+00	18d87b72-b9a2-4b03-a576-55c714877da2
424	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:07:22.833712+00	3d036f69-7e59-432c-b278-a26a971b885d
425	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:07:37.472407+00	fccc7f71-76a2-45d7-9f5b-31bf1fb01ee8
426	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:07:44.715542+00	64b2fdce-f047-433d-86c5-c53a1f9ec430
427	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:09:41.352674+00	e2893f39-9ef7-45b3-a005-6ca927dc6037
428	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:09:54.017135+00	0016109b-b0a7-48a1-8263-0dc08fe80b05
429	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:10:00.377901+00	771e1415-fbb6-446e-ae75-2a6f2ff470a6
430	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:16:16.656164+00	17aee66e-9ad1-4a7e-a9da-8770f68583d4
431	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:16:29.760917+00	68472100-e45a-4b2b-bda5-25ff47668297
432	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:16:37.109721+00	70b60853-d9b6-4a67-8497-71d04bf21a91
433	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:22:08.639067+00	c5c1c55d-98bf-4695-a3d6-113cbb671044
1296	Ville	Hej	2025-04-16 12:48:56.104576+00	abc123
434	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:22:16.008185+00	ff1fd07c-d783-4383-b628-3e2bd29924b0
435	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:43:22.225453+00	461d6488-2e95-4859-ab9c-cb47c6b5d0a8
436	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:43:31.224401+00	4ca3d7c4-294a-401a-a2ad-868027e0b1b7
437	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:43:36.793347+00	b324f4be-3d4f-4ce1-9f96-ab36f4ea1f3d
438	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:52:07.53454+00	af35aead-a759-45f7-b5dd-30f8f4d3b80e
439	John Doe	Hej, jag har en fråga om min beställning.	2025-04-07 12:36:58.433738+00	04d0792f-b2f4-43e3-a5bb-7296b66f793f
440	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:21:26.450312+00	270965de-1b9a-4c09-a7a1-4a34d078697a
441	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:21:40.772488+00	0e2b0dcd-b05c-40d0-9b87-6aceb18e2414
442	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:21:48.01088+00	2f4ff827-90e6-4ebf-8593-2e0486cf0933
443	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:34:39.41387+00	8d1f2d78-c400-438f-8491-3aabf0fe2d2e
444	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:34:55.65753+00	8ff5bd33-3083-4c7a-8b9b-016a7cae7dc7
445	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:35:04.168483+00	ba648216-b8e3-4478-a827-df7ed2d51093
446	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:41:18.447664+00	08450420-21c2-4334-94a8-e72cdc03ea63
447	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:41:27.841803+00	f59d7443-37ca-45cf-8012-2250fbfa1bc5
448	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:41:34.14127+00	1ee9bf5e-bdf6-4813-932f-1f9fffa8a1e5
449	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:41:59.991435+00	995b1222-98fa-486f-9b05-f70436dc0b2d
450	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:42:09.190676+00	16bc12c0-5e7a-4613-96a0-d2fc1e8e4364
451	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:42:15.280065+00	2c399e98-1142-436e-a002-d8ee50f4b268
452	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:47:20.894275+00	558397e8-e435-4fa1-adcc-dc5c6c92e5df
453	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:47:33.830117+00	c33ee079-7650-4320-9ed9-d086b7676edd
454	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:47:40.963935+00	fbd8cafd-de55-465e-8539-5f168c13e951
455	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:52:24.291661+00	287c20af-a17b-4764-8f7e-b1010bc0c89c
456	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:52:35.780365+00	73e756c7-be34-481a-988d-ed112b835bac
457	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:52:42.267287+00	2b8150cd-7c62-4e7d-9047-967b58c6d335
458	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:55:40.131273+00	8cd4886d-bb04-426c-bd31-faba1f86e60a
459	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:55:51.875807+00	10a660e6-205b-4459-8fb6-a073a8ca09ac
460	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 14:55:58.216298+00	226f6c21-5093-43c8-b51a-81a62935be37
461	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:02:35.522223+00	b5b0b469-b33c-4d7f-aa1e-6498a67c2998
462	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:02:49.107903+00	df0befb8-bf6a-4c38-ba0a-d41e61672761
463	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:02:57.216374+00	42c05906-da90-4e70-9043-345692187b72
464	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:11:11.022446+00	7a56d9cf-2e2b-450f-b07f-ff6d6cf159b8
465	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:11:23.170842+00	acffe46f-01fb-46b1-b36f-cac678d216df
466	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:11:30.553892+00	39420a89-2106-47a2-85da-f346366b4f9a
467	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:17:52.651277+00	61569cc3-9257-4dd3-8627-83e07180ee0e
468	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:18:06.287221+00	fbbed657-05d9-4597-9cc0-4326beba03c5
469	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:18:20.380817+00	ccaf59ee-0a19-4177-8576-e42feb943b94
470	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:21:51.837757+00	7e5436c0-8841-4903-a057-b9d74438d812
471	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:22:03.813368+00	6b5744d9-c4d9-4190-b3a0-42d510c49ad3
472	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:22:11.331868+00	585d8457-53b1-4393-b38f-3fc978e5c9e9
473	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:35:56.84292+00	f3fad663-7a3e-4355-b5e1-8f9cb8400130
474	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:36:09.129057+00	1cd6abb5-642a-4f64-a005-e816bd1e15bc
475	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:36:15.69698+00	227191f9-63d9-4ed4-b9fe-930a08f2b3d6
476	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:45:53.520505+00	6fc38d52-61e2-421f-ac07-4e15488de57f
764	Ville	Jag behöver hjälp nu.	2025-04-11 13:30:06.3161+00	62357806-1ea6-4893-ab3c-6d948e2f69a3
477	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:46:08.364243+00	74af9cbb-6168-4e4a-8945-9286a0647e4d
478	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:46:23.37923+00	b076ce81-7307-4da2-adec-ed1fddef0ceb
479	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:51:09.486517+00	2eb2eb84-6f65-4f67-a1cd-99d06f9ffa9f
480	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:51:22.577692+00	b2049186-d1ef-4b8e-96a1-b895391db0bf
481	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:51:32.427232+00	5e00f611-51d0-45a8-a90b-63ead565677c
482	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:56:19.113496+00	949ff994-93e9-4c46-98b8-667f7df59306
483	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:56:32.494789+00	1f4608fb-b9e1-4d91-b14f-2401e702d42d
484	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 15:56:42.196867+00	2b0998dc-cac5-4d86-b1db-7f61c378e6c2
485	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:09:36.079474+00	13d7af85-3ef6-45f7-93e6-6799094648d5
486	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:09:49.330645+00	1eacb40f-7c94-459a-ab1a-a7d429b3c8fa
487	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:09:56.782169+00	f2a11e61-4b2b-43c2-a8aa-77135728094d
488	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:10:47.581436+00	5809d7e4-802c-41d2-947c-dc01367218a3
489	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:10:59.876875+00	215dbee8-2b14-4732-9933-60c5db2e59d0
490	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:11:07.010926+00	ef99b72c-de78-4b3f-aaa4-05ec719633d0
491	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:15:25.315672+00	042a6496-c66a-4121-b61c-852ba62c8f65
492	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:15:39.466676+00	9ad2782c-85c3-4c5b-bfdc-bdb0c6227dd4
493	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:15:48.28282+00	857937ff-0004-4b1a-95cf-787c8ab7fce9
494	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:16:44.889315+00	d4c45255-ef65-42cc-9cd5-a3fe85ef0aab
495	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:16:57.864471+00	982f0026-d9c1-4ed5-83b1-2aeba4048df1
496	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:29:11.419178+00	e6b5e924-3fe5-47c6-8afb-935f566060d9
497	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:08.914329+00	a152c114-e060-41f4-baf2-c836f29bae8b
498	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:16.198642+00	865a34a4-7fb9-4992-9e23-acd3a88dcc01
499	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:21.046681+00	de12b8aa-9dac-4797-b650-30cfac46cf9f
500	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:38:07.364588+00	26d3a624-2064-455f-9c9a-5ee11220f030
501	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:38:16.652479+00	8927d432-16db-45e2-981b-07adb2106f29
502	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:38:22.270132+00	1d7b2e85-451e-4051-97d1-bcfc1cdc2756
503	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:43:32.551412+00	d79c00e6-796e-496d-a773-1a1b65d6850f
504	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:43:38.905721+00	96224af7-7ddc-462e-be1b-1858b511d628
505	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:43:43.940726+00	8e92d748-ccbe-4b4b-976e-17ce25a0674b
506	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:44:28.211672+00	5defbf27-29c5-4956-abbb-30e16c488591
507	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:44:34.469431+00	2d4ad722-800e-4233-8fc8-736500c6191e
508	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:44:38.742689+00	c0ca282d-cbcb-4f31-8d82-64c2b83f9663
509	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:11:49.567314+00	ebe6fa8f-c397-4f0e-8ccb-e64cd35419cf
510	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:11:56.404993+00	62989950-5937-48ae-9f2d-61391f549040
511	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:12:00.620675+00	8df38a04-1830-4564-96c6-fbfdf0563a21
512	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:14:22.301937+00	39e9e0d6-8607-4938-b26e-0d1804bc8da1
513	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:14:29.815536+00	2ebfcba3-e4db-41ea-9310-71042424479c
514	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:14:34.031691+00	82c92e3e-e740-48c3-a570-3373bb63f2d8
515	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:16:26.395933+00	ccea9553-06ec-4a81-8f11-2108c92f6ff9
516	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:16:33.777926+00	db458145-aae5-4aac-a91e-3c5fa12d2145
517	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:16:38.262987+00	5de6f5e5-7e0c-49b8-9f08-bab3361368fc
518	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:29:26.267649+00	f405b0c7-0ab1-4d2e-b428-3207fa7ae2da
519	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:29:35.129762+00	cd73806a-a158-4510-b86c-9df8b1607ceb
1406	ville	Hej	2025-04-17 10:13:49.595632+00	abc123
520	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:29:40.148504+00	34a14dd1-e74b-447b-a20a-7fccb561c80a
521	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:35:27.663914+00	3e753a56-f719-48fc-ada1-69b13dc2be63
522	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:35:35.876331+00	1bf5268a-b6f6-42ae-9e0d-7401e13dc86b
523	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:35:41.183095+00	0a217d1d-8f76-41eb-9eac-118cd822c50f
524	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:37:02.896546+00	f2e253ba-bda4-4542-94b5-10ad94cce98f
525	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:37:12.132629+00	749bd642-2d42-4676-a003-c1c1acda7e30
526	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:37:17.881114+00	0e00fcae-3500-4e41-832b-22856e93f3a0
527	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:38:27.952269+00	9cefdeed-6f27-4aff-a28f-7da9ceb86869
528	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:38:36.642417+00	b10483fc-04a1-4ce0-93a4-7e598caac020
529	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:38:40.842455+00	0e53794b-28aa-4f4f-b05b-fafff5efab2e
530	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:42:24.578575+00	0d28c7d6-02c8-4049-9877-1817d239312e
531	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:42:31.971067+00	f00f1105-a656-410d-8631-9c405e3ecd37
532	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:42:36.320618+00	f4c93a08-c061-4ab2-a41a-2274fb23031e
533	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:46:27.276237+00	f8c20aeb-c891-47d2-89e0-70420c48a1b4
534	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:46:34.020605+00	367f92d9-9277-4287-af52-08038ee0a5fb
535	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:46:39.940639+00	e4821600-bc28-4be1-8739-4ad227afa1e5
536	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:55:33.844418+00	987e1d6c-3fef-48c0-b477-27a9607628b6
537	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:55:46.364907+00	96aaf00b-21f0-49a4-b9f6-8789f82d3046
538	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 19:55:52.083744+00	82b24062-1391-4efd-9852-bf23ef64775e
539	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:02:43.52658+00	5ce2cf0b-53a0-46d0-9a19-b6ea00d22e05
540	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:02:53.731017+00	3aa78d66-c516-4f4b-b394-792364063bb5
541	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:03:00.176273+00	de037df6-cca8-432f-9ef4-78349f850355
542	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:07:08.562199+00	e7bc95a9-74d3-486f-8505-1fcc24131580
543	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:07:22.295805+00	7215df27-cc55-4cc1-9eb6-dc0eea9b76b4
544	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:07:36.677931+00	49db9673-6e8c-4e19-8c84-8b839daf100d
545	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:16:36.091654+00	d34e8266-b57d-47fd-934a-fe63813294cf
546	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:16:55.097294+00	a981b7fc-8fb7-4a44-a94a-5c1b9ca239f0
547	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:17:05.47052+00	ae1070ba-0139-4992-8910-ec2dd1bb63e2
548	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:19:38.314452+00	c4ba1f51-915b-4d47-a590-b63bcea94946
549	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:19:51.497929+00	fdaa042d-707e-438a-920c-63f8e06d5895
550	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:19:58.592597+00	c55394d1-983b-4c95-b4e8-6847fe087e6e
551	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:31:25.308083+00	caeffaa9-28c9-464c-b281-fa76c6b5e25b
552	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:31:40.130467+00	1850ac06-fd04-4a5d-8337-76be6f0648ef
553	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:31:47.355326+00	6277102d-3db4-4929-bdfc-7df2d7bab9e7
554	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:37:37.598803+00	06f649c1-7df7-48de-9758-35e8f4263c28
555	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:37:50.739012+00	0f8fa7a8-277b-44e6-8c41-5a525a252a15
556	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:38:01.516332+00	97d0ad59-c581-46bc-9b7a-06b6500c3e3c
557	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:44:44.599433+00	352ab12e-ee5c-4f53-9d5f-01682413688d
558	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:44:58.845647+00	acf856bd-8dd9-4960-864d-bbc95975540b
559	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:45:11.089904+00	3950e967-20b2-4aa7-9f96-8f1e97763fb4
560	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:48:41.672928+00	8066ee2b-c9fb-460d-9b68-15c2dbc33671
561	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:51:49.126819+00	5371fa27-0db1-45ec-aad9-34ab221f528f
562	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:52:04.994769+00	bb8b7123-4cc0-419c-93dd-3b7e42584a99
563	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:52:13.165568+00	a2b9482d-85e9-4e36-9514-65ed6fcc7765
564	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:07:21.259485+00	b0da324b-ed7e-4fc9-ac93-51d8d2dde4d8
565	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:07:36.725235+00	b510a0e7-35cd-48e1-b83d-a6cfbc2d8948
566	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:07:43.494025+00	dcd24067-9281-4802-96f0-e0e4390a6ea2
567	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:13:06.986825+00	49edb2ce-2139-4f90-802f-e97271d62119
568	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:13:18.656004+00	a43b76f8-9769-447a-aac3-402b7403ae2d
569	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:13:25.630821+00	9fe7f6e6-8604-4bab-b66c-9474715494da
570	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:17:27.550708+00	709248b6-f063-4920-b0bb-4ebf7bf1359b
571	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:17:39.50234+00	4155f9e3-fea0-4856-b7e8-12ee9fee6df8
572	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:23:21.959118+00	76761119-fd08-492b-8ad4-3c0badaf3f4c
573	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:23:35.949013+00	5a766125-2527-4a85-937d-872f6457b76c
574	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:23:42.648414+00	09e639d4-9d07-452d-8388-7eefba507eb3
575	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:28:14.199977+00	010ae747-05a4-4125-8040-bdcb37e0eadd
576	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:28:27.488568+00	3fada5ab-12f7-4e1b-82a3-a9cfc1685adb
577	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:28:41.863398+00	8631cc61-6ff5-4283-80df-ebfb24417d13
578	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:31:53.64162+00	dc15016b-37f0-482e-a568-f20746cd93af
579	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:32:03.36801+00	31bb6ef5-794f-4528-be8c-cb85062cacfe
580	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:32:08.860324+00	5c397c7e-efbf-4f88-b35e-07ac5e0e234d
581	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:43:18.705039+00	82365dbd-bef0-458d-8cd1-4b8c43fbada3
582	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:43:34.943578+00	4e084e23-d04c-42b2-8f9f-345232ab4c71
583	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:43:43.158902+00	825b896e-80e4-4e01-86ff-3469992a2e4e
584	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:25.420818+00	33fe2f5d-1b7a-4988-9f21-c71d684c9904
585	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:35.754151+00	27337888-6229-4ee4-9c5d-d7722f14e044
586	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:41.148289+00	6b5ee55e-9fab-4fdb-a55a-61e74595ab09
587	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:47:54.810133+00	6258e691-e621-4376-a51b-6b205c7ca5d3
588	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:48:04.864224+00	b820254b-0cb1-4ea2-be47-dea9b506b0ea
589	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:48:10.47891+00	2a1a1bca-6ae6-491a-9bb0-a2007959943e
590	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:50:58.713145+00	b39407eb-775e-49ce-917c-2727ba8c3188
591	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:51:10.742563+00	dd639829-9b82-4c0c-a5b5-3d45bc2060cf
592	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:51:17.423646+00	2ab1e161-f14c-43e5-b0e6-67f958292ac0
593	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:53:43.454113+00	eb13e6b3-c80d-471e-ac92-43cfab5fc3c0
594	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:53:54.13474+00	edce9f58-5622-4302-85ed-2dd9981a68b4
595	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:54:00.619931+00	3c2a3c61-0b9c-4bd9-9b0a-28095323a790
596	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 06:50:39.071087+00	73093e76-2993-412e-a5d6-d583e29faeb0
597	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 07:23:03.103203+00	cceb13a2-3efc-40b3-a5c3-e33dc781ba08
598	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 07:34:02.614867+00	b10af301-81f7-416b-b667-66a25dd85e6d
599	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 09:37:18.358263+00	c911b916-4b91-48c5-8c8f-ff791bdfa9c1
600	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 09:44:09.037606+00	4506b0b0-cb05-4388-a6d8-67eb7d73304c
601	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 09:56:30.068985+00	82e30286-c636-4807-86d7-bba5c4240bd8
602	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 10:34:08.747715+00	f970614f-9ee6-4363-98c2-625389595a8d
603	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 10:39:32.69432+00	6995cf30-8383-46f4-875b-590442b4671c
604	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 10:42:30.095542+00	1c47f838-b082-40fe-9b95-717636a26719
605	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 10:47:54.242835+00	8c074bb2-5b26-4dc2-8bbd-8360e12c15d6
606	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 10:50:45.533813+00	eb79638e-1fef-4f79-b44e-01d12fd26142
607	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:21:57.682842+00	c32c258e-64b4-4a04-914c-6a5d36dd06cd
608	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:22:12.105067+00	8e6802a8-e6b6-4c91-a4fd-fd3df208e126
609	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:22:21.330915+00	cba5b6e0-ea7c-4467-87c5-34f12bd26acf
610	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:25:28.082014+00	01d92aa0-6885-4459-8ba7-3ed8591fe685
611	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:25:41.15241+00	1bfdb2f2-fc6c-4ec3-80a3-0d38128f574a
612	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:25:48.274361+00	a4b8a483-816b-4aef-bdf3-ec3946044df7
613	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:27:02.721075+00	daf5a76f-4d7d-4c67-a29a-1a1515316a9e
614	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:27:15.700552+00	07d5abb3-bfae-4e2f-9ef1-40093c400e5c
615	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:27:25.111004+00	2a6106f5-2554-47c1-9011-37a9f91e512e
616	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:58:49.90888+00	9c1c5807-3009-46d0-818a-9b532040e85a
617	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:59:10.084148+00	becc3233-2b37-4af3-b883-1d1c4ec2e00b
618	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 11:59:19.501262+00	fdeecd83-21f1-4f71-9749-d92919df6520
619	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:07:00.423237+00	fbc11821-c31f-49f3-88ea-a90b348f918b
620	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:07:24.121779+00	845be293-be35-4b69-beb0-c6e7f1ecbcb6
621	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:07:40.036251+00	1571cf7e-db38-4e4a-bc2c-8a49ecf4a545
622	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:16:04.590182+00	a1cb2a4c-519a-496d-88d9-e52bc355bc2b
623	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:17:04.132908+00	d59dfe0b-9b48-480d-9fa2-965e1d30d071
624	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:19:10.984656+00	a426f8d4-e5be-4600-a079-515a1f0eae54
625	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:19:29.444377+00	3c351c50-4f4f-4470-9103-7733af943711
626	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:19:42.351199+00	f9920cad-626a-4d12-8a77-fb82e1cc1f59
627	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:32:13.709103+00	465af357-50c5-4988-bd95-247e5134886b
628	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:32:33.514692+00	d2177a96-22d6-4f28-aab9-d39ec57b719b
629	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:32:44.753204+00	991e4bd3-8ca4-49ac-9a0f-a56e21ddebf1
630	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:37:54.422831+00	16c5d176-d498-4d35-90e9-9787daf104cd
631	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:38:17.822053+00	48b966a2-1089-4fc5-be09-71490dbdc861
632	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:38:33.932825+00	13dbb471-4693-49e9-8d87-ee0254fcf15b
633	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:56:36.81601+00	b2f39b21-cadf-49d8-aace-5741d6e7e923
634	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:56:54.494525+00	48af10a0-0bef-4b05-9a1b-d91bfd5eb015
635	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 12:57:07.046619+00	78e1cf63-c10d-4a00-b4b8-561b0995cf50
636	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:03:55.784275+00	56bf3989-9042-441e-8e52-8a0cb2273903
637	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:04:14.773782+00	10b34bbd-4c1e-4ca5-bd19-4a84c4d52e67
638	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:04:24.565743+00	65dfb100-bdc2-437c-bdde-07a48311454f
639	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:06:56.709554+00	5d1b8be7-f0a3-4a31-87a4-d78a2043d39f
640	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:07:14.248954+00	a0d312bc-a8a5-425b-b191-a8067a0f2090
641	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:07:23.823947+00	8a464a20-22ed-4eaf-8f72-3f262203a303
642	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:52:59.069352+00	c0bc04f6-9f63-4a9e-95cf-e62863519a6a
643	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:53:19.520896+00	2cea162b-5fc7-4b01-9576-807e2b6d4ad3
644	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-08 13:53:36.491203+00	43da8d19-4c4e-4542-8460-a03623ed5b9c
645	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:43:18.028531+00	f27d7e9a-367a-4e09-8dc1-8b68720997fe
646	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:44:47.037735+00	8b7fa233-aa0b-4f0c-bf61-6fc4b315fd3c
647	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:45:16.482748+00	08687475-2567-4ced-aa99-cb17e8c7e5f2
648	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:48:51.959285+00	7f24ac5d-0415-4e48-8144-14228910f042
649	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:49:34.43238+00	eaacb75a-8466-42cb-8501-ecb6d4a737b6
650	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:49:56.576808+00	4bc53f1f-39c2-420c-8d57-f9fb16878c1f
651	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:55:59.977455+00	0bcd95c5-71d8-4b95-a4b5-a29a40f64aa0
652	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:56:56.059266+00	16799752-e9dd-4597-964c-ee3f2a5b6ab4
653	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 09:57:21.448046+00	e38e7b1f-641c-4118-a2fb-b2446e84611b
654	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:03:00.671621+00	44c3ff3e-f664-4cb0-89ff-16ae091665ca
655	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:03:45.690268+00	5426f47b-3fc2-4e2d-8522-09b20b53aae7
656	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:04:07.574215+00	b16cda77-f9c2-46e8-b6e7-b8e1a4605a52
657	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:08:54.749865+00	c7832a75-ae5b-4b18-8b2a-7bdb70e74bc8
658	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:09:45.17417+00	4fac4d0d-423d-4ced-9275-46d084396763
659	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:10:04.844857+00	b2df7180-258d-45f7-b142-46a256bb8af2
660	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:15:09.520878+00	8bf2d5ab-232b-445e-af5b-3f82654e594b
661	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:15:55.28761+00	98d4ee78-29a6-48d2-ab66-21e2a3eaee6e
662	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 10:16:17.032491+00	f252c27e-ac74-4c3d-b5ab-da5aeb8b0e18
663	Ville	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 11:23:16.355272+00	6765fd16-0471-4f4d-9b23-bbc2be31fadf
664	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 11:49:00.246397+00	4a12c5d2-8505-4548-9fe8-ed2f09d5eef8
665	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 11:50:30.244272+00	ac320abc-7e7f-4195-a57e-967143a5bcd8
666	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 11:51:03.429989+00	0c6aadea-dda6-43cf-af54-0327508d3158
667	Admino	well well well	2025-04-09 11:52:57.480767+00	4fac4d0d-423d-4ced-9275-46d084396763
668	Admino	well	2025-04-09 11:55:09.310279+00	ac320abc-7e7f-4195-a57e-967143a5bcd8
669	Admino	okej	2025-04-09 11:56:29.92693+00	a611bb74-5a8d-4e13-b20b-a942d4f0a790
670	Admino	okej	2025-04-09 11:56:38.418613+00	fccc7f71-76a2-45d7-9f5b-31bf1fb01ee8
671	Ville	Jag behöver hjälp nu.	2025-04-09 12:24:02.942829+00	ae0c88bb-ccb0-490e-b327-cd36b384978c
672	Ville	Jag behöver hjälp nu.	2025-04-09 12:24:08.271147+00	2885815c-1181-4101-b473-54947e6cb33c
673	Ville	Jag behöver hjälp nu.	2025-04-09 13:30:11.290885+00	08d00632-f411-4c77-8321-8ad60fb78b9c
674	Ville	Jag behöver hjälp nu.	2025-04-09 13:30:16.740616+00	41b2aec6-8b03-4b2f-b2e5-307c30ab9a29
675	Test Person	This is a test.	2025-04-09 13:56:35.984192+00	58d99d20-83f0-4de2-89ef-286bbf7e3c92
676	Test Person	This is a test.	2025-04-09 13:57:50.879311+00	9dd8f864-1a1a-44ff-9bd8-85c7c423b8b3
677	Test Person	This is a test.	2025-04-09 13:58:22.486171+00	237342f3-c1fe-4221-a1c3-0f8095ccd318
678	Test Person	This is a test.	2025-04-09 14:04:27.408968+00	ef0e3ca5-0ad8-443f-bc3c-503cadd94963
679	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:18:36.062408+00	7f55ecca-87d8-4857-9b52-c50f8bb54743
680	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:18:56.896928+00	6f1e0853-7b76-4fd1-9197-8d4db474fa32
681	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:19:24.1856+00	011901c7-41c5-41ae-b50e-6efb01b1b8d0
682	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:23:28.980163+00	c2ee2074-6729-417f-9069-f2f5aecedf09
683	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:23:56.10002+00	bb0c1fec-0662-44d1-8b9e-6704e5eed8af
684	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:24:14.118376+00	288b27f2-35ac-4ea6-ab21-95222aa46fc2
685	Ville	Jag behöver hjälp nu.	2025-04-09 14:24:30.237233+00	5736481e-75ec-4c9f-927a-d1cb7f7632c8
686	Ville	Jag behöver hjälp nu.	2025-04-09 14:24:37.318148+00	cdf1a8c1-e375-4327-aeee-2ed2bd308c9c
687	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:27:02.386535+00	a722171f-5efc-4bf1-a160-aaf4405ced39
688	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:31:13.318406+00	7a935a9e-54b5-45ac-b29d-196235b13d4d
689	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:31:36.641538+00	5b3f8d97-abe9-4032-8832-fc098985059f
690	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:31:56.186674+00	76848032-cd3e-471d-a5b4-93ee56768aba
691	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:38:57.057233+00	d5d7b447-3387-4bb3-b8ce-91df8c46a119
692	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:39:24.240696+00	5feefac1-cbec-4680-bdde-cf6504676800
693	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:39:40.036198+00	f02865d3-3e3c-46df-a395-cba79cd01953
694	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:57:24.519232+00	0fd5c5a0-fcce-4665-a4f7-f646288a08ee
695	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:57:43.18137+00	82813b6e-4b7e-4cf8-a740-8868b1dfe4f9
696	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 14:57:55.958938+00	e6042803-07e2-483b-8660-4b65efe30cb0
697	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:01:15.392602+00	8f2f5591-9f73-4f1c-ba10-f308725cf6a4
698	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:01:36.656458+00	4249daa6-8eff-42f1-898c-4124b82202be
699	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:01:59.412642+00	1f6ac2c6-1527-4af8-8537-9c8610fc73b9
700	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:06:01.693269+00	dc32da1b-f083-4839-b183-2d987e2db85b
701	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:06:21.55945+00	bc6b65af-e0a6-4a6e-b4ab-c6baf6b620af
702	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-09 15:06:37.821613+00	c53a96d2-9b9a-4cd1-95e8-b0a2b4a59114
703	Ville	Jag behöver hjälp nu.	2025-04-10 08:52:31.233473+00	e5e4a226-838a-4e65-badb-cb6076f104e9
704	Ville	Jag behöver hjälp nu.	2025-04-10 08:52:43.665237+00	9ff6ef23-51e0-41de-9583-8a2b1fe330d7
705	Ville	Jag behöver hjälp nu.	2025-04-10 09:03:15.92039+00	0713f06e-1f9f-47a3-a762-66ddec38c601
706	Ville	Jag behöver hjälp nu.	2025-04-10 09:03:22.712373+00	9722822b-54d9-40a7-aa2b-5955cef97986
707	Ville	Jag behöver hjälp nu.	2025-04-10 09:08:32.005232+00	37e222c8-ba5d-42d6-8a60-e412754e3570
708	Ville	Jag behöver hjälp nu.	2025-04-10 09:08:38.538806+00	0ff7627d-0ee7-4329-8ca5-3b23e13905ba
709	Ville	Jag behöver hjälp nu.	2025-04-10 12:27:33.529298+00	a449d5d4-a213-42d3-9cb9-c31fa9429b75
710	Ville	Jag behöver hjälp nu.	2025-04-10 12:27:41.190365+00	7b282102-87fa-4234-8dec-4e49550f335f
711	Ville	Jag behöver hjälp nu.	2025-04-10 13:01:45.182133+00	f47f99b1-de54-4055-815e-9abc926a5935
712	Ville	Jag behöver hjälp nu.	2025-04-10 13:01:51.742664+00	5a8683cb-3ef3-4cff-bf5c-78f2a649eb6c
713	Admino	testing	2025-04-10 17:29:15.24661+00	2885815c-1181-4101-b473-54947e6cb33c
714	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:42:02.354134+00	6fe020a1-1a2f-464b-9735-f0c1e4e2b47b
715	Admino	This is a test response from admin	2025-04-10 18:42:04.199429+00	2885815c-1181-4101-b473-54947e6cb33c
716	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:42:29.705095+00	db1898fc-2a2b-40c9-8291-426bc5f48842
717	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:42:49.508863+00	6fdca2f2-8984-4b6d-aeb0-205764a6b15d
718	Admino	hhr	2025-04-10 18:44:22.379311+00	9722822b-54d9-40a7-aa2b-5955cef97986
719	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:49:24.095507+00	093bf4fd-6c1f-42b9-ae2c-6b00547a6f69
720	Admino	This is a test response from admin	2025-04-10 18:49:27.59402+00	2885815c-1181-4101-b473-54947e6cb33c
721	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:49:51.338668+00	939fa3f4-8812-4f34-ac60-61120eb246d6
722	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:50:09.230089+00	f2f6ce12-b41d-4a6c-88d4-2c6865d0e2c0
723	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:56:50.948451+00	f0c9d88e-b098-407d-aeb5-3e31185dbce0
724	Admino	This is a test response from admin	2025-04-10 18:56:51.221121+00	2885815c-1181-4101-b473-54947e6cb33c
725	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:57:21.670217+00	752d59ed-2d8f-4f93-b9c6-dbf17a1fda95
726	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-10 18:57:44.175541+00	a38c0e53-e501-4ebc-9fe5-2aab3d3ddbe9
727	Ville	Jag behöver hjälp nu.	2025-04-11 11:43:44.090985+00	b5fb27b2-9bb5-4710-9090-08c24f90ed28
728	Ville	Jag behöver hjälp nu.	2025-04-11 11:43:51.69949+00	ea7bbafa-bb6e-42e0-a4ab-947d6d03c128
729	Ville	Jag behöver hjälp nu.	2025-04-11 11:48:51.18032+00	18bcd916-ffd2-4e5a-a5b7-b9eb3bfe9271
730	Ville	Jag behöver hjälp nu.	2025-04-11 11:48:58.247639+00	6424cbf5-a46d-4fe7-88e4-7e6f016a9008
731	Ville	Jag behöver hjälp nu.	2025-04-11 11:54:38.61841+00	3b7fbb40-7d8c-41d8-854e-620785330536
732	Ville	Jag behöver hjälp nu.	2025-04-11 11:54:50.211282+00	8ac92ae1-bdfb-4433-abc3-ca02a4aa59cc
733	Ville	Jag behöver hjälp nu.	2025-04-11 11:59:30.514036+00	0b7693b2-cf78-430c-b424-8435e9e32436
734	Ville	Jag behöver hjälp nu.	2025-04-11 11:59:37.711326+00	7b14ce86-acd6-4d64-9174-0fbb09cdff18
735	Saban	Min faktura stämmer inte.	2025-04-11 12:02:10.110301+00	801124ac-1684-4537-8d7c-3dd4865d091e
736	Ville	Jag behöver hjälp nu.	2025-04-11 12:04:32.28224+00	d16fb318-ab0e-4abc-81b8-3b86da0ef8b1
737	Ville	Jag behöver hjälp nu.	2025-04-11 12:04:38.733191+00	1d7270ee-2537-403c-a34b-d040407a7b30
738	Saban	Min faktura stämmer inte.	2025-04-11 12:06:44.614212+00	437c35a7-c8b6-47fc-95a4-70c50a26f734
739	Saban	Min faktura stämmer inte.	2025-04-11 12:07:30.489711+00	942edd4e-f35a-45f8-a10f-92dfba8976ed
740	Saban	Min faktura stämmer inte.	2025-04-11 12:07:57.763589+00	7f0fc582-9769-4cce-8d15-de3c71c9d6f3
741	Ville	Jag behöver hjälp nu.	2025-04-11 12:38:38.082611+00	aef05207-a844-4b03-ae0a-17c62c99c116
742	Ville	Jag behöver hjälp nu.	2025-04-11 12:38:44.921621+00	01c75983-d066-4fce-88bf-38f542e7ba5a
743	Ville	Jag behöver hjälp nu.	2025-04-11 12:46:38.122916+00	e3df92c2-e4c8-49ca-bcad-d61828b4a935
744	Ville	Jag behöver hjälp nu.	2025-04-11 12:46:45.503194+00	a357fa4e-a460-47bf-b7d7-bf9728080a7d
745	Ville	Jag behöver hjälp nu.	2025-04-11 13:05:06.398008+00	40e16c16-ebcf-40e3-a019-97a5e016f652
746	Ville	Jag behöver hjälp nu.	2025-04-11 13:05:13.131759+00	365e8072-c21b-4f52-ab2b-39de1033455c
747	Ville	Jag behöver hjälp nu.	2025-04-11 13:08:06.724064+00	cfce595d-a60e-4e99-974e-2cca4b30ebe6
748	Ville	Jag behöver hjälp nu.	2025-04-11 13:08:14.355471+00	402f2a17-e7e2-4db0-8900-dc1473ed258e
749	Ville	Jag behöver hjälp nu.	2025-04-11 13:10:33.326701+00	a51d0635-ac41-419e-af91-5643639b946c
750	Ville	Jag behöver hjälp nu.	2025-04-11 13:10:40.92007+00	012ef1a2-e354-4f19-9887-8b933bf06d5a
751	Ville	Jag behöver hjälp nu.	2025-04-11 13:17:37.992697+00	1710e783-ea1d-4cb6-b271-84489fdd4892
752	Ville	Jag behöver hjälp nu.	2025-04-11 13:17:45.315898+00	585dc463-eb07-41c4-82df-48866a54d982
753	Saban	Min faktura stämmer inte.	2025-04-11 13:18:38.26159+00	75c80531-2827-4f2e-9217-8095b317c7f4
754	Saban	Min faktura stämmer inte.	2025-04-11 13:18:48.506278+00	64a499ce-479f-463c-a501-97a4b49f3183
755	Saban	Min faktura stämmer inte.	2025-04-11 13:19:25.481816+00	caca2ea9-03dd-4458-a296-87541a64e6fe
756	Saban	Min faktura stämmer inte.	2025-04-11 13:19:35.436136+00	603b5b8a-7553-404b-891b-67624fc7ec41
757	Ville	Jag behöver hjälp nu.	2025-04-11 13:20:27.369527+00	b03bfb82-0980-495f-bea0-e589f51f94ed
758	Ville	Jag behöver hjälp nu.	2025-04-11 13:20:33.983919+00	17d73bfe-dd2c-4168-a01c-7c4919d63bd5
759	Ville	Jag behöver hjälp nu.	2025-04-11 13:21:33.658097+00	0336124d-47bf-43c0-a7fe-b4d55de7c44a
760	Ville	Jag behöver hjälp nu.	2025-04-11 13:21:40.508485+00	e76cd34b-0b0a-46e7-98bb-dd9106b8a0a3
761	Ville	Jag behöver hjälp nu.	2025-04-11 13:25:01.407459+00	620b97a0-8bf8-4b03-9982-678bbaca9847
762	Ville	Jag behöver hjälp nu.	2025-04-11 13:25:07.949609+00	b6f08f15-0c8b-4069-be29-5f5804977e58
763	Ville	Jag behöver hjälp nu.	2025-04-11 13:28:59.985499+00	76b2170f-f309-4c31-8f19-391d45699a33
765	Ville	Jag behöver hjälp nu.	2025-04-11 13:30:12.882634+00	40c78720-5485-4bb1-b1ce-1d84ebfd072f
766	Saban	Min faktura stämmer inte.	2025-04-11 13:38:12.938791+00	a22d3014-94db-4f9d-a89e-74e3c5c2d3ae
767	Saban	Min faktura stämmer inte.	2025-04-11 13:38:23.152668+00	1c19c646-0b7f-4fe9-94b8-b2f060a579ea
768	Saban	Min faktura stämmer inte.	2025-04-11 13:38:32.80415+00	e6295600-38da-4b53-b405-4776a955b5e1
769	Saban	Min faktura stämmer inte.	2025-04-11 13:50:15.198716+00	4eef97dd-139c-4e38-8c6f-010a87175a5f
770	Saban	Min faktura stämmer inte.	2025-04-11 13:50:25.483842+00	aa9f40b4-2f77-4059-bc47-7f5b94b5c5e1
771	Saban	Min faktura stämmer inte.	2025-04-11 13:50:39.742326+00	1d0969cb-9fa9-4c53-97c6-fd5156a86f3c
772	Saban	Min faktura stämmer inte.	2025-04-11 14:01:05.414909+00	679f3911-847e-458f-9b27-a1cd024c9601
773	Saban	Min faktura stämmer inte.	2025-04-11 14:01:16.305088+00	1c561b84-bf36-4e1c-b8ce-7c707f085fc5
774	Saban	Min faktura stämmer inte.	2025-04-11 14:01:31.504158+00	4a102386-35b8-4c36-b690-64e14b01b9cb
775	Saban	Min faktura stämmer inte.	2025-04-11 14:05:15.750768+00	6bc34be1-b5f6-4ddf-bea0-c725fcee646d
776	Saban	Min faktura stämmer inte.	2025-04-11 14:05:26.905356+00	f36df704-6189-4c1a-92ac-950e185f9697
777	Saban	Min faktura stämmer inte.	2025-04-11 14:05:41.036768+00	ee76942e-8b91-4dbc-b640-8c480bf2b2cc
778	Saban	Min faktura stämmer inte.	2025-04-11 14:06:00.762297+00	414f12fa-ebac-42eb-8608-0a843bf1a79e
779	Saban	Min faktura stämmer inte.	2025-04-11 14:06:10.787914+00	155be0b3-c6d9-4872-9bcc-0de23357f569
780	Saban	Min faktura stämmer inte.	2025-04-11 14:06:24.959099+00	99552341-6178-43d0-bbaa-6d6fe4aee386
781	Saban	Min faktura stämmer inte.	2025-04-11 14:07:26.339023+00	de7d5570-5518-42e3-b0b1-46c81f7c41ad
782	Saban	Min faktura stämmer inte.	2025-04-11 14:07:36.352526+00	f883f4ac-bf9e-4216-b453-8f12ff06073f
783	Saban	Min faktura stämmer inte.	2025-04-11 14:07:50.771281+00	fba96f28-cd86-47ca-b781-274ca21744ce
784	Saban	Min faktura stämmer inte.	2025-04-11 14:08:10.0417+00	076a8adb-e7e0-4417-921a-d0b30b14de03
785	Saban	Min faktura stämmer inte.	2025-04-11 14:08:20.217516+00	6642acde-95b8-4a83-80ae-debadd4abc10
786	Saban	Min faktura stämmer inte.	2025-04-11 14:08:34.517704+00	d5ba788d-b77f-4edb-875c-242b2a4d092d
787	Saban	Min faktura stämmer inte.	2025-04-11 14:08:53.268425+00	9e947c3d-945d-4e42-a3d8-5613a8a00f41
788	Saban	Min faktura stämmer inte.	2025-04-11 14:09:03.376665+00	e1d66322-ba15-476a-9e9d-a668307f43a2
789	Saban	Min faktura stämmer inte.	2025-04-11 14:09:17.611635+00	2756f9ef-4768-4837-afd0-f355a7a9a198
790	Ville	Jag behöver hjälp nu.	2025-04-13 10:20:13.55116+00	347be6c8-c988-4bac-9e47-2fe8dcfc3ba6
791	Ville	Jag behöver hjälp nu.	2025-04-13 10:20:25.875979+00	c9f9c80f-760e-43d5-a3df-41cea84996e7
792	Ville	Jag behöver hjälp nu.	2025-04-13 10:25:29.847524+00	b94f26c8-5af7-44c8-bfda-361ec9bf4d3f
793	Ville	Jag behöver hjälp nu.	2025-04-13 10:25:37.908046+00	6a3590dd-5b0c-4837-9504-3279781c9e20
794	Ville	Jag behöver hjälp nu.	2025-04-13 10:33:38.285108+00	20b28208-0d3c-4953-83da-faefa0947a99
795	Ville	Jag behöver hjälp nu.	2025-04-13 10:33:48.243138+00	ae770642-4cc1-4072-a24a-c21308fb63ca
796	Ville	Jag behöver hjälp nu.	2025-04-13 10:37:46.973968+00	14d28c7e-9ba8-47d5-a994-ca980864e173
797	Ville	Jag behöver hjälp nu.	2025-04-13 10:37:56.672666+00	d9e2582f-9737-4864-b43f-2c5d18489628
798	Ville	Jag behöver hjälp nu.	2025-04-13 12:36:17.413091+00	d3dd2d95-eb43-41e5-b804-58369d9b02f9
799	Ville	Jag behöver hjälp nu.	2025-04-13 12:36:26.286617+00	89eb80bb-1e86-4320-9cc5-6ad282ffb616
800	Ville	Jag behöver hjälp nu.	2025-04-13 12:51:37.231351+00	0f82c1a4-748f-4e94-9391-78898987a57b
801	Ville	Jag behöver hjälp nu.	2025-04-13 12:51:45.177391+00	9710ddd7-590a-4a06-8781-5ec625ef559d
802	Ville	Jag behöver hjälp nu.	2025-04-13 12:55:54.094583+00	8180c1e0-2b99-40d8-b8ad-b4cc14c4d33a
803	Ville	Jag behöver hjälp nu.	2025-04-13 12:56:03.542113+00	dfa8e792-6123-4f11-878e-0b6a069d7003
804	Ville	Jag behöver hjälp nu.	2025-04-13 12:58:28.245044+00	cea4257a-a962-4fdd-8241-47bf1f26cd37
805	Ville	Jag behöver hjälp nu.	2025-04-13 12:58:36.061259+00	2ca17077-d560-4698-83b3-5b49ae2d55f3
806	Ville	Jag behöver hjälp nu.	2025-04-13 14:22:55.64736+00	7d14a08b-a955-475f-906a-f555ba255de3
807	Ville	Jag behöver hjälp nu.	2025-04-13 14:23:03.42331+00	6c719799-25f9-4c45-8453-61eea34746d7
808	Ville	Jag behöver hjälp nu.	2025-04-13 14:23:59.656802+00	c3f050d1-4ee7-4076-a5d8-164d5214357e
809	Ville	Jag behöver hjälp nu.	2025-04-13 14:24:07.835629+00	6fb19e3b-b0f3-4373-b6e7-8a9189173067
810	Ville	Jag behöver hjälp nu.	2025-04-13 14:25:30.730823+00	b344692f-c8ea-44ba-a3e2-7e277aa4c408
811	Ville	Jag behöver hjälp nu.	2025-04-13 14:25:39.430364+00	46d30a5e-895d-4935-9f32-d763699c2064
812	Ville	Jag behöver hjälp nu.	2025-04-13 14:33:57.283761+00	91a6fb18-a2c7-45b8-aff7-2eba686c269e
813	Ville	Jag behöver hjälp nu.	2025-04-13 14:34:06.062703+00	b2059d1f-96b9-4edb-a803-dbef898f9b2f
814	Ville	Jag behöver hjälp nu.	2025-04-13 14:34:38.061672+00	f5153b52-d5eb-4cb7-86c7-7d472fb59a56
815	Ville	Jag behöver hjälp nu.	2025-04-13 14:34:45.610928+00	dca844a4-c72b-4788-99ac-63001c57266e
816	Ville	Jag behöver hjälp nu.	2025-04-13 14:36:23.243173+00	ec39fa87-846f-480a-ab55-0b9333d29663
817	Ville	Jag behöver hjälp nu.	2025-04-13 14:36:31.63841+00	c1ae33e2-2e22-410a-917e-53f8ba2ec811
818	Ville	Jag behöver hjälp nu.	2025-04-13 14:39:24.311264+00	3e7e4377-3460-483d-ac3c-4e6ba9456a87
819	Ville	Jag behöver hjälp nu.	2025-04-13 14:39:32.29763+00	3aca05f1-915a-4ae7-bf5e-3cf819ff13d1
820	Ville	Jag behöver hjälp nu.	2025-04-13 14:42:22.882073+00	7e7811d8-f3ae-4392-a879-aeb39c18dd16
821	Ville	Jag behöver hjälp nu.	2025-04-13 14:42:30.95571+00	06d3fa95-acf7-47cc-b8e3-c83d87d29e0a
822	Ville	Jag behöver hjälp nu.	2025-04-13 14:50:14.36086+00	80a89aa4-053c-43dc-9fe9-dc9fc866b6d8
823	Ville	Jag behöver hjälp nu.	2025-04-13 14:50:23.690263+00	2904c597-8a1d-43d8-a0cc-32d60613c0e0
824	Ville	Jag behöver hjälp nu.	2025-04-13 14:52:47.257408+00	3ce2b799-2587-47d9-a65a-b8489997dda9
825	Ville	Jag behöver hjälp nu.	2025-04-13 14:52:56.462652+00	ca833958-e5fe-40fc-864b-8f700b0a2a5e
826	Ville	Jag behöver hjälp nu.	2025-04-13 14:55:15.358887+00	4db2bd1e-f4f3-4e26-9ad2-37b452dae3f5
827	Ville	Jag behöver hjälp nu.	2025-04-13 15:03:52.750668+00	50a844c3-be3c-4bd6-9c8f-cfc4e978e51c
828	Ville	Jag behöver hjälp nu.	2025-04-13 15:04:00.478046+00	48025210-f661-4cbd-84e6-3f2c2e8df6b2
829	Ville	Jag behöver hjälp nu.	2025-04-13 15:06:28.542248+00	eeaf88fc-53a7-4969-8605-89ab9ff86c1f
830	Ville	Jag behöver hjälp nu.	2025-04-13 15:06:37.168727+00	cd1adcd6-d193-41b7-a11c-154d6fce411c
831	Ville	Jag behöver hjälp nu.	2025-04-13 15:10:06.899487+00	4f42dea4-4d6a-4f2e-b052-de23f8086f83
832	Ville	Jag behöver hjälp nu.	2025-04-13 15:10:16.169023+00	59e35ace-9fd1-4955-b4de-901530a5320e
833	Ville	Jag behöver hjälp nu.	2025-04-13 15:12:10.26851+00	106bdf4f-0c9a-4405-9cf4-9e93663eb6ac
834	Ville	Jag behöver hjälp nu.	2025-04-13 15:12:19.34636+00	86676260-f38e-422a-8991-d0a7e22cbd73
835	Ville	Jag behöver hjälp nu.	2025-04-13 15:14:04.004949+00	63a111d2-f5ca-4220-9bc0-8ca828517b90
836	Ville	Jag behöver hjälp nu.	2025-04-13 15:14:12.135754+00	f03b1db0-b90b-47a6-807a-7438dd6790ee
837	Ville	Jag behöver hjälp nu.	2025-04-13 15:15:55.11073+00	0353ec24-098b-4220-a988-429372b5ee17
838	Ville	Jag behöver hjälp nu.	2025-04-13 15:16:05.381216+00	a11fa8c3-8562-4cf7-a5d1-9a36afcfa1d2
839	Ville	Jag behöver hjälp nu.	2025-04-13 15:17:35.114285+00	9f01a56c-33cc-46d6-a957-ebcaa69d33b2
840	Ville	Jag behöver hjälp nu.	2025-04-13 15:17:46.595212+00	9d75e912-3bb7-4fb1-8538-5c3fdca48116
841	Ville	Jag behöver hjälp nu.	2025-04-13 15:21:29.318211+00	b73a8ca5-e4f5-4a84-aa3a-b4837d7954d6
842	Ville	Jag behöver hjälp nu.	2025-04-13 15:21:38.091646+00	de3a1c78-8971-4eed-af01-8e504ba578a4
843	Ville	Jag behöver hjälp nu.	2025-04-13 15:23:28.782597+00	8f7571b4-4b79-4c71-9d2a-00a500be5e3f
844	Ville	Jag behöver hjälp nu.	2025-04-13 15:23:37.302437+00	cb133408-7f40-4f2b-91f5-31b367c0d92f
845	Ville	Jag behöver hjälp nu.	2025-04-13 15:28:03.903467+00	86bc1a35-8954-4aa8-9c70-e37af4847642
846	Ville	Jag behöver hjälp nu.	2025-04-13 15:28:11.653512+00	54e77388-fb7e-4d23-83d2-68bdb51467f8
847	Ville	Jag behöver hjälp nu.	2025-04-13 15:32:27.665228+00	3a4294f2-487c-46eb-a6fc-c00ebb9cfe98
848	Ville	Jag behöver hjälp nu.	2025-04-13 15:32:37.116092+00	ad25cdf5-bf27-49dd-81fe-f5ecd55c6d67
849	Ville	Jag behöver hjälp nu.	2025-04-14 09:09:05.873994+00	42e02767-2b9b-44b1-b58a-dd8d1af76085
850	Ville	Jag behöver hjälp nu.	2025-04-14 09:09:14.902435+00	19fa497a-b40e-4979-a94a-cdeadaae8bcd
851	Ville	Jag behöver hjälp nu.	2025-04-14 09:11:18.356126+00	b0201b98-db35-447a-86bd-eb5411659b85
852	Ville	Jag behöver hjälp nu.	2025-04-14 09:11:27.399544+00	7d932bfd-eb54-44be-9473-320a0b34d24d
853	Ville	Jag behöver hjälp nu.	2025-04-14 09:13:46.788243+00	ce76ba3f-5235-44bd-9f7d-e97c2bc691ce
854	Ville	Jag behöver hjälp nu.	2025-04-14 09:13:54.042177+00	6d37f258-8d12-4195-83ab-0037e28d18ac
855	Ville	Jag behöver hjälp nu.	2025-04-14 09:17:05.280588+00	10312662-077f-460b-affd-6b53769c9850
856	Ville	Jag behöver hjälp nu.	2025-04-14 09:17:12.789995+00	8e50e235-e79e-4117-9092-26d2e0cd7a07
857	Ville	Jag behöver hjälp nu.	2025-04-14 09:19:22.078322+00	d76cbd88-33cf-4303-bc75-4c591bf816fd
858	Ville	Jag behöver hjälp nu.	2025-04-14 09:19:30.33269+00	1d01bc88-a238-42eb-aa3c-d3a306c107ed
859	Ville	Jag behöver hjälp nu.	2025-04-14 09:29:42.708667+00	c47065d8-2fcd-4921-8caf-faa750a9fa56
860	Ville	Jag behöver hjälp nu.	2025-04-14 09:29:49.894052+00	3573d3e8-187d-4eaf-8c63-aa24f6767fb8
861	Ville	Jag behöver hjälp nu.	2025-04-14 09:33:11.431305+00	ef017e6c-76ad-4fcd-ad9b-3e4daddb146c
862	Ville	Jag behöver hjälp nu.	2025-04-14 09:33:18.641799+00	1bd2bce4-3951-4e3f-bb1f-5008d0026b49
863	Ville	Jag behöver hjälp nu.	2025-04-14 09:34:20.034971+00	c543cdfb-60ed-446b-86bc-3ca589193a1d
864	Ville	Jag behöver hjälp nu.	2025-04-14 09:34:26.881375+00	dc632c32-79aa-444a-afcb-1195c7024490
865	Ville	Jag behöver hjälp nu.	2025-04-14 09:35:18.903223+00	3073252f-2a3b-4836-9d4d-890355ae8c5f
866	Ville	Jag behöver hjälp nu.	2025-04-14 09:35:26.884974+00	6597e4e7-4495-4a90-9bf1-40b951caaf4a
867	Ville	Jag behöver hjälp nu.	2025-04-14 09:37:44.126293+00	6cf5aea5-b7ea-410c-b026-3a9dd646cb84
868	Ville	Jag behöver hjälp nu.	2025-04-14 10:13:29.599067+00	e376a373-a99e-4415-ab12-f3f92a9f6cb1
869	Ville	Jag behöver hjälp nu.	2025-04-14 10:13:37.717279+00	268a4c83-f029-42e8-ab3f-b5600af583ba
870	Ville	Jag behöver hjälp nu.	2025-04-14 10:15:19.866221+00	a44b6d6d-9a83-477f-857a-c208317105ac
871	Ville	Jag behöver hjälp nu.	2025-04-14 10:15:27.743462+00	175b3760-6242-4fc1-94d2-ee0cee404bdf
872	Ville	Jag behöver hjälp nu.	2025-04-14 10:27:24.467299+00	6f54c37e-af6c-4035-bc9f-eb38838b1866
873	Ville	Jag behöver hjälp nu.	2025-04-14 10:27:31.89612+00	cba16f39-a26e-4233-879a-eeaabde7263b
874	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 10:27:37.915842+00	0f3364cc-6b5a-4527-a8b7-4b5b0495e997
875	Martin	Jag vill ha en ny motor	2025-04-14 10:27:39.176293+00	d4e82f39-f869-4ad6-9d8e-0ac6f259dc2c
876	Martin	Min räkning är dyr	2025-04-14 10:27:40.450156+00	e22ef0f6-0df6-4779-829c-098f6c668f9c
877	Putte	Tjena tjena	2025-04-14 10:27:42.072843+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
878	Ville	Jag behöver hjälp nu.	2025-04-14 10:28:23.447611+00	d53a2da5-cb86-4f88-9f48-134e3eb4549a
879	Ville	Jag behöver hjälp nu.	2025-04-14 10:28:31.474841+00	194e26a0-441f-4bbb-8b50-0dc404097b86
880	Ville	Jag behöver hjälp nu.	2025-04-14 10:29:46.85681+00	c32c1248-2629-4697-be2f-89d7f62043c2
881	Ville	Jag behöver hjälp nu.	2025-04-14 10:29:54.442227+00	4735c846-6884-45d6-a87f-71ea33619d85
882	Ville	Jag behöver hjälp nu.	2025-04-14 10:31:34.020772+00	f36cef1b-7e65-44b9-9a04-072a733c248e
883	Ville	Jag behöver hjälp nu.	2025-04-14 10:31:41.885757+00	f36280a2-056c-499a-a35f-5e3e19ae8dd3
884	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 10:36:43.667981+00	ce987158-5c98-4144-87a5-fcee6d316d01
885	Martin	Jag vill ha en ny motor	2025-04-14 10:36:44.66292+00	a7b62115-737b-4507-9e1c-aab661e3d620
886	Martin	Min räkning är dyr	2025-04-14 10:36:45.625759+00	3c278a0c-ed70-40fc-b7d4-4204538b29ff
887	Putte	Tjena tjena	2025-04-14 10:36:46.905747+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
888	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 10:48:55.556642+00	d33b121f-66e2-4fac-b2d3-a167068bd506
889	Martin	Jag vill ha en ny motor	2025-04-14 10:48:56.604711+00	b8e9b8b5-9290-41f4-b8f6-4fe26503d8e0
890	Martin	Min räkning är dyr	2025-04-14 10:48:57.587723+00	7e27e223-0bbd-4dae-b23c-1a30adc0d653
891	Martin	Tjena tjena	2025-04-14 10:48:58.794601+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
892	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 10:55:46.096084+00	ec89c802-2647-4204-af07-21964426722b
893	Martin	Jag vill ha en ny motor	2025-04-14 10:55:47.383009+00	77339a2a-eadc-4f68-9137-e53c5d7f5fc7
894	Martin	Min räkning är dyr	2025-04-14 10:55:49.529272+00	58a4930c-6017-4e73-b1b3-573c89da4b1f
895	Martin	Tjena tjena	2025-04-14 10:55:50.822771+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
896	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 10:59:51.687552+00	b8037762-3392-4933-8271-18378f8bcc4e
897	Martin	Jag vill ha en ny motor	2025-04-14 10:59:52.918616+00	5229f53f-efe0-4f6e-a94b-db11253b4b04
898	Martin	Min räkning är dyr	2025-04-14 10:59:54.139437+00	176a7c92-f6be-47f2-9734-d16e21b9855d
899	Martin	Tjena tjena	2025-04-14 10:59:55.320089+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
900	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 11:03:41.027989+00	1f332046-da31-4b1f-8188-e5ac449b991f
901	Martin	Jag vill ha en ny motor	2025-04-14 11:03:41.922393+00	b9d1061a-47d4-4e09-a971-7ba852e48ef8
902	Martin	Min räkning är dyr	2025-04-14 11:03:42.897015+00	aa0ba49c-6396-4571-9034-120fc0aee0e7
903	Martin	Tjena tjena	2025-04-14 11:03:51.214849+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
904	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 11:08:46.370922+00	a0f57c27-8f98-4abf-8371-cf25088a2b03
905	Martin	Jag vill ha en ny motor	2025-04-14 11:08:47.626412+00	f5811b16-6442-4571-bbe5-fc8ae050d40d
906	Martin	Min räkning är dyr	2025-04-14 11:08:48.539553+00	7e7efc12-24f3-4410-9a41-9ebac7c562b6
907	Martin	Tjena tjena	2025-04-14 11:08:49.561138+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
908	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 11:12:45.086119+00	d9d9b35a-451c-410e-861d-e8d532a91552
909	Martin	Jag vill ha en ny motor	2025-04-14 11:12:46.602523+00	3521e09c-5563-46ef-b35b-7f3bbda31503
910	Martin	Min räkning är dyr	2025-04-14 11:12:47.799071+00	82f7fd99-e336-4ed5-bf0f-f116197cc307
911	Martin	Tjena tjena	2025-04-14 11:12:49.048822+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
912	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 11:18:06.925955+00	55a87a1e-596f-4ed8-8240-de07ada24b9d
913	Martin	Jag vill ha en ny motor	2025-04-14 11:18:08.828717+00	e297b489-7d3f-4a94-acbc-fa6b6e313a1c
914	Martin	Min räkning är dyr	2025-04-14 11:18:10.368837+00	e5ad3ea1-bee3-4f78-baef-97d601a96812
915	Martin	Tjena tjena	2025-04-14 11:18:11.894754+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
916	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 11:26:41.399778+00	f5f7a535-12af-49e4-866e-52b3d55a2052
917	Martin	Jag vill ha en ny motor	2025-04-14 11:26:42.742326+00	22229af8-ab08-4f71-b42d-e3797a93bcb7
918	Martin	Min räkning är dyr	2025-04-14 11:26:43.651699+00	d363e1a3-127b-4e8f-a405-4c88c8037fc3
919	Martin	Tjena tjena	2025-04-14 11:26:45.902168+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
920	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 11:50:43.481062+00	6028931a-cb22-4a0f-820d-1f4d4972e2a6
921	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 11:53:23.182998+00	fbf4c354-b102-4be6-9905-38eb67677405
922	zunken123	Vad kan jag hjälpa dig med?	2025-04-14 12:56:25.395577+00	2885815c-1181-4101-b473-54947e6cb33c
923	zunken123	Vad kan jag hjälpa dig med?	2025-04-14 13:02:28.630478+00	2885815c-1181-4101-b473-54947e6cb33c
924	zunken123	Vad kan jag hjälpa dig med?	2025-04-14 13:04:01.539118+00	2885815c-1181-4101-b473-54947e6cb33c
925	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:13:30.483165+00	286e2aff-6645-43f6-b671-92f374d8ffa1
926	Martin	Jag vill ha en ny motor	2025-04-14 13:13:32.312802+00	8aedba61-5aa8-4e82-8a5d-9848bdee4f47
927	Martin	Min räkning är dyr	2025-04-14 13:13:33.566936+00	e3f9e9d0-eb87-414b-a6bb-0709533ddadc
928	Martin	Tjena tjena	2025-04-14 13:13:34.818367+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
929	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:18:08.551326+00	ba4c4611-55d8-49b5-a1dc-c7f8cb0c7ff7
930	Martin	Jag vill ha en ny motor	2025-04-14 13:18:10.138798+00	5f6388be-a5ab-48f2-a681-2d081668bda6
931	Martin	Min räkning är dyr	2025-04-14 13:18:11.396671+00	453a743a-6a77-4433-9aa4-c3171553474d
932	Martin	Tjena tjena	2025-04-14 13:18:12.649068+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
933	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:28:06.987195+00	83064358-0dbf-47e1-a7f0-d2af97574e03
934	Martin	Jag vill ha en ny motor	2025-04-14 13:28:08.64771+00	ae6a9a9e-c102-4924-ad5f-7e2edfaaf0d6
935	Martin	Min räkning är dyr	2025-04-14 13:28:09.869969+00	b12755e9-3935-43e2-825e-afb7a655413e
936	Martin	Tjena tjena	2025-04-14 13:28:11.179629+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
937	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:36:57.122562+00	1b7db8de-9ec3-41be-b113-b0ba65d66210
938	Martin	Jag vill ha en ny motor	2025-04-14 13:36:59.11275+00	b83934b2-f815-4201-8cf0-a9bb0e99cc48
939	Martin	Min räkning är dyr	2025-04-14 13:37:00.716458+00	afb56bc0-6682-4f92-9a54-11ddbd58be44
940	Martin	Tjena tjena	2025-04-14 13:37:02.335182+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
941	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:37:13.056089+00	ad5c26ca-7361-45c7-affb-9be7fdf461ed
942	Martin	Jag vill ha en ny motor	2025-04-14 13:37:15.115536+00	e3d5dec2-ed8b-46c0-a561-3c443a5f557a
943	Martin	Min räkning är dyr	2025-04-14 13:37:16.673218+00	05763bfd-8b78-4ec1-adcb-06ce8fe89c30
944	Martin	Tjena tjena	2025-04-14 13:37:18.234175+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
945	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 13:43:12.079735+00	e9793515-e9f4-42b5-879e-3a3568db518d
946	Martin	Jag vill ha en ny motor	2025-04-14 13:43:13.810714+00	8a44ec99-69bf-454b-b8de-954d4b08fa66
947	Martin	Min räkning är dyr	2025-04-14 13:43:15.055409+00	3607144c-f753-41ec-bd78-eec3f47bd917
948	Martin	Tjena tjena	2025-04-14 13:43:16.315861+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
949	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:00:47.282552+00	959e6047-3ff4-4ef9-aafa-078d8b2e074d
950	Martin	Jag vill ha en ny motor	2025-04-14 14:00:49.517703+00	c8ebaa31-5000-492d-a173-986a5682a3be
951	Martin	Min räkning är dyr	2025-04-14 14:00:50.635406+00	9bd26eeb-554a-4904-9c7d-87c00bb19128
952	Martin	Tjena tjena	2025-04-14 14:00:52.122531+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
953	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:01:39.10504+00	a8a88b4c-cce1-4b23-b675-beb9ee477801
954	Martin	Jag vill ha en ny motor	2025-04-14 14:01:41.223408+00	6f33807a-a1ef-484e-bf63-91084c99cfec
955	Martin	Min räkning är dyr	2025-04-14 14:01:42.948715+00	22587d3d-5933-4b3b-85c9-0b67ece236c0
956	Martin	Tjena tjena	2025-04-14 14:01:47.429151+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
957	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:03:58.230724+00	9e14a120-37f6-4ba4-8691-7e1a05f1ab37
958	Martin	Jag vill ha en ny motor	2025-04-14 14:03:59.55165+00	fb322629-a3ae-44d6-bb0d-58c00cce641c
959	Martin	Min räkning är dyr	2025-04-14 14:04:00.747153+00	6a6d3fb1-e635-4719-a90a-b1550ffc75d4
960	Martin	Tjena tjena	2025-04-14 14:04:02.005286+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
961	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:14:41.524746+00	03b117bd-08ad-4c5b-a0c0-6565ab21bfea
962	Martin	Jag vill ha en ny motor	2025-04-14 14:14:43.143759+00	8648fe49-1833-4709-8388-ac684e1c96df
963	Martin	Min räkning är dyr	2025-04-14 14:14:44.50684+00	13cead51-08d2-440f-b2e0-512e5672fdde
964	Martin	Tjena tjena	2025-04-14 14:14:45.767126+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
965	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:34:07.774906+00	b1646bfc-3aba-4249-8e66-4546ce253c3c
966	Martin	Jag vill ha en ny motor	2025-04-14 14:34:09.45645+00	b15074d6-84ad-4f68-957d-79084aed61cd
967	Martin	Min räkning är dyr	2025-04-14 14:34:10.943167+00	f534dbdc-2191-4a73-98f1-c449190d4402
968	Martin	Tjena tjena	2025-04-14 14:34:12.108304+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
969	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:41:58.828541+00	db212aa0-fbd6-4f20-b979-f7c21c34bbb1
970	Martin	Jag vill ha en ny motor	2025-04-14 14:42:00.452698+00	68f09713-1f14-458c-b8d1-c97c9518509a
971	Martin	Min räkning är dyr	2025-04-14 14:42:01.661963+00	93e5cfde-2f60-454e-8847-50b02ffb3809
972	Martin	Tjena tjena	2025-04-14 14:42:02.975376+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
973	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 14:53:39.536062+00	b6b95702-f72c-4aa6-92f0-9f4bc424bae0
974	Martin	Jag vill ha en ny motor	2025-04-14 14:53:40.868629+00	0251c4cd-a305-425f-a604-50d0b8258851
975	Martin	Min räkning är dyr	2025-04-14 14:53:41.829005+00	08c49648-2380-4202-b89c-4432408d65db
976	Martin	Tjena tjena	2025-04-14 14:53:42.817902+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
977	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 15:02:58.357408+00	94bde62c-88e4-4ad8-867d-c36a505ba0e5
978	zunken123	Vad kan jag hjälpa dig med?	2025-04-14 15:03:05.037545+00	2885815c-1181-4101-b473-54947e6cb33c
979	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 15:03:59.803261+00	3a2f82e0-4709-457f-97af-9e918d7544db
980	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 15:04:58.823338+00	2d282b20-01d1-4a3c-834f-d2b1aa65f5b4
981	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 15:06:04.984188+00	694df02c-5ae3-41ad-a169-e276a7a76019
982	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 15:07:39.792849+00	ef13277a-cb4c-48e9-b9e7-fba2bbaa21f0
983	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 15:09:41.777127+00	136ff5e9-a9cb-413a-a0f4-8b531b667cfb
984	Martin	Jag vill ha en ny motor	2025-04-14 15:09:43.662409+00	379623fc-8794-4bd9-99ae-6310afaa4f9f
985	Martin	Min räkning är dyr	2025-04-14 15:09:45.210935+00	240f97c3-51e1-47d4-933d-dc67ca220719
986	Martin	Tjena tjena	2025-04-14 15:09:46.819688+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
987	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 15:23:02.952941+00	1705c314-5a1e-43a1-8a3c-7b5f3025d478
988	Martin	Jag vill ha en ny motor	2025-04-14 15:23:04.339219+00	0286c704-baf7-4600-a659-61562ff78eae
989	Martin	Min räkning är dyr	2025-04-14 15:23:05.317519+00	dbcecdf7-955e-4f41-848e-71b9c07b8031
990	Martin	Tjena tjena	2025-04-14 15:23:06.366452+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
991	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 15:37:26.59242+00	80fcc843-4201-49cc-a653-92372298bf2e
992	Martin	Jag vill ha en ny motor	2025-04-14 15:37:28.095765+00	213f1ebc-7ad3-405b-aaa8-e1b5a39ef64d
993	Martin	Min räkning är dyr	2025-04-14 15:37:29.079545+00	ac2b3169-2732-45ef-ba63-e88e7cc65034
994	Martin	Tjena tjena	2025-04-14 15:37:30.095941+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
995	Saban	Min faktura stämmer inte.	2025-04-14 16:16:20.358994+00	4a6a1e1e-1f23-4151-a765-96e95600c4a6
996	Saban	Min faktura stämmer inte.	2025-04-14 16:16:34.291953+00	782a0f68-831e-4e72-be60-33c3c8f1e360
997	Saban	Min faktura stämmer inte.	2025-04-14 16:16:50.255416+00	c7d31847-9865-4136-a13f-66a53ed513ad
998	Saban	Min faktura stämmer inte.	2025-04-14 16:51:10.624001+00	85238d72-d238-4e3e-a1d1-d0f77ed1a69d
999	Saban	Min faktura stämmer inte.	2025-04-14 16:51:22.070821+00	15e986b9-4250-4e69-a636-5da4fc34ffbb
1000	Saban	Min faktura stämmer inte.	2025-04-14 16:51:38.419827+00	07caec57-10ff-4470-a78d-b3b2cf615315
1001	Saban	Min faktura stämmer inte.	2025-04-14 16:52:15.204477+00	ea9c13dc-dee7-47d7-b75a-58fab7941654
1002	Saban	Min faktura stämmer inte.	2025-04-14 16:52:26.945972+00	0de83acb-d091-4f08-b850-0904e74b7577
1003	Saban	Min faktura stämmer inte.	2025-04-14 16:52:44.026054+00	6a800204-2227-49e6-829d-d56d7c595128
1004	Saban	Min faktura stämmer inte.	2025-04-14 16:56:36.775987+00	818a10ab-b247-4286-860b-30bc54b71ed9
1005	Saban	Min faktura stämmer inte.	2025-04-14 16:56:48.077102+00	c56ec048-cc5b-4161-8940-4a9d5f180429
1006	Saban	Min faktura stämmer inte.	2025-04-14 16:57:05.059914+00	5ecdfc3e-9fe8-4232-b616-2887a3920249
1007	Saban	Min faktura stämmer inte.	2025-04-14 17:00:48.811399+00	a6896363-ca6b-4629-bc0c-51421b63303f
1008	Saban	Min faktura stämmer inte.	2025-04-14 17:00:59.776966+00	f1f7b03e-a873-474b-8a0d-606d8ebaa501
1009	Saban	Min faktura stämmer inte.	2025-04-14 17:01:15.956839+00	b9277e00-b4ce-481e-8060-504e1a04b01c
1010	Saban	Min faktura stämmer inte.	2025-04-14 17:02:53.504855+00	aa506a9b-15a0-4ac9-af82-4e8c0fe6b5b4
1011	Saban	Min faktura stämmer inte.	2025-04-14 17:03:05.465387+00	359a7a90-15cd-4ce5-bb51-637ed4d0b862
1012	Saban	Min faktura stämmer inte.	2025-04-14 17:03:21.563424+00	d73da6c4-0d3c-4f8e-a195-fa8459de9216
1013	Saban	Min faktura stämmer inte.	2025-04-14 17:07:42.215853+00	910b3b32-0188-46d1-99e0-906d8cb1d2bf
1014	Saban	Min faktura stämmer inte.	2025-04-14 17:07:53.663651+00	838131cc-7bbc-46fa-ad74-e553ec6ac3e7
1015	Saban	Min faktura stämmer inte.	2025-04-14 17:13:57.081889+00	d8d95843-b1fb-4321-bf2e-47b2ed5f03cf
1016	Saban	Min faktura stämmer inte.	2025-04-14 17:14:59.355748+00	27a9c7a7-0707-41e6-b25d-4b53ed561e0c
1018	Saban	Min faktura stämmer inte.	2025-04-14 17:15:11.041256+00	2469555c-8351-473d-8e62-7977dab4ddec
1019	Saban	Min faktura stämmer inte.	2025-04-14 17:15:27.534321+00	555f88ce-9348-455f-8abe-31ced505b24c
1020	Saban	Min faktura stämmer inte.	2025-04-14 17:15:56.032594+00	0d218d28-3a0e-45dc-89b1-3148b3c3d92f
1022	Saban	Min faktura stämmer inte.	2025-04-14 17:16:07.849295+00	943d7081-1b2d-42e1-bbb2-9d086c590429
1023	Saban	Min faktura stämmer inte.	2025-04-14 17:16:23.87824+00	fba15a04-faca-4bf9-b747-f85d47b7598d
1024	Saban	Min faktura stämmer inte.	2025-04-14 17:19:34.34122+00	23fd2104-2acd-4700-9eaf-d65351ba2429
1025	Saban	Test Playright	2025-04-14 17:19:35.682143+00	764c78db-de5f-40c9-8e62-53a472e5373a
1026	Saban	Min faktura stämmer inte.	2025-04-14 17:19:46.447236+00	3daade6c-0a4b-4407-a0b2-c6f9f185adfd
1027	Saban	Min faktura stämmer inte.	2025-04-14 17:20:02.341092+00	b149d51f-9ccf-4198-a669-131a94aaa28d
1028	Ville	Jag behöver hjälp nu.	2025-04-14 18:25:04.070101+00	15ea89d0-f42d-445f-8c3b-73a68e0c3be0
1029	Ville	Jag behöver hjälp nu.	2025-04-14 18:25:16.049615+00	dbaabd75-8f08-4ace-9604-f8cbe5b42fea
1030	Ville	Jag behöver hjälp nu.	2025-04-14 18:28:09.691628+00	241a47c2-50ca-42a6-b67f-6e254f3df27b
1031	Ville	Jag behöver hjälp nu.	2025-04-14 18:28:21.954286+00	c948d3db-9482-44d9-bd86-98bf757603c6
1032	Ville	Jag behöver hjälp nu.	2025-04-14 18:32:13.971848+00	87cf9904-9741-488c-bebe-8070cb935b13
1033	Ville	Jag behöver hjälp nu.	2025-04-14 18:32:24.243297+00	761facca-0b9c-41c7-aaac-c147d6df7eb4
1034	Ville	Jag behöver hjälp nu.	2025-04-14 18:35:44.241854+00	3151159c-280b-447b-8098-7a704108ef00
1035	Ville	Jag behöver hjälp nu.	2025-04-14 18:35:53.959593+00	63ddfdc4-646f-4639-8fe5-e5f3229ca7ea
1036	Ville	Jag behöver hjälp nu.	2025-04-14 18:39:01.877114+00	143cb2a3-e1bf-4450-9571-5b3f87ed8611
1037	Ville	Jag behöver hjälp nu.	2025-04-14 18:39:11.862094+00	c629352a-da83-45db-af27-86c2d32a3e13
1038	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 18:42:38.709639+00	712e1cad-17da-4981-8f13-6b73fe1d921a
1039	Martin	Jag vill ha en ny motor	2025-04-14 18:42:40.706899+00	c9f8487a-f6b4-46a5-a248-93f5fcb3e531
1040	Martin	Min räkning är dyr	2025-04-14 18:42:42.338689+00	a45f77fa-46fd-4c26-8534-201dfa99dff6
1041	Martin	Tjena tjena	2025-04-14 18:42:43.952211+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1042	Ville	Jag behöver hjälp nu.	2025-04-14 18:44:35.174179+00	6940fc35-7d31-49ed-a263-a525a80b1480
1043	Ville	Jag behöver hjälp nu.	2025-04-14 18:44:43.803608+00	d2294b6c-bf0b-4d5d-a76a-45266f89b906
1044	Ville	Jag behöver hjälp nu.	2025-04-14 18:45:18.357036+00	5558b20b-b703-4beb-9932-f0a93506b1a0
1045	Ville	Jag behöver hjälp nu.	2025-04-14 18:45:26.98838+00	f5e65335-f569-4e8b-abf7-d0c7ac53b2d3
1046	Ville	Jag behöver hjälp nu.	2025-04-14 18:50:04.898362+00	eff874b7-682c-4ed4-83bf-7b4136f456d9
1047	Ville	Jag behöver hjälp nu.	2025-04-14 18:50:15.12464+00	5a502860-dd90-4e4a-abbf-181421605a10
1048	Ville	Jag behöver hjälp nu.	2025-04-14 19:04:33.793788+00	4dacb355-eb22-45c7-ab4e-2c8d3f2e665f
1049	Ville	Jag behöver hjälp nu.	2025-04-14 19:04:43.30678+00	760995d9-6b55-4698-92cf-5a0cb694a2c3
1050	Ville	Jag behöver hjälp nu.	2025-04-14 19:08:11.12954+00	502270d3-72fa-4d05-94e2-6e89c0f10bdd
1051	Ville	Jag behöver hjälp nu.	2025-04-14 19:08:27.546589+00	8f17dc67-8f18-44ab-b38c-c54b70d3c870
1052	Ville	Jag behöver hjälp nu.	2025-04-14 19:10:18.857721+00	37366d86-06e7-424a-ac22-208a4bda1ae6
1053	Ville	Jag behöver hjälp nu.	2025-04-14 19:10:34.323538+00	e31fc4e1-693a-4507-bbfe-7d013d2a5f75
1054	Ville	Jag behöver hjälp nu.	2025-04-14 19:12:42.64921+00	ed655da1-2a98-4b78-9e6e-f584c752f6d8
1055	Ville	Jag behöver hjälp nu.	2025-04-14 19:13:02.105002+00	76975213-9a38-4a6b-bfd0-022d6c986bf6
1056	Ville	Jag behöver hjälp nu.	2025-04-14 19:14:04.077704+00	54d4a9d3-346c-43d6-ac18-c06d9b6d0473
1057	Ville	Jag behöver hjälp nu.	2025-04-14 19:14:16.982785+00	1621bb3d-5d37-406c-a6fd-1b5d34b3db6a
1058	Ville	Jag behöver hjälp nu.	2025-04-14 19:15:07.625669+00	4a65e585-1f5b-47d2-9ca0-5d6311c7340d
1059	Ville	Jag behöver hjälp nu.	2025-04-14 19:22:44.005513+00	0535b338-7290-4966-9852-07ae62c424a5
1060	Ville	Jag behöver hjälp nu.	2025-04-14 19:24:33.64055+00	e017a0a1-87d3-4dd6-a7fa-a65ea8d71501
1061	Ville	Jag behöver hjälp nu.	2025-04-14 19:24:45.925497+00	868341c6-cd6f-4480-aa83-d7a220886310
1062	Ville	Jag behöver hjälp nu.	2025-04-14 19:27:10.035806+00	a542f9c9-5c42-48c1-a0cd-917e6cb02cc3
1063	Ville	Jag behöver hjälp nu.	2025-04-14 19:27:21.892444+00	f89858d1-69d1-4bcd-a758-0416a588a9fb
1064	Ville	Jag behöver hjälp nu.	2025-04-14 19:33:36.994292+00	073b3a46-415e-4b1d-b42d-6ff994a25f89
1065	Ville	Jag behöver hjälp nu.	2025-04-14 19:33:46.698053+00	673d9f67-d94d-49ea-8ce3-a7e285ff257d
1066	Ville	Jag behöver hjälp nu.	2025-04-14 19:34:15.449822+00	be964866-ad27-4b09-84d5-9166975621b9
1067	Ville	Jag behöver hjälp nu.	2025-04-14 19:34:24.87393+00	312b48f7-4e87-4b52-b6c4-171de63b6a89
1068	Ville	Jag behöver hjälp nu.	2025-04-14 19:36:02.404972+00	207cf423-9565-4819-9fb4-7beab713a220
1069	Ville	Jag behöver hjälp nu.	2025-04-14 19:36:12.734454+00	12d99947-0243-49a3-8d0e-00b239c1e417
1070	Ville	Jag behöver hjälp nu.	2025-04-14 19:37:14.283556+00	7d022a9d-b0c2-42d5-af7d-58730b0c3624
1071	Ville	Jag behöver hjälp nu.	2025-04-14 19:37:22.574151+00	b099acf1-8600-446e-8fb8-7caad8134cc7
1072	zunken123	Vad kan jag hjälpa dig med?	2025-04-14 19:49:31.742525+00	2885815c-1181-4101-b473-54947e6cb33c
1073	John Doe	Hej, jag har en fråga om min beställning.	2025-04-14 19:52:10.189028+00	6f484cb2-1caa-4f59-b27c-536bb0b40cde
1074	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:01:54.626706+00	8e0198dc-10b5-4c92-8dc1-16fa9280ec3e
1075	Martin	Jag vill ha en ny motor	2025-04-14 20:01:56.651487+00	71d77bf3-f548-4286-944c-be9d0b0c5da5
1076	Martin	Min räkning är dyr	2025-04-14 20:01:58.489475+00	212c0fc3-c79a-4b09-a1ca-4072dcf6bf54
1077	Martin	Tjena tjena	2025-04-14 20:02:00.147283+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1078	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:02:01.916868+00	c09ea78d-3f0b-48e9-bafc-5bd0af5fa61c
1079	Martin	Jag vill ha en ny motor	2025-04-14 20:02:03.986509+00	2113bf0e-639e-47ce-9fd0-3c8f61b1a53e
1080	Martin	Min räkning är dyr	2025-04-14 20:02:05.03931+00	cd272942-6ee0-4424-a83b-fa32d6022f23
1081	Martin	Tjena tjena	2025-04-14 20:02:06.182634+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1082	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:07:54.245857+00	69199238-aa43-489a-8dc2-7b15aeca39c4
1083	Martin	Jag vill ha en ny motor	2025-04-14 20:07:56.414492+00	3e3495e2-12a7-410f-86d5-fcc086b511dc
1084	Martin	Min räkning är dyr	2025-04-14 20:07:58.040323+00	3306aacb-dee7-4693-8562-6bc8c2047d6d
1085	Martin	Tjena tjena	2025-04-14 20:07:59.766804+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1086	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:13:14.962249+00	f411b3b3-d590-4198-99bf-3b3d61eb5c48
1087	Martin	Jag vill ha en ny motor	2025-04-14 20:13:16.758521+00	4140ae72-c22f-4080-a0ca-c454036d6651
1088	Martin	Min räkning är dyr	2025-04-14 20:13:18.002451+00	22ae3882-938a-4e5d-9cc9-a4ad612b66ab
1089	Martin	Tjena tjena	2025-04-14 20:13:19.414274+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1090	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:28:09.297081+00	68017963-a56d-4f26-b118-ffe837c9f426
1091	Martin	Jag vill ha en ny motor	2025-04-14 20:28:10.826241+00	d7cc14b9-46b2-4c02-a184-e006d498c330
1092	Martin	Min räkning är dyr	2025-04-14 20:28:12.043464+00	6a0dad67-a6b8-48d3-8747-c2adaff599d9
1093	Martin	Tjena tjena	2025-04-14 20:28:13.376282+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1094	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:33:15.923766+00	c0048fda-6515-42ad-8dab-a29b691f46ea
1095	Martin	Jag vill ha en ny motor	2025-04-14 20:33:17.352251+00	028ee3f1-8b8f-4190-a49c-209882b264dc
1096	Martin	Min räkning är dyr	2025-04-14 20:33:18.369201+00	f9d26909-390a-440f-843b-79bf6371d6ea
1097	Martin	Tjena tjena	2025-04-14 20:33:19.451603+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1098	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:37:10.278115+00	22cf4023-8d2c-40d8-96d3-cbabbff389d0
1099	Martin	Jag vill ha en ny motor	2025-04-14 20:37:11.95362+00	47995768-af74-4710-b4ec-ac0df9dca3ea
1100	Martin	Min räkning är dyr	2025-04-14 20:37:13.339866+00	3a3162f6-31ce-430a-8547-3f0c4d86b7ae
1101	Martin	Tjena tjena	2025-04-14 20:37:14.674521+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1102	Martin	Jag vill ha hjälp med fast telefoni	2025-04-14 20:49:29.614995+00	10c671bd-9fa1-4a76-9ce3-9e8daae880b6
1103	Martin	Jag vill ha en ny motor	2025-04-14 20:49:31.502722+00	45ccf8f1-5bf7-43b1-8972-8541e7a28075
1104	Martin	Min räkning är dyr	2025-04-14 20:49:33.07773+00	d960235c-e8ce-42e3-9ecb-1ed6daa3555b
1105	Martin	Tjena tjena	2025-04-14 20:49:34.672008+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1106	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 07:48:00.073211+00	401b0300-79a4-4278-82f9-825da9ea7491
1107	Martin	Jag vill ha en ny motor	2025-04-15 07:48:01.479681+00	48313dc4-2604-4c46-8db8-f041f144a2cc
1108	Martin	Min räkning är dyr	2025-04-15 07:48:02.445161+00	12411bea-cae4-41c9-bdb2-334a32068047
1109	Martin	Tjena tjena	2025-04-15 07:48:03.523682+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1110	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 07:59:33.312567+00	e1148244-6b18-4ffc-92e0-5267441a3cc1
1111	Martin	Jag vill ha en ny motor	2025-04-15 07:59:35.120116+00	868dbda2-f406-47fc-b3d3-42b9564de9fd
1112	Martin	Min räkning är dyr	2025-04-15 07:59:36.442392+00	28706bb8-e646-4f92-bf6c-120ff4b8796b
1113	Martin	Tjena tjena	2025-04-15 07:59:37.722559+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1114	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 08:14:03.130132+00	8b0f798c-a378-4225-a0f6-4a75557ced1c
1115	Martin	Jag vill ha en ny motor	2025-04-15 08:14:04.928282+00	35f0efbd-da70-4068-beb3-1512a1874cc6
1116	Martin	Min räkning är dyr	2025-04-15 08:14:06.240842+00	083d9952-f2ec-4ed8-9fea-32413f9f9d21
1117	Martin	Tjena tjena	2025-04-15 08:14:07.470945+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1118	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 09:05:22.396903+00	46b41029-98de-44de-ae5a-49a1db0aa0fd
1119	Martin	Jag vill ha en ny motor	2025-04-15 09:05:24.25289+00	b6aeb807-8416-4d4a-856a-6f324583ec52
1120	Martin	Min räkning är dyr	2025-04-15 09:05:26.712757+00	aac23852-052b-4ef8-a23d-00a84d2d6023
1122	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 09:16:27.470011+00	b1a40dcf-9489-4f46-a5ec-51943c7074af
1123	Martin	Jag vill ha en ny motor	2025-04-15 09:16:28.831634+00	41aafc2c-8811-4962-9c15-5315f9d56636
1124	Martin	Min räkning är dyr	2025-04-15 09:16:29.777218+00	1b195b92-8f14-4e63-8707-32b932311487
1125	Martin	Tjena tjena	2025-04-15 09:16:31.681638+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1126	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 09:34:25.040805+00	13c83be9-472c-462d-95ff-106aa3d495b7
1127	Martin	Jag vill ha en ny motor	2025-04-15 09:34:26.95742+00	c1e5454f-579c-40b2-a236-e5293bd2abf1
1128	Martin	Min räkning är dyr	2025-04-15 09:34:28.618466+00	90419894-fc3c-480d-a7f4-814fbb8c72bc
1129	Martin	Tjena tjena	2025-04-15 09:34:30.167073+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1130	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 09:49:47.805612+00	4ab69158-2994-40df-a958-f0d41bf4fc48
1131	Martin	Jag vill ha en ny motor	2025-04-15 09:49:49.143375+00	56f8c56d-3e9c-4d71-988a-5d6de541db87
1132	Martin	Min räkning är dyr	2025-04-15 09:49:50.321623+00	c3f3cb36-5114-4c82-aa1b-3998c542b7c2
1133	Martin	Tjena tjena	2025-04-15 09:49:51.203204+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1134	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 09:50:20.932791+00	89b685d5-1364-47b2-87b8-0f7a9889d61c
1135	Martin	Jag vill ha en ny motor	2025-04-15 09:50:22.769458+00	b340ed07-3374-4021-a2b7-d0d38901c919
1136	Martin	Min räkning är dyr	2025-04-15 09:50:24.592799+00	c1913937-c20e-497d-bd82-a3a96a9fa33b
1137	Martin	Tjena tjena	2025-04-15 09:50:26.287021+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1138	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 10:01:25.171597+00	ffdfdbee-8818-4989-92ed-51c5cb947408
1139	Martin	Jag vill ha en ny motor	2025-04-15 10:01:26.96437+00	642a9fa4-2777-4b28-9783-7ab58b0498b9
1140	Martin	Min räkning är dyr	2025-04-15 10:01:28.319774+00	710d1bc7-47a2-4303-b045-2cb8cf793958
1141	Martin	Tjena tjena	2025-04-15 10:01:29.77764+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1142	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 10:12:31.636239+00	08bc1fe1-2f0c-4eaf-a1c9-d77f3d68f13b
1143	Martin	Jag vill ha en ny motor	2025-04-15 10:12:33.495487+00	0c89f66e-2078-46e2-924d-4cc5b0cf7a16
1144	Martin	Min räkning är dyr	2025-04-15 10:12:34.83563+00	87fd9ac7-ea6e-4561-a04e-3416e3ec5941
1145	Martin	Tjena tjena	2025-04-15 10:12:36.189189+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1146	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 10:29:57.940474+00	f4b36c5e-7bae-49a0-9db0-1283e1f2204c
1147	Martin	Jag vill ha en ny motor	2025-04-15 10:30:00.010716+00	45af0547-942a-4a1d-ada4-5943e91b4855
1148	Martin	Min räkning är dyr	2025-04-15 10:30:01.56032+00	eea9967e-f4e4-4195-adf6-7bf5ac5c2634
1149	Martin	Tjena tjena	2025-04-15 10:30:03.20458+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1150	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 10:43:04.802599+00	24580077-a3b8-4350-ba5b-5427f80377f7
1151	Martin	Jag vill ha en ny motor	2025-04-15 10:43:06.78445+00	31c7d93f-9cd7-438b-b109-290ed705f236
1152	Martin	Min räkning är dyr	2025-04-15 10:43:08.420673+00	a202d21b-e582-4c4a-801e-3bb1fd5fe864
1153	Martin	Tjena tjena	2025-04-15 10:43:10.084292+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1154	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 10:54:39.302151+00	4d3272cb-d526-408a-958f-3f6c8ff0617c
1155	Martin	Jag vill ha en ny motor	2025-04-15 10:54:40.801497+00	a6b5255a-aa11-4806-98d3-e88750494f73
1156	Martin	Min räkning är dyr	2025-04-15 10:54:41.982342+00	0cc79842-0a55-425f-aa29-e87f2c1d23cc
1157	Martin	Tjena tjena	2025-04-15 10:54:43.251569+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1158	Saban	Min faktura stämmer inte.	2025-04-15 11:24:11.539258+00	1ce0de58-d9c5-4cf5-a92f-2ea8dfacc29c
1221	Saban	Min faktura stämmer inte.	2025-04-15 13:45:54.763938+00	8610f841-8c1b-4522-8e17-1d36f81114e6
1160	Saban	Min faktura stämmer inte.	2025-04-15 11:24:23.695264+00	afe932c2-ece3-4015-9bd9-783d6c83987b
1161	Saban	Min faktura stämmer inte.	2025-04-15 11:24:39.426835+00	c4f3b8fc-bbae-423c-be67-4d1462d1aa06
1162	Saban	Min faktura stämmer inte.	2025-04-15 11:28:58.244564+00	a31fa63b-377d-46ec-be4d-d557f30e9bfa
1223	Saban	Min faktura stämmer inte.	2025-04-15 13:46:06.518634+00	c138ced2-0db3-4acb-93e4-8c61919a918c
1164	Saban	Min faktura stämmer inte.	2025-04-15 11:29:09.324206+00	c25dac37-6208-4bed-a98a-d201ef44e62d
1165	Saban	Min faktura stämmer inte.	2025-04-15 11:29:25.100242+00	208d3846-8bec-4a49-b25a-989582fa953c
1166	Saban	Min faktura stämmer inte.	2025-04-15 11:41:56.67653+00	c74e4c91-28b4-46ef-bc19-e31103d7b9ef
1225	Ville	Jag behöver hjälp nu.	2025-04-15 13:55:58.518625+00	6fe027ca-3600-4760-aeac-3aa47da8ac63
1168	Saban	Min faktura stämmer inte.	2025-04-15 11:42:07.34741+00	92597c80-6ceb-4207-91b8-813cadd65611
1169	Saban	Min faktura stämmer inte.	2025-04-15 11:42:23.095255+00	d4dfa9f0-7c54-4003-8afb-ee4aa717d1c7
1170	Saban	Min faktura stämmer inte.	2025-04-15 11:45:46.276149+00	84761204-e94c-404a-8811-fad7cd816a26
1230	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 15:07:13.604675+00	9412d814-c5b4-49b6-b891-9c5a63fa51cd
1172	Saban	Min faktura stämmer inte.	2025-04-15 11:45:57.054128+00	75f8f981-397b-4f83-95cf-360786222a3c
1173	Saban	Min faktura stämmer inte.	2025-04-15 11:46:12.836034+00	b5b50100-1df4-46c8-bb34-ed702fc82b49
1174	Saban	Min faktura stämmer inte.	2025-04-15 11:48:14.831633+00	3e36e15d-b3ca-47b4-8a99-f122dd142801
1231	Martin	Jag vill ha en ny motor	2025-04-15 15:07:15.194601+00	638b204f-104b-4465-b3f1-a03d5da1dbbc
1176	Saban	Min faktura stämmer inte.	2025-04-15 11:48:25.728117+00	fa275b6e-ab68-4876-9a0e-541d8699fd8d
1177	Saban	Min faktura stämmer inte.	2025-04-15 11:48:41.951975+00	588390e3-7932-492d-a7bc-d05754a1e71b
1178	Saban	Min faktura stämmer inte.	2025-04-15 12:04:35.341173+00	8c2477d4-a689-490a-b087-6ca89bdb4809
1232	Martin	Min räkning är dyr	2025-04-15 15:07:16.866072+00	b2fd2365-59dd-40d4-abbc-d40595514df8
1180	Saban	Min faktura stämmer inte.	2025-04-15 12:04:47.472111+00	55900a57-7709-4c79-965e-ea45cde86adf
1181	Saban	Min faktura stämmer inte.	2025-04-15 12:05:03.605789+00	cdb3cf09-7110-454b-8daf-8d731d1da3a7
1182	Saban	Min faktura stämmer inte.	2025-04-15 12:06:56.082695+00	180b0676-56c2-4fa5-b8cb-3f35502d85d6
1233	Martin	Tjena tjena	2025-04-15 15:07:18.320851+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1184	Saban	Min faktura stämmer inte.	2025-04-15 12:07:07.202755+00	175c89a8-daab-4323-9359-c701d9b38483
1185	Saban	Min faktura stämmer inte.	2025-04-15 12:07:22.975012+00	10df7456-ce7b-4584-bd5c-30045695e5a7
1186	Saban	Min faktura stämmer inte.	2025-04-15 12:16:31.712073+00	ffc06ca8-0bdf-46b4-a831-7507448c851b
1187	Saban	Min faktura stämmer inte.	2025-04-15 12:16:48.616983+00	f62613b7-c0f7-4a0e-9fc1-3a613b994617
1188	Saban	Min faktura stämmer inte.	2025-04-15 12:17:55.153569+00	62b2d678-8558-4f1c-b477-a89fa91c59b6
1235	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 07:20:25.066577+00	2885815c-1181-4101-b473-54947e6cb33c
1190	Saban	Min faktura stämmer inte.	2025-04-15 12:18:07.331616+00	5819d5a3-9935-45bb-9cf9-255fbc6573ff
1191	Saban	Min faktura stämmer inte.	2025-04-15 12:18:23.134837+00	2e9a43c5-b1c6-4995-936b-b8f847d3985c
1192	Saban	Min faktura stämmer inte.	2025-04-15 12:31:23.992016+00	fdd3f5c4-ab95-4b51-829f-9604e256a248
1194	Saban	Min faktura stämmer inte.	2025-04-15 12:31:36.435298+00	26623a07-f483-404c-ace4-daf5597d556e
1195	Saban	Min faktura stämmer inte.	2025-04-15 12:31:52.199364+00	96217f6b-ab0a-406e-a1bb-16a07707ac09
1196	Ville	Hej	2025-04-15 12:39:27.873061+00	abc123
1197	Löken	Bilen låter konstigt när jag startar den.	2025-04-15 12:39:28.217564+00	98c079a6-70b4-4fff-bfbc-988f2dbcba83
1198	Löken	inget fungerar.	2025-04-15 12:39:29.844398+00	4c83aa51-473e-4d82-b288-4d60448e57ca
1199	Löken	hjälp mig	2025-04-15 12:39:30.890118+00	bbea8bb3-17df-4a01-a4fb-ec19b946c38c
1200	Ville	Hej	2025-04-15 12:39:33.651574+00	abc123
1201	Ville	Hej	2025-04-15 12:44:21.426606+00	abc123
1202	zunken123	Vad kan jag hjälpa dig med?	2025-04-15 12:57:21.676271+00	2885815c-1181-4101-b473-54947e6cb33c
1203	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 13:01:31.413885+00	1dc377c7-53b4-4092-9afb-c12ef59d1d1d
1204	Martin	Jag vill ha en ny motor	2025-04-15 13:01:33.325626+00	667c5217-90e4-422f-85b6-d0f4d6061ff9
1205	Martin	Min räkning är dyr	2025-04-15 13:01:34.697515+00	c17cfd69-c8e8-4671-9ea2-d1755dbff38b
1206	Martin	Tjena tjena	2025-04-15 13:01:36.005686+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1207	Saban	Min faktura stämmer inte.	2025-04-15 13:09:22.684113+00	fe9bac6d-4c4f-47ab-bec2-cafe2ae691e1
1222	Saban	Test Playright	2025-04-15 13:45:55.527134+00	764c78db-de5f-40c9-8e62-53a472e5373a
1209	Saban	Min faktura stämmer inte.	2025-04-15 13:09:36.003209+00	77de8dd5-1a15-46e3-ae3a-f5e99171e5db
1210	Saban	Min faktura stämmer inte.	2025-04-15 13:10:52.54008+00	917e5b65-37ce-4be6-95d8-874cfc72a504
1224	Ville	Jag behöver hjälp nu.	2025-04-15 13:55:47.460576+00	3e8bce95-8b21-4903-a2ad-bf4a61981428
1212	Saban	Min faktura stämmer inte.	2025-04-15 13:11:04.392311+00	a6fc4ac8-88d6-4d15-b922-84c3303b90aa
1213	Saban	Min faktura stämmer inte.	2025-04-15 13:13:09.288774+00	a5f414bf-b040-4cc5-98fc-e8cc3788a9e6
1226	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 14:06:40.770984+00	8c44365c-f48e-42b1-a2c0-74cd11363aa8
1215	Saban	Min faktura stämmer inte.	2025-04-15 13:26:57.714115+00	33d2eb1a-c23a-4e0a-b4d0-683561fffa7c
1216	Saban	Min faktura stämmer inte.	2025-04-15 13:35:53.41683+00	82933a18-82a6-4cf6-a80a-2fb4c24a8d92
1217	Martin	Jag vill ha hjälp med fast telefoni	2025-04-15 13:44:46.951769+00	61f2ed6d-00ec-4303-9d1a-44f4195c16fb
1218	Martin	Jag vill ha en ny motor	2025-04-15 13:44:48.993634+00	9d8213c3-f842-49d2-8852-1fed5a3a6af4
1219	Martin	Min räkning är dyr	2025-04-15 13:44:50.711213+00	4d580fc0-763c-4202-ba46-9358463dff11
1220	Martin	Tjena tjena	2025-04-15 13:44:52.248831+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1227	Martin	Jag vill ha en ny motor	2025-04-15 14:06:42.824715+00	247d1fe7-703c-4490-9ae3-6ccbaf605e6c
1228	Martin	Min räkning är dyr	2025-04-15 14:06:44.88797+00	69b4e3ad-e0ae-4d21-9968-01c9e6372865
1229	Martin	Tjena tjena	2025-04-15 14:06:48.539557+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1234	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 06:54:22.936236+00	2885815c-1181-4101-b473-54947e6cb33c
1236	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 07:27:15.332584+00	2885815c-1181-4101-b473-54947e6cb33c
1237	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 07:39:51.45662+00	31b6ec85-09a8-4f9e-b030-b7eb09ae1fda
1238	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 08:10:58.210928+00	d174f397-cb3e-459a-9aa6-806086b4e9f5
1239	Martin	Jag vill ha en ny motor	2025-04-16 08:11:00.157169+00	c27cb21d-ea14-40af-8286-53ec7bf37a30
1240	Martin	Min räkning är dyr	2025-04-16 08:11:01.712001+00	692c3008-584e-4d81-aa01-080ab3113baa
1241	Martin	Tjena tjena	2025-04-16 08:11:03.264428+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1242	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 08:20:23.159753+00	4a85170f-88db-4313-9f82-a9539aaa9edd
1243	Martin	Jag vill ha en ny motor	2025-04-16 08:20:24.681011+00	fef47421-5f88-45a9-9354-a18bc988664d
1244	Martin	Min räkning är dyr	2025-04-16 08:20:26.038923+00	a6a8e7d0-212b-41d8-91d4-ae4afe67044a
1245	Martin	Tjena tjena	2025-04-16 08:20:27.313169+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1246	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 08:25:51.316418+00	adab4671-9dea-46d7-a7ff-f6401d9f6c85
1247	Martin	Jag vill ha en ny motor	2025-04-16 08:25:53.224944+00	ae88d259-0677-4c16-9a75-07057b0d766f
1248	Martin	Min räkning är dyr	2025-04-16 08:25:54.793317+00	45a85a43-2544-4ffa-aacd-af2f4912fd99
1249	Martin	Tjena tjena	2025-04-16 08:25:56.311139+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1250	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 08:35:43.222212+00	f2c27178-0b9c-4b00-bf1c-ae6c58f7d127
1251	Martin	Jag vill ha en ny motor	2025-04-16 08:35:45.001371+00	646fb94c-27e0-42c7-b0b2-cef6cd118a2d
1252	Martin	Min räkning är dyr	2025-04-16 08:35:46.292406+00	b0cb2247-2948-4959-af8f-762c8e935291
1253	Martin	Tjena tjena	2025-04-16 08:35:47.656726+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1254	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 08:37:33.338371+00	43d2880b-be38-4c95-b2e2-4b224824e412
1255	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 08:37:35.337406+00	2885815c-1181-4101-b473-54947e6cb33c
1256	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 08:57:12.988458+00	9f3e4b44-1098-49aa-9ca5-e868b15125e4
1257	Martin	Jag vill ha en ny motor	2025-04-16 08:57:14.510449+00	a6bc4bfd-137f-48e6-87ac-5efdd6a1bd3b
1258	Martin	Min räkning är dyr	2025-04-16 08:57:15.650274+00	9bd28adf-668d-4258-a465-b792c4c6f52c
1259	Martin	Tjena tjena	2025-04-16 08:57:16.94375+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1260	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 08:59:24.33111+00	3171df93-5884-4e35-9a1a-f2569485754a
1261	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 08:59:27.183528+00	2885815c-1181-4101-b473-54947e6cb33c
1262	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 09:07:04.852338+00	0f608098-ed38-4635-a213-50d0cbf42c75
1263	Martin	Jag vill ha en ny motor	2025-04-16 09:07:06.209737+00	3e8b1cb1-54e3-45b0-b01d-a5e1a7363511
1264	Martin	Min räkning är dyr	2025-04-16 09:07:07.268669+00	150169df-0cce-4552-b482-d5b1f4b704c6
1265	Martin	Tjena tjena	2025-04-16 09:07:08.231455+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1266	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 09:08:55.492479+00	9e223638-aa43-4819-9a22-69b5f85cf57e
1267	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 09:08:57.879914+00	2885815c-1181-4101-b473-54947e6cb33c
1268	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 09:14:56.709191+00	2b4bcf55-2eb4-4596-aa68-b248f0cc0b26
1269	Martin	Jag vill ha en ny motor	2025-04-16 09:14:58.431511+00	b8812256-4f65-440e-a6c8-b68f5ecfa5a9
1270	Martin	Min räkning är dyr	2025-04-16 09:14:59.709598+00	527d9f0d-271c-4327-a8d0-5536f8298887
1271	Martin	Tjena tjena	2025-04-16 09:15:01.042192+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1272	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 09:17:01.332168+00	51a0b355-dc56-4087-8277-ca4c773cef53
1273	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 09:17:03.496974+00	2885815c-1181-4101-b473-54947e6cb33c
1274	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 09:25:42.372875+00	cfee50d8-e939-403a-b4a4-167526e8b2d3
1275	Martin	Jag vill ha en ny motor	2025-04-16 09:25:44.307409+00	dc501e71-eda6-4aed-8f1e-00ddf53ff882
1276	Martin	Min räkning är dyr	2025-04-16 09:25:45.812018+00	2aa8f901-d24c-4fa9-8e0f-bed51a2c0419
1277	Martin	Tjena tjena	2025-04-16 09:25:47.45769+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1278	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 09:28:22.03995+00	d8e11706-ef6a-4b4e-a36d-46fd85647c44
1279	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 09:28:24.315148+00	2885815c-1181-4101-b473-54947e6cb33c
1280	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 09:34:14.425066+00	f56ac07f-e936-4c74-a661-ef064faf619c
1281	Martin	Jag vill ha en ny motor	2025-04-16 09:34:15.734951+00	8392d70b-ef6d-47f2-9dd8-d862e48a826f
1282	Martin	Min räkning är dyr	2025-04-16 09:34:16.641184+00	4606f00e-1fe3-45c5-9fad-4a7653b3133d
1283	Martin	Tjena tjena	2025-04-16 09:34:17.635567+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1284	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 09:36:04.270293+00	f61ca464-830e-4249-a681-5c11290719fc
1285	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 09:36:06.293561+00	2885815c-1181-4101-b473-54947e6cb33c
1286	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 09:42:12.804754+00	9a1ca3e3-791d-4aa9-ac55-6d914650c1fd
1287	Martin	Jag vill ha en ny motor	2025-04-16 09:42:14.391494+00	9aad2402-92e2-4112-b09e-6a33a7e33e47
1288	Martin	Min räkning är dyr	2025-04-16 09:42:15.711593+00	4d299e70-f6d0-4f97-9850-0e825c94e116
1289	Martin	Tjena tjena	2025-04-16 09:42:16.969341+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1290	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 09:45:23.268089+00	c96730ff-e869-4f45-ac21-6c0bed49d579
1291	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 09:45:25.253286+00	2885815c-1181-4101-b473-54947e6cb33c
1293	Löken	Bilen låter konstigt när jag startar den.	2025-04-16 12:48:51.153302+00	626aa65f-8120-4eaa-8141-0ea2e8049b5b
1294	Löken	inget fungerar.	2025-04-16 12:48:52.353496+00	6b30d171-53d4-44c4-b598-1f17a6d55d83
1295	Löken	hjälp mig	2025-04-16 12:48:53.269782+00	7eb0bef0-6ed8-43d4-9f05-e24e3eb2dc9a
1297	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 12:52:04.903876+00	69f73f4e-9ca7-44f0-9fcd-ba7a7094fc17
1298	Martin	Jag vill ha en ny motor	2025-04-16 12:52:06.856964+00	fec253dd-da2d-44a9-b8b0-f676dc2af1e2
1299	Martin	Min räkning är dyr	2025-04-16 12:52:08.417417+00	f87eb64b-35d2-4e45-8c1f-dd500ca2ae80
1300	Martin	Tjena tjena	2025-04-16 12:52:10.044907+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1301	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 12:54:05.679846+00	71937460-08b5-4f0b-b67d-7516d7fadcec
1302	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 12:54:08.037254+00	2885815c-1181-4101-b473-54947e6cb33c
1303	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 12:58:20.458664+00	93c94091-6c23-4de6-885e-a5d4a664322c
1304	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 12:58:20.9106+00	2885815c-1181-4101-b473-54947e6cb33c
1305	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:00:04.793031+00	b67d7c77-e386-40f4-ad0d-bc0e09af1fb2
1306	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:00:05.120963+00	2885815c-1181-4101-b473-54947e6cb33c
1307	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 13:07:03.976619+00	e09504a8-a8f0-4e11-b64b-e5f9d83f6c7c
1308	Martin	Jag vill ha en ny motor	2025-04-16 13:07:05.844783+00	d85a0fbb-775b-4705-a4d2-e8a4b14203a0
1309	Martin	Min räkning är dyr	2025-04-16 13:07:07.089759+00	18bae3e4-fbd8-4acd-9d7e-991d2b9b191d
1310	Martin	Tjena tjena	2025-04-16 13:07:08.357733+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1311	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 13:16:13.968962+00	9cfb62cd-4d11-42e1-9ea7-bbf44a249f80
1312	Martin	Jag vill ha en ny motor	2025-04-16 13:16:15.161145+00	3c3ad78e-20a5-4a6b-946d-d85afb0fab59
1313	Martin	Min räkning är dyr	2025-04-16 13:16:16.115419+00	6700a650-c2e8-41ae-87b3-5bdbdd12b47f
1314	Martin	Tjena tjena	2025-04-16 13:16:17.103178+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1315	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:18:31.327648+00	c7596059-acf3-4d34-9104-f490d079aa2e
1316	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:18:34.131181+00	2885815c-1181-4101-b473-54947e6cb33c
1317	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 13:21:26.716427+00	f06ee9f4-ba57-4960-9459-f6e1de41e5ce
1318	Martin	Jag vill ha en ny motor	2025-04-16 13:21:28.620309+00	29f40e24-887e-4858-967e-9532bab3d9f8
1319	Martin	Min räkning är dyr	2025-04-16 13:21:30.280759+00	35543712-47c8-4b72-9861-975fdb46327f
1320	Martin	Tjena tjena	2025-04-16 13:21:32.196051+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1321	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:23:43.964798+00	d45b8460-16df-4007-8f9c-3dac974aeca5
1322	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:23:46.689859+00	2885815c-1181-4101-b473-54947e6cb33c
1323	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 13:26:08.728298+00	7426b0be-dfbd-4ccb-93a7-bfe37fbe08f5
1324	Martin	Jag vill ha en ny motor	2025-04-16 13:26:10.021283+00	6a902d89-bb49-4cdd-a767-141b134bb0d2
1325	Martin	Min räkning är dyr	2025-04-16 13:26:11.017282+00	f0b33cc8-a4ab-4c54-a8f3-57ea271ac197
1326	Martin	Tjena tjena	2025-04-16 13:26:12.038805+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1327	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:27:51.28054+00	4e37c1a3-d5a1-4f8d-8e43-356824a6ccbf
1328	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:27:53.4351+00	2885815c-1181-4101-b473-54947e6cb33c
1329	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 13:32:39.813699+00	3dee26ab-349b-4b86-b003-993e22059b97
1330	Martin	Jag vill ha en ny motor	2025-04-16 13:32:41.720207+00	649b0492-f187-4953-b606-81ec836ef9db
1331	Martin	Min räkning är dyr	2025-04-16 13:32:43.261341+00	f00fd5c9-d234-4d6c-88be-db6f4ad3a91c
1332	Martin	Tjena tjena	2025-04-16 13:32:44.819218+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1333	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:35:05.110283+00	a97fcd87-bed2-47be-9157-fe433e579f48
1334	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:35:07.344942+00	2885815c-1181-4101-b473-54947e6cb33c
1335	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 13:37:11.565701+00	2885815c-1181-4101-b473-54947e6cb33c
1336	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 13:37:12.535229+00	e33df813-8cf9-4410-b071-a36dac601e18
1337	TestKund	Testar ett formulär för teleärenden	2025-04-16 13:42:55.144148+00	0b521eed-ff49-4938-aae4-dafea2ee417e
1338	TestKund	Testar ett formulär för fordonsärenden	2025-04-16 13:42:57.281829+00	3fa07a52-e018-4d41-828e-61a7d2525390
1339	TestKund	Testar ett formulär för försäkringsärenden	2025-04-16 13:42:58.480013+00	780d48f5-bf42-4f66-9d06-14e9c3f16327
1340	KevinAdmin	Detta är ett testmeddelande	2025-04-16 13:43:01.114264+00	0b521eed-ff49-4938-aae4-dafea2ee417e
1341	TestKund	Testar ett formulär för teleärenden	2025-04-16 13:46:37.919317+00	8da45d66-cb3c-4e88-962d-bafeb49f599f
1342	TestKund	Testar ett formulär för fordonsärenden	2025-04-16 13:46:40.085906+00	2512c058-4347-40f9-83d5-29e1917254b3
1343	TestKund	Testar ett formulär för försäkringsärenden	2025-04-16 13:46:41.263904+00	92a3b1c2-0ddb-453b-9ada-1bd5b1dd5fc9
1344	KevinAdmin	Detta är ett testmeddelande	2025-04-16 13:46:44.923777+00	8da45d66-cb3c-4e88-962d-bafeb49f599f
1345	Ville	Jag behöver hjälp nu.	2025-04-16 14:05:13.838726+00	7e30bb34-e149-4052-a53b-a1da49a81b8c
1346	Ville	Jag behöver hjälp nu.	2025-04-16 14:05:20.076732+00	bcea26dc-0a73-4d54-8e6b-ae12d71029a3
1347	TestKund	Testar ett formulär för teleärenden	2025-04-16 14:07:37.55709+00	a25b5f1c-2f83-49ca-bc28-c464fdb43867
1348	TestKund	Testar ett formulär för fordonsärenden	2025-04-16 14:07:39.897629+00	272e7eb7-09b8-46e0-b89a-f55a441fedae
1349	TestKund	Testar ett formulär för försäkringsärenden	2025-04-16 14:07:41.15305+00	d301e899-da4d-41e1-a845-c1f0b34506bd
1350	KevinAdmin	Detta är ett testmeddelande	2025-04-16 14:07:42.885079+00	a25b5f1c-2f83-49ca-bc28-c464fdb43867
1351	TestKund	Testar ett formulär för teleärenden	2025-04-16 14:07:56.556496+00	f1354356-62fd-4fcc-a357-0163adeeaee3
1352	TestKund	Testar ett formulär för fordonsärenden	2025-04-16 14:07:58.060406+00	f2d8ba8d-3909-42bb-bf41-8bcd94117c7a
1353	TestKund	Testar ett formulär för försäkringsärenden	2025-04-16 14:08:00.195288+00	41867b3f-989a-4725-bfcd-6c4689e3bd64
1354	KevinAdmin	Detta är ett testmeddelande	2025-04-16 14:08:03.100803+00	f1354356-62fd-4fcc-a357-0163adeeaee3
1355	Ville	Jag behöver hjälp nu.	2025-04-16 14:11:38.181133+00	b09b483b-b231-48ab-b57d-4c0137248765
1356	Ville	Jag behöver hjälp nu.	2025-04-16 14:11:44.423323+00	2e76d6dd-805c-4a21-b62d-de6566fcabf3
1357	Ville	Jag behöver hjälp nu.	2025-04-16 14:29:04.433665+00	510c40b8-9f44-4e3b-b65b-6c74c91d5e52
1358	Ville	Jag behöver hjälp nu.	2025-04-16 14:29:15.497909+00	7589b722-23dc-4ae2-8287-d16a264be2bb
1359	Ville	Jag behöver hjälp nu.	2025-04-16 14:31:35.378983+00	d394a9c5-b8e6-4308-a985-bad512796cfc
1360	Ville	Jag behöver hjälp nu.	2025-04-16 14:31:46.546535+00	80e5465b-e98c-4355-a434-d849c942798a
1361	Ville	Jag behöver hjälp nu.	2025-04-16 14:35:48.933616+00	fcd7aeea-5b15-4905-a68b-bb79cc09b4df
1362	Ville	Jag behöver hjälp nu.	2025-04-16 14:36:01.080123+00	a2a12440-8be1-4468-9864-f786df2a88eb
1363	Ville	Jag behöver hjälp nu.	2025-04-16 14:37:34.666095+00	b48fa385-414f-4268-b338-d67043a16ca8
1364	Ville	Jag behöver hjälp nu.	2025-04-16 14:37:44.847204+00	67357223-a7fa-494f-9d6b-77b8f8c68df5
1365	Ville	Jag behöver hjälp nu.	2025-04-16 14:52:32.360534+00	89deaf0a-5c89-410d-9ddf-47c96b15bfc2
1366	TestKund	Testar ett formulär för teleärenden	2025-04-16 14:58:04.334962+00	aaf5407c-da31-4257-bb34-5f039905a5c6
1367	Ville	Jag behöver hjälp nu.	2025-04-16 14:58:32.222094+00	a5f8257e-d3d6-40fd-a4c3-226c80b9e32a
1368	Ville	Jag behöver hjälp nu.	2025-04-16 14:58:42.109311+00	5f09c5c3-d10c-4696-804b-3dd9a2bf8129
1369	Ville	Jag behöver hjälp nu.	2025-04-16 15:04:19.743637+00	e27bd309-f94f-4a99-9d3b-005d8d43567b
1370	Ville	Jag behöver hjälp nu.	2025-04-16 15:04:27.22244+00	a8f0fe40-5cc6-4531-9730-b35a15bf6f30
1371	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:15:08.520793+00	20cf8c6c-a0e2-4a5e-8537-0b5d4a589a93
1372	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:15:08.731945+00	2885815c-1181-4101-b473-54947e6cb33c
1373	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:16:58.999284+00	2885815c-1181-4101-b473-54947e6cb33c
1374	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:16:59.1363+00	591319d4-e564-4700-af07-438a965c9279
1375	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:19:05.971565+00	bcbcde71-81cd-49bb-8fdb-c876069c1abc
1376	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:21:07.627049+00	b8be98e9-37b3-44ac-b060-2af92d50aaf7
1377	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:24:10.260061+00	f791352e-a64d-4797-a125-6bc51f193de5
1378	Ville	Jag behöver hjälp nu.	2025-04-16 15:34:04.617742+00	63041bfe-a366-48a7-8667-a536b6c97d24
1379	Ville	Jag behöver hjälp nu.	2025-04-16 15:34:10.757082+00	7dae37fd-b5e2-47c1-b406-362bbd8ad684
1380	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:35:41.802686+00	4f50b612-dfc2-44e2-9bcb-07fece123160
1381	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:35:42.065929+00	2885815c-1181-4101-b473-54947e6cb33c
1382	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:36:24.447982+00	2885815c-1181-4101-b473-54947e6cb33c
1383	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:36:24.533343+00	feb91191-766c-4737-ba3a-b45aa6778b40
1384	Ville	Jag behöver hjälp nu.	2025-04-16 15:42:23.448942+00	43ef15bd-3fe7-4362-8dd5-bbe10bb33378
1385	Ville	Jag behöver hjälp nu.	2025-04-16 15:42:29.143486+00	f6c6e8c8-5412-40ee-bb7b-102f62d3e9cc
1386	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:43:56.771411+00	131eabb0-1d5f-4d7c-8198-bb60bd4e5242
1387	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:43:56.965351+00	2885815c-1181-4101-b473-54947e6cb33c
1388	Martin	Jag vill ha hjälp med fast telefoni	2025-04-16 15:45:56.692674+00	08db0c4a-e017-4a80-9ee7-3136e0c5c958
1389	Martin	Jag vill ha en ny motor	2025-04-16 15:45:58.161086+00	21490c2c-f213-4d4b-a75b-0a49a5f96382
1390	Martin	Min räkning är dyr	2025-04-16 15:45:59.401185+00	bcd0e6a9-0e16-4dd3-bd75-853a4b36dcb8
1391	Martin	Tjena tjena	2025-04-16 15:46:00.586884+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1392	John Doe	Hej, jag har en fråga om min beställning.	2025-04-16 15:48:19.818161+00	34e0484b-98a9-444a-910a-3921be321b5f
1393	zunken123	Vad kan jag hjälpa dig med?	2025-04-16 15:48:21.605007+00	2885815c-1181-4101-b473-54947e6cb33c
1394	zunken123	Vad kan jag hjälpa dig med?	2025-04-17 08:02:49.088453+00	2885815c-1181-4101-b473-54947e6cb33c
1395	John Doe	Hej, jag har en fråga om min beställning.	2025-04-17 08:02:49.33989+00	8afdaea4-3582-41db-a22f-89a1f8cb2c10
1396	Ville	Jag behöver hjälp nu.	2025-04-17 08:07:59.896465+00	f98e4f92-1d9d-4fa6-995b-27cadd0eb2b1
1397	Ville	Jag behöver hjälp nu.	2025-04-17 08:08:08.908097+00	aac12295-17c6-4b57-8df7-30a76da03205
1398	zunken123	Vad kan jag hjälpa dig med?	2025-04-17 08:10:00.792322+00	2885815c-1181-4101-b473-54947e6cb33c
1399	John Doe	Hej, jag har en fråga om min beställning.	2025-04-17 08:10:01.215227+00	ccce58c8-c4a1-4d13-923a-9a232fd3075b
1400	John Doe	Hej, jag har en fråga om min beställning.	2025-04-17 08:10:59.704987+00	cd870515-5179-4a94-9dff-ef8d53dbaf93
1401	zunken123	Vad kan jag hjälpa dig med?	2025-04-17 08:10:59.759162+00	2885815c-1181-4101-b473-54947e6cb33c
1402	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-17 09:19:32.831733+00	8fed0251-4c57-4737-9254-4ffac18635d0
1403	Admino	This is a test response from admin	2025-04-17 09:19:40.005019+00	2885815c-1181-4101-b473-54947e6cb33c
1404	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-17 09:21:10.290199+00	92291e3d-bba5-4047-a05e-72a42d79140b
1405	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-17 09:21:46.064591+00	ed58c61f-6eaa-4c8e-b590-9bd6266f9313
1407	Ville	Jag behöver hjälp nu.	2025-04-17 10:18:55.306861+00	8685b377-7a7d-46c8-8abf-91ee94b0de11
1408	Ville	Jag behöver hjälp nu.	2025-04-17 10:19:06.271189+00	4cd831e0-7691-4916-bdd6-1cc269685c0b
1409	Ville	Jag behöver hjälp nu.	2025-04-17 10:22:11.284495+00	caf9fb82-f9a3-40b2-8226-e9e4db365c6d
1410	Ville	Jag behöver hjälp nu.	2025-04-17 10:22:17.385288+00	925f3686-4f93-42ee-8668-e36a3bb728a0
1411	TestKund	Testar ett formulär för teleärenden	2025-04-17 10:40:40.906882+00	4f0b95b3-2897-4001-b63b-6ceb2a78dc05
1412	TestKund	Testar ett formulär för fordonsärenden	2025-04-17 10:40:44.025288+00	e395aaea-d069-408a-8ed3-2f6ea9e485c4
1413	TestKund	Testar ett formulär för försäkringsärenden	2025-04-17 10:40:45.433398+00	ee252392-50f5-41c6-a89e-b7a3fe6adf2d
1414	KevinTest	Detta är ett testmeddelande	2025-04-17 10:40:49.419984+00	4f0b95b3-2897-4001-b63b-6ceb2a78dc05
1415	John Doe	Hej, jag har en fråga om min beställning.	2025-04-17 10:42:45.245654+00	bac9d419-90eb-4f9f-9849-857feeaa7031
1416	zunken123	Vad kan jag hjälpa dig med?	2025-04-17 10:42:45.436661+00	2885815c-1181-4101-b473-54947e6cb33c
1417	Martin	Jag vill ha hjälp med fast telefoni	2025-04-17 10:44:05.884504+00	f68903b1-4253-475b-85cd-69d4adf081e0
1418	Martin	Jag vill ha en ny motor	2025-04-17 10:44:07.120277+00	d22e40df-31e4-43b4-8db0-fc823f82b7a8
1419	Martin	Min räkning är dyr	2025-04-17 10:44:08.043774+00	288a8cb4-4782-4151-9a60-07567daf606f
1420	Martin	Tjena tjena	2025-04-17 10:44:08.931841+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1421	John Doe	Hej, jag har en fråga om min beställning.	2025-04-17 10:46:02.358039+00	168e0c3e-eef6-4775-acc6-5d252d8987df
1422	zunken123	Vad kan jag hjälpa dig med?	2025-04-17 10:46:04.886478+00	2885815c-1181-4101-b473-54947e6cb33c
1423	Ville	Jag behöver hjälp nu.	2025-04-17 10:56:23.639884+00	4634eb5f-150e-4047-9ee7-7b2c660050e3
1424	Ville	Jag behöver hjälp nu.	2025-04-17 10:56:30.2068+00	126830a3-9514-4d47-b0ad-81a3d6ef2258
1425	Ville	Jag behöver hjälp nu.	2025-04-17 11:00:30.698482+00	b680990f-aac3-4b3f-a31a-6eb2f47b0561
1426	Ville	Jag behöver hjälp nu.	2025-04-17 11:00:37.853194+00	f0f25c87-6a90-4950-9749-fc7fbac39d07
1427	Ville	Jag behöver hjälp nu.	2025-04-18 12:23:29.783105+00	eb561b3e-6f89-4f89-821a-fef29875e57c
1428	Ville	Jag behöver hjälp nu.	2025-04-18 12:23:36.107443+00	9477e95e-3e8d-4cc0-a15a-1f8beda84993
1429	Ville	Jag behöver hjälp nu.	2025-04-18 12:31:17.763151+00	328343ee-22c8-472c-8978-50bf676f40e2
1430	Ville	Jag behöver hjälp nu.	2025-04-18 12:31:25.421417+00	d3bef903-84a9-451b-9cbb-f9cb3a67d5ac
1431	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 13:47:24.626778+00	8db21426-0427-46ec-b054-c1859288a557
1432	Martin	Jag vill ha en ny motor	2025-04-18 13:47:25.978912+00	c6879abd-767b-498a-bf8f-66d1e518c090
1433	Martin	Min räkning är dyr	2025-04-18 13:47:26.933831+00	320470cc-af54-4e91-a5f5-4e80345e1ded
1434	Martin	Tjena tjena	2025-04-18 13:47:27.831565+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1435	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 13:49:30.487388+00	26d2dc3f-8ae4-47ea-8c62-ebc53d729272
1436	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 13:49:32.766799+00	2885815c-1181-4101-b473-54947e6cb33c
1437	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 13:50:02.944524+00	35ee80a2-6782-4222-a548-e8f6cfc99e8c
1438	Martin	Jag vill ha en ny motor	2025-04-18 13:50:04.42576+00	d7000d86-4371-4230-a066-19caabf81bf7
1439	Martin	Min räkning är dyr	2025-04-18 13:50:05.579267+00	0ed45038-a8fb-48c2-abf0-530e6d1d681e
1440	Martin	Tjena tjena	2025-04-18 13:50:06.828208+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1441	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 13:51:52.15151+00	384ead25-7885-4058-aa54-f97616c71c98
1442	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 13:51:52.971641+00	6ef3debf-397f-4c79-bd32-d7025282a12e
1443	Martin	Jag vill ha en ny motor	2025-04-18 13:51:53.974194+00	2c4b4d1e-3e6a-439a-8586-9a7dcb2ccd16
1444	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 13:51:55.074726+00	2885815c-1181-4101-b473-54947e6cb33c
1445	Martin	Min räkning är dyr	2025-04-18 13:51:55.62323+00	6ce106ea-731c-481e-b0e4-d669e9723385
1446	Martin	Tjena tjena	2025-04-18 13:51:57.264273+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1447	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 13:52:42.093576+00	bb55b1b8-e013-481b-95a0-6f22cb2e7ac8
1448	Martin	Jag vill ha en ny motor	2025-04-18 13:52:43.275027+00	9a6fdfcd-c06d-4d46-816f-200edab99c39
1449	Martin	Min räkning är dyr	2025-04-18 13:52:44.334522+00	693461d6-71bc-4ef3-a5de-d7a4bf648b6d
1450	Martin	Tjena tjena	2025-04-18 13:52:45.261359+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1451	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 13:53:49.994417+00	38ac4283-30f2-4dcd-b81b-ae2ca2c72249
1452	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 13:53:51.734221+00	2885815c-1181-4101-b473-54947e6cb33c
1453	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 13:54:21.58111+00	e5581436-eb10-4a93-8933-6e9007552f47
1454	Martin	Jag vill ha en ny motor	2025-04-18 13:54:23.019896+00	99b72fa8-51a9-45dd-a4cb-066d4aa2f81b
1455	Martin	Min räkning är dyr	2025-04-18 13:54:24.03623+00	72cdf60e-40a3-4b33-a3b8-b262e332873f
1456	Martin	Tjena tjena	2025-04-18 13:54:25.100922+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1457	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 13:54:27.572226+00	eaffc021-089e-40e0-afcd-604619e4824d
1458	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 13:54:29.518259+00	2885815c-1181-4101-b473-54947e6cb33c
1459	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 13:57:32.11985+00	b05b9cc7-b40d-42be-b350-8c3b70652e1c
1460	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 13:57:34.510157+00	2885815c-1181-4101-b473-54947e6cb33c
1461	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 14:07:38.860205+00	22f4cc6d-b4a3-437d-8a6e-7276ed1aab53
1462	Martin	Jag vill ha en ny motor	2025-04-18 14:07:40.310573+00	365179a2-999a-4693-8c3c-16811abbd4aa
1463	Martin	Min räkning är dyr	2025-04-18 14:07:41.268575+00	45d8f3f8-3dfa-4052-ace1-1b9a52a394ca
1464	Martin	Tjena tjena	2025-04-18 14:07:42.186618+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1465	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 14:08:11.084942+00	4d6fa8db-6b45-4656-ad8d-02c8a0a3b8b5
1466	Martin	Jag vill ha en ny motor	2025-04-18 14:08:12.570481+00	22e2be95-ef34-426c-b3b7-89afde9dc2b6
1467	Martin	Min räkning är dyr	2025-04-18 14:08:13.755279+00	a7e26b4b-a1d6-46ef-91ba-6eb6cf61c866
1468	Martin	Tjena tjena	2025-04-18 14:08:15.080299+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1469	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 14:08:32.888643+00	d57c28fa-4697-4a8f-a4f0-c0a659e3c08d
1470	Martin	Jag vill ha en ny motor	2025-04-18 14:08:34.77165+00	e61ec6d3-a8f8-4699-9090-7038a3cab843
1471	Martin	Min räkning är dyr	2025-04-18 14:08:36.254268+00	c09003b0-9c1f-4cb3-ab94-0576063ab2e1
1472	Martin	Tjena tjena	2025-04-18 14:08:37.949937+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
1473	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 14:09:45.94813+00	11cf768b-106e-4fb5-a868-e98948ee2a71
1474	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 14:09:48.914707+00	2885815c-1181-4101-b473-54947e6cb33c
1475	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 14:10:18.971518+00	8b37f144-b384-434e-ab6f-0140e06f50c6
1476	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 14:10:21.648191+00	2885815c-1181-4101-b473-54947e6cb33c
1477	John Doe	Hej, jag har en fråga om min beställning.	2025-04-18 14:10:33.058404+00	1addd5e8-7f71-4e2a-8a03-e4f925c1d19f
1478	zunken123	Vad kan jag hjälpa dig med?	2025-04-18 14:10:35.408264+00	2885815c-1181-4101-b473-54947e6cb33c
1479	Martin	Jag vill ha hjälp med fast telefoni	2025-04-18 14:10:35.556744+00	715faf8f-5137-400d-9a7c-a3c0e5fd29e7
1480	Martin	Jag vill ha en ny motor	2025-04-18 14:10:36.867161+00	5d5f14f0-cd32-493e-94fb-5eda31f851a0
1481	Martin	Min räkning är dyr	2025-04-18 14:10:37.863914+00	bb9c4261-d643-43c4-8512-43fcdaa6b9bd
1482	Martin	Tjena tjena	2025-04-18 14:10:38.886382+00	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
\.


--
-- Data for Name: chat_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_ratings (id, chat_token, rating, feedback, submitted_at) FROM stdin;
7	04e093b4-9721-480d-b68b-c877a9034a36	4		2025-03-17 10:32:00.321506
\.


--
-- Data for Name: dynamicforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dynamicforms (id, formtype, firstname, companytype, email, fields, message, chattoken, submittedat, ischatactive) FROM stdin;
\.


--
-- Data for Name: fordon_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fordon_forms ("Id", first_name, email, reg_nummer, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
124	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	2885815c-1181-4101-b473-54947e6cb33c	2025-04-09 12:24:08.271147+00	t	Fordonsservice
125	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	41b2aec6-8b03-4b2f-b2e5-307c30ab9a29	2025-04-09 13:30:16.740616+00	t	Fordonsservice
29	Löken	löken.test@gmail.com	ABC123	Garantiärende	Bilen låter konstigt när jag startar den.	a611bb74-5a8d-4e13-b20b-a942d4f0a790	2025-04-07 08:24:39.237714+00	t	Fordonsservice
2	test3	shaabaan_@hotmail.com	152	Problem efter reparation	test	2a9924d3-fb94-4fcc-ac75-86740a259673	2025-03-11 09:38:59.915701+00	f	Fordonsservice
1	Kajsa	shaabaan_@hotmail.com	ges125	Garantiärende	Min motor har lagt av	8f18cf90-57c1-4e4c-bd85-370bc07428e1	2025-03-07 12:39:55.027154+00	f	Fordonsservice
4	Ville	ville.eliasson99@gmail.com	asd123	Problem efter reparation	sdf	a2b3603d-a110-432d-ae24-21c1923f6a1a	2025-03-12 08:51:14.293023+00	f	Fordonsservice
3	Ville	ville.eliasson99@gmail.com	asd123	Garantiärende	test2	51cedfa1-83b4-46ab-9a61-32671be6d84d	2025-03-11 12:59:41.056198+00	f	Fordonsservice
5	testing	staff@mail.com	abc123	Problem efter reparation	123	4578ad10-3f90-45e5-83be-e6dab9468710	2025-03-13 14:07:19.675215+00	f	Fordonsservice
6	testing	testing8@gmail.com	abc123	Problem efter reparation	321	fe177498-183d-4391-9c80-c62e9afeffdf	2025-03-13 14:23:21.867761+00	f	Fordonsservice
7	Admino	nystrom.sigge1@gmail.com	kkk888	Reklamation	hjälp	04e093b4-9721-480d-b68b-c877a9034a36	2025-03-13 14:28:28.165661+00	f	Fordonsservice
8	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	732038c4-7238-465b-8519-ef108df59080	2025-04-04 08:31:03.2023+00	t	Fordonsservice
126	Test Person	test@example.com	ABC123	Garantiärende	This is a test.	9dd8f864-1a1a-44ff-9bd8-85c7c423b8b3	2025-04-09 13:57:50.879311+00	t	Fordonsservice
127	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	6f1e0853-7b76-4fd1-9197-8d4db474fa32	2025-04-09 14:18:56.896928+00	t	Fordonsservice
128	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	bb0c1fec-0662-44d1-8b9e-6704e5eed8af	2025-04-09 14:23:56.10002+00	t	Fordonsservice
129	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	cdf1a8c1-e375-4327-aeee-2ed2bd308c9c	2025-04-09 14:24:37.318148+00	t	Fordonsservice
130	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	5b3f8d97-abe9-4032-8832-fc098985059f	2025-04-09 14:31:36.641538+00	t	Fordonsservice
131	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	5feefac1-cbec-4680-bdde-cf6504676800	2025-04-09 14:39:24.240696+00	t	Fordonsservice
132	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	82813b6e-4b7e-4cf8-a740-8868b1dfe4f9	2025-04-09 14:57:43.18137+00	t	Fordonsservice
133	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	4249daa6-8eff-42f1-898c-4124b82202be	2025-04-09 15:01:36.656458+00	t	Fordonsservice
134	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	bc6b65af-e0a6-4a6e-b4ab-c6baf6b620af	2025-04-09 15:06:21.55945+00	t	Fordonsservice
135	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	9ff6ef23-51e0-41de-9583-8a2b1fe330d7	2025-04-10 08:52:43.665237+00	t	Fordonsservice
136	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	9722822b-54d9-40a7-aa2b-5955cef97986	2025-04-10 09:03:22.712373+00	t	Fordonsservice
137	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	0ff7627d-0ee7-4329-8ca5-3b23e13905ba	2025-04-10 09:08:38.538806+00	t	Fordonsservice
138	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	7b282102-87fa-4234-8dec-4e49550f335f	2025-04-10 12:27:41.190365+00	t	Fordonsservice
139	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	5a8683cb-3ef3-4cff-bf5c-78f2a649eb6c	2025-04-10 13:01:51.742664+00	t	Fordonsservice
140	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	db1898fc-2a2b-40c9-8291-426bc5f48842	2025-04-10 18:42:29.705095+00	t	Fordonsservice
141	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	939fa3f4-8812-4f34-ac60-61120eb246d6	2025-04-10 18:49:51.338668+00	t	Fordonsservice
142	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	752d59ed-2d8f-4f93-b9c6-dbf17a1fda95	2025-04-10 18:57:21.670217+00	t	Fordonsservice
143	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	ea7bbafa-bb6e-42e0-a4ab-947d6d03c128	2025-04-11 11:43:51.69949+00	t	Fordonsservice
36	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	fccc7f71-76a2-45d7-9f5b-31bf1fb01ee8	2025-04-07 11:07:37.472407+00	t	Fordonsservice
144	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6424cbf5-a46d-4fe7-88e4-7e6f016a9008	2025-04-11 11:48:58.247639+00	t	Fordonsservice
145	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	8ac92ae1-bdfb-4433-abc3-ca02a4aa59cc	2025-04-11 11:54:50.211282+00	t	Fordonsservice
146	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	7b14ce86-acd6-4d64-9174-0fbb09cdff18	2025-04-11 11:59:37.711326+00	t	Fordonsservice
147	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	1d7270ee-2537-403c-a34b-d040407a7b30	2025-04-11 12:04:38.733191+00	t	Fordonsservice
148	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	01c75983-d066-4fce-88bf-38f542e7ba5a	2025-04-11 12:38:44.921621+00	t	Fordonsservice
149	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	a357fa4e-a460-47bf-b7d7-bf9728080a7d	2025-04-11 12:46:45.503194+00	t	Fordonsservice
150	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	365e8072-c21b-4f52-ab2b-39de1033455c	2025-04-11 13:05:13.131759+00	t	Fordonsservice
151	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	402f2a17-e7e2-4db0-8900-dc1473ed258e	2025-04-11 13:08:14.355471+00	t	Fordonsservice
152	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	012ef1a2-e354-4f19-9887-8b933bf06d5a	2025-04-11 13:10:40.92007+00	t	Fordonsservice
153	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	585dc463-eb07-41c4-82df-48866a54d982	2025-04-11 13:17:45.315898+00	t	Fordonsservice
214	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	a7b62115-737b-4507-9e1c-aab661e3d620	2025-04-14 10:36:44.66292+00	t	Fordonsservice
154	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	75c80531-2827-4f2e-9217-8095b317c7f4	2025-04-11 13:18:38.26159+00	t	Fordonsservice
155	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	caca2ea9-03dd-4458-a296-87541a64e6fe	2025-04-11 13:19:25.481816+00	t	Fordonsservice
156	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	17d73bfe-dd2c-4168-a01c-7c4919d63bd5	2025-04-11 13:20:33.983919+00	t	Fordonsservice
157	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	e76cd34b-0b0a-46e7-98bb-dd9106b8a0a3	2025-04-11 13:21:40.508485+00	t	Fordonsservice
158	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	b6f08f15-0c8b-4069-be29-5f5804977e58	2025-04-11 13:25:07.949609+00	t	Fordonsservice
159	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	76b2170f-f309-4c31-8f19-391d45699a33	2025-04-11 13:28:59.985499+00	t	Fordonsservice
160	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	40c78720-5485-4bb1-b1ce-1d84ebfd072f	2025-04-11 13:30:12.882634+00	t	Fordonsservice
161	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	a22d3014-94db-4f9d-a89e-74e3c5c2d3ae	2025-04-11 13:38:12.938791+00	t	Fordonsservice
162	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	4eef97dd-139c-4e38-8c6f-010a87175a5f	2025-04-11 13:50:15.198716+00	t	Fordonsservice
163	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	679f3911-847e-458f-9b27-a1cd024c9601	2025-04-11 14:01:05.414909+00	t	Fordonsservice
164	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	6bc34be1-b5f6-4ddf-bea0-c725fcee646d	2025-04-11 14:05:15.750768+00	t	Fordonsservice
165	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	414f12fa-ebac-42eb-8608-0a843bf1a79e	2025-04-11 14:06:00.762297+00	t	Fordonsservice
166	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	de7d5570-5518-42e3-b0b1-46c81f7c41ad	2025-04-11 14:07:26.339023+00	t	Fordonsservice
167	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	076a8adb-e7e0-4417-921a-d0b30b14de03	2025-04-11 14:08:10.0417+00	t	Fordonsservice
168	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	9e947c3d-945d-4e42-a3d8-5613a8a00f41	2025-04-11 14:08:53.268425+00	t	Fordonsservice
169	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	c9f9c80f-760e-43d5-a3df-41cea84996e7	2025-04-13 10:20:25.875979+00	t	Fordonsservice
170	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6a3590dd-5b0c-4837-9504-3279781c9e20	2025-04-13 10:25:37.908046+00	t	Fordonsservice
171	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	ae770642-4cc1-4072-a24a-c21308fb63ca	2025-04-13 10:33:48.243138+00	t	Fordonsservice
172	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	d9e2582f-9737-4864-b43f-2c5d18489628	2025-04-13 10:37:56.672666+00	t	Fordonsservice
173	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	89eb80bb-1e86-4320-9cc5-6ad282ffb616	2025-04-13 12:36:26.286617+00	t	Fordonsservice
174	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	9710ddd7-590a-4a06-8781-5ec625ef559d	2025-04-13 12:51:45.177391+00	t	Fordonsservice
175	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	dfa8e792-6123-4f11-878e-0b6a069d7003	2025-04-13 12:56:03.542113+00	t	Fordonsservice
176	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	2ca17077-d560-4698-83b3-5b49ae2d55f3	2025-04-13 12:58:36.061259+00	t	Fordonsservice
177	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6c719799-25f9-4c45-8453-61eea34746d7	2025-04-13 14:23:03.42331+00	t	Fordonsservice
178	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6fb19e3b-b0f3-4373-b6e7-8a9189173067	2025-04-13 14:24:07.835629+00	t	Fordonsservice
179	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	46d30a5e-895d-4935-9f32-d763699c2064	2025-04-13 14:25:39.430364+00	t	Fordonsservice
180	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	b2059d1f-96b9-4edb-a803-dbef898f9b2f	2025-04-13 14:34:06.062703+00	t	Fordonsservice
181	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	dca844a4-c72b-4788-99ac-63001c57266e	2025-04-13 14:34:45.610928+00	t	Fordonsservice
182	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	c1ae33e2-2e22-410a-917e-53f8ba2ec811	2025-04-13 14:36:31.63841+00	t	Fordonsservice
183	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	3aca05f1-915a-4ae7-bf5e-3cf819ff13d1	2025-04-13 14:39:32.29763+00	t	Fordonsservice
184	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	06d3fa95-acf7-47cc-b8e3-c83d87d29e0a	2025-04-13 14:42:30.95571+00	t	Fordonsservice
185	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	2904c597-8a1d-43d8-a0cc-32d60613c0e0	2025-04-13 14:50:23.690263+00	t	Fordonsservice
186	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	ca833958-e5fe-40fc-864b-8f700b0a2a5e	2025-04-13 14:52:56.462652+00	t	Fordonsservice
187	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	48025210-f661-4cbd-84e6-3f2c2e8df6b2	2025-04-13 15:04:00.478046+00	t	Fordonsservice
188	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	cd1adcd6-d193-41b7-a11c-154d6fce411c	2025-04-13 15:06:37.168727+00	t	Fordonsservice
189	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	59e35ace-9fd1-4955-b4de-901530a5320e	2025-04-13 15:10:16.169023+00	t	Fordonsservice
190	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	86676260-f38e-422a-8991-d0a7e22cbd73	2025-04-13 15:12:19.34636+00	t	Fordonsservice
191	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f03b1db0-b90b-47a6-807a-7438dd6790ee	2025-04-13 15:14:12.135754+00	t	Fordonsservice
192	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	a11fa8c3-8562-4cf7-a5d1-9a36afcfa1d2	2025-04-13 15:16:05.381216+00	t	Fordonsservice
193	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	9d75e912-3bb7-4fb1-8538-5c3fdca48116	2025-04-13 15:17:46.595212+00	t	Fordonsservice
194	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	de3a1c78-8971-4eed-af01-8e504ba578a4	2025-04-13 15:21:38.091646+00	t	Fordonsservice
195	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	cb133408-7f40-4f2b-91f5-31b367c0d92f	2025-04-13 15:23:37.302437+00	t	Fordonsservice
196	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	54e77388-fb7e-4d23-83d2-68bdb51467f8	2025-04-13 15:28:11.653512+00	t	Fordonsservice
210	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	d4e82f39-f869-4ad6-9d8e-0ac6f259dc2c	2025-04-14 10:27:39.176293+00	t	Fordonsservice
197	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	ad25cdf5-bf27-49dd-81fe-f5ecd55c6d67	2025-04-13 15:32:37.116092+00	t	Fordonsservice
198	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	19fa497a-b40e-4979-a94a-cdeadaae8bcd	2025-04-14 09:09:14.902435+00	t	Fordonsservice
199	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	7d932bfd-eb54-44be-9473-320a0b34d24d	2025-04-14 09:11:27.399544+00	t	Fordonsservice
200	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6d37f258-8d12-4195-83ab-0037e28d18ac	2025-04-14 09:13:54.042177+00	t	Fordonsservice
201	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	8e50e235-e79e-4117-9092-26d2e0cd7a07	2025-04-14 09:17:12.789995+00	t	Fordonsservice
202	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	1d01bc88-a238-42eb-aa3c-d3a306c107ed	2025-04-14 09:19:30.33269+00	t	Fordonsservice
203	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	3573d3e8-187d-4eaf-8c63-aa24f6767fb8	2025-04-14 09:29:49.894052+00	t	Fordonsservice
204	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	1bd2bce4-3951-4e3f-bb1f-5008d0026b49	2025-04-14 09:33:18.641799+00	t	Fordonsservice
205	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	dc632c32-79aa-444a-afcb-1195c7024490	2025-04-14 09:34:26.881375+00	t	Fordonsservice
206	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6597e4e7-4495-4a90-9bf1-40b951caaf4a	2025-04-14 09:35:26.884974+00	t	Fordonsservice
207	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	268a4c83-f029-42e8-ab3f-b5600af583ba	2025-04-14 10:13:37.717279+00	t	Fordonsservice
208	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	175b3760-6242-4fc1-94d2-ee0cee404bdf	2025-04-14 10:15:27.743462+00	t	Fordonsservice
209	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	cba16f39-a26e-4233-879a-eeaabde7263b	2025-04-14 10:27:31.89612+00	t	Fordonsservice
211	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	194e26a0-441f-4bbb-8b50-0dc404097b86	2025-04-14 10:28:31.474841+00	t	Fordonsservice
212	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	4735c846-6884-45d6-a87f-71ea33619d85	2025-04-14 10:29:54.442227+00	t	Fordonsservice
213	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f36280a2-056c-499a-a35f-5e3e19ae8dd3	2025-04-14 10:31:41.885757+00	t	Fordonsservice
215	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b8e9b8b5-9290-41f4-b8f6-4fe26503d8e0	2025-04-14 10:48:56.604711+00	t	Fordonsservice
216	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	77339a2a-eadc-4f68-9137-e53c5d7f5fc7	2025-04-14 10:55:47.383009+00	t	Fordonsservice
217	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	5229f53f-efe0-4f6e-a94b-db11253b4b04	2025-04-14 10:59:52.918616+00	t	Fordonsservice
218	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b9d1061a-47d4-4e09-a971-7ba852e48ef8	2025-04-14 11:03:41.922393+00	t	Fordonsservice
219	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	f5811b16-6442-4571-bbe5-fc8ae050d40d	2025-04-14 11:08:47.626412+00	t	Fordonsservice
220	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	3521e09c-5563-46ef-b35b-7f3bbda31503	2025-04-14 11:12:46.602523+00	t	Fordonsservice
221	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	e297b489-7d3f-4a94-acbc-fa6b6e313a1c	2025-04-14 11:18:08.828717+00	t	Fordonsservice
222	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	22229af8-ab08-4f71-b42d-e3797a93bcb7	2025-04-14 11:26:42.742326+00	t	Fordonsservice
223	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	6028931a-cb22-4a0f-820d-1f4d4972e2a6	2025-04-14 11:50:43.481062+00	t	Fordonsservice
224	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	fbf4c354-b102-4be6-9905-38eb67677405	2025-04-14 11:53:23.182998+00	t	Fordonsservice
225	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	8aedba61-5aa8-4e82-8a5d-9848bdee4f47	2025-04-14 13:13:32.312802+00	t	Fordonsservice
226	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	5f6388be-a5ab-48f2-a681-2d081668bda6	2025-04-14 13:18:10.138798+00	t	Fordonsservice
227	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	ae6a9a9e-c102-4924-ad5f-7e2edfaaf0d6	2025-04-14 13:28:08.64771+00	t	Fordonsservice
228	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b83934b2-f815-4201-8cf0-a9bb0e99cc48	2025-04-14 13:36:59.11275+00	t	Fordonsservice
229	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	e3d5dec2-ed8b-46c0-a561-3c443a5f557a	2025-04-14 13:37:15.115536+00	t	Fordonsservice
230	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	8a44ec99-69bf-454b-b8de-954d4b08fa66	2025-04-14 13:43:13.810714+00	t	Fordonsservice
231	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	c8ebaa31-5000-492d-a173-986a5682a3be	2025-04-14 14:00:49.517703+00	t	Fordonsservice
232	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	6f33807a-a1ef-484e-bf63-91084c99cfec	2025-04-14 14:01:41.223408+00	t	Fordonsservice
233	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	fb322629-a3ae-44d6-bb0d-58c00cce641c	2025-04-14 14:03:59.55165+00	t	Fordonsservice
234	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	8648fe49-1833-4709-8388-ac684e1c96df	2025-04-14 14:14:43.143759+00	t	Fordonsservice
235	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b15074d6-84ad-4f68-957d-79084aed61cd	2025-04-14 14:34:09.45645+00	t	Fordonsservice
236	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	68f09713-1f14-458c-b8d1-c97c9518509a	2025-04-14 14:42:00.452698+00	t	Fordonsservice
237	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	0251c4cd-a305-425f-a604-50d0b8258851	2025-04-14 14:53:40.868629+00	t	Fordonsservice
238	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	94bde62c-88e4-4ad8-867d-c36a505ba0e5	2025-04-14 15:02:58.357408+00	t	Fordonsservice
239	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	3a2f82e0-4709-457f-97af-9e918d7544db	2025-04-14 15:03:59.803261+00	t	Fordonsservice
240	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	2d282b20-01d1-4a3c-834f-d2b1aa65f5b4	2025-04-14 15:04:58.823338+00	t	Fordonsservice
241	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	694df02c-5ae3-41ad-a169-e276a7a76019	2025-04-14 15:06:04.984188+00	t	Fordonsservice
242	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	ef13277a-cb4c-48e9-b9e7-fba2bbaa21f0	2025-04-14 15:07:39.792849+00	t	Fordonsservice
243	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	379623fc-8794-4bd9-99ae-6310afaa4f9f	2025-04-14 15:09:43.662409+00	t	Fordonsservice
244	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	0286c704-baf7-4600-a659-61562ff78eae	2025-04-14 15:23:04.339219+00	t	Fordonsservice
245	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	213f1ebc-7ad3-405b-aaa8-e1b5a39ef64d	2025-04-14 15:37:28.095765+00	t	Fordonsservice
246	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	4a6a1e1e-1f23-4151-a765-96e95600c4a6	2025-04-14 16:16:20.358994+00	t	Fordonsservice
247	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	85238d72-d238-4e3e-a1d1-d0f77ed1a69d	2025-04-14 16:51:10.624001+00	t	Fordonsservice
248	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	ea9c13dc-dee7-47d7-b75a-58fab7941654	2025-04-14 16:52:15.204477+00	t	Fordonsservice
249	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	818a10ab-b247-4286-860b-30bc54b71ed9	2025-04-14 16:56:36.775987+00	t	Fordonsservice
250	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	a6896363-ca6b-4629-bc0c-51421b63303f	2025-04-14 17:00:48.811399+00	t	Fordonsservice
251	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	aa506a9b-15a0-4ac9-af82-4e8c0fe6b5b4	2025-04-14 17:02:53.504855+00	t	Fordonsservice
252	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	910b3b32-0188-46d1-99e0-906d8cb1d2bf	2025-04-14 17:07:42.215853+00	t	Fordonsservice
253	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	27a9c7a7-0707-41e6-b25d-4b53ed561e0c	2025-04-14 17:14:59.355748+00	t	Fordonsservice
254	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	0d218d28-3a0e-45dc-89b1-3148b3c3d92f	2025-04-14 17:15:56.032594+00	t	Fordonsservice
255	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	23fd2104-2acd-4700-9eaf-d65351ba2429	2025-04-14 17:19:34.34122+00	t	Fordonsservice
256	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	dbaabd75-8f08-4ace-9604-f8cbe5b42fea	2025-04-14 18:25:16.049615+00	t	Fordonsservice
257	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	c948d3db-9482-44d9-bd86-98bf757603c6	2025-04-14 18:28:21.954286+00	t	Fordonsservice
258	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	761facca-0b9c-41c7-aaac-c147d6df7eb4	2025-04-14 18:32:24.243297+00	t	Fordonsservice
259	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	63ddfdc4-646f-4639-8fe5-e5f3229ca7ea	2025-04-14 18:35:53.959593+00	t	Fordonsservice
260	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	c629352a-da83-45db-af27-86c2d32a3e13	2025-04-14 18:39:11.862094+00	t	Fordonsservice
261	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	c9f8487a-f6b4-46a5-a248-93f5fcb3e531	2025-04-14 18:42:40.706899+00	t	Fordonsservice
262	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	d2294b6c-bf0b-4d5d-a76a-45266f89b906	2025-04-14 18:44:43.803608+00	t	Fordonsservice
263	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f5e65335-f569-4e8b-abf7-d0c7ac53b2d3	2025-04-14 18:45:26.98838+00	t	Fordonsservice
264	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	5a502860-dd90-4e4a-abbf-181421605a10	2025-04-14 18:50:15.12464+00	t	Fordonsservice
265	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	760995d9-6b55-4698-92cf-5a0cb694a2c3	2025-04-14 19:04:43.30678+00	t	Fordonsservice
266	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	8f17dc67-8f18-44ab-b38c-c54b70d3c870	2025-04-14 19:08:27.546589+00	t	Fordonsservice
267	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	e31fc4e1-693a-4507-bbfe-7d013d2a5f75	2025-04-14 19:10:34.323538+00	t	Fordonsservice
268	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	76975213-9a38-4a6b-bfd0-022d6c986bf6	2025-04-14 19:13:02.105002+00	t	Fordonsservice
269	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	1621bb3d-5d37-406c-a6fd-1b5d34b3db6a	2025-04-14 19:14:16.982785+00	t	Fordonsservice
270	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	868341c6-cd6f-4480-aa83-d7a220886310	2025-04-14 19:24:45.925497+00	t	Fordonsservice
271	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f89858d1-69d1-4bcd-a758-0416a588a9fb	2025-04-14 19:27:21.892444+00	t	Fordonsservice
272	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	673d9f67-d94d-49ea-8ce3-a7e285ff257d	2025-04-14 19:33:46.698053+00	t	Fordonsservice
273	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	312b48f7-4e87-4b52-b6c4-171de63b6a89	2025-04-14 19:34:24.87393+00	t	Fordonsservice
274	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	12d99947-0243-49a3-8d0e-00b239c1e417	2025-04-14 19:36:12.734454+00	t	Fordonsservice
275	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	b099acf1-8600-446e-8fb8-7caad8134cc7	2025-04-14 19:37:22.574151+00	t	Fordonsservice
276	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	6f484cb2-1caa-4f59-b27c-536bb0b40cde	2025-04-14 19:52:10.189028+00	t	Fordonsservice
277	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	71d77bf3-f548-4286-944c-be9d0b0c5da5	2025-04-14 20:01:56.651487+00	t	Fordonsservice
278	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	2113bf0e-639e-47ce-9fd0-3c8f61b1a53e	2025-04-14 20:02:03.986509+00	t	Fordonsservice
279	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	3e3495e2-12a7-410f-86d5-fcc086b511dc	2025-04-14 20:07:56.414492+00	t	Fordonsservice
280	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	4140ae72-c22f-4080-a0ca-c454036d6651	2025-04-14 20:13:16.758521+00	t	Fordonsservice
281	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	d7cc14b9-46b2-4c02-a184-e006d498c330	2025-04-14 20:28:10.826241+00	t	Fordonsservice
282	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	028ee3f1-8b8f-4190-a49c-209882b264dc	2025-04-14 20:33:17.352251+00	t	Fordonsservice
283	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	47995768-af74-4710-b4ec-ac0df9dca3ea	2025-04-14 20:37:11.95362+00	t	Fordonsservice
284	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	45ccf8f1-5bf7-43b1-8972-8541e7a28075	2025-04-14 20:49:31.502722+00	t	Fordonsservice
285	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	48313dc4-2604-4c46-8db8-f041f144a2cc	2025-04-15 07:48:01.479681+00	t	Fordonsservice
286	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	868dbda2-f406-47fc-b3d3-42b9564de9fd	2025-04-15 07:59:35.120116+00	t	Fordonsservice
287	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	35f0efbd-da70-4068-beb3-1512a1874cc6	2025-04-15 08:14:04.928282+00	t	Fordonsservice
288	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b6aeb807-8416-4d4a-856a-6f324583ec52	2025-04-15 09:05:24.25289+00	t	Fordonsservice
289	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	41aafc2c-8811-4962-9c15-5315f9d56636	2025-04-15 09:16:28.831634+00	t	Fordonsservice
290	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	c1e5454f-579c-40b2-a236-e5293bd2abf1	2025-04-15 09:34:26.95742+00	t	Fordonsservice
291	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	56f8c56d-3e9c-4d71-988a-5d6de541db87	2025-04-15 09:49:49.143375+00	t	Fordonsservice
292	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b340ed07-3374-4021-a2b7-d0d38901c919	2025-04-15 09:50:22.769458+00	t	Fordonsservice
293	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	642a9fa4-2777-4b28-9783-7ab58b0498b9	2025-04-15 10:01:26.96437+00	t	Fordonsservice
294	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	0c89f66e-2078-46e2-924d-4cc5b0cf7a16	2025-04-15 10:12:33.495487+00	t	Fordonsservice
295	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	45af0547-942a-4a1d-ada4-5943e91b4855	2025-04-15 10:30:00.010716+00	t	Fordonsservice
296	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	31c7d93f-9cd7-438b-b109-290ed705f236	2025-04-15 10:43:06.78445+00	t	Fordonsservice
297	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	a6b5255a-aa11-4806-98d3-e88750494f73	2025-04-15 10:54:40.801497+00	t	Fordonsservice
298	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	1ce0de58-d9c5-4cf5-a92f-2ea8dfacc29c	2025-04-15 11:24:11.539258+00	t	Fordonsservice
299	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	a31fa63b-377d-46ec-be4d-d557f30e9bfa	2025-04-15 11:28:58.244564+00	t	Fordonsservice
300	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	c74e4c91-28b4-46ef-bc19-e31103d7b9ef	2025-04-15 11:41:56.67653+00	t	Fordonsservice
301	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	84761204-e94c-404a-8811-fad7cd816a26	2025-04-15 11:45:46.276149+00	t	Fordonsservice
302	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	3e36e15d-b3ca-47b4-8a99-f122dd142801	2025-04-15 11:48:14.831633+00	t	Fordonsservice
303	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	8c2477d4-a689-490a-b087-6ca89bdb4809	2025-04-15 12:04:35.341173+00	t	Fordonsservice
304	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	180b0676-56c2-4fa5-b8cb-3f35502d85d6	2025-04-15 12:06:56.082695+00	t	Fordonsservice
305	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	62b2d678-8558-4f1c-b477-a89fa91c59b6	2025-04-15 12:17:55.153569+00	t	Fordonsservice
306	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	fdd3f5c4-ab95-4b51-829f-9604e256a248	2025-04-15 12:31:23.992016+00	t	Fordonsservice
307	Löken	löken.test@gmail.com	ABC123	Garantiärende	Bilen låter konstigt när jag startar den.	98c079a6-70b4-4fff-bfbc-988f2dbcba83	2025-04-15 12:39:28.217564+00	t	Fordonsservice
308	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	667c5217-90e4-422f-85b6-d0f4d6061ff9	2025-04-15 13:01:33.325626+00	t	Fordonsservice
309	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	fe9bac6d-4c4f-47ab-bec2-cafe2ae691e1	2025-04-15 13:09:22.684113+00	t	Fordonsservice
310	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	917e5b65-37ce-4be6-95d8-874cfc72a504	2025-04-15 13:10:52.54008+00	t	Fordonsservice
311	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	a5f414bf-b040-4cc5-98fc-e8cc3788a9e6	2025-04-15 13:13:09.288774+00	t	Fordonsservice
312	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	33d2eb1a-c23a-4e0a-b4d0-683561fffa7c	2025-04-15 13:26:57.714115+00	t	Fordonsservice
313	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	9d8213c3-f842-49d2-8852-1fed5a3a6af4	2025-04-15 13:44:48.993634+00	t	Fordonsservice
314	Saban	shaabaan_@hotmail.com	UND755	Kostnadsförfrågan	Min faktura stämmer inte.	8610f841-8c1b-4522-8e17-1d36f81114e6	2025-04-15 13:45:54.763938+00	t	Fordonsservice
315	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	6fe027ca-3600-4760-aeac-3aa47da8ac63	2025-04-15 13:55:58.518625+00	t	Fordonsservice
316	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	247d1fe7-703c-4490-9ae3-6ccbaf605e6c	2025-04-15 14:06:42.824715+00	t	Fordonsservice
317	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	638b204f-104b-4465-b3f1-a03d5da1dbbc	2025-04-15 15:07:15.194601+00	t	Fordonsservice
318	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	31b6ec85-09a8-4f9e-b030-b7eb09ae1fda	2025-04-16 07:39:51.45662+00	t	Fordonsservice
319	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	c27cb21d-ea14-40af-8286-53ec7bf37a30	2025-04-16 08:11:00.157169+00	t	Fordonsservice
320	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	fef47421-5f88-45a9-9354-a18bc988664d	2025-04-16 08:20:24.681011+00	t	Fordonsservice
321	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	ae88d259-0677-4c16-9a75-07057b0d766f	2025-04-16 08:25:53.224944+00	t	Fordonsservice
322	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	646fb94c-27e0-42c7-b0b2-cef6cd118a2d	2025-04-16 08:35:45.001371+00	t	Fordonsservice
323	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	43d2880b-be38-4c95-b2e2-4b224824e412	2025-04-16 08:37:33.338371+00	t	Fordonsservice
324	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	a6bc4bfd-137f-48e6-87ac-5efdd6a1bd3b	2025-04-16 08:57:14.510449+00	t	Fordonsservice
325	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	3171df93-5884-4e35-9a1a-f2569485754a	2025-04-16 08:59:24.33111+00	t	Fordonsservice
326	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	3e8b1cb1-54e3-45b0-b01d-a5e1a7363511	2025-04-16 09:07:06.209737+00	t	Fordonsservice
327	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	9e223638-aa43-4819-9a22-69b5f85cf57e	2025-04-16 09:08:55.492479+00	t	Fordonsservice
328	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	b8812256-4f65-440e-a6c8-b68f5ecfa5a9	2025-04-16 09:14:58.431511+00	t	Fordonsservice
329	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	51a0b355-dc56-4087-8277-ca4c773cef53	2025-04-16 09:17:01.332168+00	t	Fordonsservice
330	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	dc501e71-eda6-4aed-8f1e-00ddf53ff882	2025-04-16 09:25:44.307409+00	t	Fordonsservice
331	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	d8e11706-ef6a-4b4e-a36d-46fd85647c44	2025-04-16 09:28:22.03995+00	t	Fordonsservice
332	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	8392d70b-ef6d-47f2-9dd8-d862e48a826f	2025-04-16 09:34:15.734951+00	t	Fordonsservice
333	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	f61ca464-830e-4249-a681-5c11290719fc	2025-04-16 09:36:04.270293+00	t	Fordonsservice
334	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	9aad2402-92e2-4112-b09e-6a33a7e33e47	2025-04-16 09:42:14.391494+00	t	Fordonsservice
335	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	c96730ff-e869-4f45-ac21-6c0bed49d579	2025-04-16 09:45:23.268089+00	t	Fordonsservice
336	Löken	löken.test@gmail.com	ABC123	Garantiärende	Bilen låter konstigt när jag startar den.	626aa65f-8120-4eaa-8141-0ea2e8049b5b	2025-04-16 12:48:51.153302+00	t	Fordonsservice
337	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	fec253dd-da2d-44a9-b8b0-f676dc2af1e2	2025-04-16 12:52:06.856964+00	t	Fordonsservice
338	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	71937460-08b5-4f0b-b67d-7516d7fadcec	2025-04-16 12:54:05.679846+00	t	Fordonsservice
339	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	93c94091-6c23-4de6-885e-a5d4a664322c	2025-04-16 12:58:20.458664+00	t	Fordonsservice
340	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	b67d7c77-e386-40f4-ad0d-bc0e09af1fb2	2025-04-16 13:00:04.793031+00	t	Fordonsservice
341	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	d85a0fbb-775b-4705-a4d2-e8a4b14203a0	2025-04-16 13:07:05.844783+00	t	Fordonsservice
342	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	3c3ad78e-20a5-4a6b-946d-d85afb0fab59	2025-04-16 13:16:15.161145+00	t	Fordonsservice
343	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	c7596059-acf3-4d34-9104-f490d079aa2e	2025-04-16 13:18:31.327648+00	t	Fordonsservice
344	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	29f40e24-887e-4858-967e-9532bab3d9f8	2025-04-16 13:21:28.620309+00	t	Fordonsservice
345	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	d45b8460-16df-4007-8f9c-3dac974aeca5	2025-04-16 13:23:43.964798+00	t	Fordonsservice
346	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	6a902d89-bb49-4cdd-a767-141b134bb0d2	2025-04-16 13:26:10.021283+00	t	Fordonsservice
347	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	4e37c1a3-d5a1-4f8d-8e43-356824a6ccbf	2025-04-16 13:27:51.28054+00	t	Fordonsservice
348	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	649b0492-f187-4953-b606-81ec836ef9db	2025-04-16 13:32:41.720207+00	t	Fordonsservice
349	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	a97fcd87-bed2-47be-9157-fe433e579f48	2025-04-16 13:35:05.110283+00	t	Fordonsservice
350	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	e33df813-8cf9-4410-b071-a36dac601e18	2025-04-16 13:37:12.535229+00	t	Fordonsservice
351	TestKund	testkund@example.com		Garantiärende	Testar ett formulär för fordonsärenden	3fa07a52-e018-4d41-828e-61a7d2525390	2025-04-16 13:42:57.281829+00	t	Fordonsservice
352	TestKund	testkund@example.com		Garantiärende	Testar ett formulär för fordonsärenden	2512c058-4347-40f9-83d5-29e1917254b3	2025-04-16 13:46:40.085906+00	t	Fordonsservice
353	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	bcea26dc-0a73-4d54-8e6b-ae12d71029a3	2025-04-16 14:05:20.076732+00	t	Fordonsservice
354	TestKund	testkund@example.com		Garantiärende	Testar ett formulär för fordonsärenden	272e7eb7-09b8-46e0-b89a-f55a441fedae	2025-04-16 14:07:39.897629+00	t	Fordonsservice
355	TestKund	testkund@example.com		Garantiärende	Testar ett formulär för fordonsärenden	f2d8ba8d-3909-42bb-bf41-8bcd94117c7a	2025-04-16 14:07:58.060406+00	t	Fordonsservice
356	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	2e76d6dd-805c-4a21-b62d-de6566fcabf3	2025-04-16 14:11:44.423323+00	t	Fordonsservice
357	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	7589b722-23dc-4ae2-8287-d16a264be2bb	2025-04-16 14:29:15.497909+00	t	Fordonsservice
358	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	80e5465b-e98c-4355-a434-d849c942798a	2025-04-16 14:31:46.546535+00	t	Fordonsservice
359	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	a2a12440-8be1-4468-9864-f786df2a88eb	2025-04-16 14:36:01.080123+00	t	Fordonsservice
360	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	67357223-a7fa-494f-9d6b-77b8f8c68df5	2025-04-16 14:37:44.847204+00	t	Fordonsservice
361	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	5f09c5c3-d10c-4696-804b-3dd9a2bf8129	2025-04-16 14:58:42.109311+00	t	Fordonsservice
362	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	a8f0fe40-5cc6-4531-9730-b35a15bf6f30	2025-04-16 15:04:27.22244+00	t	Fordonsservice
363	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	20cf8c6c-a0e2-4a5e-8537-0b5d4a589a93	2025-04-16 15:15:08.520793+00	t	Fordonsservice
364	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	591319d4-e564-4700-af07-438a965c9279	2025-04-16 15:16:59.1363+00	t	Fordonsservice
365	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	bcbcde71-81cd-49bb-8fdb-c876069c1abc	2025-04-16 15:19:05.971565+00	t	Fordonsservice
366	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	b8be98e9-37b3-44ac-b060-2af92d50aaf7	2025-04-16 15:21:07.627049+00	t	Fordonsservice
367	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	f791352e-a64d-4797-a125-6bc51f193de5	2025-04-16 15:24:10.260061+00	t	Fordonsservice
368	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	7dae37fd-b5e2-47c1-b406-362bbd8ad684	2025-04-16 15:34:10.757082+00	t	Fordonsservice
369	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	4f50b612-dfc2-44e2-9bcb-07fece123160	2025-04-16 15:35:41.802686+00	t	Fordonsservice
370	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	feb91191-766c-4737-ba3a-b45aa6778b40	2025-04-16 15:36:24.533343+00	t	Fordonsservice
371	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f6c6e8c8-5412-40ee-bb7b-102f62d3e9cc	2025-04-16 15:42:29.143486+00	t	Fordonsservice
372	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	131eabb0-1d5f-4d7c-8198-bb60bd4e5242	2025-04-16 15:43:56.771411+00	t	Fordonsservice
373	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	21490c2c-f213-4d4b-a75b-0a49a5f96382	2025-04-16 15:45:58.161086+00	t	Fordonsservice
374	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	34e0484b-98a9-444a-910a-3921be321b5f	2025-04-16 15:48:19.818161+00	t	Fordonsservice
375	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	8afdaea4-3582-41db-a22f-89a1f8cb2c10	2025-04-17 08:02:49.33989+00	t	Fordonsservice
376	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	aac12295-17c6-4b57-8df7-30a76da03205	2025-04-17 08:08:08.908097+00	t	Fordonsservice
377	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	ccce58c8-c4a1-4d13-923a-9a232fd3075b	2025-04-17 08:10:01.215227+00	t	Fordonsservice
378	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	cd870515-5179-4a94-9dff-ef8d53dbaf93	2025-04-17 08:10:59.704987+00	t	Fordonsservice
379	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	92291e3d-bba5-4047-a05e-72a42d79140b	2025-04-17 09:21:10.290199+00	t	Fordonsservice
380	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	4cd831e0-7691-4916-bdd6-1cc269685c0b	2025-04-17 10:19:06.271189+00	t	Fordonsservice
381	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	925f3686-4f93-42ee-8668-e36a3bb728a0	2025-04-17 10:22:17.385288+00	t	Fordonsservice
382	TestKund	testkund@example.com		Garantiärende	Testar ett formulär för fordonsärenden	e395aaea-d069-408a-8ed3-2f6ea9e485c4	2025-04-17 10:40:44.025288+00	t	Fordonsservice
383	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	bac9d419-90eb-4f9f-9849-857feeaa7031	2025-04-17 10:42:45.245654+00	t	Fordonsservice
384	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	d22e40df-31e4-43b4-8db0-fc823f82b7a8	2025-04-17 10:44:07.120277+00	t	Fordonsservice
385	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	168e0c3e-eef6-4775-acc6-5d252d8987df	2025-04-17 10:46:02.358039+00	t	Fordonsservice
386	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	126830a3-9514-4d47-b0ad-81a3d6ef2258	2025-04-17 10:56:30.2068+00	t	Fordonsservice
387	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	f0f25c87-6a90-4950-9749-fc7fbac39d07	2025-04-17 11:00:37.853194+00	t	Fordonsservice
388	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	9477e95e-3e8d-4cc0-a15a-1f8beda84993	2025-04-18 12:23:36.107443+00	t	Fordonsservice
389	Ville	ville.eliasson99@gmail.com	QWE123	Problem efter reparation	Jag behöver hjälp nu.	d3bef903-84a9-451b-9cbb-f9cb3a67d5ac	2025-04-18 12:31:25.421417+00	t	Fordonsservice
390	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	c6879abd-767b-498a-bf8f-66d1e518c090	2025-04-18 13:47:25.978912+00	t	Fordonsservice
391	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	26d2dc3f-8ae4-47ea-8c62-ebc53d729272	2025-04-18 13:49:30.487388+00	t	Fordonsservice
392	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	d7000d86-4371-4230-a066-19caabf81bf7	2025-04-18 13:50:04.42576+00	t	Fordonsservice
393	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	6ef3debf-397f-4c79-bd32-d7025282a12e	2025-04-18 13:51:52.971641+00	t	Fordonsservice
394	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	2c4b4d1e-3e6a-439a-8586-9a7dcb2ccd16	2025-04-18 13:51:53.974194+00	t	Fordonsservice
395	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	9a6fdfcd-c06d-4d46-816f-200edab99c39	2025-04-18 13:52:43.275027+00	t	Fordonsservice
396	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	38ac4283-30f2-4dcd-b81b-ae2ca2c72249	2025-04-18 13:53:49.994417+00	t	Fordonsservice
397	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	99b72fa8-51a9-45dd-a4cb-066d4aa2f81b	2025-04-18 13:54:23.019896+00	t	Fordonsservice
398	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	eaffc021-089e-40e0-afcd-604619e4824d	2025-04-18 13:54:27.572226+00	t	Fordonsservice
399	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	b05b9cc7-b40d-42be-b350-8c3b70652e1c	2025-04-18 13:57:32.11985+00	t	Fordonsservice
400	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	365179a2-999a-4693-8c3c-16811abbd4aa	2025-04-18 14:07:40.310573+00	t	Fordonsservice
401	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	22e2be95-ef34-426c-b3b7-89afde9dc2b6	2025-04-18 14:08:12.570481+00	t	Fordonsservice
402	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	e61ec6d3-a8f8-4699-9090-7038a3cab843	2025-04-18 14:08:34.77165+00	t	Fordonsservice
403	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	11cf768b-106e-4fb5-a868-e98948ee2a71	2025-04-18 14:09:45.94813+00	t	Fordonsservice
404	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	8b37f144-b384-434e-ab6f-0140e06f50c6	2025-04-18 14:10:18.971518+00	t	Fordonsservice
405	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	1addd5e8-7f71-4e2a-8a03-e4f925c1d19f	2025-04-18 14:10:33.058404+00	t	Fordonsservice
406	Martin	hultberg.80@gmail.com	XSS50G	Övrigt	Jag vill ha en ny motor	5d5f14f0-cd32-493e-94fb-5eda31f851a0	2025-04-18 14:10:36.867161+00	t	Fordonsservice
\.


--
-- Data for Name: forsakrings_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forsakrings_forms ("Id", first_name, email, insurance_type, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
1	Ville	ville.eliasson99@gmail.com	life	coverage	hjälp mig 2	fbda28b2-db2d-4606-aed7-6637c085332c	2025-03-07 12:18:13.752398+00	t	Försäkringsärenden
2	Martin	hultberg80@gmail.com	home	coverage	test	f7b5b7ba-1375-4d89-abcc-ddda172b9c53	2025-03-11 10:35:19.429965+00	t	Försäkringsärenden
3	Ville	ville.eliasson99@gmail.com	Hemförsäkring	Pågående skadeärende	test	8f76fb7b-2027-4754-90ba-b6d5da1ce0b9	2025-03-12 13:03:02.950496+00	t	Försäkringsärenden
4	test	shaabaan_@hotmail.com	Hemförsäkring	Pågående skadeärende	test inital message	94046ae9-1cdf-4ad2-9284-0185d528a025	2025-03-14 08:47:57.437214+00	t	Försäkringsärenden
5	test2	shaabaan_@hotmail.com	Hemförsäkring	Pågående skadeärende	test inital messeage	e477a435-fef1-44cd-a693-b8849f368993	2025-03-14 08:51:01.635269+00	t	Försäkringsärenden
6	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	83aa8278-897a-4e9d-ae37-d2bc824130b5	2025-04-04 08:30:52.877901+00	t	Försäkringsärenden
7	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e704bd17-941b-4560-a8e4-f6146f91b28c	2025-04-05 20:39:39.077465+00	t	Försäkringsärenden
8	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	abf231a6-326a-4664-9531-8bce471973b2	2025-04-05 20:46:15.870457+00	t	Försäkringsärenden
9	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b612a8ab-43be-45ad-89a3-05f1673810dd	2025-04-05 20:48:19.237983+00	t	Försäkringsärenden
10	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	403681da-e3b4-482c-884e-a26147f2ff96	2025-04-05 20:54:24.062139+00	t	Försäkringsärenden
11	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	74ecc0e5-e8b2-41e5-8815-ff9a2d6aed5c	2025-04-05 21:07:06.766112+00	t	Försäkringsärenden
12	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d83e7323-5e4c-479d-bd6e-9ff4391a1cbe	2025-04-05 21:10:48.6669+00	t	Försäkringsärenden
13	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7f371c84-951c-4d61-890f-2f8433ee7d91	2025-04-05 23:07:08.901329+00	t	Försäkringsärenden
14	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	258058f9-abb9-4e17-8b95-01549b29a088	2025-04-05 23:27:37.503845+00	t	Försäkringsärenden
15	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	48bc5380-3657-4c90-a33a-e93f88d2a351	2025-04-05 23:29:30.178527+00	t	Försäkringsärenden
16	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	1a316d7b-8421-400b-8dfd-70707657c0b4	2025-04-05 23:43:03.698546+00	t	Försäkringsärenden
17	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a7703890-ec75-4c7f-b349-e866ee653565	2025-04-05 23:55:39.864092+00	t	Försäkringsärenden
18	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	34a802e3-b63a-4b28-8cc9-cb9f8519983b	2025-04-05 23:58:08.088544+00	t	Försäkringsärenden
19	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	47cff9dd-d2e2-43f6-b7c6-d49a05a0c53d	2025-04-06 00:11:44.560046+00	t	Försäkringsärenden
20	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3906e146-7d23-40e6-a9de-458ce5c09a8f	2025-04-06 00:24:38.14248+00	t	Försäkringsärenden
21	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	db450373-20f3-4d2f-b6ce-3f7e168d6553	2025-04-06 00:32:30.833963+00	t	Försäkringsärenden
22	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0ec12ad7-ad21-4073-89d3-5ee4acc051d4	2025-04-06 00:38:07.047096+00	t	Försäkringsärenden
23	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9c9ac440-ad0b-44a9-a4f0-a9e64b995669	2025-04-06 00:42:11.865088+00	t	Försäkringsärenden
24	Löken	löken.test@gmail.com		Fakturafrågor	hjälp mig	cb001359-6042-4c6c-bb58-2cd4a4e939b6	2025-04-07 08:34:19.304266+00	t	Försäkringsärenden
25	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	59ab7dbf-86ba-4f01-9c75-c8f079616aa0	2025-04-07 09:57:09.68085+00	t	Försäkringsärenden
26	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f45a837e-0417-44f9-a4c6-5b2a73c56ab2	2025-04-07 10:06:26.970292+00	t	Försäkringsärenden
27	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	853fdf23-a8fb-4e33-92bf-c85ee0c0dee0	2025-04-07 10:07:23.077492+00	t	Försäkringsärenden
28	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9525c3d5-51c4-4464-a9df-90eaab676fbc	2025-04-07 10:50:17.585236+00	t	Försäkringsärenden
29	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3d036f69-7e59-432c-b278-a26a971b885d	2025-04-07 11:07:22.833712+00	t	Försäkringsärenden
30	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e2893f39-9ef7-45b3-a005-6ca927dc6037	2025-04-07 11:09:41.352674+00	t	Försäkringsärenden
31	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	17aee66e-9ad1-4a7e-a9da-8770f68583d4	2025-04-07 11:16:16.656164+00	t	Försäkringsärenden
32	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	461d6488-2e95-4859-ab9c-cb47c6b5d0a8	2025-04-07 11:43:22.225453+00	t	Försäkringsärenden
33	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	af35aead-a759-45f7-b5dd-30f8f4d3b80e	2025-04-07 11:52:07.53454+00	t	Försäkringsärenden
34	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	270965de-1b9a-4c09-a7a1-4a34d078697a	2025-04-07 14:21:26.450312+00	t	Försäkringsärenden
35	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8d1f2d78-c400-438f-8491-3aabf0fe2d2e	2025-04-07 14:34:39.41387+00	t	Försäkringsärenden
36	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	08450420-21c2-4334-94a8-e72cdc03ea63	2025-04-07 14:41:18.447664+00	t	Försäkringsärenden
37	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	995b1222-98fa-486f-9b05-f70436dc0b2d	2025-04-07 14:41:59.991435+00	t	Försäkringsärenden
38	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	558397e8-e435-4fa1-adcc-dc5c6c92e5df	2025-04-07 14:47:20.894275+00	t	Försäkringsärenden
39	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	287c20af-a17b-4764-8f7e-b1010bc0c89c	2025-04-07 14:52:24.291661+00	t	Försäkringsärenden
40	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8cd4886d-bb04-426c-bd31-faba1f86e60a	2025-04-07 14:55:40.131273+00	t	Försäkringsärenden
41	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b5b0b469-b33c-4d7f-aa1e-6498a67c2998	2025-04-07 15:02:35.522223+00	t	Försäkringsärenden
42	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7a56d9cf-2e2b-450f-b07f-ff6d6cf159b8	2025-04-07 15:11:11.022446+00	t	Försäkringsärenden
43	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	61569cc3-9257-4dd3-8627-83e07180ee0e	2025-04-07 15:17:52.651277+00	t	Försäkringsärenden
44	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7e5436c0-8841-4903-a057-b9d74438d812	2025-04-07 15:21:51.837757+00	t	Försäkringsärenden
45	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f3fad663-7a3e-4355-b5e1-8f9cb8400130	2025-04-07 15:35:56.84292+00	t	Försäkringsärenden
46	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	6fc38d52-61e2-421f-ac07-4e15488de57f	2025-04-07 15:45:53.520505+00	t	Försäkringsärenden
47	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	2eb2eb84-6f65-4f67-a1cd-99d06f9ffa9f	2025-04-07 15:51:09.486517+00	t	Försäkringsärenden
48	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	949ff994-93e9-4c46-98b8-667f7df59306	2025-04-07 15:56:19.113496+00	t	Försäkringsärenden
49	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	13d7af85-3ef6-45f7-93e6-6799094648d5	2025-04-07 16:09:36.079474+00	t	Försäkringsärenden
50	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5809d7e4-802c-41d2-947c-dc01367218a3	2025-04-07 16:10:47.581436+00	t	Försäkringsärenden
51	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	042a6496-c66a-4121-b61c-852ba62c8f65	2025-04-07 16:15:25.315672+00	t	Försäkringsärenden
52	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d4c45255-ef65-42cc-9cd5-a3fe85ef0aab	2025-04-07 16:16:44.889315+00	t	Försäkringsärenden
53	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e6b5e924-3fe5-47c6-8afb-935f566060d9	2025-04-07 16:29:11.419178+00	t	Försäkringsärenden
54	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a152c114-e060-41f4-baf2-c836f29bae8b	2025-04-07 18:15:08.914329+00	t	Försäkringsärenden
55	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	26d3a624-2064-455f-9c9a-5ee11220f030	2025-04-07 18:38:07.364588+00	t	Försäkringsärenden
56	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d79c00e6-796e-496d-a773-1a1b65d6850f	2025-04-07 18:43:32.551412+00	t	Försäkringsärenden
57	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5defbf27-29c5-4956-abbb-30e16c488591	2025-04-07 18:44:28.211672+00	t	Försäkringsärenden
58	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	ebe6fa8f-c397-4f0e-8ccb-e64cd35419cf	2025-04-07 19:11:49.567314+00	t	Försäkringsärenden
59	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	39e9e0d6-8607-4938-b26e-0d1804bc8da1	2025-04-07 19:14:22.301937+00	t	Försäkringsärenden
60	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	ccea9553-06ec-4a81-8f11-2108c92f6ff9	2025-04-07 19:16:26.395933+00	t	Försäkringsärenden
61	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f405b0c7-0ab1-4d2e-b428-3207fa7ae2da	2025-04-07 19:29:26.267649+00	t	Försäkringsärenden
62	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3e753a56-f719-48fc-ada1-69b13dc2be63	2025-04-07 19:35:27.663914+00	t	Försäkringsärenden
63	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f2e253ba-bda4-4542-94b5-10ad94cce98f	2025-04-07 19:37:02.896546+00	t	Försäkringsärenden
64	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9cefdeed-6f27-4aff-a28f-7da9ceb86869	2025-04-07 19:38:27.952269+00	t	Försäkringsärenden
65	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0d28c7d6-02c8-4049-9877-1817d239312e	2025-04-07 19:42:24.578575+00	t	Försäkringsärenden
66	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f8c20aeb-c891-47d2-89e0-70420c48a1b4	2025-04-07 19:46:27.276237+00	t	Försäkringsärenden
67	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	987e1d6c-3fef-48c0-b477-27a9607628b6	2025-04-07 19:55:33.844418+00	t	Försäkringsärenden
68	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5ce2cf0b-53a0-46d0-9a19-b6ea00d22e05	2025-04-07 20:02:43.52658+00	t	Försäkringsärenden
69	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e7bc95a9-74d3-486f-8505-1fcc24131580	2025-04-07 20:07:08.562199+00	t	Försäkringsärenden
70	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d34e8266-b57d-47fd-934a-fe63813294cf	2025-04-07 20:16:36.091654+00	t	Försäkringsärenden
71	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c4ba1f51-915b-4d47-a590-b63bcea94946	2025-04-07 20:19:38.314452+00	t	Försäkringsärenden
72	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	caeffaa9-28c9-464c-b281-fa76c6b5e25b	2025-04-07 20:31:25.308083+00	t	Försäkringsärenden
73	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	06f649c1-7df7-48de-9758-35e8f4263c28	2025-04-07 20:37:37.598803+00	t	Försäkringsärenden
74	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	352ab12e-ee5c-4f53-9d5f-01682413688d	2025-04-07 20:44:44.599433+00	t	Försäkringsärenden
75	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8066ee2b-c9fb-460d-9b68-15c2dbc33671	2025-04-07 20:48:41.672928+00	t	Försäkringsärenden
76	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5371fa27-0db1-45ec-aad9-34ab221f528f	2025-04-07 20:51:49.126819+00	t	Försäkringsärenden
77	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b0da324b-ed7e-4fc9-ac93-51d8d2dde4d8	2025-04-07 21:07:21.259485+00	t	Försäkringsärenden
78	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	49edb2ce-2139-4f90-802f-e97271d62119	2025-04-07 21:13:06.986825+00	t	Försäkringsärenden
79	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	709248b6-f063-4920-b0bb-4ebf7bf1359b	2025-04-07 21:17:27.550708+00	t	Försäkringsärenden
80	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	76761119-fd08-492b-8ad4-3c0badaf3f4c	2025-04-07 21:23:21.959118+00	t	Försäkringsärenden
81	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	010ae747-05a4-4125-8040-bdcb37e0eadd	2025-04-07 21:28:14.199977+00	t	Försäkringsärenden
82	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	dc15016b-37f0-482e-a568-f20746cd93af	2025-04-07 21:31:53.64162+00	t	Försäkringsärenden
83	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	82365dbd-bef0-458d-8cd1-4b8c43fbada3	2025-04-07 21:43:18.705039+00	t	Försäkringsärenden
84	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	33fe2f5d-1b7a-4988-9f21-c71d684c9904	2025-04-07 21:46:25.420818+00	t	Försäkringsärenden
85	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	6258e691-e621-4376-a51b-6b205c7ca5d3	2025-04-07 21:47:54.810133+00	t	Försäkringsärenden
86	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b39407eb-775e-49ce-917c-2727ba8c3188	2025-04-07 21:50:58.713145+00	t	Försäkringsärenden
87	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	eb13e6b3-c80d-471e-ac92-43cfab5fc3c0	2025-04-07 21:53:43.454113+00	t	Försäkringsärenden
88	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c32c258e-64b4-4a04-914c-6a5d36dd06cd	2025-04-08 11:21:57.682842+00	t	Försäkringsärenden
89	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	01d92aa0-6885-4459-8ba7-3ed8591fe685	2025-04-08 11:25:28.082014+00	t	Försäkringsärenden
90	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	daf5a76f-4d7d-4c67-a29a-1a1515316a9e	2025-04-08 11:27:02.721075+00	t	Försäkringsärenden
91	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9c1c5807-3009-46d0-818a-9b532040e85a	2025-04-08 11:58:49.90888+00	t	Försäkringsärenden
92	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	fbc11821-c31f-49f3-88ea-a90b348f918b	2025-04-08 12:07:00.423237+00	t	Försäkringsärenden
93	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a1cb2a4c-519a-496d-88d9-e52bc355bc2b	2025-04-08 12:16:04.590182+00	t	Försäkringsärenden
94	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a426f8d4-e5be-4600-a079-515a1f0eae54	2025-04-08 12:19:10.984656+00	t	Försäkringsärenden
95	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	465af357-50c5-4988-bd95-247e5134886b	2025-04-08 12:32:13.709103+00	t	Försäkringsärenden
96	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	16c5d176-d498-4d35-90e9-9787daf104cd	2025-04-08 12:37:54.422831+00	t	Försäkringsärenden
97	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b2f39b21-cadf-49d8-aace-5741d6e7e923	2025-04-08 12:56:36.81601+00	t	Försäkringsärenden
98	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	56bf3989-9042-441e-8e52-8a0cb2273903	2025-04-08 13:03:55.784275+00	t	Försäkringsärenden
99	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5d1b8be7-f0a3-4a31-87a4-d78a2043d39f	2025-04-08 13:06:56.709554+00	t	Försäkringsärenden
100	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c0bc04f6-9f63-4a9e-95cf-e62863519a6a	2025-04-08 13:52:59.069352+00	t	Försäkringsärenden
101	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f27d7e9a-367a-4e09-8dc1-8b68720997fe	2025-04-09 09:43:18.028531+00	t	Försäkringsärenden
102	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7f24ac5d-0415-4e48-8144-14228910f042	2025-04-09 09:48:51.959285+00	t	Försäkringsärenden
103	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0bcd95c5-71d8-4b95-a4b5-a29a40f64aa0	2025-04-09 09:55:59.977455+00	t	Försäkringsärenden
104	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	44c3ff3e-f664-4cb0-89ff-16ae091665ca	2025-04-09 10:03:00.671621+00	t	Försäkringsärenden
105	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c7832a75-ae5b-4b18-8b2a-7bdb70e74bc8	2025-04-09 10:08:54.749865+00	t	Försäkringsärenden
106	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8bf2d5ab-232b-445e-af5b-3f82654e594b	2025-04-09 10:15:09.520878+00	t	Försäkringsärenden
107	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	4a12c5d2-8505-4548-9fe8-ed2f09d5eef8	2025-04-09 11:49:00.246397+00	t	Försäkringsärenden
108	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test.	58d99d20-83f0-4de2-89ef-286bbf7e3c92	2025-04-09 13:56:35.984192+00	t	Försäkringsärenden
109	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test.	ef0e3ca5-0ad8-443f-bc3c-503cadd94963	2025-04-09 14:04:27.408968+00	t	Försäkringsärenden
110	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7f55ecca-87d8-4857-9b52-c50f8bb54743	2025-04-09 14:18:36.062408+00	t	Försäkringsärenden
111	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c2ee2074-6729-417f-9069-f2f5aecedf09	2025-04-09 14:23:28.980163+00	t	Försäkringsärenden
112	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a722171f-5efc-4bf1-a160-aaf4405ced39	2025-04-09 14:27:02.386535+00	t	Försäkringsärenden
113	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7a935a9e-54b5-45ac-b29d-196235b13d4d	2025-04-09 14:31:13.318406+00	t	Försäkringsärenden
114	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d5d7b447-3387-4bb3-b8ce-91df8c46a119	2025-04-09 14:38:57.057233+00	t	Försäkringsärenden
115	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0fd5c5a0-fcce-4665-a4f7-f646288a08ee	2025-04-09 14:57:24.519232+00	t	Försäkringsärenden
116	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8f2f5591-9f73-4f1c-ba10-f308725cf6a4	2025-04-09 15:01:15.392602+00	t	Försäkringsärenden
117	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	dc32da1b-f083-4839-b183-2d987e2db85b	2025-04-09 15:06:01.693269+00	t	Försäkringsärenden
118	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	6fe020a1-1a2f-464b-9735-f0c1e4e2b47b	2025-04-10 18:42:02.354134+00	t	Försäkringsärenden
119	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	093bf4fd-6c1f-42b9-ae2c-6b00547a6f69	2025-04-10 18:49:24.095507+00	t	Försäkringsärenden
120	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f0c9d88e-b098-407d-aeb5-3e31185dbce0	2025-04-10 18:56:50.948451+00	t	Försäkringsärenden
121	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	1c19c646-0b7f-4fe9-94b8-b2f060a579ea	2025-04-11 13:38:23.152668+00	t	Försäkringsärenden
122	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	aa9f40b4-2f77-4059-bc47-7f5b94b5c5e1	2025-04-11 13:50:25.483842+00	t	Försäkringsärenden
123	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	1c561b84-bf36-4e1c-b8ce-7c707f085fc5	2025-04-11 14:01:16.305088+00	t	Försäkringsärenden
124	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	f36df704-6189-4c1a-92ac-950e185f9697	2025-04-11 14:05:26.905356+00	t	Försäkringsärenden
125	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	155be0b3-c6d9-4872-9bcc-0de23357f569	2025-04-11 14:06:10.787914+00	t	Försäkringsärenden
126	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	f883f4ac-bf9e-4216-b453-8f12ff06073f	2025-04-11 14:07:36.352526+00	t	Försäkringsärenden
127	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	6642acde-95b8-4a83-80ae-debadd4abc10	2025-04-11 14:08:20.217516+00	t	Försäkringsärenden
128	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	e1d66322-ba15-476a-9e9d-a668307f43a2	2025-04-11 14:09:03.376665+00	t	Försäkringsärenden
129	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	e22ef0f6-0df6-4779-829c-098f6c668f9c	2025-04-14 10:27:40.450156+00	t	Försäkringsärenden
130	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	3c278a0c-ed70-40fc-b7d4-4204538b29ff	2025-04-14 10:36:45.625759+00	t	Försäkringsärenden
131	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	7e27e223-0bbd-4dae-b23c-1a30adc0d653	2025-04-14 10:48:57.587723+00	t	Försäkringsärenden
132	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	58a4930c-6017-4e73-b1b3-573c89da4b1f	2025-04-14 10:55:49.529272+00	t	Försäkringsärenden
133	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	176a7c92-f6be-47f2-9734-d16e21b9855d	2025-04-14 10:59:54.139437+00	t	Försäkringsärenden
134	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	aa0ba49c-6396-4571-9034-120fc0aee0e7	2025-04-14 11:03:42.897015+00	t	Försäkringsärenden
135	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	7e7efc12-24f3-4410-9a41-9ebac7c562b6	2025-04-14 11:08:48.539553+00	t	Försäkringsärenden
136	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	82f7fd99-e336-4ed5-bf0f-f116197cc307	2025-04-14 11:12:47.799071+00	t	Försäkringsärenden
137	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	e5ad3ea1-bee3-4f78-baef-97d601a96812	2025-04-14 11:18:10.368837+00	t	Försäkringsärenden
138	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	d363e1a3-127b-4e8f-a405-4c88c8037fc3	2025-04-14 11:26:43.651699+00	t	Försäkringsärenden
139	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	e3f9e9d0-eb87-414b-a6bb-0709533ddadc	2025-04-14 13:13:33.566936+00	t	Försäkringsärenden
140	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	453a743a-6a77-4433-9aa4-c3171553474d	2025-04-14 13:18:11.396671+00	t	Försäkringsärenden
141	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	b12755e9-3935-43e2-825e-afb7a655413e	2025-04-14 13:28:09.869969+00	t	Försäkringsärenden
142	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	afb56bc0-6682-4f92-9a54-11ddbd58be44	2025-04-14 13:37:00.716458+00	t	Försäkringsärenden
143	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	05763bfd-8b78-4ec1-adcb-06ce8fe89c30	2025-04-14 13:37:16.673218+00	t	Försäkringsärenden
144	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	3607144c-f753-41ec-bd78-eec3f47bd917	2025-04-14 13:43:15.055409+00	t	Försäkringsärenden
145	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	9bd26eeb-554a-4904-9c7d-87c00bb19128	2025-04-14 14:00:50.635406+00	t	Försäkringsärenden
146	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	22587d3d-5933-4b3b-85c9-0b67ece236c0	2025-04-14 14:01:42.948715+00	t	Försäkringsärenden
147	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	6a6d3fb1-e635-4719-a90a-b1550ffc75d4	2025-04-14 14:04:00.747153+00	t	Försäkringsärenden
148	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	13cead51-08d2-440f-b2e0-512e5672fdde	2025-04-14 14:14:44.50684+00	t	Försäkringsärenden
149	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	f534dbdc-2191-4a73-98f1-c449190d4402	2025-04-14 14:34:10.943167+00	t	Försäkringsärenden
150	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	93e5cfde-2f60-454e-8847-50b02ffb3809	2025-04-14 14:42:01.661963+00	t	Försäkringsärenden
151	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	08c49648-2380-4202-b89c-4432408d65db	2025-04-14 14:53:41.829005+00	t	Försäkringsärenden
152	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	240f97c3-51e1-47d4-933d-dc67ca220719	2025-04-14 15:09:45.210935+00	t	Försäkringsärenden
153	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	dbcecdf7-955e-4f41-848e-71b9c07b8031	2025-04-14 15:23:05.317519+00	t	Försäkringsärenden
154	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	ac2b3169-2732-45ef-ba63-e88e7cc65034	2025-04-14 15:37:29.079545+00	t	Försäkringsärenden
155	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	782a0f68-831e-4e72-be60-33c3c8f1e360	2025-04-14 16:16:34.291953+00	t	Försäkringsärenden
156	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	15e986b9-4250-4e69-a636-5da4fc34ffbb	2025-04-14 16:51:22.070821+00	t	Försäkringsärenden
157	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	0de83acb-d091-4f08-b850-0904e74b7577	2025-04-14 16:52:26.945972+00	t	Försäkringsärenden
158	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	c56ec048-cc5b-4161-8940-4a9d5f180429	2025-04-14 16:56:48.077102+00	t	Försäkringsärenden
159	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	f1f7b03e-a873-474b-8a0d-606d8ebaa501	2025-04-14 17:00:59.776966+00	t	Försäkringsärenden
160	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	359a7a90-15cd-4ce5-bb51-637ed4d0b862	2025-04-14 17:03:05.465387+00	t	Försäkringsärenden
161	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	838131cc-7bbc-46fa-ad74-e553ec6ac3e7	2025-04-14 17:07:53.663651+00	t	Försäkringsärenden
162	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	2469555c-8351-473d-8e62-7977dab4ddec	2025-04-14 17:15:11.041256+00	t	Försäkringsärenden
163	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	943d7081-1b2d-42e1-bbb2-9d086c590429	2025-04-14 17:16:07.849295+00	t	Försäkringsärenden
164	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	3daade6c-0a4b-4407-a0b2-c6f9f185adfd	2025-04-14 17:19:46.447236+00	t	Försäkringsärenden
165	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	a45f77fa-46fd-4c26-8534-201dfa99dff6	2025-04-14 18:42:42.338689+00	t	Försäkringsärenden
166	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	212c0fc3-c79a-4b09-a1ca-4072dcf6bf54	2025-04-14 20:01:58.489475+00	t	Försäkringsärenden
167	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	cd272942-6ee0-4424-a83b-fa32d6022f23	2025-04-14 20:02:05.03931+00	t	Försäkringsärenden
168	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	3306aacb-dee7-4693-8562-6bc8c2047d6d	2025-04-14 20:07:58.040323+00	t	Försäkringsärenden
169	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	22ae3882-938a-4e5d-9cc9-a4ad612b66ab	2025-04-14 20:13:18.002451+00	t	Försäkringsärenden
170	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	6a0dad67-a6b8-48d3-8747-c2adaff599d9	2025-04-14 20:28:12.043464+00	t	Försäkringsärenden
171	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	f9d26909-390a-440f-843b-79bf6371d6ea	2025-04-14 20:33:18.369201+00	t	Försäkringsärenden
172	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	3a3162f6-31ce-430a-8547-3f0c4d86b7ae	2025-04-14 20:37:13.339866+00	t	Försäkringsärenden
173	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	d960235c-e8ce-42e3-9ecb-1ed6daa3555b	2025-04-14 20:49:33.07773+00	t	Försäkringsärenden
174	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	12411bea-cae4-41c9-bdb2-334a32068047	2025-04-15 07:48:02.445161+00	t	Försäkringsärenden
175	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	28706bb8-e646-4f92-bf6c-120ff4b8796b	2025-04-15 07:59:36.442392+00	t	Försäkringsärenden
176	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	083d9952-f2ec-4ed8-9fea-32413f9f9d21	2025-04-15 08:14:06.240842+00	t	Försäkringsärenden
177	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	aac23852-052b-4ef8-a23d-00a84d2d6023	2025-04-15 09:05:26.712757+00	t	Försäkringsärenden
178	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	1b195b92-8f14-4e63-8707-32b932311487	2025-04-15 09:16:29.777218+00	t	Försäkringsärenden
179	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	90419894-fc3c-480d-a7f4-814fbb8c72bc	2025-04-15 09:34:28.618466+00	t	Försäkringsärenden
180	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	c3f3cb36-5114-4c82-aa1b-3998c542b7c2	2025-04-15 09:49:50.321623+00	t	Försäkringsärenden
181	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	c1913937-c20e-497d-bd82-a3a96a9fa33b	2025-04-15 09:50:24.592799+00	t	Försäkringsärenden
182	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	710d1bc7-47a2-4303-b045-2cb8cf793958	2025-04-15 10:01:28.319774+00	t	Försäkringsärenden
183	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	87fd9ac7-ea6e-4561-a04e-3416e3ec5941	2025-04-15 10:12:34.83563+00	t	Försäkringsärenden
184	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	eea9967e-f4e4-4195-adf6-7bf5ac5c2634	2025-04-15 10:30:01.56032+00	t	Försäkringsärenden
185	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	a202d21b-e582-4c4a-801e-3bb1fd5fe864	2025-04-15 10:43:08.420673+00	t	Försäkringsärenden
186	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	0cc79842-0a55-425f-aa29-e87f2c1d23cc	2025-04-15 10:54:41.982342+00	t	Försäkringsärenden
187	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	afe932c2-ece3-4015-9bd9-783d6c83987b	2025-04-15 11:24:23.695264+00	t	Försäkringsärenden
188	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	c25dac37-6208-4bed-a98a-d201ef44e62d	2025-04-15 11:29:09.324206+00	t	Försäkringsärenden
189	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	92597c80-6ceb-4207-91b8-813cadd65611	2025-04-15 11:42:07.34741+00	t	Försäkringsärenden
190	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	75f8f981-397b-4f83-95cf-360786222a3c	2025-04-15 11:45:57.054128+00	t	Försäkringsärenden
191	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	fa275b6e-ab68-4876-9a0e-541d8699fd8d	2025-04-15 11:48:25.728117+00	t	Försäkringsärenden
192	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	55900a57-7709-4c79-965e-ea45cde86adf	2025-04-15 12:04:47.472111+00	t	Försäkringsärenden
193	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	175c89a8-daab-4323-9359-c701d9b38483	2025-04-15 12:07:07.202755+00	t	Försäkringsärenden
194	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	ffc06ca8-0bdf-46b4-a831-7507448c851b	2025-04-15 12:16:31.712073+00	t	Försäkringsärenden
195	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	5819d5a3-9935-45bb-9cf9-255fbc6573ff	2025-04-15 12:18:07.331616+00	t	Försäkringsärenden
196	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	26623a07-f483-404c-ace4-daf5597d556e	2025-04-15 12:31:36.435298+00	t	Försäkringsärenden
197	Löken	löken.test@gmail.com		Fakturafrågor	hjälp mig	bbea8bb3-17df-4a01-a4fb-ec19b946c38c	2025-04-15 12:39:30.890118+00	t	Försäkringsärenden
198	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	c17cfd69-c8e8-4671-9ea2-d1755dbff38b	2025-04-15 13:01:34.697515+00	t	Försäkringsärenden
199	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	77de8dd5-1a15-46e3-ae3a-f5e99171e5db	2025-04-15 13:09:36.003209+00	t	Försäkringsärenden
200	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	a6fc4ac8-88d6-4d15-b922-84c3303b90aa	2025-04-15 13:11:04.392311+00	t	Försäkringsärenden
201	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	82933a18-82a6-4cf6-a80a-2fb4c24a8d92	2025-04-15 13:35:53.41683+00	t	Försäkringsärenden
202	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	4d580fc0-763c-4202-ba46-9358463dff11	2025-04-15 13:44:50.711213+00	t	Försäkringsärenden
203	Saban	shaabaan_@hotmail.com	Olycksfallsförsäkring	Fakturafrågor	Min faktura stämmer inte.	c138ced2-0db3-4acb-93e4-8c61919a918c	2025-04-15 13:46:06.518634+00	t	Försäkringsärenden
204	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	69b4e3ad-e0ae-4d21-9968-01c9e6372865	2025-04-15 14:06:44.88797+00	t	Försäkringsärenden
205	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	b2fd2365-59dd-40d4-abbc-d40595514df8	2025-04-15 15:07:16.866072+00	t	Försäkringsärenden
206	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	692c3008-584e-4d81-aa01-080ab3113baa	2025-04-16 08:11:01.712001+00	t	Försäkringsärenden
207	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	a6a8e7d0-212b-41d8-91d4-ae4afe67044a	2025-04-16 08:20:26.038923+00	t	Försäkringsärenden
208	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	45a85a43-2544-4ffa-aacd-af2f4912fd99	2025-04-16 08:25:54.793317+00	t	Försäkringsärenden
209	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	b0cb2247-2948-4959-af8f-762c8e935291	2025-04-16 08:35:46.292406+00	t	Försäkringsärenden
210	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	9bd28adf-668d-4258-a465-b792c4c6f52c	2025-04-16 08:57:15.650274+00	t	Försäkringsärenden
211	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	150169df-0cce-4552-b482-d5b1f4b704c6	2025-04-16 09:07:07.268669+00	t	Försäkringsärenden
212	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	527d9f0d-271c-4327-a8d0-5536f8298887	2025-04-16 09:14:59.709598+00	t	Försäkringsärenden
213	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	2aa8f901-d24c-4fa9-8e0f-bed51a2c0419	2025-04-16 09:25:45.812018+00	t	Försäkringsärenden
214	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	4606f00e-1fe3-45c5-9fad-4a7653b3133d	2025-04-16 09:34:16.641184+00	t	Försäkringsärenden
215	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	4d299e70-f6d0-4f97-9850-0e825c94e116	2025-04-16 09:42:15.711593+00	t	Försäkringsärenden
216	Löken	löken.test@gmail.com		Fakturafrågor	hjälp mig	7eb0bef0-6ed8-43d4-9f05-e24e3eb2dc9a	2025-04-16 12:48:53.269782+00	t	Försäkringsärenden
217	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	f87eb64b-35d2-4e45-8c1f-dd500ca2ae80	2025-04-16 12:52:08.417417+00	t	Försäkringsärenden
218	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	18bae3e4-fbd8-4acd-9d7e-991d2b9b191d	2025-04-16 13:07:07.089759+00	t	Försäkringsärenden
219	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	6700a650-c2e8-41ae-87b3-5bdbdd12b47f	2025-04-16 13:16:16.115419+00	t	Försäkringsärenden
220	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	35543712-47c8-4b72-9861-975fdb46327f	2025-04-16 13:21:30.280759+00	t	Försäkringsärenden
221	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	f0b33cc8-a4ab-4c54-a8f3-57ea271ac197	2025-04-16 13:26:11.017282+00	t	Försäkringsärenden
222	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	f00fd5c9-d234-4d6c-88be-db6f4ad3a91c	2025-04-16 13:32:43.261341+00	t	Försäkringsärenden
223	TestKund	testkund@example.com	Hemförsäkring	Frågor om försäkringsskydd	Testar ett formulär för försäkringsärenden	780d48f5-bf42-4f66-9d06-14e9c3f16327	2025-04-16 13:42:58.480013+00	t	Försäkringsärenden
224	TestKund	testkund@example.com	Hemförsäkring	Frågor om försäkringsskydd	Testar ett formulär för försäkringsärenden	92a3b1c2-0ddb-453b-9ada-1bd5b1dd5fc9	2025-04-16 13:46:41.263904+00	t	Försäkringsärenden
225	TestKund	testkund@example.com	Hemförsäkring	Frågor om försäkringsskydd	Testar ett formulär för försäkringsärenden	d301e899-da4d-41e1-a845-c1f0b34506bd	2025-04-16 14:07:41.15305+00	t	Försäkringsärenden
226	TestKund	testkund@example.com	Hemförsäkring	Frågor om försäkringsskydd	Testar ett formulär för försäkringsärenden	41867b3f-989a-4725-bfcd-6c4689e3bd64	2025-04-16 14:08:00.195288+00	t	Försäkringsärenden
227	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	bcd0e6a9-0e16-4dd3-bd75-853a4b36dcb8	2025-04-16 15:45:59.401185+00	t	Försäkringsärenden
228	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8fed0251-4c57-4737-9254-4ffac18635d0	2025-04-17 09:19:32.831733+00	t	Försäkringsärenden
229	TestKund	testkund@example.com	Hemförsäkring	Frågor om försäkringsskydd	Testar ett formulär för försäkringsärenden	ee252392-50f5-41c6-a89e-b7a3fe6adf2d	2025-04-17 10:40:45.433398+00	t	Försäkringsärenden
230	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	288a8cb4-4782-4151-9a60-07567daf606f	2025-04-17 10:44:08.043774+00	t	Försäkringsärenden
231	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	320470cc-af54-4e91-a5f5-4e80345e1ded	2025-04-18 13:47:26.933831+00	t	Försäkringsärenden
232	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	0ed45038-a8fb-48c2-abf0-530e6d1d681e	2025-04-18 13:50:05.579267+00	t	Försäkringsärenden
233	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	6ce106ea-731c-481e-b0e4-d669e9723385	2025-04-18 13:51:55.62323+00	t	Försäkringsärenden
234	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	693461d6-71bc-4ef3-a5de-d7a4bf648b6d	2025-04-18 13:52:44.334522+00	t	Försäkringsärenden
235	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	72cdf60e-40a3-4b33-a3b8-b262e332873f	2025-04-18 13:54:24.03623+00	t	Försäkringsärenden
236	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	45d8f3f8-3dfa-4052-ace1-1b9a52a394ca	2025-04-18 14:07:41.268575+00	t	Försäkringsärenden
237	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	a7e26b4b-a1d6-46ef-91ba-6eb6cf61c866	2025-04-18 14:08:13.755279+00	t	Försäkringsärenden
238	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	c09003b0-9c1f-4cb3-ab94-0576063ab2e1	2025-04-18 14:08:36.254268+00	t	Försäkringsärenden
239	Martin	hultberg.80@gmail.com		Fakturafrågor	Min räkning är dyr	bb9c4261-d643-43c4-8512-43fcdaa6b9bd	2025-04-18 14:10:37.863914+00	t	Försäkringsärenden
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, company_role) FROM stdin;
1	Staff
2	Admin
3	Super-Admin
\.


--
-- Data for Name: tele_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tele_forms ("Id", first_name, email, service_type, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
58	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-03-17 09:40:26.646817+00	t	Tele/Bredband
59	Shaban	shaabaan_@hotmail.com	Bredband	Uppsägning	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-03-17 09:41:59.911811+00	t	Tele/Bredband
60	Oskar	shaabaan_@hotmail.com	Bredband	Ändring av tjänst	test	093c334e-2973-4218-b663-40689b07452e	2025-03-17 10:09:40.573162+00	t	Tele/Bredband
61	Kalle	shaabaan_@hotmail.com	Bredband	Fakturafrågor	hjälp mig!!	126897f3-92e7-410f-b04c-114f70ca6bc9	2025-03-17 10:20:56.63672+00	t	Tele/Bredband
62	Pontus	shaabaan_@hotmail.com	Bredband	Fakturafrågor	Min faktura är för dyr	b93c9d1f-8043-4541-92e0-f01f64436928	2025-03-18 13:35:52.89517+00	t	Tele/Bredband
63	Putte	shaabaan_@hotmail.com	Bredband	Fakturafrågor	Hej min faktura är för dyr	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022	2025-03-24 19:20:51.359099+00	t	Tele/Bredband
64	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	9a97700f-86e0-42db-b81f-696069b81f91	2025-04-04 08:31:09.766236+00	t	Tele/Bredband
65	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	48f781c8-9522-45d3-b595-db21ac86ceb8	2025-04-05 20:39:56.461446+00	t	Tele/Bredband
66	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	4fd6aea6-a808-485e-aa39-a44eeb816b7f	2025-04-05 20:46:32.180228+00	t	Tele/Bredband
67	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1692f76f-d7f8-4aaa-bebf-0e14e2764557	2025-04-05 20:48:37.612535+00	t	Tele/Bredband
68	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a5c9a8b4-d9fe-4990-8bcb-96d69ae93380	2025-04-05 20:54:44.827413+00	t	Tele/Bredband
69	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	7bd90d73-84c9-45e7-ad8c-777ad1981fb8	2025-04-05 21:07:20.58267+00	t	Tele/Bredband
70	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ca6e1315-ecd5-4d6b-acf7-f20dd4dbfeaa	2025-04-05 21:11:02.773225+00	t	Tele/Bredband
71	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	d746f089-c5aa-4cb0-9585-2783dc852a88	2025-04-05 23:07:27.054219+00	t	Tele/Bredband
72	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c8f213c6-5ebb-401e-b307-c5268b1c3fe9	2025-04-05 23:27:53.377642+00	t	Tele/Bredband
73	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a4256dde-d989-4340-a8bc-c74822fe6130	2025-04-05 23:43:21.894812+00	t	Tele/Bredband
74	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6f7b8da6-3460-4389-a6e0-518eb524e355	2025-04-05 23:55:59.323113+00	t	Tele/Bredband
75	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	454f4780-b2e2-4f21-8582-d9a2e6b5b09a	2025-04-05 23:58:22.945213+00	t	Tele/Bredband
76	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e9d78982-b97e-4b10-967f-319e646f3eb6	2025-04-06 00:12:01.176466+00	t	Tele/Bredband
77	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a144f288-90cc-4239-85cc-0fe6f9a30b5c	2025-04-06 00:24:54.041446+00	t	Tele/Bredband
78	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e444d31b-30fe-4703-96a3-07f04b61b2ac	2025-04-06 00:32:47.085156+00	t	Tele/Bredband
79	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	63a6de7e-5824-4d06-a69a-9f6e4c75b82f	2025-04-06 00:38:24.956877+00	t	Tele/Bredband
80	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	44152e81-3afa-4cef-b7c3-3b0b7a1a757c	2025-04-06 00:42:27.54959+00	t	Tele/Bredband
81	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	162979b2-a9ff-4756-a630-49a67aae4a18	2025-04-07 08:30:23.509119+00	t	Tele/Bredband
82	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	f44a26e8-118c-47d3-a31c-9790ef3ae766	2025-04-07 09:39:28.434902+00	t	Tele/Bredband
83	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	124b2899-d539-47a6-bc33-9f273ac82c21	2025-04-07 09:57:30.463886+00	t	Tele/Bredband
84	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2a90ee55-09f6-4285-b9f1-5e410bdf7856	2025-04-07 10:06:45.136775+00	t	Tele/Bredband
85	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	301d59a9-6ae8-4b77-8fe2-76bd94a75840	2025-04-07 10:07:41.081518+00	t	Tele/Bredband
86	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	18d87b72-b9a2-4b03-a576-55c714877da2	2025-04-07 10:50:43.620187+00	t	Tele/Bredband
87	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	64b2fdce-f047-433d-86c5-c53a1f9ec430	2025-04-07 11:07:44.715542+00	t	Tele/Bredband
88	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	771e1415-fbb6-446e-ae75-2a6f2ff470a6	2025-04-07 11:10:00.377901+00	t	Tele/Bredband
89	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	70b60853-d9b6-4a67-8497-71d04bf21a91	2025-04-07 11:16:37.109721+00	t	Tele/Bredband
90	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ff1fd07c-d783-4383-b628-3e2bd29924b0	2025-04-07 11:22:16.008185+00	t	Tele/Bredband
91	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b324f4be-3d4f-4ce1-9f96-ab36f4ea1f3d	2025-04-07 11:43:36.793347+00	t	Tele/Bredband
92	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2f4ff827-90e6-4ebf-8593-2e0486cf0933	2025-04-07 14:21:48.01088+00	t	Tele/Bredband
93	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ba648216-b8e3-4478-a827-df7ed2d51093	2025-04-07 14:35:04.168483+00	t	Tele/Bredband
94	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1ee9bf5e-bdf6-4813-932f-1f9fffa8a1e5	2025-04-07 14:41:34.14127+00	t	Tele/Bredband
95	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2c399e98-1142-436e-a002-d8ee50f4b268	2025-04-07 14:42:15.280065+00	t	Tele/Bredband
96	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	fbd8cafd-de55-465e-8539-5f168c13e951	2025-04-07 14:47:40.963935+00	t	Tele/Bredband
97	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2b8150cd-7c62-4e7d-9047-967b58c6d335	2025-04-07 14:52:42.267287+00	t	Tele/Bredband
98	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	226f6c21-5093-43c8-b51a-81a62935be37	2025-04-07 14:55:58.216298+00	t	Tele/Bredband
99	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	42c05906-da90-4e70-9043-345692187b72	2025-04-07 15:02:57.216374+00	t	Tele/Bredband
100	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	39420a89-2106-47a2-85da-f346366b4f9a	2025-04-07 15:11:30.553892+00	t	Tele/Bredband
101	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ccaf59ee-0a19-4177-8576-e42feb943b94	2025-04-07 15:18:20.380817+00	t	Tele/Bredband
102	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	585d8457-53b1-4393-b38f-3fc978e5c9e9	2025-04-07 15:22:11.331868+00	t	Tele/Bredband
103	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	227191f9-63d9-4ed4-b9fe-930a08f2b3d6	2025-04-07 15:36:15.69698+00	t	Tele/Bredband
104	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b076ce81-7307-4da2-adec-ed1fddef0ceb	2025-04-07 15:46:23.37923+00	t	Tele/Bredband
105	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5e00f611-51d0-45a8-a90b-63ead565677c	2025-04-07 15:51:32.427232+00	t	Tele/Bredband
106	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2b0998dc-cac5-4d86-b1db-7f61c378e6c2	2025-04-07 15:56:42.196867+00	t	Tele/Bredband
107	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f2a11e61-4b2b-43c2-a8aa-77135728094d	2025-04-07 16:09:56.782169+00	t	Tele/Bredband
108	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ef99b72c-de78-4b3f-aaa4-05ec719633d0	2025-04-07 16:11:07.010926+00	t	Tele/Bredband
109	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	857937ff-0004-4b1a-95cf-787c8ab7fce9	2025-04-07 16:15:48.28282+00	t	Tele/Bredband
110	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	de12b8aa-9dac-4797-b650-30cfac46cf9f	2025-04-07 18:15:21.046681+00	t	Tele/Bredband
111	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1d7b2e85-451e-4051-97d1-bcfc1cdc2756	2025-04-07 18:38:22.270132+00	t	Tele/Bredband
112	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8e92d748-ccbe-4b4b-976e-17ce25a0674b	2025-04-07 18:43:43.940726+00	t	Tele/Bredband
113	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c0ca282d-cbcb-4f31-8d82-64c2b83f9663	2025-04-07 18:44:38.742689+00	t	Tele/Bredband
114	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8df38a04-1830-4564-96c6-fbfdf0563a21	2025-04-07 19:12:00.620675+00	t	Tele/Bredband
115	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	82c92e3e-e740-48c3-a570-3373bb63f2d8	2025-04-07 19:14:34.031691+00	t	Tele/Bredband
116	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5de6f5e5-7e0c-49b8-9f08-bab3361368fc	2025-04-07 19:16:38.262987+00	t	Tele/Bredband
117	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	34a14dd1-e74b-447b-a20a-7fccb561c80a	2025-04-07 19:29:40.148504+00	t	Tele/Bredband
118	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0a217d1d-8f76-41eb-9eac-118cd822c50f	2025-04-07 19:35:41.183095+00	t	Tele/Bredband
119	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0e00fcae-3500-4e41-832b-22856e93f3a0	2025-04-07 19:37:17.881114+00	t	Tele/Bredband
120	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0e53794b-28aa-4f4f-b05b-fafff5efab2e	2025-04-07 19:38:40.842455+00	t	Tele/Bredband
121	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f4c93a08-c061-4ab2-a41a-2274fb23031e	2025-04-07 19:42:36.320618+00	t	Tele/Bredband
122	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e4821600-bc28-4be1-8739-4ad227afa1e5	2025-04-07 19:46:39.940639+00	t	Tele/Bredband
123	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	82b24062-1391-4efd-9852-bf23ef64775e	2025-04-07 19:55:52.083744+00	t	Tele/Bredband
124	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	de037df6-cca8-432f-9ef4-78349f850355	2025-04-07 20:03:00.176273+00	t	Tele/Bredband
125	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	49db9673-6e8c-4e19-8c84-8b839daf100d	2025-04-07 20:07:36.677931+00	t	Tele/Bredband
126	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ae1070ba-0139-4992-8910-ec2dd1bb63e2	2025-04-07 20:17:05.47052+00	t	Tele/Bredband
127	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c55394d1-983b-4c95-b4e8-6847fe087e6e	2025-04-07 20:19:58.592597+00	t	Tele/Bredband
128	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6277102d-3db4-4929-bdfc-7df2d7bab9e7	2025-04-07 20:31:47.355326+00	t	Tele/Bredband
129	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	97d0ad59-c581-46bc-9b7a-06b6500c3e3c	2025-04-07 20:38:01.516332+00	t	Tele/Bredband
130	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	3950e967-20b2-4aa7-9f96-8f1e97763fb4	2025-04-07 20:45:11.089904+00	t	Tele/Bredband
131	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a2b9482d-85e9-4e36-9514-65ed6fcc7765	2025-04-07 20:52:13.165568+00	t	Tele/Bredband
132	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	dcd24067-9281-4802-96f0-e0e4390a6ea2	2025-04-07 21:07:43.494025+00	t	Tele/Bredband
133	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	9fe7f6e6-8604-4bab-b66c-9474715494da	2025-04-07 21:13:25.630821+00	t	Tele/Bredband
134	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	09e639d4-9d07-452d-8388-7eefba507eb3	2025-04-07 21:23:42.648414+00	t	Tele/Bredband
135	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8631cc61-6ff5-4283-80df-ebfb24417d13	2025-04-07 21:28:41.863398+00	t	Tele/Bredband
136	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5c397c7e-efbf-4f88-b35e-07ac5e0e234d	2025-04-07 21:32:08.860324+00	t	Tele/Bredband
137	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	825b896e-80e4-4e01-86ff-3469992a2e4e	2025-04-07 21:43:43.158902+00	t	Tele/Bredband
138	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6b5ee55e-9fab-4fdb-a55a-61e74595ab09	2025-04-07 21:46:41.148289+00	t	Tele/Bredband
139	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2a1a1bca-6ae6-491a-9bb0-a2007959943e	2025-04-07 21:48:10.47891+00	t	Tele/Bredband
140	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2ab1e161-f14c-43e5-b0e6-67f958292ac0	2025-04-07 21:51:17.423646+00	t	Tele/Bredband
141	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	3c2a3c61-0b9c-4bd9-9b0a-28095323a790	2025-04-07 21:54:00.619931+00	t	Tele/Bredband
142	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	cba5b6e0-ea7c-4467-87c5-34f12bd26acf	2025-04-08 11:22:21.330915+00	t	Tele/Bredband
143	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a4b8a483-816b-4aef-bdf3-ec3946044df7	2025-04-08 11:25:48.274361+00	t	Tele/Bredband
144	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2a6106f5-2554-47c1-9011-37a9f91e512e	2025-04-08 11:27:25.111004+00	t	Tele/Bredband
145	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	fdeecd83-21f1-4f71-9749-d92919df6520	2025-04-08 11:59:19.501262+00	t	Tele/Bredband
146	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1571cf7e-db38-4e4a-bc2c-8a49ecf4a545	2025-04-08 12:07:40.036251+00	t	Tele/Bredband
147	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	d59dfe0b-9b48-480d-9fa2-965e1d30d071	2025-04-08 12:17:04.132908+00	t	Tele/Bredband
148	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f9920cad-626a-4d12-8a77-fb82e1cc1f59	2025-04-08 12:19:42.351199+00	t	Tele/Bredband
149	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	991e4bd3-8ca4-49ac-9a0f-a56e21ddebf1	2025-04-08 12:32:44.753204+00	t	Tele/Bredband
150	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	13dbb471-4693-49e9-8d87-ee0254fcf15b	2025-04-08 12:38:33.932825+00	t	Tele/Bredband
151	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	78e1cf63-c10d-4a00-b4b8-561b0995cf50	2025-04-08 12:57:07.046619+00	t	Tele/Bredband
152	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	65dfb100-bdc2-437c-bdde-07a48311454f	2025-04-08 13:04:24.565743+00	t	Tele/Bredband
153	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8a464a20-22ed-4eaf-8f72-3f262203a303	2025-04-08 13:07:23.823947+00	t	Tele/Bredband
154	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	43da8d19-4c4e-4542-8460-a03623ed5b9c	2025-04-08 13:53:36.491203+00	t	Tele/Bredband
155	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	08687475-2567-4ced-aa99-cb17e8c7e5f2	2025-04-09 09:45:16.482748+00	t	Tele/Bredband
156	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	4bc53f1f-39c2-420c-8d57-f9fb16878c1f	2025-04-09 09:49:56.576808+00	t	Tele/Bredband
157	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e38e7b1f-641c-4118-a2fb-b2446e84611b	2025-04-09 09:57:21.448046+00	t	Tele/Bredband
158	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b16cda77-f9c2-46e8-b6e7-b8e1a4605a52	2025-04-09 10:04:07.574215+00	t	Tele/Bredband
159	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b2df7180-258d-45f7-b142-46a256bb8af2	2025-04-09 10:10:04.844857+00	t	Tele/Bredband
160	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f252c27e-ac74-4c3d-b5ab-da5aeb8b0e18	2025-04-09 10:16:17.032491+00	t	Tele/Bredband
161	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6765fd16-0471-4f4d-9b23-bbc2be31fadf	2025-04-09 11:23:16.355272+00	t	Tele/Bredband
162	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0c6aadea-dda6-43cf-af54-0327508d3158	2025-04-09 11:51:03.429989+00	t	Tele/Bredband
163	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	ae0c88bb-ccb0-490e-b327-cd36b384978c	2025-04-09 12:24:02.942829+00	t	Tele/Bredband
164	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	08d00632-f411-4c77-8321-8ad60fb78b9c	2025-04-09 13:30:11.290885+00	t	Tele/Bredband
165	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test.	237342f3-c1fe-4221-a1c3-0f8095ccd318	2025-04-09 13:58:22.486171+00	t	Tele/Bredband
166	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	011901c7-41c5-41ae-b50e-6efb01b1b8d0	2025-04-09 14:19:24.1856+00	t	Tele/Bredband
167	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	288b27f2-35ac-4ea6-ab21-95222aa46fc2	2025-04-09 14:24:14.118376+00	t	Tele/Bredband
168	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	5736481e-75ec-4c9f-927a-d1cb7f7632c8	2025-04-09 14:24:30.237233+00	t	Tele/Bredband
169	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	76848032-cd3e-471d-a5b4-93ee56768aba	2025-04-09 14:31:56.186674+00	t	Tele/Bredband
170	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f02865d3-3e3c-46df-a395-cba79cd01953	2025-04-09 14:39:40.036198+00	t	Tele/Bredband
171	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e6042803-07e2-483b-8660-4b65efe30cb0	2025-04-09 14:57:55.958938+00	t	Tele/Bredband
172	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1f6ac2c6-1527-4af8-8537-9c8610fc73b9	2025-04-09 15:01:59.412642+00	t	Tele/Bredband
173	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c53a96d2-9b9a-4cd1-95e8-b0a2b4a59114	2025-04-09 15:06:37.821613+00	t	Tele/Bredband
174	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	e5e4a226-838a-4e65-badb-cb6076f104e9	2025-04-10 08:52:31.233473+00	t	Tele/Bredband
175	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0713f06e-1f9f-47a3-a762-66ddec38c601	2025-04-10 09:03:15.92039+00	t	Tele/Bredband
176	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	37e222c8-ba5d-42d6-8a60-e412754e3570	2025-04-10 09:08:32.005232+00	t	Tele/Bredband
177	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	a449d5d4-a213-42d3-9cb9-c31fa9429b75	2025-04-10 12:27:33.529298+00	t	Tele/Bredband
178	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	f47f99b1-de54-4055-815e-9abc926a5935	2025-04-10 13:01:45.182133+00	t	Tele/Bredband
179	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6fdca2f2-8984-4b6d-aeb0-205764a6b15d	2025-04-10 18:42:49.508863+00	t	Tele/Bredband
180	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f2f6ce12-b41d-4a6c-88d4-2c6865d0e2c0	2025-04-10 18:50:09.230089+00	t	Tele/Bredband
181	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a38c0e53-e501-4ebc-9fe5-2aab3d3ddbe9	2025-04-10 18:57:44.175541+00	t	Tele/Bredband
182	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b5fb27b2-9bb5-4710-9090-08c24f90ed28	2025-04-11 11:43:44.090985+00	t	Tele/Bredband
183	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	18bcd916-ffd2-4e5a-a5b7-b9eb3bfe9271	2025-04-11 11:48:51.18032+00	t	Tele/Bredband
184	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3b7fbb40-7d8c-41d8-854e-620785330536	2025-04-11 11:54:38.61841+00	t	Tele/Bredband
185	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0b7693b2-cf78-430c-b424-8435e9e32436	2025-04-11 11:59:30.514036+00	t	Tele/Bredband
186	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	801124ac-1684-4537-8d7c-3dd4865d091e	2025-04-11 12:02:10.110301+00	t	Tele/Bredband
187	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	d16fb318-ab0e-4abc-81b8-3b86da0ef8b1	2025-04-11 12:04:32.28224+00	t	Tele/Bredband
188	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	437c35a7-c8b6-47fc-95a4-70c50a26f734	2025-04-11 12:06:44.614212+00	t	Tele/Bredband
189	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	942edd4e-f35a-45f8-a10f-92dfba8976ed	2025-04-11 12:07:30.489711+00	t	Tele/Bredband
190	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	7f0fc582-9769-4cce-8d15-de3c71c9d6f3	2025-04-11 12:07:57.763589+00	t	Tele/Bredband
191	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	aef05207-a844-4b03-ae0a-17c62c99c116	2025-04-11 12:38:38.082611+00	t	Tele/Bredband
192	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	e3df92c2-e4c8-49ca-bcad-d61828b4a935	2025-04-11 12:46:38.122916+00	t	Tele/Bredband
193	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	40e16c16-ebcf-40e3-a019-97a5e016f652	2025-04-11 13:05:06.398008+00	t	Tele/Bredband
194	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	cfce595d-a60e-4e99-974e-2cca4b30ebe6	2025-04-11 13:08:06.724064+00	t	Tele/Bredband
195	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	a51d0635-ac41-419e-af91-5643639b946c	2025-04-11 13:10:33.326701+00	t	Tele/Bredband
196	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	1710e783-ea1d-4cb6-b271-84489fdd4892	2025-04-11 13:17:37.992697+00	t	Tele/Bredband
197	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	64a499ce-479f-463c-a501-97a4b49f3183	2025-04-11 13:18:48.506278+00	t	Tele/Bredband
198	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	603b5b8a-7553-404b-891b-67624fc7ec41	2025-04-11 13:19:35.436136+00	t	Tele/Bredband
199	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b03bfb82-0980-495f-bea0-e589f51f94ed	2025-04-11 13:20:27.369527+00	t	Tele/Bredband
200	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0336124d-47bf-43c0-a7fe-b4d55de7c44a	2025-04-11 13:21:33.658097+00	t	Tele/Bredband
201	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	620b97a0-8bf8-4b03-9982-678bbaca9847	2025-04-11 13:25:01.407459+00	t	Tele/Bredband
202	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	62357806-1ea6-4893-ab3c-6d948e2f69a3	2025-04-11 13:30:06.3161+00	t	Tele/Bredband
203	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	e6295600-38da-4b53-b405-4776a955b5e1	2025-04-11 13:38:32.80415+00	t	Tele/Bredband
204	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	1d0969cb-9fa9-4c53-97c6-fd5156a86f3c	2025-04-11 13:50:39.742326+00	t	Tele/Bredband
205	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	4a102386-35b8-4c36-b690-64e14b01b9cb	2025-04-11 14:01:31.504158+00	t	Tele/Bredband
206	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	ee76942e-8b91-4dbc-b640-8c480bf2b2cc	2025-04-11 14:05:41.036768+00	t	Tele/Bredband
207	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	99552341-6178-43d0-bbaa-6d6fe4aee386	2025-04-11 14:06:24.959099+00	t	Tele/Bredband
208	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	fba96f28-cd86-47ca-b781-274ca21744ce	2025-04-11 14:07:50.771281+00	t	Tele/Bredband
209	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	d5ba788d-b77f-4edb-875c-242b2a4d092d	2025-04-11 14:08:34.517704+00	t	Tele/Bredband
210	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	2756f9ef-4768-4837-afd0-f355a7a9a198	2025-04-11 14:09:17.611635+00	t	Tele/Bredband
211	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	347be6c8-c988-4bac-9e47-2fe8dcfc3ba6	2025-04-13 10:20:13.55116+00	t	Tele/Bredband
212	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b94f26c8-5af7-44c8-bfda-361ec9bf4d3f	2025-04-13 10:25:29.847524+00	t	Tele/Bredband
213	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	20b28208-0d3c-4953-83da-faefa0947a99	2025-04-13 10:33:38.285108+00	t	Tele/Bredband
214	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	14d28c7e-9ba8-47d5-a994-ca980864e173	2025-04-13 10:37:46.973968+00	t	Tele/Bredband
215	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	d3dd2d95-eb43-41e5-b804-58369d9b02f9	2025-04-13 12:36:17.413091+00	t	Tele/Bredband
216	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0f82c1a4-748f-4e94-9391-78898987a57b	2025-04-13 12:51:37.231351+00	t	Tele/Bredband
217	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	8180c1e0-2b99-40d8-b8ad-b4cc14c4d33a	2025-04-13 12:55:54.094583+00	t	Tele/Bredband
218	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	cea4257a-a962-4fdd-8241-47bf1f26cd37	2025-04-13 12:58:28.245044+00	t	Tele/Bredband
219	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	7d14a08b-a955-475f-906a-f555ba255de3	2025-04-13 14:22:55.64736+00	t	Tele/Bredband
220	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	c3f050d1-4ee7-4076-a5d8-164d5214357e	2025-04-13 14:23:59.656802+00	t	Tele/Bredband
221	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b344692f-c8ea-44ba-a3e2-7e277aa4c408	2025-04-13 14:25:30.730823+00	t	Tele/Bredband
222	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	91a6fb18-a2c7-45b8-aff7-2eba686c269e	2025-04-13 14:33:57.283761+00	t	Tele/Bredband
223	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	f5153b52-d5eb-4cb7-86c7-7d472fb59a56	2025-04-13 14:34:38.061672+00	t	Tele/Bredband
224	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	ec39fa87-846f-480a-ab55-0b9333d29663	2025-04-13 14:36:23.243173+00	t	Tele/Bredband
225	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3e7e4377-3460-483d-ac3c-4e6ba9456a87	2025-04-13 14:39:24.311264+00	t	Tele/Bredband
226	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	7e7811d8-f3ae-4392-a879-aeb39c18dd16	2025-04-13 14:42:22.882073+00	t	Tele/Bredband
227	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	80a89aa4-053c-43dc-9fe9-dc9fc866b6d8	2025-04-13 14:50:14.36086+00	t	Tele/Bredband
228	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3ce2b799-2587-47d9-a65a-b8489997dda9	2025-04-13 14:52:47.257408+00	t	Tele/Bredband
229	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	4db2bd1e-f4f3-4e26-9ad2-37b452dae3f5	2025-04-13 14:55:15.358887+00	t	Tele/Bredband
230	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	50a844c3-be3c-4bd6-9c8f-cfc4e978e51c	2025-04-13 15:03:52.750668+00	t	Tele/Bredband
231	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	eeaf88fc-53a7-4969-8605-89ab9ff86c1f	2025-04-13 15:06:28.542248+00	t	Tele/Bredband
232	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	4f42dea4-4d6a-4f2e-b052-de23f8086f83	2025-04-13 15:10:06.899487+00	t	Tele/Bredband
233	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	106bdf4f-0c9a-4405-9cf4-9e93663eb6ac	2025-04-13 15:12:10.26851+00	t	Tele/Bredband
234	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	63a111d2-f5ca-4220-9bc0-8ca828517b90	2025-04-13 15:14:04.004949+00	t	Tele/Bredband
235	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0353ec24-098b-4220-a988-429372b5ee17	2025-04-13 15:15:55.11073+00	t	Tele/Bredband
236	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	9f01a56c-33cc-46d6-a957-ebcaa69d33b2	2025-04-13 15:17:35.114285+00	t	Tele/Bredband
237	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b73a8ca5-e4f5-4a84-aa3a-b4837d7954d6	2025-04-13 15:21:29.318211+00	t	Tele/Bredband
238	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	8f7571b4-4b79-4c71-9d2a-00a500be5e3f	2025-04-13 15:23:28.782597+00	t	Tele/Bredband
239	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	86bc1a35-8954-4aa8-9c70-e37af4847642	2025-04-13 15:28:03.903467+00	t	Tele/Bredband
240	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3a4294f2-487c-46eb-a6fc-c00ebb9cfe98	2025-04-13 15:32:27.665228+00	t	Tele/Bredband
241	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	42e02767-2b9b-44b1-b58a-dd8d1af76085	2025-04-14 09:09:05.873994+00	t	Tele/Bredband
242	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b0201b98-db35-447a-86bd-eb5411659b85	2025-04-14 09:11:18.356126+00	t	Tele/Bredband
243	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	ce76ba3f-5235-44bd-9f7d-e97c2bc691ce	2025-04-14 09:13:46.788243+00	t	Tele/Bredband
244	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	10312662-077f-460b-affd-6b53769c9850	2025-04-14 09:17:05.280588+00	t	Tele/Bredband
245	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	d76cbd88-33cf-4303-bc75-4c591bf816fd	2025-04-14 09:19:22.078322+00	t	Tele/Bredband
246	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	c47065d8-2fcd-4921-8caf-faa750a9fa56	2025-04-14 09:29:42.708667+00	t	Tele/Bredband
247	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	ef017e6c-76ad-4fcd-ad9b-3e4daddb146c	2025-04-14 09:33:11.431305+00	t	Tele/Bredband
248	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	c543cdfb-60ed-446b-86bc-3ca589193a1d	2025-04-14 09:34:20.034971+00	t	Tele/Bredband
249	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3073252f-2a3b-4836-9d4d-890355ae8c5f	2025-04-14 09:35:18.903223+00	t	Tele/Bredband
250	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	6cf5aea5-b7ea-410c-b026-3a9dd646cb84	2025-04-14 09:37:44.126293+00	t	Tele/Bredband
251	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	e376a373-a99e-4415-ab12-f3f92a9f6cb1	2025-04-14 10:13:29.599067+00	t	Tele/Bredband
252	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	a44b6d6d-9a83-477f-857a-c208317105ac	2025-04-14 10:15:19.866221+00	t	Tele/Bredband
253	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	6f54c37e-af6c-4035-bc9f-eb38838b1866	2025-04-14 10:27:24.467299+00	t	Tele/Bredband
254	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	0f3364cc-6b5a-4527-a8b7-4b5b0495e997	2025-04-14 10:27:37.915842+00	t	Tele/Bredband
255	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	d53a2da5-cb86-4f88-9f48-134e3eb4549a	2025-04-14 10:28:23.447611+00	t	Tele/Bredband
256	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	c32c1248-2629-4697-be2f-89d7f62043c2	2025-04-14 10:29:46.85681+00	t	Tele/Bredband
257	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	f36cef1b-7e65-44b9-9a04-072a733c248e	2025-04-14 10:31:34.020772+00	t	Tele/Bredband
258	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	ce987158-5c98-4144-87a5-fcee6d316d01	2025-04-14 10:36:43.667981+00	t	Tele/Bredband
259	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	d33b121f-66e2-4fac-b2d3-a167068bd506	2025-04-14 10:48:55.556642+00	t	Tele/Bredband
260	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	ec89c802-2647-4204-af07-21964426722b	2025-04-14 10:55:46.096084+00	t	Tele/Bredband
261	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	b8037762-3392-4933-8271-18378f8bcc4e	2025-04-14 10:59:51.687552+00	t	Tele/Bredband
262	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	1f332046-da31-4b1f-8188-e5ac449b991f	2025-04-14 11:03:41.027989+00	t	Tele/Bredband
263	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	a0f57c27-8f98-4abf-8371-cf25088a2b03	2025-04-14 11:08:46.370922+00	t	Tele/Bredband
264	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	d9d9b35a-451c-410e-861d-e8d532a91552	2025-04-14 11:12:45.086119+00	t	Tele/Bredband
265	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	55a87a1e-596f-4ed8-8240-de07ada24b9d	2025-04-14 11:18:06.925955+00	t	Tele/Bredband
266	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f5f7a535-12af-49e4-866e-52b3d55a2052	2025-04-14 11:26:41.399778+00	t	Tele/Bredband
267	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	286e2aff-6645-43f6-b671-92f374d8ffa1	2025-04-14 13:13:30.483165+00	t	Tele/Bredband
268	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	ba4c4611-55d8-49b5-a1dc-c7f8cb0c7ff7	2025-04-14 13:18:08.551326+00	t	Tele/Bredband
269	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	83064358-0dbf-47e1-a7f0-d2af97574e03	2025-04-14 13:28:06.987195+00	t	Tele/Bredband
270	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	1b7db8de-9ec3-41be-b113-b0ba65d66210	2025-04-14 13:36:57.122562+00	t	Tele/Bredband
271	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	ad5c26ca-7361-45c7-affb-9be7fdf461ed	2025-04-14 13:37:13.056089+00	t	Tele/Bredband
272	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	e9793515-e9f4-42b5-879e-3a3568db518d	2025-04-14 13:43:12.079735+00	t	Tele/Bredband
273	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	959e6047-3ff4-4ef9-aafa-078d8b2e074d	2025-04-14 14:00:47.282552+00	t	Tele/Bredband
274	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	a8a88b4c-cce1-4b23-b675-beb9ee477801	2025-04-14 14:01:39.10504+00	t	Tele/Bredband
275	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	9e14a120-37f6-4ba4-8691-7e1a05f1ab37	2025-04-14 14:03:58.230724+00	t	Tele/Bredband
276	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	03b117bd-08ad-4c5b-a0c0-6565ab21bfea	2025-04-14 14:14:41.524746+00	t	Tele/Bredband
277	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	b1646bfc-3aba-4249-8e66-4546ce253c3c	2025-04-14 14:34:07.774906+00	t	Tele/Bredband
278	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	db212aa0-fbd6-4f20-b979-f7c21c34bbb1	2025-04-14 14:41:58.828541+00	t	Tele/Bredband
279	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	b6b95702-f72c-4aa6-92f0-9f4bc424bae0	2025-04-14 14:53:39.536062+00	t	Tele/Bredband
280	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	136ff5e9-a9cb-413a-a0f4-8b531b667cfb	2025-04-14 15:09:41.777127+00	t	Tele/Bredband
281	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	1705c314-5a1e-43a1-8a3c-7b5f3025d478	2025-04-14 15:23:02.952941+00	t	Tele/Bredband
282	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	80fcc843-4201-49cc-a653-92372298bf2e	2025-04-14 15:37:26.59242+00	t	Tele/Bredband
283	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	c7d31847-9865-4136-a13f-66a53ed513ad	2025-04-14 16:16:50.255416+00	t	Tele/Bredband
284	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	07caec57-10ff-4470-a78d-b3b2cf615315	2025-04-14 16:51:38.419827+00	t	Tele/Bredband
285	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	6a800204-2227-49e6-829d-d56d7c595128	2025-04-14 16:52:44.026054+00	t	Tele/Bredband
286	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	5ecdfc3e-9fe8-4232-b616-2887a3920249	2025-04-14 16:57:05.059914+00	t	Tele/Bredband
287	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	b9277e00-b4ce-481e-8060-504e1a04b01c	2025-04-14 17:01:15.956839+00	t	Tele/Bredband
288	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	d73da6c4-0d3c-4f8e-a195-fa8459de9216	2025-04-14 17:03:21.563424+00	t	Tele/Bredband
289	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	d8d95843-b1fb-4321-bf2e-47b2ed5f03cf	2025-04-14 17:13:57.081889+00	t	Tele/Bredband
290	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	555f88ce-9348-455f-8abe-31ced505b24c	2025-04-14 17:15:27.534321+00	t	Tele/Bredband
291	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	fba15a04-faca-4bf9-b747-f85d47b7598d	2025-04-14 17:16:23.87824+00	t	Tele/Bredband
292	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	b149d51f-9ccf-4198-a669-131a94aaa28d	2025-04-14 17:20:02.341092+00	t	Tele/Bredband
293	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	15ea89d0-f42d-445f-8c3b-73a68e0c3be0	2025-04-14 18:25:04.070101+00	t	Tele/Bredband
294	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	241a47c2-50ca-42a6-b67f-6e254f3df27b	2025-04-14 18:28:09.691628+00	t	Tele/Bredband
295	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	87cf9904-9741-488c-bebe-8070cb935b13	2025-04-14 18:32:13.971848+00	t	Tele/Bredband
296	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3151159c-280b-447b-8098-7a704108ef00	2025-04-14 18:35:44.241854+00	t	Tele/Bredband
297	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	143cb2a3-e1bf-4450-9571-5b3f87ed8611	2025-04-14 18:39:01.877114+00	t	Tele/Bredband
298	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	712e1cad-17da-4981-8f13-6b73fe1d921a	2025-04-14 18:42:38.709639+00	t	Tele/Bredband
299	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	6940fc35-7d31-49ed-a263-a525a80b1480	2025-04-14 18:44:35.174179+00	t	Tele/Bredband
300	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	5558b20b-b703-4beb-9932-f0a93506b1a0	2025-04-14 18:45:18.357036+00	t	Tele/Bredband
301	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	eff874b7-682c-4ed4-83bf-7b4136f456d9	2025-04-14 18:50:04.898362+00	t	Tele/Bredband
302	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	4dacb355-eb22-45c7-ab4e-2c8d3f2e665f	2025-04-14 19:04:33.793788+00	t	Tele/Bredband
303	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	502270d3-72fa-4d05-94e2-6e89c0f10bdd	2025-04-14 19:08:11.12954+00	t	Tele/Bredband
304	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	37366d86-06e7-424a-ac22-208a4bda1ae6	2025-04-14 19:10:18.857721+00	t	Tele/Bredband
305	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	ed655da1-2a98-4b78-9e6e-f584c752f6d8	2025-04-14 19:12:42.64921+00	t	Tele/Bredband
306	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	54d4a9d3-346c-43d6-ac18-c06d9b6d0473	2025-04-14 19:14:04.077704+00	t	Tele/Bredband
307	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	4a65e585-1f5b-47d2-9ca0-5d6311c7340d	2025-04-14 19:15:07.625669+00	t	Tele/Bredband
308	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	0535b338-7290-4966-9852-07ae62c424a5	2025-04-14 19:22:44.005513+00	t	Tele/Bredband
309	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	e017a0a1-87d3-4dd6-a7fa-a65ea8d71501	2025-04-14 19:24:33.64055+00	t	Tele/Bredband
310	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	a542f9c9-5c42-48c1-a0cd-917e6cb02cc3	2025-04-14 19:27:10.035806+00	t	Tele/Bredband
311	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	073b3a46-415e-4b1d-b42d-6ff994a25f89	2025-04-14 19:33:36.994292+00	t	Tele/Bredband
312	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	be964866-ad27-4b09-84d5-9166975621b9	2025-04-14 19:34:15.449822+00	t	Tele/Bredband
313	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	207cf423-9565-4819-9fb4-7beab713a220	2025-04-14 19:36:02.404972+00	t	Tele/Bredband
314	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	7d022a9d-b0c2-42d5-af7d-58730b0c3624	2025-04-14 19:37:14.283556+00	t	Tele/Bredband
315	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	8e0198dc-10b5-4c92-8dc1-16fa9280ec3e	2025-04-14 20:01:54.626706+00	t	Tele/Bredband
316	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	c09ea78d-3f0b-48e9-bafc-5bd0af5fa61c	2025-04-14 20:02:01.916868+00	t	Tele/Bredband
317	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	69199238-aa43-489a-8dc2-7b15aeca39c4	2025-04-14 20:07:54.245857+00	t	Tele/Bredband
318	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f411b3b3-d590-4198-99bf-3b3d61eb5c48	2025-04-14 20:13:14.962249+00	t	Tele/Bredband
319	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	68017963-a56d-4f26-b118-ffe837c9f426	2025-04-14 20:28:09.297081+00	t	Tele/Bredband
320	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	c0048fda-6515-42ad-8dab-a29b691f46ea	2025-04-14 20:33:15.923766+00	t	Tele/Bredband
321	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	22cf4023-8d2c-40d8-96d3-cbabbff389d0	2025-04-14 20:37:10.278115+00	t	Tele/Bredband
322	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	10c671bd-9fa1-4a76-9ce3-9e8daae880b6	2025-04-14 20:49:29.614995+00	t	Tele/Bredband
323	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	401b0300-79a4-4278-82f9-825da9ea7491	2025-04-15 07:48:00.073211+00	t	Tele/Bredband
324	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	e1148244-6b18-4ffc-92e0-5267441a3cc1	2025-04-15 07:59:33.312567+00	t	Tele/Bredband
325	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	8b0f798c-a378-4225-a0f6-4a75557ced1c	2025-04-15 08:14:03.130132+00	t	Tele/Bredband
326	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	46b41029-98de-44de-ae5a-49a1db0aa0fd	2025-04-15 09:05:22.396903+00	t	Tele/Bredband
327	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	b1a40dcf-9489-4f46-a5ec-51943c7074af	2025-04-15 09:16:27.470011+00	t	Tele/Bredband
328	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	13c83be9-472c-462d-95ff-106aa3d495b7	2025-04-15 09:34:25.040805+00	t	Tele/Bredband
329	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	4ab69158-2994-40df-a958-f0d41bf4fc48	2025-04-15 09:49:47.805612+00	t	Tele/Bredband
330	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	89b685d5-1364-47b2-87b8-0f7a9889d61c	2025-04-15 09:50:20.932791+00	t	Tele/Bredband
331	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	ffdfdbee-8818-4989-92ed-51c5cb947408	2025-04-15 10:01:25.171597+00	t	Tele/Bredband
332	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	08bc1fe1-2f0c-4eaf-a1c9-d77f3d68f13b	2025-04-15 10:12:31.636239+00	t	Tele/Bredband
333	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f4b36c5e-7bae-49a0-9db0-1283e1f2204c	2025-04-15 10:29:57.940474+00	t	Tele/Bredband
334	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	24580077-a3b8-4350-ba5b-5427f80377f7	2025-04-15 10:43:04.802599+00	t	Tele/Bredband
335	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	4d3272cb-d526-408a-958f-3f6c8ff0617c	2025-04-15 10:54:39.302151+00	t	Tele/Bredband
336	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	c4f3b8fc-bbae-423c-be67-4d1462d1aa06	2025-04-15 11:24:39.426835+00	t	Tele/Bredband
337	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	208d3846-8bec-4a49-b25a-989582fa953c	2025-04-15 11:29:25.100242+00	t	Tele/Bredband
338	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	d4dfa9f0-7c54-4003-8afb-ee4aa717d1c7	2025-04-15 11:42:23.095255+00	t	Tele/Bredband
339	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	b5b50100-1df4-46c8-bb34-ed702fc82b49	2025-04-15 11:46:12.836034+00	t	Tele/Bredband
340	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	588390e3-7932-492d-a7bc-d05754a1e71b	2025-04-15 11:48:41.951975+00	t	Tele/Bredband
341	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	cdb3cf09-7110-454b-8daf-8d731d1da3a7	2025-04-15 12:05:03.605789+00	t	Tele/Bredband
342	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	10df7456-ce7b-4584-bd5c-30045695e5a7	2025-04-15 12:07:22.975012+00	t	Tele/Bredband
343	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	f62613b7-c0f7-4a0e-9fc1-3a613b994617	2025-04-15 12:16:48.616983+00	t	Tele/Bredband
344	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	2e9a43c5-b1c6-4995-936b-b8f847d3985c	2025-04-15 12:18:23.134837+00	t	Tele/Bredband
345	Saban	shaabaan_@hotmail.com	Mobiltelefoni	Fakturafrågor	Min faktura stämmer inte.	96217f6b-ab0a-406e-a1bb-16a07707ac09	2025-04-15 12:31:52.199364+00	t	Tele/Bredband
346	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	4c83aa51-473e-4d82-b288-4d60448e57ca	2025-04-15 12:39:29.844398+00	t	Tele/Bredband
347	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	1dc377c7-53b4-4092-9afb-c12ef59d1d1d	2025-04-15 13:01:31.413885+00	t	Tele/Bredband
348	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	61f2ed6d-00ec-4303-9d1a-44f4195c16fb	2025-04-15 13:44:46.951769+00	t	Tele/Bredband
349	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	3e8bce95-8b21-4903-a2ad-bf4a61981428	2025-04-15 13:55:47.460576+00	t	Tele/Bredband
350	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	8c44365c-f48e-42b1-a2c0-74cd11363aa8	2025-04-15 14:06:40.770984+00	t	Tele/Bredband
351	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	9412d814-c5b4-49b6-b891-9c5a63fa51cd	2025-04-15 15:07:13.604675+00	t	Tele/Bredband
352	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	d174f397-cb3e-459a-9aa6-806086b4e9f5	2025-04-16 08:10:58.210928+00	t	Tele/Bredband
353	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	4a85170f-88db-4313-9f82-a9539aaa9edd	2025-04-16 08:20:23.159753+00	t	Tele/Bredband
354	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	adab4671-9dea-46d7-a7ff-f6401d9f6c85	2025-04-16 08:25:51.316418+00	t	Tele/Bredband
355	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f2c27178-0b9c-4b00-bf1c-ae6c58f7d127	2025-04-16 08:35:43.222212+00	t	Tele/Bredband
356	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	9f3e4b44-1098-49aa-9ca5-e868b15125e4	2025-04-16 08:57:12.988458+00	t	Tele/Bredband
357	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	0f608098-ed38-4635-a213-50d0cbf42c75	2025-04-16 09:07:04.852338+00	t	Tele/Bredband
358	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	2b4bcf55-2eb4-4596-aa68-b248f0cc0b26	2025-04-16 09:14:56.709191+00	t	Tele/Bredband
359	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	cfee50d8-e939-403a-b4a4-167526e8b2d3	2025-04-16 09:25:42.372875+00	t	Tele/Bredband
360	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f56ac07f-e936-4c74-a661-ef064faf619c	2025-04-16 09:34:14.425066+00	t	Tele/Bredband
361	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	9a1ca3e3-791d-4aa9-ac55-6d914650c1fd	2025-04-16 09:42:12.804754+00	t	Tele/Bredband
362	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	6b30d171-53d4-44c4-b598-1f17a6d55d83	2025-04-16 12:48:52.353496+00	t	Tele/Bredband
363	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	69f73f4e-9ca7-44f0-9fcd-ba7a7094fc17	2025-04-16 12:52:04.903876+00	t	Tele/Bredband
364	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	e09504a8-a8f0-4e11-b64b-e5f9d83f6c7c	2025-04-16 13:07:03.976619+00	t	Tele/Bredband
365	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	9cfb62cd-4d11-42e1-9ea7-bbf44a249f80	2025-04-16 13:16:13.968962+00	t	Tele/Bredband
366	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f06ee9f4-ba57-4960-9459-f6e1de41e5ce	2025-04-16 13:21:26.716427+00	t	Tele/Bredband
367	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	7426b0be-dfbd-4ccb-93a7-bfe37fbe08f5	2025-04-16 13:26:08.728298+00	t	Tele/Bredband
368	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	3dee26ab-349b-4b86-b003-993e22059b97	2025-04-16 13:32:39.813699+00	t	Tele/Bredband
369	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	0b521eed-ff49-4938-aae4-dafea2ee417e	2025-04-16 13:42:55.144148+00	f	Tele/Bredband
370	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	8da45d66-cb3c-4e88-962d-bafeb49f599f	2025-04-16 13:46:37.919317+00	f	Tele/Bredband
371	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	7e30bb34-e149-4052-a53b-a1da49a81b8c	2025-04-16 14:05:13.838726+00	t	Tele/Bredband
372	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	a25b5f1c-2f83-49ca-bc28-c464fdb43867	2025-04-16 14:07:37.55709+00	f	Tele/Bredband
373	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	f1354356-62fd-4fcc-a357-0163adeeaee3	2025-04-16 14:07:56.556496+00	f	Tele/Bredband
374	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b09b483b-b231-48ab-b57d-4c0137248765	2025-04-16 14:11:38.181133+00	t	Tele/Bredband
375	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	510c40b8-9f44-4e3b-b65b-6c74c91d5e52	2025-04-16 14:29:04.433665+00	t	Tele/Bredband
376	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	d394a9c5-b8e6-4308-a985-bad512796cfc	2025-04-16 14:31:35.378983+00	t	Tele/Bredband
377	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	fcd7aeea-5b15-4905-a68b-bb79cc09b4df	2025-04-16 14:35:48.933616+00	t	Tele/Bredband
378	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b48fa385-414f-4268-b338-d67043a16ca8	2025-04-16 14:37:34.666095+00	t	Tele/Bredband
379	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	89deaf0a-5c89-410d-9ddf-47c96b15bfc2	2025-04-16 14:52:32.360534+00	t	Tele/Bredband
380	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	aaf5407c-da31-4257-bb34-5f039905a5c6	2025-04-16 14:58:04.334962+00	t	Tele/Bredband
381	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	a5f8257e-d3d6-40fd-a4c3-226c80b9e32a	2025-04-16 14:58:32.222094+00	t	Tele/Bredband
382	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	e27bd309-f94f-4a99-9d3b-005d8d43567b	2025-04-16 15:04:19.743637+00	t	Tele/Bredband
383	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	63041bfe-a366-48a7-8667-a536b6c97d24	2025-04-16 15:34:04.617742+00	t	Tele/Bredband
384	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	43ef15bd-3fe7-4362-8dd5-bbe10bb33378	2025-04-16 15:42:23.448942+00	t	Tele/Bredband
385	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	08db0c4a-e017-4a80-9ee7-3136e0c5c958	2025-04-16 15:45:56.692674+00	t	Tele/Bredband
386	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	f98e4f92-1d9d-4fa6-995b-27cadd0eb2b1	2025-04-17 08:07:59.896465+00	t	Tele/Bredband
387	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ed58c61f-6eaa-4c8e-b590-9bd6266f9313	2025-04-17 09:21:46.064591+00	t	Tele/Bredband
388	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	8685b377-7a7d-46c8-8abf-91ee94b0de11	2025-04-17 10:18:55.306861+00	t	Tele/Bredband
389	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	caf9fb82-f9a3-40b2-8226-e9e4db365c6d	2025-04-17 10:22:11.284495+00	t	Tele/Bredband
390	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	4f0b95b3-2897-4001-b63b-6ceb2a78dc05	2025-04-17 10:40:40.906882+00	f	Tele/Bredband
391	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	f68903b1-4253-475b-85cd-69d4adf081e0	2025-04-17 10:44:05.884504+00	t	Tele/Bredband
392	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	4634eb5f-150e-4047-9ee7-7b2c660050e3	2025-04-17 10:56:23.639884+00	t	Tele/Bredband
393	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	b680990f-aac3-4b3f-a31a-6eb2f47b0561	2025-04-17 11:00:30.698482+00	t	Tele/Bredband
394	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	eb561b3e-6f89-4f89-821a-fef29875e57c	2025-04-18 12:23:29.783105+00	t	Tele/Bredband
395	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	Jag behöver hjälp nu.	328343ee-22c8-472c-8978-50bf676f40e2	2025-04-18 12:31:17.763151+00	t	Tele/Bredband
396	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	8db21426-0427-46ec-b054-c1859288a557	2025-04-18 13:47:24.626778+00	t	Tele/Bredband
397	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	35ee80a2-6782-4222-a548-e8f6cfc99e8c	2025-04-18 13:50:02.944524+00	t	Tele/Bredband
398	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	384ead25-7885-4058-aa54-f97616c71c98	2025-04-18 13:51:52.15151+00	t	Tele/Bredband
399	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	bb55b1b8-e013-481b-95a0-6f22cb2e7ac8	2025-04-18 13:52:42.093576+00	t	Tele/Bredband
400	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	e5581436-eb10-4a93-8933-6e9007552f47	2025-04-18 13:54:21.58111+00	t	Tele/Bredband
401	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	22f4cc6d-b4a3-437d-8a6e-7276ed1aab53	2025-04-18 14:07:38.860205+00	t	Tele/Bredband
402	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	4d6fa8db-6b45-4656-ad8d-02c8a0a3b8b5	2025-04-18 14:08:11.084942+00	t	Tele/Bredband
403	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	d57c28fa-4697-4a8f-a4f0-c0a659e3c08d	2025-04-18 14:08:32.888643+00	t	Tele/Bredband
404	Martin	hultberg.80@gmail.com	Bredband	Övrigt	Jag vill ha hjälp med fast telefoni	715faf8f-5137-400d-9a7c-a3c0e5fd29e7	2025-04-18 14:10:35.556744+00	t	Tele/Bredband
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("Id", first_name, password, created_at, company, role_id, email) FROM stdin;
261	zunken123	abc123	2025-04-18 14:10:35.911048+00	fordon	1	hultberg300@gmail.com
47	KevinAdmin	abc123	2025-03-10 10:35:41.751444+00	tele	2	maadridista@gmail.com
61	Ville	12345	2025-03-14 15:14:26.860745+00	tele	2	ville.eliasson99@gmail.com
55	Kevin	abc123	2025-03-11 10:29:06.310854+00	forsakring	1	test@gmail.com
132	Staff	staff	2025-04-09 15:04:48.796738+00	forsakring	1	staff@mail.com
185	Shab	123	2025-04-15 12:44:57.55994+00	fordon	1	shaban@test.se
232	KevinTest	abc123	2025-04-16 14:14:24.597627+00	tele	1	kevin.test@gmail.com
56	Martin	1234	2025-03-11 10:36:40.756121+00	tele	2	hultberg80@gmail.com
215	ville	12345	2025-04-16 12:48:54.592851+00	Fordonsservice	2	ville.test@test.com
62	Saban	123	2025-03-17 10:24:57.789707+00	tele	1	saban@playrighttest.se
188	Admin	123	2025-04-15 14:30:16.54298+00	tele	2	Admin@test.se
153	zunken123	abc111	2025-04-14 12:53:08.26904+00	fordon	1	hultberg800@gmail.com
105	heheh	555	2025-04-09 10:14:06.781117+00	fordon	1	heheh@mail.com
94	Admino	02589	2025-03-14 08:47:46.61655+00	fordon	3	siggebratt1@gmail.com
\.


--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ChatMessages_Id_seq"', 1482, true);


--
-- Name: FordonForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FordonForms_Id_seq"', 1, false);


--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ForsakringsForms_Id_seq"', 1, false);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_id_seq"', 1, false);


--
-- Name: TeleForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TeleForms_Id_seq"', 1, false);


--
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 1, false);


--
-- Name: archived_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archived_tickets_id_seq', 156, true);


--
-- Name: chat_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_ratings_id_seq', 7, true);


--
-- Name: dynamicforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dynamicforms_id_seq', 1, false);


--
-- Name: fordon_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."fordon_forms_Id_seq"', 406, true);


--
-- Name: forsakrings_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."forsakrings_forms_Id_seq"', 239, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: tele_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tele_forms_Id_seq"', 404, true);


--
-- Name: users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users_Id_seq"', 261, true);


--
-- Name: chat_messages ChatMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT "ChatMessages_pkey" PRIMARY KEY (id);


--
-- Name: fordon_forms PK_FordonForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fordon_forms
    ADD CONSTRAINT "PK_FordonForms" PRIMARY KEY ("Id");


--
-- Name: forsakrings_forms PK_ForsakringsForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forsakrings_forms
    ADD CONSTRAINT "PK_ForsakringsForms" PRIMARY KEY ("Id");


--
-- Name: tele_forms PK_TeleForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tele_forms
    ADD CONSTRAINT "PK_TeleForms" PRIMARY KEY ("Id");


--
-- Name: users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: fordon_forms UQ_FordonForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fordon_forms
    ADD CONSTRAINT "UQ_FordonForms_ChatToken" UNIQUE (chat_token);


--
-- Name: forsakrings_forms UQ_ForsakringsForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forsakrings_forms
    ADD CONSTRAINT "UQ_ForsakringsForms_ChatToken" UNIQUE (chat_token);


--
-- Name: tele_forms UQ_TeleForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tele_forms
    ADD CONSTRAINT "UQ_TeleForms_ChatToken" UNIQUE (chat_token);


--
-- Name: archived_tickets archived_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archived_tickets
    ADD CONSTRAINT archived_tickets_pkey PRIMARY KEY (id);


--
-- Name: chat_ratings chat_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_ratings
    ADD CONSTRAINT chat_ratings_pkey PRIMARY KEY (id);


--
-- Name: dynamicforms dynamicforms_chattoken_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms
    ADD CONSTRAINT dynamicforms_chattoken_key UNIQUE (chattoken);


--
-- Name: dynamicforms dynamicforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms
    ADD CONSTRAINT dynamicforms_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: IX_FordonForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_FordonForms_ChatToken" ON public.fordon_forms USING btree (chat_token);


--
-- Name: IX_ForsakringsForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ForsakringsForms_ChatToken" ON public.forsakrings_forms USING btree (chat_token);


--
-- Name: IX_TeleForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_TeleForms_ChatToken" ON public.tele_forms USING btree (chat_token);


--
-- Name: idx_archived_chat_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_chat_token ON public.archived_tickets USING btree (chat_token);


--
-- Name: idx_archived_form_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_form_type ON public.archived_tickets USING btree (form_type);


--
-- Name: idx_archived_resolved_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_resolved_at ON public.archived_tickets USING btree (resolved_at);


--
-- Name: users Users_Role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Role_id_fk" FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

