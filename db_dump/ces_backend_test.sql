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

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


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

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


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
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255)
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_taskresult_id_seq OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;


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

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


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
-- Name: sites_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sites_site (
    id integer NOT NULL,
    name character varying(1024) NOT NULL,
    description text,
    status integer NOT NULL
);


ALTER TABLE public.sites_site OWNER TO postgres;

--
-- Name: sites_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sites_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_site_id_seq OWNER TO postgres;

--
-- Name: sites_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sites_site_id_seq OWNED BY public.sites_site.id;


--
-- Name: sites_sitedata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sites_sitedata (
    id integer NOT NULL,
    "eventDate" timestamp with time zone NOT NULL,
    site_id integer NOT NULL,
    user_id integer NOT NULL,
    instantaneous_value integer,
    lifetime_value integer,
    name character varying(255)
);


ALTER TABLE public.sites_sitedata OWNER TO postgres;

--
-- Name: sites_sitedata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sites_sitedata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_sitedata_id_seq OWNER TO postgres;

--
-- Name: sites_sitedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sites_sitedata_id_seq OWNED BY public.sites_sitedata.id;


--
-- Name: sites_usersite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sites_usersite (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    is_valid boolean NOT NULL,
    created_by_id integer NOT NULL,
    site_id integer NOT NULL,
    updated_by_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.sites_usersite OWNER TO postgres;

--
-- Name: sites_usersite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sites_usersite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_usersite_id_seq OWNER TO postgres;

--
-- Name: sites_usersite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sites_usersite_id_seq OWNED BY public.sites_usersite.id;


--
-- Name: user_auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    full_name character varying(1024),
    user_type integer,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_email_verified boolean NOT NULL,
    created_at timestamp with time zone,
    city character varying(512),
    company_name character varying(512),
    date_of_birth date,
    state character varying(512),
    zip_code character varying(10),
    address text,
    mobile_num character varying(12)
);


ALTER TABLE public.user_auth_user OWNER TO postgres;

--
-- Name: user_auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_auth_user_groups OWNER TO postgres;

--
-- Name: user_auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: user_auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_auth_user_groups_id_seq OWNED BY public.user_auth_user_groups.id;


--
-- Name: user_auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_auth_user_id_seq OWNER TO postgres;

--
-- Name: user_auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_auth_user_id_seq OWNED BY public.user_auth_user.id;


--
-- Name: user_auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_auth_user_user_permissions OWNER TO postgres;

--
-- Name: user_auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_auth_user_user_permissions_id_seq OWNED BY public.user_auth_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: sites_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_site ALTER COLUMN id SET DEFAULT nextval('public.sites_site_id_seq'::regclass);


--
-- Name: sites_sitedata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_sitedata ALTER COLUMN id SET DEFAULT nextval('public.sites_sitedata_id_seq'::regclass);


--
-- Name: sites_usersite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite ALTER COLUMN id SET DEFAULT nextval('public.sites_usersite_id_seq'::regclass);


--
-- Name: user_auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user ALTER COLUMN id SET DEFAULT nextval('public.user_auth_user_id_seq'::regclass);


--
-- Name: user_auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_auth_user_groups_id_seq'::regclass);


