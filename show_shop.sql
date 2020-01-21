--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO usershow;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO usershow;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO usershow;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO usershow;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO usershow;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO usershow;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO usershow;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO usershow;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO usershow;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO usershow;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO usershow;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO usershow;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO usershow;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO usershow;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO usershow;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO usershow;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO usershow;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO usershow;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO usershow;

--
-- Name: shop_business; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.shop_business (
    id integer NOT NULL,
    line_business character varying(200) NOT NULL
);


ALTER TABLE public.shop_business OWNER TO usershow;

--
-- Name: shop_business_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.shop_business_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_business_id_seq OWNER TO usershow;

--
-- Name: shop_business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.shop_business_id_seq OWNED BY public.shop_business.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.shop_product (
    id integer NOT NULL,
    name_product character varying(200) NOT NULL,
    price_product integer NOT NULL,
    code_product character varying(20) NOT NULL,
    depiction_product character varying(1000) NOT NULL
);


ALTER TABLE public.shop_product OWNER TO usershow;

--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.shop_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO usershow;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: shop_profile; Type: TABLE; Schema: public; Owner: usershow
--

CREATE TABLE public.shop_profile (
    id integer NOT NULL,
    name_user character varying(100) NOT NULL,
    surname_user character varying(100) NOT NULL,
    old_user integer NOT NULL,
    work_user character varying(100) NOT NULL,
    mail_user character varying(254) NOT NULL,
    facebook_user character varying(100) NOT NULL
);


ALTER TABLE public.shop_profile OWNER TO usershow;

--
-- Name: shop_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: usershow
--

CREATE SEQUENCE public.shop_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_profile_id_seq OWNER TO usershow;

--
-- Name: shop_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usershow
--

