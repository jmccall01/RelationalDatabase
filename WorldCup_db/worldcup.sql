--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(25) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 993, 994, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 995, 996, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 994, 996, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 993, 995, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 994, 1002, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 996, 1004, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 995, 1006, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 993, 1008, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 996, 1010, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 1004, 1012, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 995, 1014, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 1006, 1016, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 994, 1018, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 1002, 1020, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 1008, 1022, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 993, 1024, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 1025, 1024, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 1027, 1006, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 1024, 1027, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 1025, 1006, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 1027, 1034, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 1024, 995, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 1006, 1010, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 1025, 993, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 1006, 1042, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 1010, 1008, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 993, 1046, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 1025, 1048, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 1027, 1016, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 1034, 1052, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 1024, 1012, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 995, 1056, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (993, 'France');
INSERT INTO public.teams VALUES (994, 'Croatia');
INSERT INTO public.teams VALUES (995, 'Belgium');
INSERT INTO public.teams VALUES (996, 'England');
INSERT INTO public.teams VALUES (1002, 'Russia');
INSERT INTO public.teams VALUES (1004, 'Sweden');
INSERT INTO public.teams VALUES (1006, 'Brazil');
INSERT INTO public.teams VALUES (1008, 'Uruguay');
INSERT INTO public.teams VALUES (1010, 'Colombia');
INSERT INTO public.teams VALUES (1012, 'Switzerland');
INSERT INTO public.teams VALUES (1014, 'Japan');
INSERT INTO public.teams VALUES (1016, 'Mexico');
INSERT INTO public.teams VALUES (1018, 'Denmark');
INSERT INTO public.teams VALUES (1020, 'Spain');
INSERT INTO public.teams VALUES (1022, 'Portugal');
INSERT INTO public.teams VALUES (1024, 'Argentina');
INSERT INTO public.teams VALUES (1025, 'Germany');
INSERT INTO public.teams VALUES (1027, 'Netherlands');
INSERT INTO public.teams VALUES (1034, 'Costa Rica');
INSERT INTO public.teams VALUES (1042, 'Chile');
INSERT INTO public.teams VALUES (1046, 'Nigeria');
INSERT INTO public.teams VALUES (1048, 'Algeria');
INSERT INTO public.teams VALUES (1052, 'Greece');
INSERT INTO public.teams VALUES (1056, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1056, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_game_opp; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_game_opp FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_game_win; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_game_win FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

