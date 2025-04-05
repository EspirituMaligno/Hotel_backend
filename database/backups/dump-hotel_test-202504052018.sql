--
-- PostgreSQL database cluster dump
--

-- Started on 2025-04-05 20:18:09

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:09

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

-- Completed on 2025-04-05 20:18:10

--
-- PostgreSQL database dump complete
--

--
-- Database "Project_Stylesnap" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:10

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
-- TOC entry 4945 (class 1262 OID 16483)
-- Name: Project_Stylesnap; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Project_Stylesnap" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Project_Stylesnap" OWNER TO postgres;

\connect "Project_Stylesnap"

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
-- TOC entry 218 (class 1259 OID 16506)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id_category integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16505)
-- Name: category_id_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_category_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;


--
-- TOC entry 222 (class 1259 OID 16525)
-- Name: clothes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clothes (
    id_clothing integer NOT NULL,
    name character varying(100),
    color character varying(50),
    id_category integer,
    id_subcategory integer,
    photo character varying(100),
    is_users boolean
);


ALTER TABLE public.clothes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16524)
-- Name: clothes_id_clothing_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clothes_id_clothing_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clothes_id_clothing_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 221
-- Name: clothes_id_clothing_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clothes_id_clothing_seq OWNED BY public.clothes.id_clothing;


--
-- TOC entry 224 (class 1259 OID 16542)
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    id_collection integer NOT NULL,
    id_clothing integer
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16541)
-- Name: collection_id_collection_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_id_collection_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_id_collection_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 223
-- Name: collection_id_collection_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_id_collection_seq OWNED BY public.collection.id_collection;


--
-- TOC entry 234 (class 1259 OID 16626)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    id_users integer,
    id_post integer,
    date date,
    "time" time without time zone,
    text_comment text
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16625)
-- Name: comment_id_comment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_id_comment_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 233
-- Name: comment_id_comment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_comment_seq OWNED BY public.comment.id_comment;


--
-- TOC entry 228 (class 1259 OID 16583)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id_images integer NOT NULL,
    name character varying(100),
    id_clothing integer,
    date_in_calendar date,
    id_users integer
);


ALTER TABLE public.images OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16582)
-- Name: images_id_images_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_images_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.images_id_images_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 227
-- Name: images_id_images_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_images_seq OWNED BY public.images.id_images;


--
-- TOC entry 230 (class 1259 OID 16600)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id_transaction integer NOT NULL,
    id_users integer,
    date_payment date,
    expiration_date date,
    sum_payment numeric(10,2)
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16599)
-- Name: payment_id_transaction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_transaction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_transaction_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 229
-- Name: payment_id_transaction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_transaction_seq OWNED BY public.payment.id_transaction;


--
-- TOC entry 232 (class 1259 OID 16612)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id_post integer NOT NULL,
    id_users integer,
    text text,
    link_on_images character varying(100)
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16611)
-- Name: post_id_post_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_post_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 231
-- Name: post_id_post_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_post_seq OWNED BY public.post.id_post;


--
-- TOC entry 226 (class 1259 OID 16554)
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    id_announcement integer NOT NULL,
    caption character varying(100),
    description text,
    id_clothing integer,
    id_users integer,
    id_category integer,
    id_subcategory integer,
    color character varying(50),
    sex character varying(10),
    price numeric(10,2),
    photo character varying(100),
    size character varying(20)
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16553)
-- Name: shop_id_announcement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_id_announcement_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_id_announcement_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 225
-- Name: shop_id_announcement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_id_announcement_seq OWNED BY public.shop.id_announcement;


--
-- TOC entry 220 (class 1259 OID 16513)
-- Name: subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategory (
    id_subcategory integer NOT NULL,
    id_category integer,
    name character varying(100)
);


ALTER TABLE public.subcategory OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16512)
-- Name: subcategory_id_subcategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategory_id_subcategory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategory_id_subcategory_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 219
-- Name: subcategory_id_subcategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategory_id_subcategory_seq OWNED BY public.subcategory.id_subcategory;


--
-- TOC entry 216 (class 1259 OID 16499)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_users integer NOT NULL,
    nickname character varying(50),
    country character varying(50),
    birthdate date,
    password character varying(100),
    email character varying(100),
    avatar character varying(100),
    subscribe boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16498)
-- Name: users_id_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_users_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_users_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_users_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_users_seq OWNED BY public.users.id_users;


--
-- TOC entry 4734 (class 2604 OID 16509)
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 16528)
-- Name: clothes id_clothing; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes ALTER COLUMN id_clothing SET DEFAULT nextval('public.clothes_id_clothing_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16545)
-- Name: collection id_collection; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN id_collection SET DEFAULT nextval('public.collection_id_collection_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16629)
-- Name: comment id_comment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public.comment_id_comment_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16586)
-- Name: images id_images; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id_images SET DEFAULT nextval('public.images_id_images_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16603)
-- Name: payment id_transaction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id_transaction SET DEFAULT nextval('public.payment_id_transaction_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16615)
-- Name: post id_post; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id_post SET DEFAULT nextval('public.post_id_post_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16557)
-- Name: shop id_announcement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop ALTER COLUMN id_announcement SET DEFAULT nextval('public.shop_id_announcement_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16516)
-- Name: subcategory id_subcategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory ALTER COLUMN id_subcategory SET DEFAULT nextval('public.subcategory_id_subcategory_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 16502)
-- Name: users id_users; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_users SET DEFAULT nextval('public.users_id_users_seq'::regclass);


--
-- TOC entry 4923 (class 0 OID 16506)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id_category, name) FROM stdin;
1	Верх
2	Обувь
3	Аксессуары
4	Низ
5	Головной убор
\.


--
-- TOC entry 4927 (class 0 OID 16525)
-- Dependencies: 222
-- Data for Name: clothes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothes (id_clothing, name, color, id_category, id_subcategory, photo, is_users) FROM stdin;
1	T-shirt	White	1	1	photo1.jpg	t
2	Jeans	Blue	2	2	photo2.jpg	f
3	Dress	Red	3	3	photo3.jpg	t
4	Shoes	Black	4	4	photo4.jpg	f
5	Hat	Brown	5	5	photo5.jpg	t
6	Scarf	Gray	5	6	photo6.jpg	f
7	Gloves	Yellow	2	7	photo7.jpg	t
8	Socks	Green	3	8	photo8.jpg	f
9	Jacket	Purple	1	4	photo9.jpg	t
10	Pants	Orange	2	6	photo10.jpg	f
\.


--
-- TOC entry 4929 (class 0 OID 16542)
-- Dependencies: 224
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (id_collection, id_clothing) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 16626)
-- Dependencies: 234
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id_comment, id_users, id_post, date, "time", text_comment) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 16583)
-- Dependencies: 228
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id_images, name, id_clothing, date_in_calendar, id_users) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 16600)
-- Dependencies: 230
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id_transaction, id_users, date_payment, expiration_date, sum_payment) FROM stdin;
1	1	2024-02-13	2024-03-13	100.00
2	2	2024-02-13	2024-03-13	150.00
3	3	2024-02-13	2024-03-13	200.00
\.


--
-- TOC entry 4937 (class 0 OID 16612)
-- Dependencies: 232
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id_post, id_users, text, link_on_images) FROM stdin;
1	1	New arrivals Check out our latest collection of summer dresses	https://example.com/dresses.jpg
2	2	Get ready for the beach with our trendy swimwear	https://example.com/swimwear.jpg
3	3	Denim lovers rejoice Our new jeans collection is here	https://example.com/jeans.jpg
4	4	Step up your shoe game with our latest sneaker collection	https://example.com/sneakers.jpg
5	5	Stay warm and stylish with our winter coats	https://example.com/coats.jpg
6	6	Elevate your wardrobe with our luxury accessories	https://example.com/accessories.jpg
7	7	Summer vibes only with our new shorts collection	https://example.com/shorts.jpg
8	8	Get ready for the office with our professional attire	https://example.com/office-wear.jpg
9	9	Make a statement with our bold and colorful tops	https://example.com/tops.jpg
10	10	Complete your look with our stylish hats and scarves	https://example.com/hats-scarves.jpg
\.


--
-- TOC entry 4931 (class 0 OID 16554)
-- Dependencies: 226
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop (id_announcement, caption, description, id_clothing, id_users, id_category, id_subcategory, color, sex, price, photo, size) FROM stdin;
\.


--
-- TOC entry 4925 (class 0 OID 16513)
-- Dependencies: 220
-- Data for Name: subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategory (id_subcategory, id_category, name) FROM stdin;
1	1	T-shirts
2	1	Blouses
3	2	Jeans
4	2	Skirts
5	3	Casual Dresses
6	3	Formal Dresses
7	4	Jackets
8	4	Coats
9	5	Hats
\.


--
-- TOC entry 4921 (class 0 OID 16499)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_users, nickname, country, birthdate, password, email, avatar, subscribe) FROM stdin;
1	user1	Russia	1990-01-01	password1	user1@example.com	avatar1.jpg	t
2	user2	USA	1985-05-15	password2	user2@example.com	avatar2.jpg	f
3	user3	France	1988-10-20	password3	user3@example.com	avatar3.jpg	t
4	user4	Germany	1992-03-30	password4	user4@example.com	avatar4.jpg	t
5	user5	Japan	1987-07-25	password5	user5@example.com	avatar5.jpg	f
6	user6	Australia	1995-09-10	password6	user6@example.com	avatar6.jpg	t
7	user7	Canada	1984-12-05	password7	user7@example.com	avatar7.jpg	f
8	user8	China	1993-02-20	password8	user8@example.com	avatar8.jpg	t
9	user9	Italy	1989-04-15	password9	user9@example.com	avatar9.jpg	t
10	user10	Spain	1991-06-05	password10	user10@example.com	avatar10.jpg	f
\.


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 217
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_category_seq', 1, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 221
-- Name: clothes_id_clothing_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clothes_id_clothing_seq', 1, false);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 223
-- Name: collection_id_collection_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_id_collection_seq', 1, false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 233
-- Name: comment_id_comment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_comment_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 227
-- Name: images_id_images_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_images_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 229
-- Name: payment_id_transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_transaction_seq', 3, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 231
-- Name: post_id_post_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_post_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 225
-- Name: shop_id_announcement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_id_announcement_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 219
-- Name: subcategory_id_subcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategory_id_subcategory_seq', 19, true);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_users_seq', 10, true);


--
-- TOC entry 4746 (class 2606 OID 16511)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- TOC entry 4750 (class 2606 OID 16530)
-- Name: clothes clothes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_pkey PRIMARY KEY (id_clothing);


--
-- TOC entry 4752 (class 2606 OID 16547)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id_collection);


--
-- TOC entry 4762 (class 2606 OID 16633)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);


--
-- TOC entry 4756 (class 2606 OID 16588)
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id_images);


--
-- TOC entry 4758 (class 2606 OID 16605)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id_transaction);


--
-- TOC entry 4760 (class 2606 OID 16619)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);


--
-- TOC entry 4754 (class 2606 OID 16561)
-- Name: shop shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id_announcement);


--
-- TOC entry 4748 (class 2606 OID 16518)
-- Name: subcategory subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (id_subcategory);


--
-- TOC entry 4744 (class 2606 OID 16504)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_users);


--
-- TOC entry 4764 (class 2606 OID 16531)
-- Name: clothes clothes_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id_category);


--
-- TOC entry 4765 (class 2606 OID 16536)
-- Name: clothes clothes_id_subcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_id_subcategory_fkey FOREIGN KEY (id_subcategory) REFERENCES public.subcategory(id_subcategory);


