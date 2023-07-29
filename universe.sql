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
    name character varying(255) NOT NULL,
    isreachable boolean DEFAULT true,
    createdat timestamp without time zone DEFAULT now(),
    discoveredat timestamp without time zone DEFAULT now(),
    lastupdatedate timestamp without time zone DEFAULT now()
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    lastupdatedate timestamp without time zone DEFAULT now(),
    discovereddate timestamp without time zone DEFAULT now(),
    columncreatedat timestamp without time zone DEFAULT now()
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
    name character varying(255) NOT NULL,
    positionx integer NOT NULL,
    positiony integer NOT NULL,
    description text,
    isgazplanet boolean DEFAULT false,
    star_id integer
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
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceship_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceship_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceship_spaceship_id_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    positionx integer NOT NULL,
    positiony integer NOT NULL,
    volume numeric(3,1) NOT NULL,
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
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceship_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (2, 'andromeda', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (3, 'messier 81', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (4, 'messier 82', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (5, 'triangulum', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (6, 'centaurus a', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');
INSERT INTO public.galaxy VALUES (7, 'messier 87', true, '2023-07-29 13:06:14.021938', '2023-07-29 13:06:31.466616', '2023-07-29 13:06:47.513884');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (2, 'phobos', 3, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (3, 'deimos', 4, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (4, 'io', 5, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (5, 'europa', 5, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (6, 'ganimede', 5, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (7, 'callisto', 5, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (8, 'titan', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (9, 'enceladus', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (10, 'mimas', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (11, 'tethys', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (12, 'dione', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (13, 'rhea', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (14, 'iapethus', 6, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (15, 'miranda', 7, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (16, 'ariel', 7, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (17, 'umbriel', 7, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (18, 'titania', 7, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (19, 'oberon', 7, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (20, 'triton', 8, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (21, 'charon', 9, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (22, 'hydra', 9, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (23, 'nix', 9, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (24, 'styx', 9, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (25, 'kerberos', 9, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (26, 'dysnomia', 10, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (27, 'hi iaka', 11, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (28, 'namala', 11, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');
INSERT INTO public.moon VALUES (29, 'mk2', 12, '2023-07-29 13:07:11.96497', '2023-07-29 13:07:21.567472', '2023-07-29 13:07:35.306168');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 0, 0, 'smallest one', false, 1);
INSERT INTO public.planet VALUES (2, 'venus', 0, 0, 'second planet', false, 1);
INSERT INTO public.planet VALUES (3, 'earth', 0, 0, 'thrid planet', false, 1);
INSERT INTO public.planet VALUES (4, 'mars', 0, 0, '4th planet', false, 1);
INSERT INTO public.planet VALUES (5, 'jupiter', 0, 0, '5th planet', false, 1);
INSERT INTO public.planet VALUES (6, 'saturn', 0, 0, '6th planet', false, 1);
INSERT INTO public.planet VALUES (7, 'uranus', 0, 0, '7th planet', false, 1);
INSERT INTO public.planet VALUES (8, 'neptune', 0, 0, '8th planet', false, 1);
INSERT INTO public.planet VALUES (9, 'pluto', 0, 0, '9th planet', false, 1);
INSERT INTO public.planet VALUES (10, 'ceres', 0, 0, 'largest meteorite', false, 1);
INSERT INTO public.planet VALUES (11, 'eris', 0, 0, 'dwarf planet', false, 1);
INSERT INTO public.planet VALUES (12, 'haumea', 0, 0, 'dwarf planet', false, 1);
INSERT INTO public.planet VALUES (13, 'makemake', 0, 0, 'dwarf planet', false, 1);
INSERT INTO public.planet VALUES (14, 'eres 2', 0, 0, 'dwarf planet 2', false, 1);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'millenium falcon', '2023-07-29 12:56:54.085035');
INSERT INTO public.spaceship VALUES (2, 'x wing', '2023-07-29 12:57:25.078943');
INSERT INTO public.spaceship VALUES (3, 'the fighter', '2023-07-29 12:57:35.029209');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 0, 0, 1.0, 1);
INSERT INTO public.star VALUES (2, 'alpha centauri', 0, 0, 0.1, 1);
INSERT INTO public.star VALUES (3, 'barnar', 0, 0, 0.1, 1);
INSERT INTO public.star VALUES (4, 'wolf', 0, 0, 0.1, 1);
INSERT INTO public.star VALUES (5, 'lalande', 0, 0, 0.1, 1);
INSERT INTO public.star VALUES (6, 'sirus', 0, 0, 0.1, 1);
INSERT INTO public.star VALUES (7, 'luyten', 0, 0, 0.1, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_spaceship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


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