--
-- Name: user_auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_auth_user_user_permissions_id_seq'::regclass);


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
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add user site	8	add_usersite
30	Can change user site	8	change_usersite
31	Can delete user site	8	delete_usersite
32	Can view user site	8	view_usersite
33	Can add site data	9	add_sitedata
34	Can change site data	9	change_sitedata
35	Can delete site data	9	delete_sitedata
36	Can view site data	9	view_sitedata
37	Can add crontab	10	add_crontabschedule
38	Can change crontab	10	change_crontabschedule
39	Can delete crontab	10	delete_crontabschedule
40	Can view crontab	10	view_crontabschedule
41	Can add interval	11	add_intervalschedule
42	Can change interval	11	change_intervalschedule
43	Can delete interval	11	delete_intervalschedule
44	Can view interval	11	view_intervalschedule
45	Can add periodic task	12	add_periodictask
46	Can change periodic task	12	change_periodictask
47	Can delete periodic task	12	delete_periodictask
48	Can view periodic task	12	view_periodictask
49	Can add periodic tasks	13	add_periodictasks
50	Can change periodic tasks	13	change_periodictasks
51	Can delete periodic tasks	13	delete_periodictasks
52	Can view periodic tasks	13	view_periodictasks
53	Can add solar event	14	add_solarschedule
54	Can change solar event	14	change_solarschedule
55	Can delete solar event	14	delete_solarschedule
56	Can view solar event	14	view_solarschedule
57	Can add clocked	15	add_clockedschedule
58	Can change clocked	15	change_clockedschedule
59	Can delete clocked	15	delete_clockedschedule
60	Can view clocked	15	view_clockedschedule
61	Can add task result	16	add_taskresult
62	Can change task result	16	change_taskresult
63	Can delete task result	16	delete_taskresult
64	Can view task result	16	view_taskresult
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-09-07 15:19:34.555415+05:30	5	james.vick@example.com	2	[{"changed": {"fields": ["is_active"]}}]	6	1
2	2019-09-07 15:19:44.705791+05:30	2	mat.hamil@example.com	2	[{"changed": {"fields": ["is_active"]}}]	6	1
3	2019-09-07 15:19:54.05604+05:30	3	pat.jen@example.com	2	[{"changed": {"fields": ["is_active"]}}]	6	1
4	2019-09-07 15:20:06.125974+05:30	4	sara.covington@example.co	2	[{"changed": {"fields": ["is_active"]}}]	6	1
5	2019-09-07 15:23:50.735611+05:30	1	blogger.com	1	[{"added": {}}]	7	1
6	2019-09-07 15:24:40.022488+05:30	2	BlogCupid.com	1	[{"added": {}}]	7	1
7	2019-09-07 15:25:09.606037+05:30	1	blogger.com	2	[{"changed": {"fields": ["description"]}}]	7	1
8	2019-09-07 15:25:56.986754+05:30	3	TenBlogger.com	1	[{"added": {}}]	7	1
9	2019-09-07 15:26:06.944381+05:30	1	Blogger.com	2	[{"changed": {"fields": ["name"]}}]	7	1
10	2019-09-07 15:26:40.155075+05:30	4	GameWeek.com	1	[{"added": {}}]	7	1
11	2019-09-07 15:27:03.036565+05:30	5	Nine.com	1	[{"added": {}}]	7	1
12	2019-09-07 15:27:28.083056+05:30	6	Tick.com	1	[{"added": {}}]	7	1
13	2019-09-07 15:27:47.912412+05:30	1	UserSite object (1)	1	[{"added": {}}]	8	1
14	2019-09-07 15:27:59.965183+05:30	2	UserSite object (2)	1	[{"added": {}}]	8	1
15	2019-09-07 15:28:21.564687+05:30	3	UserSite object (3)	1	[{"added": {}}]	8	1
16	2019-09-07 15:28:40.500193+05:30	4	UserSite object (4)	1	[{"added": {}}]	8	1
17	2019-09-07 15:29:11.984048+05:30	5	UserSite object (5)	1	[{"added": {}}]	8	1
18	2019-09-07 15:29:27.618098+05:30	6	UserSite object (6)	1	[{"added": {}}]	8	1
19	2019-09-07 15:29:46.99977+05:30	7	UserSite object (7)	1	[{"added": {}}]	8	1
20	2019-09-07 15:30:06.761153+05:30	8	UserSite object (8)	1	[{"added": {}}]	8	1
21	2019-09-07 15:30:33.780613+05:30	9	UserSite object (9)	1	[{"added": {}}]	8	1
22	2019-09-07 15:30:44.103145+05:30	10	UserSite object (10)	1	[{"added": {}}]	8	1
23	2019-09-07 15:30:56.275047+05:30	11	UserSite object (11)	1	[{"added": {}}]	8	1
24	2019-09-07 15:31:11.664822+05:30	12	UserSite object (12)	1	[{"added": {}}]	8	1
25	2019-09-07 15:31:20.900954+05:30	11	UserSite object (11)	2	[{"changed": {"fields": ["site"]}}]	8	1
26	2019-09-07 15:31:34.370371+05:30	9	UserSite object (9)	2	[{"changed": {"fields": ["site"]}}]	8	1
27	2019-09-07 15:32:12.59525+05:30	1	SiteData object (1)	1	[{"added": {}}]	9	1
28	2019-09-07 15:32:40.522561+05:30	2	SiteData object (2)	1	[{"added": {}}]	9	1
29	2019-09-07 15:32:58.092049+05:30	2	SiteData object (2)	2	[{"changed": {"fields": ["site"]}}]	9	1
30	2019-09-07 15:33:14.550299+05:30	3	SiteData object (3)	1	[{"added": {}}]	9	1
31	2019-09-07 15:36:09.944672+05:30	4	SiteData object (4)	1	[{"added": {}}]	9	1
32	2019-09-07 15:36:38.64732+05:30	1	SiteData object (1)	2	[{"changed": {"fields": ["user"]}}]	9	1
33	2019-09-07 15:36:58.372331+05:30	5	SiteData object (5)	1	[{"added": {}}]	9	1
34	2019-09-07 15:37:16.518961+05:30	6	SiteData object (6)	1	[{"added": {}}]	9	1
35	2019-09-07 16:11:35.914461+05:30	2	BlogCupid.com	2	[{"changed": {"fields": ["description"]}}]	7	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time, enabled) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta, task_args, task_kwargs, task_name) FROM stdin;
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
6	user_auth	user
7	sites	site
8	sites	usersite
9	sites	sitedata
10	django_celery_beat	crontabschedule
11	django_celery_beat	intervalschedule
12	django_celery_beat	periodictask
13	django_celery_beat	periodictasks
14	django_celery_beat	solarschedule
15	django_celery_beat	clockedschedule
16	django_celery_results	taskresult
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-09-07 14:48:44.657559+05:30
2	contenttypes	0002_remove_content_type_name	2019-09-07 14:48:44.729145+05:30
3	auth	0001_initial	2019-09-07 14:48:45.053064+05:30
4	auth	0002_alter_permission_name_max_length	2019-09-07 14:48:45.494011+05:30
5	auth	0003_alter_user_email_max_length	2019-09-07 14:48:45.51632+05:30
6	auth	0004_alter_user_username_opts	2019-09-07 14:48:45.535307+05:30
7	auth	0005_alter_user_last_login_null	2019-09-07 14:48:45.560844+05:30
8	auth	0006_require_contenttypes_0002	2019-09-07 14:48:45.571588+05:30
9	auth	0007_alter_validators_add_error_messages	2019-09-07 14:48:45.595288+05:30
10	auth	0008_alter_user_username_max_length	2019-09-07 14:48:45.611319+05:30
11	auth	0009_alter_user_last_name_max_length	2019-09-07 14:48:45.637626+05:30
12	auth	0010_alter_group_name_max_length	2019-09-07 14:48:45.660921+05:30
13	auth	0011_update_proxy_permissions	2019-09-07 14:48:45.680441+05:30
14	user_auth	0001_initial	2019-09-07 14:48:45.989098+05:30
15	admin	0001_initial	2019-09-07 14:48:46.73665+05:30
16	admin	0002_logentry_remove_auto_add	2019-09-07 14:48:46.938842+05:30
17	admin	0003_logentry_add_action_flag_choices	2019-09-07 14:48:46.96497+05:30
18	django_celery_beat	0001_initial	2019-09-07 14:48:47.419622+05:30
19	django_celery_beat	0002_auto_20161118_0346	2019-09-07 14:48:47.748521+05:30
20	django_celery_beat	0003_auto_20161209_0049	2019-09-07 14:48:47.910758+05:30
21	django_celery_beat	0004_auto_20170221_0000	2019-09-07 14:48:47.943264+05:30
22	django_celery_beat	0005_add_solarschedule_events_choices	2019-09-07 14:48:47.959065+05:30
23	django_celery_beat	0006_auto_20180322_0932	2019-09-07 14:48:48.111904+05:30
24	django_celery_beat	0007_auto_20180521_0826	2019-09-07 14:48:48.631458+05:30
25	django_celery_beat	0008_auto_20180914_1922	2019-09-07 14:48:48.686044+05:30
26	django_celery_beat	0006_auto_20180210_1226	2019-09-07 14:48:48.739437+05:30
27	django_celery_beat	0006_periodictask_priority	2019-09-07 14:48:48.766826+05:30
28	django_celery_beat	0009_periodictask_headers	2019-09-07 14:48:49.245313+05:30
29	django_celery_beat	0010_auto_20190429_0326	2019-09-07 14:48:49.51611+05:30
30	django_celery_beat	0011_auto_20190508_0153	2019-09-07 14:48:49.639247+05:30
31	django_celery_results	0001_initial	2019-09-07 14:48:49.945964+05:30
32	django_celery_results	0002_add_task_name_args_kwargs	2019-09-07 14:48:50.132758+05:30
33	django_celery_results	0003_auto_20181106_1101	2019-09-07 14:48:50.189307+05:30
34	django_celery_results	0004_auto_20190516_0412	2019-09-07 14:48:50.583561+05:30
35	sessions	0001_initial	2019-09-07 14:48:50.738381+05:30
36	sites	0001_initial	2019-09-07 14:48:51.196438+05:30
37	sites	0002_auto_20190902_0816	2019-09-07 14:48:51.688931+05:30
38	sites	0003_sitedata	2019-09-07 14:48:51.78939+05:30
39	sites	0004_auto_20190903_1820	2019-09-07 14:48:52.135028+05:30
40	user_auth	0002_user_created_at	2019-09-07 14:48:52.404393+05:30
41	user_auth	0003_auto_20190831_1710	2019-09-07 14:48:52.451208+05:30
42	user_auth	0004_auto_20190831_1916	2019-09-07 14:48:52.525963+05:30
43	user_auth	0005_user_zip_code	2019-09-07 14:48:52.556535+05:30
44	user_auth	0006_auto_20190902_0816	2019-09-07 14:48:52.606447+05:30
45	user_auth	0007_auto_20190905_1829	2019-09-07 14:48:52.633944+05:30
46	sites	0005_auto_20190907_0942	2019-09-07 15:12:40.938189+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qhsp1wyughsvb5k6mggo365lir2gjepl	NTllNjQ5ZjI3ZjkzZmEyNjZiNDU1OTZmZmUyYzA4ZjBiMGQzZWUzOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY2VzX2JhY2tlbmQuY3VzdG9tYmFja2VuZC5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjU5MmI5ODMwNjRjODEzN2U1OTVjM2MxZTg3MWZkN2IwMTAyMDE4YSJ9	2019-09-21 15:37:44.741937+05:30
\.