ALTER SEQUENCE public.shop_profile_id_seq OWNED BY public.shop_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_business id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_business ALTER COLUMN id SET DEFAULT nextval('public.shop_business_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Name: shop_profile id; Type: DEFAULT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_profile ALTER COLUMN id SET DEFAULT nextval('public.shop_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: usershow
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Анкетные данные	7	add_profile
26	Can change Анкетные данные	7	change_profile
27	Can delete Анкетные данные	7	delete_profile
28	Can view Анкетные данные	7	view_profile
29	Can add Область деятельности	8	add_business
30	Can change Область деятельности	8	change_business
31	Can delete Область деятельности	8	delete_business
32	Can view Область деятельности	8	view_business
33	Can add Товар	9	add_product
34	Can change Товар	9	change_product
35	Can delete Товар	9	delete_product
36	Can view Товар	9	view_product
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$tR61Ro7fUeuD$lZumWq51QZXDnNz3iN6kpwhqKzaWsI2jV71aeJEE/no=	2020-01-21 20:13:50.076692+03	t	adminShop				t	t	2020-01-16 13:23:41.397169+03
2	pbkdf2_sha256$150000$1ZIupxZ4TLEV$5PS6DswKA2loe4teY2iCtn14WJeSLyxwgRDF0vGzuJU=	2020-01-20 20:21:39.603823+03	f	user	Гость			f	t	2020-01-16 18:41:12+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-01-16 18:41:12.714441+03	2	user	1	[{"added": {}}]	4	1
2	2020-01-16 18:42:27.915111+03	2	user	2	[{"changed": {"fields": ["first_name"]}}]	4	1
3	2020-01-16 18:42:38.754975+03	2	user	2	[{"changed": {"fields": ["is_staff"]}}]	4	1
4	2020-01-16 20:54:06.351586+03	2	user	2	[{"changed": {"fields": ["is_staff"]}}]	4	1
5	2020-01-17 20:15:28.464695+03	vaq6l38q0jeh7htbphst5npmvox5kq6m	vaq6l38q0jeh7htbphst5npmvox5kq6m	3		6	1
6	2020-01-17 21:04:38.450629+03	1	Ivanov	1	[{"added": {}}]	7	1
7	2020-01-17 21:04:52.21143+03	1	Ivanov	3		7	1
8	2020-01-20 13:30:46.845663+03	1	USB конектор	1	[{"added": {}}]	9	1
9	2020-01-20 13:31:35.294876+03	2	Мышь компьютерная	1	[{"added": {}}]	9	1
10	2020-01-20 13:32:04.397423+03	3	Коврик для мыши	1	[{"added": {}}]	9	1
11	2020-01-20 13:49:41.002254+03	1	IT	1	[{"added": {}}]	8	1
12	2020-01-20 13:49:52.723228+03	2	Медицина	1	[{"added": {}}]	8	1
13	2020-01-20 13:50:02.968381+03	3	Строительство	1	[{"added": {}}]	8	1
14	2020-01-20 18:13:07.562058+03	3	Petrov	1	[{"added": {}}]	7	1
15	2020-01-21 19:19:21.153058+03	15	asd	3		7	1
16	2020-01-21 19:19:21.1783+03	19	Ivanov	3		7	1
17	2020-01-21 19:19:21.18654+03	18	Ivanov	3		7	1
18	2020-01-21 19:19:21.194869+03	17	Ivanov	3		7	1
19	2020-01-21 19:19:21.203188+03	14	Ivanov	3		7	1
20	2020-01-21 19:19:21.211489+03	13	Ivanov	3		7	1
21	2020-01-21 19:19:21.219824+03	12	Ivanov	3		7	1
22	2020-01-21 19:19:21.228177+03	11	Ivanov	3		7	1
23	2020-01-21 19:19:21.236481+03	10	Ivanov	3		7	1
24	2020-01-21 19:19:21.245109+03	9	Ivanov	3		7	1
25	2020-01-21 19:19:21.253306+03	8	Ivanov	3		7	1
26	2020-01-21 19:19:21.261573+03	7	Ivanov	3		7	1
27	2020-01-21 19:19:21.269885+03	6	Ivanov	3		7	1
28	2020-01-21 19:19:21.278167+03	5	Ivanov	3		7	1
29	2020-01-21 19:19:21.286479+03	4	Ivanov	3		7	1
30	2020-01-21 19:19:21.294804+03	2	Ivanov	3		7	1
31	2020-01-21 19:19:21.303131+03	16	lkj	3		7	1
32	2020-01-21 19:19:21.312261+03	3	Petrov	3		7	1
33	2020-01-21 19:19:39.627087+03	4	Экономика	1	[{"added": {}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shop	profile
8	shop	business
9	shop	product
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-01-16 13:22:22.925931+03
2	auth	0001_initial	2020-01-16 13:22:23.29132+03
3	admin	0001_initial	2020-01-16 13:22:23.994298+03
4	admin	0002_logentry_remove_auto_add	2020-01-16 13:22:24.080253+03
5	admin	0003_logentry_add_action_flag_choices	2020-01-16 13:22:24.09796+03
6	contenttypes	0002_remove_content_type_name	2020-01-16 13:22:24.14625+03
7	auth	0002_alter_permission_name_max_length	2020-01-16 13:22:24.18318+03
8	auth	0003_alter_user_email_max_length	2020-01-16 13:22:24.206+03
9	auth	0004_alter_user_username_opts	2020-01-16 13:22:24.223328+03
10	auth	0005_alter_user_last_login_null	2020-01-16 13:22:24.239594+03
11	auth	0006_require_contenttypes_0002	2020-01-16 13:22:24.244776+03
12	auth	0007_alter_validators_add_error_messages	2020-01-16 13:22:24.26432+03
13	auth	0008_alter_user_username_max_length	2020-01-16 13:22:24.322526+03
14	auth	0009_alter_user_last_name_max_length	2020-01-16 13:22:24.364252+03
15	auth	0010_alter_group_name_max_length	2020-01-16 13:22:24.384148+03
16	auth	0011_update_proxy_permissions	2020-01-16 13:22:24.408506+03
17	sessions	0001_initial	2020-01-16 13:22:24.498856+03
18	shop	0001_initial	2020-01-17 20:41:08.941048+03
19	shop	0002_auto_20200117_1803	2020-01-17 21:04:02.296501+03
20	shop	0003_business_product	2020-01-20 13:27:36.816068+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: shop_business; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.shop_business (id, line_business) FROM stdin;
1	IT
2	Медицина
3	Строительство
4	Экономика
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.shop_product (id, name_product, price_product, code_product, depiction_product) FROM stdin;
1	USB конектор	300	123-765	
2	Мышь компьютерная	1500	654-789	
3	Коврик для мыши	800	654-456	
\.


--
-- Data for Name: shop_profile; Type: TABLE DATA; Schema: public; Owner: usershow
--

COPY public.shop_profile (id, name_user, surname_user, old_user, work_user, mail_user, facebook_user) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 33, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: shop_business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.shop_business_id_seq', 4, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 3, true);


--
-- Name: shop_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usershow
--

SELECT pg_catalog.setval('public.shop_profile_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_business shop_business_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_business
    ADD CONSTRAINT shop_business_pkey PRIMARY KEY (id);


--
-- Name: shop_product shop_product_code_product_key; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_code_product_key UNIQUE (code_product);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: shop_profile shop_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.shop_profile
    ADD CONSTRAINT shop_profile_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_product_code_product_b681a8a1_like; Type: INDEX; Schema: public; Owner: usershow
--

CREATE INDEX shop_product_code_product_b681a8a1_like ON public.shop_product USING btree (code_product varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: usershow
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

