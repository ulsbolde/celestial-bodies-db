--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(10,2),
    description text,
    galaxy_type character varying(40)
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
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(40) NOT NULL,
    supercluster character varying(40)
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_galaxy_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_galaxy_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth integer,
    star_id integer,
    planet_type character varying(40)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(10,2) NOT NULL,
    distance_from_earth integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_galaxy_group_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 13.61, 'A vast spiral-shaped structure, home to our solar system.', 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10.01, 'A massive spiral galaxy located approximately 2.537 million light-years away from Earth, and it is the closest spiral galaxy to our Milky Way.', 'Barred Spiral');
INSERT INTO public.galaxy VALUES (3, 'Messier 82 Galaxy', 13.30, 'Messier 82, also known as the Cigar Galaxy, is a remarkable starburst galaxy located about 12 million light-years away, characterized by intense bursts of star formation and dramatic plumes of gas and dust.', 'Starburst');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1.10, 'A vibrant and irregular dwarf galaxy located about 160,000 light-years away from Earth, adorned with an array of stunning nebulae, star clusters, and stellar nurseries.', 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Virgo A Galaxy', 12.80, 'Virgo A, also known as Messier 87, is a massive elliptical galaxy situated in the Virgo Cluster, notable for its supermassive black hole at the center and its production of powerful jets that extend far into intergalactic space.', 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Maffei I Galaxy', 10.00, 'An enigmatic, obscured galaxy located approximately 10 million light-years away.', 'Elliptical');


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', NULL);
INSERT INTO public.galaxy_group VALUES (2, 'Virgo Cluster', NULL);
INSERT INTO public.galaxy_group VALUES (3, 'Bullet Group', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Io', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Titan', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Janus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Helene', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Hyprion', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Phoebe', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Atlas', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Pandora', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Prometheus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Dione', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Iapetus', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (20, 'Telesto', NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri', NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.planet VALUES (10, 'Rigel I', NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (11, 'Rigel II', NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Rigel III', NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (13, 'Rigel IV', NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (14, 'Rigel V', NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (15, 'Rigel VI', NULL, NULL, NULL, NULL, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 0.23, NULL, 1);
INSERT INTO public.star VALUES (2, 'The Sun', 4.60, NULL, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 0.07, NULL, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 5.40, NULL, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 0.01, NULL, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 0.01, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_galaxy_group_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_group galaxy_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