--
-- TOC entry 4766 (class 2606 OID 16548)
-- Name: collection collection_id_clothing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_id_clothing_fkey FOREIGN KEY (id_clothing) REFERENCES public.clothes(id_clothing);


--
-- TOC entry 4775 (class 2606 OID 16639)
-- Name: comment comment_id_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post(id_post);


--
-- TOC entry 4776 (class 2606 OID 16634)
-- Name: comment comment_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- TOC entry 4771 (class 2606 OID 16589)
-- Name: images images_id_clothing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_id_clothing_fkey FOREIGN KEY (id_clothing) REFERENCES public.clothes(id_clothing);


--
-- TOC entry 4772 (class 2606 OID 16594)
-- Name: images images_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- TOC entry 4773 (class 2606 OID 16606)
-- Name: payment payment_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- TOC entry 4774 (class 2606 OID 16620)
-- Name: post post_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- TOC entry 4767 (class 2606 OID 16572)
-- Name: shop shop_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id_category);


--
-- TOC entry 4768 (class 2606 OID 16562)
-- Name: shop shop_id_clothing_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_id_clothing_fkey FOREIGN KEY (id_clothing) REFERENCES public.clothes(id_clothing);


--
-- TOC entry 4769 (class 2606 OID 16577)
-- Name: shop shop_id_subcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_id_subcategory_fkey FOREIGN KEY (id_subcategory) REFERENCES public.subcategory(id_subcategory);


--
-- TOC entry 4770 (class 2606 OID 16567)
-- Name: shop shop_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users);


--
-- TOC entry 4763 (class 2606 OID 16519)
-- Name: subcategory subcategory_id_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id_category);


-- Completed on 2025-04-05 20:18:10

--
-- PostgreSQL database dump complete
--

--
-- Database "company" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:10

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
-- TOC entry 4886 (class 1262 OID 16811)
-- Name: company; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE company OWNER TO postgres;

\connect company

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
-- TOC entry 222 (class 1259 OID 16897)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(50) NOT NULL,
    population integer NOT NULL,
    capital_city character varying(50) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16896)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_country_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 221
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;


--
-- TOC entry 216 (class 1259 OID 16876)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employees_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    departament character varying(25),
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16875)
-- Name: employees_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employees_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 215
-- Name: employees_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employees_id_seq OWNED BY public.employees.employees_id;


--
-- TOC entry 220 (class 1259 OID 16890)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_name character varying(50) NOT NULL,
    order_date date NOT NULL,
    total_amount numeric(10,2) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16889)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 224 (class 1259 OID 16940)
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    passport_id integer NOT NULL,
    number character varying(50),
    fk_user_id integer
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16883)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(50),
    category character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16882)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 223 (class 1259 OID 16935)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4714 (class 2604 OID 16900)
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16879)
-- Name: employees employees_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employees_id SET DEFAULT nextval('public.employees_employees_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 16893)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 16886)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4878 (class 0 OID 16897)
-- Dependencies: 222
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, population, capital_city) FROM stdin;
1	USA	331000000	Washington, D.C.
2	India	1393000000	New Delhi
3	Brazil	213993437	Brasília
\.


--
-- TOC entry 4872 (class 0 OID 16876)
-- Dependencies: 216
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employees_id, first_name, last_name, departament, hire_date) FROM stdin;
1	John	Doe	IT	2022-01-01
2	Jane	Smith	HR	2022-02-15
3	Bob	Johnson	Finance	2021-11-10
\.


--
-- TOC entry 4876 (class 0 OID 16890)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_name, order_date, total_amount) FROM stdin;
1	Alice Johnson	2022-03-05	150.00
2	Mark Davis	2022-02-20	300.50
3	Emily White	2022-01-10	50.25
\.


