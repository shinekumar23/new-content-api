--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-18 01:37:57

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
-- TOC entry 216 (class 1259 OID 16484)
-- Name: assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assets (
    assetid bigint NOT NULL,
    itembody xml NOT NULL,
    responseprocessing xml,
    metadata jsonb,
    refassettypeid smallint NOT NULL,
    markups jsonb,
    editorstate jsonb
);


ALTER TABLE public.assets OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16626)
-- Name: assetstandards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetstandards (
    assetstandardid bigint NOT NULL,
    assetid bigint NOT NULL,
    standardid bigint NOT NULL
);


ALTER TABLE public.assetstandards OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16625)
-- Name: assetstandards_assetstandardid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetstandards_assetstandardid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assetstandards_assetstandardid_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 225
-- Name: assetstandards_assetstandardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetstandards_assetstandardid_seq OWNED BY public.assetstandards.assetstandardid;


--
-- TOC entry 232 (class 1259 OID 16690)
-- Name: assetstylesheets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetstylesheets (
    assetstylesheetid bigint NOT NULL,
    assetid bigint NOT NULL,
    stylesheetid smallint NOT NULL
);


ALTER TABLE public.assetstylesheets OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16689)
-- Name: assetstylesheets_assetstylesheetid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetstylesheets_assetstylesheetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assetstylesheets_assetstylesheetid_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 231
-- Name: assetstylesheets_assetstylesheetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetstylesheets_assetstylesheetid_seq OWNED BY public.assetstylesheets.assetstylesheetid;


--
-- TOC entry 229 (class 1259 OID 16663)
-- Name: assetversions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetversions (
    assetversionid bigint NOT NULL,
    snapshot bytea NOT NULL,
    version smallint NOT NULL,
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    assetid bigint NOT NULL
);


ALTER TABLE public.assetversions OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16662)
-- Name: assetversions_assetversionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetversions_assetversionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assetversions_assetversionid_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 228
-- Name: assetversions_assetversionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetversions_assetversionid_seq OWNED BY public.assetversions.assetversionid;


--
-- TOC entry 241 (class 1259 OID 17295)
-- Name: clusterassets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clusterassets (
    clusterassetid bigint NOT NULL,
    clusterid bigint NOT NULL,
    assetid bigint NOT NULL
);


ALTER TABLE public.clusterassets OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17294)
-- Name: clusterassets_clusterassetid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clusterassets_clusterassetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusterassets_clusterassetid_seq OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 240
-- Name: clusterassets_clusterassetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clusterassets_clusterassetid_seq OWNED BY public.clusterassets.clusterassetid;


--
-- TOC entry 235 (class 1259 OID 17230)
-- Name: clusters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clusters (
    clusterid bigint NOT NULL,
    metadata jsonb
);


ALTER TABLE public.clusters OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17370)
-- Name: forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms (
    formid bigint NOT NULL,
    metadata jsonb
);


ALTER TABLE public.forms OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17369)
-- Name: forms_formid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_formid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_formid_seq OWNER TO postgres;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 245
-- Name: forms_formid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_formid_seq OWNED BY public.forms.formid;


--
-- TOC entry 222 (class 1259 OID 16539)
-- Name: frameworks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.frameworks (
    frameworkid smallint NOT NULL,
    name character varying(500) NOT NULL,
    nativeidregex character varying(500) NOT NULL,
    type character varying(100) NOT NULL,
    source character varying(100) NOT NULL,
    notes character varying(1000),
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    refstatustypeid smallint NOT NULL
);


ALTER TABLE public.frameworks OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16538)
-- Name: frameworks_frameworkid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.frameworks_frameworkid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


ALTER TABLE public.frameworks_frameworkid_seq OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 221
-- Name: frameworks_frameworkid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.frameworks_frameworkid_seq OWNED BY public.frameworks.frameworkid;


--
-- TOC entry 215 (class 1259 OID 16405)
-- Name: json_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.json_table (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    json_data jsonb NOT NULL
);