--
-- Data for Name: sites_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sites_site (id, name, description, status) FROM stdin;
3	TenBlogger.com	Blogger is a blog-publishing service that allows multi-user blogs with time-stamped entries. It was developed by Pyra Labs, which was bought by Google in 2003. The blogs are hosted by Google and generally accessed from a subdomain of blogspot.com. Blogs can also be served from a custom domain owned by the user (like www.example.com) by using DNS facilities to direct a domain to Google's servers.[4][5][6] A user can have up to 100 blogs per account.[7]\r\n\r\nUp until May 1, 2010, Blogger also allowed users to publish blogs to their own web hosting server, via FTP. All such blogs had to be changed to either use a blogspot.com subdomain, or point their own domain to Google's servers through DNS.[8]\r\n\r\nBlogger has launched mobile applications for users with mobile devices. Users can post and edit blogs, and also share photos and links on Blogger through their mobile devices. Not only advanced mobile devices, such as smartphones, are being considered, since users can also post blogs via traditional cell phones by SMS and MMS.[25]\r\n\r\n\r\nScreenshot of Blogger app on iOS\r\nThe major two mobile operating systems that Blogger focuses on are Android and iOS.[26][27] Blogger allow users to edit blogs anywhere through the app and either publish the blogs or save them as drafts. Quick navigation from posts and drafts is accessible from a list. Users can attach photos by taking a picture with a Blogger app or selecting pictures from their photo galleries. Sharing current locations on posts is also possible by tabbing My Location bar and adding locations. Users can also share photos and links directly to Blogger.\r\n\r\nBlogger also provides dynamic mobile views for the blogging compatibility with mobile devices and smartphones. They enhance the readability accuracy on these smart devices, but editing a blog on the blogger app remains an open issue for the users.	1
1	Blogger.com	Blogger is a blog-publishing service that allows multi-user blogs with time-stamped entries. It was developed by Pyra Labs, which was bought by Google in 2003. The blogs are hosted by Google and generally accessed from a subdomain of blogspot.com. Blogs can also be served from a custom domain owned by the user (like www.example.com) by using DNS facilities to direct a domain to Google's servers.[4][5][6] A user can have up to 100 blogs per account.[7]\r\n\r\nUp until May 1, 2010, Blogger also allowed users to publish blogs to their own web hosting server, via FTP. All such blogs had to be changed to either use a blogspot.com subdomain, or point their own domain to Google's servers through DNS.\r\n\r\nOn August 23, 1999, Blogger was launched by Pyra Labs. As one of the earliest dedicated blog-publishing tools, it is credited for helping popularize the format. In February 2003, Pyra Labs was acquired by Google under undisclosed terms. The acquisition allowed premium features (for which Pyra had charged) to become free. In October 2004, Pyra Labs' co-founder, Evan Williams, left Google. In 2004, Google purchased Picasa; it integrated Picasa and its photo sharing utility Hello into Blogger, allowing users to post photos to their blogs.[citation needed]\r\n\r\nOn May 9, 2004, Blogger introduced a major redesign, adding features such as web standards-compliant templates, individual archive pages for posts, comments, and posting by email. On August 14, 2006, Blogger launched its latest version in beta, codenamed "Invader", alongside the gold release. This migrated users to Google servers and had some new features, including interface language in French, Italian, German and Spanish.[9] In December 2006, this new version of Blogger was taken out of beta. By May 2007, Blogger had completely moved over to Google-operated servers. Blogger was ranked 16 on the list of top 50 domains in terms of number of unique visitors in 2007.[10]\r\n\r\nBlogger allows its users to choose from various templates and then customize them. Users may also choose to create their own templates using CSS. The new design template, known as "Dynamic View", was introduced on 31 August 2011[19] with Dynamic Views being introduced on 27 September 2011.[20] It is built with AJAX, HTML5, and CSS3. The time for loading is 40 percent shorter than traditional templates, and allows user to present blog in seven different ways: classic, flipcard, magazine, mosaic, sidebar, snapshot, and timeslide. Readers still have the option to choose preferable views when the blog owner has set a default view.[21] Some of the widgets (e.g., Labels, Profile, Link List, Subscription Links, Followers and Blog Archive etc.) are available for Dynamic Views; other templates are chosen by the blogger.\r\n\r\nIn April 2013, Blogger updated its HTML template editor that has some improvements to make it easy for the users to edit the blog's source code. The editor was updated with syntax highlight, number line and jump-to-widget button for ease of editing the code.	1
4	GameWeek.com	GameWeek has launched mobile applications for users with mobile devices. Users can post and edit blogs, and also share photos and links on Blogger through their mobile devices. Not only advanced mobile devices, such as smartphones, are being considered, since users can also post blogs via traditional cell phones by SMS and MMS.[25]\r\n\r\n\r\nScreenshot of Blogger app on iOS\r\nThe major two mobile operating systems that Blogger focuses on are Android and iOS.[26][27] Blogger allow users to edit blogs anywhere through the app and either publish the blogs or save them as drafts. Quick navigation from posts and drafts is accessible from a list. Users can attach photos by taking a picture with a Blogger app or selecting pictures from their photo galleries. Sharing current locations on posts is also possible by tabbing My Location bar and adding locations. Users can also share photos and links directly to Blogger.\r\n\r\nBlogger also provides dynamic mobile views for the blogging compatibility with mobile devices and smartphones. They enhance the readability accuracy on these smart devices, but editing a blog on the blogger app remains an open issue for the users.	1
5	Nine.com	Nine has launched mobile applications for users with mobile devices. Users can post and edit blogs, and also share photos and links on Blogger through their mobile devices. Not only advanced mobile devices, such as smartphones, are being considered, since users can also post blogs via traditional cell phones by SMS and MMS.[25]\r\n\r\n\r\nScreenshot of Blogger app on iOS\r\nThe major two mobile operating systems that Blogger focuses on are Android and iOS.[26][27] Blogger allow users to edit blogs anywhere through the app and either publish the blogs or save them as drafts. Quick navigation from posts and drafts is accessible from a list. Users can attach photos by taking a picture with a Blogger app or selecting pictures from their photo galleries. Sharing current locations on posts is also possible by tabbing My Location bar and adding locations. Users can also share photos and links directly to Blogger.\r\n\r\nBlogger also provides dynamic mobile views for the blogging compatibility with mobile devices and smartphones. They enhance the readability accuracy on these smart devices, but editing a blog on the blogger app remains an open issue for the users.	2
6	Tick.com	Tick has launched mobile applications for users with mobile devices. Users can post and edit blogs, and also share photos and links on Blogger through their mobile devices. Not only advanced mobile devices, such as smartphones, are being considered, since users can also post blogs via traditional cell phones by SMS and MMS.[25]\r\n\r\n\r\nScreenshot of Blogger app on iOS\r\nThe major two mobile operating systems that Blogger focuses on are Android and iOS.[26][27] Blogger allow users to edit blogs anywhere through the app and either publish the blogs or save them as drafts. Quick navigation from posts and drafts is accessible from a list. Users can attach photos by taking a picture with a Blogger app or selecting pictures from their photo galleries. Sharing current locations on posts is also possible by tabbing My Location bar and adding locations. Users can also share photos and links directly to Blogger.\r\n\r\nBlogger also provides dynamic mobile views for the blogging compatibility with mobile devices and smartphones. They enhance the readability accuracy on these smart devices, but editing a blog on the blogger app remains an open issue for the users.	0
2	BlogCupid.com	BlogCupid is a blog-publishing service that allows multi-user blogs with time-stamped entries. It was developed by Pyra Labs, which was bought by Google in 2003. The blogs are hosted by Google and generally accessed from a subdomain of blogspot.com. Blogs can also be served from a custom domain owned by the user (like www.example.com) by using DNS facilities to direct a domain to Google's servers.[4][5][6] A user can have up to 100 blogs per account.[7]\r\n\r\nUp until May 1, 2010, Blogger also allowed users to publish blogs to their own web hosting server, via FTP. All such blogs had to be changed to either use a blogspot.com subdomain, or point their own domain to Google's servers through DNS.[8]\r\n\r\n\r\nUp until May 1, 2010, Blogger also allowed users to publish blogs to their own web hosting server, via FTP. All such blogs had to be changed to either use a blogspot.com subdomain, or point their own domain to Google's servers through DNS.\r\n\r\nOn August 23, 1999, Blogger was launched by Pyra Labs. As one of the earliest dedicated blog-publishing tools, it is credited for helping popularize the format. In February 2003, Pyra Labs was acquired by Google under undisclosed terms. The acquisition allowed premium features (for which Pyra had charged) to become free. In October 2004, Pyra Labs' co-founder, Evan Williams, left Google. In 2004, Google purchased Picasa; it integrated Picasa and its photo sharing utility Hello into Blogger, allowing users to post photos to their blogs.[citation needed]\r\n\r\nOn May 9, 2004, Blogger introduced a major redesign, adding features such as web standards-compliant templates, individual archive pages for posts, comments, and posting by email. On August 14, 2006, Blogger launched its latest version in beta, codenamed "Invader", alongside the gold release. This migrated users to Google servers and had some new features, including interface language in French, Italian, German and Spanish.[9] In December 2006, this new version of Blogger was taken out of beta. By May 2007, Blogger had completely moved over to Google-operated servers. Blogger was ranked 16 on the list of top 50 domains in terms of number of unique visitors in 2007.[10]	1
\.


