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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    num_of_stars integer NOT NULL,
    discovery_year integer,
    type text,
    is_active boolean NOT NULL,
    is_visible boolean,
    distance_light_year numeric
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
    mass numeric,
    has_atmosphere boolean NOT NULL,
    is_colonizable boolean,
    composition text NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    mass numeric,
    radius numeric NOT NULL,
    has_rings boolean NOT NULL,
    is_habitable boolean,
    distance_star numeric,
    discovery_year integer,
    star_id integer NOT NULL
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    capacity integer NOT NULL,
    location text,
    operational_years numeric,
    is_operational boolean NOT NULL,
    has_habitat boolean NOT NULL
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    type text,
    mass numeric,
    is_binary_system boolean NOT NULL,
    is_visible boolean,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, 1610, 'Spiral', true, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 1612, 'Spiral', true, true, 2530000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 400000000, 1615, 'Spiral', true, true, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 30000000, 1773, 'Spiral', true, true, 29000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100000000, 1765, 'Spiral', true, true, 28000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 200000000, 1781, 'Elliptical', true, true, 55000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (48, 0.073, true, true, 'Rocky', 'Moon A', 1);
INSERT INTO public.moon VALUES (49, 0.062, false, false, 'Icy', 'Moon B', 1);
INSERT INTO public.moon VALUES (50, 0.005, false, false, 'Rocky', 'Moon C', 2);
INSERT INTO public.moon VALUES (51, 0.003, false, true, 'Gas', 'Moon D', 2);
INSERT INTO public.moon VALUES (52, 0.012, true, true, 'Rocky', 'Moon E', 3);
INSERT INTO public.moon VALUES (53, 0.035, true, true, 'Icy', 'Moon F', 3);
INSERT INTO public.moon VALUES (54, 0.042, true, false, 'Rocky', 'Moon G', 4);
INSERT INTO public.moon VALUES (55, 0.038, false, true, 'Icy', 'Moon H', 4);
INSERT INTO public.moon VALUES (56, 0.020, true, false, 'Rocky', 'Moon I', 5);
INSERT INTO public.moon VALUES (57, 0.017, false, true, 'Icy', 'Moon J', 5);
INSERT INTO public.moon VALUES (58, 0.004, true, false, 'Rocky', 'Moon K', 6);
INSERT INTO public.moon VALUES (59, 0.009, true, true, 'Gas', 'Moon L', 6);
INSERT INTO public.moon VALUES (60, 0.015, false, false, 'Rocky', 'Moon M', 7);
INSERT INTO public.moon VALUES (61, 0.011, true, true, 'Rocky', 'Moon N', 7);
INSERT INTO public.moon VALUES (62, 0.050, false, true, 'Icy', 'Moon O', 8);
INSERT INTO public.moon VALUES (63, 0.025, true, true, 'Gas', 'Moon P', 8);
INSERT INTO public.moon VALUES (64, 0.003, false, false, 'Rocky', 'Moon Q', 9);
INSERT INTO public.moon VALUES (65, 0.019, true, true, 'Icy', 'Moon R', 9);
INSERT INTO public.moon VALUES (66, 0.027, false, false, 'Gas', 'Moon S', 10);
INSERT INTO public.moon VALUES (67, 0.002, true, true, 'Rocky', 'Moon T', 10);
INSERT INTO public.moon VALUES (68, 0.045, true, false, 'Icy', 'Moon U', 11);
INSERT INTO public.moon VALUES (69, 0.030, false, true, 'Gas', 'Moon V', 11);
INSERT INTO public.moon VALUES (70, 0.007, true, true, 'Rocky', 'Moon W', 12);
INSERT INTO public.moon VALUES (71, 0.016, false, false, 'Icy', 'Moon X', 12);
INSERT INTO public.moon VALUES (72, 0.018, true, true, 'Rocky', 'Moon Y', 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 0.382, false, false, 0.39, 1609, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 0.949, false, false, 0.72, 1610, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.0, 1.0, false, true, 1.0, 1610, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 0.532, false, true, 1.52, 1610, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 318.0, 11.21, true, false, 5.2, 1610, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.0, 9.45, true, false, 9.58, 1611, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.5, 4.01, true, false, 19.18, 1611, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.1, 3.88, true, false, 30.07, 1612, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.002, 0.186, false, false, 39.48, 1800, 1);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri b', 1.13, 1.22, false, true, 4.37, 2023, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 2.4, 2.38, false, true, 620.0, 2011, 2);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 3.1, 1.5, false, true, 20.3, 2007, 3);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 0.69, 1.4, true, false, 150.0, 1999, 4);
INSERT INTO public.planet VALUES (14, 'Kepler-452b', 1.6, 1.24, false, true, 1400.0, 2015, 2);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1d', 0.41, 1.04, false, true, 40.0, 2016, 5);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', 10, 'Low Earth Orbit', 20, true, true);
INSERT INTO public.space_station VALUES (2, 'Lunar Gateway', 4, 'Lunar Orbit', 5, true, true);
INSERT INTO public.space_station VALUES (3, 'Mars Base Alpha', 12, 'Mars Orbit', 3, true, true);
INSERT INTO public.space_station VALUES (4, 'Artemis Station', 6, 'Moon Orbit', 7, true, true);
INSERT INTO public.space_station VALUES (5, 'Orbital Research Lab', 8, 'Low Earth Orbit', 15, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600000, 'Main Sequence', 1.0, false, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 200000, 'Main Sequence', 2.02, false, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5000000, 'Main Sequence', 1.1, true, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 800000, 'Red Giant', 20.0, false, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4000000, 'Red Dwarf', 0.12, false, true, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 800000, 'Supergiant', 21.0, false, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 72, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: space_station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_station_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: galaxy uk_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uk_galaxy UNIQUE (name);


--
-- Name: moon uk_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uk_moon UNIQUE (name);


--
-- Name: planet uk_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uk_planet UNIQUE (name);


--
-- Name: space_station uk_space_station; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT uk_space_station UNIQUE (name);


--
-- Name: star uk_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uk_star UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