ALTER TABLE public.json_table OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16404)
-- Name: json_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.json_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.json_table_id_seq OWNER TO postgres;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 214
-- Name: json_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.json_table_id_seq OWNED BY public.json_table.id;


--
-- TOC entry 227 (class 1259 OID 16647)
-- Name: medias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medias (
    mediaid bigint NOT NULL,
    filename character varying(500) NOT NULL,
    url character varying(1000),
    mimetype character varying(100) NOT NULL,
    assetid bigint NOT NULL
);


ALTER TABLE public.medias OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17383)
-- Name: parts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parts (
    partid bigint NOT NULL,
    mintime smallint,
    maxtime smallint,
    allowlatesubmission boolean,
    navigationmode character varying(50),
    metadata jsonb,
    formid bigint NOT NULL,
    sequence smallint NOT NULL
);


ALTER TABLE public.parts OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17382)
-- Name: parts_partid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parts_partid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_partid_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 247
-- Name: parts_partid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parts_partid_seq OWNED BY public.parts.partid;


--
-- TOC entry 220 (class 1259 OID 16509)
-- Name: refassettypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refassettypes (
    refassettypeid smallint NOT NULL,
    description character varying(200) NOT NULL,
    code character varying(50) NOT NULL
);


ALTER TABLE public.refassettypes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16508)
-- Name: refassettypes_refassettypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refassettypes_refassettypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32767
    CACHE 1;


ALTER TABLE public.refassettypes_refassettypeid_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 219
-- Name: refassettypes_refassettypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refassettypes_refassettypeid_seq OWNED BY public.refassettypes.refassettypeid;


--
-- TOC entry 218 (class 1259 OID 16495)
-- Name: refstatustypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refstatustypes (
    refstatustypeid smallint NOT NULL,
    description character varying(200) NOT NULL,
    code character varying(50) NOT NULL
);


ALTER TABLE public.refstatustypes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16494)
-- Name: refstatustypes_refstatustypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refstatustypes_refstatustypeid_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refstatustypes_refstatustypeid_seq OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 217
-- Name: refstatustypes_refstatustypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refstatustypes_refstatustypeid_seq OWNED BY public.refstatustypes.refstatustypeid;


--
-- TOC entry 237 (class 1259 OID 17258)
-- Name: resourcechangelogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcechangelogs (
    resourcechangelogid bigint NOT NULL,
    description character varying(1000) NOT NULL,
    type character varying(100) NOT NULL,
    oldvalue text NOT NULL,
    newvalue text NOT NULL,
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    resourceid bigint NOT NULL
);


ALTER TABLE public.resourcechangelogs OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17257)
-- Name: resourcechangelogs_resourcechangelogid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resourcechangelogs_resourcechangelogid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resourcechangelogs_resourcechangelogid_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 236
-- Name: resourcechangelogs_resourcechangelogid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resourcechangelogs_resourcechangelogid_seq OWNED BY public.resourcechangelogs.resourcechangelogid;


--
-- TOC entry 239 (class 1259 OID 17274)
-- Name: resourcecomments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcecomments (
    resourcecommentid bigint NOT NULL,
    text character varying(1000) NOT NULL,
    type character varying(100) NOT NULL,
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    resourceid bigint NOT NULL
);


ALTER TABLE public.resourcecomments OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17273)
-- Name: resourcecomments_resourcecommentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resourcecomments_resourcecommentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resourcecomments_resourcecommentid_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 238
-- Name: resourcecomments_resourcecommentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resourcecomments_resourcecommentid_seq OWNED BY public.resourcecomments.resourcecommentid;


--
-- TOC entry 234 (class 1259 OID 17210)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    resourceid bigint NOT NULL,
    uniqueid uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying(500),
    language character varying(10),
    displayid character varying(50),
    version smallint,
    qtiformat character varying(10) DEFAULT 3.0 NOT NULL,
    qtimetadata jsonb,
    classificationmetadata jsonb,
    finalizedon timestamp without time zone,
    finalizedby character varying(100),
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    refstatustypeid smallint NOT NULL
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17209)
-- Name: resources_resourceid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_resourceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_resourceid_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 233
-- Name: resources_resourceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_resourceid_seq OWNED BY public.resources.resourceid;