--
-- Data for Name: sites_sitedata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sites_sitedata (id, "eventDate", site_id, user_id, instantaneous_value, lifetime_value, name) FROM stdin;
2	2019-09-07 15:32:38+05:30	2	2	150	10	LikeCount
3	2019-09-07 15:33:13+05:30	2	3	200	10	PageView
4	2019-09-07 15:36:08+05:30	2	3	100	5	LikeCount
1	2019-09-07 15:32:11+05:30	2	2	100	5	PageView
5	2019-09-07 15:36:56+05:30	2	4	100	5	PageView
6	2019-09-07 15:37:14+05:30	2	4	200	10	LikeCount
7	2019-09-07 15:42:56.629657+05:30	2	2	300	20	PageView
8	2019-09-07 15:42:56.667688+05:30	2	2	300	20	LikeCount
9	2019-09-07 15:42:56.804005+05:30	2	3	400	30	PageView
10	2019-09-07 15:42:56.838225+05:30	2	3	500	40	LikeCount
11	2019-09-07 15:42:56.845047+05:30	2	4	500	40	PageView
12	2019-09-07 15:42:56.880297+05:30	2	4	600	50	LikeCount
13	2019-09-07 15:43:06.566282+05:30	2	2	700	60	PageView
14	2019-09-07 15:43:06.614669+05:30	2	3	800	70	PageView
15	2019-09-07 15:43:06.642846+05:30	2	4	900	80	PageView
16	2019-09-07 15:43:06.650345+05:30	2	2	900	80	LikeCount
17	2019-09-07 15:43:06.697457+05:30	2	3	1000	90	LikeCount
18	2019-09-07 15:43:06.723743+05:30	2	4	1100	100	LikeCount
19	2019-09-07 15:43:16.562612+05:30	2	2	1200	110	PageView
20	2019-09-07 15:43:16.596656+05:30	2	3	1300	120	PageView
21	2019-09-07 15:43:16.632729+05:30	2	4	1400	130	PageView
22	2019-09-07 15:43:16.655439+05:30	2	2	1500	140	LikeCount
23	2019-09-07 15:43:16.692545+05:30	2	3	1600	150	LikeCount
24	2019-09-07 15:43:16.723505+05:30	2	4	1700	160	LikeCount
\.


