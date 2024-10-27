--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter numeric NOT NULL,
    quality numeric NOT NULL,
    subordinate character varying(100) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars numeric,
    type text,
    diameter_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gravity numeric,
    diameter integer,
    quality numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gravity numeric,
    diameter integer,
    is_earth_like boolean,
    satellite boolean,
    star_id integer,
    quality numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.moon.moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet integer,
    life numeric,
    quality numeric,
    distance numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 910000000000000000000, 'Dwarf Planet');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 259000000000000000000, 'Asteroid Belt');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 211000000000000000000, 'Asteroid Belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk way', 400000000000, 'Barred spiral galaxy', 100000);
INSERT INTO public.galaxy VALUES (2, 'Trianulum', 40000000000, 'spiral galaxy', 60000);
INSERT INTO public.galaxy VALUES (3, 'Andremeda', 1000000000000, 'spiral galaxy', 220000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 100000000000, 'spiral galaxy', 76000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 80000000000, 'Lenticular galaxy', 49000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 10000000000, 'irregular galaxy', 14000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1.62, 3475, 73420000000000000000000, 3);
INSERT INTO public.moon VALUES (2, 'Mars Moon - Phobos', 0.0057, 22, 10659000000000000, 4);
INSERT INTO public.moon VALUES (3, 'Mars Moon - Deimos', 0.0032, 13, 1476200000000000, 4);
INSERT INTO public.moon VALUES (4, 'Jupiter Moon - Io', 1.796, 3643, 89319000000000000000000, 5);
INSERT INTO public.moon VALUES (5, 'Jupiter Moon - Europa', 1.314, 3122, 47998000000000000000000, 5);
INSERT INTO public.moon VALUES (6, 'Jupiter Moon - Ganymede', 0.486, 2634, 148190000000000000000000, 5);
INSERT INTO public.moon VALUES (7, 'Jupiter Moon - Callisto', 0.126, 4821, 107590000000000000000000, 5);
INSERT INTO public.moon VALUES (8, 'Jupiter Moon - Amalthea', 0.0018, 250, 4200000000000000000, 5);
INSERT INTO public.moon VALUES (9, 'Jupiter Moon - Thebe', 0.0021, 100, 179000000000000000, 5);
INSERT INTO public.moon VALUES (10, 'Saturn Moon - Titan', 1.352, 5151, 134520000000000000000000, 6);
INSERT INTO public.moon VALUES (11, 'Saturn Moon - Rhea', 0.287, 1528, 2307000000000000000000, 6);
INSERT INTO public.moon VALUES (12, 'Saturn Moon - Dione', 0.248, 1124, 1095300000000000000000, 6);
INSERT INTO public.moon VALUES (13, 'Saturn Moon - Tethys', 0.147, 1062, 617400000000000000000, 6);
INSERT INTO public.moon VALUES (14, 'Saturn Moon - Enceladus', 0.113, 504, 108022000000000000000, 6);
INSERT INTO public.moon VALUES (15, 'Uranus Moon - Miranda', 0.051, 1570, 65900000000000000000, 7);
INSERT INTO public.moon VALUES (16, 'Uranus Moon - Ariel', 0.037, 1070, 134000000000000000000, 7);
INSERT INTO public.moon VALUES (17, 'Uranus Moon - Umbriel', 0.043, 871, 117000000000000000000, 7);
INSERT INTO public.moon VALUES (18, 'Neptune Moon - Triton', 0.778, 2707, 21400000000000000000000, 8);
INSERT INTO public.moon VALUES (19, 'Neptune Moon - Nereid', 0.014, 31, 3200000000000000, 8);
INSERT INTO public.moon VALUES (20, 'Pluto Moon - Charon', 0.064, 1219, 1586000000000000000000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.7, 4880, true, false, 1, 330000000000000000000000);
INSERT INTO public.planet VALUES (2, 'Venus', 8.87, 12104, true, false, 1, 4870000000000000000000000);
INSERT INTO public.planet VALUES (3, 'Earth', 9.81, 12742, true, true, 1, 5970000000000000000000000);
INSERT INTO public.planet VALUES (4, 'Mars', 3.71, 6779, true, true, 1, 692000000000000000000000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 24.79, 139820, false, true, 1, 1900000000000000000000000000);
INSERT INTO public.planet VALUES (6, 'Saturn', 10.44, 116460, false, true, 1, 568000000000000000000000000);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.69, 50724, false, true, 1, 86800000000000000000000000);
INSERT INTO public.planet VALUES (8, 'Neptune', 11.15, 49244, false, true, 1, 102000000000000000000000000);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.62, 2377, true, true, 1, 13100000000000000000000);
INSERT INTO public.planet VALUES (10, 'Ceres', 0.27, 946, true, false, 1, 939000000000000000000);
INSERT INTO public.planet VALUES (11, 'Makemake', 0.05, 450, true, false, 1, 210000000000000000000);
INSERT INTO public.planet VALUES (12, 'Eris', 0.82, 2326, true, true, 1, 16600000000000000000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 8, 4600000000, 1990000000000000000000000000000, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 4700000000, 243000000000000000000000000000, 4.24, 1);
INSERT INTO public.star VALUES (3, 'Barnard', 1, 10000000000, 287000000000000000000000000000, 5.96, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 0, 300000000, 4100000000000000000000000000000, 8.6, 1);
INSERT INTO public.star VALUES (5, 'Alpha CentauriA', 1, 5000000000, 2190000000000000000000000000000, 4.37, 1);
INSERT INTO public.star VALUES (6, 'Vega', 0, 600000000, 4180000000000000000000000000000, 25, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

