--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: acezoncay; Tablespace: 
--

CREATE TABLE migrations (
    id integer NOT NULL,
    name text NOT NULL,
    ran_at timestamp without time zone
);


ALTER TABLE public.migrations OWNER TO acezoncay;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: acezoncay
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO acezoncay;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acezoncay
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: nominations; Type: TABLE; Schema: public; Owner: acezoncay; Tablespace: 
--

CREATE TABLE nominations (
    id integer NOT NULL,
    nominee text,
    userid integer,
    positionid integer
);


ALTER TABLE public.nominations OWNER TO acezoncay;

--
-- Name: nominations_id_seq; Type: SEQUENCE; Schema: public; Owner: acezoncay
--

CREATE SEQUENCE nominations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nominations_id_seq OWNER TO acezoncay;

--
-- Name: nominations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acezoncay
--

ALTER SEQUENCE nominations_id_seq OWNED BY nominations.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: acezoncay; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    "position" text
);


ALTER TABLE public.positions OWNER TO acezoncay;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: acezoncay
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO acezoncay;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acezoncay
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: acezoncay; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    nickname text,
    email text,
    hashed_password text,
    has_nominated boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO acezoncay;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: acezoncay
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO acezoncay;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acezoncay
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY nominations ALTER COLUMN id SET DEFAULT nextval('nominations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: acezoncay
--

COPY migrations (id, name, ran_at) FROM stdin;
1	create users table	2014-03-12 17:35:53.217522
2	create positions table	2014-03-12 17:35:53.235161
3	create nominations table	2014-03-12 17:35:53.249582
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acezoncay
--

SELECT pg_catalog.setval('migrations_id_seq', 3, true);


--
-- Data for Name: nominations; Type: TABLE DATA; Schema: public; Owner: acezoncay
--

COPY nominations (id, nominee, userid, positionid) FROM stdin;
1	Christine Balili	114	1
2	Caryssa Sobrepena	114	2
3	Arah Jamandra	114	3
4	Wealthy Hsieh	114	4
5	Camille Chen	114	5
6	Dale Lim	114	6
7	Hillary Datoc	114	7
8	Kristoffer Mendoza	114	8
9	n/a	114	9
10	Christine Balili	112	1
11	Caryssa Sobrepena	112	2
12	Charmaine Malubag	112	3
13	Wealthy Hsieh	112	4
14	Camille Chen	112	5
15	Dale Lim	112	6
16	Hillary Datoc	112	7
17	Arah Jamandra	112	8
18	Jonathan Gregorio	112	9
19	Christine C. Balili	111	1
20	Caryssa Sobrepena	111	2
21	Charmaine Malubag	111	3
22	Wealthy Hsieh	111	4
23	Ryan Wong	111	5
24	Dale Lim	111	6
25	Hillary Datoc	111	7
26	Kristoffer Mendoza	111	8
27	Joseph Daniel Dantes	111	9
28	Christine Balili -DUH	69	1
29	Caryssa Sobrepena	69	2
30	Charmaine Malubag	69	3
31	Wealthy Hsieh	69	4
32	Ryan Wong	69	5
33	Dale Lim 	69	6
34	Hilary Datoc	69	7
35	Kristoffer Mendoza	69	8
36	Daniele Juan	69	9
37	Christine Balili	12	1
38	Kon Belenzo	12	2
39	n/a	12	3
40	Katrina Gapuz	12	4
41	n/a	12	5
42	Ephraim Mendoza	12	6
43	Hillary Datoc	12	7
44	n/a	12	8
45	n/a	12	9
46	Christine Balili	41	1
47	Mark Ibasco	41	2
48	n/a	41	3
49	Katrina Gapuz	41	4
50	n/a	41	5
51	Josef reyes	41	6
52	Hillary Datoc	41	7
53	n/a	41	8
54	n/a	41	9
55	Corina Belenzo	85	1
56	Herbert Villafranca	85	2
57	Catherine Ting	85	3
58	Errol Pineda	85	4
59	Katrina Lorenzo	85	5
60	n/a	85	6
61	n/a	85	7
62	n/a	85	8
63	n/a	85	9
64	Christine Balili	75	1
65	Caryssa Sobrepena	75	2
66	Sherlyn Francia	75	3
67	Marco Ibasco	75	4
68	Wealthy Hsieh	75	5
69	Erwin Sanchez	75	6
70	Hillary Datoc	75	7
71	Arah Jamandra	75	8
72	David Relao	75	9
73	Christine Balili	96	1
74	Caryssa Sobrepena	96	2
75	n/a	96	3
76	Wealthy Hsieh	96	4
77	n/a	96	5
78	n/a	96	6
79	Errol Pineda	96	7
80	n/a	96	8
81	n/a	96	9
82	Christine Balili	106	1
83	Arah Jamandra	106	2
84	Charmaine Malubag	106	3
85	Wealthy Hsieh	106	4
86	Ginette Codera	106	5
87	Ephraim Mendoza	106	6
88	Hilary Datoc	106	7
89	Andie Rabino	106	8
90	Jadurani Davalos	106	9
91	Christine Balili	95	1
92	Caryssa Sobrepena	95	2
93	Charmaine Malubag	95	3
94	Wealthy Hsieh	95	4
95	Camille Chen	95	5
96	Dale Lim	95	6
97	Jerome Beltran	95	7
98	Alyssa Chen	95	8
99	Katrina Lorenzo	95	9
100	Christine Balili	65	1
101	Camille Chen	65	2
102	Corina Belenzo	65	3
103	Marco Ibasco	65	4
104	Caryssa Sobrepena	65	5
105	Romeo Caparas	65	6
106	Hillary Datoc	65	7
107	Kristoffer Mendoza	65	8
108	Errol Pineda	65	9
109	Christine Balili	58	1
110	Arah Jodelle Jamandra	58	2
111	Arah Jodelle Jamandra	58	3
112	Wealthy Hsieh	58	4
113	Camille Chen	58	5
114	Dale Lim	58	6
115	Hillary Datoc	58	7
116	Kristoffer Mendoza	58	8
117	Kon Belenzo	58	9
118	Christine Balili	82	1
119	Caryssa Sobrepena	82	2
120	n/a	82	3
121	n/a	82	4
122	n/a	82	5
123	n/a	82	6
124	n/a	82	7
125	n/a	82	8
126	n/a	82	9
127	Christine Balili	59	1
128	Caryssa Sobrepena	59	2
129	Charmaine Malubag	59	3
130	Wealthy Hsieh	59	4
131	Camille Chen	59	5
132	Dale Lim	59	6
133	Romelio Tavas Jr. 	59	7
134	Kristoffer Mendoza	59	8
135	Acezon Cay	59	9
136	Kon Belenzo	76	1
137	Christine Balili	76	2
138	Arah Jodelle Jamandra	76	3
139	n/a	76	4
140	Mara Shen	76	5
141	n/a	76	6
142	Maria April Rose Andaca	76	7
143	Kristoff Mendoza	76	8
144	Nina Quiazon	76	9
145	Christine Balili	86	1
146	Kon Belenzo	86	2
147	n/a	86	3
148	n/a	86	4
149	n/a	86	5
150	n/a	86	6
151	Romelio Tavas	86	7
152	n/a	86	8
153	n/a	86	9
154	Kon Belenzo	24	1
155	Caryssa Sobrepeña	24	2
156	N/A	24	3
157	Denise Leviste	24	4
158	N/A	24	5
159	N/A	24	6
160	Errol Pineda	24	7
161	Kristoffer Mendoza	24	8
162	Christine Balili	24	9
163	Christine Balili	17	1
164	Herbie Villafrance	17	2
165	Arah Jodelle Jamandra	17	3
166	Wealthy Hsieh	17	4
167	Camille Chen	17	5
168	Ryan Wong	17	6
169	Romelio Tavas	17	7
170	Kristoffer Mendoza	17	8
171	Caryssa Sobrepeña	17	9
172	Christine Balili	80	1
173	n/a	80	2
174	n/a	80	3
175	Kat Lorenzo	80	4
176	n/a	80	5
177	n/a	80	6
178	n/a	80	7
179	Kristoff Mendoza	80	8
180	n/a	80	9
181	Christine Balili	73	1
182	Caryssa Sobrepena	73	2
183	Arah Jodelle Jamandra	73	3
184	Wealthy Hsieh	73	4
185	Camille Chen	73	5
186	Dale Lim	73	6
187	Hillary Datoc	73	7
188	Kristoffer Mendoza	73	8
189	n/a	73	9
190	Korina Belenzo	16	1
191	Christine Balili	16	2
192	n/a	16	3
193	n/a	16	4
194	n/a	16	5
195	n/a	16	6
196	Errol Pineda	16	7
197	Toff Mendoza	16	8
198	n/a	16	9
199	Kon Belenzo	3	1
200	Errol Pineda	3	2
201	Errol Pineda	3	3
202	Errol Pineda	3	4
203	Errol Pineda	3	5
204	Errol Pineda	3	6
205	Errol Pineda	3	7
206	Errol Pineda	3	8
207	Errol Pineda	3	9
208	Christine Balili	94	1
209	Camille Chen	94	2
210	Ryan Gozum	94	3
211	Wealthy Hsieh	94	4
212	n/a	94	5
213	n/a	94	6
214	Niña Quiazon	94	7
215	Kristoff Mendoza	94	8
216	n/a	94	9
217	Christine Balili	19	1
218	Camille Chen	19	2
219	Corina Belenzo	19	3
220	Denise Leviste	19	4
221	Acezon Cay	19	5
222	Nathaniel Martinez	19	6
223	Romelio Tavas Jr.	19	7
224	Kristoff Mendoza	19	8
225	Caryssa Sobrepeña	19	9
\.


--
-- Name: nominations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acezoncay
--

SELECT pg_catalog.setval('nominations_id_seq', 225, true);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: acezoncay
--

COPY positions (id, "position") FROM stdin;
1	Chairperson
2	Vice Chairperson & Membership Head
3	Secretary & Records Head
4	Treasurer & Finance Head
5	Marketing Head
6	Logistics Head
7	Education Head
8	Publicity Head
9	Public Relations Head
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acezoncay
--

SELECT pg_catalog.setval('positions_id_seq', 9, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: acezoncay
--

COPY users (id, nickname, email, hashed_password, has_nominated) FROM stdin;
1	Arben	arben.bendicio.arizapa@gmail.com	$2a$10$8ylkM7e/12CT0QJm1bxxLu6DNZ.eD2ntaW5YJwABXo37r4sHwd1wK	f
2	Jem	jcbbeltran@gmail.com	$2a$10$WpqYr6vULFLwY2RSuuk0vOFjVd/p5JhEnLFbvyNLhqffEj.8P7q/W	f
4	Jym	pauljym_carandang@yahoo.com	$2a$10$rqYE.aCTihdGIuQJG7NJAObdMhHlgA9sxho8bhPSGxf4Vd2ypHoPi	f
5	Juancho	juanfelipe.coronel@gmail.com	$2a$10$ofoUQt8J2cxxuy38Fbg4tuNWMu1XJ2kQ3vicLZFUJVb3eXbgv0bbC	f
6	JD	jddantes@gmail.com	$2a$10$xE2H4lG6prii67hypVNyV.nqiou3oHeYs1eeF72I93OVVthKCeaP2	f
7	Larry	hitdatoc@gmail.com	$2a$10$ugVEN2mwdX.pMeEidKkreu4AWfKYMlXz/BzO50/fWQWVnfGIAd1JG	f
8	Joe	joferrer16@gmail.com	$2a$10$Kl4dHRE6nxlDMpq6G0NAt.uAry45UWTO8RSMgDSTnc/B81XF6ucbG	f
9	Marty	thekeyofm@gmail.com	$2a$10$Wo0lVIsVGqV6m7GJgSq22O3M2K2F7bHgCcgbhF9NaHNDgWEv/LGQW	f
10	Ryan	ryangatchalian912@yahoo.com	$2a$10$D5VaA79lzE2ID5ECCIyEU.DIDTrMJ6YOPlquSGM2lQgjaooflNiWK	f
11	Jon	jlibasco@gmail.com	$2a$10$H7H5DNK0JJNZLlU.AHLr1uuYoMrZBA0gV4XWCJJPAKmgcDqD5J1iW	f
13	Grace	gm.ace07143@gmail.com	$2a$10$7dPw9pYetm.KB165DG2f.uCd0WE6oAMzzezIKCc89zv68WFiiFfKO	f
14	Jeru	jmerc87@gmail.com	$2a$10$nVSSvJ3m0pRJCHTqVbu6beaO96.MgWuuseh1dVlBY1hDPHKawyWW6	f
15	CD	clearcrystal89@gmail.com	$2a$10$uKGkihjbqOd7LA31YOP8OeLk/aTwQmcFVTU.TkppqQDY97psaHUSC	f
18	Marv	marven.sanchez@gmail.com	$2a$10$w359x9Vh9y9iHPErD9grwewBEcuuooGCG3ja5MQrzksiJMXoWbzh.	f
20	Jherico	jgqtorres150@gmail.com	$2a$10$d6miO9dBKRnM9SxAfxO60uX2pCjhSGrNRr2nkYoh6Or.h6v3tajhG	f
21	Chery	cheryleighverano@gmail.com	$2a$10$zYMVivj4RamV1RETJ9t/zuB2kg8bNUIu3hwVtIa0OBWAFe6Viyk0e	f
22	Tupper	christov9999@gmail.com	$2a$10$fyAgsYQgLbg2v6p7HJYTs.Aq5.FMarKumWfoYLtxm/4.nNyyBYQx2	f
23	Ryan	ryan.wong022@gmail.com	$2a$10$oKprTF38Tk6l5HiFQAT1QuZoYOs./P/l/JCukEb7ZfbeA0tdkKyQ2	f
25	Eds	edeline_cruz08@yahoo.com.ph	$2a$10$xNUqhg0fimP3oieIa1kdPOzbxPo0El8g0sH.GXy7mmVqlQUvzV/yC	f
26	Mike	jmpcruz7@yahoo.com	$2a$10$Kyjh5UkaKDi/AMM04Jk9VO2KfNjBs1No5IWjwctwxqhjCthLQAzg6	f
27	Fatima	fatima_devilla12@yahoo.com	$2a$10$TVa/TtZbg0rPf/PCar7QK.DUJ7mrnYDj.G1Kh3sUs5qV9InkSGLfy	f
28	Vien	vienfuentes@gmail.com	$2a$10$m82A8ZxEYml8Jl75nmxBWOXjK002JNOViksP175pNMgn0FagCn4ei	f
29	Kat	gapuz.katrina@yahoo.com	$2a$10$cR2USPtCZtI/NzTw9XHvWOYZ7XnMc04I3WapC7ira7s1o/JLIToZq	f
30	David	ddhostallero@yahoo.com	$2a$10$msnVFBI/TA3kG7yfT5BzwuiA/ykThaX2Kf0gD4b5jPFuCQPhNGCwG	f
31	Wealthy	wealthy_bunny215@yahoo.com	$2a$10$LVi1nKWHYOqCT4zSKkTWW.5mBgUWf4V8yq0uYVJYcwifX1D8q4gnK	f
32	Marco	rmarkibasco@gmail.com	$2a$10$l/iTxRkzWPxhQLSeOHdKX.TabmYW5tDHCkHlBlt4n1cGpSYQAvGTS	f
33	DJ	drleviste@gmail.com	$2a$10$sWM.k8tY1XKQOGu1RXodE.MzghB6mnjco1VPMXCX9MWOQtxxGjOlC	f
34	Kat	katrinadlorenzo@yahoo.com	$2a$10$gB3KOlbQUo.Wo90QAoHGm.7IYyVfNaV1HZ3vKML8fFQVQ3pjX4Ic.	f
35	Rhosty	rhostymaninit@gmail.com	$2a$10$OhaNTzN2V42flDTKbmWW9OzUQV5dKxOY3pvbxuJTwwmVd3lNBCnLi	f
36	Janeri	annajaneriongcol@gmail.com	$2a$10$eN7DgrNbH5d6B5tqyi1cG.tNDyUYkjd76O6GIqAVg24RklG1BEV06	f
37	Jecca	j25_jessie@yahoo.com	$2a$10$3Dm4yGn8GcBlqSjeq5PKneScnt7yxX55N8u2XAQ7q0R/LljBr9eL2	f
38	Love	lgsantos19@gmail.com	$2a$10$pql0il1p8gWVM9IfAP1ttex3gC6KZpTi08CS16WDXNQTtENxJlf6O	f
39	Mara	maraoshen@gmail.com	$2a$10$NPO7EJ.WOFfD3/WKCmPMVOKC3DJwjVhV.sagrYY//ZeNWfvPQWhzC	f
40	Keith	keith_tayzon@yahoo.com.ph	$2a$10$VSfSQLcLacsibtKRUkX0U.ndzGy8QhrO7GB8SbEJpkiNchbEPSsPK	f
42	Jad	jadurani.davalos@gmail.com	$2a$10$ug2Cr3E/v4jUWNO3dOiCze9LbmKcTfL6XzoL06lfDsAiNKwa773/m	f
43	Vivi	vdencarnacion@gmail.com	$2a$10$1TejtNg/xxKcZT60SmBRauAZi.d25mmK6sws69G2pqpnWPWZ/.Ese	f
44	Daniel	beatbreezes@gmail.com	$2a$10$IfXuiCRgEz3dhwHf881RqeaSBF//JN2Fw2cXvkT/NMbLH3li4J2KG	f
45	Rey	rey.geronia.ii@gmail.com	$2a$10$6FJqypJl.5iH0OPiKib6q.1XztInJQL34dq.Aj95iASpFE8lpKb3m	f
46	Patrick	patricable@yahoo.com	$2a$10$ywzMSJ0UnnWS8IULUib/Aes5B36XRLf0pKRZEi6MXgcM2Hhv3B79W	f
47	Rea	rezaguilorea@gmail.com	$2a$10$Uf4.FIPb/dCc/jfIKcZAZuUf0.eqAhPCgGLZ5TBG0pNcM65g4bZmG	f
48	Raph	joraphmedina@gmail.com	$2a$10$UCKUJkZ.0ts.L2McGOrVfeqqxzIv4hMZjwW69ekjgtappFXWffWVm	f
49	Eph	mendoza.eph@gmail.com	$2a$10$Qvqah98d0XzyEQ3WyM.AW.WwJxt160ZsGPMo77eCTgee0YBAtdrri	f
50	Sef	reyes_josef@yahoo.com	$2a$10$Hjh/0q0dgmygz5rRF9E2fumcCnqAfcfYdrDFwvxdHSV.1tT11zSku	f
51	Wilson	wptalento@up.edu.ph	$2a$10$Td5zvv0AtTnOeCKZZsDBY.XXc12Kk7ghP6T8h11j177IkkezPJN3i	f
52	Louvette	ting.catherine@yahoo.com	$2a$10$4E1DC2DDU/vaafb4/gFAE.lzqXRme65Uw.o1wJhXE0gtl2N5Ixrma	f
53	Fran	franbienjan@gmail.com	$2a$10$B15SxsFeo7mzvvmwyL8R2ufmNmSQRnex16znY.TELAUErC.yoyZZi	f
54	Jen	zhanrah88@gmail.com	$2a$10$mwHtOhnZf1O7Vdw3IeNYjepHtHV.UbmTE2iISBr/MvVXIczabjbcC	f
55	Elijah	ebcayabyab01@gmail.com	$2a$10$DougD5wxN15vdl7xccdSHuSYMx1LwXTJxjMO/fHRNeuP8jiNw9Nn6	f
56	Ginette	ginettecodera@yahoo.com	$2a$10$QKH369SbCN/pkkcCOdSSHOav1X8Uq.hG6cmD0goYG7C9igGT4uo3.	f
57	Phebe	phebegencio@gmail.com	$2a$10$.AvTylnq7hplJe7h4eSDbeQ9C/u9WhcQsWxQVFFLRGxBv2g0xKkUu	f
60	Jayme	jaymelyn.ilao@yahoo.com	$2a$10$aXi5uuwzpkUILGV/w2PJG.GkBBbp2wQF36cPWFOUvooLKp6chwI3W	f
61	Cheska	cheskalooo@gmail.com	$2a$10$ZipBHi2FSJfJxVVC9h/Q/.RIYTzTWmNvsSV4syUSDHx10iGECz.iK	f
62	Telle	mc.osera@gmail.com	$2a$10$TprlffanwmNLjgs59VbTd.CHQlKLCdIhf8mC4VuUjUtdS6Hsw1mNG	f
63	Franz	franz.palngipang@gmail.com	$2a$10$h4kUcJr/nSj02vBMEEwSqOzAV26iXWKXcni.0HO380gGSb5RJwBj.	f
64	Bryan	barg.tan@gmail.com	$2a$10$p8f/8bjuD22/f/fJZcPef.8JwGzJmf/5NXVaO9iyik8toNCbKNZ5.	f
41	Romeo	romeocaparasiii@gmail.com	$2a$10$Y5eyu/vwc4fJtb5HZ/pcmexPlI6gasMiS0C.wD0oRi85E.AIF4DvG	t
58	Sher	shefrancia@gmail.com	$2a$10$FGiApAq0bQnLlYowIeyTn.nFNrHali7QwGK3.Ug56cO6zCHcSTc7a	t
59	Dens	dens1515@gmail.com	$2a$10$u5X7EkP4tAi7wr4TI9rFaORDNN0rSTSrL1clg3bEGyv7maek20VeG	t
24	Meya	mireyagenandres@gmail.com	$2a$10$SK32/NgII0gq4DjBbon/rOt2LYkr83hMoATYiSw/PpZ.rTcNsYDcG	t
17	Gwapo	rrlqzdpnd-up@yahoo.com	$2a$10$TWqazr/zKbgnWnpRWixIwOEru8raGQLQowElvCIylTs3bXunbaYs6	t
16	Anj	akr.pelagio@yahoo.com.ph	$2a$10$hTCS/GFKTvnmW1deOZanseCJx09ce63YU.n8Ax5KsAGKz4DlUeGtu	t
3	Neil	nmcalabroso@outlook.com	$2a$10$GHpjAcVux5EQhbhE90yBd.LX//CoxhTRL8tQYejyk7aoG9XqECac6	t
19	Bong	RomelioTavas@gmail.com	$2a$10$BaNiDW.25h/B9VworJqrLuqIUU80Aq2oGO8UqFJIZ.vByaMf5F2HK	t
66	Maria	mariaaprilrose@gmail.com	$2a$10$8HWDnzSplcN0F/ahpyY9XuGwzhZHCRXGIVkcQIIq.l2ofVHIMsnd2	f
67	Edward	edward.nataniel@yahoo.com	$2a$10$7st0A0YUXlhwsPtkEzT1ZOFrNylbMzEfJC/t5MfxhLpav3.xYm7xu	f
68	Earl	earle.bunao@gmail.com	$2a$10$f4WW4ZqclwvPtQZlLMG7Pue7PuNOK0k3h3l9NKMOUCCZbRWS4Nwha	f
70	Tricia	esguerra.tricia@gmail.com	$2a$10$u7YOdhF4QMHl0v2x3SBh9O3ISNC3xhtz7UBh98vnyzR25f302.Fay	f
71	Des	desireecflores@gmail.com	$2a$10$zL/0OLwrpdORi6HCYULqv.IY.VYnOemOcNkWeB1n5.eKIrSYWieCS	f
72	Jay	rodolfo_kirong09@yahoo.com	$2a$10$vi4ZzPNuLZf/3a2tI6P20.AnqkA3F9ekw24KMN2f864ZRE/Z92nga	f
74	Joshua	gj.nidea@gmail.com	$2a$10$2Lxzp7CiZM.Cz8ZGoYMQxOC20oxT/vG872cmMnqV74uO9GfvvFXvC	f
77	Erwin	extremetrainer@yahoo.com	$2a$10$qhWsBuHXVTxFdCqNqxXdLenDjmYYrWoYHRPxSAcYcpQLVV95JeDly	f
78	Caryssa	mc_sobrepena@yahoo.com	$2a$10$yOl3uij20tKzSlVY4WRq/uN4gozLIsbJT8P1znwWu87FDgwmsH.ZK	f
79	Rowel	rowel_26@yahoo.com	$2a$10$3jDAOmns6hGBxSlH0AJMMux0Fvan1dzBbVry2uKQLUBRKpFiKuAG2	f
81	JJ	jonathan_yacapin2001@yahoo.com	$2a$10$A6KDJw3VCV2xsDXCSAV30e0ZI970U7CT/ggNa7sf1M.YlGHPmS/ey	f
83	Joya	jmavelino@up.edu.ph	$2a$10$mEW4ZhU4gGHilsQHzehrxuat3uSqKd.Uzhv802n5PBNoLzi.hKHL.	f
84	Gerald Roy	justarrogance@gmail.com	$2a$10$gxgXFAkrZ5u/keUvZwbey.eiaHJ7LsWaQBoZQcOKmDlFYaipweszq	f
87	Jogre	DarkFireLight94@gmail.com	$2a$10$mlOofN/nkjR46shLGcQ/.etWlNEE4uLz.t.Kp/pHqv9aA/EnSvgMy	f
88	Ara	araleann93@gmail.com	$2a$10$QXf6FiBB27PeCf/D7SKtve/Xx/zk8h/ITeW5dtd4bD99OvK1.AqbW	f
89	Dale	dalelim_94@yahoo.com	$2a$10$k.e59aFPCMK3Bhqg/IbkMegJCoHQB5GXfUCgaL4bLJPJa1DZba9r6	f
90	Kix	frankz0509@gmail.com	$2a$10$hkM57zzi5V6nphHflXjUeerV1stHLL6/7gwmY579VQuArsRNuEnW.	f
91	Francis	mfoperez@gmail.com	$2a$10$O8Ws.zHvULrsVADeZ75W7Ov13AX.miD2sPGy6u/dH4gX9B6XJWTJS	f
92	Topher	christophersarian@yahoo.com	$2a$10$s5XX/YjldF32BhKeeUwF.uSGYo.FFBLIDS7kqmlUgDIKSzcrDnfxm	f
93	Vel	carlo2016@yahoo.com	$2a$10$SHRce8zjd.N2B4AMFL9cnuWJdA8SGTzpVPVVPx1JtTuCj8Vb7zfei	f
97	Andie	rabinoandie@gmail.com	$2a$10$hULjIGy26PbBKC./t7vyUuP33gw4KK/Dl/Y4yVDHeWt5GaF2.c9zi	f
98	Neil	neilrgsantiago@gmail.com	$2a$10$j93b4yL/eRczIJW2lEaCcOf6t90BdC0OW3O2.eewTQ9A4Di5v5Kzi	f
99	Issa	ibtingzon@yahoo.com.ph	$2a$10$CYHrtdLoYEkZWbQav8K8lutSVTQg2C2QVWDMaTnYuNWQkM0HgXyFK	f
100	Jomar	jomarvillano@yahoo.com	$2a$10$9MbIKgrT2w4LBdbKS/aQi.24Tlq6e4Zlp5NivmhoI0/el8ClHNCna	f
101	Rachel	rachel_arcilla@yahoo.com	$2a$10$xyyAJX06a7.cYdJ72HuVCumn4O8hR9Gbf19cOAoonBmieS9WPKrJa	f
102	Amil	camilleangelica@gmail.com	$2a$10$sYiRNCHu/Om2SkAlAM9CC.m3jESP0LnBZbc.GLKlfRxwyayqn8Ogm	f
103	Albert	albert.atadero0607@yahoo.com	$2a$10$G7nfx/k5CU3FRX6zQtEo/O9q/FnO6aKgkv4ok1lmeg4Fm0L7URMNe	f
104	Jasper	jasper.cacbay@gmail.com	$2a$10$bDUW5aNlD2nweXOVj8Pf0.08kfgBKdmfeEl9SQ9eMY28kTry5u1Jy	f
105	Adelen	festinadelen@gmail.com	$2a$10$jzSlfiCmFdOTIkyk6kQwEOYczFg7e/6raJ0rpQGujwK3ttOcv7IXW	f
107	Charmaine	malubagcharmaine@gmail.com	$2a$10$ocjSF1amFoaMujtMFL.2.OK95mAc82RDEjjaxXvJfGW.QsfD1rCcG	f
108	Lara	lara.pacumio@gmail.com	$2a$10$XmnJ5jZHf2BKcVtPGt66T.mf3fAS5oNRMqO2vDsPgUpZOvR9VqttC	f
109	Neah	neahgs@gmail.com	$2a$10$C3hSl85QF.U38hZQggJYVOfWUOVgvbgKOSf80LG.WEkhi8.zCdKJu	f
110	Angelu	angelukayetiu@gmail.com	$2a$10$TufgLLRj2h7DZ9T7mEEp.u1aRH3WMGaQbGFvV6eNqioA4Fiby.Kai	f
113	Cha	chabroncano@gmail.com	$2a$10$wIYpf1bfVnrTyBBGRmbPsuSP0yAVvGoPLuyQ8x4h2uhXgs7B.vNh2	f
115	Chenny	mclchen26@gmail.com	$2a$10$jdfxAGnv05MfYwso6yFQ1O3MVtVWCQl7dS3VKEabGYf9Xjctsdz8q	f
116	Chynna	annyhc821@yahoo.com	$2a$10$2KWkfIJ/pgQ3ERgLL4tC3OSPz328t7ktRo1lI/WbCKo94kj5AaI8O	f
117	Celina	celinahebron@gmail.com	$2a$10$bN8D627J3NJb95Py.Ezlrex5jDkk1toTHrL8vgkzMD4aefBc2jh2C	f
118	Ren	j.magalona12@gmail.com	$2a$10$uRsccF2ae1I5DWY66JmInu9DpWFYSx9TIMx.V5lXElUBO7wtVVdAi	f
119	Aaron	aaronpomanaloto@gmail.com	$2a$10$gG95k8/46n54nDzU3x3CMuQjqt3I41jdXVW9UB6HPEP216v8UsTt2	f
114	Acezon	acezoncay@gmail.com	$2a$10$0bGLDOABQD2vSCOs0FJ69OWRX9IzJu8mNMmVUkWhPMpt.Ua5kyV9e	t
112	Kon	corina.belenzo@gmail.com	$2a$10$F0XPj8lx..usno0cVg8OIumXniobDNAIV610h7/L5YSs3s0vja5A6	t
111	Ting	chrisbalili99@gmail.com	$2a$10$QfIbBwDTrwgNevmuAhFAaOswZhV0PNBkQGEMSqOd2bJrf3o1WsM7O	t
69	Carm	carm.corpuz@gmail.com	$2a$10$yZRrmGMj9PvS7bLmRG9tMuFYs97eYcOQOe5sgclj94wnO9QlFH.Hi	t
12	Daniele	danielejuan049@gmail.com	$2a$10$/eEtwahvA69o6l0z6W3UQ.8CAgMoFRtgT9nJDQI69vpDIHoE4YciK	t
85	Derp	dexter_edep@yahoo.com	$2a$10$.ucwfGZm9H9BFRltMrm8MO3hKKM1gyzlb.pOPM3x7XAZGBWisRJ5i	t
75	Nina	kamilla.quiazon@gmail.com	$2a$10$tlDgWuKGTY4g1oi2sCk4wuc.z2gP/2gE9Hfg.FEDu5U7d46ArcVmu	t
96	Toff	kristoffer_mlmendoza@yahoo.com	$2a$10$ZOdi3IWiPN0yvFSAbVAH4ePyMwdQm8dJjAENSZ.nyFiG8Yg6oWf86	t
106	Ryan	ryanpaul.gozum@gmail.com	$2a$10$gbzah2CG6IFcysW7dikb0uuktPPWnWsd9WXx1p5knLX503r3MXvkK	t
95	Arah	ajamandra@gmail.com	$2a$10$IQQ5p6/KsECaqGqAgfcy1O/UZF0S3MRWm6uT85odJwxzEjCN13tXu	t
65	Matthew	jm_07villaflores@yahoo.com	$2a$10$KBKbVF.xrVodDoRlM8oJXe7evd5RZv0C1.MZKzr4RHhGkVTxc/aDi	t
82	Stephen	lorillstephenyu@gmail.com	$2a$10$38GzoEIhl7jcSz6e50x71.b4.FvoKz8r6vr9nXomvlm.TXJkuOHxO	t
76	David	davidrelao@gmail.com	$2a$10$xyWiVUYcnaFTqEhbg.1j.u3sJGZPZsc.VErEJJkgkDkq6a.n3g1h.	t
86	Pat	gan.pat_trick@yahoo.com	$2a$10$v8/QDnvLU94g.BwJNdnUkOADGwAVqeKCnUmdkc7vgRKzF84IDgNBu	t
80	Herbie	herbie.villafranca@gmail.com	$2a$10$uKFhXSnD5Rukdfwd5L.Z1.v5/qE7AD.wyTSXSDd80z/DoMMywoWXq	t
73	Nathan	nathaniel_250@yahoo.com	$2a$10$s0QemH0SwmJCmXCnZcFM9e9n.kRhIXcFdNzNfdCh0Dn/WSYIoHMTW	t
94	Aly	alyssadarielle@gmail.com	$2a$10$OQneT2SMicdMJaOYvG8qTu1mSEoyRgKS4ImbLB8D5dR2XfU87wnOW	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acezoncay
--

SELECT pg_catalog.setval('users_id_seq', 119, true);


--
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: acezoncay; Tablespace: 
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: nominations_pkey; Type: CONSTRAINT; Schema: public; Owner: acezoncay; Tablespace: 
--

ALTER TABLE ONLY nominations
    ADD CONSTRAINT nominations_pkey PRIMARY KEY (id);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: acezoncay; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: acezoncay; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: acezoncay; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: migrations_name_index; Type: INDEX; Schema: public; Owner: acezoncay; Tablespace: 
--

CREATE INDEX migrations_name_index ON migrations USING btree (name);


--
-- Name: nominations_positionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY nominations
    ADD CONSTRAINT nominations_positionid_fkey FOREIGN KEY (positionid) REFERENCES positions(id);


--
-- Name: nominations_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: acezoncay
--

ALTER TABLE ONLY nominations
    ADD CONSTRAINT nominations_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: acezoncay
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM acezoncay;
GRANT ALL ON SCHEMA public TO acezoncay;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