--
-- Data for Name: sites_usersite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sites_usersite (id, created_at, updated_at, is_valid, created_by_id, site_id, updated_by_id, user_id) FROM stdin;
1	2019-09-07 15:27:47.909284+05:30	2019-09-07 15:27:47.909313+05:30	t	1	2	\N	2
2	2019-09-07 15:27:59.963541+05:30	2019-09-07 15:27:59.963572+05:30	t	1	1	\N	2
3	2019-09-07 15:28:21.563108+05:30	2019-09-07 15:28:21.563138+05:30	t	1	4	\N	2
4	2019-09-07 15:28:40.49865+05:30	2019-09-07 15:28:40.498683+05:30	t	2	3	1	2
5	2019-09-07 15:29:11.982372+05:30	2019-09-07 15:29:11.982406+05:30	t	1	2	1	3
6	2019-09-07 15:29:27.616478+05:30	2019-09-07 15:29:27.616513+05:30	t	1	4	\N	3
7	2019-09-07 15:29:46.99827+05:30	2019-09-07 15:29:46.998305+05:30	t	3	1	\N	3
8	2019-09-07 15:30:06.759797+05:30	2019-09-07 15:30:06.759827+05:30	t	1	3	\N	3
10	2019-09-07 15:30:44.101127+05:30	2019-09-07 15:30:44.101171+05:30	t	4	2	\N	4
12	2019-09-07 15:31:11.663078+05:30	2019-09-07 15:31:11.663109+05:30	t	1	4	\N	4
11	2019-09-07 15:30:56.273607+05:30	2019-09-07 15:31:20.899043+05:30	t	4	1	\N	4
9	2019-09-07 15:30:33.778873+05:30	2019-09-07 15:31:34.368586+05:30	t	1	3	\N	4
\.


