--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: abarca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abarca (
    id_abarca integer NOT NULL,
    id_dependencia integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.abarca OWNER TO postgres;

--
-- Name: aptitud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aptitud (
    id_aptitud integer NOT NULL,
    tipo character varying NOT NULL,
    nivel integer,
    id_usuario integer NOT NULL
);


ALTER TABLE public.aptitud OWNER TO postgres;

--
-- Name: aptitud_id_aptitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aptitud_id_aptitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aptitud_id_aptitud_seq OWNER TO postgres;

--
-- Name: aptitud_id_aptitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aptitud_id_aptitud_seq OWNED BY public.aptitud.id_aptitud;


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id_carrera integer NOT NULL,
    nombre character varying NOT NULL,
    anios integer,
    cant_materias integer,
    id_dependencia integer NOT NULL,
    ordenanza character varying
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- Name: carrera_destinada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera_destinada (
    id_convocatoria integer NOT NULL,
    id_carrera integer NOT NULL,
    anios_necesario integer,
    cant_materias_nec integer
);


ALTER TABLE public.carrera_destinada OWNER TO postgres;

--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_carrera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_id_carrera_seq OWNER TO postgres;

--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_carrera_seq OWNED BY public.carrera.id_carrera;


--
-- Name: convocatoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.convocatoria (
    id_convocatoria integer NOT NULL,
    titulo character varying NOT NULL,
    descripcion character varying,
    direccion character varying NOT NULL,
    fecha_alta timestamp without time zone NOT NULL,
    fecha_desde timestamp without time zone NOT NULL,
    fecha_hasta timestamp without time zone NOT NULL,
    cant_postulantes integer,
    activo boolean,
    id_tipo integer,
    id_sede_pedido integer,
    id_institucion integer NOT NULL,
    requisitos character varying
);


ALTER TABLE public.convocatoria OWNER TO postgres;

--
-- Name: convocatoria_id_convocatoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.convocatoria_id_convocatoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.convocatoria_id_convocatoria_seq OWNER TO postgres;

--
-- Name: convocatoria_id_convocatoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.convocatoria_id_convocatoria_seq OWNED BY public.convocatoria.id_convocatoria;


--
-- Name: dependencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependencia (
    id_dependencia integer NOT NULL,
    nombre character varying NOT NULL,
    sigla character varying NOT NULL
);


ALTER TABLE public.dependencia OWNER TO postgres;

--
-- Name: dependencia_id_dependencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dependencia_id_dependencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependencia_id_dependencia_seq OWNER TO postgres;

--
-- Name: dependencia_id_dependencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dependencia_id_dependencia_seq OWNED BY public.dependencia.id_dependencia;


--
-- Name: estado_postulante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_postulante (
    id_estado integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.estado_postulante OWNER TO postgres;

--
-- Name: estado_postulante_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_postulante_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_postulante_id_estado_seq OWNER TO postgres;

--
-- Name: estado_postulante_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_postulante_id_estado_seq OWNED BY public.estado_postulante.id_estado;


--
-- Name: estudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudio (
    id_estudio integer NOT NULL,
    id_institucion integer NOT NULL,
    fecha_egreso timestamp without time zone,
    id_tipo integer,
    titulo character varying NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.estudio OWNER TO postgres;

--
-- Name: estudio_id_estudio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudio_id_estudio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudio_id_estudio_seq OWNER TO postgres;

--
-- Name: estudio_id_estudio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudio_id_estudio_seq OWNED BY public.estudio.id_estudio;


--
-- Name: experiencia_laboral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiencia_laboral (
    id_experiencia integer NOT NULL,
    id_usuario integer NOT NULL,
    titulo character varying NOT NULL,
    descripcion character varying
);


ALTER TABLE public.experiencia_laboral OWNER TO postgres;

--
-- Name: experiencia_laboral_id_experiencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiencia_laboral_id_experiencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.experiencia_laboral_id_experiencia_seq OWNER TO postgres;

--
-- Name: experiencia_laboral_id_experiencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiencia_laboral_id_experiencia_seq OWNED BY public.experiencia_laboral.id_experiencia;


--
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    id_institucion integer NOT NULL,
    nombre character varying NOT NULL,
    email character varying NOT NULL,
    telefono character varying NOT NULL,
    direccion character varying
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- Name: institucion_id_institucion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institucion_id_institucion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institucion_id_institucion_seq OWNER TO postgres;

--
-- Name: institucion_id_institucion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institucion_id_institucion_seq OWNED BY public.institucion.id_institucion;


--
-- Name: localidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localidad (
    id_localidad integer NOT NULL,
    nombre character varying NOT NULL,
    sigla character varying,
    cod_postal integer,
    caracteristica integer,
    id_provincia integer NOT NULL
);


ALTER TABLE public.localidad OWNER TO postgres;

--
-- Name: localidad_id_localidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localidad_id_localidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.localidad_id_localidad_seq OWNER TO postgres;

--
-- Name: localidad_id_localidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localidad_id_localidad_seq OWNED BY public.localidad.id_localidad;


--
-- Name: postulante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postulante (
    id_postulante integer NOT NULL,
    id_usuario integer NOT NULL,
    id_convocatoria integer NOT NULL,
    fecha_postulado timestamp without time zone NOT NULL,
    id_estado integer,
    orden_merito integer
);


ALTER TABLE public.postulante OWNER TO postgres;

--
-- Name: postulante_id_postulante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.postulante_id_postulante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.postulante_id_postulante_seq OWNER TO postgres;

--
-- Name: postulante_id_postulante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.postulante_id_postulante_seq OWNED BY public.postulante.id_postulante;


--
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id_provincia integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- Name: provincia_id_provincia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provincia_id_provincia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provincia_id_provincia_seq OWNER TO postgres;

--
-- Name: provincia_id_provincia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provincia_id_provincia_seq OWNED BY public.provincia.id_provincia;


--
-- Name: publicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicacion (
    id_publicacion integer NOT NULL,
    titulo character varying NOT NULL,
    fecha timestamp without time zone,
    id_usuario integer NOT NULL
);


ALTER TABLE public.publicacion OWNER TO postgres;

--
-- Name: publicacion_id_publicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publicacion_id_publicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publicacion_id_publicacion_seq OWNER TO postgres;

--
-- Name: publicacion_id_publicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publicacion_id_publicacion_seq OWNED BY public.publicacion.id_publicacion;


--
-- Name: registro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro (
    id_registro integer NOT NULL,
    usuario character varying NOT NULL,
    clave character varying NOT NULL,
    email character varying,
    fecha_registro timestamp without time zone NOT NULL,
    token character varying,
    recuperar_clave boolean,
    fecha_token timestamp without time zone
);


ALTER TABLE public.registro OWNER TO postgres;

--
-- Name: registro_id_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registro_id_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registro_id_registro_seq OWNER TO postgres;

--
-- Name: registro_id_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registro_id_registro_seq OWNED BY public.registro.id_registro;


--
-- Name: rendimiento_acad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rendimiento_acad (
    id_rendimiento integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_actualizado timestamp without time zone NOT NULL,
    cant_mat_aprobadas integer,
    anio_carrera integer,
    legajo character varying,
    fecha_egreso timestamp without time zone,
    id_carrera integer NOT NULL
);


ALTER TABLE public.rendimiento_acad OWNER TO postgres;

--
-- Name: rendimiento_acad_id_rendimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rendimiento_acad_id_rendimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rendimiento_acad_id_rendimiento_seq OWNER TO postgres;

--
-- Name: rendimiento_acad_id_rendimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rendimiento_acad_id_rendimiento_seq OWNED BY public.rendimiento_acad.id_rendimiento;


--
-- Name: rendimiento_no_acad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rendimiento_no_acad (
    id_rendimiento integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_actualizado timestamp without time zone NOT NULL,
    titulo character varying NOT NULL,
    descripcion character varying,
    observacion character varying,
    id_rol integer,
    horas_semanales integer,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone,
    norma_legal character varying NOT NULL,
    id_tipo integer
);


ALTER TABLE public.rendimiento_no_acad OWNER TO postgres;

--
-- Name: rendimiento_no_acad_id_rendimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rendimiento_no_acad_id_rendimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rendimiento_no_acad_id_rendimiento_seq OWNER TO postgres;

--
-- Name: rendimiento_no_acad_id_rendimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rendimiento_no_acad_id_rendimiento_seq OWNED BY public.rendimiento_no_acad.id_rendimiento;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;


--
-- Name: sede; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sede (
    id_sede integer NOT NULL,
    nombre character varying NOT NULL,
    id_dependencia integer NOT NULL,
    id_localidad integer NOT NULL
);


ALTER TABLE public.sede OWNER TO postgres;

--
-- Name: sede_id_sede_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sede_id_sede_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sede_id_sede_seq OWNER TO postgres;

--
-- Name: sede_id_sede_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sede_id_sede_seq OWNED BY public.sede.id_sede;


--
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id_tipo integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_tipo_seq OWNER TO postgres;

--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_tipo_seq OWNED BY public.tipo.id_tipo;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_registro integer NOT NULL,
    dni character varying NOT NULL,
    telefono character varying,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    activo boolean,
    nacionalidad character varying NOT NULL,
    direccion character varying NOT NULL,
    id_localidad integer NOT NULL,
    fecha_nac timestamp without time zone NOT NULL,
    foto bytea,
    nombre_foto character varying,
    id_rol integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_nombre_foto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_nombre_foto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_nombre_foto_seq OWNER TO postgres;

--
-- Name: usuario_nombre_foto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_nombre_foto_seq OWNED BY public.usuario.nombre_foto;


--
-- Name: aptitud id_aptitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptitud ALTER COLUMN id_aptitud SET DEFAULT nextval('public.aptitud_id_aptitud_seq'::regclass);


--
-- Name: carrera id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id_carrera SET DEFAULT nextval('public.carrera_id_carrera_seq'::regclass);


--
-- Name: convocatoria id_convocatoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatoria ALTER COLUMN id_convocatoria SET DEFAULT nextval('public.convocatoria_id_convocatoria_seq'::regclass);


--
-- Name: dependencia id_dependencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependencia ALTER COLUMN id_dependencia SET DEFAULT nextval('public.dependencia_id_dependencia_seq'::regclass);


--
-- Name: estado_postulante id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_postulante ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_postulante_id_estado_seq'::regclass);


--
-- Name: estudio id_estudio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudio ALTER COLUMN id_estudio SET DEFAULT nextval('public.estudio_id_estudio_seq'::regclass);


--
-- Name: experiencia_laboral id_experiencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiencia_laboral ALTER COLUMN id_experiencia SET DEFAULT nextval('public.experiencia_laboral_id_experiencia_seq'::regclass);


--
-- Name: institucion id_institucion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion ALTER COLUMN id_institucion SET DEFAULT nextval('public.institucion_id_institucion_seq'::regclass);


--
-- Name: localidad id_localidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidad ALTER COLUMN id_localidad SET DEFAULT nextval('public.localidad_id_localidad_seq'::regclass);


--
-- Name: postulante id_postulante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulante ALTER COLUMN id_postulante SET DEFAULT nextval('public.postulante_id_postulante_seq'::regclass);


--
-- Name: provincia id_provincia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia ALTER COLUMN id_provincia SET DEFAULT nextval('public.provincia_id_provincia_seq'::regclass);


--
-- Name: publicacion id_publicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion ALTER COLUMN id_publicacion SET DEFAULT nextval('public.publicacion_id_publicacion_seq'::regclass);


--
-- Name: registro id_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro ALTER COLUMN id_registro SET DEFAULT nextval('public.registro_id_registro_seq'::regclass);


--
-- Name: rendimiento_acad id_rendimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_acad ALTER COLUMN id_rendimiento SET DEFAULT nextval('public.rendimiento_acad_id_rendimiento_seq'::regclass);


--
-- Name: rendimiento_no_acad id_rendimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_no_acad ALTER COLUMN id_rendimiento SET DEFAULT nextval('public.rendimiento_no_acad_id_rendimiento_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- Name: sede id_sede; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede ALTER COLUMN id_sede SET DEFAULT nextval('public.sede_id_sede_seq'::regclass);


--
-- Name: tipo id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipo_id_tipo_seq'::regclass);


--
-- Data for Name: abarca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aptitud; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carrera VALUES (250, 'TÉCNICO UNIVERSITARIO FORESTAL', 3, NULL, 1, '390');
INSERT INTO public.carrera VALUES (251, 'TECNICATURA UNIVERSITARIA EN ESPACIOS VERDES', 3, NULL, 1, '442');
INSERT INTO public.carrera VALUES (252, 'TECNICATURA EN PLANTAS Y ANÁLISIS DE MENAS', 3, NULL, 6, NULL);
INSERT INTO public.carrera VALUES (253, 'TECNICATURA UNIVERSITARIA EN TOPOGRAFÍA', 3, NULL, 6, NULL);
INSERT INTO public.carrera VALUES (254, 'LICENCIATURA EN TECNOLOGÍA MINERA', 5, NULL, 6, '232/91, Mod. 912/01 y 216/09');
INSERT INTO public.carrera VALUES (255, 'TÉCNICO UNIVERSITARIO EN ACUICULTURA', 3, NULL, 7, NULL);
INSERT INTO public.carrera VALUES (256, 'PROFESORADO EN EDUCACIÓN FÍSICA', 4, NULL, 7, NULL);
INSERT INTO public.carrera VALUES (257, 'LICENCIATURA EN CIENCIAS BIOLÓGICAS', 5, NULL, 7, NULL);
INSERT INTO public.carrera VALUES (258, 'PROFESORADO EN CIENCIAS BIOLÓGICAS', 4, NULL, 7, NULL);
INSERT INTO public.carrera VALUES (259, 'DOCTORADO EN BIOLOGíA', 4, NULL, 7, '556/1986');
INSERT INTO public.carrera VALUES (260, 'LICENCIATURA EN HISTORIA', 5, NULL, 7, NULL);
INSERT INTO public.carrera VALUES (261, 'PROFESORADO UNIVERSITARIO EN CIENCIA POLÍTICA', 5, NULL, 8, NULL);
INSERT INTO public.carrera VALUES (262, 'ESPECIALIZACIóN EN FRUTOS SECOS', 1, NULL, 8, '1442/2014');
INSERT INTO public.carrera VALUES (263, 'LICENCIATURA EN GESTIÓN DE RECURSOS HUMANOS', 2, NULL, 8, NULL);
INSERT INTO public.carrera VALUES (264, 'PROFESORADO EN PSICOPEDAGOGIA', 5, NULL, 8, '431/09');
INSERT INTO public.carrera VALUES (265, 'TECNICATURA SUPERIOR EN PRODUCCIÓN AGROPECUARIA', 3, NULL, 8, NULL);
INSERT INTO public.carrera VALUES (266, 'TECNICATURA UNIVERSITARIA EN ADMINISTRACION PUBLICA', 3, NULL, 8, '1521/13');
INSERT INTO public.carrera VALUES (267, 'LICENCIATURA EN ADMINISTRACION PUBLICA', 4, NULL, 8, '814/01');
INSERT INTO public.carrera VALUES (268, 'LICENCIATURA EN CIENCIA POLITICA', 5, NULL, 8, '605/11');
INSERT INTO public.carrera VALUES (269, 'LICENCIATURA EN GESTION DE EMPRESAS AGROPECUARIAS', 5, NULL, 8, '374/11');
INSERT INTO public.carrera VALUES (270, 'PROFESORADO EN CIENCIAS AGROPECUARIAS', 5, NULL, 8, '995/12');
INSERT INTO public.carrera VALUES (271, 'PROFESORADO EN LENGUA Y COMUNICACION ORAL Y ESCRITA', 4, NULL, 8, '962/98');
INSERT INTO public.carrera VALUES (272, 'LICENCIATURA EN PSICOPEDAGOGIA', 5, NULL, 8, '432/09');
INSERT INTO public.carrera VALUES (273, 'LICENCIATURA EN BIOLOGÍA MARINA', 5, NULL, 9, '0062/08');
INSERT INTO public.carrera VALUES (274, 'TECNICATURA EN PRODUCCIÓN PESQUERA Y MARICULTURA', 2, NULL, 9, '298');
INSERT INTO public.carrera VALUES (275, 'LICENCIATURA EN ENFERMERIA', 5, NULL, 12, '0887/05');
INSERT INTO public.carrera VALUES (276, 'LICENCIATURA EN SANEAMIENTO Y PROTECCIÓN AMBIENTAL', 5, NULL, 12, NULL);
INSERT INTO public.carrera VALUES (277, 'LICENCIATURA EN HIGIENE Y SEGURIDAD EN EL TRABAJO (4TO Y 5TO CICLO)', 2, NULL, 12, NULL);
INSERT INTO public.carrera VALUES (278, 'INGENIERIA AGRONOMICA', 5, NULL, 10, '31');
INSERT INTO public.carrera VALUES (279, 'LICENCIATURA EN CIENCIAS DE LA EDUCACION', 5, NULL, 11, '139-434');
INSERT INTO public.carrera VALUES (280, 'DOCTORADO EN EDUCACIóN', 3, NULL, 11, '438/2009');
INSERT INTO public.carrera VALUES (281, 'PSICOLOGIA', 5, NULL, 11, '153-14');
INSERT INTO public.carrera VALUES (282, 'ESPECIALIZACIóN EN DIDáCTICA DE LAS CS. SOCIALES, CON MENCIóN EN HISTORIA, GEOGRAFíA Y EDUCACIóN', 2, NULL, 11, '639/2012');
INSERT INTO public.carrera VALUES (283, 'PROFESORADO EN NIVEL INICIAL', 3, NULL, 11, '886-1');
INSERT INTO public.carrera VALUES (284, 'PROFESORADO EN CIENCIAS DE LA EDUCACION', 5, NULL, 11, '239-403');
INSERT INTO public.carrera VALUES (285, 'PROFESORADO EN ENSEÑANZA PRIMARIA', 3, NULL, 11, '1016-391');
INSERT INTO public.carrera VALUES (286, 'PROFESORADO EN COMUNICACION SOCIAL', 4, NULL, 3, '173');
INSERT INTO public.carrera VALUES (287, 'MAESTRÍA EN SOCIOLOGÍA DE LA AGRICULTURA LATINOAMERICANA', 1, NULL, 3, '131/1998');
INSERT INTO public.carrera VALUES (288, 'ESPECIALIZACIóN EN TRABAJO SOCIAL FORENSE', 2, NULL, 3, '104/2010');
INSERT INTO public.carrera VALUES (289, 'ESPECIALIZACIóN EN DERECHO ADMINISTRATIVO', 1, NULL, 3, '394/2003');
INSERT INTO public.carrera VALUES (290, 'LICENCIATURA EN COMUNICACIÓN SOCIAL', 4, NULL, 3, NULL);
INSERT INTO public.carrera VALUES (291, 'ABOGACÍA', 5, NULL, 3, NULL);
INSERT INTO public.carrera VALUES (292, 'LICENCIATURA EN SERVICIO SOCIAL', 5, NULL, 3, NULL);
INSERT INTO public.carrera VALUES (293, 'LICENCIATURA EN SOCIOLOGIA', 5, NULL, 3, '150');
INSERT INTO public.carrera VALUES (294, 'LICENCIATURA EN MATEMÁTICA', 5, NULL, 15, '0187/98');
INSERT INTO public.carrera VALUES (295, 'MAESTRíA EN GESTIóN EMPRESARIA', 2, NULL, 15, '794/2012');
INSERT INTO public.carrera VALUES (296, 'MAESTRíA EN ECONOMíA Y POLíTICA ENERGéTICO AMBIENTAL', 2, NULL, 15, '220/1998');
INSERT INTO public.carrera VALUES (297, 'CONTADOR PÚBLICO NACIONAL', 5, NULL, 15, '088/85');
INSERT INTO public.carrera VALUES (298, 'CICLO GENERAL EN CIENCIAS ECONÓMICAS', NULL, NULL, 15, '0212/98');
INSERT INTO public.carrera VALUES (299, 'ESPECIALIZACIóN EN TRIBUTACIóN.', 2, NULL, 15, '760/97');
INSERT INTO public.carrera VALUES (300, 'PROFESORADO UNIVERSITARIO EN MATEMÁTICA', 4, NULL, 15, '1467/14');
INSERT INTO public.carrera VALUES (301, 'PROFESORADO EN CIENCIAS ECONÓMICAS', 4, NULL, 15, '999/2002');
INSERT INTO public.carrera VALUES (302, 'LICENCIATURA EN ADMINISTRACIÓN', 5, NULL, 15, '1033/05');
INSERT INTO public.carrera VALUES (303, 'MAESTRíA EN ESTUDIOS DE LAS MUJERES Y DE GéNERO', 2, NULL, 16, '144/2014');
INSERT INTO public.carrera VALUES (304, 'PROFESORADO EN HISTORIA', 5, NULL, 16, '96');
INSERT INTO public.carrera VALUES (305, 'PROFESORADO EN LETRAS', 4, NULL, 16, '572');
INSERT INTO public.carrera VALUES (306, 'PROFESORADO EN FILOSOFIA', 5, NULL, 16, '641');
INSERT INTO public.carrera VALUES (307, 'PROFESORADO EN GEOGRAFIA', 4, NULL, 16, '573');
INSERT INTO public.carrera VALUES (308, 'TECNICATURA EN PLANIFICACION AMBIENTAL', 2, NULL, 16, '500');
INSERT INTO public.carrera VALUES (309, 'LICENCIATURA EN GEOGRAFÍA', 5, NULL, 16, '573');
INSERT INTO public.carrera VALUES (310, 'LICENCIATURA EN HISTORIA', 5, NULL, 16, '96');
INSERT INTO public.carrera VALUES (311, 'LICENCIATURA EN LETRAS', 5, NULL, 16, '572');
INSERT INTO public.carrera VALUES (312, 'LICENCIATURA EN FILOSOFÍA', 5, NULL, 16, '641');
INSERT INTO public.carrera VALUES (313, 'DOCTORADO EN HISTORIA', 3, NULL, 16, '206/2015');
INSERT INTO public.carrera VALUES (314, 'TECNICATURA UNIVERSITARIA EN DESARROLLO WEB', 2, NULL, 17, '0312/09');
INSERT INTO public.carrera VALUES (315, 'PROFESORADO EN INFORMÁTICA', 4, NULL, 17, '1185/13');
INSERT INTO public.carrera VALUES (316, 'LICENCIATURA EN CIENCIAS DE LA COMPUTACIÓN', 5, NULL, 17, '1112/13');
INSERT INTO public.carrera VALUES (317, 'TECNICATURA UNIVERSITARIA EN ADMINISTRACIÓN DE SISTEMAS Y SOFTWARE LIBRE', 2, NULL, 17, '0895/12');
INSERT INTO public.carrera VALUES (318, 'LICENCIATURA EN SISTEMAS DE INFORMACIÓN', 5, NULL, 17, '1420/13');
INSERT INTO public.carrera VALUES (319, 'INGENIERÍA ELECTRÓNICA', 5, NULL, 2, '802/97');
INSERT INTO public.carrera VALUES (320, 'INGENIERÍA QUÍMICA', 5, NULL, 2, '803/97');
INSERT INTO public.carrera VALUES (321, 'INGENIERÍA EN PETRÓLEO', 5, NULL, 2, '804/97');
INSERT INTO public.carrera VALUES (322, 'MAESTRíA EN INTERVENCIóN AMBIENTAL', 2, NULL, 2, '794/2005');
INSERT INTO public.carrera VALUES (323, 'ESPECIALIZACIóN EN HIGIENE, SEGURIDAD Y MEDIO AMBIENTE EN LA CONSTRUCCIóN.', 2, NULL, 2, '1170/2006');
INSERT INTO public.carrera VALUES (324, 'DOCTORADO EN INGENIERíA', 5, NULL, 2, '1049/2013');
INSERT INTO public.carrera VALUES (325, 'INGENIERÍA MECÁNICA', 5, NULL, 2, '806/97');
INSERT INTO public.carrera VALUES (326, 'INGENIERÍA CIVIL', 5, NULL, 2, '805/97');
INSERT INTO public.carrera VALUES (327, 'DOCTORADO EN ENSEñANZA DE CIENCIAS EXACTAS Y NATURALES', 4, NULL, 2, '078/2010');
INSERT INTO public.carrera VALUES (328, 'PROFESORADO EN QUIMICA', 4, NULL, 2, '1001');
INSERT INTO public.carrera VALUES (329, 'LICENCIATURA EN CIENCIAS GEOLÓGICAS', 5, NULL, 2, '443/09');
INSERT INTO public.carrera VALUES (330, 'INGENIERÍA ELÉCTRICA', 5, NULL, 2, '807/97');
INSERT INTO public.carrera VALUES (331, 'PROFESORADO EN FÍSICA', 3, NULL, 2, '1002/98');
INSERT INTO public.carrera VALUES (332, 'TRADUCTORADO PÚBLICO EN IDIOMA INGLÉS', 5, NULL, 5, NULL);
INSERT INTO public.carrera VALUES (333, 'MAESTRíA EN LINGüíSTICA APLICADA', 3, NULL, 5, 'POSGRADO');
INSERT INTO public.carrera VALUES (334, 'LA MAESTRíA EN LINGüíSTICA APLICADA CON ORIENTACIóN ENSEñANZA DE LENGUAS EXTRANJERAS', 3, NULL, 5, 'POSGRADO');
INSERT INTO public.carrera VALUES (335, 'MAESTRíA EN LINGüíSTICA', 2, NULL, 5, '0956/93');
INSERT INTO public.carrera VALUES (336, 'ESPECIALIZACIóN EN LINGüíSTICA APLICADA CON ORIENTACIóN ENSEñANZA DE LENGUAS EXTRANJERAS', 1, NULL, 5, '787/2012');
INSERT INTO public.carrera VALUES (337, 'MAESTRíA EN LINGüíSTICA APLICADA A LA ENSEñANZA DE LAS LENGUAS EXTRANJERAS', 2, NULL, 5, '789/2012');
INSERT INTO public.carrera VALUES (338, 'PROFESORADO EN INGLES', 5, NULL, 5, '430');
INSERT INTO public.carrera VALUES (339, 'MEDICINA', 7, NULL, 13, '1047/13');
INSERT INTO public.carrera VALUES (340, 'TECNICATURA EN CONTROL E HIGIENE DE LOS ALIMENTOS', 3, NULL, 14, '550');
INSERT INTO public.carrera VALUES (341, 'ESPECIALIZACIóN EN CALIDAD E INOCUIDAD DE ALIMENTOS', 1, NULL, 14, '698/2010');
INSERT INTO public.carrera VALUES (342, 'LICENCIATURA EN GERENCIAMIENTO GASTRONOMICO', 4, NULL, 14, '0553/2011');
INSERT INTO public.carrera VALUES (343, 'LICENCIATURA EN TECNOLOGIA DE LOS ALIMENTOS', 5, NULL, 14, '238');
INSERT INTO public.carrera VALUES (344, 'ESPECIALIZACIóN EN MARKETING DE SERVICIOS', 1, NULL, 4, '303/2011');
INSERT INTO public.carrera VALUES (345, 'LICENCIATURA EN TURISMO', 5, NULL, 4, '624/96');
INSERT INTO public.carrera VALUES (346, 'GUÍA UNIVERSITARIO EN TURISMO', 2, NULL, 4, '1062/06');
INSERT INTO public.carrera VALUES (347, 'TECNICATURA EN EMPRESAS DE SERVICIOS TURÍSTICOS', 2, NULL, 4, '800/05');
INSERT INTO public.carrera VALUES (348, 'MAESTRíA EN MARKETING DE SERVICIOS', 2, NULL, 4, '705/2010');


--
-- Data for Name: carrera_destinada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: convocatoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dependencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependencia VALUES (2, 'Facultad de Ingeniería', 'FAIN');
INSERT INTO public.dependencia VALUES (3, 'Facultad de Derecho y Ciencias Sociales', 'FADE');
INSERT INTO public.dependencia VALUES (4, 'Facultad de Turismo', 'FATU');
INSERT INTO public.dependencia VALUES (5, 'Facultad de Lenguas', 'FALE');
INSERT INTO public.dependencia VALUES (6, 'Asentamiento Universitario Zapala', 'AUZA');
INSERT INTO public.dependencia VALUES (7, 'Centro Regional Universitario Bariloche', 'CRUB');
INSERT INTO public.dependencia VALUES (8, 'Centro Universitario Regional Zona Atlántica', 'CUZA');
INSERT INTO public.dependencia VALUES (9, 'Escuela Superior de Ciencias Marinas', 'ESCM');
INSERT INTO public.dependencia VALUES (10, 'Facultad de Ciencias Agrarias', 'FACA');
INSERT INTO public.dependencia VALUES (11, 'Facultad de Ciencias de la Educación', 'FACE');
INSERT INTO public.dependencia VALUES (12, 'Facultad de Ciencias del Ambiente y la Salud', 'FAAS');
INSERT INTO public.dependencia VALUES (13, 'Facultad de Ciencias Médicas', 'FAME');
INSERT INTO public.dependencia VALUES (14, 'Facultad de Ciencias y Tecnologías de los Alimentos', 'FATA');
INSERT INTO public.dependencia VALUES (15, 'Facultad de Economía y Administración', 'FAEA');
INSERT INTO public.dependencia VALUES (16, 'Facultad de Humanidades', 'FAHU');
INSERT INTO public.dependencia VALUES (17, 'Facultad de Informática', 'FAIF');
INSERT INTO public.dependencia VALUES (18, 'Administración Central', 'ADCE');
INSERT INTO public.dependencia VALUES (1, 'Asentamiento Universitario San Martín de los Andes', 'ASMA');


--
-- Data for Name: estado_postulante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado_postulante VALUES (1, 'postulado');
INSERT INTO public.estado_postulante VALUES (2, 'recibido');
INSERT INTO public.estado_postulante VALUES (3, 'enviado');
INSERT INTO public.estado_postulante VALUES (4, 'aceptado');
INSERT INTO public.estado_postulante VALUES (5, 'rechazado');


--
-- Data for Name: estudio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: experiencia_laboral; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: localidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.localidad VALUES (1, '25 de Mayo', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (2, '3 de febrero', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (3, 'A. Alsina', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (4, 'A. Gonzáles Cháves', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (5, 'Aguas Verdes', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (6, 'Alberti', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (7, 'Arrecifes', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (8, 'Ayacucho', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (9, 'Azul', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (10, 'Bahía Blanca', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (11, 'Balcarce', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (12, 'Baradero', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (13, 'Benito Juárez', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (14, 'Berisso', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (15, 'Bolívar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (16, 'Bragado', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (17, 'Brandsen', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (18, 'Campana', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (19, 'Cañuelas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (20, 'Capilla del Señor', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (21, 'Capitán Sarmiento', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (22, 'Carapachay', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (23, 'Carhue', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (24, 'Cariló', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (25, 'Carlos Casares', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (26, 'Carlos Tejedor', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (27, 'Carmen de Areco', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (28, 'Carmen de Patagones', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (29, 'Castelli', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (30, 'Chacabuco', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (31, 'Chascomús', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (32, 'Chivilcoy', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (33, 'Colón', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (34, 'Coronel Dorrego', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (35, 'Coronel Pringles', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (36, 'Coronel Rosales', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (37, 'Coronel Suarez', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (38, 'Costa Azul', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (39, 'Costa Chica', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (40, 'Costa del Este', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (41, 'Costa Esmeralda', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (42, 'Daireaux', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (43, 'Darregueira', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (44, 'Del Viso', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (45, 'Dolores', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (46, 'Don Torcuato', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (47, 'Ensenada', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (48, 'Escobar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (49, 'Exaltación de la Cruz', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (50, 'Florentino Ameghino', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (51, 'Garín', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (52, 'Gral. Alvarado', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (53, 'Gral. Alvear', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (54, 'Gral. Arenales', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (55, 'Gral. Belgrano', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (56, 'Gral. Guido', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (57, 'Gral. Lamadrid', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (58, 'Gral. Las Heras', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (59, 'Gral. Lavalle', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (60, 'Gral. Madariaga', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (61, 'Gral. Pacheco', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (62, 'Gral. Paz', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (63, 'Gral. Pinto', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (64, 'Gral. Pueyrredón', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (65, 'Gral. Rodríguez', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (66, 'Gral. Viamonte', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (67, 'Gral. Villegas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (68, 'Guaminí', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (69, 'Guernica', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (70, 'Hipólito Yrigoyen', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (71, 'Ing. Maschwitz', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (72, 'Junín', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (73, 'La Plata', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (74, 'Laprida', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (75, 'Las Flores', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (76, 'Las Toninas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (77, 'Leandro N. Alem', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (78, 'Lincoln', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (79, 'Loberia', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (80, 'Lobos', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (81, 'Los Cardales', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (82, 'Los Toldos', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (83, 'Lucila del Mar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (84, 'Luján', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (85, 'Magdalena', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (86, 'Maipú', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (87, 'Mar Chiquita', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (88, 'Mar de Ajó', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (89, 'Mar de las Pampas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (90, 'Mar del Plata', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (91, 'Mar del Tuyú', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (92, 'Marcos Paz', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (93, 'Mercedes', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (94, 'Miramar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (95, 'Monte', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (96, 'Monte Hermoso', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (97, 'Munro', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (98, 'Navarro', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (99, 'Necochea', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (100, 'Olavarría', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (101, 'Partido de la Costa', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (102, 'Pehuajó', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (103, 'Pellegrini', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (104, 'Pergamino', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (105, 'Pigüé', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (106, 'Pila', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (107, 'Pilar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (108, 'Pinamar', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (109, 'Pinar del Sol', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (110, 'Polvorines', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (111, 'Pte. Perón', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (112, 'Puán', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (113, 'Punta Indio', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (114, 'Ramallo', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (115, 'Rauch', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (116, 'Rivadavia', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (117, 'Rojas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (118, 'Roque Pérez', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (119, 'Saavedra', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (120, 'Saladillo', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (121, 'Salliqueló', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (122, 'Salto', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (123, 'San Andrés de Giles', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (124, 'San Antonio de Areco', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (125, 'San Antonio de Padua', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (126, 'San Bernardo', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (127, 'San Cayetano', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (128, 'San Clemente del Tuyú', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (129, 'San Nicolás', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (130, 'San Pedro', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (131, 'San Vicente', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (132, 'Santa Teresita', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (133, 'Suipacha', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (134, 'Tandil', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (135, 'Tapalqué', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (136, 'Tordillo', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (137, 'Tornquist', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (138, 'Trenque Lauquen', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (139, 'Tres Lomas', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (140, 'Villa Gesell', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (141, 'Villarino', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (142, 'Zárate', NULL, NULL, NULL, 1);
INSERT INTO public.localidad VALUES (143, '11 de Septiembre', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (144, '20 de Junio', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (145, '25 de Mayo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (146, 'Acassuso', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (147, 'Adrogué', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (148, 'Aldo Bonzi', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (149, 'Área Reserva Cinturón Ecológico', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (150, 'Avellaneda', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (151, 'Banfield', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (152, 'Barrio Parque', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (153, 'Barrio Santa Teresita', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (154, 'Beccar', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (155, 'Bella Vista', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (156, 'Berazategui', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (157, 'Bernal Este', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (158, 'Bernal Oeste', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (159, 'Billinghurst', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (160, 'Boulogne', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (161, 'Burzaco', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (162, 'Carapachay', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (163, 'Caseros', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (164, 'Castelar', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (165, 'Churruca', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (166, 'Ciudad Evita', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (167, 'Ciudad Madero', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (168, 'Ciudadela', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (169, 'Claypole', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (170, 'Crucecita', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (171, 'Dock Sud', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (172, 'Don Bosco', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (173, 'Don Orione', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (174, 'El Jagüel', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (175, 'El Libertador', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (176, 'El Palomar', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (177, 'El Tala', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (178, 'El Trébol', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (179, 'Ezeiza', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (180, 'Ezpeleta', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (181, 'Florencio Varela', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (182, 'Florida', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (183, 'Francisco Álvarez', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (184, 'Gerli', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (185, 'Glew', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (186, 'González Catán', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (187, 'Gral. Lamadrid', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (188, 'Grand Bourg', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (189, 'Gregorio de Laferrere', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (190, 'Guillermo Enrique Hudson', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (191, 'Haedo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (192, 'Hurlingham', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (193, 'Ing. Sourdeaux', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (194, 'Isidro Casanova', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (195, 'Ituzaingó', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (196, 'José C. Paz', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (197, 'José Ingenieros', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (198, 'José Marmol', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (199, 'La Lucila', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (200, 'La Reja', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (201, 'La Tablada', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (202, 'Lanús', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (203, 'Llavallol', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (204, 'Loma Hermosa', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (205, 'Lomas de Zamora', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (206, 'Lomas del Millón', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (207, 'Lomas del Mirador', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (208, 'Longchamps', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (209, 'Los Polvorines', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (210, 'Luis Guillón', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (211, 'Malvinas Argentinas', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (212, 'Martín Coronado', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (213, 'Martínez', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (214, 'Merlo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (215, 'Ministro Rivadavia', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (216, 'Monte Chingolo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (217, 'Monte Grande', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (218, 'Moreno', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (219, 'Morón', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (220, 'Muñiz', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (221, 'Olivos', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (222, 'Pablo Nogués', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (223, 'Pablo Podestá', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (224, 'Paso del Rey', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (225, 'Pereyra', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (226, 'Piñeiro', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (227, 'Plátanos', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (228, 'Pontevedra', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (229, 'Quilmes', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (230, 'Rafael Calzada', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (231, 'Rafael Castillo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (232, 'Ramos Mejía', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (233, 'Ranelagh', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (234, 'Remedios de Escalada', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (235, 'Sáenz Peña', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (236, 'San Antonio de Padua', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (237, 'San Fernando', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (238, 'San Francisco Solano', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (239, 'San Isidro', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (240, 'San José', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (241, 'San Justo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (242, 'San Martín', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (243, 'San Miguel', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (244, 'Santos Lugares', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (245, 'Sarandí', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (246, 'Sourigues', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (247, 'Tapiales', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (248, 'Temperley', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (249, 'Tigre', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (250, 'Tortuguitas', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (251, 'Tristán Suárez', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (252, 'Trujui', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (253, 'Turdera', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (254, 'Valentín Alsina', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (255, 'Vicente López', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (256, 'Villa Adelina', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (257, 'Villa Ballester', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (258, 'Villa Bosch', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (259, 'Villa Caraza', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (260, 'Villa Celina', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (261, 'Villa Centenario', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (262, 'Villa de Mayo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (263, 'Villa Diamante', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (264, 'Villa Domínico', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (265, 'Villa España', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (266, 'Villa Fiorito', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (267, 'Villa Guillermina', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (268, 'Villa Insuperable', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (269, 'Villa José León Suárez', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (270, 'Villa La Florida', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (271, 'Villa Luzuriaga', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (272, 'Villa Martelli', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (273, 'Villa Obrera', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (274, 'Villa Progreso', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (275, 'Villa Raffo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (276, 'Villa Sarmiento', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (277, 'Villa Tesei', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (278, 'Villa Udaondo', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (279, 'Virrey del Pino', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (280, 'Wilde', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (281, 'William Morris', NULL, NULL, NULL, 2);
INSERT INTO public.localidad VALUES (282, 'Agronomía', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (283, 'Almagro', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (284, 'Balvanera', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (285, 'Barracas', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (286, 'Belgrano', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (287, 'Boca', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (288, 'Boedo', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (289, 'Caballito', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (290, 'Chacarita', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (291, 'Coghlan', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (292, 'Colegiales', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (293, 'Constitución', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (294, 'Flores', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (295, 'Floresta', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (296, 'La Paternal', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (297, 'Liniers', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (298, 'Mataderos', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (299, 'Monserrat', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (300, 'Monte Castro', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (301, 'Nueva Pompeya', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (302, 'Núñez', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (303, 'Palermo', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (304, 'Parque Avellaneda', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (305, 'Parque Chacabuco', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (306, 'Parque Chas', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (307, 'Parque Patricios', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (308, 'Puerto Madero', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (309, 'Recoleta', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (310, 'Retiro', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (311, 'Saavedra', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (312, 'San Cristóbal', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (313, 'San Nicolás', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (314, 'San Telmo', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (315, 'Vélez Sársfield', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (316, 'Versalles', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (317, 'Villa Crespo', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (318, 'Villa del Parque', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (319, 'Villa Devoto', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (320, 'Villa Gral. Mitre', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (321, 'Villa Lugano', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (322, 'Villa Luro', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (323, 'Villa Ortúzar', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (324, 'Villa Pueyrredón', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (325, 'Villa Real', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (326, 'Villa Riachuelo', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (327, 'Villa Santa Rita', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (328, 'Villa Soldati', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (329, 'Villa Urquiza', NULL, NULL, NULL, 3);
INSERT INTO public.localidad VALUES (330, 'Aconquija', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (331, 'Ancasti', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (332, 'Andalgalá', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (333, 'Antofagasta', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (334, 'Belén', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (335, 'Capayán', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (336, 'Capital', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (337, '4', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (338, 'Corral Quemado', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (339, 'El Alto', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (340, 'El Rodeo', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (341, 'F.Mamerto Esquiú', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (342, 'Fiambalá', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (343, 'Hualfín', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (344, 'Huillapima', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (345, 'Icaño', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (346, 'La Puerta', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (347, 'Las Juntas', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (348, 'Londres', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (349, 'Los Altos', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (350, 'Los Varela', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (351, 'Mutquín', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (352, 'Paclín', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (353, 'Poman', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (354, 'Pozo de La Piedra', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (355, 'Puerta de Corral', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (356, 'Puerta San José', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (357, 'Recreo', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (358, 'S.F.V de 4', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (359, 'San Fernando', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (360, 'San Fernando del Valle', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (361, 'San José', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (362, 'Santa María', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (363, 'Santa Rosa', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (364, 'Saujil', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (365, 'Tapso', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (366, 'Tinogasta', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (367, 'Valle Viejo', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (368, 'Villa Vil', NULL, NULL, NULL, 4);
INSERT INTO public.localidad VALUES (369, 'Aviá Teraí', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (370, 'Barranqueras', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (371, 'Basail', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (372, 'Campo Largo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (373, 'Capital', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (374, 'Capitán Solari', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (375, 'Charadai', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (376, 'Charata', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (377, 'Chorotis', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (378, 'Ciervo Petiso', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (379, 'Cnel. Du Graty', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (380, 'Col. Benítez', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (381, 'Col. Elisa', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (382, 'Col. Popular', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (383, 'Colonias Unidas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (384, 'Concepción', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (385, 'Corzuela', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (386, 'Cote Lai', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (387, 'El Sauzalito', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (388, 'Enrique Urien', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (389, 'Fontana', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (390, 'Fte. Esperanza', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (391, 'Gancedo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (392, 'Gral. Capdevila', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (393, 'Gral. Pinero', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (394, 'Gral. San Martín', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (395, 'Gral. Vedia', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (396, 'Hermoso Campo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (397, 'I. del Cerrito', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (398, 'J.J. Castelli', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (399, 'La Clotilde', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (400, 'La Eduvigis', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (401, 'La Escondida', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (402, 'La Leonesa', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (403, 'La Tigra', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (404, 'La Verde', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (405, 'Laguna Blanca', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (406, 'Laguna Limpia', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (407, 'Lapachito', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (408, 'Las Breñas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (409, 'Las Garcitas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (410, 'Las Palmas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (411, 'Los Frentones', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (412, 'Machagai', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (413, 'Makallé', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (414, 'Margarita Belén', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (415, 'Miraflores', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (416, 'Misión N. Pompeya', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (417, 'Napenay', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (418, 'Pampa Almirón', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (419, 'Pampa del Indio', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (420, 'Pampa del Infierno', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (421, 'Pdcia. de La Plaza', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (422, 'Pdcia. Roca', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (423, 'Pdcia. Roque Sáenz Peña', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (424, 'Pto. Bermejo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (425, 'Pto. Eva Perón', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (426, 'Puero Tirol', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (427, 'Puerto Vilelas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (428, 'Quitilipi', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (429, 'Resistencia', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (430, 'Sáenz Peña', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (431, 'Samuhú', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (432, 'San Bernardo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (433, 'Santa Sylvina', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (434, 'Taco Pozo', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (435, 'Tres Isletas', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (436, 'Villa Ángela', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (437, 'Villa Berthet', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (438, 'Villa R. Bermejito', NULL, NULL, NULL, 5);
INSERT INTO public.localidad VALUES (439, 'Aldea Apeleg', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (440, 'Aldea Beleiro', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (441, 'Aldea Epulef', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (442, 'Alto Río Sengerr', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (443, 'Buen Pasto', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (444, 'Camarones', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (445, 'Carrenleufú', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (446, 'Cholila', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (447, 'Co. Centinela', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (448, 'Colan Conhué', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (449, 'Comodoro Rivadavia', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (450, 'Corcovado', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (451, 'Cushamen', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (452, 'Dique F. Ameghino', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (453, 'Dolavón', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (454, 'Dr. R. Rojas', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (455, 'El Hoyo', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (456, 'El Maitén', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (457, 'Epuyén', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (458, 'Esquel', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (459, 'Facundo', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (460, 'Gaimán', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (461, 'Gan Gan', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (462, 'Gastre', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (463, 'Gdor. Costa', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (464, 'Gualjaina', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (465, 'J. de San Martín', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (466, 'Lago Blanco', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (467, 'Lago Puelo', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (468, 'Lagunita Salada', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (469, 'Las Plumas', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (470, 'Los Altares', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (471, 'Paso de los Indios', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (472, 'Paso del Sapo', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (473, 'Pto. Madryn', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (474, 'Pto. Pirámides', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (475, 'Rada Tilly', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (476, 'Rawson', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (477, 'Río Mayo', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (478, 'Río Pico', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (479, 'Sarmiento', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (480, 'Tecka', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (481, 'Telsen', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (482, 'Trelew', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (483, 'Trevelin', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (484, 'Veintiocho de Julio', NULL, NULL, NULL, 6);
INSERT INTO public.localidad VALUES (485, 'Achiras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (486, 'Adelia Maria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (487, 'Agua de Oro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (488, 'Alcira Gigena', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (489, 'Aldea Santa Maria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (490, 'Alejandro Roca', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (491, 'Alejo Ledesma', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (492, 'Alicia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (493, 'Almafuerte', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (494, 'Alpa Corral', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (495, 'Alta Gracia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (496, 'Alto Alegre', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (497, 'Alto de Los Quebrachos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (498, 'Altos de Chipion', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (499, 'Amboy', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (500, 'Ambul', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (501, 'Ana Zumaran', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (502, 'Anisacate', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (503, 'Arguello', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (504, 'Arias', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (505, 'Arroyito', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (506, 'Arroyo Algodon', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (507, 'Arroyo Cabral', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (508, 'Arroyo Los Patos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (509, 'Assunta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (510, 'Atahona', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (511, 'Ausonia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (512, 'Avellaneda', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (513, 'Ballesteros', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (514, 'Ballesteros Sud', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (515, 'Balnearia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (516, 'Bañado de Soto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (517, 'Bell Ville', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (518, 'Bengolea', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (519, 'Benjamin Gould', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (520, 'Berrotaran', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (521, 'Bialet Masse', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (522, 'Bouwer', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (523, 'Brinkmann', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (524, 'Buchardo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (525, 'Bulnes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (526, 'Cabalango', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (527, 'Calamuchita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (528, 'Calchin', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (529, 'Calchin Oeste', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (530, 'Calmayo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (531, 'Camilo Aldao', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (532, 'Caminiaga', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (533, 'Cañada de Luque', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (534, 'Cañada de Machado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (535, 'Cañada de Rio Pinto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (536, 'Cañada del Sauce', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (537, 'Canals', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (538, 'Candelaria Sud', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (539, 'Capilla de Remedios', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (540, 'Capilla de Siton', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (541, 'Capilla del Carmen', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (542, 'Capilla del Monte', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (543, 'Capital', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (544, 'Capitan Gral B. O´Higgins', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (545, 'Carnerillo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (546, 'Carrilobo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (547, 'Casa Grande', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (548, 'Cavanagh', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (549, 'Cerro Colorado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (550, 'Chaján', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (551, 'Chalacea', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (552, 'Chañar Viejo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (553, 'Chancaní', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (554, 'Charbonier', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (555, 'Charras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (556, 'Chazón', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (557, 'Chilibroste', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (558, 'Chucul', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (559, 'Chuña', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (560, 'Chuña Huasi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (561, 'Churqui Cañada', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (562, 'Cienaga Del Coro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (563, 'Cintra', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (564, 'Col. Almada', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (565, 'Col. Anita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (566, 'Col. Barge', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (567, 'Col. Bismark', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (568, 'Col. Bremen', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (569, 'Col. Caroya', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (570, 'Col. Italiana', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (571, 'Col. Iturraspe', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (572, 'Col. Las Cuatro Esquinas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (573, 'Col. Las Pichanas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (574, 'Col. Marina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (575, 'Col. Prosperidad', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (576, 'Col. San Bartolome', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (577, 'Col. San Pedro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (578, 'Col. Tirolesa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (579, 'Col. Vicente Aguero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (580, 'Col. Videla', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (581, 'Col. Vignaud', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (582, 'Col. Waltelina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (583, 'Colazo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (584, 'Comechingones', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (585, 'Conlara', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (586, 'Copacabana', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (587, '7', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (588, 'Coronel Baigorria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (589, 'Coronel Moldes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (590, 'Corral de Bustos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (591, 'Corralito', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (592, 'Cosquín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (593, 'Costa Sacate', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (594, 'Cruz Alta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (595, 'Cruz de Caña', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (596, 'Cruz del Eje', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (597, 'Cuesta Blanca', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (598, 'Dean Funes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (599, 'Del Campillo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (600, 'Despeñaderos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (601, 'Devoto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (602, 'Diego de Rojas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (603, 'Dique Chico', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (604, 'El Arañado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (605, 'El Brete', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (606, 'El Chacho', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (607, 'El Crispín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (608, 'El Fortín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (609, 'El Manzano', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (610, 'El Rastreador', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (611, 'El Rodeo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (612, 'El Tío', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (613, 'Elena', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (614, 'Embalse', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (615, 'Esquina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (616, 'Estación Gral. Paz', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (617, 'Estación Juárez Celman', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (618, 'Estancia de Guadalupe', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (619, 'Estancia Vieja', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (620, 'Etruria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (621, 'Eufrasio Loza', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (622, 'Falda del Carmen', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (623, 'Freyre', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (624, 'Gral. Baldissera', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (625, 'Gral. Cabrera', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (626, 'Gral. Deheza', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (627, 'Gral. Fotheringham', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (628, 'Gral. Levalle', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (629, 'Gral. Roca', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (630, 'Guanaco Muerto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (631, 'Guasapampa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (632, 'Guatimozin', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (633, 'Gutenberg', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (634, 'Hernando', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (635, 'Huanchillas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (636, 'Huerta Grande', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (637, 'Huinca Renanco', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (638, 'Idiazabal', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (639, 'Impira', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (640, 'Inriville', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (641, 'Isla Verde', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (642, 'Italó', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (643, 'James Craik', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (644, 'Jesús María', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (645, 'Jovita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (646, 'Justiniano Posse', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (647, 'Km 658', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (648, 'L. V. Mansilla', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (649, 'La Batea', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (650, 'La Calera', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (651, 'La Carlota', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (652, 'La Carolina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (653, 'La Cautiva', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (654, 'La Cesira', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (655, 'La Cruz', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (656, 'La Cumbre', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (657, 'La Cumbrecita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (658, 'La Falda', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (659, 'La Francia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (660, 'La Granja', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (661, 'La Higuera', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (662, 'La Laguna', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (663, 'La Paisanita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (664, 'La Palestina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (665, '12', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (666, 'La Paquita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (667, 'La Para', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (668, 'La Paz', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (669, 'La Playa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (670, 'La Playosa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (671, 'La Población', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (672, 'La Posta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (673, 'La Puerta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (674, 'La Quinta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (675, 'La Rancherita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (676, 'La Rinconada', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (677, 'La Serranita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (678, 'La Tordilla', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (679, 'Laborde', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (680, 'Laboulaye', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (681, 'Laguna Larga', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (682, 'Las Acequias', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (683, 'Las Albahacas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (684, 'Las Arrias', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (685, 'Las Bajadas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (686, 'Las Caleras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (687, 'Las Calles', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (688, 'Las Cañadas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (689, 'Las Gramillas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (690, 'Las Higueras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (691, 'Las Isletillas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (692, 'Las Junturas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (693, 'Las Palmas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (694, 'Las Peñas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (695, 'Las Peñas Sud', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (696, 'Las Perdices', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (697, 'Las Playas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (698, 'Las Rabonas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (699, 'Las Saladas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (700, 'Las Tapias', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (701, 'Las Varas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (702, 'Las Varillas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (703, 'Las Vertientes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (704, 'Leguizamón', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (705, 'Leones', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (706, 'Los Cedros', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (707, 'Los Cerrillos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (708, 'Los Chañaritos (C.E)', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (709, 'Los Chanaritos (R.S)', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (710, 'Los Cisnes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (711, 'Los Cocos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (712, 'Los Cóndores', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (713, 'Los Hornillos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (714, 'Los Hoyos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (715, 'Los Mistoles', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (716, 'Los Molinos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (717, 'Los Pozos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (718, 'Los Reartes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (719, 'Los Surgentes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (720, 'Los Talares', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (721, 'Los Zorros', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (722, 'Lozada', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (723, 'Luca', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (724, 'Luque', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (725, 'Luyaba', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (726, 'Malagueño', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (727, 'Malena', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (728, 'Malvinas Argentinas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (729, 'Manfredi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (730, 'Maquinista Gallini', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (731, 'Marcos Juárez', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (732, 'Marull', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (733, 'Matorrales', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (734, 'Mattaldi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (735, 'Mayu Sumaj', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (736, 'Media Naranja', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (737, 'Melo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (738, 'Mendiolaza', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (739, 'Mi Granja', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (740, 'Mina Clavero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (741, 'Miramar', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (742, 'Morrison', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (743, 'Morteros', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (744, 'Mte. Buey', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (745, 'Mte. Cristo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (746, 'Mte. De Los Gauchos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (747, 'Mte. Leña', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (748, 'Mte. Maíz', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (749, 'Mte. Ralo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (750, 'Nicolás Bruzone', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (751, 'Noetinger', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (752, 'Nono', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (753, 'Nueva 7', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (754, 'Obispo Trejo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (755, 'Olaeta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (756, 'Oliva', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (757, 'Olivares San Nicolás', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (758, 'Onagolty', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (759, 'Oncativo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (760, 'Ordoñez', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (761, 'Pacheco De Melo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (762, 'Pampayasta N.', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (763, 'Pampayasta S.', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (764, 'Panaholma', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (765, 'Pascanas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (766, 'Pasco', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (767, 'Paso del Durazno', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (768, 'Paso Viejo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (769, 'Pilar', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (770, 'Pincén', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (771, 'Piquillín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (772, 'Plaza de Mercedes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (773, 'Plaza Luxardo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (774, 'Porteña', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (775, 'Potrero de Garay', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (776, 'Pozo del Molle', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (777, 'Pozo Nuevo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (778, 'Pueblo Italiano', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (779, 'Puesto de Castro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (780, 'Punta del Agua', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (781, 'Quebracho Herrado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (782, 'Quilino', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (783, 'Rafael García', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (784, 'Ranqueles', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (785, 'Rayo Cortado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (786, 'Reducción', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (787, 'Rincón', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (788, 'Río Bamba', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (789, 'Río Ceballos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (790, 'Río Cuarto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (791, 'Río de Los Sauces', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (792, 'Río Primero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (793, 'Río Segundo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (794, 'Río Tercero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (795, 'Rosales', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (796, 'Rosario del Saladillo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (797, 'Sacanta', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (798, 'Sagrada Familia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (799, 'Saira', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (800, 'Saladillo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (801, 'Saldán', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (802, 'Salsacate', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (803, 'Salsipuedes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (804, 'Sampacho', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (805, 'San Agustín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (806, 'San Antonio de Arredondo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (807, 'San Antonio de Litín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (808, 'San Basilio', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (809, 'San Carlos Minas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (810, 'San Clemente', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (811, 'San Esteban', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (812, 'San Francisco', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (813, 'San Ignacio', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (814, 'San Javier', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (815, 'San Jerónimo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (816, 'San Joaquín', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (817, 'San José de La Dormida', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (818, 'San José de Las Salinas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (819, 'San Lorenzo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (820, 'San Marcos Sierras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (821, 'San Marcos Sud', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (822, 'San Pedro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (823, 'San Pedro N.', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (824, 'San Roque', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (825, 'San Vicente', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (826, 'Santa Catalina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (827, 'Santa Elena', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (828, 'Santa Eufemia', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (829, 'Santa Maria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (830, 'Sarmiento', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (831, 'Saturnino M.Laspiur', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (832, 'Sauce Arriba', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (833, 'Sebastián Elcano', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (834, 'Seeber', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (835, 'Segunda Usina', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (836, 'Serrano', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (837, 'Serrezuela', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (838, 'Sgo. Temple', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (839, 'Silvio Pellico', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (840, 'Simbolar', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (841, 'Sinsacate', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (842, 'Sta. Rosa de Calamuchita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (843, 'Sta. Rosa de Río Primero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (844, 'Suco', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (845, 'Tala Cañada', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (846, 'Tala Huasi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (847, 'Talaini', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (848, 'Tancacha', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (849, 'Tanti', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (850, 'Ticino', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (851, 'Tinoco', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (852, 'Tío Pujio', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (853, 'Toledo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (854, 'Toro Pujio', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (855, 'Tosno', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (856, 'Tosquita', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (857, 'Tránsito', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (858, 'Tuclame', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (859, 'Tutti', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (860, 'Ucacha', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (861, 'Unquillo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (862, 'Valle de Anisacate', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (863, 'Valle Hermoso', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (864, 'Vélez Sarfield', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (865, 'Viamonte', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (866, 'Vicuña Mackenna', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (867, 'Villa Allende', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (868, 'Villa Amancay', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (869, 'Villa Ascasubi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (870, 'Villa Candelaria N.', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (871, 'Villa Carlos Paz', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (872, 'Villa Cerro Azul', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (873, 'Villa Ciudad de América', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (874, 'Villa Ciudad Pque Los Reartes', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (875, 'Villa Concepción del Tío', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (876, 'Villa Cura Brochero', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (877, 'Villa de Las Rosas', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (878, 'Villa de María', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (879, 'Villa de Pocho', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (880, 'Villa de Soto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (881, 'Villa del Dique', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (882, 'Villa del Prado', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (883, 'Villa del Rosario', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (884, 'Villa del Totoral', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (885, 'Villa Dolores', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (886, 'Villa El Chancay', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (887, 'Villa Elisa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (888, 'Villa Flor Serrana', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (889, 'Villa Fontana', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (890, 'Villa Giardino', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (891, 'Villa Gral. Belgrano', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (892, 'Villa Gutierrez', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (893, 'Villa Huidobro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (894, 'Villa La Bolsa', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (895, 'Villa Los Aromos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (896, 'Villa Los Patos', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (897, 'Villa María', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (898, 'Villa Nueva', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (899, 'Villa Pque. Santa Ana', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (900, 'Villa Pque. Siquiman', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (901, 'Villa Quillinzo', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (902, 'Villa Rossi', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (903, 'Villa Rumipal', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (904, 'Villa San Esteban', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (905, 'Villa San Isidro', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (906, 'Villa 21', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (907, 'Villa Sarmiento (G.R)', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (908, 'Villa Sarmiento (S.A)', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (909, 'Villa Tulumba', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (910, 'Villa Valeria', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (911, 'Villa Yacanto', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (912, 'Washington', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (913, 'Wenceslao Escalante', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (914, 'Ycho Cruz Sierras', NULL, NULL, NULL, 7);
INSERT INTO public.localidad VALUES (915, 'Alvear', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (916, 'Bella Vista', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (917, 'Berón de Astrada', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (918, 'Bonpland', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (919, 'Caá Cati', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (920, 'Capital', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (921, 'Chavarría', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (922, 'Col. C. Pellegrini', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (923, 'Col. Libertad', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (924, 'Col. Liebig', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (925, 'Col. Sta Rosa', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (926, 'Concepción', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (927, 'Cruz de Los Milagros', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (928, 'Curuzú-Cuatiá', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (929, 'Empedrado', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (930, 'Esquina', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (931, 'Estación Torrent', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (932, 'Felipe Yofré', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (933, 'Garruchos', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (934, 'Gdor. Agrónomo', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (935, 'Gdor. Martínez', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (936, 'Goya', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (937, 'Guaviravi', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (938, 'Herlitzka', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (939, 'Ita-Ibate', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (940, 'Itatí', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (941, 'Ituzaingó', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (942, 'José Rafael Gómez', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (943, 'Juan Pujol', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (944, 'La Cruz', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (945, 'Lavalle', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (946, 'Lomas de Vallejos', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (947, 'Loreto', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (948, 'Mariano I. Loza', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (949, 'Mburucuyá', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (950, 'Mercedes', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (951, 'Mocoretá', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (952, 'Mte. Caseros', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (953, 'Nueve de Julio', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (954, 'Palmar Grande', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (955, 'Parada Pucheta', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (956, 'Paso de La Patria', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (957, 'Paso de Los Libres', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (958, 'Pedro R. Fernandez', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (959, 'Perugorría', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (960, 'Pueblo Libertador', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (961, 'Ramada Paso', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (962, 'Riachuelo', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (963, 'Saladas', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (964, 'San Antonio', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (965, 'San Carlos', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (966, 'San Cosme', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (967, 'San Lorenzo', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (968, '20 del Palmar', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (969, 'San Miguel', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (970, 'San Roque', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (971, 'Santa Ana', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (972, 'Santa Lucía', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (973, 'Santo Tomé', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (974, 'Sauce', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (975, 'Tabay', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (976, 'Tapebicuá', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (977, 'Tatacua', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (978, 'Virasoro', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (979, 'Yapeyú', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (980, 'Yataití Calle', NULL, NULL, NULL, 8);
INSERT INTO public.localidad VALUES (981, 'Alarcón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (982, 'Alcaraz', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (983, 'Alcaraz N.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (984, 'Alcaraz S.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (985, 'Aldea Asunción', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (986, 'Aldea Brasilera', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (987, 'Aldea Elgenfeld', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (988, 'Aldea Grapschental', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (989, 'Aldea Ma. Luisa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (990, 'Aldea Protestante', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (991, 'Aldea Salto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (992, 'Aldea San Antonio (G)', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (993, 'Aldea San Antonio (P)', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (994, 'Aldea 19', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (995, 'Aldea San Miguel', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (996, 'Aldea San Rafael', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (997, 'Aldea Spatzenkutter', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (998, 'Aldea Sta. María', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (999, 'Aldea Sta. Rosa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1000, 'Aldea Valle María', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1001, 'Altamirano Sur', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1002, 'Antelo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1003, 'Antonio Tomás', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1004, 'Aranguren', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1005, 'Arroyo Barú', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1006, 'Arroyo Burgos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1007, 'Arroyo Clé', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1008, 'Arroyo Corralito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1009, 'Arroyo del Medio', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1010, 'Arroyo Maturrango', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1011, 'Arroyo Palo Seco', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1012, 'Banderas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1013, 'Basavilbaso', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1014, 'Betbeder', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1015, 'Bovril', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1016, 'Caseros', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1017, 'Ceibas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1018, 'Cerrito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1019, 'Chajarí', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1020, 'Chilcas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1021, 'Clodomiro Ledesma', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1022, 'Col. Alemana', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1023, 'Col. Avellaneda', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1024, 'Col. Avigdor', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1025, 'Col. Ayuí', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1026, 'Col. Baylina', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1027, 'Col. Carrasco', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1028, 'Col. Celina', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1029, 'Col. Cerrito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1030, 'Col. Crespo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1031, 'Col. Elia', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1032, 'Col. Ensayo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1033, 'Col. Gral. Roca', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1034, 'Col. La Argentina', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1035, 'Col. Merou', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1036, 'Col. Oficial Nª3', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1037, 'Col. Oficial Nº13', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1038, 'Col. Oficial Nº14', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1039, 'Col. Oficial Nº5', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1040, 'Col. Reffino', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1041, 'Col. Tunas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1042, 'Col. Viraró', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1043, 'Colón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1044, 'Concepción del Uruguay', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1045, 'Concordia', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1046, 'Conscripto Bernardi', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1047, 'Costa Grande', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1048, 'Costa San Antonio', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1049, 'Costa Uruguay N.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1050, 'Costa Uruguay S.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1051, 'Crespo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1052, 'Crucecitas 3ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1053, 'Crucecitas 7ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1054, 'Crucecitas 8ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1055, 'Cuchilla Redonda', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1056, 'Curtiembre', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1057, 'Diamante', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1058, 'Distrito 6º', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1059, 'Distrito Chañar', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1060, 'Distrito Chiqueros', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1061, 'Distrito Cuarto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1062, 'Distrito Diego López', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1063, 'Distrito Pajonal', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1064, 'Distrito Sauce', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1065, 'Distrito Tala', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1066, 'Distrito Talitas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1067, 'Don Cristóbal 1ª Sección', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1068, 'Don Cristóbal 2ª Sección', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1069, 'Durazno', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1070, 'El Cimarrón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1071, 'El Gramillal', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1072, 'El Palenque', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1073, 'El Pingo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1074, 'El Quebracho', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1075, 'El Redomón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1076, 'El Solar', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1077, 'Enrique Carbo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1078, '9', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1079, 'Espinillo N.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1080, 'Estación Campos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1081, 'Estación Escriña', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1082, 'Estación Lazo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1083, 'Estación Raíces', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1084, 'Estación Yerúa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1085, 'Estancia Grande', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1086, 'Estancia Líbaros', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1087, 'Estancia Racedo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1088, 'Estancia Solá', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1089, 'Estancia Yuquerí', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1090, 'Estaquitas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1091, 'Faustino M. Parera', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1092, 'Febre', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1093, 'Federación', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1094, 'Federal', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1095, 'Gdor. Echagüe', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1096, 'Gdor. Mansilla', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1097, 'Gilbert', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1098, 'González Calderón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1099, 'Gral. Almada', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1100, 'Gral. Alvear', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1101, 'Gral. Campos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1102, 'Gral. Galarza', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1103, 'Gral. Ramírez', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1104, 'Gualeguay', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1105, 'Gualeguaychú', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1106, 'Gualeguaycito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1107, 'Guardamonte', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1108, 'Hambis', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1109, 'Hasenkamp', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1110, 'Hernandarias', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1111, 'Hernández', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1112, 'Herrera', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1113, 'Hinojal', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1114, 'Hocker', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1115, 'Ing. Sajaroff', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1116, 'Irazusta', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1117, 'Isletas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1118, 'J.J De Urquiza', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1119, 'Jubileo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1120, 'La Clarita', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1121, 'La Criolla', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1122, 'La Esmeralda', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1123, 'La Florida', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1124, 'La Fraternidad', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1125, 'La Hierra', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1126, 'La Ollita', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1127, 'La Paz', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1128, 'La Picada', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1129, 'La Providencia', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1130, 'La Verbena', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1131, 'Laguna Benítez', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1132, 'Larroque', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1133, 'Las Cuevas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1134, 'Las Garzas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1135, 'Las Guachas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1136, 'Las Mercedes', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1137, 'Las Moscas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1138, 'Las Mulitas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1139, 'Las Toscas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1140, 'Laurencena', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1141, 'Libertador San Martín', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1142, 'Loma Limpia', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1143, 'Los Ceibos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1144, 'Los Charruas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1145, 'Los Conquistadores', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1146, 'Lucas González', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1147, 'Lucas N.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1148, 'Lucas S. 1ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1149, 'Lucas S. 2ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1150, 'Maciá', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1151, 'María Grande', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1152, 'María Grande 2ª', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1153, 'Médanos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1154, 'Mojones N.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1155, 'Mojones S.', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1156, 'Molino Doll', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1157, 'Monte Redondo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1158, 'Montoya', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1159, 'Mulas Grandes', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1160, 'Ñancay', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1161, 'Nogoyá', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1162, 'Nueva Escocia', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1163, 'Nueva Vizcaya', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1164, 'Ombú', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1165, 'Oro Verde', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1166, 'Paraná', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1167, 'Pasaje Guayaquil', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1168, 'Pasaje Las Tunas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1169, 'Paso de La Arena', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1170, 'Paso de La Laguna', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1171, 'Paso de Las Piedras', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1172, 'Paso Duarte', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1173, 'Pastor Britos', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1174, 'Pedernal', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1175, 'Perdices', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1176, 'Picada Berón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1177, 'Piedras Blancas', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1178, 'Primer Distrito Cuchilla', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1179, 'Primero de Mayo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1180, 'Pronunciamiento', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1181, 'Pto. Algarrobo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1182, 'Pto. Ibicuy', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1183, 'Pueblo Brugo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1184, 'Pueblo Cazes', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1185, 'Pueblo Gral. Belgrano', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1186, 'Pueblo Liebig', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1187, 'Puerto Yeruá', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1188, 'Punta del Monte', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1189, 'Quebracho', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1190, 'Quinto Distrito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1191, 'Raices Oeste', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1192, 'Rincón de Nogoyá', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1193, 'Rincón del Cinto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1194, 'Rincón del Doll', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1195, 'Rincón del Gato', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1196, 'Rocamora', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1197, 'Rosario del Tala', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1198, 'San Benito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1199, 'San Cipriano', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1200, 'San Ernesto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1201, 'San Gustavo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1202, 'San Jaime', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1203, 'San José', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1204, 'San José de Feliciano', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1205, 'San Justo', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1206, 'San Marcial', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1207, 'San Pedro', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1208, 'San Ramírez', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1209, 'San Ramón', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1210, 'San Roque', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1211, 'San Salvador', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1212, 'San Víctor', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1213, 'Santa Ana', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1214, 'Santa Anita', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1215, 'Santa Elena', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1216, 'Santa Lucía', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1217, 'Santa Luisa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1218, 'Sauce de Luna', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1219, 'Sauce Montrull', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1220, 'Sauce Pinto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1221, 'Sauce Sur', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1222, 'Seguí', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1223, 'Sir Leonard', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1224, 'Sosa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1225, 'Tabossi', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1226, 'Tezanos Pinto', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1227, 'Ubajay', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1228, 'Urdinarrain', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1229, 'Veinte de Septiembre', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1230, 'Viale', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1231, 'Victoria', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1232, 'Villa Clara', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1233, 'Villa del Rosario', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1234, 'Villa Domínguez', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1235, 'Villa Elisa', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1236, 'Villa Fontana', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1237, 'Villa Gdor. Etchevehere', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1238, 'Villa Mantero', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1239, 'Villa Paranacito', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1240, 'Villa Urquiza', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1241, 'Villaguay', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1242, 'Walter Moss', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1243, 'Yacaré', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1244, 'Yeso Oeste', NULL, NULL, NULL, 9);
INSERT INTO public.localidad VALUES (1245, 'Buena Vista', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1246, 'Clorinda', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1247, 'Col. Pastoril', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1248, 'Cte. Fontana', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1249, 'El Colorado', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1250, 'El Espinillo', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1251, 'Estanislao Del Campo', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1252, '10', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1253, 'Fortín Lugones', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1254, 'Gral. Lucio V. Mansilla', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1255, 'Gral. Manuel Belgrano', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1256, 'Gral. Mosconi', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1257, 'Gran Guardia', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1258, 'Herradura', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1259, 'Ibarreta', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1260, 'Ing. Juárez', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1261, 'Laguna Blanca', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1262, 'Laguna Naick Neck', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1263, 'Laguna Yema', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1264, 'Las Lomitas', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1265, 'Los Chiriguanos', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1266, 'Mayor V. Villafañe', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1267, 'Misión San Fco.', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1268, 'Palo Santo', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1269, 'Pirané', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1270, 'Pozo del Maza', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1271, 'Riacho He-He', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1272, 'San Hilario', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1273, 'San Martín II', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1274, 'Siete Palmas', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1275, 'Subteniente Perín', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1276, 'Tres Lagunas', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1277, 'Villa Dos Trece', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1278, 'Villa Escolar', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1279, 'Villa Gral. Güemes', NULL, NULL, NULL, 10);
INSERT INTO public.localidad VALUES (1280, 'Abdon Castro Tolay', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1281, 'Abra Pampa', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1282, 'Abralaite', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1283, 'Aguas Calientes', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1284, 'Arrayanal', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1285, 'Barrios', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1286, 'Caimancito', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1287, 'Calilegua', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1288, 'Cangrejillos', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1289, 'Caspala', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1290, 'Catuá', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1291, 'Cieneguillas', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1292, 'Coranzulli', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1293, 'Cusi-Cusi', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1294, 'El Aguilar', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1295, 'El Carmen', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1296, 'El Cóndor', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1297, 'El Fuerte', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1298, 'El Piquete', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1299, 'El Talar', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1300, 'Fraile Pintado', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1301, 'Hipólito Yrigoyen', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1302, 'Huacalera', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1303, 'Humahuaca', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1304, 'La Esperanza', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1305, 'La Mendieta', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1306, 'La Quiaca', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1307, 'Ledesma', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1308, 'Libertador Gral. San Martin', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1309, 'Maimara', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1310, 'Mina Pirquitas', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1311, 'Monterrico', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1312, 'Palma Sola', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1313, 'Palpalá', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1314, 'Pampa Blanca', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1315, 'Pampichuela', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1316, 'Perico', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1317, 'Puesto del Marqués', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1318, 'Puesto Viejo', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1319, 'Pumahuasi', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1320, 'Purmamarca', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1321, 'Rinconada', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1322, 'Rodeitos', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1323, 'Rosario de Río Grande', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1324, 'San Antonio', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1325, 'San Francisco', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1326, 'San Pedro', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1327, 'San Rafael', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1328, 'San Salvador', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1329, 'Santa Ana', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1330, 'Santa Catalina', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1331, 'Santa Clara', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1332, 'Susques', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1333, 'Tilcara', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1334, 'Tres Cruces', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1335, 'Tumbaya', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1336, 'Valle Grande', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1337, 'Vinalito', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1338, 'Volcán', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1339, 'Yala', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1340, 'Yaví', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1341, 'Yuto', NULL, NULL, NULL, 11);
INSERT INTO public.localidad VALUES (1342, 'Abramo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1343, 'Adolfo Van Praet', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1344, 'Agustoni', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1345, 'Algarrobo del Aguila', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1346, 'Alpachiri', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1347, 'Alta Italia', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1348, 'Anguil', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1349, 'Arata', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1350, 'Ataliva Roca', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1351, 'Bernardo Larroude', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1352, 'Bernasconi', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1353, 'Caleufú', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1354, 'Carro Quemado', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1355, 'Catriló', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1356, 'Ceballos', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1357, 'Chacharramendi', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1358, 'Col. Barón', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1359, 'Col. Santa María', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1360, 'Conhelo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1361, 'Coronel Hilario Lagos', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1362, 'Cuchillo-Có', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1363, 'Doblas', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1364, 'Dorila', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1365, 'Eduardo Castex', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1366, 'Embajador Martini', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1367, 'Falucho', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1368, 'Gral. Acha', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1369, 'Gral. Manuel Campos', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1370, 'Gral. Pico', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1371, 'Guatraché', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1372, 'Ing. Luiggi', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1373, 'Intendente Alvear', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1374, 'Jacinto Arauz', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1375, 'La Adela', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1376, 'La Humada', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1377, 'La Maruja', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1378, '12', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1379, 'La Reforma', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1380, 'Limay Mahuida', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1381, 'Lonquimay', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1382, 'Loventuel', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1383, 'Luan Toro', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1384, 'Macachín', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1385, 'Maisonnave', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1386, 'Mauricio Mayer', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1387, 'Metileo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1388, 'Miguel Cané', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1389, 'Miguel Riglos', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1390, 'Monte Nievas', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1391, 'Parera', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1392, 'Perú', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1393, 'Pichi-Huinca', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1394, 'Puelches', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1395, 'Puelén', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1396, 'Quehue', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1397, 'Quemú Quemú', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1398, 'Quetrequén', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1399, 'Rancul', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1400, 'Realicó', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1401, 'Relmo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1402, 'Rolón', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1403, 'Rucanelo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1404, 'Sarah', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1405, 'Speluzzi', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1406, 'Sta. Isabel', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1407, 'Sta. Rosa', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1408, 'Sta. Teresa', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1409, 'Telén', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1410, 'Toay', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1411, 'Tomas M. de Anchorena', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1412, 'Trenel', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1413, 'Unanue', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1414, 'Uriburu', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1415, 'Veinticinco de Mayo', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1416, 'Vertiz', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1417, 'Victorica', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1418, 'Villa Mirasol', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1419, 'Winifreda', NULL, NULL, NULL, 12);
INSERT INTO public.localidad VALUES (1420, 'Arauco', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1421, 'Capital', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1422, 'Castro Barros', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1423, 'Chamical', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1424, 'Chilecito', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1425, 'Coronel F. Varela', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1426, 'Famatina', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1427, 'Gral. A.V.Peñaloza', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1428, 'Gral. Belgrano', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1429, 'Gral. J.F. Quiroga', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1430, 'Gral. Lamadrid', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1431, 'Gral. Ocampo', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1432, 'Gral. San Martín', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1433, 'Independencia', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1434, 'Rosario Penaloza', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1435, 'San Blas de Los Sauces', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1436, 'Sanagasta', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1437, 'Vinchina', NULL, NULL, NULL, 13);
INSERT INTO public.localidad VALUES (1438, 'Capital', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1439, 'Chacras de Coria', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1440, 'Dorrego', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1441, 'Gllen', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1442, 'Godoy Cruz', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1443, 'Gral. Alvear', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1444, 'Guaymallén', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1445, 'Junín', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1446, 'La Paz', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1447, 'Las Heras', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1448, 'Lavalle', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1449, 'Luján', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1450, 'Luján De Cuyo', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1451, 'Maipú', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1452, 'Malargüe', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1453, 'Rivadavia', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1454, 'San Carlos', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1455, 'San Martín', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1456, 'San Rafael', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1457, 'Sta. Rosa', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1458, 'Tunuyán', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1459, 'Tupungato', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1460, 'Villa Nueva', NULL, NULL, NULL, 14);
INSERT INTO public.localidad VALUES (1461, 'Alba Posse', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1462, 'Almafuerte', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1463, 'Apóstoles', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1464, 'Aristóbulo Del Valle', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1465, 'Arroyo Del Medio', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1466, 'Azara', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1467, 'Bdo. De Irigoyen', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1468, 'Bonpland', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1469, 'Caá Yari', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1470, 'Campo Grande', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1471, 'Campo Ramón', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1472, 'Campo Viera', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1473, 'Candelaria', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1474, 'Capioví', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1475, 'Caraguatay', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1476, 'Cdte. Guacurarí', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1477, 'Cerro Azul', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1478, 'Cerro Corá', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1479, 'Col. Alberdi', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1480, 'Col. Aurora', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1481, 'Col. Delicia', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1482, 'Col. Polana', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1483, 'Col. Victoria', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1484, 'Col. Wanda', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1485, 'Concepción De La Sierra', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1486, 'Corpus', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1487, 'Dos Arroyos', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1488, 'Dos de Mayo', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1489, 'El Alcázar', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1490, 'El Dorado', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1491, 'El Soberbio', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1492, 'Esperanza', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1493, 'F. Ameghino', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1494, 'Fachinal', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1495, 'Garuhapé', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1496, 'Garupá', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1497, 'Gdor. López', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1498, 'Gdor. Roca', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1499, 'Gral. Alvear', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1500, 'Gral. Urquiza', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1501, 'Guaraní', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1502, 'H. Yrigoyen', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1503, 'Iguazú', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1504, 'Itacaruaré', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1505, 'Jardín América', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1506, 'Leandro N. Alem', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1507, 'Libertad', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1508, 'Loreto', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1509, 'Los Helechos', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1510, 'Mártires', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1511, '15', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1512, 'Mojón Grande', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1513, 'Montecarlo', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1514, 'Nueve de Julio', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1515, 'Oberá', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1516, 'Olegario V. Andrade', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1517, 'Panambí', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1518, 'Posadas', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1519, 'Profundidad', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1520, 'Pto. Iguazú', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1521, 'Pto. Leoni', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1522, 'Pto. Piray', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1523, 'Pto. Rico', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1524, 'Ruiz de Montoya', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1525, 'San Antonio', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1526, 'San Ignacio', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1527, 'San Javier', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1528, 'San José', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1529, 'San Martín', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1530, 'San Pedro', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1531, 'San Vicente', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1532, 'Santiago De Liniers', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1533, 'Santo Pipo', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1534, 'Sta. Ana', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1535, 'Sta. María', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1536, 'Tres Capones', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1537, 'Veinticinco de Mayo', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1538, 'Wanda', NULL, NULL, NULL, 15);
INSERT INTO public.localidad VALUES (1539, 'Aguada San Roque', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1540, 'Aluminé', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1541, 'Andacollo', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1542, 'Añelo', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1543, 'Bajada del Agrio', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1544, 'Barrancas', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1545, 'Buta Ranquil', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1546, 'Capital', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1547, 'Caviahué', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1548, 'Centenario', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1549, 'Chorriaca', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1550, 'Chos Malal', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1551, 'Cipolletti', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1552, 'Covunco Abajo', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1553, 'Coyuco Cochico', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1554, 'Cutral Có', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1555, 'El Cholar', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1556, 'El Huecú', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1557, 'El Sauce', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1558, 'Guañacos', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1559, 'Huinganco', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1560, 'Las Coloradas', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1561, 'Las Lajas', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1562, 'Las Ovejas', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1563, 'Loncopué', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1564, 'Los Catutos', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1565, 'Los Chihuidos', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1566, 'Los Miches', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1567, 'Manzano Amargo', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1568, '16', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1569, 'Octavio Pico', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1570, 'Paso Aguerre', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1571, 'Picún Leufú', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1572, 'Piedra del Aguila', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1573, 'Pilo Lil', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1574, 'Plaza Huincul', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1575, 'Plottier', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1576, 'Quili Malal', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1577, 'Ramón Castro', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1578, 'Rincón de Los Sauces', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1579, 'San Martín de Los Andes', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1580, 'San Patricio del Chañar', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1581, 'Santo Tomás', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1582, 'Sauzal Bonito', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1583, 'Senillosa', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1584, 'Taquimilán', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1585, 'Tricao Malal', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1586, 'Varvarco', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1587, 'Villa Curí Leuvu', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1588, 'Villa del Nahueve', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1589, 'Villa del Puente Picún Leuvú', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1590, 'Villa El Chocón', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1591, 'Villa La Angostura', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1592, 'Villa Pehuenia', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1593, 'Villa Traful', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1594, 'Vista Alegre', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1595, 'Zapala', NULL, NULL, NULL, 16);
INSERT INTO public.localidad VALUES (1596, 'Aguada Cecilio', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1597, 'Aguada de Guerra', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1598, 'Allén', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1599, 'Arroyo de La Ventana', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1600, 'Arroyo Los Berros', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1601, 'Bariloche', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1602, 'Calte. Cordero', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1603, 'Campo Grande', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1604, 'Catriel', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1605, 'Cerro Policía', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1606, 'Cervantes', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1607, 'Chelforo', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1608, 'Chimpay', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1609, 'Chinchinales', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1610, 'Chipauquil', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1611, 'Choele Choel', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1612, 'Cinco Saltos', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1613, 'Cipolletti', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1614, 'Clemente Onelli', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1615, 'Colán Conhue', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1616, 'Comallo', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1617, 'Comicó', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1618, 'Cona Niyeu', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1619, 'Coronel Belisle', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1620, 'Cubanea', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1621, 'Darwin', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1622, 'Dina Huapi', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1623, 'El Bolsón', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1624, 'El Caín', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1625, 'El Manso', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1626, 'Gral. Conesa', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1627, 'Gral. Enrique Godoy', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1628, 'Gral. Fernandez Oro', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1629, 'Gral. Roca', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1630, 'Guardia Mitre', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1631, 'Ing. Huergo', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1632, 'Ing. Jacobacci', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1633, 'Laguna Blanca', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1634, 'Lamarque', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1635, 'Las Grutas', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1636, 'Los Menucos', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1637, 'Luis Beltrán', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1638, 'Mainqué', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1639, 'Mamuel Choique', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1640, 'Maquinchao', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1641, 'Mencué', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1642, 'Mtro. Ramos Mexia', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1643, 'Nahuel Niyeu', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1644, 'Naupa Huen', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1645, 'Ñorquinco', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1646, 'Ojos de Agua', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1647, 'Paso de Agua', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1648, 'Paso Flores', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1649, 'Peñas Blancas', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1650, 'Pichi Mahuida', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1651, 'Pilcaniyeu', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1652, 'Pomona', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1653, 'Prahuaniyeu', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1654, 'Rincón Treneta', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1655, 'Río Chico', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1656, 'Río Colorado', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1657, 'Roca', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1658, 'San Antonio Oeste', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1659, 'San Javier', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1660, 'Sierra Colorada', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1661, 'Sierra Grande', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1662, 'Sierra Pailemán', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1663, 'Valcheta', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1664, 'Valle Azul', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1665, 'Viedma', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1666, 'Villa Llanquín', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1667, 'Villa Mascardi', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1668, 'Villa Regina', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1669, 'Yaminué', NULL, NULL, NULL, 17);
INSERT INTO public.localidad VALUES (1670, 'A. Saravia', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1671, 'Aguaray', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1672, 'Angastaco', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1673, 'Animaná', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1674, 'Cachi', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1675, 'Cafayate', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1676, 'Campo Quijano', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1677, 'Campo Santo', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1678, 'Capital', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1679, 'Cerrillos', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1680, 'Chicoana', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1681, 'Col. Sta. Rosa', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1682, 'Coronel Moldes', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1683, 'El Bordo', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1684, 'El Carril', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1685, 'El Galpón', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1686, 'El Jardín', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1687, 'El Potrero', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1688, 'El Quebrachal', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1689, 'El Tala', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1690, 'Embarcación', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1691, 'Gral. Ballivian', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1692, 'Gral. Güemes', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1693, 'Gral. Mosconi', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1694, 'Gral. Pizarro', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1695, 'Guachipas', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1696, 'Hipólito Yrigoyen', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1697, 'Iruyá', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1698, 'Isla De Cañas', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1699, 'J. V. Gonzalez', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1700, 'La Caldera', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1701, 'La Candelaria', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1702, 'La Merced', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1703, 'La Poma', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1704, 'La Viña', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1705, 'Las Lajitas', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1706, 'Los Toldos', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1707, 'Metán', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1708, 'Molinos', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1709, 'Nazareno', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1710, 'Orán', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1711, 'Payogasta', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1712, 'Pichanal', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1713, 'Prof. S. Mazza', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1714, 'Río Piedras', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1715, 'Rivadavia Banda Norte', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1716, 'Rivadavia Banda Sur', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1717, 'Rosario de La Frontera', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1718, 'Rosario de Lerma', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1719, 'Saclantás', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1720, '18', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1721, 'San Antonio', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1722, 'San Carlos', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1723, 'San José De Metán', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1724, 'San Ramón', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1725, 'Santa Victoria E.', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1726, 'Santa Victoria O.', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1727, 'Tartagal', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1728, 'Tolar Grande', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1729, 'Urundel', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1730, 'Vaqueros', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1731, 'Villa San Lorenzo', NULL, NULL, NULL, 18);
INSERT INTO public.localidad VALUES (1732, 'Albardón', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1733, 'Angaco', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1734, 'Calingasta', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1735, 'Capital', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1736, 'Caucete', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1737, 'Chimbas', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1738, 'Iglesia', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1739, 'Jachal', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1740, 'Nueve de Julio', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1741, 'Pocito', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1742, 'Rawson', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1743, 'Rivadavia', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1744, '19', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1745, 'San Martín', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1746, 'Santa Lucía', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1747, 'Sarmiento', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1748, 'Ullum', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1749, 'Valle Fértil', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1750, 'Veinticinco de Mayo', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1751, 'Zonda', NULL, NULL, NULL, 19);
INSERT INTO public.localidad VALUES (1752, 'Alto Pelado', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1753, 'Alto Pencoso', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1754, 'Anchorena', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1755, 'Arizona', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1756, 'Bagual', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1757, 'Balde', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1758, 'Batavia', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1759, 'Beazley', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1760, 'Buena Esperanza', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1761, 'Candelaria', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1762, 'Capital', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1763, 'Carolina', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1764, 'Carpintería', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1765, 'Concarán', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1766, 'Cortaderas', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1767, 'El Morro', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1768, 'El Trapiche', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1769, 'El Volcán', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1770, 'Fortín El Patria', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1771, 'Fortuna', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1772, 'Fraga', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1773, 'Juan Jorba', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1774, 'Juan Llerena', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1775, 'Juana Koslay', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1776, 'Justo Daract', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1777, 'La Calera', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1778, 'La Florida', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1779, 'La Punilla', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1780, 'La Toma', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1781, 'Lafinur', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1782, 'Las Aguadas', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1783, 'Las Chacras', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1784, 'Las Lagunas', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1785, 'Las Vertientes', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1786, 'Lavaisse', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1787, 'Leandro N. Alem', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1788, 'Los Molles', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1789, 'Luján', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1790, 'Mercedes', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1791, 'Merlo', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1792, 'Naschel', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1793, 'Navia', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1794, 'Nogolí', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1795, 'Nueva Galia', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1796, 'Papagayos', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1797, 'Paso Grande', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1798, 'Potrero de Los Funes', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1799, 'Quines', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1800, 'Renca', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1801, 'Saladillo', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1802, 'San Francisco', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1803, 'San Gerónimo', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1804, 'San Martín', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1805, 'San Pablo', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1806, 'Santa Rosa de Conlara', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1807, 'Talita', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1808, 'Tilisarao', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1809, 'Unión', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1810, 'Villa de La Quebrada', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1811, 'Villa de Praga', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1812, 'Villa del Carmen', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1813, 'Villa Gral. Roca', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1814, 'Villa Larca', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1815, 'Villa Mercedes', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1816, 'Zanjitas', NULL, NULL, NULL, 20);
INSERT INTO public.localidad VALUES (1817, 'Calafate', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1818, 'Caleta Olivia', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1819, 'Cañadón Seco', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1820, 'Comandante Piedrabuena', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1821, 'El Calafate', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1822, 'El Chaltén', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1823, 'Gdor. Gregores', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1824, 'Hipólito Yrigoyen', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1825, 'Jaramillo', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1826, 'Koluel Kaike', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1827, 'Las Heras', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1828, 'Los Antiguos', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1829, 'Perito Moreno', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1830, 'Pico Truncado', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1831, 'Pto. Deseado', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1832, 'Pto. San Julián', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1833, 'Pto. 21', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1834, 'Río Cuarto', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1835, 'Río Gallegos', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1836, 'Río Turbio', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1837, 'Tres Lagos', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1838, 'Veintiocho De Noviembre', NULL, NULL, NULL, 21);
INSERT INTO public.localidad VALUES (1839, 'Aarón Castellanos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1840, 'Acebal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1841, 'Aguará Grande', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1842, 'Albarellos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1843, 'Alcorta', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1844, 'Aldao', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1845, 'Alejandra', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1846, 'Álvarez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1847, 'Ambrosetti', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1848, 'Amenábar', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1849, 'Angélica', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1850, 'Angeloni', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1851, 'Arequito', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1852, 'Arminda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1853, 'Armstrong', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1854, 'Arocena', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1855, 'Arroyo Aguiar', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1856, 'Arroyo Ceibal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1857, 'Arroyo Leyes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1858, 'Arroyo Seco', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1859, 'Arrufó', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1860, 'Arteaga', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1861, 'Ataliva', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1862, 'Aurelia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1863, 'Avellaneda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1864, 'Barrancas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1865, 'Bauer Y Sigel', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1866, 'Bella Italia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1867, 'Berabevú', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1868, 'Berna', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1869, 'Bernardo de Irigoyen', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1870, 'Bigand', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1871, 'Bombal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1872, 'Bouquet', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1873, 'Bustinza', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1874, 'Cabal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1875, 'Cacique Ariacaiquin', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1876, 'Cafferata', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1877, 'Calchaquí', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1878, 'Campo Andino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1879, 'Campo Piaggio', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1880, 'Cañada de Gómez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1881, 'Cañada del Ucle', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1882, 'Cañada Rica', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1883, 'Cañada Rosquín', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1884, 'Candioti', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1885, 'Capital', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1886, 'Capitán Bermúdez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1887, 'Capivara', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1888, 'Carcarañá', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1889, 'Carlos Pellegrini', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1890, 'Carmen', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1891, 'Carmen Del Sauce', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1892, 'Carreras', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1893, 'Carrizales', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1894, 'Casalegno', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1895, 'Casas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1896, 'Casilda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1897, 'Castelar', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1898, 'Castellanos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1899, 'Cayastá', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1900, 'Cayastacito', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1901, 'Centeno', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1902, 'Cepeda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1903, 'Ceres', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1904, 'Chabás', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1905, 'Chañar Ladeado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1906, 'Chapuy', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1907, 'Chovet', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1908, 'Christophersen', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1909, 'Classon', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1910, 'Cnel. Arnold', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1911, 'Cnel. Bogado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1912, 'Cnel. Dominguez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1913, 'Cnel. Fraga', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1914, 'Col. Aldao', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1915, 'Col. Ana', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1916, 'Col. Belgrano', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1917, 'Col. Bicha', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1918, 'Col. Bigand', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1919, 'Col. Bossi', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1920, 'Col. Cavour', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1921, 'Col. Cello', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1922, 'Col. Dolores', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1923, 'Col. Dos Rosas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1924, 'Col. Durán', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1925, 'Col. Iturraspe', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1926, 'Col. Margarita', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1927, 'Col. Mascias', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1928, 'Col. Raquel', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1929, 'Col. Rosa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1930, 'Col. San José', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1931, 'Constanza', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1932, 'Coronda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1933, 'Correa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1934, 'Crispi', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1935, 'Cululú', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1936, 'Curupayti', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1937, 'Desvio Arijón', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1938, 'Diaz', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1939, 'Diego de Alvear', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1940, 'Egusquiza', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1941, 'El Arazá', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1942, 'El Rabón', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1943, 'El Sombrerito', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1944, 'El Trébol', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1945, 'Elisa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1946, 'Elortondo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1947, 'Emilia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1948, 'Empalme San Carlos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1949, 'Empalme Villa Constitucion', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1950, 'Esmeralda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1951, 'Esperanza', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1952, 'Estación Alvear', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1953, 'Estacion Clucellas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1954, 'Esteban Rams', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1955, 'Esther', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1956, 'Esustolia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1957, 'Eusebia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1958, 'Felicia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1959, 'Fidela', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1960, 'Fighiera', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1961, 'Firmat', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1962, 'Florencia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1963, 'Fortín Olmos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1964, 'Franck', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1965, 'Fray Luis Beltrán', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1966, 'Frontera', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1967, 'Fuentes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1968, 'Funes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1969, 'Gaboto', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1970, 'Galisteo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1971, 'Gálvez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1972, 'Garabalto', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1973, 'Garibaldi', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1974, 'Gato Colorado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1975, 'Gdor. Crespo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1976, 'Gessler', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1977, 'Godoy', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1978, 'Golondrina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1979, 'Gral. Gelly', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1980, 'Gral. Lagos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1981, 'Granadero Baigorria', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1982, 'Gregoria Perez De Denis', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1983, 'Grutly', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1984, 'Guadalupe N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1985, 'Gödeken', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1986, 'Helvecia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1987, 'Hersilia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1988, 'Hipatía', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1989, 'Huanqueros', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1990, 'Hugentobler', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1991, 'Hughes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1992, 'Humberto 1º', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1993, 'Humboldt', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1994, 'Ibarlucea', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1995, 'Ing. Chanourdie', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1996, 'Intiyaco', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1997, 'Ituzaingó', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1998, 'Jacinto L. Aráuz', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (1999, 'Josefina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2000, 'Juan B. Molina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2001, 'Juan de Garay', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2002, 'Juncal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2003, 'La Brava', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2004, 'La Cabral', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2005, 'La Camila', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2006, 'La Chispa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2007, 'La Clara', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2008, 'La Criolla', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2009, 'La Gallareta', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2010, 'La Lucila', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2011, 'La Pelada', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2012, 'La Penca', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2013, 'La Rubia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2014, 'La Sarita', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2015, 'La Vanguardia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2016, 'Labordeboy', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2017, 'Laguna Paiva', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2018, 'Landeta', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2019, 'Lanteri', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2020, 'Larrechea', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2021, 'Las Avispas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2022, 'Las Bandurrias', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2023, 'Las Garzas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2024, 'Las Palmeras', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2025, 'Las Parejas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2026, 'Las Petacas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2027, 'Las Rosas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2028, 'Las Toscas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2029, 'Las Tunas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2030, 'Lazzarino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2031, 'Lehmann', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2032, 'Llambi Campbell', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2033, 'Logroño', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2034, 'Loma Alta', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2035, 'López', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2036, 'Los Amores', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2037, 'Los Cardos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2038, 'Los Laureles', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2039, 'Los Molinos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2040, 'Los Quirquinchos', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2041, 'Lucio V. Lopez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2042, 'Luis Palacios', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2043, 'Ma. Juana', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2044, 'Ma. Luisa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2045, 'Ma. Susana', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2046, 'Ma. Teresa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2047, 'Maciel', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2048, 'Maggiolo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2049, 'Malabrigo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2050, 'Marcelino Escalada', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2051, 'Margarita', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2052, 'Matilde', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2053, 'Mauá', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2054, 'Máximo Paz', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2055, 'Melincué', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2056, 'Miguel Torres', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2057, 'Moisés Ville', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2058, 'Monigotes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2059, 'Monje', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2060, 'Monte Obscuridad', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2061, 'Monte Vera', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2062, 'Montefiore', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2063, 'Montes de Oca', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2064, 'Murphy', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2065, 'Ñanducita', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2066, 'Naré', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2067, 'Nelson', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2068, 'Nicanor E. Molinas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2069, 'Nuevo Torino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2070, 'Oliveros', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2071, 'Palacios', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2072, 'Pavón', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2073, 'Pavón Arriba', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2074, 'Pedro Gómez Cello', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2075, 'Pérez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2076, 'Peyrano', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2077, 'Piamonte', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2078, 'Pilar', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2079, 'Piñero', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2080, 'Plaza Clucellas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2081, 'Portugalete', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2082, 'Pozo Borrado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2083, 'Progreso', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2084, 'Providencia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2085, 'Pte. Roca', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2086, 'Pueblo Andino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2087, 'Pueblo Esther', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2088, 'Pueblo Gral. San Martín', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2089, 'Pueblo Irigoyen', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2090, 'Pueblo Marini', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2091, 'Pueblo Muñoz', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2092, 'Pueblo Uranga', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2093, 'Pujato', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2094, 'Pujato N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2095, 'Rafaela', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2096, 'Ramayón', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2097, 'Ramona', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2098, 'Reconquista', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2099, 'Recreo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2100, 'Ricardone', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2101, 'Rivadavia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2102, 'Roldán', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2103, 'Romang', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2104, 'Rosario', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2105, 'Rueda', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2106, 'Rufino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2107, 'Sa Pereira', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2108, 'Saguier', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2109, 'Saladero M. Cabal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2110, 'Salto Grande', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2111, 'San Agustín', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2112, 'San Antonio de Obligado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2113, 'San Bernardo (N.J.)', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2114, 'San Bernardo (S.J.)', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2115, 'San Carlos Centro', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2116, 'San Carlos N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2117, 'San Carlos S.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2118, 'San Cristóbal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2119, 'San Eduardo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2120, 'San Eugenio', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2121, 'San Fabián', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2122, 'San Fco. de Santa Fé', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2123, 'San Genaro', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2124, 'San Genaro N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2125, 'San Gregorio', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2126, 'San Guillermo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2127, 'San Javier', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2128, 'San Jerónimo del Sauce', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2129, 'San Jerónimo N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2130, 'San Jerónimo S.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2131, 'San Jorge', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2132, 'San José de La Esquina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2133, 'San José del Rincón', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2134, 'San Justo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2135, 'San Lorenzo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2136, 'San Mariano', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2137, 'San Martín de Las Escobas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2138, 'San Martín N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2139, 'San Vicente', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2140, 'Sancti Spititu', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2141, 'Sanford', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2142, 'Santo Domingo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2143, 'Santo Tomé', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2144, 'Santurce', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2145, 'Sargento Cabral', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2146, 'Sarmiento', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2147, 'Sastre', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2148, 'Sauce Viejo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2149, 'Serodino', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2150, 'Silva', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2151, 'Soldini', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2152, 'Soledad', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2153, 'Soutomayor', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2154, 'Sta. Clara de Buena Vista', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2155, 'Sta. Clara de Saguier', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2156, 'Sta. Isabel', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2157, 'Sta. Margarita', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2158, 'Sta. Maria Centro', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2159, 'Sta. María N.', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2160, 'Sta. Rosa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2161, 'Sta. Teresa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2162, 'Suardi', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2163, 'Sunchales', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2164, 'Susana', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2165, 'Tacuarendí', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2166, 'Tacural', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2167, 'Tartagal', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2168, 'Teodelina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2169, 'Theobald', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2170, 'Timbúes', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2171, 'Toba', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2172, 'Tortugas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2173, 'Tostado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2174, 'Totoras', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2175, 'Traill', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2176, 'Venado Tuerto', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2177, 'Vera', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2178, 'Vera y Pintado', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2179, 'Videla', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2180, 'Vila', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2181, 'Villa Amelia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2182, 'Villa Ana', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2183, 'Villa Cañas', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2184, 'Villa Constitución', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2185, 'Villa Eloísa', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2186, 'Villa Gdor. Gálvez', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2187, 'Villa Guillermina', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2188, 'Villa Minetti', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2189, 'Villa Mugueta', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2190, 'Villa Ocampo', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2191, 'Villa San José', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2192, 'Villa Saralegui', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2193, 'Villa Trinidad', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2194, 'Villada', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2195, 'Virginia', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2196, 'Wheelwright', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2197, 'Zavalla', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2198, 'Zenón Pereira', NULL, NULL, NULL, 22);
INSERT INTO public.localidad VALUES (2199, 'Añatuya', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2200, 'Árraga', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2201, 'Bandera', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2202, 'Bandera Bajada', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2203, 'Beltrán', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2204, 'Brea Pozo', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2205, 'Campo Gallo', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2206, 'Capital', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2207, 'Chilca Juliana', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2208, 'Choya', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2209, 'Clodomira', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2210, 'Col. Alpina', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2211, 'Col. Dora', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2212, 'Col. El Simbolar Robles', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2213, 'El Bobadal', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2214, 'El Charco', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2215, 'El Mojón', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2216, 'Estación Atamisqui', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2217, 'Estación Simbolar', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2218, 'Fernández', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2219, 'Fortín Inca', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2220, 'Frías', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2221, 'Garza', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2222, 'Gramilla', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2223, 'Guardia Escolta', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2224, 'Herrera', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2225, 'Icaño', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2226, 'Ing. Forres', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2227, 'La Banda', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2228, 'La Cañada', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2229, 'Laprida', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2230, 'Lavalle', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2231, 'Loreto', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2232, 'Los Juríes', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2233, 'Los Núñez', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2234, 'Los Pirpintos', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2235, 'Los Quiroga', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2236, 'Los Telares', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2237, 'Lugones', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2238, 'Malbrán', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2239, 'Matara', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2240, 'Medellín', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2241, 'Monte Quemado', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2242, 'Nueva Esperanza', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2243, 'Nueva Francia', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2244, 'Palo Negro', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2245, 'Pampa de Los Guanacos', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2246, 'Pinto', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2247, 'Pozo Hondo', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2248, 'Quimilí', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2249, 'Real Sayana', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2250, 'Sachayoj', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2251, 'San Pedro de Guasayán', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2252, 'Selva', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2253, 'Sol de Julio', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2254, 'Sumampa', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2255, 'Suncho Corral', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2256, 'Taboada', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2257, 'Tapso', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2258, 'Termas de Rio Hondo', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2259, 'Tintina', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2260, 'Tomas Young', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2261, 'Vilelas', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2262, 'Villa Atamisqui', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2263, 'Villa La Punta', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2264, 'Villa Ojo de Agua', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2265, 'Villa Río Hondo', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2266, 'Villa Salavina', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2267, 'Villa Unión', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2268, 'Vilmer', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2269, 'Weisburd', NULL, NULL, NULL, 23);
INSERT INTO public.localidad VALUES (2270, 'Río Grande', NULL, NULL, NULL, 24);
INSERT INTO public.localidad VALUES (2271, 'Tolhuin', NULL, NULL, NULL, 24);
INSERT INTO public.localidad VALUES (2272, 'Ushuaia', NULL, NULL, NULL, 24);
INSERT INTO public.localidad VALUES (2273, 'Acheral', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2274, 'Agua Dulce', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2275, 'Aguilares', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2276, 'Alderetes', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2277, 'Alpachiri', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2278, 'Alto Verde', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2279, 'Amaicha del Valle', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2280, 'Amberes', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2281, 'Ancajuli', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2282, 'Arcadia', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2283, 'Atahona', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2284, 'Banda del Río Sali', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2285, 'Bella Vista', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2286, 'Buena Vista', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2287, 'Burruyacú', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2288, 'Capitán Cáceres', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2289, 'Cevil Redondo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2290, 'Choromoro', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2291, 'Ciudacita', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2292, 'Colalao del Valle', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2293, 'Colombres', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2294, 'Concepción', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2295, 'Delfín Gallo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2296, 'El Bracho', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2297, 'El Cadillal', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2298, 'El Cercado', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2299, 'El Chañar', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2300, 'El Manantial', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2301, 'El Mojón', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2302, 'El Mollar', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2303, 'El Naranjito', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2304, 'El Naranjo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2305, 'El Polear', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2306, 'El Puestito', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2307, 'El Sacrificio', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2308, 'El Timbó', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2309, 'Escaba', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2310, 'Esquina', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2311, 'Estación Aráoz', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2312, 'Famaillá', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2313, 'Gastone', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2314, 'Gdor. Garmendia', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2315, 'Gdor. Piedrabuena', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2316, 'Graneros', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2317, 'Huasa Pampa', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2318, 'J. B. Alberdi', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2319, 'La Cocha', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2320, 'La Esperanza', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2321, 'La Florida', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2322, 'La Ramada', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2323, 'La Trinidad', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2324, 'Lamadrid', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2325, 'Las Cejas', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2326, 'Las Talas', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2327, 'Las Talitas', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2328, 'Los Bulacio', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2329, 'Los Gómez', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2330, 'Los Nogales', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2331, 'Los Pereyra', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2332, 'Los Pérez', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2333, 'Los Puestos', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2334, 'Los Ralos', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2335, 'Los Sarmientos', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2336, 'Los Sosa', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2337, 'Lules', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2338, 'M. García Fernández', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2339, 'Manuela Pedraza', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2340, 'Medinas', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2341, 'Monte Bello', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2342, 'Monteagudo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2343, 'Monteros', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2344, 'Padre Monti', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2345, 'Pampa Mayo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2346, 'Quilmes', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2347, 'Raco', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2348, 'Ranchillos', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2349, 'Río Chico', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2350, 'Río Colorado', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2351, 'Río Seco', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2352, 'Rumi Punco', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2353, 'San Andrés', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2354, 'San Felipe', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2355, 'San Ignacio', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2356, 'San Javier', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2357, 'San José', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2358, 'San Miguel de 25', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2359, 'San Pedro', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2360, 'San Pedro de Colalao', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2361, 'Santa Rosa de Leales', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2362, 'Sgto. Moya', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2363, 'Siete de Abril', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2364, 'Simoca', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2365, 'Soldado Maldonado', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2366, 'Sta. Ana', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2367, 'Sta. Cruz', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2368, 'Sta. Lucía', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2369, 'Taco Ralo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2370, 'Tafí del Valle', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2371, 'Tafí Viejo', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2372, 'Tapia', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2373, 'Teniente Berdina', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2374, 'Trancas', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2375, 'Villa Belgrano', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2376, 'Villa Benjamín Araoz', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2377, 'Villa Chiligasta', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2378, 'Villa de Leales', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2379, 'Villa Quinteros', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2380, 'Yánima', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2381, 'Yerba Buena', NULL, NULL, NULL, 25);
INSERT INTO public.localidad VALUES (2382, 'Yerba Buena (S)', NULL, NULL, NULL, 25);


--
-- Data for Name: postulante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provincia VALUES (1, 'Buenos Aires');
INSERT INTO public.provincia VALUES (2, 'Buenos Aires-GBA');
INSERT INTO public.provincia VALUES (3, 'Capital Federal');
INSERT INTO public.provincia VALUES (4, 'Catamarca');
INSERT INTO public.provincia VALUES (5, 'Chaco');
INSERT INTO public.provincia VALUES (6, 'Chubut');
INSERT INTO public.provincia VALUES (7, 'Córdoba');
INSERT INTO public.provincia VALUES (8, 'Corrientes');
INSERT INTO public.provincia VALUES (9, 'Entre Ríos');
INSERT INTO public.provincia VALUES (10, 'Formosa');
INSERT INTO public.provincia VALUES (11, 'Jujuy');
INSERT INTO public.provincia VALUES (12, 'La Pampa');
INSERT INTO public.provincia VALUES (13, 'La Rioja');
INSERT INTO public.provincia VALUES (14, 'Mendoza');
INSERT INTO public.provincia VALUES (15, 'Misiones');
INSERT INTO public.provincia VALUES (16, 'Neuquén');
INSERT INTO public.provincia VALUES (17, 'Río Negro');
INSERT INTO public.provincia VALUES (18, 'Salta');
INSERT INTO public.provincia VALUES (19, 'San Juan');
INSERT INTO public.provincia VALUES (20, 'San Luis');
INSERT INTO public.provincia VALUES (21, 'Santa Cruz');
INSERT INTO public.provincia VALUES (22, 'Santa Fe');
INSERT INTO public.provincia VALUES (23, 'Santiago del Estero');
INSERT INTO public.provincia VALUES (24, 'Tierra del Fuego');
INSERT INTO public.provincia VALUES (25, 'Tucumán');


--
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.registro VALUES (1, 'admin', 'admin', 'admin@gmail.com', '2018-11-03 00:00:00', '', false, '2018-11-03 00:00:00');
INSERT INTO public.registro VALUES (2, 'gestor', 'gestor', 'gestor@gmail.com', '2018-11-10 00:00:00', '', false, '2018-11-10 00:00:00');
INSERT INTO public.registro VALUES (3, 'estudiante', 'estudiante', 'estudiante@gmail.com', '2018-11-09 00:00:00', '', false, '2018-11-09 00:00:00');


--
-- Data for Name: rendimiento_acad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rendimiento_no_acad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rol VALUES (1, 'estudiante');
INSERT INTO public.rol VALUES (2, 'empresa');
INSERT INTO public.rol VALUES (3, 'gestor');
INSERT INTO public.rol VALUES (4, 'administrador');


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sede VALUES (21, 'Pacheco 460 - Edificio Pto. Moreno', 12, 1611);
INSERT INTO public.sede VALUES (22, '9 de Julio 102', 12, 458);
INSERT INTO public.sede VALUES (23, 'Avda. Roca 743', 12, 473);
INSERT INTO public.sede VALUES (24, 'Pasaje de la Paz 235', 1, 1579);
INSERT INTO public.sede VALUES (25, 'Av. 12 de julio y Rahue', 6, 1595);
INSERT INTO public.sede VALUES (26, 'Quintral S/N Barrio Jardín Botánico', 7, 1601);
INSERT INTO public.sede VALUES (27, 'Monseñor Esandi y Ayacucho', 8, 1665);
INSERT INTO public.sede VALUES (28, 'San Martín 247', 9, 1658);
INSERT INTO public.sede VALUES (29, 'Ruta 151 Km 12,5', 10, 1612);
INSERT INTO public.sede VALUES (30, 'Yrigoyen 2000', 11, 1613);
INSERT INTO public.sede VALUES (31, 'Buenos Aires 1400', 12, 1546);
INSERT INTO public.sede VALUES (32, 'Av. Luis Toschi y Los Arrayanes', 13, 1551);
INSERT INTO public.sede VALUES (33, '25 de Mayo y Reconquista', 14, 1668);
INSERT INTO public.sede VALUES (34, 'Mendoza y Perú', 3, 629);
INSERT INTO public.sede VALUES (35, 'Buenos Aires 1400', 3, 1546);
INSERT INTO public.sede VALUES (36, 'Buenos Aires 1400', 15, 1546);
INSERT INTO public.sede VALUES (37, 'Buenos Aires 1400', 16, 1546);
INSERT INTO public.sede VALUES (38, 'Buenos Aires 1400', 17, 1546);
INSERT INTO public.sede VALUES (39, 'Buenos Aires 1400', 2, 1546);
INSERT INTO public.sede VALUES (40, 'Buenos Aires 1400', 4, 1546);
INSERT INTO public.sede VALUES (41, 'Mendoza y Perú', 5, 629);
INSERT INTO public.sede VALUES (42, 'La Madrid 152', 2, 1550);


--
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo VALUES (2, 'Curso');
INSERT INTO public.tipo VALUES (3, 'Evento');
INSERT INTO public.tipo VALUES (4, 'Bolsa de Trabajo');
INSERT INTO public.tipo VALUES (5, 'Proyecto de Investigación');
INSERT INTO public.tipo VALUES (6, 'Proyecto de Extensión');
INSERT INTO public.tipo VALUES (7, 'Posgrado');
INSERT INTO public.tipo VALUES (1, 'Pasantia');


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, '12345678', '', 'admin', 'admin', true, '', '', 1, '1990-12-05 09:30:00', '\x', '', 4);
INSERT INTO public.usuario VALUES (2, '12345678', '', 'gestor', 'gestor', true, '', '', 1, '1990-05-05 00:00:00', '\x', '', 2);
INSERT INTO public.usuario VALUES (3, '12345678', '', 'estudiante', 'estudiante', true, '', '', 1, '1995-03-02 00:00:00', '\x', '', 3);


--
-- Name: aptitud_id_aptitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aptitud_id_aptitud_seq', 1, false);


--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_carrera_seq', 348, true);


--
-- Name: convocatoria_id_convocatoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.convocatoria_id_convocatoria_seq', 1, false);


--
-- Name: dependencia_id_dependencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dependencia_id_dependencia_seq', 18, true);


--
-- Name: estado_postulante_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_postulante_id_estado_seq', 5, true);


--
-- Name: estudio_id_estudio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudio_id_estudio_seq', 1, false);


--
-- Name: experiencia_laboral_id_experiencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiencia_laboral_id_experiencia_seq', 1, false);


--
-- Name: institucion_id_institucion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institucion_id_institucion_seq', 1, false);


--
-- Name: localidad_id_localidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.localidad_id_localidad_seq', 1, false);


--
-- Name: postulante_id_postulante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postulante_id_postulante_seq', 1, false);


--
-- Name: provincia_id_provincia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provincia_id_provincia_seq', 1, false);


--
-- Name: publicacion_id_publicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publicacion_id_publicacion_seq', 1, false);


--
-- Name: registro_id_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_id_registro_seq', 3, true);


--
-- Name: rendimiento_acad_id_rendimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rendimiento_acad_id_rendimiento_seq', 1, false);


--
-- Name: rendimiento_no_acad_id_rendimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rendimiento_no_acad_id_rendimiento_seq', 1, false);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 4, true);


--
-- Name: sede_id_sede_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sede_id_sede_seq', 42, true);


--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_tipo_seq', 7, true);


--
-- Name: usuario_nombre_foto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_nombre_foto_seq', 1, false);


--
-- Name: abarca abarca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abarca
    ADD CONSTRAINT abarca_pkey PRIMARY KEY (id_abarca);


--
-- Name: aptitud aptitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptitud
    ADD CONSTRAINT aptitud_pkey PRIMARY KEY (id_aptitud);


--
-- Name: carrera_destinada carrera_destinada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera_destinada
    ADD CONSTRAINT carrera_destinada_pkey PRIMARY KEY (id_convocatoria, id_carrera);


--
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id_carrera);


--
-- Name: convocatoria convocatoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatoria
    ADD CONSTRAINT convocatoria_pkey PRIMARY KEY (id_convocatoria);


--
-- Name: dependencia dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependencia
    ADD CONSTRAINT dependencia_pkey PRIMARY KEY (id_dependencia);


--
-- Name: estado_postulante estado_postulante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_postulante
    ADD CONSTRAINT estado_postulante_pkey PRIMARY KEY (id_estado);


--
-- Name: estudio estudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudio
    ADD CONSTRAINT estudio_pkey PRIMARY KEY (id_estudio);


--
-- Name: experiencia_laboral experiencia_laboral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiencia_laboral
    ADD CONSTRAINT experiencia_laboral_pkey PRIMARY KEY (id_experiencia);


--
-- Name: institucion institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id_institucion);


--
-- Name: localidad localidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_pkey PRIMARY KEY (id_localidad);


--
-- Name: postulante postulante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT postulante_pkey PRIMARY KEY (id_postulante);


--
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia);


--
-- Name: publicacion publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT publicacion_pkey PRIMARY KEY (id_publicacion);


--
-- Name: registro registro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT registro_pkey PRIMARY KEY (id_registro);


--
-- Name: rendimiento_acad rendimiento_acad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_acad
    ADD CONSTRAINT rendimiento_acad_pkey PRIMARY KEY (id_rendimiento);


--
-- Name: rendimiento_no_acad rendimiento_no_acad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_no_acad
    ADD CONSTRAINT rendimiento_no_acad_pkey PRIMARY KEY (id_rendimiento);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: sede sede_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (id_sede);


--
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_registro);


--
-- Name: aptitud fk_aptitud_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptitud
    ADD CONSTRAINT fk_aptitud_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: carrera fk_carrera_dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT fk_carrera_dependencia FOREIGN KEY (id_dependencia) REFERENCES public.dependencia(id_dependencia);


--
-- Name: carrera_destinada fk_carrera_destinada_carrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera_destinada
    ADD CONSTRAINT fk_carrera_destinada_carrera FOREIGN KEY (id_carrera) REFERENCES public.carrera(id_carrera);


--
-- Name: carrera_destinada fk_carrera_destinada_convocatoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera_destinada
    ADD CONSTRAINT fk_carrera_destinada_convocatoria FOREIGN KEY (id_convocatoria) REFERENCES public.convocatoria(id_convocatoria);


--
-- Name: convocatoria fk_convocatoria_institucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatoria
    ADD CONSTRAINT fk_convocatoria_institucion FOREIGN KEY (id_institucion) REFERENCES public.institucion(id_institucion);


--
-- Name: convocatoria fk_convocatoria_sede; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatoria
    ADD CONSTRAINT fk_convocatoria_sede FOREIGN KEY (id_sede_pedido) REFERENCES public.sede(id_sede);


--
-- Name: convocatoria fk_convocatoria_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convocatoria
    ADD CONSTRAINT fk_convocatoria_tipo FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo);


--
-- Name: estudio fk_estudio_institucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudio
    ADD CONSTRAINT fk_estudio_institucion FOREIGN KEY (id_institucion) REFERENCES public.institucion(id_institucion);


--
-- Name: estudio fk_estudio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudio
    ADD CONSTRAINT fk_estudio_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: experiencia_laboral fk_experiencia_laboral_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiencia_laboral
    ADD CONSTRAINT fk_experiencia_laboral_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: postulante fk_postulante_convocatoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT fk_postulante_convocatoria FOREIGN KEY (id_convocatoria) REFERENCES public.convocatoria(id_convocatoria);


--
-- Name: postulante fk_postulante_estado_postulante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT fk_postulante_estado_postulante FOREIGN KEY (id_estado) REFERENCES public.estado_postulante(id_estado);


--
-- Name: postulante fk_postulante_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postulante
    ADD CONSTRAINT fk_postulante_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: publicacion fk_publicacion_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT fk_publicacion_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: rendimiento_acad fk_rendimiento_acad_carrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_acad
    ADD CONSTRAINT fk_rendimiento_acad_carrera FOREIGN KEY (id_carrera) REFERENCES public.carrera(id_carrera);


--
-- Name: rendimiento_acad fk_rendimiento_acad_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_acad
    ADD CONSTRAINT fk_rendimiento_acad_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: rendimiento_no_acad fk_rendimiento_no_acad_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_no_acad
    ADD CONSTRAINT fk_rendimiento_no_acad_rol FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: rendimiento_no_acad fk_rendimiento_no_acad_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_no_acad
    ADD CONSTRAINT fk_rendimiento_no_acad_tipo FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo);


--
-- Name: rendimiento_no_acad fk_rendimiento_no_acad_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rendimiento_no_acad
    ADD CONSTRAINT fk_rendimiento_no_acad_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_registro);


--
-- Name: sede fk_sede_dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT fk_sede_dependencia FOREIGN KEY (id_dependencia) REFERENCES public.dependencia(id_dependencia);


--
-- Name: sede fk_sede_localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT fk_sede_localidad FOREIGN KEY (id_localidad) REFERENCES public.localidad(id_localidad);


--
-- Name: usuario fk_usuario_localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_usuario_localidad FOREIGN KEY (id_localidad) REFERENCES public.localidad(id_localidad);


--
-- Name: usuario fk_usuario_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_usuario_registro FOREIGN KEY (id_registro) REFERENCES public.registro(id_registro);


--
-- Name: usuario fk_usuario_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

