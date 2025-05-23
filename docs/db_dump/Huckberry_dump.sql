--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (DBngin.app)
-- Dumped by pg_dump version 17.5 (Homebrew)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: store_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_cart (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.store_cart OWNER TO postgres;

--
-- Name: store_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_cartitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_cartitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT store_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.store_cartitem OWNER TO postgres;

--
-- Name: store_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_cartitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_order (
    id bigint NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    status character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.store_order OWNER TO postgres;

--
-- Name: store_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT store_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.store_orderitem OWNER TO postgres;

--
-- Name: store_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_orderitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_product (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT store_product_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.store_product OWNER TO postgres;

--
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL
);


ALTER TABLE public.store_user OWNER TO postgres;

--
-- Name: store_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.store_user_groups OWNER TO postgres;

--
-- Name: store_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: store_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.store_user_user_permissions OWNER TO postgres;

--
-- Name: store_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.store_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.store_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add cart	8	add_cart
30	Can change cart	8	change_cart
31	Can delete cart	8	delete_cart
32	Can view cart	8	view_cart
33	Can add cart item	9	add_cartitem
34	Can change cart item	9	change_cartitem
35	Can delete cart item	9	delete_cartitem
36	Can view cart item	9	view_cartitem
37	Can add order	10	add_order
38	Can change order	10	change_order
39	Can delete order	10	delete_order
40	Can view order	10	view_order
41	Can add order item	11	add_orderitem
42	Can change order item	11	change_orderitem
43	Can delete order item	11	delete_orderitem
44	Can view order item	11	view_orderitem
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	store	user
7	store	product
8	store	cart
9	store	cartitem
10	store	order
11	store	orderitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-05-19 19:07:24.460707+05
2	contenttypes	0002_remove_content_type_name	2025-05-19 19:07:24.466003+05
3	auth	0001_initial	2025-05-19 19:07:24.500189+05
4	auth	0002_alter_permission_name_max_length	2025-05-19 19:07:24.503384+05
5	auth	0003_alter_user_email_max_length	2025-05-19 19:07:24.506003+05
6	auth	0004_alter_user_username_opts	2025-05-19 19:07:24.508479+05
7	auth	0005_alter_user_last_login_null	2025-05-19 19:07:24.510743+05
8	auth	0006_require_contenttypes_0002	2025-05-19 19:07:24.511552+05
9	auth	0007_alter_validators_add_error_messages	2025-05-19 19:07:24.514059+05
10	auth	0008_alter_user_username_max_length	2025-05-19 19:07:24.516407+05
11	auth	0009_alter_user_last_name_max_length	2025-05-19 19:07:24.51934+05
12	auth	0010_alter_group_name_max_length	2025-05-19 19:07:24.525737+05
13	auth	0011_update_proxy_permissions	2025-05-19 19:07:24.52847+05
14	auth	0012_alter_user_first_name_max_length	2025-05-19 19:07:24.530553+05
15	store	0001_initial	2025-05-19 19:07:24.603702+05
16	admin	0001_initial	2025-05-19 19:07:24.612085+05
17	admin	0002_logentry_remove_auto_add	2025-05-19 19:07:24.616368+05
18	admin	0003_logentry_add_action_flag_choices	2025-05-19 19:07:24.620525+05
19	sessions	0001_initial	2025-05-19 19:07:24.627351+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: store_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_cart (id, created_at, user_id) FROM stdin;
1	2025-05-19 23:24:42.751018+05	1
2	2025-05-19 23:24:42.762047+05	2
3	2025-05-19 23:24:42.766536+05	3
4	2025-05-19 23:24:42.77944+05	4
5	2025-05-19 23:24:42.783236+05	5
\.


--
-- Data for Name: store_cartitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_cartitem (id, quantity, cart_id, product_id) FROM stdin;
1	2	1	1
2	2	1	7
3	1	1	4
4	1	2	6
5	3	2	3
6	2	2	5
7	3	3	5
8	3	3	4
9	3	3	6
10	3	4	6
11	2	4	2
12	1	4	4
13	3	5	2
14	3	5	8
15	2	5	7
\.


--
-- Data for Name: store_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_order (id, total_amount, status, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: store_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_orderitem (id, quantity, unit_price, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_product (id, name, description, price, stock, image, created_at) FROM stdin;
1	Sierra Trail Sunglasses	Classic outdoor frame with polarized lenses.	129.99	30	sierra.jpg	2025-05-19 23:24:42.742434+05
2	Urban Voyager Shades	Stylish city-ready sunglasses with UV protection.	149.99	20	voyager.jpg	2025-05-19 23:24:42.745725+05
3	Alpine Edge Polarized	Built for high-altitude adventures.	179.99	15	alpine.jpg	2025-05-19 23:24:42.746249+05
4	Beach Breeze Sunglasses	Comfortable beach sunglasses for relaxation.	99.99	40	beach.jpg	2025-05-19 23:24:42.746803+05
5	Urban Explorer Shades	Stylish city sunglasses for urban adventures.	129.99	25	explorer.jpg	2025-05-19 23:24:42.747342+05
6	Mountain Trekker Sunglasses	Durable sunglasses for mountain trekking.	159.99	10	trekker.jpg	2025-05-19 23:24:42.747863+05
7	Desert Mirage Shades	Lightweight sunglasses for desert adventures.	119.99	35	mirage.jpg	2025-05-19 23:24:42.748352+05
8	Coastal Cruiser Sunglasses	Perfect for coastal drives and beach days.	139.99	20	cruiser.jpg	2025-05-19 23:24:42.748834+05
\.


--
-- Data for Name: store_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_admin) FROM stdin;
1	pbkdf2_sha256$1000000$kPsdpmRPLZbC4HR2epLPmy$7JsMSIXa5CwkU23cmvYlm/ICR1xuu7Q1mNx1M6C8Fik=	\N	f	user0			user0@example.com	f	t	2025-05-19 23:24:42.138174+05	f
2	pbkdf2_sha256$1000000$bMIM36i0GDlg0PGBz09RDv$elRm3Fez2xPYKrtdXwgrBrMwrFSXyD0IESuVegY50v0=	\N	f	user1			user1@example.com	f	t	2025-05-19 23:24:42.259874+05	f
3	pbkdf2_sha256$1000000$ptUVQOrUPqKwzONjeFNTBK$XBEee0Ry76rzrovlugsdzZo+inHH+pI8XqrU5qeUZN0=	\N	f	user2			user2@example.com	f	t	2025-05-19 23:24:42.383612+05	f
4	pbkdf2_sha256$1000000$tGU1it3L6Yt5li5nIMxbQh$eXikQoHDbGa9Tz5/GL8+UIQPMYLwdMgypPlNLq/tnb4=	\N	f	user3			user3@example.com	f	t	2025-05-19 23:24:42.507312+05	f
5	pbkdf2_sha256$1000000$NctFK61Z8X1JinI6Oq3xqU$IKVYDaPFzAbINGtZ02FUhp1RJbO1GK42cANWM91a2NE=	\N	f	user4			user4@example.com	f	t	2025-05-19 23:24:42.625413+05	f
6	pbkdf2_sha256$1000000$CCkzRQEKhxjVNpmKaET9Pb$b6UiGQCIU8184abQTWTUCglb+NzHUkixP62vhRavI74=	\N	t	admin			admin@email.com	t	t	2025-05-19 23:26:05.219009+05	f
\.


--
-- Data for Name: store_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: store_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: store_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_cart_id_seq', 5, true);


--
-- Name: store_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_cartitem_id_seq', 15, true);


--
-- Name: store_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_order_id_seq', 1, false);


--
-- Name: store_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_orderitem_id_seq', 1, false);


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_product_id_seq', 8, true);


--
-- Name: store_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_user_groups_id_seq', 1, false);


--
-- Name: store_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_user_id_seq', 6, true);


--
-- Name: store_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: store_cart store_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cart
    ADD CONSTRAINT store_cart_pkey PRIMARY KEY (id);


--
-- Name: store_cart store_cart_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cart
    ADD CONSTRAINT store_cart_user_id_key UNIQUE (user_id);


--
-- Name: store_cartitem store_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_pkey PRIMARY KEY (id);


--
-- Name: store_order store_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_pkey PRIMARY KEY (id);


--
-- Name: store_orderitem store_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_user_groups store_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_groups
    ADD CONSTRAINT store_user_groups_pkey PRIMARY KEY (id);


--
-- Name: store_user_groups store_user_groups_user_id_group_id_d5c2dca2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_groups
    ADD CONSTRAINT store_user_groups_user_id_group_id_d5c2dca2_uniq UNIQUE (user_id, group_id);


--
-- Name: store_user store_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user
    ADD CONSTRAINT store_user_pkey PRIMARY KEY (id);


--
-- Name: store_user_user_permissions store_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_user_permissions
    ADD CONSTRAINT store_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: store_user_user_permissions store_user_user_permissions_user_id_permission_id_bfd44b7c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_user_permissions
    ADD CONSTRAINT store_user_user_permissions_user_id_permission_id_bfd44b7c_uniq UNIQUE (user_id, permission_id);


--
-- Name: store_user store_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user
    ADD CONSTRAINT store_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: store_cartitem_cart_id_4f60ac05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_cartitem_cart_id_4f60ac05 ON public.store_cartitem USING btree (cart_id);


--
-- Name: store_cartitem_product_id_4238d443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_cartitem_product_id_4238d443 ON public.store_cartitem USING btree (product_id);


--
-- Name: store_order_user_id_ae5f7a5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_order_user_id_ae5f7a5f ON public.store_order USING btree (user_id);


--
-- Name: store_orderitem_order_id_acf8722d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_orderitem_order_id_acf8722d ON public.store_orderitem USING btree (order_id);


--
-- Name: store_orderitem_product_id_f2b098d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_orderitem_product_id_f2b098d4 ON public.store_orderitem USING btree (product_id);


--
-- Name: store_user_groups_group_id_def3ecb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_user_groups_group_id_def3ecb1 ON public.store_user_groups USING btree (group_id);


--
-- Name: store_user_groups_user_id_f76ad019; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_user_groups_user_id_f76ad019 ON public.store_user_groups USING btree (user_id);


--
-- Name: store_user_user_permissions_permission_id_d9830978; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_user_user_permissions_permission_id_d9830978 ON public.store_user_user_permissions USING btree (permission_id);


--
-- Name: store_user_user_permissions_user_id_31a90150; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_user_user_permissions_user_id_31a90150 ON public.store_user_user_permissions USING btree (user_id);


--
-- Name: store_user_username_c2c55c55_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_user_username_c2c55c55_like ON public.store_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_store_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_store_user_id FOREIGN KEY (user_id) REFERENCES public.store_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_cart store_cart_user_id_99e99107_fk_store_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cart
    ADD CONSTRAINT store_cart_user_id_99e99107_fk_store_user_id FOREIGN KEY (user_id) REFERENCES public.store_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_cartitem store_cartitem_cart_id_4f60ac05_fk_store_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_cart_id_4f60ac05_fk_store_cart_id FOREIGN KEY (cart_id) REFERENCES public.store_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_cartitem store_cartitem_product_id_4238d443_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_product_id_4238d443_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_order store_order_user_id_ae5f7a5f_fk_store_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_user_id_ae5f7a5f_fk_store_user_id FOREIGN KEY (user_id) REFERENCES public.store_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_orderitem store_orderitem_order_id_acf8722d_fk_store_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_order_id_acf8722d_fk_store_order_id FOREIGN KEY (order_id) REFERENCES public.store_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_orderitem store_orderitem_product_id_f2b098d4_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_product_id_f2b098d4_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_user_groups store_user_groups_group_id_def3ecb1_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_groups
    ADD CONSTRAINT store_user_groups_group_id_def3ecb1_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_user_groups store_user_groups_user_id_f76ad019_fk_store_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_groups
    ADD CONSTRAINT store_user_groups_user_id_f76ad019_fk_store_user_id FOREIGN KEY (user_id) REFERENCES public.store_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_user_user_permissions store_user_user_perm_permission_id_d9830978_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_user_permissions
    ADD CONSTRAINT store_user_user_perm_permission_id_d9830978_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_user_user_permissions store_user_user_permissions_user_id_31a90150_fk_store_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_user_user_permissions
    ADD CONSTRAINT store_user_user_permissions_user_id_31a90150_fk_store_user_id FOREIGN KEY (user_id) REFERENCES public.store_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