--
-- Data for Name: user_auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_auth_user (id, password, last_login, is_superuser, email, full_name, user_type, is_staff, is_active, is_email_verified, created_at, city, company_name, date_of_birth, state, zip_code, address, mobile_num) FROM stdin;
3	pbkdf2_sha256$150000$UeS9616dICLG$D7MPM1GqJ1/tcEC9KAYfcE2JxH/Bq1wJxEtKFBhecfY=	\N	f	pat.jen@example.com	Pat Jen	0	f	t	t	2019-09-07 15:14:21.194086+05:30	\N	\N	\N	\N	\N		\N
4	pbkdf2_sha256$150000$I9Teex7mL9m9$zYmVOdTUd6PULdRTt2WnV52UDDIYGAw0v60etooe+Ik=	\N	f	sara.covington@example.co	Sara Covington	0	f	t	t	2019-09-07 15:18:25.704544+05:30	\N	\N	\N	\N	\N		\N
2	pbkdf2_sha256$150000$UP5HdAVdziZw$O93qx8CA9FjgyoICI/lUbyJGC61artI0UTt8NsD2NXQ=	2019-09-07 16:11:58.016418+05:30	f	mat.hamil@example.com	Mat hamil	0	f	t	t	2019-09-07 14:54:34.190846+05:30	Pune	Cuelogic	1995-09-13	Maharashtra	411042	abc street NA	919866234566
1	pbkdf2_sha256$150000$lP1e2Seev7lu$hHcaQznnuMtMt6pQ1TGN890OEt8SYHR9vybHXJU4w+s=	2019-09-07 16:13:20.276328+05:30	t	admin@example.com	\N	\N	t	t	t	2019-09-07 14:50:29.288964+05:30	\N	\N	\N	\N	\N	\N	\N
5	pbkdf2_sha256$150000$aYiibqZ0PKKt$LP83Lc5DwgHehah7yBXy8FdosBYIxKqlx7+4foUug7E=	2019-09-07 16:19:23.610462+05:30	f	james.vick@example.com	James Vick	1	f	t	t	2019-09-07 15:19:07.864575+05:30	\N	\N	\N	\N	\N		\N
\.