--
-- TOC entry 244 (class 1259 OID 17347)
-- Name: sectionresources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectionresources (
    sectionresourceid bigint NOT NULL,
    sectionid bigint NOT NULL,
    resourceid bigint NOT NULL,
    resourcesequence smallint NOT NULL
);


ALTER TABLE public.sectionresources OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17346)
-- Name: sectionresources_sectionresourceid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectionresources_sectionresourceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sectionresources_sectionresourceid_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 243
-- Name: sectionresources_sectionresourceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectionresources_sectionresourceid_seq OWNED BY public.sectionresources.sectionresourceid;


--
-- TOC entry 242 (class 1259 OID 17314)
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    sectionid bigint NOT NULL,
    mintime smallint,
    maxtime smallint,
    allowlatesubmission boolean,
    metadata jsonb,
    calculator character varying(50),
    parentsectionid bigint,
    partid bigint NOT NULL
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16561)
-- Name: standards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards (
    standardid bigint NOT NULL,
    uniqueid uuid DEFAULT gen_random_uuid() NOT NULL,
    nativeid character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    isleaf boolean DEFAULT false NOT NULL,
    createdon timestamp without time zone DEFAULT clock_timestamp() NOT NULL,
    createdby character varying(100) NOT NULL,
    updatedon timestamp without time zone,
    updatedby character varying(100),
    refstatustypeid smallint NOT NULL,
    frameworkid smallint NOT NULL
);


ALTER TABLE public.standards OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16560)
-- Name: standards_standardid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_standardid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_standardid_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 223
-- Name: standards_standardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_standardid_seq OWNED BY public.standards.standardid;


--
-- TOC entry 230 (class 1259 OID 16679)
-- Name: stylesheets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stylesheets (
    stylesheetid smallint NOT NULL,
    filename character varying(500) NOT NULL,
    url character varying(1000) NOT NULL,
    ismaster boolean NOT NULL,
    islocked boolean NOT NULL
);


ALTER TABLE public.stylesheets OWNER TO postgres;