--
-- TOC entry 4880 (class 0 OID 16940)
-- Dependencies: 224
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passport (passport_id, number, fk_user_id) FROM stdin;
1	1231231	1
2	4123412	2
3	1352`14	3
\.


--
-- TOC entry 4874 (class 0 OID 16883)
-- Dependencies: 218
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category, price) FROM stdin;
1	Laptop	Electronics	1200.00
2	Coffee Maker	Appliances	80.50
3	Running Shoes	Sports	75.00
\.


--
-- TOC entry 4879 (class 0 OID 16935)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name) FROM stdin;
1	IVAN
2	Maksim
3	Danil
\.


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 221
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 3, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 215
-- Name: employees_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employees_id_seq', 3, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 3, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 3, true);


--
-- TOC entry 4722 (class 2606 OID 16902)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 4716 (class 2606 OID 16881)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employees_id);


--
-- TOC entry 4720 (class 2606 OID 16895)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4726 (class 2606 OID 16944)
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (passport_id);


--
-- TOC entry 4718 (class 2606 OID 16888)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4724 (class 2606 OID 16939)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4727 (class 2606 OID 16945)
-- Name: passport passport_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES public.users(user_id);


-- Completed on 2025-04-05 20:18:11

--
-- PostgreSQL database dump complete
--

--
-- Database "diplom" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:11

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
-- TOC entry 4891 (class 1262 OID 34912)
-- Name: diplom; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE diplom WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE diplom OWNER TO postgres;

\connect diplom

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
-- TOC entry 222 (class 1259 OID 34984)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    grade_id integer NOT NULL,
    student_id integer,
    state_exam_grade integer,
    diplom_defense_grade integer,
    CONSTRAINT grades_diplom_defense_grade_check CHECK (((diplom_defense_grade >= 1) AND (diplom_defense_grade <= 5))),
    CONSTRAINT grades_state_exam_grade_check CHECK (((state_exam_grade >= 1) AND (state_exam_grade <= 5)))
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 34983)
-- Name: grades_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_grade_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 221
-- Name: grades_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_grade_id_seq OWNED BY public.grades.grade_id;


--
-- TOC entry 216 (class 1259 OID 34952)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    record_book_number character varying(20),
    full_name character varying(255) NOT NULL,
    faculty character varying(100) NOT NULL,
    group_name character varying(50) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 35012)
-- Name: student_performance; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.student_performance AS
 SELECT students.full_name,
    students.group_name,
    grades.state_exam_grade,
    grades.diplom_defense_grade,
    (((grades.state_exam_grade + grades.diplom_defense_grade))::numeric / 2.0) AS average_grade
   FROM (public.students
     JOIN public.grades ON ((students.id = grades.student_id)));


ALTER VIEW public.student_performance OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34997)
-- Name: student_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_topics (
    student_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.student_topics OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 34951)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 215
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 218 (class 1259 OID 34961)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    degree character varying(50),
    rank character varying(50),
    department character varying(100) NOT NULL,
    phone character varying(15),
    email character varying(100)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 34960)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 217
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 220 (class 1259 OID 34970)
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    teacher_id integer,
    topic_name text NOT NULL
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 34969)
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topics_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 219
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- TOC entry 4714 (class 2604 OID 34987)
-- Name: grades grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN grade_id SET DEFAULT nextval('public.grades_grade_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 34955)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 34964)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 34973)
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- TOC entry 4884 (class 0 OID 34984)
-- Dependencies: 222
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades (grade_id, student_id, state_exam_grade, diplom_defense_grade) FROM stdin;
1	5	5	4
2	6	4	5
\.


--
-- TOC entry 4885 (class 0 OID 34997)
-- Dependencies: 223
-- Data for Name: student_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_topics (student_id, topic_id) FROM stdin;
5	7
6	8
\.


--
-- TOC entry 4878 (class 0 OID 34952)
-- Dependencies: 216
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, record_book_number, full_name, faculty, group_name) FROM stdin;
5	123456	Иванов Иван Иванович	Физический факультет	Группа 101
6	654321	Петров Петр Петрович	Математический факультет	Группа 102
\.


--
-- TOC entry 4880 (class 0 OID 34961)
-- Dependencies: 218
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, full_name, degree, rank, department, phone, email) FROM stdin;
5	Сидоров Сидор Сидорович	\N	Профессор	Кафедра физики	1234567890	sidorov@university.ru
6	Кузнецов Алексей Николаевич	Кандидат наук	Доцент	Кафедра математики	0987654321	kuznetsov@university.ru
\.


--
-- TOC entry 4882 (class 0 OID 34970)
-- Dependencies: 220
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, teacher_id, topic_name) FROM stdin;
7	5	Исследование квантовых процессов в твердых телах
8	6	Математическое моделирование процессов турбулентности
\.


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 221
-- Name: grades_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_grade_id_seq', 2, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 215
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 7, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 6, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 219
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 8, true);


--
-- TOC entry 4726 (class 2606 OID 34991)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grade_id);


--
-- TOC entry 4728 (class 2606 OID 35001)
-- Name: student_topics student_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_topics
    ADD CONSTRAINT student_topics_pkey PRIMARY KEY (student_id, topic_id);


--
-- TOC entry 4718 (class 2606 OID 34957)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 34959)
-- Name: students students_record_book_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_record_book_number_key UNIQUE (record_book_number);


--
-- TOC entry 4722 (class 2606 OID 34968)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 34977)
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 34992)
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4731 (class 2606 OID 35002)
-- Name: student_topics student_topics_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_topics
    ADD CONSTRAINT student_topics_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4732 (class 2606 OID 35007)
-- Name: student_topics student_topics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_topics
    ADD CONSTRAINT student_topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE SET NULL;


--
-- TOC entry 4729 (class 2606 OID 34978)
-- Name: topics topics_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE SET NULL;


-- Completed on 2025-04-05 20:18:11

--
-- PostgreSQL database dump complete
--

--
-- Database "gadania" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:11

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
-- TOC entry 4979 (class 1262 OID 25686)
-- Name: gadania; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gadania WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE gadania OWNER TO postgres;

\connect gadania

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
-- TOC entry 217 (class 1259 OID 25742)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25874)
-- Name: auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth (
    id integer NOT NULL,
    user_id integer,
    number character varying,
    code character varying,
    expiration_time timestamp without time zone
);


ALTER TABLE public.auth OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25873)
-- Name: auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 234
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_id_seq OWNED BY public.auth.id;


--
-- TOC entry 229 (class 1259 OID 25843)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    category character varying,
    name character varying,
    link_on_image character varying
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25842)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 228
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- TOC entry 221 (class 1259 OID 25782)
-- Name: divination; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divination (
    id integer NOT NULL,
    name character varying,
    description text,
    price double precision,
    type character varying,
    language character varying,
    query character varying
);


ALTER TABLE public.divination OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25791)
-- Name: divination_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divination_history (
    id integer NOT NULL,
    user_id integer,
    divination_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.divination_history OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25790)
-- Name: divination_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divination_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divination_history_id_seq OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 222
-- Name: divination_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divination_history_id_seq OWNED BY public.divination_history.id;


--
-- TOC entry 220 (class 1259 OID 25781)
-- Name: divination_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divination_id_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 220
-- Name: divination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divination_id_seq OWNED BY public.divination.id;


--
-- TOC entry 225 (class 1259 OID 25808)
-- Name: divination_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divination_info (
    id integer NOT NULL,
    divinations_history_id integer,
    value character varying,
    type character varying
);


ALTER TABLE public.divination_info OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25807)
-- Name: divination_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divination_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divination_info_id_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 224
-- Name: divination_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divination_info_id_seq OWNED BY public.divination_info.id;


--
-- TOC entry 231 (class 1259 OID 25852)
-- Name: divinations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divinations (
    id integer NOT NULL,
    name character varying,
    count_cards integer,
    comment character varying,
    price double precision,
    sale_price double precision,
    description text,
    "questionForThe_cards" text
);


ALTER TABLE public.divinations OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25851)
-- Name: divinations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divinations_id_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 230
-- Name: divinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divinations_id_seq OWNED BY public.divinations.id;


--
-- TOC entry 227 (class 1259 OID 25822)
-- Name: journals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    user_id integer,
    entry_number integer,
    content text
);


ALTER TABLE public.journals OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25821)
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journals_id_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 226
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- TOC entry 237 (class 1259 OID 25893)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    div_id integer,
    order_id bigint,
    price double precision,
    response_giga text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25892)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 236
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 233 (class 1259 OID 25862)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    div_id integer,
    position_x integer,
    position_y integer
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25861)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.positions_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 232
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- TOC entry 241 (class 1259 OID 25926)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer,
    review text,
    rating integer,
    created_at date,
    name character varying
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25925)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 240
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 239 (class 1259 OID 25912)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    user_id integer,
    tag character varying
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25911)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 238
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 219 (class 1259 OID 25768)
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    id integer NOT NULL,
    token character varying,
    auth_id integer
);


ALTER TABLE public.token OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25767)
-- Name: token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 218
-- Name: token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_id_seq OWNED BY public.token.id;


--
-- TOC entry 216 (class 1259 OID 25733)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    f_name character varying,
    l_name character varying,
    number character varying,
    birthday_date date,
    created_at timestamp without time zone,
    zodiac_sign character varying,
    lucky_rait integer,
    role character varying,
    lucky_rait_time timestamp without time zone,
    balance double precision,
    referal_parent integer,
    language character varying,
    referal_code integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25732)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4761 (class 2604 OID 25877)
-- Name: auth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth ALTER COLUMN id SET DEFAULT nextval('public.auth_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 25846)
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 25785)
-- Name: divination id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination ALTER COLUMN id SET DEFAULT nextval('public.divination_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 25794)
-- Name: divination_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_history ALTER COLUMN id SET DEFAULT nextval('public.divination_history_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 25811)
-- Name: divination_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_info ALTER COLUMN id SET DEFAULT nextval('public.divination_info_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 25855)
-- Name: divinations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divinations ALTER COLUMN id SET DEFAULT nextval('public.divinations_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 25825)
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 25896)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 25865)
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 25929)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 25915)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 25771)
-- Name: token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token ALTER COLUMN id SET DEFAULT nextval('public.token_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 25736)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4949 (class 0 OID 25742)
-- Dependencies: 217
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
aa250b10fafe
\.


--
-- TOC entry 4967 (class 0 OID 25874)
-- Dependencies: 235
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth (id, user_id, number, code, expiration_time) FROM stdin;
12	17	79885815850	138933	2024-06-27 15:41:07.006145
\.


--
-- TOC entry 4961 (class 0 OID 25843)
-- Dependencies: 229
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, category, name, link_on_image) FROM stdin;
79	Рубашка	Рубашка	рубашка.jpg
1	Старшие Арканы	Зелёный Человечек	0.jpg
2	Старшие Арканы	Ведьма/Колдунья	1.jpg
3	Старшие Арканы	Верховная Жрица	2.jpg
4	Старшие Арканы	Богиня-Мать	3.jpg
5	Старшие Арканы	Рогатый Бог	4.jpg
6	Старшие Арканы	Верховный Жрец	5.jpg
7	Старшие Арканы	Госпожа и Господин	6.jpg
8	Старшие Арканы	Боевая Повозка	7.jpg
9	Старшие Арканы	Старуха	8.jpg
10	Старшие Арканы	Король Падуб	9.jpg
11	Старшие Арканы	Колесо Года	10.jpg
12	Старшие Арканы	Стоящий Камень	11.jpg
13	Старшие Арканы	Король Дуб	12.jpg
14	Старшие Арканы	Повелитель Теней	13.jpg
15	Старшие Арканы	Сиды	14.jpg
16	Старшие Арканы	Природа	15.jpg
17	Старшие Арканы	Дикая Охота	16.jpg
18	Старшие Арканы	Звезда	17.jpg
19	Старшие Арканы	Луна	18.jpg
20	Старшие Арканы	Солнце	19.jpg
21	Старшие Арканы	Урожай	20.jpg
22	Старшие Арканы	Мировое Дерево	21.jpg
23	Младшие Арканы	Туз чаш	туз-кубков.jpg
24	Младшие Арканы	Двойка чаш	2-кубков.jpg
25	Младшие Арканы	Тройка чаш	3-кубков.jpg
26	Младшие Арканы	Четвёрка чаш	4-кубков.jpg
27	Младшие Арканы	Пятёрка чаш	5-кубков.jpg
28	Младшие Арканы	Шестёрка чаш	6-кубков.jpg
29	Младшие Арканы	Семёрка чаш	7-кубков.jpg
30	Младшие Арканы	Восьмёрка чаш	8-кубков.jpg
31	Младшие Арканы	Девятка чаш	9-кубков.jpg
32	Младшие Арканы	Десятка чаш	10-кубков.jpg
33	Младшие Арканы	Паж чаш	паж-кубков.jpg
34	Младшие Арканы	Рыцарь чаш	рыцарь-кубков.jpg
35	Младшие Арканы	Королева чаш	королева-кубков.jpg
36	Младшие Арканы	Король чаш	король-кубков.jpg
37	Младшие Арканы	Туз пентаклей	туз-пентаклей.jpg
38	Младшие Арканы	Двойка пентаклей	2-пентаклей.jpg
39	Младшие Арканы	Тройка пентаклей	3-пентаклей.jpg
40	Младшие Арканы	Четвёрка пентаклей	4-пентаклей.jpg
41	Младшие Арканы	Пятёрка пентаклей	5-пентаклей.jpg
42	Младшие Арканы	Шестёрка пентаклей	6-пентаклей.jpg
43	Младшие Арканы	Семёрка пентаклей	7-пентаклей.jpg
44	Младшие Арканы	Восьмёрка пентаклей	8-пентаклей.jpg
45	Младшие Арканы	Девятка пентаклей	9-пентаклей.jpg
46	Младшие Арканы	Десятка пентаклей	10-пентаклей.jpg
47	Младшие Арканы	Паж пентаклей	паж-пентаклей.jpg
48	Младшие Арканы	Рыцарь пентаклей	рыцарь-пентаклей.jpg
49	Младшие Арканы	Королева пентаклей	королева-пентаклей.jpg
50	Младшие Арканы	Король пентаклей	король-пентаклей.jpg
51	Младшие Арканы	Туз жезлов	туз-жезлов.jpg
52	Младшие Арканы	Двойка жезлов	2-жезлов.jpg
53	Младшие Арканы	Тройка жезлов	3-жезлов.jpg
54	Младшие Арканы	Четвёрка жезлов	4-жезлов.jpg
55	Младшие Арканы	Пятёрка жезлов	5-жезлов.jpg
56	Младшие Арканы	Шестёрка жезлов	6-жезлов.jpg
57	Младшие Арканы	Семёрка жезлов	7-жезлов.jpg
58	Младшие Арканы	Восьмёрка жезлов	8-жезлов.jpg
59	Младшие Арканы	Девятка жезлов	9-жезлов.jpg
60	Младшие Арканы	Десятка жезлов	10-жезлов.jpg
61	Младшие Арканы	Паж жезлов	паж-жезлов.jpg
62	Младшие Арканы	Рыцарь жезлов	рыцарь-жезлов.jpg
63	Младшие Арканы	Королева жезлов	королева-жезлов.jpg
64	Младшие Арканы	Король жезлов	король-жезлов.jpg
65	Младшие Арканы	Туз кинжалов	туз-кинжалов.jpg
66	Младшие Арканы	Двойка кинжалов	2-кинжалов.jpg
67	Младшие Арканы	Тройка кинжалов	3-кинжалов.jpg
68	Младшие Арканы	Четвёрка кинжалов	4-кинжалов.jpg
69	Младшие Арканы	Пятёрка кинжалов	5-кинжалов.jpg
70	Младшие Арканы	Шестёрка кинжалов	6-кинжалов.jpg
71	Младшие Арканы	Семёрка кинжалов	7-кинжалов.jpg
72	Младшие Арканы	Восьмёрка кинжалов	8-кинжалов.jpg
73	Младшие Арканы	Девятка кинжалов	9-кинжалов.jpg
74	Младшие Арканы	Десятка кинжалов	10-кинжалов.jpg
75	Младшие Арканы	Паж кинжалов	паж-кинжалов.jpg
76	Младшие Арканы	Рыцарь кинжалов	рыцарь-кинжалов.jpg
77	Младшие Арканы	Королева кинжалов	королева-кинжалов.jpg
78	Младшие Арканы	Король кинжалов	король-кинжалов.jpg
\.


--
-- TOC entry 4953 (class 0 OID 25782)
-- Dependencies: 221
-- Data for Name: divination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divination (id, name, description, price, type, language, query) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 25791)
-- Dependencies: 223
-- Data for Name: divination_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divination_history (id, user_id, divination_id, created_at) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 25808)
-- Dependencies: 225
-- Data for Name: divination_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divination_info (id, divinations_history_id, value, type) FROM stdin;
\.


--
-- TOC entry 4963 (class 0 OID 25852)
-- Dependencies: 231
-- Data for Name: divinations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divinations (id, name, count_cards, comment, price, sale_price, description, "questionForThe_cards") FROM stdin;
1	На бизнес	5	\N	\N	\N	\N	\N
6	На любовь	6	\N	\N	\N	\N	\N
7	На самопознание	8	\N	\N	\N	\N	\N
8	На предыдущие жизни	10	\N	\N	\N	\N	\N
9	На дружбу	6	\N	\N	\N	\N	\N
10	На тайного поклонника	3	\N	\N	\N	\N	\N
11	На учебу	9	\N	\N	\N	\N	\N
12	На работу	6	\N	\N	\N	\N	\N
2	На успех	5	\N	300	\N	\N	\N
4	На будущее ребенка	6	\N	300	\N	\N	\N
3	На ближайшее будущее	5	\N	300	\N	\N	\N
5	На совместимость	6	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4959 (class 0 OID 25822)
-- Dependencies: 227
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journals (id, user_id, entry_number, content) FROM stdin;
\.


--
-- TOC entry 4969 (class 0 OID 25893)
-- Dependencies: 237
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, div_id, order_id, price, response_giga) FROM stdin;
\.


--
-- TOC entry 4965 (class 0 OID 25862)
-- Dependencies: 233
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (id, div_id, position_x, position_y) FROM stdin;
1	1	0	0
2	1	-2	5
3	1	2	5
4	1	-2	-5
5	1	5	-2
6	2	-5	5
7	2	0	5
8	2	5	5
9	2	0	0
10	2	0	-5
13	3	0	5
11	3	-5	1
12	3	-3	3
14	3	3	3
15	3	5	1
16	4	-1	5
17	4	1	5
18	4	-5	0
19	4	5	0
20	4	-5	-5
21	4	5	-5
22	5	0	1
23	5	0	-1
24	5	3	1
25	5	-3	1
26	5	3	-1
27	5	-3	-1
28	6	2	-2
29	6	-2	-2
30	6	-6	0
31	6	-2	2
32	6	2	2
33	6	6	0
34	7	3	-5
35	7	3	-1
36	7	3	1
37	7	-3	-5
38	7	-3	-1
39	7	-3	1
40	7	0	1
41	7	0	4
64	11	-3	-5
65	11	0	-5
66	11	3	-5
67	11	-3	-2
45	8	-5	-4
46	8	-2	-4
47	8	2	-4
48	8	5	-4
49	8	-4	-2
50	8	0	-2
51	8	4	-2
52	8	-3	2
53	8	3	2
54	8	0	4
68	11	0	-2
69	11	3	-2
70	11	-2	2
71	11	2	2
72	11	0	5
55	9	-3	2
56	9	0	2
57	9	3	2
58	9	-3	-2
59	9	0	-2
60	9	3	-2
61	10	0	1
62	10	-3	-1
63	10	3	-1
73	12	-2	1
74	12	0	1
75	12	2	1
76	12	-2	-1
77	12	0	-1
78	12	2	-1
\.


--
-- TOC entry 4973 (class 0 OID 25926)
-- Dependencies: 241
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, review, rating, created_at, name) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 25912)
-- Dependencies: 239
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, user_id, tag) FROM stdin;
\.


--
-- TOC entry 4951 (class 0 OID 25768)
-- Dependencies: 219
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (id, token, auth_id) FROM stdin;
41	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtb250ZWlhIiwidXNlcl9pZCI6MTcsIm51bWJlciI6Ijc5ODg1ODE1ODUwIiwiZXhwIjoxNzIyMDk0Nzg3fQ.R2OC97xteLp0BRsr2upOZM4wdtwALF2N1_Ae-EGKrTHqyT7F6UFjMY5oTX4m_A5g06Yp5KC2pA7qUH1sxej6k4ySTMYsw8pecsHT4NtzCZdhR9czEVNJ7Eer2YJZ-of6OWJ5Kw8MrjeOUP6DE5r1jRRCbkfMHjcHwUhO2MGuRpDBApXsYjYGVFv7SU_vWRn7LMMhUTlyKDxoZQ4cXjr1VEjiqe8QmLL9ukb3I5NVDntDqEchnMm8hVwrsQcos3qm7rYFuelmhpY3ORX4ZoaWoiEJyw_5pKLWZSrGy_gIfw2YXuLzu1PwoLlnC-YayxSwdn87berLUP7QLzBC3fDTSw	12
\.


--
-- TOC entry 4948 (class 0 OID 25733)
-- Dependencies: 216
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, f_name, l_name, number, birthday_date, created_at, zodiac_sign, lucky_rait, role, lucky_rait_time, balance, referal_parent, language, referal_code) FROM stdin;
17	Vladislav	Demianenko	79885815850	2004-07-21	2024-06-27 15:37:44.307815	Рак	7	fortuneteller	2024-06-27 15:37:44.307815	0	0	ru	258854
\.


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 234
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_id_seq', 12, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 228
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 78, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 222
-- Name: divination_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divination_history_id_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 220
-- Name: divination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divination_id_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 224
-- Name: divination_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divination_info_id_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 230
-- Name: divinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divinations_id_seq', 1, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 226
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journals_id_seq', 12, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 236
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 232
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_id_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 240
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 238
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 218
-- Name: token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_id_seq', 41, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 17, true);


--
-- TOC entry 4768 (class 2606 OID 25746)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4786 (class 2606 OID 25881)
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 25850)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 25796)
-- Name: divination_history divination_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_history
    ADD CONSTRAINT divination_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 25815)
-- Name: divination_info divination_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_info
    ADD CONSTRAINT divination_info_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 25789)
-- Name: divination divination_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination
    ADD CONSTRAINT divination_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 25859)
-- Name: divinations divinations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divinations
    ADD CONSTRAINT divinations_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 25827)
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 25900)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 25867)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 25933)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 25919)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 25775)
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 25740)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4799 (class 2606 OID 25882)
-- Name: auth auth_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4794 (class 2606 OID 25797)
-- Name: divination_history divination_history_divination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_history
    ADD CONSTRAINT divination_history_divination_id_fkey FOREIGN KEY (divination_id) REFERENCES public.divination(id);


--
-- TOC entry 4795 (class 2606 OID 25802)
-- Name: divination_history divination_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_history
    ADD CONSTRAINT divination_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4796 (class 2606 OID 25816)
-- Name: divination_info divination_info_divinations_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divination_info
    ADD CONSTRAINT divination_info_divinations_history_id_fkey FOREIGN KEY (divinations_history_id) REFERENCES public.divination_history(id);


--
-- TOC entry 4797 (class 2606 OID 25828)
-- Name: journals journals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4800 (class 2606 OID 25901)
-- Name: orders orders_div_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_div_id_fkey FOREIGN KEY (div_id) REFERENCES public.divinations(id);


--
-- TOC entry 4801 (class 2606 OID 25906)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4798 (class 2606 OID 25868)
-- Name: positions positions_div_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_div_id_fkey FOREIGN KEY (div_id) REFERENCES public.divinations(id);


--
-- TOC entry 4803 (class 2606 OID 25934)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4802 (class 2606 OID 25920)
-- Name: tags tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4793 (class 2606 OID 25887)
-- Name: token token_auth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_auth_id_fkey FOREIGN KEY (auth_id) REFERENCES public.auth(id);


-- Completed on 2025-04-05 20:18:12

--
-- PostgreSQL database dump complete
--

--
-- Database "gifts" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:12

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
-- TOC entry 4875 (class 1262 OID 25423)
-- Name: gifts; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gifts WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE gifts OWNER TO postgres;

\connect gifts

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
-- TOC entry 222 (class 1259 OID 25667)
-- Name: donations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donations (
    id integer NOT NULL,
    user_id integer,
    sum double precision,
    level integer,
    game_session integer,
    created_at timestamp without time zone,
    status character varying
);


ALTER TABLE public.donations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25666)
-- Name: donations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.donations_id_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 221
-- Name: donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donations_id_seq OWNED BY public.donations.id;


--
-- TOC entry 220 (class 1259 OID 25655)
-- Name: gamesession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gamesession (
    id integer NOT NULL,
    last_update timestamp without time zone,
    recipient_id integer,
    count_players integer,
    level integer
);


ALTER TABLE public.gamesession OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25654)
-- Name: gamesession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gamesession_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gamesession_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 219
-- Name: gamesession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gamesession_id_seq OWNED BY public.gamesession.id;


--
-- TOC entry 218 (class 1259 OID 25643)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    user_id integer,
    sum double precision
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25642)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_seq OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 216 (class 1259 OID 25634)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    telegram_id bigint,
    username character varying,
    token character varying,
    referal_token character varying,
    referal_parent character varying,
    level integer,
    status character varying,
    language character varying,
    balance double precision,
    role character varying
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25633)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4706 (class 2604 OID 25670)
-- Name: donations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations ALTER COLUMN id SET DEFAULT nextval('public.donations_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 25658)
-- Name: gamesession id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gamesession ALTER COLUMN id SET DEFAULT nextval('public.gamesession_id_seq'::regclass);


--
-- TOC entry 4704 (class 2604 OID 25646)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 25637)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4869 (class 0 OID 25667)
-- Dependencies: 222
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donations (id, user_id, sum, level, game_session, created_at, status) FROM stdin;
\.


--
-- TOC entry 4867 (class 0 OID 25655)
-- Dependencies: 220
-- Data for Name: gamesession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gamesession (id, last_update, recipient_id, count_players, level) FROM stdin;
\.


--
-- TOC entry 4865 (class 0 OID 25643)
-- Dependencies: 218
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, user_id, sum) FROM stdin;
\.


--
-- TOC entry 4863 (class 0 OID 25634)
-- Dependencies: 216
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, telegram_id, username, token, referal_token, referal_parent, level, status, language, balance, role) FROM stdin;
1	406898631	Dirty_Sk8	11656c11-5952-4df1-a03e-bd561835e53b	368cfb79-5e31-48d6-8943-dffc415d5e0e		0	giver	az	0	user
\.


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 221
-- Name: donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donations_id_seq', 1, false);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 219
-- Name: gamesession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gamesession_id_seq', 1, false);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 4714 (class 2606 OID 25674)
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 25660)
-- Name: gamesession gamesession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gamesession
    ADD CONSTRAINT gamesession_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 25648)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 4708 (class 2606 OID 25641)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 25680)
-- Name: donations donations_game_session_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_game_session_fkey FOREIGN KEY (game_session) REFERENCES public.gamesession(id);


--
-- TOC entry 4718 (class 2606 OID 25675)
-- Name: donations donations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4716 (class 2606 OID 25661)
-- Name: gamesession gamesession_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gamesession
    ADD CONSTRAINT gamesession_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public."user"(id);


--
-- TOC entry 4715 (class 2606 OID 25649)
-- Name: transaction transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2025-04-05 20:18:13

--
-- PostgreSQL database dump complete
--

--
-- Database "harry" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:13

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
-- TOC entry 4851 (class 1262 OID 16950)
-- Name: harry; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE harry WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE harry OWNER TO postgres;

\connect harry

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
-- TOC entry 215 (class 1259 OID 16951)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    char_id integer NOT NULL,
    fname character varying(45) DEFAULT NULL::character varying,
    lname character varying(45) DEFAULT NULL::character varying,
    age integer,
    faculty character varying(45) DEFAULT NULL::character varying,
    patronus character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16958)
-- Name: library; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library (
    lib_id integer NOT NULL,
    char_id integer NOT NULL,
    book_name character varying(45) DEFAULT NULL::character varying,
    start_date date,
    end_date date
);


ALTER TABLE public.library OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 16951)
-- Dependencies: 215
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (char_id, fname, lname, age, faculty, patronus) FROM stdin;
1	Harry	Potter	11	Gryffindor	Stag
2	Hermione	Granger	11	Gryffindor	Otter
3	Ron	Weasley	11	Gryffindor	Jack Russell terrier
4	Draco	Malfoy	11	Slytherin	\N
5	Vincent	Crabbe	11	Slytherin	\N
6	Gregory	Goyle	11	Slytherin	\N
7	Albus	Dumbledore	111	Gryffindor	Phoenix
8	Luna	Lovegood	11	Ravenclaw	Hare
9	Cedric	Diggory	14	Hufflepuff	Unknown
10	Severus	Snape	55	Slytherin	Doe
11	Lord	Voldemort	\N	Slytherin	\N
\.


--
-- TOC entry 4845 (class 0 OID 16958)
-- Dependencies: 216
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library (lib_id, char_id, book_name, start_date, end_date) FROM stdin;
1	6	Hogwarts: A History	2010-10-20	2020-10-20
2	7	Quidditch Through The Ages	2010-11-20	2020-11-20
3	9	The Lockhart Collection	2015-12-20	2030-12-20
4	10	Moste Potente Potions	2001-01-20	2002-01-20
5	11	The Life And Lies Of Albus Dumbledore	2018-07-20	2028-07-20
6	4	Fantastic Beasts And Where To Find Them	2010-10-20	2020-10-20
7	11	The Tales Of Beadle The Bard	2003-03-20	2004-03-20
8	3	Advanced Potion-Making	2003-05-20	2006-05-20
9	2	A History Of Magic	2012-12-20	2022-12-20
10	1	Magical Water Plants Of The Highland Rocks	2006-06-20	2010-06-20
11	8	Quidditch Through The Ages	2010-11-20	2020-11-20
12	4	Magical Water Plants Of The Highland Rocks	2010-11-20	2020-10-20
13	10	Fantastic Beasts And Where To Find Them	2006-06-20	2010-01-20
\.


--
-- TOC entry 4697 (class 2606 OID 16963)
-- Name: characters pk_characters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT pk_characters PRIMARY KEY (char_id);


--
-- TOC entry 4699 (class 2606 OID 16965)
-- Name: library pk_library; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT pk_library PRIMARY KEY (lib_id);


--
-- TOC entry 4700 (class 2606 OID 16966)
-- Name: library fk_library_characters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT fk_library_characters FOREIGN KEY (char_id) REFERENCES public.characters(char_id);


-- Completed on 2025-04-05 20:18:13

--
-- PostgreSQL database dump complete
--

--
-- Database "hotel_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:13

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
-- TOC entry 4893 (class 1262 OID 43282)
-- Name: hotel_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hotel_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE hotel_test OWNER TO postgres;

\connect hotel_test

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
-- TOC entry 215 (class 1259 OID 43283)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 43305)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    user_id integer NOT NULL,
    room_id integer NOT NULL,
    price double precision NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    count_nights integer NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 43304)
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 220
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- TOC entry 223 (class 1259 OID 43387)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer NOT NULL,
    room_id integer NOT NULL,
    text character varying NOT NULL,
    rating integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 43386)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 222
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 219 (class 1259 OID 43298)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    room_count integer NOT NULL,
    price double precision NOT NULL,
    preview character varying,
    rating integer,
    description character varying,
    is_noisecancelling boolean,
    is_wifi boolean,
    is_pc boolean,
    is_breakfast boolean,
    is_biometry_key boolean,
    is_tv boolean,
    count_of_people integer
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 43297)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 218
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 225 (class 1259 OID 43418)
-- Name: rooms_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms_images (
    id integer NOT NULL,
    room_id integer NOT NULL,
    image character varying NOT NULL
);


ALTER TABLE public.rooms_images OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 43417)
-- Name: rooms_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_images_id_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 224
-- Name: rooms_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_images_id_seq OWNED BY public.rooms_images.id;


--
-- TOC entry 217 (class 1259 OID 43289)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password_hash character varying NOT NULL,
    role character varying NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    birth_date date NOT NULL,
    time_zone character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 43288)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4714 (class 2604 OID 43308)
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 43390)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 43301)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 43421)
-- Name: rooms_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_images ALTER COLUMN id SET DEFAULT nextval('public.rooms_images_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 43292)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4877 (class 0 OID 43283)
-- Dependencies: 215
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
612c2b0d3d04
\.


--
-- TOC entry 4883 (class 0 OID 43305)
-- Dependencies: 221
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id, user_id, room_id, price, start_date, end_date, count_nights) FROM stdin;
2	9	1	9000	2025-03-03	2025-03-10	6
\.


--
-- TOC entry 4885 (class 0 OID 43387)
-- Dependencies: 223
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, room_id, text, rating, created_at) FROM stdin;
3	9	2	Очень хороший номер, я был рад его посетить	5	2025-02-22 14:36:46.745058+03
4	9	2	Грязные полы в уборной	3	2025-02-22 14:42:45.086441+03
\.


--
-- TOC entry 4881 (class 0 OID 43298)
-- Dependencies: 219
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, room_count, price, preview, rating, description, is_noisecancelling, is_wifi, is_pc, is_breakfast, is_biometry_key, is_tv, count_of_people) FROM stdin;
1	1	1500	\N	0	\N	\N	t	t	f	f	t	1
4	4	4500	\N	0	\N	\N	f	t	t	t	f	4
2	2	2500	\N	4	\N	\N	t	f	t	f	t	2
3	3	3500	\N	0	\N	\N	t	f	f	t	t	3
5	5	5500	\N	0	\N	\N	f	f	f	t	t	5
\.


--
-- TOC entry 4887 (class 0 OID 43418)
-- Dependencies: 225
-- Data for Name: rooms_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms_images (id, room_id, image) FROM stdin;
\.


--
-- TOC entry 4879 (class 0 OID 43289)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_hash, role, is_active, created_at, name, surname, birth_date, time_zone) FROM stdin;
9	lovelly.diller@yandex.ru	$2b$12$CSED85Bcw7Crv1sxYdc/VOhrEkCSevCHRAGLpWfufuJ2YTzpEeW9.	user	t	2025-02-22 14:06:25.209158+03	Vladislav	Demianenko	2004-07-21	Asia/Tokyo
\.


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 220
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 2, true);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 222
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 4, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 218
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 7, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 224
-- Name: rooms_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_images_id_seq', 1, false);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 4718 (class 2606 OID 43287)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4724 (class 2606 OID 43310)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- TOC entry 4726 (class 2606 OID 43394)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 43425)
-- Name: rooms_images rooms_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_images
    ADD CONSTRAINT rooms_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 43303)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 43296)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 43311)
-- Name: reservation reservation_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 4730 (class 2606 OID 43316)
-- Name: reservation reservation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4731 (class 2606 OID 43395)
-- Name: reviews reviews_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 4732 (class 2606 OID 43400)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4733 (class 2606 OID 43426)
-- Name: rooms_images rooms_images_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms_images
    ADD CONSTRAINT rooms_images_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


-- Completed on 2025-04-05 20:18:14

--
-- PostgreSQL database dump complete
--

--
-- Database "monfler" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:14

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
-- TOC entry 5000 (class 1262 OID 25945)
-- Name: monfler; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE monfler WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE monfler OWNER TO postgres;

\connect monfler

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
-- TOC entry 235 (class 1259 OID 26222)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 26221)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 234
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 215 (class 1259 OID 25946)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25981)
-- Name: auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth (
    id integer NOT NULL,
    user_id integer NOT NULL,
    number character varying NOT NULL,
    code character varying NOT NULL,
    expiration_time timestamp without time zone NOT NULL
);


ALTER TABLE public.auth OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25980)
-- Name: auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_id_seq OWNED BY public.auth.id;


--
-- TOC entry 225 (class 1259 OID 25995)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    order_id integer
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25994)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 224
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 217 (class 1259 OID 25952)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    image_link character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25951)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 216
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 237 (class 1259 OID 26236)
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id integer NOT NULL,
    first_id integer NOT NULL,
    second_id integer NOT NULL
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26235)
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chats_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 236
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- TOC entry 241 (class 1259 OID 26445)
-- Name: deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliveries (
    id integer NOT NULL,
    user_id integer NOT NULL,
    order_id integer NOT NULL,
    status character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.deliveries OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26444)
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deliveries_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 240
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;


--
-- TOC entry 243 (class 1259 OID 26459)
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 26458)
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 242
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- TOC entry 219 (class 1259 OID 25961)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying NOT NULL,
    image_link character varying NOT NULL,
    description character varying NOT NULL,
    price double precision NOT NULL,
    rating double precision,
    is_active boolean NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25960)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 227 (class 1259 OID 26012)
-- Name: itemscategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemscategory (
    id integer NOT NULL,
    item_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.itemscategory OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26011)
-- Name: itemscategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itemscategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itemscategory_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 226
-- Name: itemscategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itemscategory_id_seq OWNED BY public.itemscategory.id;


--
-- TOC entry 233 (class 1259 OID 26059)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    content character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    type_message character varying NOT NULL,
    chat_id integer NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 26058)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 232
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 239 (class 1259 OID 26253)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    sum double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26252)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 238
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 229 (class 1259 OID 26029)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    text character varying NOT NULL,
    image_link character varying NOT NULL,
    rating integer NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 26028)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 228
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 231 (class 1259 OID 26043)
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    auth_id integer NOT NULL,
    token character varying NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 26042)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 230
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 221 (class 1259 OID 25970)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    number character varying NOT NULL,
    f_name character varying NOT NULL,
    l_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25969)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4766 (class 2604 OID 26225)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 25984)
-- Name: auth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth ALTER COLUMN id SET DEFAULT nextval('public.auth_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 25998)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 25955)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 26239)
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 26448)
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 26462)
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 25964)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 26015)
-- Name: itemscategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemscategory ALTER COLUMN id SET DEFAULT nextval('public.itemscategory_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 26062)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 26256)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 26032)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 26046)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 25973)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4986 (class 0 OID 26222)
-- Dependencies: 235
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, user_id, address) FROM stdin;
\.


--
-- TOC entry 4966 (class 0 OID 25946)
-- Dependencies: 215
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
e55b4a699938
\.


--
-- TOC entry 4974 (class 0 OID 25981)
-- Dependencies: 223
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth (id, user_id, number, code, expiration_time) FROM stdin;
1	2	79885815850	928978	2024-07-01 15:35:47.230018
2	2	79885815850	140760	2024-07-01 15:38:48.809514
3	2	79885815850	964072	2024-07-01 15:43:56.468506
\.


--
-- TOC entry 4976 (class 0 OID 25995)
-- Dependencies: 225
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, item_id, order_id) FROM stdin;
4	2	3	\N
5	2	6	\N
\.


--
-- TOC entry 4968 (class 0 OID 25952)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, title, image_link) FROM stdin;
\.


--
-- TOC entry 4988 (class 0 OID 26236)
-- Dependencies: 237
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, first_id, second_id) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 26445)
-- Dependencies: 241
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliveries (id, user_id, order_id, status, created_at) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 26459)
-- Dependencies: 243
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, item_id) FROM stdin;
1	2	7
2	2	5
\.


--
-- TOC entry 4970 (class 0 OID 25961)
-- Dependencies: 219
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, title, image_link, description, price, rating, is_active) FROM stdin;
3	Item 1	link1.jpg	Description 1	10.99	4.5	t
4	Item 2	link2.jpg	Description 2	19.99	\N	t
5	Item 3	link3.jpg	Description 3	7.99	3.8	t
6	Item 4	link4.jpg	Description 4	29.99	5	t
7	Rose	https://example.com/rose.jpg	Beautiful red rose	10.99	4.5	t
8	Tulip	https://example.com/tulip.jpg	Colorful tulip flower	8.99	4.2	t
9	Lily	https://example.com/lily.jpg	Fragrant white lily	12.99	4.8	t
10	Daisy	https://example.com/daisy.jpg	Cheerful yellow daisy	6.99	4	t
11	Orchid	https://example.com/orchid.jpg	Exotic purple orchid	14.99	4.6	t
12	Sunflower	https://example.com/sunflower.jpg	Bright sunflower bloom	9.99	4.3	t
13	Hydrangea	https://example.com/hydrangea.jpg	Color-changing hydrangea	11.99	4.1	t
14	Carnation	https://example.com/carnation.jpg	Fragrant pink carnation	7.99	4.4	t
15	Peony	https://example.com/peony.jpg	Delicate pink peony	13.99	4.7	t
16	Daffodil	https://example.com/daffodil.jpg	Bright yellow daffodil	8.99	4.2	t
17	Dahlia	https://example.com/dahlia.jpg	Colorful dahlia flower	10.99	4.5	t
18	Chrysanthemum	https://example.com/chrysanthemum.jpg	Festive chrysanthemum	9.99	4.3	t
\.


--
-- TOC entry 4978 (class 0 OID 26012)
-- Dependencies: 227
-- Data for Name: itemscategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itemscategory (id, item_id, category_id) FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 26059)
-- Dependencies: 233
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, content, "timestamp", user_id, type_message, chat_id) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 26253)
-- Dependencies: 239
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, item_id, created_at, sum) FROM stdin;
7	2	3	2024-07-01 00:00:00	136.33612769090365
8	2	4	2024-08-01 00:00:00	778.9828658860323
9	2	5	2024-09-01 00:00:00	181.6275336791775
10	2	6	2024-10-01 00:00:00	519.9414804371063
11	2	7	2024-11-01 00:00:00	628.5765577835845
12	2	8	2024-12-01 00:00:00	425.271101672263
13	2	9	2025-01-01 00:00:00	971.6188056803086
14	2	10	2025-02-01 00:00:00	434.7194578631706
15	2	11	2025-03-01 00:00:00	190.30419070190808
16	2	12	2025-04-01 00:00:00	63.18766726481017
17	2	13	2025-05-01 00:00:00	221.64280435924576
18	2	14	2025-06-01 00:00:00	624.5424208499519
19	2	15	2025-07-01 00:00:00	907.8700208287929
20	2	16	2025-08-01 00:00:00	875.5914807768495
21	2	17	2025-09-01 00:00:00	164.32165304856184
22	2	18	2025-10-01 00:00:00	905.5096916124216
23	2	3	2025-11-01 00:00:00	863.5532010668687
24	2	4	2025-12-01 00:00:00	43.61844660444581
25	2	5	2026-01-01 00:00:00	32.082938731139436
26	2	6	2026-02-01 00:00:00	295.42118161779854
\.


--
-- TOC entry 4980 (class 0 OID 26029)
-- Dependencies: 229
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, created_at, text, image_link, rating) FROM stdin;
\.


--
-- TOC entry 4982 (class 0 OID 26043)
-- Dependencies: 231
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, auth_id, token) FROM stdin;
1	3	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJNb25mbGVyIiwidXNlcl9pZCI6MiwibnVtYmVyIjoiNzk4ODU4MTU4NTAiLCJleHAiOjE3MjI0NDA1NDV9.lb9IYNKdnQ3x2iPjUWuauxomJ7ZTBwb5t56gPPmkGUbwLIJcuxBBDAAHDkOLsgcWV5QmP-MBGsvilTdskayDcG2R9pdb-FF9VHydiC83qdl20JZUwovFQskKq8jRd9E9VUD_V-FwkK2cipYZr6RkOUzpEElO9XHkgIwnzhLIMzVtFioWh2LI7XjRuZU2-_4ADBuugI2h9HM5-ybnaeOaP_qNcRXINhlDs5ULpAEBYSpcc6SnfRpLh6ey3Ow4NRoLLfqbioMkBzwg_UZMrhL9igNVELRu_S0L6FIjNAMUTu3a3KUo0L-zc-RbBgwtStz8M1XDjsJf8nBRfUDBK2uIOg
\.


--
-- TOC entry 4972 (class 0 OID 25970)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, number, f_name, l_name, created_at, role) FROM stdin;
2	79885815850	Vladislav	Demianenko	2024-07-01 15:33:26.542906	user
\.


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 234
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_id_seq', 3, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 224
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 5, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 216
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 236
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chats_id_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 240
-- Name: deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliveries_id_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 242
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 2, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 18, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 226
-- Name: itemscategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itemscategory_id_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 232
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 4, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 238
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 26, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 228
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 230
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4796 (class 2606 OID 26229)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 25950)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4782 (class 2606 OID 25988)
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 26000)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 25959)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 26241)
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 26452)
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- TOC entry 4804 (class 2606 OID 26464)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 25968)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 26017)
-- Name: itemscategory itemscategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemscategory
    ADD CONSTRAINT itemscategory_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 26066)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 26258)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 26036)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 26050)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 26052)
-- Name: tokens tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_token_key UNIQUE (token);


--
-- TOC entry 4778 (class 2606 OID 25979)
-- Name: users users_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_number_key UNIQUE (number);


--
-- TOC entry 4780 (class 2606 OID 25977)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4815 (class 2606 OID 26230)
-- Name: addresses addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4805 (class 2606 OID 25989)
-- Name: auth auth_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4806 (class 2606 OID 26001)
-- Name: carts carts_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4807 (class 2606 OID 26280)
-- Name: carts carts_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4808 (class 2606 OID 26006)
-- Name: carts carts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4816 (class 2606 OID 26242)
-- Name: chats chats_first_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_first_id_fkey FOREIGN KEY (first_id) REFERENCES public.users(id);


--
-- TOC entry 4817 (class 2606 OID 26247)
-- Name: chats chats_second_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_second_id_fkey FOREIGN KEY (second_id) REFERENCES public.users(id);


--
-- TOC entry 4820 (class 2606 OID 26453)
-- Name: deliveries deliveries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4821 (class 2606 OID 26465)
-- Name: favorites favorites_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4822 (class 2606 OID 26470)
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4809 (class 2606 OID 26018)
-- Name: itemscategory itemscategory_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemscategory
    ADD CONSTRAINT itemscategory_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4810 (class 2606 OID 26023)
-- Name: itemscategory itemscategory_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemscategory
    ADD CONSTRAINT itemscategory_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4813 (class 2606 OID 26269)
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id);


--
-- TOC entry 4814 (class 2606 OID 26274)
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4818 (class 2606 OID 26259)
-- Name: orders orders_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4819 (class 2606 OID 26264)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4811 (class 2606 OID 26037)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4812 (class 2606 OID 26053)
-- Name: tokens tokens_auth_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_auth_id_fkey FOREIGN KEY (auth_id) REFERENCES public.auth(id);


-- Completed on 2025-04-05 20:18:14

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:14

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 26476)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25277)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25276)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 229 (class 1259 OID 25326)
-- Name: clothes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clothes (
    id integer NOT NULL,
    name character varying,
    color character varying,
    category_id integer,
    subcategory_id integer,
    image character varying,
    user_id integer
);


ALTER TABLE public.clothes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25325)
-- Name: clothes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clothes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clothes_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 228
-- Name: clothes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clothes_id_seq OWNED BY public.clothes.id;


--
-- TOC entry 237 (class 1259 OID 25412)
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    clothes_id integer
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25411)
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 236
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- TOC entry 231 (class 1259 OID 25350)
-- Name: commentaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commentaries (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    created_at timestamp without time zone,
    text text
);


ALTER TABLE public.commentaries OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25349)
-- Name: commentaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commentaries_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 230
-- Name: commentaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commentaries_id_seq OWNED BY public.commentaries.id;


--
-- TOC entry 235 (class 1259 OID 25393)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name character varying,
    clothes_id integer,
    calendar_date date,
    user_id integer
);


ALTER TABLE public.images OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25392)
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.images_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 234
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- TOC entry 217 (class 1259 OID 16473)
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    passport_id integer NOT NULL,
    serial_number integer NOT NULL,
    registration character varying(64) NOT NULL,
    fk_passport_person integer
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25314)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    expiration_date timestamp without time zone,
    sum double precision
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25313)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 226
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- TOC entry 216 (class 1259 OID 16468)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25300)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    user_id integer,
    text text,
    link_on_image character varying
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25299)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 224
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 233 (class 1259 OID 25369)
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    id integer NOT NULL,
    header character varying,
    description text,
    clothes_id integer,
    category_id integer,
    subcategory_id integer,
    color character varying,
    sex character varying,
    cost character varying,
    image character varying,
    size integer
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25368)
-- Name: shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 232
-- Name: shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_id_seq OWNED BY public.shop.id;


--
-- TOC entry 223 (class 1259 OID 25286)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
    id integer NOT NULL,
    category_id integer,
    name character varying
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25285)
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategories_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 222
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- TOC entry 219 (class 1259 OID 25268)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying,
    country character varying,
    bithday date,
    password character varying,
    email character varying,
    profile_image character varying,
    subscribe boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25267)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4747 (class 2604 OID 25280)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 25329)
-- Name: clothes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes ALTER COLUMN id SET DEFAULT nextval('public.clothes_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 25415)
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 25353)
-- Name: commentaries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaries ALTER COLUMN id SET DEFAULT nextval('public.commentaries_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 25396)
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 25317)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 25303)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 25372)
-- Name: shop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop ALTER COLUMN id SET DEFAULT nextval('public.shop_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 25289)
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 25271)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4962 (class 0 OID 26476)
-- Dependencies: 238
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 25277)
-- Dependencies: 221
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 25326)
-- Dependencies: 229
-- Data for Name: clothes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothes (id, name, color, category_id, subcategory_id, image, user_id) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 25412)
-- Dependencies: 237
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (id, clothes_id) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 25350)
-- Dependencies: 231
-- Data for Name: commentaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commentaries (id, user_id, post_id, created_at, text) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 25393)
-- Dependencies: 235
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, clothes_id, calendar_date, user_id) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 16473)
-- Dependencies: 217
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passport (passport_id, serial_number, registration, fk_passport_person) FROM stdin;
1	123456	Winterfell	1
2	789012	Winterfell	2
3	345678	Kings"s Landing	3
\.


--
-- TOC entry 4951 (class 0 OID 25314)
-- Dependencies: 227
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, user_id, created_at, expiration_date, sum) FROM stdin;
\.


--
-- TOC entry 4940 (class 0 OID 16468)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (person_id, first_name, last_name) FROM stdin;
1	John	Snow
2	Ned	Stark
3	Rob	Baracteon
\.


--
-- TOC entry 4949 (class 0 OID 25300)
-- Dependencies: 225
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, user_id, text, link_on_image) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 25369)
-- Dependencies: 233
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop (id, header, description, clothes_id, category_id, subcategory_id, color, sex, cost, image, size) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 25286)
-- Dependencies: 223
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategories (id, category_id, name) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 25268)
-- Dependencies: 219
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, country, bithday, password, email, profile_image, subscribe) FROM stdin;
\.


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 228
-- Name: clothes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clothes_id_seq', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 236
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_id_seq', 1, false);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 230
-- Name: commentaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaries_id_seq', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 234
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 226
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 224
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 232
-- Name: shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_id_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 222
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 1, false);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 4781 (class 2606 OID 26480)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4763 (class 2606 OID 25284)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 25333)
-- Name: clothes clothes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 25417)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 25357)
-- Name: commentaries commentaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaries
    ADD CONSTRAINT commentaries_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 25400)
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 16477)
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (passport_id);


--
-- TOC entry 4769 (class 2606 OID 25319)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 16472)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4767 (class 2606 OID 25307)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 25376)
-- Name: shop shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 25293)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 25275)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 25334)
-- Name: clothes clothes_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4787 (class 2606 OID 25339)
-- Name: clothes clothes_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(id);


--
-- TOC entry 4788 (class 2606 OID 25344)
-- Name: clothes clothes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4796 (class 2606 OID 25418)
-- Name: collection collection_clothes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_clothes_id_fkey FOREIGN KEY (clothes_id) REFERENCES public.clothes(id);


--
-- TOC entry 4789 (class 2606 OID 25363)
-- Name: commentaries commentaries_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaries
    ADD CONSTRAINT commentaries_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


--
-- TOC entry 4790 (class 2606 OID 25358)
-- Name: commentaries commentaries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaries
    ADD CONSTRAINT commentaries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4794 (class 2606 OID 25401)
-- Name: images images_clothes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_clothes_id_fkey FOREIGN KEY (clothes_id) REFERENCES public.clothes(id);


--
-- TOC entry 4795 (class 2606 OID 25406)
-- Name: images images_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4782 (class 2606 OID 16478)
-- Name: passport passport_fk_passport_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_fk_passport_person_fkey FOREIGN KEY (fk_passport_person) REFERENCES public.person(person_id);


--
-- TOC entry 4785 (class 2606 OID 25320)
-- Name: payment payment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4784 (class 2606 OID 25308)
-- Name: post post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 4791 (class 2606 OID 25382)
-- Name: shop shop_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4792 (class 2606 OID 25377)
-- Name: shop shop_clothes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_clothes_id_fkey FOREIGN KEY (clothes_id) REFERENCES public.clothes(id);


--
-- TOC entry 4793 (class 2606 OID 25387)
-- Name: shop shop_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(id);


--
-- TOC entry 4783 (class 2606 OID 25294)
-- Name: subcategories subcategories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


-- Completed on 2025-04-05 20:18:15

--
-- PostgreSQL database dump complete
--

--
-- Database "test_go" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:15

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
-- TOC entry 4858 (class 1262 OID 43254)
-- Name: test_go; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_go WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE test_go OWNER TO postgres;

\connect test_go

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
-- TOC entry 218 (class 1259 OID 43268)
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    token character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 43267)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tokens_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 217
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 216 (class 1259 OID 43256)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    age bigint NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 43255)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4694 (class 2604 OID 43271)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 43259)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4852 (class 0 OID 43268)
-- Dependencies: 218
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, created_at, updated_at, deleted_at, token, user_id) FROM stdin;
1	2025-01-14 12:57:00.639722+03	2025-01-14 12:57:00.639722+03	\N	c6c36f17-9260-4f28-809c-b040dc9a470a	2
2	2025-01-14 14:13:09.526557+03	2025-01-14 14:13:09.526557+03	\N	f93d33cf-b35c-4e85-82b2-53e6c6fde97e	5
3	2025-01-14 14:13:19.906457+03	2025-01-14 14:13:19.906457+03	\N	a3e32253-de75-4afa-9696-c1da4622842a	5
\.


--
-- TOC entry 4850 (class 0 OID 43256)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, deleted_at, name, password, email, age) FROM stdin;
1	2025-01-14 09:46:58.073323+03	2025-01-14 09:46:58.073323+03	2025-01-14 10:06:12.016906+03	Vladislav	12345578	lovelly.diller@yandex.ru	20
3	2025-01-14 10:18:32.765039+03	2025-01-14 10:18:32.765039+03	\N	Maksim	1124124512378	test_mail2@yandex.ru	12
4	2025-01-14 10:18:52.157215+03	2025-01-14 10:18:52.157215+03	\N	Vladimir	12345345252	test_mail3@yandex.ru	34
2	2025-01-14 10:16:16.730192+03	2025-01-14 10:57:25.959276+03	\N	Danil	5555555	sobaka_doctor@yandex.ru	52
5	2025-01-14 14:10:38.486593+03	2025-01-14 14:10:38.486593+03	\N	Vladik	$2a$10$CiyHeTlEneFncXnEjxyQHubiURGqYIjYQkMY04r8ahCGgBeueNvIG	best_friend@mail.ru	20
\.


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 217
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 3, true);


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 4702 (class 2606 OID 43273)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 43275)
-- Name: tokens uni_tokens_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT uni_tokens_token UNIQUE (token);


--
-- TOC entry 4697 (class 2606 OID 43265)
-- Name: users uni_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uni_users_email UNIQUE (email);


--
-- TOC entry 4699 (class 2606 OID 43263)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 1259 OID 43281)
-- Name: idx_tokens_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tokens_deleted_at ON public.tokens USING btree (deleted_at);


--
-- TOC entry 4695 (class 1259 OID 43266)
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- TOC entry 4705 (class 2606 OID 43276)
-- Name: tokens fk_users_tokens; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT fk_users_tokens FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-04-05 20:18:15

--
-- PostgreSQL database dump complete
--

--
-- Database "triangle" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:15

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
-- TOC entry 4968 (class 1262 OID 26475)
-- Name: triangle; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE triangle WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE triangle OWNER TO postgres;

\connect triangle

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
-- TOC entry 215 (class 1259 OID 26565)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26582)
-- Name: boosts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boosts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying NOT NULL,
    type_of character varying NOT NULL,
    expiration_time timestamp without time zone,
    level integer
);


ALTER TABLE public.boosts OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 26581)
-- Name: boosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boosts_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 218
-- Name: boosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boosts_id_seq OWNED BY public.boosts.id;


--
-- TOC entry 229 (class 1259 OID 26728)
-- Name: boss; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boss (
    id integer NOT NULL,
    health double precision NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public.boss OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 26727)
-- Name: boss_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boss_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boss_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 228
-- Name: boss_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boss_id_seq OWNED BY public.boss.id;


--
-- TOC entry 227 (class 1259 OID 26701)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    user_id integer NOT NULL,
    card_code character varying NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26700)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 226
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- TOC entry 223 (class 1259 OID 26677)
-- Name: daily_rewards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daily_rewards (
    id integer NOT NULL,
    reward double precision NOT NULL
);


ALTER TABLE public.daily_rewards OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26676)
-- Name: daily_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.daily_rewards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.daily_rewards_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 222
-- Name: daily_rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.daily_rewards_id_seq OWNED BY public.daily_rewards.id;


--
-- TOC entry 237 (class 1259 OID 35070)
-- Name: league_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.league_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    league_id integer NOT NULL
);


ALTER TABLE public.league_users OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 35069)
-- Name: league_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.league_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.league_users_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 236
-- Name: league_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.league_users_id_seq OWNED BY public.league_users.id;


--
-- TOC entry 235 (class 1259 OID 35061)
-- Name: leagues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leagues (
    id integer NOT NULL,
    title character varying NOT NULL,
    max_score integer NOT NULL,
    reward integer
);


ALTER TABLE public.leagues OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 35060)
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leagues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leagues_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 234
-- Name: leagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leagues_id_seq OWNED BY public.leagues.id;


--
-- TOC entry 233 (class 1259 OID 26767)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    img character varying NOT NULL,
    video_link character varying NOT NULL,
    code character varying NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 26766)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 232
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- TOC entry 239 (class 1259 OID 43227)
-- Name: lessons_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lessons_users OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 43226)
-- Name: lessons_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_users_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 238
-- Name: lessons_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_users_id_seq OWNED BY public.lessons_users.id;


--
-- TOC entry 225 (class 1259 OID 26684)
-- Name: ready_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ready_tasks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    task_id integer NOT NULL
);


ALTER TABLE public.ready_tasks OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26683)
-- Name: ready_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ready_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ready_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 224
-- Name: ready_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ready_tasks_id_seq OWNED BY public.ready_tasks.id;


--
-- TOC entry 221 (class 1259 OID 26630)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    name character varying NOT NULL,
    coin_reward double precision NOT NULL,
    gold_reward double precision NOT NULL,
    link character varying NOT NULL,
    type character varying,
    resource_id bigint
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26629)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 220
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 231 (class 1259 OID 26735)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    coin_amount double precision,
    usdt_amount double precision,
    stars_amount double precision,
    status character varying,
    wallet_hash character varying,
    from_user integer
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 26734)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 230
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 217 (class 1259 OID 26571)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    ref_parent bigint,
    ref_line character varying,
    energy double precision NOT NULL,
    max_energy double precision NOT NULL,
    telegram_id bigint NOT NULL,
    level integer NOT NULL,
    role character varying NOT NULL,
    coin_balance double precision NOT NULL,
    usdt_balance double precision NOT NULL,
    reward_time timestamp without time zone NOT NULL,
    daily_reward_count integer NOT NULL,
    damage integer NOT NULL,
    boss_health double precision NOT NULL,
    last_action timestamp without time zone NOT NULL,
    tap_bonus_count double precision NOT NULL,
    energy_bonus_count double precision NOT NULL,
    recovery_rate integer NOT NULL,
    ref_token character varying NOT NULL,
    last_recovery_energy timestamp without time zone NOT NULL,
    last_recovery_tap timestamp without time zone NOT NULL,
    stars_balance double precision NOT NULL,
    username character varying NOT NULL,
    wallet_address character varying NOT NULL,
    league_score double precision NOT NULL,
    boss_max_health double precision NOT NULL,
    is_autobot boolean,
    energy_bonus_used integer,
    tap_bonus_used integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26570)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4748 (class 2604 OID 26585)
-- Name: boosts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boosts ALTER COLUMN id SET DEFAULT nextval('public.boosts_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 26731)
-- Name: boss id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boss ALTER COLUMN id SET DEFAULT nextval('public.boss_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 26704)
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 26680)
-- Name: daily_rewards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rewards ALTER COLUMN id SET DEFAULT nextval('public.daily_rewards_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 35073)
-- Name: league_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league_users ALTER COLUMN id SET DEFAULT nextval('public.league_users_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 35064)
-- Name: leagues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leagues ALTER COLUMN id SET DEFAULT nextval('public.leagues_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 26770)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 43230)
-- Name: lessons_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_users ALTER COLUMN id SET DEFAULT nextval('public.lessons_users_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 26687)
-- Name: ready_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ready_tasks ALTER COLUMN id SET DEFAULT nextval('public.ready_tasks_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 26633)
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 26738)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 26574)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4938 (class 0 OID 26565)
-- Dependencies: 215
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
d68afc3ffbff
\.


--
-- TOC entry 4942 (class 0 OID 26582)
-- Dependencies: 219
-- Data for Name: boosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boosts (id, user_id, name, type_of, expiration_time, level) FROM stdin;
196	35	multitap	paid_boost	\N	1
197	35	multitap	paid_boost	\N	2
198	35	energy_limit	paid_boost	\N	1
199	35	energy_limit	paid_boost	\N	2
200	35	energy_limit	paid_boost	\N	3
\.


--
-- TOC entry 4952 (class 0 OID 26728)
-- Dependencies: 229
-- Data for Name: boss; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boss (id, health, level) FROM stdin;
1	1000	1
2	2000	2
3	3000	3
4	4000	4
\.


--
-- TOC entry 4950 (class 0 OID 26701)
-- Dependencies: 227
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, user_id, card_code, is_active) FROM stdin;
\.


--
-- TOC entry 4946 (class 0 OID 26677)
-- Dependencies: 223
-- Data for Name: daily_rewards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daily_rewards (id, reward) FROM stdin;
1	1100
2	1200
3	1300
4	1400
5	1500
6	1600
7	1700
8	1800
9	1900
10	100
\.


--
-- TOC entry 4960 (class 0 OID 35070)
-- Dependencies: 237
-- Data for Name: league_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.league_users (id, user_id, league_id) FROM stdin;
10	35	2
12	37	1
13	38	1
14	39	1
15	40	1
16	41	1
\.


--
-- TOC entry 4958 (class 0 OID 35061)
-- Dependencies: 235
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leagues (id, title, max_score, reward) FROM stdin;
1	Wooden League	100000	1300
2	Stone League	200000	5000
3	Bronze League	300000	10000
4	Silver League	400000	20000
\.


--
-- TOC entry 4956 (class 0 OID 26767)
-- Dependencies: 233
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, name, description, img, video_link, code, amount) FROM stdin;
1	Основы Python	Урок по основам языка Python, включая синтаксис и базовые структуры данных	/images/python_basics.png	https://video-platform.com/python_basics	PYTHON101	19.99
2	Работа с базами данных	Курс по работе с базами данных, включая SQL и ORM	/images/database_course.png	https://video-platform.com/db_course	DB202	29.99
3	Введение в FastAPI	Основы работы с FastAPI для создания API на Python	/images/fastapi_intro.png	https://video-platform.com/fastapi_intro	FASTAPI101	24.99
\.


--
-- TOC entry 4962 (class 0 OID 43227)
-- Dependencies: 239
-- Data for Name: lessons_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons_users (id, user_id, lesson_id) FROM stdin;
\.


--
-- TOC entry 4948 (class 0 OID 26684)
-- Dependencies: 225
-- Data for Name: ready_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ready_tasks (id, user_id, task_id) FROM stdin;
6	35	1
7	35	2
8	35	3
9	39	1
10	39	2
11	39	3
\.


--
-- TOC entry 4944 (class 0 OID 26630)
-- Dependencies: 221
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, name, coin_reward, gold_reward, link, type, resource_id) FROM stdin;
1	Задание 1: Пройти тест по Python	50	10	https://task-platform.com/python_test	tg_channel	\N
2	Задание 2: Развернуть приложение на FastAPI	100	20	https://task-platform.com/deploy_fastapi	tg_community	\N
3	Задание 3: Написать запрос к базе данных	75	15	https://task-platform.com/db_query_task	other	\N
\.


--
-- TOC entry 4954 (class 0 OID 26735)
-- Dependencies: 231
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, user_id, type, created_at, coin_amount, usdt_amount, stars_amount, status, wallet_hash, from_user) FROM stdin;
1	35	Reward for lesson	2024-10-11 23:09:26.208816	19.99	0	0	\N	\N	\N
2	35	Reward for lesson	2024-10-11 23:09:26.208816	19.99	0	0	\N	\N	\N
3	35	Reward for lesson	2024-10-11 23:10:16.197838	19.99	0	0	\N	\N	\N
4	35	Reward for lesson	2024-10-11 23:11:41.551117	19.99	0	0	\N	\N	\N
5	35	Reward for lesson	2024-10-11 23:12:08.477803	19.99	0	0	\N	\N	\N
6	35	Reward for lesson	2024-10-11 23:12:08.477803	19.99	0	0	\N	\N	\N
7	35	Reward for lesson	2024-10-11 23:12:08.477803	19.99	0	0	\N	\N	\N
8	35	Reward for lesson	2024-10-11 23:41:34.347878	19.99	0	0	\N	\N	\N
9	35	Reward for lesson	2024-10-12 00:03:07.143704	19.99	0	0	\N	\N	\N
10	35	Reward for lesson	2024-10-12 00:12:23.541694	19.99	0	0	\N	\N	\N
11	35	reward for task	2024-10-12 10:48:28.958409	50	10	0	\N	\N	\N
12	35	reward for task	2024-10-12 10:59:43.961387	100	20	0	\N	\N	\N
13	35	reward for task	2024-10-12 11:13:44.361034	75	15	0	\N	\N	\N
14	39	reward for task	2024-10-12 20:05:36.120815	50	10	0	\N	\N	\N
15	37	reward for referal	2024-10-12 20:05:36.120815	5	1	0	\N	\N	39
16	35	reward for referal	2024-10-12 20:05:36.120815	2.5	0.5	0	\N	\N	39
17	39	reward for task	2024-10-12 20:05:36.120815	100	20	0	\N	\N	\N
18	37	reward for referal	2024-10-12 20:05:36.120815	10	2	0	\N	\N	39
19	35	reward for referal	2024-10-12 20:05:36.120815	5	1	0	\N	\N	39
20	35	deposit	2024-10-13 22:25:32.538642	0	10000000	0	rejected	0:2d4e809a29e7aa4a76b8ab16838ba943ee0eaf5439d23044d7be9bc3104dfd0c	\N
21	39	reward for task	2024-10-13 23:25:00.143462	75	15	0	\N	\N	\N
\.


--
-- TOC entry 4940 (class 0 OID 26571)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, ref_parent, ref_line, energy, max_energy, telegram_id, level, role, coin_balance, usdt_balance, reward_time, daily_reward_count, damage, boss_health, last_action, tap_bonus_count, energy_bonus_count, recovery_rate, ref_token, last_recovery_energy, last_recovery_tap, stars_balance, username, wallet_address, league_score, boss_max_health, is_autobot, energy_bonus_used, tap_bonus_used) FROM stdin;
39	2024-10-12 20:33:51.516968	477521898	406898631-477521898-462021542	884.1273102430556	1000	406898631	3	user	94267	30	2024-10-13 22:31:53.725457	1	4	2319	2024-10-14 15:37:58.875401	3	0.008346465000000025	8	3fe2e658-cf53-42d7-9ee8-93f38970407b	2024-10-14 15:37:58.875401	2024-10-14 15:37:58.875401	0	EspirituMaligno		4931	3000	f	3	2
38	2024-10-12 12:56:11.413826	477521898	472221892-477521898-462021542	500	500	472221892	1	user	0	0	2024-10-12 12:56:11.411632	0	1	1000	2024-10-12 12:54:34.049531	3	3	8	9e36c414-dc60-4421-8d24-8e5aed1d8587	2024-10-12 12:54:34.049531	2024-10-12 12:54:34.049531	0	anastasia_pro3		0	1000	f	0	0
37	2024-10-12 12:49:47.859727	462021542	477521898-462021542	14.613108975694441	500	477521898	1	user	549	3	2024-10-12 12:49:47.855948	0	1	466	2024-10-13 01:02:47.759796	3	3	8	e7bb2a27-8ea6-460a-8c8d-bd930c8d931b	2024-10-13 01:02:44.568442	2024-10-13 01:02:44.568442	0	eriko_kijay		549	1000	f	0	0
40	2024-10-12 22:06:39.378891	0	7166886304	439.22144204861127	500	7166886304	2	user	1104	0	2024-10-12 22:06:39.377884	0	1	1896	2024-10-13 01:22:01.976017	3	3	8	1c876748-0d0b-42f4-91a3-0c754a02520c	2024-10-13 01:22:01.976017	2024-10-13 01:22:01.976017	0	vlad_panamera1		1104	2000	f	0	0
41	2024-10-13 22:34:29.158988	0	1695990935	483.08013640624995	500	1695990935	1	user	82	0	2024-10-13 22:34:29.156987	0	1	918	2024-10-13 23:37:16.588527	3	3	8	190c80c0-558a-4929-ae22-88112e661990	2024-10-13 23:37:16.588527	2024-10-13 23:37:16.588527	0	nevgeni		82	1000	f	0	0
35	2024-10-11 21:05:35.723663	0	462021542	2932.6490800000006	3000	462021542	3	user	901520	46.5	2024-10-13 22:31:41.826798	2	4	172	2024-10-14 15:40:08.300402	0	0.08405864611111125	6	6d84251b-7da5-4f02-931f-cbef0f9bff7f	2024-10-14 15:40:08.300402	2024-10-14 15:40:08.300402	0	ayarayarovich		107485.5	3000	f	3	3
\.


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 218
-- Name: boosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boosts_id_seq', 200, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 228
-- Name: boss_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boss_id_seq', 1, false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 226
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 4, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 222
-- Name: daily_rewards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.daily_rewards_id_seq', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 236
-- Name: league_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.league_users_id_seq', 16, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 234
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leagues_id_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 232
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 3, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 238
-- Name: lessons_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_users_id_seq', 1, false);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 224
-- Name: ready_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ready_tasks_id_seq', 11, true);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 220
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 3, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 230
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 21, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 41, true);


--
-- TOC entry 4760 (class 2606 OID 26569)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4764 (class 2606 OID 26587)
-- Name: boosts boosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boosts
    ADD CONSTRAINT boosts_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 26733)
-- Name: boss boss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boss
    ADD CONSTRAINT boss_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 26706)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 26682)
-- Name: daily_rewards daily_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daily_rewards
    ADD CONSTRAINT daily_rewards_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 35075)
-- Name: league_users league_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league_users
    ADD CONSTRAINT league_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 35068)
-- Name: leagues leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 26774)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 43232)
-- Name: lessons_users lessons_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT lessons_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 26689)
-- Name: ready_tasks ready_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ready_tasks
    ADD CONSTRAINT ready_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 26637)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 26742)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 26578)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 26588)
-- Name: boosts boosts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boosts
    ADD CONSTRAINT boosts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4788 (class 2606 OID 26707)
-- Name: cards cards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4791 (class 2606 OID 35076)
-- Name: league_users league_users_league_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league_users
    ADD CONSTRAINT league_users_league_id_fkey FOREIGN KEY (league_id) REFERENCES public.leagues(id);


--
-- TOC entry 4792 (class 2606 OID 35081)
-- Name: league_users league_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league_users
    ADD CONSTRAINT league_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4793 (class 2606 OID 43233)
-- Name: lessons_users lessons_users_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT lessons_users_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- TOC entry 4794 (class 2606 OID 43238)
-- Name: lessons_users lessons_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_users
    ADD CONSTRAINT lessons_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4786 (class 2606 OID 26690)
-- Name: ready_tasks ready_tasks_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ready_tasks
    ADD CONSTRAINT ready_tasks_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.tasks(id);


--
-- TOC entry 4787 (class 2606 OID 26695)
-- Name: ready_tasks ready_tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ready_tasks
    ADD CONSTRAINT ready_tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4789 (class 2606 OID 43243)
-- Name: transactions transactions_from_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_from_user_fkey FOREIGN KEY (from_user) REFERENCES public.users(id);


--
-- TOC entry 4790 (class 2606 OID 26748)
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-04-05 20:18:16

--
-- PostgreSQL database dump complete
--

--
-- Database "webmarket" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-04-05 20:18:16

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
-- TOC entry 4885 (class 1262 OID 26285)
-- Name: webmarket; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE webmarket WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE webmarket OWNER TO postgres;

\connect webmarket

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
-- TOC entry 215 (class 1259 OID 26296)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26322)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    order_id integer
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26321)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 220
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 217 (class 1259 OID 26302)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26301)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 216
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 223 (class 1259 OID 26339)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    sum double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26338)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 219 (class 1259 OID 26311)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    number character varying NOT NULL,
    f_name character varying NOT NULL,
    l_name character varying NOT NULL,
    birthday_date date,
    created_at timestamp without time zone NOT NULL,
    token character varying,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 26310)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4709 (class 2604 OID 26325)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 26305)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 26342)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 26314)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4871 (class 0 OID 26296)
-- Dependencies: 215
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
eee1b983c14b
\.


--
-- TOC entry 4877 (class 0 OID 26322)
-- Dependencies: 221
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, item_id, order_id) FROM stdin;
4	3	1	\N
5	3	1	\N
6	3	2	\N
7	3	3	\N
\.


--
-- TOC entry 4873 (class 0 OID 26302)
-- Dependencies: 217
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, title, description, price) FROM stdin;
1	Ноутбук HP Pavilion	Мощный ноутбук с процессором Intel Core i7, 16 ГБ оперативной памяти и SSD на 512 ГБ.	1200
2	Смартфон Samsung Galaxy S22 Ultra	Флагманский смартфон с 6.8-дюймовым экраном Dynamic AMOLED 2X, камерой с разрешением 108 МП и поддержкой S Pen.	1500
3	Наушники Bose QuietComfort 45	Шумоподавляющие Bluetooth наушники с высоким качеством звука и комфортной посадкой.	300
4	Фитнес-трекер Fitbit Charge 5	Умный браслет для отслеживания активности с дисплеем AMOLED, мониторингом сна и сердечным ритмом.	180
5	Кофемашина De'Longhi Magnifica	Автоматическая кофемашина с функцией капучинатора, молочным контейнером и возможностью приготовления эспрессо.	600
6	Игровая консоль Sony PlayStation 5	Популярная игровая консоль нового поколения с высокой производительностью, 4K-графикой и поддержкой VR.	500
7	Lenovo 7 pro max air boost very cool	Классный мобильный телефон, 500гб, 100000 мегапикселей	560
\.


--
-- TOC entry 4879 (class 0 OID 26339)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, created_at, sum) FROM stdin;
3	3	2024-07-07 16:59:32.700957	1680
4	3	2024-07-07 17:02:01.893795	1680
5	3	2024-07-07 17:04:42.984025	1680
\.


--
-- TOC entry 4875 (class 0 OID 26311)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, number, f_name, l_name, birthday_date, created_at, token, password) FROM stdin;
3	79885815850	Владислав	Демьяненко	2004-07-21	2024-07-07 15:43:52.934862	db6b455c-a9cb-449a-a527-af79c7f465f3	88355247
\.


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 220
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 7, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 216
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 7, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 4712 (class 2606 OID 26300)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 4722 (class 2606 OID 26327)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 26309)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 26344)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4716 (class 2606 OID 26320)
-- Name: users users_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_number_key UNIQUE (number);


--
-- TOC entry 4718 (class 2606 OID 26318)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 26356)
-- Name: users users_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_key UNIQUE (token);


--
-- TOC entry 4725 (class 2606 OID 26328)
-- Name: carts carts_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4726 (class 2606 OID 26333)
-- Name: carts carts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4727 (class 2606 OID 26350)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-04-05 20:18:16

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-04-05 20:18:16

--
-- PostgreSQL database cluster dump complete
--