--
-- Data for Name: user_auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 35, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


--
-- Name: sites_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sites_site_id_seq', 6, true);


--
-- Name: sites_sitedata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sites_sitedata_id_seq', 24, true);


--
-- Name: sites_usersite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sites_usersite_id_seq', 12, true);


--
-- Name: user_auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_auth_user_groups_id_seq', 1, false);


--
-- Name: user_auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_auth_user_id_seq', 5, true);


--
-- Name: user_auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_auth_user_user_permissions_id_seq', 1, false);


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
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


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
-- Name: sites_site sites_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_site
    ADD CONSTRAINT sites_site_pkey PRIMARY KEY (id);


--
-- Name: sites_sitedata sites_sitedata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_sitedata
    ADD CONSTRAINT sites_sitedata_pkey PRIMARY KEY (id);


--
-- Name: sites_usersite sites_usersite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite
    ADD CONSTRAINT sites_usersite_pkey PRIMARY KEY (id);


--
-- Name: user_auth_user user_auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user
    ADD CONSTRAINT user_auth_user_email_key UNIQUE (email);


--
-- Name: user_auth_user_groups user_auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_groups
    ADD CONSTRAINT user_auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_auth_user_groups user_auth_user_groups_user_id_group_id_6887c85a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_groups
    ADD CONSTRAINT user_auth_user_groups_user_id_group_id_6887c85a_uniq UNIQUE (user_id, group_id);


--
-- Name: user_auth_user user_auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user
    ADD CONSTRAINT user_auth_user_pkey PRIMARY KEY (id);


--
-- Name: user_auth_user_user_permissions user_auth_user_user_perm_user_id_permission_id_4df7833e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_user_permissions
    ADD CONSTRAINT user_auth_user_user_perm_user_id_permission_id_4df7833e_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_auth_user_user_permissions user_auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_user_permissions
    ADD CONSTRAINT user_auth_user_user_permissions_pkey PRIMARY KEY (id);


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
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_celery_results_taskresult_date_done_49edada6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_date_done_49edada6 ON public.django_celery_results_taskresult USING btree (date_done);