--
-- TOC entry 3272 (class 2604 OID 16629)
-- Name: assetstandards assetstandardid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstandards ALTER COLUMN assetstandardid SET DEFAULT nextval('public.assetstandards_assetstandardid_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 16693)
-- Name: assetstylesheets assetstylesheetid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstylesheets ALTER COLUMN assetstylesheetid SET DEFAULT nextval('public.assetstylesheets_assetstylesheetid_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 16666)
-- Name: assetversions assetversionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetversions ALTER COLUMN assetversionid SET DEFAULT nextval('public.assetversions_assetversionid_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 17298)
-- Name: clusterassets clusterassetid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusterassets ALTER COLUMN clusterassetid SET DEFAULT nextval('public.clusterassets_clusterassetid_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 16542)
-- Name: frameworks frameworkid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frameworks ALTER COLUMN frameworkid SET DEFAULT nextval('public.frameworks_frameworkid_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16408)
-- Name: json_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.json_table ALTER COLUMN id SET DEFAULT nextval('public.json_table_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16512)
-- Name: refassettypes refassettypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refassettypes ALTER COLUMN refassettypeid SET DEFAULT nextval('public.refassettypes_refassettypeid_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16498)
-- Name: refstatustypes refstatustypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refstatustypes ALTER COLUMN refstatustypeid SET DEFAULT nextval('public.refstatustypes_refstatustypeid_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 17261)
-- Name: resourcechangelogs resourcechangelogid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcechangelogs ALTER COLUMN resourcechangelogid SET DEFAULT nextval('public.resourcechangelogs_resourcechangelogid_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 17277)
-- Name: resourcecomments resourcecommentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcecomments ALTER COLUMN resourcecommentid SET DEFAULT nextval('public.resourcecomments_resourcecommentid_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 17213)
-- Name: resources resourceid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN resourceid SET DEFAULT nextval('public.resources_resourceid_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 17350)
-- Name: sectionresources sectionresourceid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectionresources ALTER COLUMN sectionresourceid SET DEFAULT nextval('public.sectionresources_sectionresourceid_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16564)
-- Name: standards standardid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards ALTER COLUMN standardid SET DEFAULT nextval('public.standards_standardid_seq'::regclass);


--
-- TOC entry 3290 (class 2606 OID 16493)
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (assetid);


--
-- TOC entry 3305 (class 2606 OID 16631)
-- Name: assetstandards assetstandards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstandards
    ADD CONSTRAINT assetstandards_pkey PRIMARY KEY (assetstandardid);


--
-- TOC entry 3317 (class 2606 OID 16695)
-- Name: assetstylesheets assetstylesheets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstylesheets
    ADD CONSTRAINT assetstylesheets_pkey PRIMARY KEY (assetstylesheetid);


--
-- TOC entry 3312 (class 2606 OID 16671)
-- Name: assetversions assetversions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetversions
    ADD CONSTRAINT assetversions_pkey PRIMARY KEY (assetversionid);


--
-- TOC entry 3332 (class 2606 OID 17300)
-- Name: clusterassets clusterassets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusterassets
    ADD CONSTRAINT clusterassets_pkey PRIMARY KEY (clusterassetid);


--
-- TOC entry 3324 (class 2606 OID 17237)
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (clusterid);


--
-- TOC entry 3340 (class 2606 OID 17376)
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (formid);


--
-- TOC entry 3299 (class 2606 OID 16547)
-- Name: frameworks frameworks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frameworks
    ADD CONSTRAINT frameworks_pkey PRIMARY KEY (frameworkid);


--
-- TOC entry 3288 (class 2606 OID 16412)
-- Name: json_table json_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.json_table
    ADD CONSTRAINT json_table_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 16655)
-- Name: medias medias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (mediaid);


--
-- TOC entry 3342 (class 2606 OID 17389)
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (partid);


--
-- TOC entry 3296 (class 2606 OID 16514)
-- Name: refassettypes refassettypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refassettypes
    ADD CONSTRAINT refassettypes_pkey PRIMARY KEY (refassettypeid);


--
-- TOC entry 3294 (class 2606 OID 16500)
-- Name: refstatustypes refstatustypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refstatustypes
    ADD CONSTRAINT refstatustypes_pkey PRIMARY KEY (refstatustypeid);


--
-- TOC entry 3327 (class 2606 OID 17266)
-- Name: resourcechangelogs resourcechangelogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcechangelogs
    ADD CONSTRAINT resourcechangelogs_pkey PRIMARY KEY (resourcechangelogid);


--
-- TOC entry 3330 (class 2606 OID 17282)
-- Name: resourcecomments resourcecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcecomments
    ADD CONSTRAINT resourcecomments_pkey PRIMARY KEY (resourcecommentid);


--
-- TOC entry 3322 (class 2606 OID 17222)
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resourceid);


--
-- TOC entry 3338 (class 2606 OID 17352)
-- Name: sectionresources sectionresources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectionresources
    ADD CONSTRAINT sectionresources_pkey PRIMARY KEY (sectionresourceid);


--
-- TOC entry 3336 (class 2606 OID 17321)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (sectionid);


--
-- TOC entry 3303 (class 2606 OID 16571)
-- Name: standards standards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT standards_pkey PRIMARY KEY (standardid);


--
-- TOC entry 3315 (class 2606 OID 16687)
-- Name: stylesheets stylesheets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stylesheets
    ADD CONSTRAINT stylesheets_pkey PRIMARY KEY (stylesheetid);


--
-- TOC entry 3286 (class 1259 OID 16413)
-- Name: Idx_on_json; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Idx_on_json" ON public.json_table USING gin (json_data jsonb_path_ops);


--
-- TOC entry 3291 (class 1259 OID 16520)
-- Name: fki_asset_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asset_type ON public.assets USING btree (refassettypeid);


--
-- TOC entry 3306 (class 1259 OID 16643)
-- Name: fki_assetstandards_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_assetstandards_asset ON public.assetstandards USING btree (assetid);


--
-- TOC entry 3307 (class 1259 OID 16637)
-- Name: fki_assetstandards_standard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_assetstandards_standard ON public.assetstandards USING btree (standardid);


--
-- TOC entry 3318 (class 1259 OID 16706)
-- Name: fki_assetstylesheets_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_assetstylesheets_asset ON public.assetstylesheets USING btree (assetid);


--
-- TOC entry 3319 (class 1259 OID 16707)
-- Name: fki_assetstylesheets_stylesheet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_assetstylesheets_stylesheet ON public.assetstylesheets USING btree (stylesheetid);


--
-- TOC entry 3313 (class 1259 OID 16677)
-- Name: fki_assetversions_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_assetversions_asset ON public.assetversions USING btree (assetid);


--
-- TOC entry 3333 (class 1259 OID 17311)
-- Name: fki_clusterassets_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_clusterassets_asset ON public.clusterassets USING btree (assetid);


--
-- TOC entry 3334 (class 1259 OID 17312)
-- Name: fki_clusterassets_cluster; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_clusterassets_cluster ON public.clusterassets USING btree (clusterid);


--
-- TOC entry 3297 (class 1259 OID 16553)
-- Name: fki_framework_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_framework_status ON public.frameworks USING btree (refstatustypeid);


--
-- TOC entry 3308 (class 1259 OID 16661)
-- Name: fki_medias_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_medias_asset ON public.medias USING btree (assetid);


--
-- TOC entry 3325 (class 1259 OID 17272)
-- Name: fki_resourcechangelogs_resources; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_resourcechangelogs_resources ON public.resourcechangelogs USING btree (resourceid);


--
-- TOC entry 3328 (class 1259 OID 17288)
-- Name: fki_resourcecomments_resources; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_resourcecomments_resources ON public.resourcecomments USING btree (resourceid);


--
-- TOC entry 3320 (class 1259 OID 17228)
-- Name: fki_resources_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_resources_status ON public.resources USING btree (refstatustypeid);


--
-- TOC entry 3300 (class 1259 OID 16583)
-- Name: fki_standards_framework; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_standards_framework ON public.standards USING btree (frameworkid);


--
-- TOC entry 3301 (class 1259 OID 16577)
-- Name: fki_standards_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_standards_status ON public.standards USING btree (refstatustypeid);


--
-- TOC entry 3292 (class 1259 OID 16523)
-- Name: idx_asset_metadata; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_asset_metadata ON public.assets USING gin (metadata jsonb_path_ops);


--
-- TOC entry 3343 (class 2606 OID 16515)
-- Name: assets asset_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT asset_type FOREIGN KEY (refassettypeid) REFERENCES public.refassettypes(refassettypeid);


--
-- TOC entry 3348 (class 2606 OID 16638)
-- Name: assetstandards assetstandards_asset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstandards
    ADD CONSTRAINT assetstandards_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);


--
-- TOC entry 3349 (class 2606 OID 16632)
-- Name: assetstandards assetstandards_standard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstandards
    ADD CONSTRAINT assetstandards_standard FOREIGN KEY (standardid) REFERENCES public.standards(standardid);


--
-- TOC entry 3354 (class 2606 OID 16696)
-- Name: assetstylesheets assetstylesheets_asset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstylesheets
    ADD CONSTRAINT assetstylesheets_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);


--
-- TOC entry 3355 (class 2606 OID 16701)
-- Name: assetstylesheets assetstylesheets_stylesheet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetstylesheets
    ADD CONSTRAINT assetstylesheets_stylesheet FOREIGN KEY (stylesheetid) REFERENCES public.stylesheets(stylesheetid);


--
-- TOC entry 3352 (class 2606 OID 16672)
-- Name: assetversions assetversions_asset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetversions
    ADD CONSTRAINT assetversions_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);


--
-- TOC entry 3360 (class 2606 OID 17301)
-- Name: clusterassets clusterassets_asset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusterassets
    ADD CONSTRAINT clusterassets_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);


--
-- TOC entry 3361 (class 2606 OID 17306)
-- Name: clusterassets clusterassets_cluster; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusterassets
    ADD CONSTRAINT clusterassets_cluster FOREIGN KEY (clusterid) REFERENCES public.clusters(clusterid);


--
-- TOC entry 3367 (class 2606 OID 17377)
-- Name: forms fk_forms_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT fk_forms_resources FOREIGN KEY (formid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3362 (class 2606 OID 17364)
-- Name: sections fk_parent_sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT fk_parent_sections FOREIGN KEY (parentsectionid) REFERENCES public.sections(sectionid);


--
-- TOC entry 3368 (class 2606 OID 17395)
-- Name: parts fk_parts_forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT fk_parts_forms FOREIGN KEY (formid) REFERENCES public.forms(formid);


--
-- TOC entry 3369 (class 2606 OID 17390)
-- Name: parts fk_parts_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT fk_parts_resources FOREIGN KEY (partid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3365 (class 2606 OID 17353)
-- Name: sectionresources fk_sectionresources_asset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectionresources
    ADD CONSTRAINT fk_sectionresources_asset FOREIGN KEY (sectionid) REFERENCES public.sections(sectionid);


--
-- TOC entry 3366 (class 2606 OID 17358)
-- Name: sectionresources fk_sectionresources_cluster; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectionresources
    ADD CONSTRAINT fk_sectionresources_cluster FOREIGN KEY (resourceid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3363 (class 2606 OID 17400)
-- Name: sections fk_sections_parts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT fk_sections_parts FOREIGN KEY (partid) REFERENCES public.parts(partid) NOT VALID;


--
-- TOC entry 3364 (class 2606 OID 17322)
-- Name: sections fk_sections_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT fk_sections_resources FOREIGN KEY (sectionid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3344 (class 2606 OID 17289)
-- Name: assets fki_assets_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT fki_assets_resources FOREIGN KEY (assetid) REFERENCES public.resources(resourceid) NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 17238)
-- Name: clusters fki_cluster_resource; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT fki_cluster_resource FOREIGN KEY (clusterid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3350 (class 2606 OID 16656)
-- Name: medias fki_medias_assets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT fki_medias_assets FOREIGN KEY (assetid) REFERENCES public.assets(assetid);


--
-- TOC entry 3351 (class 2606 OID 17243)
-- Name: medias fki_medias_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT fki_medias_resources FOREIGN KEY (mediaid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3353 (class 2606 OID 17248)
-- Name: stylesheets fki_stylesheets_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stylesheets
    ADD CONSTRAINT fki_stylesheets_resources FOREIGN KEY (stylesheetid) REFERENCES public.resources(resourceid) NOT VALID;


--
-- TOC entry 3345 (class 2606 OID 16548)
-- Name: frameworks framework_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frameworks
    ADD CONSTRAINT framework_status FOREIGN KEY (refstatustypeid) REFERENCES public.refstatustypes(refstatustypeid);


--
-- TOC entry 3358 (class 2606 OID 17267)
-- Name: resourcechangelogs resourcechangelogs_resource; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcechangelogs
    ADD CONSTRAINT resourcechangelogs_resource FOREIGN KEY (resourceid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3359 (class 2606 OID 17283)
-- Name: resourcecomments resourcecomments_resource; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcecomments
    ADD CONSTRAINT resourcecomments_resource FOREIGN KEY (resourceid) REFERENCES public.resources(resourceid);


--
-- TOC entry 3356 (class 2606 OID 17223)
-- Name: resources resources_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_status FOREIGN KEY (refstatustypeid) REFERENCES public.refstatustypes(refstatustypeid);


--
-- TOC entry 3346 (class 2606 OID 16578)
-- Name: standards standards_framework; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT standards_framework FOREIGN KEY (frameworkid) REFERENCES public.frameworks(frameworkid);


--
-- TOC entry 3347 (class 2606 OID 16572)
-- Name: standards standards_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT standards_status FOREIGN KEY (refstatustypeid) REFERENCES public.refstatustypes(refstatustypeid);


-- Completed on 2023-07-18 01:37:57

--
-- PostgreSQL database dump complete
--