--
-- Name: django_celery_results_taskresult_hidden_cd77412f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_hidden_cd77412f ON public.django_celery_results_taskresult USING btree (hidden);


--
-- Name: django_celery_results_taskresult_status_cbbed23a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_status_cbbed23a ON public.django_celery_results_taskresult USING btree (status);


--
-- Name: django_celery_results_taskresult_status_cbbed23a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_status_cbbed23a_like ON public.django_celery_results_taskresult USING btree (status varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_name_90987df3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_task_name_90987df3 ON public.django_celery_results_taskresult USING btree (task_name);


--
-- Name: django_celery_results_taskresult_task_name_90987df3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_task_name_90987df3_like ON public.django_celery_results_taskresult USING btree (task_name varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: sites_sitedata_site_id_85074205; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_sitedata_site_id_85074205 ON public.sites_sitedata USING btree (site_id);


--
-- Name: sites_sitedata_user_id_e49c8e60; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_sitedata_user_id_e49c8e60 ON public.sites_sitedata USING btree (user_id);


--
-- Name: sites_usersite_created_by_id_400e1b8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_usersite_created_by_id_400e1b8f ON public.sites_usersite USING btree (created_by_id);


--
-- Name: sites_usersite_site_id_4d483aec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_usersite_site_id_4d483aec ON public.sites_usersite USING btree (site_id);


--
-- Name: sites_usersite_updated_by_id_ce661659; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_usersite_updated_by_id_ce661659 ON public.sites_usersite USING btree (updated_by_id);


--
-- Name: sites_usersite_user_id_d7b36f25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sites_usersite_user_id_d7b36f25 ON public.sites_usersite USING btree (user_id);


--
-- Name: user_auth_user_email_b2452b58_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_auth_user_email_b2452b58_like ON public.user_auth_user USING btree (email varchar_pattern_ops);


--
-- Name: user_auth_user_groups_group_id_165f3b9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_auth_user_groups_group_id_165f3b9d ON public.user_auth_user_groups USING btree (group_id);


--
-- Name: user_auth_user_groups_user_id_e339ec14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_auth_user_groups_user_id_e339ec14 ON public.user_auth_user_groups USING btree (user_id);


--
-- Name: user_auth_user_user_permissions_permission_id_2c602bd2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_auth_user_user_permissions_permission_id_2c602bd2 ON public.user_auth_user_user_permissions USING btree (permission_id);


--
-- Name: user_auth_user_user_permissions_user_id_31fb400e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_auth_user_user_permissions_user_id_31fb400e ON public.user_auth_user_user_permissions USING btree (user_id);


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
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_auth_user_id FOREIGN KEY (user_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_sitedata sites_sitedata_site_id_85074205_fk_sites_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_sitedata
    ADD CONSTRAINT sites_sitedata_site_id_85074205_fk_sites_site_id FOREIGN KEY (site_id) REFERENCES public.sites_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_sitedata sites_sitedata_user_id_e49c8e60_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_sitedata
    ADD CONSTRAINT sites_sitedata_user_id_e49c8e60_fk_user_auth_user_id FOREIGN KEY (user_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_usersite sites_usersite_created_by_id_400e1b8f_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite
    ADD CONSTRAINT sites_usersite_created_by_id_400e1b8f_fk_user_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_usersite sites_usersite_site_id_4d483aec_fk_sites_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite
    ADD CONSTRAINT sites_usersite_site_id_4d483aec_fk_sites_site_id FOREIGN KEY (site_id) REFERENCES public.sites_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_usersite sites_usersite_updated_by_id_ce661659_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite
    ADD CONSTRAINT sites_usersite_updated_by_id_ce661659_fk_user_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sites_usersite sites_usersite_user_id_d7b36f25_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sites_usersite
    ADD CONSTRAINT sites_usersite_user_id_d7b36f25_fk_user_auth_user_id FOREIGN KEY (user_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_auth_user_groups user_auth_user_groups_group_id_165f3b9d_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_groups
    ADD CONSTRAINT user_auth_user_groups_group_id_165f3b9d_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_auth_user_groups user_auth_user_groups_user_id_e339ec14_fk_user_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_groups
    ADD CONSTRAINT user_auth_user_groups_user_id_e339ec14_fk_user_auth_user_id FOREIGN KEY (user_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_auth_user_user_permissions user_auth_user_user__permission_id_2c602bd2_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_user_permissions
    ADD CONSTRAINT user_auth_user_user__permission_id_2c602bd2_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_auth_user_user_permissions user_auth_user_user__user_id_31fb400e_fk_user_auth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_auth_user_user_permissions
    ADD CONSTRAINT user_auth_user_user__user_id_31fb400e_fk_user_auth FOREIGN KEY (user_id) REFERENCES public.user_auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

