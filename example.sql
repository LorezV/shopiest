--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: AddressType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AddressType" AS ENUM (
    'DELIVERY',
    'FABRIK'
);


ALTER TYPE public."AddressType" OWNER TO postgres;

--
-- Name: ClothSexEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ClothSexEnum" AS ENUM (
    'MALE',
    'FEMALE',
    'UNISEX'
);


ALTER TYPE public."ClothSexEnum" OWNER TO postgres;

--
-- Name: DeliveryTypeEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DeliveryTypeEnum" AS ENUM (
    'USER',
    'SUPPLIER'
);


ALTER TYPE public."DeliveryTypeEnum" OWNER TO postgres;

--
-- Name: DocumentTypeOfProductEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DocumentTypeOfProductEnum" AS ENUM (
    'MANNEQUIN',
    'PREVIEW'
);


ALTER TYPE public."DocumentTypeOfProductEnum" OWNER TO postgres;

--
-- Name: FabrikResourceOriginTypeEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."FabrikResourceOriginTypeEnum" AS ENUM (
    'TEXTILE',
    'ADDITIONAL_MATERIALS'
);


ALTER TYPE public."FabrikResourceOriginTypeEnum" OWNER TO postgres;

--
-- Name: MannequinPositionEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."MannequinPositionEnum" AS ENUM (
    'UP',
    'DOWN',
    'FULL'
);


ALTER TYPE public."MannequinPositionEnum" OWNER TO postgres;

--
-- Name: MannequinSexEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."MannequinSexEnum" AS ENUM (
    'MALE',
    'FEMALE'
);


ALTER TYPE public."MannequinSexEnum" OWNER TO postgres;

--
-- Name: OrderStageEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."OrderStageEnum" AS ENUM (
    'SEX',
    'CLOTH',
    'SIZE',
    'MODEL',
    'KNOT',
    'TEXTILE',
    'ADDITIONAL_MATERIALS',
    'ARTISTIC_DESCRIPTION',
    'QUANTITY_AND_TIME',
    'ADDITIONAL_SERVICES',
    'PREVIEW'
);


ALTER TYPE public."OrderStageEnum" OWNER TO postgres;

--
-- Name: OrderStatusEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."OrderStatusEnum" AS ENUM (
    'DRAFT',
    'FORMED',
    'IN_WORK',
    'DONE'
);


ALTER TYPE public."OrderStatusEnum" OWNER TO postgres;

--
-- Name: RolesEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RolesEnum" AS ENUM (
    'ADMIN',
    'USER'
);


ALTER TYPE public."RolesEnum" OWNER TO postgres;

--
-- Name: RoomStatusEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RoomStatusEnum" AS ENUM (
    'DISCUSSION',
    'ACTIVE',
    'ARCHIVE'
);


ALTER TYPE public."RoomStatusEnum" OWNER TO postgres;

--
-- Name: ServiceOrderPackagesEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ServiceOrderPackagesEnum" AS ENUM (
    'ADDED',
    'BUSINES'
);


ALTER TYPE public."ServiceOrderPackagesEnum" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AdditionalServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AdditionalServices" (
    id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."AdditionalServices" OWNER TO postgres;

--
-- Name: AdditionalServices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AdditionalServices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AdditionalServices_id_seq" OWNER TO postgres;

--
-- Name: AdditionalServices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AdditionalServices_id_seq" OWNED BY public."AdditionalServices".id;


--
-- Name: Address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Address" (
    id integer NOT NULL,
    user_id integer,
    type public."AddressType" DEFAULT 'DELIVERY'::public."AddressType" NOT NULL,
    name text,
    postcode integer,
    country text,
    region text,
    city text NOT NULL,
    street text,
    house_number integer,
    apartment_number_or_office integer,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    fabrik_id integer
);


ALTER TABLE public."Address" OWNER TO postgres;

--
-- Name: Address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Address_id_seq" OWNER TO postgres;

--
-- Name: Address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;


--
-- Name: Delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Delivery" (
    id integer NOT NULL,
    name text NOT NULL,
    type public."DeliveryTypeEnum" NOT NULL,
    parent_id integer,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."Delivery" OWNER TO postgres;

--
-- Name: Delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Delivery_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Delivery_id_seq" OWNER TO postgres;

--
-- Name: Delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Delivery_id_seq" OWNED BY public."Delivery".id;


--
-- Name: Document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Document" (
    id integer NOT NULL,
    url text NOT NULL,
    name text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    size integer
);


ALTER TABLE public."Document" OWNER TO postgres;

--
-- Name: Document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Document_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Document_id_seq" OWNER TO postgres;

--
-- Name: Document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Document_id_seq" OWNED BY public."Document".id;


--
-- Name: Fabrik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fabrik" (
    id integer NOT NULL,
    name text,
    description text,
    minimum_order_quantity integer,
    capacity integer,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    document_id integer,
    email text NOT NULL,
    inn text NOT NULL,
    password text NOT NULL,
    "phoneNumber" text NOT NULL,
    is_confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Fabrik" OWNER TO postgres;

--
-- Name: FabrikAdditionalServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FabrikAdditionalServices" (
    id integer NOT NULL,
    fabrik_id integer NOT NULL,
    additional_services_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."FabrikAdditionalServices" OWNER TO postgres;

--
-- Name: FabrikAdditionalServices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FabrikAdditionalServices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FabrikAdditionalServices_id_seq" OWNER TO postgres;

--
-- Name: FabrikAdditionalServices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FabrikAdditionalServices_id_seq" OWNED BY public."FabrikAdditionalServices".id;


--
-- Name: FabrikDocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FabrikDocument" (
    id integer NOT NULL,
    fabrik_id integer NOT NULL,
    document_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    description text,
    name text NOT NULL
);


ALTER TABLE public."FabrikDocument" OWNER TO postgres;

--
-- Name: FabrikDocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FabrikDocument_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FabrikDocument_id_seq" OWNER TO postgres;

--
-- Name: FabrikDocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FabrikDocument_id_seq" OWNED BY public."FabrikDocument".id;


--
-- Name: FabrikProduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FabrikProduct" (
    id integer NOT NULL,
    fabrik_id integer NOT NULL,
    product_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."FabrikProduct" OWNER TO postgres;

--
-- Name: FabrikProductFabrikDocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FabrikProductFabrikDocument" (
    id integer NOT NULL,
    fabrik_product_id integer NOT NULL,
    fabrik_document_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."FabrikProductFabrikDocument" OWNER TO postgres;

--
-- Name: FabrikProductFabrikDocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FabrikProductFabrikDocument_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FabrikProductFabrikDocument_id_seq" OWNER TO postgres;

--
-- Name: FabrikProductFabrikDocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FabrikProductFabrikDocument_id_seq" OWNED BY public."FabrikProductFabrikDocument".id;


--
-- Name: FabrikProduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FabrikProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FabrikProduct_id_seq" OWNER TO postgres;

--
-- Name: FabrikProduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FabrikProduct_id_seq" OWNED BY public."FabrikProduct".id;


--
-- Name: FabrikResourceOrigin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FabrikResourceOrigin" (
    id integer NOT NULL,
    type public."FabrikResourceOriginTypeEnum" NOT NULL,
    fabrik_id integer NOT NULL,
    resource_origin_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."FabrikResourceOrigin" OWNER TO postgres;

--
-- Name: FabrikResourceOrigin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FabrikResourceOrigin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FabrikResourceOrigin_id_seq" OWNER TO postgres;

--
-- Name: FabrikResourceOrigin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FabrikResourceOrigin_id_seq" OWNED BY public."FabrikResourceOrigin".id;


--
-- Name: Fabrik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Fabrik_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Fabrik_id_seq" OWNER TO postgres;

--
-- Name: Fabrik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Fabrik_id_seq" OWNED BY public."Fabrik".id;


--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    document_id integer,
    cloth_sex public."ClothSexEnum" NOT NULL,
    product_id integer,
    custom_size character varying(1024),
    custom_model character varying(1024),
    custom_knot character varying(1024),
    custom_textile character varying(1024),
    additional_materials character varying(1024),
    artistic_description character varying(1024),
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    name text,
    status public."OrderStatusEnum" DEFAULT 'DRAFT'::public."OrderStatusEnum" NOT NULL,
    user_id integer,
    stage public."OrderStageEnum" DEFAULT 'SEX'::public."OrderStageEnum" NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    production_time integer DEFAULT 1 NOT NULL,
    additional_materials_origin_id integer,
    textile_origin_id integer,
    token text
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderAdditionalServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderAdditionalServices" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    additional_services_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."OrderAdditionalServices" OWNER TO postgres;

--
-- Name: OrderAdditionalServices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderAdditionalServices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderAdditionalServices_id_seq" OWNER TO postgres;

--
-- Name: OrderAdditionalServices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderAdditionalServices_id_seq" OWNED BY public."OrderAdditionalServices".id;


--
-- Name: OrderFabrik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderFabrik" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    fabrik_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."OrderFabrik" OWNER TO postgres;

--
-- Name: OrderFabrik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderFabrik_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderFabrik_id_seq" OWNER TO postgres;

--
-- Name: OrderFabrik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderFabrik_id_seq" OWNED BY public."OrderFabrik".id;


--
-- Name: OrderPerService; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderPerService" (
    id integer NOT NULL,
    name text NOT NULL,
    phone_number text NOT NULL,
    period integer,
    packet public."ServiceOrderPackagesEnum"
);


ALTER TABLE public."OrderPerService" OWNER TO postgres;

--
-- Name: OrderPerService_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderPerService_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderPerService_id_seq" OWNER TO postgres;

--
-- Name: OrderPerService_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderPerService_id_seq" OWNED BY public."OrderPerService".id;


--
-- Name: OrderSize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderSize" (
    size_id integer NOT NULL,
    order_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."OrderSize" OWNER TO postgres;

--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_id_seq" OWNER TO postgres;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    parent_id integer,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    description text,
    sex public."ClothSexEnum",
    mannequin public."MannequinPositionEnum"
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductDocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductDocument" (
    id integer NOT NULL,
    product_id integer NOT NULL,
    document_id integer NOT NULL,
    type public."DocumentTypeOfProductEnum" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    mannequin_sex public."MannequinSexEnum" DEFAULT 'MALE'::public."MannequinSexEnum" NOT NULL
);


ALTER TABLE public."ProductDocument" OWNER TO postgres;

--
-- Name: ProductDocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProductDocument_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductDocument_id_seq" OWNER TO postgres;

--
-- Name: ProductDocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProductDocument_id_seq" OWNED BY public."ProductDocument".id;


--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_id_seq" OWNER TO postgres;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: ResourceOrigin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ResourceOrigin" (
    id integer NOT NULL,
    materials text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."ResourceOrigin" OWNER TO postgres;

--
-- Name: ResourceOrigin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ResourceOrigin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ResourceOrigin_id_seq" OWNER TO postgres;

--
-- Name: ResourceOrigin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ResourceOrigin_id_seq" OWNED BY public."ResourceOrigin".id;


--
-- Name: Room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Room" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    fabrik_id integer NOT NULL,
    status public."RoomStatusEnum" DEFAULT 'DISCUSSION'::public."RoomStatusEnum" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."Room" OWNER TO postgres;

--
-- Name: Room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Room_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Room_id_seq" OWNER TO postgres;

--
-- Name: Room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Room_id_seq" OWNED BY public."Room".id;


--
-- Name: Size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Size" (
    id integer NOT NULL,
    json jsonb NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."Size" OWNER TO postgres;

--
-- Name: Size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Size_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Size_id_seq" OWNER TO postgres;

--
-- Name: Size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Size_id_seq" OWNED BY public."Size".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    name text,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    document_id integer,
    array_of_delivery_ids integer[] DEFAULT ARRAY[]::integer[],
    is_confirmed boolean DEFAULT false NOT NULL,
    "phoneNumber" text
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserRole" (
    user_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone,
    id integer NOT NULL,
    role_name public."RolesEnum" DEFAULT 'USER'::public."RolesEnum" NOT NULL
);


ALTER TABLE public."UserRole" OWNER TO postgres;

--
-- Name: UserRole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserRole_id_seq" OWNER TO postgres;

--
-- Name: UserRole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserRole_id_seq" OWNED BY public."UserRole".id;


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: AdditionalServices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdditionalServices" ALTER COLUMN id SET DEFAULT nextval('public."AdditionalServices_id_seq"'::regclass);


--
-- Name: Address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);


--
-- Name: Delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery" ALTER COLUMN id SET DEFAULT nextval('public."Delivery_id_seq"'::regclass);


--
-- Name: Document id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Document" ALTER COLUMN id SET DEFAULT nextval('public."Document_id_seq"'::regclass);


--
-- Name: Fabrik id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fabrik" ALTER COLUMN id SET DEFAULT nextval('public."Fabrik_id_seq"'::regclass);


--
-- Name: FabrikAdditionalServices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikAdditionalServices" ALTER COLUMN id SET DEFAULT nextval('public."FabrikAdditionalServices_id_seq"'::regclass);


--
-- Name: FabrikDocument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikDocument" ALTER COLUMN id SET DEFAULT nextval('public."FabrikDocument_id_seq"'::regclass);


--
-- Name: FabrikProduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProduct" ALTER COLUMN id SET DEFAULT nextval('public."FabrikProduct_id_seq"'::regclass);


--
-- Name: FabrikProductFabrikDocument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProductFabrikDocument" ALTER COLUMN id SET DEFAULT nextval('public."FabrikProductFabrikDocument_id_seq"'::regclass);


--
-- Name: FabrikResourceOrigin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikResourceOrigin" ALTER COLUMN id SET DEFAULT nextval('public."FabrikResourceOrigin_id_seq"'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderAdditionalServices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderAdditionalServices" ALTER COLUMN id SET DEFAULT nextval('public."OrderAdditionalServices_id_seq"'::regclass);


--
-- Name: OrderFabrik id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderFabrik" ALTER COLUMN id SET DEFAULT nextval('public."OrderFabrik_id_seq"'::regclass);


--
-- Name: OrderPerService id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderPerService" ALTER COLUMN id SET DEFAULT nextval('public."OrderPerService_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Name: ProductDocument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDocument" ALTER COLUMN id SET DEFAULT nextval('public."ProductDocument_id_seq"'::regclass);


--
-- Name: ResourceOrigin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ResourceOrigin" ALTER COLUMN id SET DEFAULT nextval('public."ResourceOrigin_id_seq"'::regclass);


--
-- Name: Room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Room" ALTER COLUMN id SET DEFAULT nextval('public."Room_id_seq"'::regclass);


--
-- Name: Size id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Size" ALTER COLUMN id SET DEFAULT nextval('public."Size_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: UserRole id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRole" ALTER COLUMN id SET DEFAULT nextval('public."UserRole_id_seq"'::regclass);


--
-- Data for Name: AdditionalServices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AdditionalServices" (id, text, created_at, updated_at, deleted_at) FROM stdin;
2	Шевроны	2023-08-08 23:07:14.703	2023-08-08 23:07:14.703	\N
5	Разработка лекал	2023-08-14 08:06:25.401	2023-08-14 13:05:18	\N
6	Оцифровка лекал	2023-08-14 08:06:25.401	2023-08-14 13:05:30	\N
7	Печать лекал	2023-08-14 08:06:25.401	2023-08-14 13:05:45	\N
8	Раскрой	2023-08-14 08:06:25.401	2023-08-14 13:05:53	\N
9	Пошив образцов	2023-08-14 08:06:25.401	2023-08-14 13:06:04	\N
10	Вышивка промышленная	2023-08-14 08:06:25.401	2023-08-14 13:06:18	\N
11	Шевроны	2023-08-14 08:06:25.401	2023-08-14 13:06:24	\N
12	Нашивка	2023-08-14 08:06:25.401	2023-08-14 13:06:29	\N
13	StepDeliveryNEW	2023-08-15 16:58:14.225	2023-08-15 16:58:14.225	\N
1	Конструированние	2023-08-21 13:26:31.755	2023-08-21 13:26:31.755	\N
3	Экспериментальный цех	2023-08-21 13:26:31.776	2023-08-21 13:26:31.776	\N
4	Разработка программы для ЧПУ	2023-08-21 13:26:31.785	2023-08-21 13:26:31.785	\N
14	Градация лекал	2023-08-21 13:26:31.848	2023-08-21 13:26:31.848	\N
15	Разработка технологических карт	2023-08-21 13:26:31.853	2023-08-21 13:26:31.853	\N
16	Консультация конструктора и дизайнера	2023-08-21 13:26:31.858	2023-08-21 13:26:31.858	\N
17	Консультация конструктора и дизайнера	2023-08-21 13:26:31.863	2023-08-21 13:26:31.863	\N
18	Консультация технолога	2023-08-21 13:26:31.871	2023-08-21 13:26:31.871	\N
19	Подбор тканей	2023-08-21 13:26:31.882	2023-08-21 13:26:31.882	\N
20	Подбор фурнитуры	2023-08-21 13:26:31.888	2023-08-21 13:26:31.888	\N
21	Подбор красок	2023-08-21 13:26:31.892	2023-08-21 13:26:31.892	\N
22	Документация техническая	2023-08-21 13:26:31.897	2023-08-21 13:26:31.897	\N
23	Оформление документации	2023-08-21 13:26:31.902	2023-08-21 13:26:31.902	\N
24	Сертификация	2023-08-21 13:26:31.908	2023-08-21 13:26:31.908	\N
25	Добровольный сертификат и другие документы	2023-08-21 13:26:31.912	2023-08-21 13:26:31.912	\N
26	Разработка технических условий	2023-08-21 13:26:31.917	2023-08-21 13:26:31.917	\N
27	Паспорт безопасности	2023-08-21 13:26:31.922	2023-08-21 13:26:31.922	\N
28	Экспертное заключение	2023-08-21 13:26:31.928	2023-08-21 13:26:31.928	\N
29	Нотификация	2023-08-21 13:26:31.933	2023-08-21 13:26:31.933	\N
30	Перемаркировка (перешив бирок)	2023-08-21 13:26:31.938	2023-08-21 13:26:31.938	\N
31	Маркировка бирки	2023-08-21 13:26:31.947	2023-08-21 13:26:31.947	\N
32	Маркировка изделий вшивными бирками	2023-08-21 13:26:31.953	2023-08-21 13:26:31.953	\N
33	Маркировка в системе ЧЗ	2023-08-21 13:26:31.958	2023-08-21 13:26:31.958	\N
34	Перемотка ткани	2023-08-21 13:26:31.963	2023-08-21 13:26:31.963	\N
35	Дублирование тканей	2023-08-21 13:26:31.969	2023-08-21 13:26:31.969	\N
36	Стежка тканей	2023-08-21 13:26:31.974	2023-08-21 13:26:31.974	\N
37	Петли	2023-08-21 13:26:31.979	2023-08-21 13:26:31.979	\N
38	Брендирование	2023-08-21 13:26:31.984	2023-08-21 13:26:31.984	\N
39	Печать принтов	2023-08-21 13:26:31.988	2023-08-21 13:26:31.988	\N
40	Шелкография	2023-08-21 13:26:31.993	2023-08-21 13:26:31.993	\N
41	Сублимационная печать	2023-08-21 13:26:31.998	2023-08-21 13:26:31.998	\N
42	Термотрансферная печать	2023-08-21 13:26:32.003	2023-08-21 13:26:32.003	\N
43	Печать по Pantone	2023-08-21 13:26:32.009	2023-08-21 13:26:32.009	\N
44	Водные и вытравные красители	2023-08-21 13:26:32.019	2023-08-21 13:26:32.019	\N
45	Безопасные красители	2023-08-21 13:26:32.025	2023-08-21 13:26:32.025	\N
46	Промышленная аппликации	2023-08-21 13:26:32.032	2023-08-21 13:26:32.032	\N
47	Ручная вышивка	2023-08-21 13:26:32.038	2023-08-21 13:26:32.038	\N
48	Вышивка камнями и стразами 	2023-08-21 13:26:32.043	2023-08-21 13:26:32.043	\N
49	Вышивка шнуром	2023-08-21 13:26:32.049	2023-08-21 13:26:32.049	\N
50	Вышивка пайетками	2023-08-21 13:26:32.055	2023-08-21 13:26:32.055	\N
51	Люверсы	2023-08-21 13:26:32.06	2023-08-21 13:26:32.06	\N
52	Изготовление плиссе гофре для юбок, платьев и др. одежды	2023-08-21 13:26:32.067	2023-08-21 13:26:32.067	\N
53	Вязание	2023-08-21 13:26:32.073	2023-08-21 13:26:32.073	\N
54	Герметизация швов	2023-08-21 13:26:32.078	2023-08-21 13:26:32.078	\N
55	Аппаратная установка пуговиц	2023-08-21 13:26:32.083	2023-08-21 13:26:32.083	\N
56	Проклейка швов	2023-08-21 13:26:32.089	2023-08-21 13:26:32.089	\N
57	Варка 	2023-08-21 13:26:32.093	2023-08-21 13:26:32.093	\N
58	Крашение	2023-08-21 13:26:32.098	2023-08-21 13:26:32.098	\N
59	Stonewash	2023-08-21 13:26:32.103	2023-08-21 13:26:32.103	\N
60	Biostoning	2023-08-21 13:26:32.109	2023-08-21 13:26:32.109	\N
61	Водоотталкивающая обработка	2023-08-21 13:26:32.115	2023-08-21 13:26:32.115	\N
62	Механическая деформация	2023-08-21 13:26:32.119	2023-08-21 13:26:32.119	\N
63	Flatlock	2023-08-21 13:26:32.124	2023-08-21 13:26:32.124	\N
64	Тиснение	2023-08-21 13:26:32.129	2023-08-21 13:26:32.129	\N
65	ВТО (влажная тепловая обработка)	2023-08-21 13:26:32.136	2023-08-21 13:26:32.136	\N
66	Декатировка тканей и трикотажа (то же что ВТО)	2023-08-21 13:26:32.144	2023-08-21 13:26:32.144	\N
67	Печать составников и лейблов	2023-08-21 13:26:32.15	2023-08-21 13:26:32.15	\N
68	Этикетки	2023-08-21 13:26:32.155	2023-08-21 13:26:32.155	\N
69	Штрих-коды	2023-08-21 13:26:32.16	2023-08-21 13:26:32.16	\N
70	Упаковка	2023-08-21 13:26:32.167	2023-08-21 13:26:32.167	\N
71	Маркировка и отгрузка по нормативам маркетплейсов	2023-08-21 13:26:32.171	2023-08-21 13:26:32.171	\N
72	Лазерная обработка	2023-08-21 13:26:32.176	2023-08-21 13:26:32.176	\N
73	Обрезка края холодным способом	2023-08-21 13:26:32.18	2023-08-21 13:26:32.18	\N
74	Видео-отчеты по запросу	2023-08-21 13:26:32.186	2023-08-21 13:26:32.186	\N
\.


--
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Address" (id, user_id, type, name, postcode, country, region, city, street, house_number, apartment_number_or_office, created_at, updated_at, deleted_at, fabrik_id) FROM stdin;
69	\N	FABRIK	\N	\N	\N	\N	Оренбург	\N	\N	\N	2023-08-09 08:52:59.943	2023-08-09 08:52:59.943	\N	2
70	\N	FABRIK	\N	\N	\N	\N	Орск	\N	\N	\N	2023-08-09 08:53:05.296	2023-08-09 08:53:05.296	\N	2
71	\N	FABRIK	\N	\N	\N	\N	Москва	\N	\N	\N	2023-08-09 08:53:10.147	2023-08-09 08:53:10.147	\N	2
\.


--
-- Data for Name: Delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Delivery" (id, name, type, parent_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: Document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Document" (id, url, name, created_at, updated_at, deleted_at, size) FROM stdin;
497	8deed3ce-cc6c-4c9f-8546-dc1278066b7b.jpg	8deed3ce-cc6c-4c9f-8546-dc1278066b7b.jpg	2023-08-10 09:54:39.063	2023-08-10 09:54:39.063	\N	44119
514	./static/e771cfb2-43eb-4a2b-9c2f-38aa9f5deab7.pdf	e771cfb2-43eb-4a2b-9c2f-38aa9f5deab7.pdf	2023-08-13 15:42:06.61	2023-08-13 15:42:06.61	\N	13425
531	static/c61d2c02-e508-4c4d-a11d-7e81951f910d.pdf	c61d2c02-e508-4c4d-a11d-7e81951f910d.pdf	2023-08-15 06:39:25.708	2023-08-15 06:39:25.708	\N	15659
532	static/c0a4009a-f26d-4b77-ad46-c217270677f8.pdf	c0a4009a-f26d-4b77-ad46-c217270677f8.pdf	2023-08-15 06:50:08.098	2023-08-15 06:50:08.098	\N	15659
550	10ce686b-471c-4d36-8e36-ce5f5b23cbd7.jpg	10ce686b-471c-4d36-8e36-ce5f5b23cbd7.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	189182
551	6686fc87-dee7-43d0-9417-08f371ff9f2b.jpg	6686fc87-dee7-43d0-9417-08f371ff9f2b.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	31600
552	24edddf8-183f-4577-b106-3f9692843f3e.jpg	24edddf8-183f-4577-b106-3f9692843f3e.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	21567
553	40831695-2f7d-42a1-9118-11fc2f8e42f0.jpg	40831695-2f7d-42a1-9118-11fc2f8e42f0.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	541053
554	7df99656-c9f6-49b8-9f02-9130077d6d74.jpg	7df99656-c9f6-49b8-9f02-9130077d6d74.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	28077
555	1ca70f6b-a23e-4451-9906-3e6b616432b4.jpg	1ca70f6b-a23e-4451-9906-3e6b616432b4.jpg	2023-08-17 13:15:52.772	2023-08-17 13:15:52.772	\N	30381
498	67e2fd29-2092-4bd0-a462-b0cf41e58105.jpg	67e2fd29-2092-4bd0-a462-b0cf41e58105.jpg	2023-08-10 10:23:56.745	2023-08-10 10:23:56.745	\N	44119
515	./static/3460ec48-7482-48ba-bd6e-545ea5a64f5a.pdf	3460ec48-7482-48ba-bd6e-545ea5a64f5a.pdf	2023-08-13 15:43:46.003	2023-08-13 15:43:46.003	\N	12955
533	27f1c9f7-1ef3-4588-a245-9d32454b424f.jpg	27f1c9f7-1ef3-4588-a245-9d32454b424f.jpg	2023-08-15 07:04:39.168	2023-08-15 07:04:39.168	\N	113319
556	static/2c32ae1a-b8a6-455b-a8b9-08666149739c.pdf	2c32ae1a-b8a6-455b-a8b9-08666149739c.pdf	2023-08-18 09:54:13.217	2023-08-18 09:54:13.217	\N	13836
231	e8baa244-49a3-4c97-88dd-d5cc9b65d50b.pdf	e8baa244-49a3-4c97-88dd-d5cc9b65d50b.pdf	2023-07-05 09:45:55.969	2023-07-05 09:45:55.969	\N	\N
232	50e74a04-9d87-4bec-af30-3d0638a1d986.pdf	50e74a04-9d87-4bec-af30-3d0638a1d986.pdf	2023-07-05 09:46:09.569	2023-07-05 09:46:09.569	\N	\N
255	d38eb9be-ab65-4407-abc9-7011260bba69.pdf	d38eb9be-ab65-4407-abc9-7011260bba69.pdf	2023-07-05 10:31:29.465	2023-07-05 10:31:29.465	\N	\N
256	683c181b-84b9-4c5d-8620-3d801d2d4942.pdf	683c181b-84b9-4c5d-8620-3d801d2d4942.pdf	2023-07-05 10:33:00.401	2023-07-05 10:33:00.401	\N	\N
262	14befe2c-6c13-4645-b583-40b2af1ef718.pdf	14befe2c-6c13-4645-b583-40b2af1ef718.pdf	2023-07-05 11:12:59.064	2023-07-05 11:12:59.064	\N	\N
296	fba5f66f-6214-4910-a408-a923fe01d2b0.pdf	fba5f66f-6214-4910-a408-a923fe01d2b0.pdf	2023-07-05 11:28:34.239	2023-07-05 11:28:34.239	\N	\N
297	3f4fbec6-cb8b-4fa0-b863-575515a734f6.pdf	3f4fbec6-cb8b-4fa0-b863-575515a734f6.pdf	2023-07-05 11:28:37.406	2023-07-05 11:28:37.406	\N	\N
298	4ccf4310-7dda-4a6f-b4d0-3b5eaae73f25.pdf	4ccf4310-7dda-4a6f-b4d0-3b5eaae73f25.pdf	2023-07-05 11:29:37.822	2023-07-05 11:29:37.822	\N	\N
299	391fe0bc-b200-4c9b-b16b-20d0717aa11e.pdf	391fe0bc-b200-4c9b-b16b-20d0717aa11e.pdf	2023-07-05 11:29:52.596	2023-07-05 11:29:52.596	\N	\N
300	6a4220dd-2738-418c-a253-f47e34d2f01b.pdf	6a4220dd-2738-418c-a253-f47e34d2f01b.pdf	2023-07-05 11:30:15.867	2023-07-05 11:30:15.867	\N	\N
301	fa09a82e-cf01-4312-a999-b72b0a8747ce.pdf	fa09a82e-cf01-4312-a999-b72b0a8747ce.pdf	2023-07-05 11:30:43.795	2023-07-05 11:30:43.795	\N	\N
499	./static/9c4daf8f-3af0-40e6-be0f-55e17bc3be6d.pdf	9c4daf8f-3af0-40e6-be0f-55e17bc3be6d.pdf	2023-08-11 05:59:44.31	2023-08-11 05:59:44.31	\N	12807
516	./static/0d611ca4-9c9b-420b-930b-69265631d200.pdf	0d611ca4-9c9b-420b-930b-69265631d200.pdf	2023-08-14 05:48:15.203	2023-08-14 05:48:15.203	\N	12596
534	static/a2897921-19e8-4c72-a1dc-ff5fe1615817.pdf	a2897921-19e8-4c72-a1dc-ff5fe1615817.pdf	2023-08-15 10:36:18.962	2023-08-15 10:36:18.962	\N	12609
557	static/1b0308e1-b013-4e12-845d-0364b47fe13d.pdf	1b0308e1-b013-4e12-845d-0364b47fe13d.pdf	2023-08-18 10:09:51.624	2023-08-18 10:09:51.624	\N	12550
500	./static/562b898f-bfde-44d0-aa3b-4ab645602efb.pdf	562b898f-bfde-44d0-aa3b-4ab645602efb.pdf	2023-08-11 09:41:57.823	2023-08-11 09:41:57.823	\N	12807
501	./static/4f54d103-5a21-43c7-a657-b0e15dddc83c.pdf	4f54d103-5a21-43c7-a657-b0e15dddc83c.pdf	2023-08-11 09:42:07.066	2023-08-11 09:42:07.066	\N	12807
517	./static/84181aed-72eb-4e6a-be6d-da0b5b304bdd.pdf	84181aed-72eb-4e6a-be6d-da0b5b304bdd.pdf	2023-08-14 07:26:37.277	2023-08-14 07:26:37.277	\N	13072
535	static/91dd6dfa-7b33-45b9-a11b-85cc1b3fe722.pdf	91dd6dfa-7b33-45b9-a11b-85cc1b3fe722.pdf	2023-08-15 11:15:45.613	2023-08-15 11:15:45.613	\N	12643
558	static/262ee057-62c5-4e86-8f7a-07e40705d979.pdf	262ee057-62c5-4e86-8f7a-07e40705d979.pdf	2023-08-18 10:47:01.418	2023-08-18 10:47:01.418	\N	13431
233	55458849-4c36-4973-b922-0a0336b9c777.pdf	55458849-4c36-4973-b922-0a0336b9c777.pdf	2023-07-05 09:58:12.536	2023-07-05 09:58:12.536	\N	\N
257	79f5351b-0bc0-4640-9f74-abd33e5eaf8a.pdf	79f5351b-0bc0-4640-9f74-abd33e5eaf8a.pdf	2023-07-05 10:33:02.035	2023-07-05 10:33:02.035	\N	\N
263	2d9b7c8e-c35e-4822-a6fb-54da95d4af93.pdf	2d9b7c8e-c35e-4822-a6fb-54da95d4af93.pdf	2023-07-05 11:13:10.074	2023-07-05 11:13:10.074	\N	\N
264	f1c1c706-30d7-49b6-9cc4-49e19f2a0fd7.pdf	f1c1c706-30d7-49b6-9cc4-49e19f2a0fd7.pdf	2023-07-05 11:13:27.249	2023-07-05 11:13:27.249	\N	\N
265	18e36d19-b2d5-422a-aa34-a7283e94702b.pdf	18e36d19-b2d5-422a-aa34-a7283e94702b.pdf	2023-07-05 11:13:56.318	2023-07-05 11:13:56.318	\N	\N
266	422014b5-88a1-4161-bd31-93e1234e2f84.pdf	422014b5-88a1-4161-bd31-93e1234e2f84.pdf	2023-07-05 11:15:32.988	2023-07-05 11:15:32.988	\N	\N
267	1428db2c-2be8-4d55-bce0-3c22a240d7f2.pdf	1428db2c-2be8-4d55-bce0-3c22a240d7f2.pdf	2023-07-05 11:15:35.858	2023-07-05 11:15:35.858	\N	\N
502	./static/60b8c407-389c-4443-bbec-bbe048deb4d1.pdf	60b8c407-389c-4443-bbec-bbe048deb4d1.pdf	2023-08-11 10:16:50.181	2023-08-11 10:16:50.181	\N	12807
518	./static/72b61991-4627-477f-98ed-c2310de34f1a.pdf	72b61991-4627-477f-98ed-c2310de34f1a.pdf	2023-08-14 08:12:40.071	2023-08-14 08:12:40.071	\N	12807
536	2e8a42f6-c00f-46e9-8f3c-737c6336d323.jpg	2e8a42f6-c00f-46e9-8f3c-737c6336d323.jpg	2023-08-15 19:34:19.294	2023-08-15 19:34:19.294	\N	189182
537	a05aaf32-cca8-48cf-88ed-a410b5d832e3.jpg	a05aaf32-cca8-48cf-88ed-a410b5d832e3.jpg	2023-08-15 19:34:19.294	2023-08-15 19:34:19.294	\N	31600
538	4eb8cd21-dd35-4fe6-853c-36aca017b1e5.jpg	4eb8cd21-dd35-4fe6-853c-36aca017b1e5.jpg	2023-08-15 19:34:19.294	2023-08-15 19:34:19.294	\N	541053
539	7b75b275-9d7d-4e8d-bcf8-a6c10f555925.jpg	7b75b275-9d7d-4e8d-bcf8-a6c10f555925.jpg	2023-08-15 19:34:19.294	2023-08-15 19:34:19.294	\N	28077
559	static/c8c72a2a-4608-4e83-a103-912f4038661b.pdf	c8c72a2a-4608-4e83-a103-912f4038661b.pdf	2023-08-18 11:27:29.727	2023-08-18 11:27:29.727	\N	13371
234	36330dec-9b18-4d81-a61b-97b18375d44c.pdf	36330dec-9b18-4d81-a61b-97b18375d44c.pdf	2023-07-05 09:59:11.047	2023-07-05 09:59:11.047	\N	\N
235	a5028b2d-7615-4981-8b60-c5a53608fb06.pdf	a5028b2d-7615-4981-8b60-c5a53608fb06.pdf	2023-07-05 10:02:43.675	2023-07-05 10:02:43.675	\N	\N
236	617afe34-25a8-4c86-8bd1-efa92f3c9c91.pdf	617afe34-25a8-4c86-8bd1-efa92f3c9c91.pdf	2023-07-05 10:03:42.227	2023-07-05 10:03:42.227	\N	\N
237	d0e798f7-6b73-4b29-9207-8c768f6fdca0.pdf	d0e798f7-6b73-4b29-9207-8c768f6fdca0.pdf	2023-07-05 10:04:26.148	2023-07-05 10:04:26.148	\N	\N
238	54be07e9-03a0-44b2-9a02-c1396bb0f0de.pdf	54be07e9-03a0-44b2-9a02-c1396bb0f0de.pdf	2023-07-05 10:04:58.45	2023-07-05 10:04:58.45	\N	\N
241	cb08d228-ae69-48e2-8b66-42295e250498.pdf	cb08d228-ae69-48e2-8b66-42295e250498.pdf	2023-07-05 10:08:30.362	2023-07-05 10:08:30.362	\N	\N
503	./static/81c05af2-7182-4ad1-bbe1-dfe0a8cf8f46.pdf	81c05af2-7182-4ad1-bbe1-dfe0a8cf8f46.pdf	2023-08-11 10:20:03.626	2023-08-11 10:20:03.626	\N	12807
504	./static/5181a57a-6259-4f59-8d63-5ed7745c61cc.pdf	5181a57a-6259-4f59-8d63-5ed7745c61cc.pdf	2023-08-11 10:20:30.085	2023-08-11 10:20:30.085	\N	12807
519	./static/d3cd73f3-1bd5-495e-85cf-c930052e2f6e.pdf	d3cd73f3-1bd5-495e-85cf-c930052e2f6e.pdf	2023-08-14 08:17:19.06	2023-08-14 08:17:19.06	\N	12990
540	static/1091a2dd-2a39-4da0-9878-342bef9394c3.pdf	1091a2dd-2a39-4da0-9878-342bef9394c3.pdf	2023-08-15 20:06:36.856	2023-08-15 20:06:36.856	\N	13557
560	static/91e3c34e-7fa5-46cc-8470-8971651cdf3e.pdf	91e3c34e-7fa5-46cc-8470-8971651cdf3e.pdf	2023-08-19 12:32:11.76	2023-08-19 12:32:11.76	\N	13830
505	./static/fe6d8022-4971-40f2-9f57-cbbeaf7582df.pdf	fe6d8022-4971-40f2-9f57-cbbeaf7582df.pdf	2023-08-11 11:09:22.442	2023-08-11 11:09:22.442	\N	12807
520	./static/ff5ccdf1-0e60-42da-baf3-b7a2e0e46835.pdf	ff5ccdf1-0e60-42da-baf3-b7a2e0e46835.pdf	2023-08-14 09:05:22.143	2023-08-14 09:05:22.143	\N	12807
521	./static/a71166cd-a88f-4b9c-9657-c247395c23c9.pdf	a71166cd-a88f-4b9c-9657-c247395c23c9.pdf	2023-08-14 09:05:44.902	2023-08-14 09:05:44.902	\N	12807
541	static/a88082c9-78da-485c-9dfa-1f2e443d7a41.pdf	a88082c9-78da-485c-9dfa-1f2e443d7a41.pdf	2023-08-16 06:13:04.741	2023-08-16 06:13:04.741	\N	15659
561	static/9e8743ba-ad1d-4603-b7e0-61cf698ecf21.pdf	9e8743ba-ad1d-4603-b7e0-61cf698ecf21.pdf	2023-08-21 05:36:13.721	2023-08-21 05:36:13.721	\N	12908
562	static/cc13e27b-4189-40f9-9165-d0dcf4c3cf10.pdf	cc13e27b-4189-40f9-9165-d0dcf4c3cf10.pdf	2023-08-21 05:43:24.629	2023-08-21 05:43:24.629	\N	12908
506	./static/7eda5d8d-95b7-4e7d-b083-bada1653c471.pdf	7eda5d8d-95b7-4e7d-b083-bada1653c471.pdf	2023-08-11 11:26:05.539	2023-08-11 11:26:05.539	\N	12807
507	./static/220af138-c481-4c4f-a8a6-5e1d6bad438c.pdf	220af138-c481-4c4f-a8a6-5e1d6bad438c.pdf	2023-08-11 11:30:44.983	2023-08-11 11:30:44.983	\N	12807
509	./static/d7bcae10-702d-4bed-95be-c3f49c0f98f8.pdf	d7bcae10-702d-4bed-95be-c3f49c0f98f8.pdf	2023-08-11 12:03:08.906	2023-08-11 12:03:08.906	\N	12807
522	./static/2306e73f-b6c5-4e0b-b590-7e434d96d674.pdf	2306e73f-b6c5-4e0b-b590-7e434d96d674.pdf	2023-08-14 09:52:37.131	2023-08-14 09:52:37.131	\N	12807
542	static/620f0b95-a6ed-4009-9301-cfb80399bf98.pdf	620f0b95-a6ed-4009-9301-cfb80399bf98.pdf	2023-08-16 14:14:57.38	2023-08-16 14:14:57.38	\N	13034
563	f6d610db-377c-4503-8a2b-825efde70b66.jpg	f6d610db-377c-4503-8a2b-825efde70b66.jpg	2023-08-21 07:35:18.96	2023-08-21 07:35:18.96	\N	113319
564	216a841c-43aa-41bf-9016-bb7570e46f31.jpg	216a841c-43aa-41bf-9016-bb7570e46f31.jpg	2023-08-21 07:36:10.017	2023-08-21 07:36:10.017	\N	55287
565	0e4a5f7f-8c97-462c-95e3-4e970e60fb3a.jpg	0e4a5f7f-8c97-462c-95e3-4e970e60fb3a.jpg	2023-08-21 07:36:10.017	2023-08-21 07:36:10.017	\N	113319
566	d53c13cb-fb05-419b-825e-531d3e656d75.jpg	d53c13cb-fb05-419b-825e-531d3e656d75.jpg	2023-08-21 07:36:10.017	2023-08-21 07:36:10.017	\N	55491
220	3455138e-4d4b-4722-a048-7d4a6fbe3bef.svg	3455138e-4d4b-4722-a048-7d4a6fbe3bef.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
221	725bf8c3-0b6f-46eb-981b-a64df92a7d4d.svg	725bf8c3-0b6f-46eb-981b-a64df92a7d4d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
222	819c126b-df93-4631-8a1b-0f17f09ace2a.svg	819c126b-df93-4631-8a1b-0f17f09ace2a.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
223	8d7d3db1-88d1-45f4-b1bb-199139294e00.svg	8d7d3db1-88d1-45f4-b1bb-199139294e00.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
224	03926b1b-3f2c-4129-bd1c-666084e7c77e.svg	03926b1b-3f2c-4129-bd1c-666084e7c77e.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
225	d6c24522-4347-4ae0-97f3-afd4f4eaa6cd.svg	d6c24522-4347-4ae0-97f3-afd4f4eaa6cd.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
226	340bdb24-1696-448b-bf3f-3c494b1a348b.svg	340bdb24-1696-448b-bf3f-3c494b1a348b.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
227	067f57cd-f9c2-43d6-b941-25fd6b270bc4.svg	067f57cd-f9c2-43d6-b941-25fd6b270bc4.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
508	./static/866a0464-1193-4672-9ae3-492d853f34fb.pdf	866a0464-1193-4672-9ae3-492d853f34fb.pdf	2023-08-11 11:57:29.236	2023-08-11 11:57:29.236	\N	12807
523	./static/0d6c28e2-12d3-4a1b-99b2-9f3b7e8014fe.pdf	0d6c28e2-12d3-4a1b-99b2-9f3b7e8014fe.pdf	2023-08-14 10:06:13.709	2023-08-14 10:06:13.709	\N	15172
524	./static/7b48d510-9218-4a29-a35b-dbc07146364f.pdf	7b48d510-9218-4a29-a35b-dbc07146364f.pdf	2023-08-14 10:06:48.501	2023-08-14 10:06:48.501	\N	12807
543	058cbec1-76d7-4362-9ca6-314c8fbf9372.png	058cbec1-76d7-4362-9ca6-314c8fbf9372.png	2023-08-17 09:20:39.58	2023-08-17 09:20:39.58	\N	15353
544	c110baf0-cd25-4b08-bacd-6e3342c5d361.png	c110baf0-cd25-4b08-bacd-6e3342c5d361.png	2023-08-17 09:23:24.009	2023-08-17 09:23:24.009	\N	71629
545	c5c8eb47-6350-480a-82bf-49b0a130f2c8.jpg	c5c8eb47-6350-480a-82bf-49b0a130f2c8.jpg	2023-08-17 09:23:24.009	2023-08-17 09:23:24.009	\N	38872
567	static/2b21b95a-2e48-4ba2-8cf3-62545e324551.pdf	2b21b95a-2e48-4ba2-8cf3-62545e324551.pdf	2023-08-21 09:21:46.127	2023-08-21 09:21:46.127	\N	13023
510	./static/d555e37d-bdba-4342-a0b0-f7710cb27058.pdf	d555e37d-bdba-4342-a0b0-f7710cb27058.pdf	2023-08-13 08:52:08.806	2023-08-13 08:52:08.806	\N	12807
525	4f3ae811-ac30-47e4-8ecc-b777e5a9687d.jpg	4f3ae811-ac30-47e4-8ecc-b777e5a9687d.jpg	2023-08-14 12:40:08.857	2023-08-14 12:40:08.857	\N	21567
526	49a1557d-01af-406a-99fd-e84ac30b0cd6.jpg	49a1557d-01af-406a-99fd-e84ac30b0cd6.jpg	2023-08-14 12:40:08.857	2023-08-14 12:40:08.857	\N	541053
527	c14e9032-0e22-4b63-8b76-9be180e7fbdc.jpg	c14e9032-0e22-4b63-8b76-9be180e7fbdc.jpg	2023-08-14 12:40:08.857	2023-08-14 12:40:08.857	\N	28077
528	56455974-41ad-4050-854c-d0c5463a18bb.jpg	56455974-41ad-4050-854c-d0c5463a18bb.jpg	2023-08-14 12:40:08.857	2023-08-14 12:40:08.857	\N	30381
546	b951608a-8813-467d-9323-e30f46c44c42.png	b951608a-8813-467d-9323-e30f46c44c42.png	2023-08-17 09:52:50.123	2023-08-17 09:52:50.123	\N	6045
547	8cf41260-ecc3-4c62-a915-050293ede0f4.png	8cf41260-ecc3-4c62-a915-050293ede0f4.png	2023-08-17 09:52:50.123	2023-08-17 09:52:50.123	\N	10108
568	static/d8900c07-44bb-4951-80e1-b6f5a04012c4.pdf	d8900c07-44bb-4951-80e1-b6f5a04012c4.pdf	2023-08-21 09:59:47.134	2023-08-21 09:59:47.134	\N	15672
458	2cf931b1-9d90-45fd-b33e-8795f2221e08.jpg	2cf931b1-9d90-45fd-b33e-8795f2221e08.jpg	2023-08-09 18:59:22.847	2023-08-09 18:59:22.847	\N	589984
459	cb3f2b6e-fb59-4964-b1c9-7c2e92f29f9f.jpg	cb3f2b6e-fb59-4964-b1c9-7c2e92f29f9f.jpg	2023-08-09 18:59:22.847	2023-08-09 18:59:22.847	\N	565231
460	a68d8884-1e2e-4065-b05b-66c56b30f649.jpg	a68d8884-1e2e-4065-b05b-66c56b30f649.jpg	2023-08-09 18:59:22.847	2023-08-09 18:59:22.847	\N	501690
461	ff91781d-f618-40d2-b42f-ca3481751a0b.jpg	ff91781d-f618-40d2-b42f-ca3481751a0b.jpg	2023-08-09 18:59:22.847	2023-08-09 18:59:22.847	\N	947544
462	a40f9d71-a3b4-4b54-92c2-9f1896056af1.jpg	a40f9d71-a3b4-4b54-92c2-9f1896056af1.jpg	2023-08-09 18:59:22.847	2023-08-09 18:59:22.847	\N	516912
463	a719ef2c-48ae-4cde-a942-fe14eba15747.jpg	a719ef2c-48ae-4cde-a942-fe14eba15747.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	589984
464	f4f19e71-a561-46ac-accc-4c5cbbdcd19f.jpg	f4f19e71-a561-46ac-accc-4c5cbbdcd19f.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	565231
465	2714a97f-f6ea-4792-b7af-303aca3d5e71.jpg	2714a97f-f6ea-4792-b7af-303aca3d5e71.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	501690
466	6ae043d8-a5a6-4040-a7fd-12afa68a8462.jpg	6ae043d8-a5a6-4040-a7fd-12afa68a8462.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	947544
467	4a76ed86-8948-4eef-bd1b-d893b81ee517.jpg	4a76ed86-8948-4eef-bd1b-d893b81ee517.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	461777
468	90619e13-5ade-4875-87fb-2a8ef8294484.jpg	90619e13-5ade-4875-87fb-2a8ef8294484.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	836592
469	6fef9bb1-e1e5-48a2-a407-730a32daa719.jpg	6fef9bb1-e1e5-48a2-a407-730a32daa719.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	475780
470	758a24a6-80f9-4c75-91f5-9bb2547204f8.jpg	758a24a6-80f9-4c75-91f5-9bb2547204f8.jpg	2023-08-09 19:00:15.33	2023-08-09 19:00:15.33	\N	588237
511	./static/069dff05-8473-4682-b594-d3ae8789e8ee.pdf	069dff05-8473-4682-b594-d3ae8789e8ee.pdf	2023-08-13 08:58:43.866	2023-08-13 08:58:43.866	\N	13232
512	./static/266df582-b932-49db-97b2-ad2cbdd5fbb9.pdf	266df582-b932-49db-97b2-ad2cbdd5fbb9.pdf	2023-08-13 08:59:18.122	2023-08-13 08:59:18.122	\N	14921
529	./static/7b6b1659-45e6-42f1-a771-02fc1660e51e.pdf	7b6b1659-45e6-42f1-a771-02fc1660e51e.pdf	2023-08-15 05:40:18.769	2023-08-15 05:40:18.769	\N	10860
548	13812e11-a487-4280-8441-96af53253c45.png	13812e11-a487-4280-8441-96af53253c45.png	2023-08-17 09:53:02.014	2023-08-17 09:53:02.014	\N	6045
569	30a26104-73bb-4208-98d4-e10a25b113d6.jpg	30a26104-73bb-4208-98d4-e10a25b113d6.jpg	2023-08-21 20:36:35.475	2023-08-21 20:36:35.475	\N	350531
571	7af8a1c8-f3a0-4541-b5d2-299dbb4f13d3.jpg	7af8a1c8-f3a0-4541-b5d2-299dbb4f13d3.jpg	2023-08-21 20:40:28.458	2023-08-21 20:40:28.458	\N	573379
572	0923732f-703e-42cc-b9c9-b0531c1e947f.jpg	0923732f-703e-42cc-b9c9-b0531c1e947f.jpg	2023-08-21 20:43:16.339	2023-08-21 20:43:16.339	\N	461777
573	e786097f-34ac-47ee-b3fd-ad5765c22596.jpg	e786097f-34ac-47ee-b3fd-ad5765c22596.jpg	2023-08-21 20:46:55.808	2023-08-21 20:46:55.808	\N	589984
574	3bf72d32-4452-463e-ae9c-a8dfebcc4f13.jpg	3bf72d32-4452-463e-ae9c-a8dfebcc4f13.jpg	2023-08-21 20:46:55.808	2023-08-21 20:46:55.808	\N	291151
575	da920dc9-c0b5-4324-8a9b-97d0731eae50.jpg	da920dc9-c0b5-4324-8a9b-97d0731eae50.jpg	2023-08-21 20:46:55.808	2023-08-21 20:46:55.808	\N	461777
576	cebdde16-1570-43b3-91bc-222e57711110.jpg	cebdde16-1570-43b3-91bc-222e57711110.jpg	2023-08-21 20:46:55.808	2023-08-21 20:46:55.808	\N	836592
1	1dbb4d4d-3d91-40f4-be44-90cb0edcfa2d.svg	1dbb4d4d-3d91-40f4-be44-90cb0edcfa2d.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
2	89ea1a0a-0e97-459e-8f90-bccf6981bb7f.svg	89ea1a0a-0e97-459e-8f90-bccf6981bb7f.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
3	f11bd8d1-ebd6-41b1-b8b2-13c0f6e66389.svg	f11bd8d1-ebd6-41b1-b8b2-13c0f6e66389.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
4	3729a688-b224-41aa-a76f-9d16a52a4c2c.svg	3729a688-b224-41aa-a76f-9d16a52a4c2c.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
5	9391437c-0422-43f2-878b-8a5d88d784c4.svg	9391437c-0422-43f2-878b-8a5d88d784c4.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
6	69a6e232-8b77-442b-b186-f4558e326100.svg	69a6e232-8b77-442b-b186-f4558e326100.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
7	49978967-9504-404a-a3a8-5b7f27ef2f47.svg	49978967-9504-404a-a3a8-5b7f27ef2f47.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
8	bc8941d1-575f-42c4-aa00-d41466b171f2.svg	bc8941d1-575f-42c4-aa00-d41466b171f2.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
9	b4b9bf97-cea6-4d99-9ea8-899f7950c24e.svg	b4b9bf97-cea6-4d99-9ea8-899f7950c24e.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
10	6e0bddf9-77e9-4685-8e05-5162abbd7624.svg	6e0bddf9-77e9-4685-8e05-5162abbd7624.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
11	97519bf9-8519-41a8-85f5-fb84d3d33747.svg	97519bf9-8519-41a8-85f5-fb84d3d33747.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
12	de76c1fa-4df5-4871-b3f6-a1e3377dc1b3.svg	de76c1fa-4df5-4871-b3f6-a1e3377dc1b3.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
13	6e261b81-4ddc-4595-ac4b-676a03eaa3a7.svg	6e261b81-4ddc-4595-ac4b-676a03eaa3a7.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
14	26cb954a-1f13-4870-85af-e148568b2a48.svg	26cb954a-1f13-4870-85af-e148568b2a48.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
15	a8083760-654d-4c97-b3f4-2c5a09876a1d.svg	a8083760-654d-4c97-b3f4-2c5a09876a1d.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
16	1d815eec-dee9-4cb2-9d8c-a0eac3ad8de6.svg	1d815eec-dee9-4cb2-9d8c-a0eac3ad8de6.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
17	afdb1d6a-f4c2-4cbd-b35c-c826c0501024.svg	afdb1d6a-f4c2-4cbd-b35c-c826c0501024.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
18	e1e588e9-bdcf-472b-9ccc-9052c2e8a46d.svg	e1e588e9-bdcf-472b-9ccc-9052c2e8a46d.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
19	e9e46980-efe7-4b0d-b78b-c83537275fe6.svg	e9e46980-efe7-4b0d-b78b-c83537275fe6.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
20	c19b3ed0-f8ca-45ad-8b2d-e54bb237643b.svg	c19b3ed0-f8ca-45ad-8b2d-e54bb237643b.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
21	9247ab8d-73cf-4f76-8965-0bbdb951f5cd.svg	9247ab8d-73cf-4f76-8965-0bbdb951f5cd.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
22	0e5ae8ac-8789-41f6-b5ac-9345182bf8c6.svg	0e5ae8ac-8789-41f6-b5ac-9345182bf8c6.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
23	1b6d202d-1acf-4423-9360-9d29b1249b1b.svg	1b6d202d-1acf-4423-9360-9d29b1249b1b.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
24	a05828b5-972c-4259-8b6e-5099dbded131.svg	a05828b5-972c-4259-8b6e-5099dbded131.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
25	93644d6d-0bef-4b0b-b997-db60a4acf1f2.svg	93644d6d-0bef-4b0b-b997-db60a4acf1f2.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
26	5f6fc6ab-cd04-4208-8e79-867ee91f2dec.svg	5f6fc6ab-cd04-4208-8e79-867ee91f2dec.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
27	107ab4d5-5f3c-4a9a-8429-0decc3b79798.svg	107ab4d5-5f3c-4a9a-8429-0decc3b79798.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
28	2086213b-23ed-443d-92e3-1b46aeae0cff.svg	2086213b-23ed-443d-92e3-1b46aeae0cff.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
29	ee5a9a36-53d1-4928-92f4-8eca6d08ad88.svg	ee5a9a36-53d1-4928-92f4-8eca6d08ad88.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
30	1129d4b3-5ee3-446c-b683-6833b948699b.svg	1129d4b3-5ee3-446c-b683-6833b948699b.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
31	b951d593-1fce-4677-a4b4-b51367107349.svg	b951d593-1fce-4677-a4b4-b51367107349.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
32	9f8dc141-793f-4b65-aa00-ca3ebf330b18.svg	9f8dc141-793f-4b65-aa00-ca3ebf330b18.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
33	d74785bb-70b7-44f3-a7da-9f9ea95f6994.svg	d74785bb-70b7-44f3-a7da-9f9ea95f6994.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
34	8cf9a1c7-1b59-4c09-a44b-a2f200fa525c.svg	8cf9a1c7-1b59-4c09-a44b-a2f200fa525c.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
35	5b4c38da-5dc8-4ed0-b978-62968954ccea.svg	5b4c38da-5dc8-4ed0-b978-62968954ccea.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
36	380914b8-dc78-4766-9d64-2eba7671610e.svg	380914b8-dc78-4766-9d64-2eba7671610e.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
37	efd8194f-86fe-46f9-aab8-b7869f639b01.svg	efd8194f-86fe-46f9-aab8-b7869f639b01.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
38	64dab609-8b3c-4cbe-b523-9f7066690a06.svg	64dab609-8b3c-4cbe-b523-9f7066690a06.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
39	5c8c7d7e-497a-4b28-871f-93c6b70c6ab1.svg	5c8c7d7e-497a-4b28-871f-93c6b70c6ab1.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
40	f9403b63-5b0d-45fb-8313-e8fac6440b79.svg	f9403b63-5b0d-45fb-8313-e8fac6440b79.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
41	a467f4fc-9039-4345-9a3a-cb7ef02b13bc.svg	a467f4fc-9039-4345-9a3a-cb7ef02b13bc.svg	2023-04-27 00:45:27.589	2023-04-27 00:45:27.589	\N	\N
64	22310f89-7926-4305-b537-f6a36b0c5281.pdf	22310f89-7926-4305-b537-f6a36b0c5281.pdf	2023-05-04 07:43:43.786	2023-05-04 07:43:43.786	\N	\N
65	b93ebeaf-6e2a-4866-b05f-c6a53384d54a.pdf	b93ebeaf-6e2a-4866-b05f-c6a53384d54a.pdf	2023-05-04 07:44:31.419	2023-05-04 07:44:31.419	\N	\N
66	da86a4ae-5f8d-45f9-9a10-5fb67278cc96.pdf	da86a4ae-5f8d-45f9-9a10-5fb67278cc96.pdf	2023-05-04 07:48:55.641	2023-05-04 07:48:55.641	\N	\N
67	9144ebf7-210c-4c4c-9807-b4f8d805dd87.pdf	9144ebf7-210c-4c4c-9807-b4f8d805dd87.pdf	2023-05-04 08:00:41.098	2023-05-04 08:00:41.098	\N	\N
68	c3aaa538-70c5-46cc-9a54-459af385c452.pdf	c3aaa538-70c5-46cc-9a54-459af385c452.pdf	2023-05-04 08:02:03.659	2023-05-04 08:02:03.659	\N	\N
69	d1528970-563d-45f9-810f-cf8edaf7cef6.pdf	d1528970-563d-45f9-810f-cf8edaf7cef6.pdf	2023-05-04 08:04:55.938	2023-05-04 08:04:55.938	\N	\N
70	d3aaf032-c285-48ba-a5e1-30f7974edd52.pdf	d3aaf032-c285-48ba-a5e1-30f7974edd52.pdf	2023-05-04 08:09:11.356	2023-05-04 08:09:11.356	\N	\N
229	0395a9da-d0a3-475a-b71e-41b41cfc16e5.pdf	0395a9da-d0a3-475a-b71e-41b41cfc16e5.pdf	2023-06-28 13:04:51.654	2023-06-28 13:04:51.654	\N	\N
230	69ed29a2-9276-487e-b369-b9f18f1ea034.pdf	69ed29a2-9276-487e-b369-b9f18f1ea034.pdf	2023-06-28 13:08:13.64	2023-06-28 13:08:13.64	\N	\N
328	0fd2c530-7d9f-4dc9-9bcb-da3c68cb5301.pdf	0fd2c530-7d9f-4dc9-9bcb-da3c68cb5301.pdf	2023-07-05 13:30:15.359	2023-07-05 13:30:15.359	\N	\N
329	280678f0-4a3f-471c-a654-31b3ea3b81e3.pdf	280678f0-4a3f-471c-a654-31b3ea3b81e3.pdf	2023-07-05 13:30:21.103	2023-07-05 13:30:21.103	\N	\N
340	f9924d33-766f-4e9b-b9b0-30b83218faef.pdf	f9924d33-766f-4e9b-b9b0-30b83218faef.pdf	2023-07-06 09:20:58.996	2023-07-06 09:20:58.996	\N	\N
348	24d6f0a3-0699-43d7-85f8-ef7162de37c9.pdf	24d6f0a3-0699-43d7-85f8-ef7162de37c9.pdf	2023-07-06 12:56:46.987	2023-07-06 12:56:46.987	\N	\N
352	b39e11c9-014d-4072-a1cd-12fad6350853.pdf	b39e11c9-014d-4072-a1cd-12fad6350853.pdf	2023-07-10 07:27:18.562	2023-07-10 07:27:18.562	\N	\N
357	33d76687-0a32-4c36-8a07-5a4c1fd9fe08.pdf	33d76687-0a32-4c36-8a07-5a4c1fd9fe08.pdf	2023-07-11 06:02:01.017	2023-07-11 06:02:01.017	\N	13420
365	a816eec6-9be4-4aa0-a088-c9ba5643544e.jpg	a816eec6-9be4-4aa0-a088-c9ba5643544e.jpg	2023-07-14 11:40:32.447	2023-07-14 11:40:32.447	\N	45385
366	72cfe3c0-3542-438d-8ad1-140593e10fc5.jpg	72cfe3c0-3542-438d-8ad1-140593e10fc5.jpg	2023-07-14 11:41:00.619	2023-07-14 11:41:00.619	\N	45385
367	32975797-d351-4e7a-ad8b-7ea4a5f9b5dc.jpg	32975797-d351-4e7a-ad8b-7ea4a5f9b5dc.jpg	2023-07-14 11:42:29.566	2023-07-14 11:42:29.566	\N	45385
368	851f31c7-5486-4bd1-865c-cbbc91619ff3.jpg	851f31c7-5486-4bd1-865c-cbbc91619ff3.jpg	2023-07-14 11:42:54.431	2023-07-14 11:42:54.431	\N	90775
376	ac5865f2-9b0c-42d0-bafb-395ee199a438.jpg	ac5865f2-9b0c-42d0-bafb-395ee199a438.jpg	2023-07-17 07:49:30.484	2023-07-17 07:49:30.484	\N	7910
382	90916891-0a51-4bfd-a3ba-e9ed03711ef1.pdf	90916891-0a51-4bfd-a3ba-e9ed03711ef1.pdf	2023-08-04 04:43:08.122	2023-08-04 04:43:08.122	\N	10184
42	38ad117d-b8a5-4a33-a0df-8597b7b5cc13.svg	38ad117d-b8a5-4a33-a0df-8597b7b5cc13.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
43	5bb01b60-5334-49ca-9486-184ea7862db2.svg	5bb01b60-5334-49ca-9486-184ea7862db2.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
44	97417746-ac84-4833-aa74-0eec9aa75669.svg	97417746-ac84-4833-aa74-0eec9aa75669.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
45	226623d1-9b76-47cb-b04c-75510d7ca320.svg	226623d1-9b76-47cb-b04c-75510d7ca320.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
46	cc308d64-95d0-4882-a2c9-3701bf692261.svg	cc308d64-95d0-4882-a2c9-3701bf692261.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
47	b7e14332-63dd-414f-ae7e-529d490542d1.svg	b7e14332-63dd-414f-ae7e-529d490542d1.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
48	7c1f9db7-40fa-4c3b-a71b-df7a4fb40308.svg	7c1f9db7-40fa-4c3b-a71b-df7a4fb40308.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
49	ea8c6396-7331-437f-a0aa-cc9d0350ca45.svg	ea8c6396-7331-437f-a0aa-cc9d0350ca45.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
50	c432f7e6-f9a1-41c6-baa1-7cab3ac2a56c.svg	c432f7e6-f9a1-41c6-baa1-7cab3ac2a56c.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
51	ae3c481b-48a5-4221-86b7-8a4343321408.svg	ae3c481b-48a5-4221-86b7-8a4343321408.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
52	52a59b24-d35c-426b-889b-e0063b8ff574.svg	52a59b24-d35c-426b-889b-e0063b8ff574.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
53	4e78a4c9-7110-4cbd-8c36-b723cf899c32.svg	4e78a4c9-7110-4cbd-8c36-b723cf899c32.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
54	cf0b9f19-ce9a-47eb-867e-3db679721d4f.svg	cf0b9f19-ce9a-47eb-867e-3db679721d4f.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
55	152e533e-6e7c-435f-b8f3-3c92e7720694.svg	152e533e-6e7c-435f-b8f3-3c92e7720694.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
56	07331b26-7bd0-4285-93f6-2b3953483626.svg	07331b26-7bd0-4285-93f6-2b3953483626.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
57	3a87689e-cdba-4641-8616-50586364137a.svg	3a87689e-cdba-4641-8616-50586364137a.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
58	23815d81-7c47-4f0b-bc0f-3b3c0b8bf662.svg	23815d81-7c47-4f0b-bc0f-3b3c0b8bf662.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
59	6049135c-ad69-4d92-bd5d-8d4da38e1ade.svg	6049135c-ad69-4d92-bd5d-8d4da38e1ade.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
60	cb782430-c087-4876-9371-2bff39a1fd44.svg	cb782430-c087-4876-9371-2bff39a1fd44.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
61	be128239-486c-4eda-bb4b-ad1456618f92.svg	be128239-486c-4eda-bb4b-ad1456618f92.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
62	f5ca4574-c9f9-4c73-9d11-774002e1ba1d.svg	f5ca4574-c9f9-4c73-9d11-774002e1ba1d.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
63	afac8d75-f1bc-4174-ad51-7d0e2cf1a2f3.svg	afac8d75-f1bc-4174-ad51-7d0e2cf1a2f3.svg	2023-04-28 12:24:10.078	2023-04-28 12:24:10.078	\N	\N
71	2521682c-5d14-4990-8b38-23d054bfcf8b.pdf	2521682c-5d14-4990-8b38-23d054bfcf8b.pdf	2023-05-03 13:01:41.865	2023-05-03 13:01:41.865	\N	\N
72	ff081e2d-4c83-48d0-862f-3e929a18f4d3.pdf	ff081e2d-4c83-48d0-862f-3e929a18f4d3.pdf	2023-05-04 06:30:32.615	2023-05-04 06:30:32.615	\N	\N
73	f9977d2d-4ce4-4299-a9c1-83b606f57bdd.pdf	f9977d2d-4ce4-4299-a9c1-83b606f57bdd.pdf	2023-05-04 20:17:58.945	2023-05-04 20:17:58.945	\N	\N
74	17ba5d36-50ae-44dc-b1d7-62ea85d8ac4d.pdf	17ba5d36-50ae-44dc-b1d7-62ea85d8ac4d.pdf	2023-05-05 04:29:03.975	2023-05-05 04:29:03.975	\N	\N
75	f29ff2a4-26e8-4793-a2ff-3e3982a16bd1.pdf	f29ff2a4-26e8-4793-a2ff-3e3982a16bd1.pdf	2023-05-05 05:04:23.978	2023-05-05 05:04:23.978	\N	\N
76	54b00832-aae0-4c2e-b2e6-b95508f28d07.pdf	54b00832-aae0-4c2e-b2e6-b95508f28d07.pdf	2023-05-10 09:47:43.677	2023-05-10 09:47:43.677	\N	\N
77	7b7e3048-04cc-4239-aaea-5a668fec33c7.svg	7b7e3048-04cc-4239-aaea-5a668fec33c7.svg	2023-05-11 09:52:24.591	2023-05-11 14:52:06	\N	\N
78	e1fa081e-40af-4dc5-b7f1-024f47effb27.svg	e1fa081e-40af-4dc5-b7f1-024f47effb27.svg	2023-05-11 11:31:32.04	2023-05-11 16:31:19	\N	\N
79	df7818e7-9a4f-4bf8-b2fc-d22ddfc354a3.svg	df7818e7-9a4f-4bf8-b2fc-d22ddfc354a3.svg	2023-05-11 12:36:26.093	2023-05-11 17:36:09	\N	\N
81	aa1919aa-2392-4580-913e-55d6b62aeb78.pdf	aa1919aa-2392-4580-913e-55d6b62aeb78.pdf	2023-05-12 06:38:47.256	2023-05-12 06:38:47.256	\N	\N
82	9ad5ae9a-1176-4dc7-a242-2303bd60a5b6.pdf	9ad5ae9a-1176-4dc7-a242-2303bd60a5b6.pdf	2023-05-12 08:50:55.033	2023-05-12 08:50:55.033	\N	\N
83	dfdce180-2a52-46e8-9238-3b0437693543.pdf	dfdce180-2a52-46e8-9238-3b0437693543.pdf	2023-05-12 08:51:56.433	2023-05-12 08:51:56.433	\N	\N
84	011a4fe8-bc4f-40e6-90be-20a305be6f26.pdf	011a4fe8-bc4f-40e6-90be-20a305be6f26.pdf	2023-05-15 09:50:12.117	2023-05-15 09:50:12.117	\N	\N
85	1a9a8a56-e0d4-413b-b975-aa5e6b32167d.pdf	1a9a8a56-e0d4-413b-b975-aa5e6b32167d.pdf	2023-05-20 15:03:35.284	2023-05-20 15:03:35.284	\N	\N
86	acd9c833-ce24-43c0-820d-4879da64be6f.svg	acd9c833-ce24-43c0-820d-4879da64be6f.svg	2023-05-22 09:49:04.344	2023-05-22 14:48:51	\N	\N
87	a36c02cf-edd9-4af2-b951-91384cdf7367.svg	a36c02cf-edd9-4af2-b951-91384cdf7367.svg	2023-05-22 09:54:06.262	2023-05-22 14:53:51	\N	\N
88	7b429e83-4f18-4fae-bf9f-f81a62beb0d8.svg	7b429e83-4f18-4fae-bf9f-f81a62beb0d8.svg	2023-05-22 09:57:56.588	2023-05-22 14:57:41	\N	\N
89	7e652ce9-68bf-4905-b5e6-2d3dca791e0b.svg	7e652ce9-68bf-4905-b5e6-2d3dca791e0b.svg	2023-05-22 10:57:06.573	2023-05-22 15:56:44	\N	\N
90	d511b802-9728-4156-a0cb-e4aa6a720a84.svg	d511b802-9728-4156-a0cb-e4aa6a720a84.svg	2023-05-22 11:14:26.713	2023-05-22 16:14:13	\N	\N
91	6eaaad4b-b52d-41a0-adb3-b56cb809bd74.svg	6eaaad4b-b52d-41a0-adb3-b56cb809bd74.svg	2023-05-22 11:19:20.176	2023-05-22 16:20:06	\N	\N
92	b840c925-8bb4-441a-8e57-8baef38ce9b9.pdf	b840c925-8bb4-441a-8e57-8baef38ce9b9.pdf	2023-05-22 14:13:22.084	2023-05-22 14:13:22.084	\N	\N
93	ebcbc331-816c-4e52-b772-c58a11e761b1.svg	ebcbc331-816c-4e52-b772-c58a11e761b1.svg	2023-05-23 05:39:44.097	2023-05-23 10:39:19	\N	\N
94	3fcf0c84-8d67-4afb-8a14-ec13fa2be68a.svg	3fcf0c84-8d67-4afb-8a14-ec13fa2be68a.svg	2023-05-23 06:01:42.773	2023-05-23 11:01:30	\N	\N
95	b6b26b74-d0cf-4338-977c-7f64393f78ee.svg	b6b26b74-d0cf-4338-977c-7f64393f78ee.svg	2023-05-23 06:44:20.975	2023-05-23 11:44:10	\N	\N
96	4a52eac7-431c-4f3e-8adb-0f3f25f1dfc7.svg	4a52eac7-431c-4f3e-8adb-0f3f25f1dfc7.svg	2023-05-23 06:50:31.032	2023-05-23 11:50:07	\N	\N
97	2dc9a473-38bc-41d4-8121-a781e16559c8.svg	2dc9a473-38bc-41d4-8121-a781e16559c8.svg	2023-05-23 06:51:58.73	2023-05-23 11:51:46	\N	\N
98	9fc32ed0-707f-47f3-82dd-2ab447304c31.svg	9fc32ed0-707f-47f3-82dd-2ab447304c31.svg	2023-05-23 06:53:35.45	2023-05-23 11:53:26	\N	\N
99	8cf5b504-8bfa-4754-a175-970cf67a8aa7.svg	8cf5b504-8bfa-4754-a175-970cf67a8aa7.svg	2023-05-23 06:55:04.136	2023-05-23 11:54:52	\N	\N
100	caf1da29-2ebe-4a90-b416-1d19d5b78daa.svg	caf1da29-2ebe-4a90-b416-1d19d5b78daa.svg	2023-05-23 07:13:07.083	2023-05-23 12:12:55	\N	\N
101	f4743158-fab6-42b0-a834-031de03a9510.svg	f4743158-fab6-42b0-a834-031de03a9510.svg	2023-05-23 07:19:27.03	2023-05-23 12:19:16	\N	\N
102	84e2a41e-f078-4532-98bd-4118ca1bb5b6.svg	84e2a41e-f078-4532-98bd-4118ca1bb5b6.svg	2023-05-23 07:37:23.563	2023-05-23 12:37:00	\N	\N
103	d997e75b-60fa-44e1-b730-0ce2b658a1b3.svg	d997e75b-60fa-44e1-b730-0ce2b658a1b3.svg	2023-05-23 07:39:12.482	2023-05-23 12:39:02	\N	\N
104	09ea825f-5f37-48ba-abe5-88f57bbabce7.svg	09ea825f-5f37-48ba-abe5-88f57bbabce7.svg	2023-05-23 07:40:50.975	2023-05-23 12:40:40	\N	\N
105	ae9fef87-2891-4d93-8b9e-34dbc1033053.svg	ae9fef87-2891-4d93-8b9e-34dbc1033053.svg	2023-05-23 07:42:21.233	2023-05-23 12:42:06	\N	\N
106	19bd409b-97a9-40a8-b3b1-bded212a36ac.svg	19bd409b-97a9-40a8-b3b1-bded212a36ac.svg	2023-05-23 07:46:25.816	2023-05-23 12:46:16	\N	\N
107	e1787687-c73b-4e88-9369-98552560dabe.svg	e1787687-c73b-4e88-9369-98552560dabe.svg	2023-05-23 07:48:56.991	2023-05-23 12:48:44	\N	\N
108	04f2fb6d-5029-481d-8372-7a6846006512.svg	04f2fb6d-5029-481d-8372-7a6846006512.svg	2023-05-23 07:51:19.271	2023-05-23 12:51:07	\N	\N
109	012ffbb3-ae81-480b-945f-b530cae4ed78.svg	012ffbb3-ae81-480b-945f-b530cae4ed78.svg	2023-05-23 10:02:32.775	2023-05-23 15:02:21	\N	\N
110	7e449c18-c604-4cd6-ab14-f41242a5a190.svg	7e449c18-c604-4cd6-ab14-f41242a5a190.svg	2023-05-23 10:03:53.381	2023-05-23 15:03:41	\N	\N
111	9e01acce-6ecf-4bfc-b1ed-1e808ab71d80.svg	9e01acce-6ecf-4bfc-b1ed-1e808ab71d80.svg	2023-05-23 10:06:18.543	2023-05-23 15:05:58	\N	\N
112	2574b794-657a-47d9-a008-00f6689f4741.svg	2574b794-657a-47d9-a008-00f6689f4741.svg	2023-05-23 10:07:57.425	2023-05-23 15:07:23	\N	\N
113	cfb84b65-d003-49a3-9a81-7838cab00b64.svg	cfb84b65-d003-49a3-9a81-7838cab00b64.svg	2023-05-23 10:30:03.419	2023-05-23 15:29:47	\N	\N
114	33ff6aae-3758-4220-afab-02ea7c9a0b7d.svg	33ff6aae-3758-4220-afab-02ea7c9a0b7d.svg	2023-05-23 10:32:09.361	2023-05-23 15:31:57	\N	\N
115	c19ad945-68e1-4ffd-9ab7-23acbddf0178.svg	c19ad945-68e1-4ffd-9ab7-23acbddf0178.svg	2023-05-23 10:33:42.298	2023-05-23 15:33:30	\N	\N
116	035a7cb1-da21-4c99-a60e-f819706c9439.svg	035a7cb1-da21-4c99-a60e-f819706c9439.svg	2023-05-23 10:38:08.957	2023-05-23 15:37:57	\N	\N
117	72091e24-688f-4342-998f-a2c2f6353499.svg	72091e24-688f-4342-998f-a2c2f6353499.svg	2023-05-23 10:40:16.068	2023-05-23 15:40:01	\N	\N
118	fbcc8cfd-368b-4d1b-b4e2-f7ce6ed53fe5.svg	fbcc8cfd-368b-4d1b-b4e2-f7ce6ed53fe5.svg	2023-05-23 10:41:38.8	2023-05-23 15:41:26	\N	\N
119	84a1d3ae-6edf-4be1-87e0-50cae179071d.pdf	84a1d3ae-6edf-4be1-87e0-50cae179071d.pdf	2023-05-26 11:10:28.818	2023-05-26 11:10:28.818	\N	\N
120	954de008-1bbf-4048-8cf2-dd90dc7804c3.pdf	954de008-1bbf-4048-8cf2-dd90dc7804c3.pdf	2023-06-07 11:08:04.963	2023-06-07 11:08:04.963	\N	\N
121	320f3a81-6de0-4504-af6b-a6ba63f9e871.pdf	320f3a81-6de0-4504-af6b-a6ba63f9e871.pdf	2023-06-07 11:09:04.642	2023-06-07 11:09:04.642	\N	\N
122	11ffbff4-840a-402e-a0be-6fa332c02629.pdf	11ffbff4-840a-402e-a0be-6fa332c02629.pdf	2023-06-07 15:18:18.815	2023-06-07 15:18:18.815	\N	\N
268	b4c19c74-9c47-4559-8ba9-81dd2bbaadeb.pdf	b4c19c74-9c47-4559-8ba9-81dd2bbaadeb.pdf	2023-07-05 11:15:37.625	2023-07-05 11:15:37.625	\N	\N
302	32b3bfee-bc67-44a5-8075-47028b365b33.pdf	32b3bfee-bc67-44a5-8075-47028b365b33.pdf	2023-07-05 11:30:47.07	2023-07-05 11:30:47.07	\N	\N
303	1957df9a-27bc-4528-8cde-b60c94f3780a.pdf	1957df9a-27bc-4528-8cde-b60c94f3780a.pdf	2023-07-05 11:31:08.497	2023-07-05 11:31:08.497	\N	\N
304	bf7e26c2-9501-43c9-84bf-3416d9529ea8.pdf	bf7e26c2-9501-43c9-84bf-3416d9529ea8.pdf	2023-07-05 11:31:11.708	2023-07-05 11:31:11.708	\N	\N
305	b3b2d778-ef22-480b-85ca-7ac49d3049e6.pdf	b3b2d778-ef22-480b-85ca-7ac49d3049e6.pdf	2023-07-05 11:31:28.434	2023-07-05 11:31:28.434	\N	\N
306	f5b62e41-2a15-4217-9a13-33793babe31a.pdf	f5b62e41-2a15-4217-9a13-33793babe31a.pdf	2023-07-05 11:32:48.757	2023-07-05 11:32:48.757	\N	\N
307	2a689f41-6b8c-4e48-9bf7-08d11bf0da93.pdf	2a689f41-6b8c-4e48-9bf7-08d11bf0da93.pdf	2023-07-05 11:32:50.499	2023-07-05 11:32:50.499	\N	\N
308	f6092973-d25e-496c-9ae6-831ba87cde97.pdf	f6092973-d25e-496c-9ae6-831ba87cde97.pdf	2023-07-05 11:32:52.522	2023-07-05 11:32:52.522	\N	\N
309	bcde2bab-1b18-49e4-ba06-307adc8c57f7.pdf	bcde2bab-1b18-49e4-ba06-307adc8c57f7.pdf	2023-07-05 11:34:47.111	2023-07-05 11:34:47.111	\N	\N
310	ef7bde6e-a5f9-48c9-bd84-1bdaa037d326.pdf	ef7bde6e-a5f9-48c9-bd84-1bdaa037d326.pdf	2023-07-05 11:34:49.978	2023-07-05 11:34:49.978	\N	\N
311	819a3a7c-58af-41d2-9df4-61dbf4fcaf32.pdf	819a3a7c-58af-41d2-9df4-61dbf4fcaf32.pdf	2023-07-05 11:34:52.083	2023-07-05 11:34:52.083	\N	\N
312	4e7446f3-1964-4033-9954-f549a46a3364.pdf	4e7446f3-1964-4033-9954-f549a46a3364.pdf	2023-07-05 11:35:18.121	2023-07-05 11:35:18.121	\N	\N
313	49ac6d1c-fc59-43bb-9fd5-2ba5f3a4fec5.pdf	49ac6d1c-fc59-43bb-9fd5-2ba5f3a4fec5.pdf	2023-07-05 11:37:30.151	2023-07-05 11:37:30.151	\N	\N
314	f25705aa-1be2-47ae-8139-78744f656c4b.pdf	f25705aa-1be2-47ae-8139-78744f656c4b.pdf	2023-07-05 11:37:33.126	2023-07-05 11:37:33.126	\N	\N
315	2d51d14d-ef7c-4fd5-b3de-adfc5fcd3390.pdf	2d51d14d-ef7c-4fd5-b3de-adfc5fcd3390.pdf	2023-07-05 11:37:35.201	2023-07-05 11:37:35.201	\N	\N
331	72addedd-257e-48e9-a436-ddbc9aaa6bf5.pdf	72addedd-257e-48e9-a436-ddbc9aaa6bf5.pdf	2023-07-05 13:36:30.864	2023-07-05 13:36:30.864	\N	\N
332	e43da624-ed91-42e0-a5dd-52e337a3bac2.pdf	e43da624-ed91-42e0-a5dd-52e337a3bac2.pdf	2023-07-05 13:36:53.103	2023-07-05 13:36:53.103	\N	\N
333	8ad6260b-df2a-43c8-b22f-a908902406c8.pdf	8ad6260b-df2a-43c8-b22f-a908902406c8.pdf	2023-07-05 13:40:39.603	2023-07-05 13:40:39.603	\N	\N
334	484adf6e-1677-4099-b1a5-8c5254ff2177.pdf	484adf6e-1677-4099-b1a5-8c5254ff2177.pdf	2023-07-05 13:42:13.772	2023-07-05 13:42:13.772	\N	\N
341	e240a653-1a14-4f69-afb4-d781cf9febce.pdf	e240a653-1a14-4f69-afb4-d781cf9febce.pdf	2023-07-06 09:36:51.674	2023-07-06 09:36:51.674	\N	\N
349	af04f9d7-8d32-4f6f-90ad-79265a36c505.pdf	af04f9d7-8d32-4f6f-90ad-79265a36c505.pdf	2023-07-09 16:34:12.911	2023-07-09 16:34:12.911	\N	\N
353	5dbdc7ae-c9f4-40d9-accf-0af82ed3c370.pdf	5dbdc7ae-c9f4-40d9-accf-0af82ed3c370.pdf	2023-07-10 07:48:41.948	2023-07-10 07:48:41.948	\N	\N
354	3dc348bf-4c3e-45fd-a0cb-3267818d50c6.pdf	3dc348bf-4c3e-45fd-a0cb-3267818d50c6.pdf	2023-07-10 07:48:44.676	2023-07-10 07:48:44.676	\N	\N
355	64b7af28-5c0c-4862-abb2-2c4bf470df2b.pdf	64b7af28-5c0c-4862-abb2-2c4bf470df2b.pdf	2023-07-10 08:09:35.226	2023-07-10 08:09:35.226	\N	\N
358	12da1529-4d28-4937-a2b4-63dd1d2bfc26.pdf	12da1529-4d28-4937-a2b4-63dd1d2bfc26.pdf	2023-07-11 10:28:52.67	2023-07-11 10:28:52.67	\N	10035
369	9be06488-918d-4acc-a09e-90e273611339.jpg	9be06488-918d-4acc-a09e-90e273611339.jpg	2023-07-14 12:59:56.526	2023-07-14 12:59:56.526	\N	90775
370	ea03d0d7-ec7e-4cc8-b227-8305f69150e0.jpg	ea03d0d7-ec7e-4cc8-b227-8305f69150e0.jpg	2023-07-14 13:00:14.632	2023-07-14 13:00:14.632	\N	45385
371	c714ee0f-0e00-4c9b-9e4b-3d4d7c9e343d.jpg	c714ee0f-0e00-4c9b-9e4b-3d4d7c9e343d.jpg	2023-07-14 13:00:30.211	2023-07-14 13:00:30.211	\N	45385
372	cf39ce91-f55f-4bb3-a009-f81f8d46ce72.jpg	cf39ce91-f55f-4bb3-a009-f81f8d46ce72.jpg	2023-07-14 13:00:33.029	2023-07-14 13:00:33.029	\N	45385
373	8d56005e-538a-47e8-b2ae-a24e63653a5d.jpg	8d56005e-538a-47e8-b2ae-a24e63653a5d.jpg	2023-07-14 13:04:43.002	2023-07-14 13:04:43.002	\N	45385
377	9292afe3-c805-4c00-964b-1c36b31d978c.jpg	9292afe3-c805-4c00-964b-1c36b31d978c.jpg	2023-07-17 13:48:00.525	2023-07-17 13:48:00.525	\N	7910
402	d9828a5d-6c6e-4efa-8b9a-cdd953ef5349.jpg	d9828a5d-6c6e-4efa-8b9a-cdd953ef5349.jpg	2023-08-09 14:39:10.087	2023-08-09 14:39:10.087	\N	947544
403	dd0d82e1-8337-42a3-b880-031f8131ff99.jpg	dd0d82e1-8337-42a3-b880-031f8131ff99.jpg	2023-08-09 14:43:54.059	2023-08-09 14:43:54.059	\N	947544
404	8f1f0b7e-33e2-4bb3-9d56-a360e99342b7.jpg	8f1f0b7e-33e2-4bb3-9d56-a360e99342b7.jpg	2023-08-09 14:46:37.751	2023-08-09 14:46:37.751	\N	501690
405	46092f44-4b7a-4eb4-9912-5bdc13aa3de5.jpg	46092f44-4b7a-4eb4-9912-5bdc13aa3de5.jpg	2023-08-09 14:46:37.751	2023-08-09 14:46:37.751	\N	947544
406	a0cee92c-245b-4247-b1d2-19f0adc43e0e.jpg	a0cee92c-245b-4247-b1d2-19f0adc43e0e.jpg	2023-08-09 14:46:37.751	2023-08-09 14:46:37.751	\N	516912
407	df17db15-3c24-4ff3-b2d5-453478ff2d42.jpg	df17db15-3c24-4ff3-b2d5-453478ff2d42.jpg	2023-08-09 14:49:34.864	2023-08-09 14:49:34.864	\N	501690
408	e8988b27-eea3-4c31-baff-b6d0e65a2355.jpg	e8988b27-eea3-4c31-baff-b6d0e65a2355.jpg	2023-08-09 14:49:34.864	2023-08-09 14:49:34.864	\N	947544
386	078a88ba-3f5c-4b71-9605-8df6700a377a.pdf	078a88ba-3f5c-4b71-9605-8df6700a377a.pdf	2023-08-04 10:25:49.64	2023-08-04 10:25:49.64	\N	10184
242	c224b2f7-3cf5-405a-9515-4e97d69687fe.pdf	c224b2f7-3cf5-405a-9515-4e97d69687fe.pdf	2023-07-05 10:09:16.658	2023-07-05 10:09:16.658	\N	\N
243	9f506790-50ec-4ab5-99ee-539760b885a5.pdf	9f506790-50ec-4ab5-99ee-539760b885a5.pdf	2023-07-05 10:11:23.18	2023-07-05 10:11:23.18	\N	\N
244	c2cb0bda-e0f1-4754-a248-f5b935b0ebde.pdf	c2cb0bda-e0f1-4754-a248-f5b935b0ebde.pdf	2023-07-05 10:11:31.424	2023-07-05 10:11:31.424	\N	\N
245	8c3c034b-000f-4d53-bbdf-86e57ab527fb.pdf	8c3c034b-000f-4d53-bbdf-86e57ab527fb.pdf	2023-07-05 10:11:48.046	2023-07-05 10:11:48.046	\N	\N
246	3f2414cf-a3a7-4fd3-a071-df316fed4120.pdf	3f2414cf-a3a7-4fd3-a071-df316fed4120.pdf	2023-07-05 10:12:04.288	2023-07-05 10:12:04.288	\N	\N
249	b8600c36-1c4f-42f9-9fd3-fa8ab9726247.pdf	b8600c36-1c4f-42f9-9fd3-fa8ab9726247.pdf	2023-07-05 10:14:13.447	2023-07-05 10:14:13.447	\N	\N
250	7965443b-80ed-47b6-ab58-1e2aefd6a363.pdf	7965443b-80ed-47b6-ab58-1e2aefd6a363.pdf	2023-07-05 10:15:00.029	2023-07-05 10:15:00.029	\N	\N
251	b34f373b-e335-409b-b5cf-19776a60dfb7.pdf	b34f373b-e335-409b-b5cf-19776a60dfb7.pdf	2023-07-05 10:19:00.48	2023-07-05 10:19:00.48	\N	\N
252	d0c6b538-b777-4dc4-8d22-b66eebec758d.pdf	d0c6b538-b777-4dc4-8d22-b66eebec758d.pdf	2023-07-05 10:19:37.336	2023-07-05 10:19:37.336	\N	\N
253	52e1d4ab-2b41-4006-b41c-d67f016a4fb0.pdf	52e1d4ab-2b41-4006-b41c-d67f016a4fb0.pdf	2023-07-05 10:22:42.644	2023-07-05 10:22:42.644	\N	\N
258	2c106fe3-e98d-4bff-af2d-5540b74fb03d.pdf	2c106fe3-e98d-4bff-af2d-5540b74fb03d.pdf	2023-07-05 10:41:23.401	2023-07-05 10:41:23.401	\N	\N
269	eda06326-76b3-4396-b3c7-5e6c60c8c8d2.pdf	eda06326-76b3-4396-b3c7-5e6c60c8c8d2.pdf	2023-07-05 11:15:45.736	2023-07-05 11:15:45.736	\N	\N
270	c8102cb0-6688-4dd4-b73d-a112377fdae3.pdf	c8102cb0-6688-4dd4-b73d-a112377fdae3.pdf	2023-07-05 11:15:51.654	2023-07-05 11:15:51.654	\N	\N
316	e43fb570-5164-4c2f-a68b-d239227908de.pdf	e43fb570-5164-4c2f-a68b-d239227908de.pdf	2023-07-05 11:37:36.759	2023-07-05 11:37:36.759	\N	\N
317	28a071ee-ce03-4d2c-906b-aefbbc9c7a09.pdf	28a071ee-ce03-4d2c-906b-aefbbc9c7a09.pdf	2023-07-05 11:37:49.271	2023-07-05 11:37:49.271	\N	\N
318	0ecc4563-5b7c-41bf-bdf7-9ac437b3d28f.pdf	0ecc4563-5b7c-41bf-bdf7-9ac437b3d28f.pdf	2023-07-05 11:37:51.382	2023-07-05 11:37:51.382	\N	\N
319	b84109cf-12fc-4a76-af68-4f2ba6839dc0.pdf	b84109cf-12fc-4a76-af68-4f2ba6839dc0.pdf	2023-07-05 11:37:53.171	2023-07-05 11:37:53.171	\N	\N
320	7bb9231e-7c47-494c-8563-57630f6fa436.pdf	7bb9231e-7c47-494c-8563-57630f6fa436.pdf	2023-07-05 11:37:54.057	2023-07-05 11:37:54.057	\N	\N
321	e7efc72c-6ea6-4115-a576-ae04f3a91e29.pdf	e7efc72c-6ea6-4115-a576-ae04f3a91e29.pdf	2023-07-05 11:37:54.934	2023-07-05 11:37:54.934	\N	\N
322	7d5b72d2-6004-4039-9400-414d2d7015a4.pdf	7d5b72d2-6004-4039-9400-414d2d7015a4.pdf	2023-07-05 11:37:56.118	2023-07-05 11:37:56.118	\N	\N
323	4e03fadc-27df-4fd6-8708-231b4e61940e.pdf	4e03fadc-27df-4fd6-8708-231b4e61940e.pdf	2023-07-05 11:37:57.39	2023-07-05 11:37:57.39	\N	\N
324	432f92af-d00d-4be1-96d4-e32da1710fb5.pdf	432f92af-d00d-4be1-96d4-e32da1710fb5.pdf	2023-07-05 11:37:58.917	2023-07-05 11:37:58.917	\N	\N
325	d105f84c-bf90-4516-9b65-072305d3d782.pdf	d105f84c-bf90-4516-9b65-072305d3d782.pdf	2023-07-05 11:38:23.359	2023-07-05 11:38:23.359	\N	\N
326	fc1599e5-16bb-40c9-848d-1061d59e61d3.pdf	fc1599e5-16bb-40c9-848d-1061d59e61d3.pdf	2023-07-05 11:38:28.822	2023-07-05 11:38:28.822	\N	\N
335	c1bed1d0-47d8-4e47-8d8f-f0af418a48bf.pdf	c1bed1d0-47d8-4e47-8d8f-f0af418a48bf.pdf	2023-07-05 13:43:13.23	2023-07-05 13:43:13.23	\N	\N
336	4f008c4a-fea2-48c7-871e-0248040abe2e.pdf	4f008c4a-fea2-48c7-871e-0248040abe2e.pdf	2023-07-05 13:44:28.863	2023-07-05 13:44:28.863	\N	\N
337	7597dd3a-0442-414f-ac88-73b9bdc3d883.pdf	7597dd3a-0442-414f-ac88-73b9bdc3d883.pdf	2023-07-05 13:44:43.343	2023-07-05 13:44:43.343	\N	\N
338	f23203ce-18ee-4055-a5fc-da32ea5ab21e.pdf	f23203ce-18ee-4055-a5fc-da32ea5ab21e.pdf	2023-07-05 13:46:11.243	2023-07-05 13:46:11.243	\N	\N
342	97bcfa9c-7a77-4cf5-bd8e-4b2c2cad0bc4.pdf	97bcfa9c-7a77-4cf5-bd8e-4b2c2cad0bc4.pdf	2023-07-06 11:06:57.461	2023-07-06 11:06:57.461	\N	\N
343	6d7fff5c-a04e-47a7-b072-bbdf64ffcb57.pdf	6d7fff5c-a04e-47a7-b072-bbdf64ffcb57.pdf	2023-07-06 11:07:00.283	2023-07-06 11:07:00.283	\N	\N
350	55645b10-7629-4675-bbe2-b0a18981d251.pdf	55645b10-7629-4675-bbe2-b0a18981d251.pdf	2023-07-10 04:41:53.468	2023-07-10 04:41:53.468	\N	\N
356	7eabee24-cd2e-4bdd-a8bc-9d96a43fb261.pdf	7eabee24-cd2e-4bdd-a8bc-9d96a43fb261.pdf	2023-07-10 08:09:59.026	2023-07-10 08:09:59.026	\N	\N
359	ddb5c5aa-4aca-443d-976a-bd88eb58ba10.jpg	ddb5c5aa-4aca-443d-976a-bd88eb58ba10.jpg	2023-07-13 20:02:18.493	2023-07-13 20:02:18.493	\N	45385
360	8895eb2f-7391-4ab9-b4ee-dab7691c04d7.jpg	8895eb2f-7391-4ab9-b4ee-dab7691c04d7.jpg	2023-07-13 20:03:42.914	2023-07-13 20:03:42.914	\N	45385
361	24d6ede3-9e65-43c6-a545-f4905092f74a.jpg	24d6ede3-9e65-43c6-a545-f4905092f74a.jpg	2023-07-13 20:05:25.707	2023-07-13 20:05:25.707	\N	45385
362	76551b9c-db04-4108-94b1-da1cf629a773.png	76551b9c-db04-4108-94b1-da1cf629a773.png	2023-07-13 20:10:01.795	2023-07-13 20:10:01.795	\N	51466
363	b7125890-f964-4549-9f91-4c60221d3bf0.svg	b7125890-f964-4549-9f91-4c60221d3bf0.svg	2023-07-13 20:13:50.048	2023-07-13 20:13:50.048	\N	185
374	61c42fe4-6980-45c9-97a4-8786640a4f82.jpg	61c42fe4-6980-45c9-97a4-8786640a4f82.jpg	2023-07-17 07:13:29.854	2023-07-17 07:13:29.854	\N	7910
378	c99530f9-3f3f-4192-b3e3-b455ea46076e.png	c99530f9-3f3f-4192-b3e3-b455ea46076e.png	2023-07-20 12:12:11.034	2023-07-20 12:12:11.034	\N	387503
409	62870224-9eb0-4b01-8e99-d44785acc428.jpg	62870224-9eb0-4b01-8e99-d44785acc428.jpg	2023-08-09 14:49:34.864	2023-08-09 14:49:34.864	\N	516912
410	01d14172-6924-4ffd-ba85-f26ba235de3c.jpg	01d14172-6924-4ffd-ba85-f26ba235de3c.jpg	2023-08-09 14:59:23.314	2023-08-09 14:59:23.314	\N	589984
399	2934b268-5bad-46a1-976d-73a57763e557.pdf	2934b268-5bad-46a1-976d-73a57763e557.pdf	2023-08-08 08:36:26.771	2023-08-08 08:36:26.771	\N	12807
239	c5fcb76b-56f9-4f18-bd38-f821e9bd598f.pdf	c5fcb76b-56f9-4f18-bd38-f821e9bd598f.pdf	2023-07-05 10:07:11.98	2023-07-05 10:07:11.98	\N	\N
240	99f233ae-78b9-4866-9f72-75666a1b75ed.pdf	99f233ae-78b9-4866-9f72-75666a1b75ed.pdf	2023-07-05 10:08:16.597	2023-07-05 10:08:16.597	\N	\N
247	3965ba4c-9086-4df1-b911-e24401cc983e.pdf	3965ba4c-9086-4df1-b911-e24401cc983e.pdf	2023-07-05 10:12:22.549	2023-07-05 10:12:22.549	\N	\N
248	4a912b1b-67fd-4853-9ac3-d62fa63ecc9c.pdf	4a912b1b-67fd-4853-9ac3-d62fa63ecc9c.pdf	2023-07-05 10:12:57.647	2023-07-05 10:12:57.647	\N	\N
259	e0c2ed44-b953-4267-a333-05fe4b905a72.pdf	e0c2ed44-b953-4267-a333-05fe4b905a72.pdf	2023-07-05 11:00:16.772	2023-07-05 11:00:16.772	\N	\N
260	f33d5ef0-0460-4c11-b68f-10c34136d82d.pdf	f33d5ef0-0460-4c11-b68f-10c34136d82d.pdf	2023-07-05 11:00:21.226	2023-07-05 11:00:21.226	\N	\N
271	3a8df16e-c766-4d8f-b502-14a1682dd6d9.pdf	3a8df16e-c766-4d8f-b502-14a1682dd6d9.pdf	2023-07-05 11:21:59.206	2023-07-05 11:21:59.206	\N	\N
123	af46c97c-8b36-4933-a1e5-352f3c05cef6.svg	af46c97c-8b36-4933-a1e5-352f3c05cef6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
124	321fd2e2-2d08-4748-bd11-4a78d0947385.svg	321fd2e2-2d08-4748-bd11-4a78d0947385.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
125	38b281b4-e697-4b57-ae33-776bf6d606a2.svg	38b281b4-e697-4b57-ae33-776bf6d606a2.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
126	16130c1e-c7c0-4d60-bbdd-5d407185cfb6.svg	16130c1e-c7c0-4d60-bbdd-5d407185cfb6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
127	31db059d-77a4-4ff5-96c7-41dd2d3e199d.svg	31db059d-77a4-4ff5-96c7-41dd2d3e199d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
128	89fd6b1d-9d30-42b3-91fa-7a2cca45d827.svg	89fd6b1d-9d30-42b3-91fa-7a2cca45d827.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
129	976ad70f-175f-40ce-8800-8ba6fe22c96c.svg	976ad70f-175f-40ce-8800-8ba6fe22c96c.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
130	f2a4d45f-50c8-4131-be90-ed4494ae43d8.svg	f2a4d45f-50c8-4131-be90-ed4494ae43d8.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
131	cacbbe1f-085e-4855-8b2b-7ed1d32a8f6c.svg	cacbbe1f-085e-4855-8b2b-7ed1d32a8f6c.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
132	27168f0c-ce25-4af4-bea3-e2e781c71073.svg	27168f0c-ce25-4af4-bea3-e2e781c71073.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
133	56c485c8-be15-440d-8280-89a7d0a4b58b.svg	56c485c8-be15-440d-8280-89a7d0a4b58b.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
134	084f7291-7c44-4d7a-85f8-c68b1fa69f16.svg	084f7291-7c44-4d7a-85f8-c68b1fa69f16.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
135	72ce2cb5-1907-45f9-8366-fa1ef496f92d.svg	72ce2cb5-1907-45f9-8366-fa1ef496f92d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
136	6578d2ef-dc1a-4a22-9f47-c99d7d4c9237.svg	6578d2ef-dc1a-4a22-9f47-c99d7d4c9237.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
137	152ac7ee-79fa-4f54-9e5e-a4477e2983aa.svg	152ac7ee-79fa-4f54-9e5e-a4477e2983aa.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
138	1a7089fe-dc5c-4bdf-9d8e-0cf06e2c5dee.svg	1a7089fe-dc5c-4bdf-9d8e-0cf06e2c5dee.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
139	b250df4f-a6f0-4ab4-8a5c-30df803bb048.svg	b250df4f-a6f0-4ab4-8a5c-30df803bb048.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
140	134e82f9-0728-4db5-a1ba-b3b898a67166.svg	134e82f9-0728-4db5-a1ba-b3b898a67166.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
141	9274fcca-fb6c-4397-86c8-1787c93a6f12.svg	9274fcca-fb6c-4397-86c8-1787c93a6f12.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
142	b88eb59d-99a6-4c9b-8e8e-f735cb50a330.svg	b88eb59d-99a6-4c9b-8e8e-f735cb50a330.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
143	565151e9-036d-44bc-9fff-8676ade7ec73.svg	565151e9-036d-44bc-9fff-8676ade7ec73.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
144	5c034099-0dd9-4aad-99b9-08f091b2ce30.svg	5c034099-0dd9-4aad-99b9-08f091b2ce30.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
145	2f76b0df-a61d-48cb-9db2-48596916f72f.svg	2f76b0df-a61d-48cb-9db2-48596916f72f.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
146	417bdc97-6b87-4832-a99b-29660011ae65.svg	417bdc97-6b87-4832-a99b-29660011ae65.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
147	46c1e10f-950d-4384-9772-b76381c44509.svg	46c1e10f-950d-4384-9772-b76381c44509.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
148	7f1c0cf3-b5ed-4f73-8920-ab374eebe462.svg	7f1c0cf3-b5ed-4f73-8920-ab374eebe462.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
149	2d1880ff-04cf-4137-ac88-5a9e036c6cc9.svg	2d1880ff-04cf-4137-ac88-5a9e036c6cc9.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
150	adb0b92c-591d-4a78-a3ae-f96a4d2b6217.svg	adb0b92c-591d-4a78-a3ae-f96a4d2b6217.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
151	c02f2f6f-c3a6-4ef1-8ed9-3724a92a5976.svg	c02f2f6f-c3a6-4ef1-8ed9-3724a92a5976.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
152	be27d994-9d5a-435e-97de-d2e8d827f676.svg	be27d994-9d5a-435e-97de-d2e8d827f676.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
153	40a3ed35-0130-422f-b45c-3c8fc569cf18.svg	40a3ed35-0130-422f-b45c-3c8fc569cf18.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
154	34b44155-b87c-4aad-9d6b-c76213f62698.svg	34b44155-b87c-4aad-9d6b-c76213f62698.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
155	5f10dc47-1d29-48ba-9a60-dc818d846e3d.svg	5f10dc47-1d29-48ba-9a60-dc818d846e3d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
156	97046762-fefe-43a3-9259-7ba5c343d1cf.svg	97046762-fefe-43a3-9259-7ba5c343d1cf.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
157	36f78027-7b01-4714-bc7b-4d2c61e694f2.svg	36f78027-7b01-4714-bc7b-4d2c61e694f2.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
158	6a41f91e-82d9-4b61-b179-866a6b4095f5.svg	6a41f91e-82d9-4b61-b179-866a6b4095f5.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
159	830f20c5-a78a-456e-92b7-1b778f5dc1ef.svg	830f20c5-a78a-456e-92b7-1b778f5dc1ef.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
160	ec5ece1a-f4c3-4d49-8c60-480c9fcff021.svg	ec5ece1a-f4c3-4d49-8c60-480c9fcff021.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
161	24961fdd-5e72-416c-802f-66d0790c7816.svg	24961fdd-5e72-416c-802f-66d0790c7816.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
162	2a49cd17-7462-41c9-b06b-6eda0aab64bf.svg	2a49cd17-7462-41c9-b06b-6eda0aab64bf.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
163	f4377359-4b1e-4126-8faf-30fe033526a6.svg	f4377359-4b1e-4126-8faf-30fe033526a6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
164	23abe351-19cb-451a-b285-4f6907e8ebf6.svg	23abe351-19cb-451a-b285-4f6907e8ebf6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
165	de71250b-e0dd-4ee3-a743-ef0bf7d53f06.svg	de71250b-e0dd-4ee3-a743-ef0bf7d53f06.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
166	f03e3bec-683e-43ce-8b7c-4d27ab2af45e.svg	f03e3bec-683e-43ce-8b7c-4d27ab2af45e.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
167	a13f239e-15ab-4fbe-b060-7866aafcc30d.svg	a13f239e-15ab-4fbe-b060-7866aafcc30d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
168	158023fd-560b-4a76-9665-638b1d00367f.svg	158023fd-560b-4a76-9665-638b1d00367f.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
169	e9f9ac12-de02-42be-8a60-bae389011f04.svg	e9f9ac12-de02-42be-8a60-bae389011f04.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
170	4128a30f-509c-4f2a-9656-b07075e2e49c.svg	4128a30f-509c-4f2a-9656-b07075e2e49c.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
171	32343bcd-7aba-4c0d-bf04-ca3325a28815.svg	32343bcd-7aba-4c0d-bf04-ca3325a28815.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
172	823774cd-5c78-4c03-9d24-d90a67147f21.svg	823774cd-5c78-4c03-9d24-d90a67147f21.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
173	f128980e-9e94-44c2-8f70-9b5494a8f6f2.svg	f128980e-9e94-44c2-8f70-9b5494a8f6f2.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
174	254d9601-e2a1-48f3-9aff-8706e6372113.svg	254d9601-e2a1-48f3-9aff-8706e6372113.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
175	42ab1221-e126-4542-b96f-6d9ad9bfd992.svg	42ab1221-e126-4542-b96f-6d9ad9bfd992.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
176	a399f8ae-37b8-4f49-a88c-f1f0da0f261a.svg	a399f8ae-37b8-4f49-a88c-f1f0da0f261a.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
177	d3366d6e-3588-45c2-a06c-124a4f94b273.svg	d3366d6e-3588-45c2-a06c-124a4f94b273.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
178	a1fe6ed3-4251-4e93-ba36-b5914cb81507.svg	a1fe6ed3-4251-4e93-ba36-b5914cb81507.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
179	a2e435f7-4e23-42d0-b8bb-32e06b1b2485.svg	a2e435f7-4e23-42d0-b8bb-32e06b1b2485.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
180	113577db-464d-4028-a478-225ed07c4b65.svg	113577db-464d-4028-a478-225ed07c4b65.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
181	06c832df-7a93-4216-9cb6-c78d2b39558b.svg	06c832df-7a93-4216-9cb6-c78d2b39558b.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
182	35346e1b-bfac-4592-8dd7-0df160aba9b2.svg	35346e1b-bfac-4592-8dd7-0df160aba9b2.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
183	9e87c581-b4dd-4018-a50b-5456e0243452.svg	9e87c581-b4dd-4018-a50b-5456e0243452.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
184	d15cbf27-4f05-4640-895b-128bc91847e2.svg	d15cbf27-4f05-4640-895b-128bc91847e2.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
185	5ff2918e-3b0e-4640-9da1-e2e90bb16138.svg	5ff2918e-3b0e-4640-9da1-e2e90bb16138.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
186	927ad1e6-905c-42de-8e7d-7cad68e8a392.svg	927ad1e6-905c-42de-8e7d-7cad68e8a392.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
187	28c5053a-4e5a-40b2-bbfd-6dad7884b1d5.svg	28c5053a-4e5a-40b2-bbfd-6dad7884b1d5.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
188	4a6c0114-7b6c-413b-bf2b-d715bd29fa5d.svg	4a6c0114-7b6c-413b-bf2b-d715bd29fa5d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
189	603fc35b-6ea0-4b75-9da5-a02e022dde2f.svg	603fc35b-6ea0-4b75-9da5-a02e022dde2f.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
190	2f02af27-4d5a-4e1c-af00-0fa88dde30e6.svg	2f02af27-4d5a-4e1c-af00-0fa88dde30e6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
191	6edbbbfa-931b-4441-b61f-53f5c952e0e6.svg	6edbbbfa-931b-4441-b61f-53f5c952e0e6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
192	5fd343f8-7acb-49c8-b4de-ab1105f780d0.svg	5fd343f8-7acb-49c8-b4de-ab1105f780d0.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
193	3e9d8538-f344-4892-8881-2f1fcb2d2cc7.svg	3e9d8538-f344-4892-8881-2f1fcb2d2cc7.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
194	6700a3b7-aae5-4de2-af47-c271301bfef0.svg	6700a3b7-aae5-4de2-af47-c271301bfef0.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
195	095c1d9d-30b7-4c04-b7a2-51865f020ea6.svg	095c1d9d-30b7-4c04-b7a2-51865f020ea6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
196	61668ce6-8e65-4f40-afb4-a551dc0f8137.svg	61668ce6-8e65-4f40-afb4-a551dc0f8137.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
197	191e47b6-c9df-47d7-a407-09bcc8a21b16.svg	191e47b6-c9df-47d7-a407-09bcc8a21b16.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
198	180dd866-d74e-495a-8eb9-15ebf1a740a6.svg	180dd866-d74e-495a-8eb9-15ebf1a740a6.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
199	52dec221-0371-47a5-9808-3a0cc1d67dd1.svg	52dec221-0371-47a5-9808-3a0cc1d67dd1.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
200	5a76129c-1464-4e73-a312-2de723165b33.svg	5a76129c-1464-4e73-a312-2de723165b33.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
201	964bffe8-6403-4712-8fe8-599f3258af34.svg	964bffe8-6403-4712-8fe8-599f3258af34.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
202	ee71c9c2-f626-4ea1-a2bb-0597cc2cf2bd.svg	ee71c9c2-f626-4ea1-a2bb-0597cc2cf2bd.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
203	fd165205-786d-4192-88ae-e8d1f1667c5c.svg	fd165205-786d-4192-88ae-e8d1f1667c5c.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
204	16a2315f-92f4-492f-b255-c474619f98cf.svg	16a2315f-92f4-492f-b255-c474619f98cf.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
205	606ccaf5-cd88-4178-b388-67301f49c317.svg	606ccaf5-cd88-4178-b388-67301f49c317.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
206	ad0b6ba8-6f59-448e-be85-402fba979bb9.svg	ad0b6ba8-6f59-448e-be85-402fba979bb9.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
207	e24bd999-e413-430d-8975-0e89ee553d74.svg	e24bd999-e413-430d-8975-0e89ee553d74.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
208	e7cf4fdc-af12-473b-bf4f-db00bf3aa98d.svg	e7cf4fdc-af12-473b-bf4f-db00bf3aa98d.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
209	07805b1e-dfc4-4d6c-bd10-64e0c0362d08.svg	07805b1e-dfc4-4d6c-bd10-64e0c0362d08.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
210	15556954-0f12-4bd6-8885-aaa51be4411e.svg	15556954-0f12-4bd6-8885-aaa51be4411e.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
211	48a3f125-b869-4e96-bd0f-8d238dee7e06.svg	48a3f125-b869-4e96-bd0f-8d238dee7e06.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
212	4f524404-e0db-4e06-8dd9-f7e43ff18420.svg	4f524404-e0db-4e06-8dd9-f7e43ff18420.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
213	3dc72f4f-7919-41b2-8cdb-eb19dd01b066.svg	3dc72f4f-7919-41b2-8cdb-eb19dd01b066.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
214	50e3ad7b-7e87-46f7-a9e7-2e9b2c8e6618.svg	50e3ad7b-7e87-46f7-a9e7-2e9b2c8e6618.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
215	5a5a88b0-5896-4e3e-af24-c8c843e5c611.svg	5a5a88b0-5896-4e3e-af24-c8c843e5c611.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
216	73d66866-b4a0-4852-b56f-3372a343e130.svg	73d66866-b4a0-4852-b56f-3372a343e130.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
217	b52cb174-2f42-4edd-9b93-f7de6bf085d9.svg	b52cb174-2f42-4edd-9b93-f7de6bf085d9.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
218	b8f9f4aa-9510-474c-8f12-6b32d15d9cd0.svg	b8f9f4aa-9510-474c-8f12-6b32d15d9cd0.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
219	4f750578-af4a-4214-8cde-43c62c07a4dc.svg	4f750578-af4a-4214-8cde-43c62c07a4dc.svg	2023-06-08 20:54:25.99	2023-06-08 20:54:25.99	\N	\N
228	d3b37bae-3921-416b-ab9d-edfea858ee96.pdf	d3b37bae-3921-416b-ab9d-edfea858ee96.pdf	2023-06-19 08:12:07.666	2023-06-19 08:12:07.666	\N	\N
254	92b51c1d-33fd-4d2a-9830-bb5c3467b4e3.pdf	92b51c1d-33fd-4d2a-9830-bb5c3467b4e3.pdf	2023-07-05 10:22:44.867	2023-07-05 10:22:44.867	\N	\N
261	ed6cecae-17ef-43b6-a1b8-48ea59595893.pdf	ed6cecae-17ef-43b6-a1b8-48ea59595893.pdf	2023-07-05 11:05:21.217	2023-07-05 11:05:21.217	\N	\N
272	2c9a8595-3e26-447b-9bed-3ed62ab56624.pdf	2c9a8595-3e26-447b-9bed-3ed62ab56624.pdf	2023-07-05 11:22:09.381	2023-07-05 11:22:09.381	\N	\N
273	dc950998-75cc-43e7-9bbc-7289fba63942.pdf	dc950998-75cc-43e7-9bbc-7289fba63942.pdf	2023-07-05 11:22:12.347	2023-07-05 11:22:12.347	\N	\N
274	e97dc033-79b9-4a2f-a810-115e60368339.pdf	e97dc033-79b9-4a2f-a810-115e60368339.pdf	2023-07-05 11:22:15.076	2023-07-05 11:22:15.076	\N	\N
275	3ef7b9fb-4335-4ee0-8bac-da023d16ce3e.pdf	3ef7b9fb-4335-4ee0-8bac-da023d16ce3e.pdf	2023-07-05 11:23:02.21	2023-07-05 11:23:02.21	\N	\N
276	83d82921-ef91-4f9a-a3da-9b720497941e.pdf	83d82921-ef91-4f9a-a3da-9b720497941e.pdf	2023-07-05 11:23:04.54	2023-07-05 11:23:04.54	\N	\N
277	6b690bfe-f6bf-4fa9-83a7-bca76c288bad.pdf	6b690bfe-f6bf-4fa9-83a7-bca76c288bad.pdf	2023-07-05 11:23:16.783	2023-07-05 11:23:16.783	\N	\N
278	60843742-1dce-4e9e-b448-58c54665cb4e.pdf	60843742-1dce-4e9e-b448-58c54665cb4e.pdf	2023-07-05 11:23:18.498	2023-07-05 11:23:18.498	\N	\N
279	aea4b4df-284f-4f94-a41c-97e951074420.pdf	aea4b4df-284f-4f94-a41c-97e951074420.pdf	2023-07-05 11:23:20.459	2023-07-05 11:23:20.459	\N	\N
280	1f05c573-8352-4bb9-b380-7ca673fb34a2.pdf	1f05c573-8352-4bb9-b380-7ca673fb34a2.pdf	2023-07-05 11:23:24.664	2023-07-05 11:23:24.664	\N	\N
281	c67bd7b9-69a5-46a5-b540-175198e65af5.pdf	c67bd7b9-69a5-46a5-b540-175198e65af5.pdf	2023-07-05 11:23:27.249	2023-07-05 11:23:27.249	\N	\N
282	5343d739-3564-4b97-9173-ca9384f23bb6.pdf	5343d739-3564-4b97-9173-ca9384f23bb6.pdf	2023-07-05 11:23:30.066	2023-07-05 11:23:30.066	\N	\N
283	f1e628b2-c10f-4434-a62a-cd168a4ef143.pdf	f1e628b2-c10f-4434-a62a-cd168a4ef143.pdf	2023-07-05 11:23:34.878	2023-07-05 11:23:34.878	\N	\N
284	78d56b9c-a730-402c-9095-34bfd4fd66a5.pdf	78d56b9c-a730-402c-9095-34bfd4fd66a5.pdf	2023-07-05 11:23:44.595	2023-07-05 11:23:44.595	\N	\N
285	50ae4fb9-9c44-4af5-b60b-a5d6fa1df460.pdf	50ae4fb9-9c44-4af5-b60b-a5d6fa1df460.pdf	2023-07-05 11:23:52.014	2023-07-05 11:23:52.014	\N	\N
286	9758525f-55c5-484d-b49f-89466b73007b.pdf	9758525f-55c5-484d-b49f-89466b73007b.pdf	2023-07-05 11:26:18.882	2023-07-05 11:26:18.882	\N	\N
287	f1520cd7-1f82-4595-b9cf-23ce3c727a2b.pdf	f1520cd7-1f82-4595-b9cf-23ce3c727a2b.pdf	2023-07-05 11:27:03.908	2023-07-05 11:27:03.908	\N	\N
288	cd9b6d2a-9a96-462d-8103-221dde0fff94.pdf	cd9b6d2a-9a96-462d-8103-221dde0fff94.pdf	2023-07-05 11:27:05.867	2023-07-05 11:27:05.867	\N	\N
289	b3c350be-316e-4b35-ae7e-ce0dcd18deb7.pdf	b3c350be-316e-4b35-ae7e-ce0dcd18deb7.pdf	2023-07-05 11:27:11.926	2023-07-05 11:27:11.926	\N	\N
290	ca5ba079-72cb-4f6b-8e0e-f91e35030eae.pdf	ca5ba079-72cb-4f6b-8e0e-f91e35030eae.pdf	2023-07-05 11:27:13.977	2023-07-05 11:27:13.977	\N	\N
291	2c4d7e15-5e6a-4627-be29-a92db9d38fdb.pdf	2c4d7e15-5e6a-4627-be29-a92db9d38fdb.pdf	2023-07-05 11:27:15.531	2023-07-05 11:27:15.531	\N	\N
292	43155e00-9b2d-4b51-bc4c-33fed70e0caa.pdf	43155e00-9b2d-4b51-bc4c-33fed70e0caa.pdf	2023-07-05 11:27:17.667	2023-07-05 11:27:17.667	\N	\N
293	fb7caab6-c4ac-4bf1-86c9-38894707d91a.pdf	fb7caab6-c4ac-4bf1-86c9-38894707d91a.pdf	2023-07-05 11:27:19.347	2023-07-05 11:27:19.347	\N	\N
294	28041184-eaac-428a-b8d2-e237fe1b52fd.pdf	28041184-eaac-428a-b8d2-e237fe1b52fd.pdf	2023-07-05 11:27:23.449	2023-07-05 11:27:23.449	\N	\N
295	74436ba2-0a8e-4fc7-a599-a2565a2a9969.pdf	74436ba2-0a8e-4fc7-a599-a2565a2a9969.pdf	2023-07-05 11:27:34.568	2023-07-05 11:27:34.568	\N	\N
327	f26faede-5003-4ff9-a9c6-34b2a9166e98.pdf	f26faede-5003-4ff9-a9c6-34b2a9166e98.pdf	2023-07-05 13:30:13.457	2023-07-05 13:30:13.457	\N	\N
330	0a1fe10d-4582-4f9a-8e70-cb7170534887.pdf	0a1fe10d-4582-4f9a-8e70-cb7170534887.pdf	2023-07-05 13:30:32.531	2023-07-05 13:30:32.531	\N	\N
339	566d916e-fd24-4680-a257-d0a764ec1323.pdf	566d916e-fd24-4680-a257-d0a764ec1323.pdf	2023-07-06 04:51:32.611	2023-07-06 04:51:32.611	\N	\N
344	1afff94d-9b0e-4ef7-8f17-eb9d2251d146.pdf	1afff94d-9b0e-4ef7-8f17-eb9d2251d146.pdf	2023-07-06 11:13:13.992	2023-07-06 11:13:13.992	\N	\N
345	cda5d671-3870-4389-9882-ac637711b267.pdf	cda5d671-3870-4389-9882-ac637711b267.pdf	2023-07-06 11:13:17.194	2023-07-06 11:13:17.194	\N	\N
346	8f4f2578-aea3-403d-9489-10e25fae11f5.pdf	8f4f2578-aea3-403d-9489-10e25fae11f5.pdf	2023-07-06 11:13:19.624	2023-07-06 11:13:19.624	\N	\N
347	fbd2c4d3-88fa-43fb-99a1-16d9dc401c14.pdf	fbd2c4d3-88fa-43fb-99a1-16d9dc401c14.pdf	2023-07-06 11:17:10.832	2023-07-06 11:17:10.832	\N	\N
351	b9dbabb4-bc57-4453-b278-3c6c74363d5b.pdf	b9dbabb4-bc57-4453-b278-3c6c74363d5b.pdf	2023-07-10 06:38:07.481	2023-07-10 06:38:07.481	\N	\N
364	8e248f49-b0a4-4a4e-af5b-110150969c7c.jpg	8e248f49-b0a4-4a4e-af5b-110150969c7c.jpg	2023-07-14 09:28:01.618	2023-07-14 09:28:01.618	\N	7910
375	0af599d7-3f29-47b1-84b4-2800ecdc473c.jpg	0af599d7-3f29-47b1-84b4-2800ecdc473c.jpg	2023-07-17 07:33:20.357	2023-07-17 07:33:20.357	\N	7910
400	158a8d7e-71da-4ea7-ba9f-64b54d7a3b77.jpg	158a8d7e-71da-4ea7-ba9f-64b54d7a3b77.jpg	2023-08-09 14:37:30.911	2023-08-09 14:37:30.911	\N	144143
401	42405e9e-afea-4ea6-9b68-4756d2875042.jpg	42405e9e-afea-4ea6-9b68-4756d2875042.jpg	2023-08-09 14:38:22.888	2023-08-09 14:38:22.888	\N	144143
411	c3074c85-84d0-44e5-98f2-f22628d45311.jpg	c3074c85-84d0-44e5-98f2-f22628d45311.jpg	2023-08-09 14:59:23.314	2023-08-09 14:59:23.314	\N	461777
412	08147f1c-6d74-45e3-bc22-65d686902f65.jpg	08147f1c-6d74-45e3-bc22-65d686902f65.jpg	2023-08-09 15:01:27.641	2023-08-09 15:01:27.641	\N	461777
413	7011f41f-bd44-41a8-9592-07ca06a0ed42.jpg	7011f41f-bd44-41a8-9592-07ca06a0ed42.jpg	2023-08-09 15:01:27.641	2023-08-09 15:01:27.641	\N	836592
414	df321152-8db2-47c8-af8c-b1061d253165.jpg	df321152-8db2-47c8-af8c-b1061d253165.jpg	2023-08-09 15:01:27.641	2023-08-09 15:01:27.641	\N	475780
415	2b1f1e3e-bc86-4d95-9d0b-592b6044a199.jpg	2b1f1e3e-bc86-4d95-9d0b-592b6044a199.jpg	2023-08-09 15:10:36.866	2023-08-09 15:10:36.866	\N	589984
416	84cc8db3-fb56-4e62-98f7-9dc4780bec06.jpg	84cc8db3-fb56-4e62-98f7-9dc4780bec06.jpg	2023-08-09 15:10:36.866	2023-08-09 15:10:36.866	\N	565231
417	1ac84a9d-8859-4c8f-868b-4749d027bdf8.jpg	1ac84a9d-8859-4c8f-868b-4749d027bdf8.jpg	2023-08-09 15:10:36.866	2023-08-09 15:10:36.866	\N	501690
418	8a6183d2-4112-4606-9cd4-b99e7ecdc410.jpg	8a6183d2-4112-4606-9cd4-b99e7ecdc410.jpg	2023-08-09 18:10:34.684	2023-08-09 18:10:34.684	\N	475780
419	894ba716-cf1a-4d3e-ab7f-6a589c69fe43.jpg	894ba716-cf1a-4d3e-ab7f-6a589c69fe43.jpg	2023-08-09 18:10:34.684	2023-08-09 18:10:34.684	\N	588237
420	04c7ec06-a287-48fe-a8e9-33d861af8823.jpg	04c7ec06-a287-48fe-a8e9-33d861af8823.jpg	2023-08-09 18:10:34.684	2023-08-09 18:10:34.684	\N	573379
421	6450ce54-cbd8-48a2-90f9-83b055136e62.jpg	6450ce54-cbd8-48a2-90f9-83b055136e62.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	589984
422	3a7606ec-dec5-46f3-a70a-2545926f5b2e.jpg	3a7606ec-dec5-46f3-a70a-2545926f5b2e.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	565231
423	b6ad7614-ddfb-489a-8769-c175d6fb9bd3.jpg	b6ad7614-ddfb-489a-8769-c175d6fb9bd3.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	501690
424	cba86c2e-8cdb-4a10-b4cb-7b25bb3a7bb9.jpg	cba86c2e-8cdb-4a10-b4cb-7b25bb3a7bb9.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	947544
425	040aaa57-ec6e-4831-b038-9f13f4adcd1b.jpg	040aaa57-ec6e-4831-b038-9f13f4adcd1b.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	516912
426	1002c097-e3b6-4c24-9f35-b79651f399ec.jpg	1002c097-e3b6-4c24-9f35-b79651f399ec.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	510464
427	2c822d37-759d-4afb-8cd8-32c693a78126.jpg	2c822d37-759d-4afb-8cd8-32c693a78126.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	291151
428	798ccc5c-07d8-4122-ac30-99f6e77e532f.jpg	798ccc5c-07d8-4122-ac30-99f6e77e532f.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	461777
429	bc6d7233-6fb2-4a8a-843d-5b4a2608e8b5.jpg	bc6d7233-6fb2-4a8a-843d-5b4a2608e8b5.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	836592
430	02159455-cc20-40b4-88ab-f48f6b5535f1.jpg	02159455-cc20-40b4-88ab-f48f6b5535f1.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	475780
431	52da61e7-8c97-4627-9da6-8fadc9a1d8a2.jpg	52da61e7-8c97-4627-9da6-8fadc9a1d8a2.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	588237
432	d4b6b042-2cd9-48eb-a0cb-a80a41e08f51.jpg	d4b6b042-2cd9-48eb-a0cb-a80a41e08f51.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	573379
433	13c6be36-ae5f-4544-83f2-b3b24211f399.jpg	13c6be36-ae5f-4544-83f2-b3b24211f399.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	810075
434	042d9e13-8fa3-47c1-af24-4997c68b0dbd.jpg	042d9e13-8fa3-47c1-af24-4997c68b0dbd.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	461673
435	945e7d04-6a31-4440-ac56-279c8414ac2e.jpg	945e7d04-6a31-4440-ac56-279c8414ac2e.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	95741
436	55f596bb-7b99-4443-880c-f7bec92fe026.jpg	55f596bb-7b99-4443-880c-f7bec92fe026.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	715981
437	47a2dcc0-2ce8-4830-9c03-0399fd6e6364.jpg	47a2dcc0-2ce8-4830-9c03-0399fd6e6364.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	119138
438	705762eb-927f-4762-a4cc-3aa5078b5cc5.jpg	705762eb-927f-4762-a4cc-3aa5078b5cc5.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	81940
439	00d7fd8c-3137-4723-bca4-7eb046437dfa.jpg	00d7fd8c-3137-4723-bca4-7eb046437dfa.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	27351
440	f9af3347-e61c-4a41-a58d-bde4d00a702a.jpg	f9af3347-e61c-4a41-a58d-bde4d00a702a.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	526576
441	c1ae7c9e-2f05-479b-b742-06fd95362c98.jpg	c1ae7c9e-2f05-479b-b742-06fd95362c98.jpg	2023-08-09 18:38:58	2023-08-09 18:38:58	\N	815086
442	21534b1f-76fa-4d97-8c89-a076d36c4966.jpg	21534b1f-76fa-4d97-8c89-a076d36c4966.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	589984
443	eeec5e32-dda5-4f98-a84a-99efb1319530.jpg	eeec5e32-dda5-4f98-a84a-99efb1319530.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	565231
444	884a129f-c8e8-4453-a244-e3af5169363b.jpg	884a129f-c8e8-4453-a244-e3af5169363b.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	501690
445	83f87819-e894-428e-90b1-1910d7ae7b01.jpg	83f87819-e894-428e-90b1-1910d7ae7b01.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	947544
446	e83ffdf3-80b5-497d-ad8b-ba69971d1651.jpg	e83ffdf3-80b5-497d-ad8b-ba69971d1651.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	516912
447	53838950-bcd9-499a-8754-278f0dbaa7cd.jpg	53838950-bcd9-499a-8754-278f0dbaa7cd.jpg	2023-08-09 18:46:08.024	2023-08-09 18:46:08.024	\N	510464
448	97f7da3f-5cd7-414a-9ac4-34bcf034619a.jpg	97f7da3f-5cd7-414a-9ac4-34bcf034619a.jpg	2023-08-09 18:56:42.979	2023-08-09 18:56:42.979	\N	475780
449	a9bead87-a689-4976-9b25-0127f0f29fc3.jpg	a9bead87-a689-4976-9b25-0127f0f29fc3.jpg	2023-08-09 18:56:42.979	2023-08-09 18:56:42.979	\N	588237
450	1357c854-f750-4a95-bdde-c9f4f3f95ddc.jpg	1357c854-f750-4a95-bdde-c9f4f3f95ddc.jpg	2023-08-09 18:56:42.979	2023-08-09 18:56:42.979	\N	573379
451	4634fd3c-2f3e-46d4-92b8-7e21e5afe5db.jpg	4634fd3c-2f3e-46d4-92b8-7e21e5afe5db.jpg	2023-08-09 18:57:10.869	2023-08-09 18:57:10.869	\N	464153
452	1178eeff-71c6-472d-a7a1-6c72ef716d31.jpg	1178eeff-71c6-472d-a7a1-6c72ef716d31.jpg	2023-08-09 18:57:10.869	2023-08-09 18:57:10.869	\N	428245
453	8d1fa1ff-474a-4802-896f-98778cdd369b.jpg	8d1fa1ff-474a-4802-896f-98778cdd369b.jpg	2023-08-09 18:57:10.869	2023-08-09 18:57:10.869	\N	676579
454	9e6543e6-4f98-436e-8f6f-aec2d465f706.jpg	9e6543e6-4f98-436e-8f6f-aec2d465f706.jpg	2023-08-09 18:57:58.976	2023-08-09 18:57:58.976	\N	589984
455	b49bf04d-dd88-400a-8394-4ab208654ed2.jpg	b49bf04d-dd88-400a-8394-4ab208654ed2.jpg	2023-08-09 18:57:58.976	2023-08-09 18:57:58.976	\N	565231
456	a9930cea-5d72-4ea2-8930-ea38b85ff5fb.jpg	a9930cea-5d72-4ea2-8930-ea38b85ff5fb.jpg	2023-08-09 18:57:58.976	2023-08-09 18:57:58.976	\N	501690
457	6e108b3d-00e1-4cf2-ae60-556535000fff.jpg	6e108b3d-00e1-4cf2-ae60-556535000fff.jpg	2023-08-09 18:57:58.976	2023-08-09 18:57:58.976	\N	947544
471	a01ab5ae-0bf8-4a8c-8f2c-b86808821036.jpg	a01ab5ae-0bf8-4a8c-8f2c-b86808821036.jpg	2023-08-09 19:31:27.14	2023-08-09 19:31:27.14	\N	715981
472	e9393a64-15da-4f6d-bcbc-32c18d5c02fa.jpg	e9393a64-15da-4f6d-bcbc-32c18d5c02fa.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	189182
473	a76ee63d-e8b4-4476-bf92-6838ba58d965.jpg	a76ee63d-e8b4-4476-bf92-6838ba58d965.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	31600
474	643daf10-ea58-4715-9bee-0f65f54679de.jpg	643daf10-ea58-4715-9bee-0f65f54679de.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	21567
475	b52642ec-3b23-4c90-b192-78b67f9246f7.jpg	b52642ec-3b23-4c90-b192-78b67f9246f7.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	541053
476	26f66718-c9a9-4411-bc3c-8b5413dbd230.jpg	26f66718-c9a9-4411-bc3c-8b5413dbd230.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	28077
477	c273f53e-4713-47ba-bc33-ed0c47392779.jpg	c273f53e-4713-47ba-bc33-ed0c47392779.jpg	2023-08-09 21:10:44.932	2023-08-09 21:10:44.932	\N	30381
485	482e42f7-06a2-4eb1-990d-8ab8eb42b603.jpg	482e42f7-06a2-4eb1-990d-8ab8eb42b603.jpg	2023-08-10 07:32:13.553	2023-08-10 07:32:13.553	\N	836592
486	8ce23c49-09f3-4336-ab0c-b9221ff7eca9.jpg	8ce23c49-09f3-4336-ab0c-b9221ff7eca9.jpg	2023-08-10 07:35:36.215	2023-08-10 07:35:36.215	\N	189182
487	5380ab07-b2dc-4c61-b539-ac965c99e620.jpg	5380ab07-b2dc-4c61-b539-ac965c99e620.jpg	2023-08-10 07:38:16.665	2023-08-10 07:38:16.665	\N	541053
482	87d36adf-386b-4ebb-be20-63174b803bbb.jpg	87d36adf-386b-4ebb-be20-63174b803bbb.jpg	2023-08-10 07:15:56.759	2023-08-10 07:15:56.759	\N	291151
481	189adf22-ab10-490e-9617-0c946bb99f04.jpg	189adf22-ab10-490e-9617-0c946bb99f04.jpg	2023-08-10 07:14:59.141	2023-08-10 07:14:59.141	\N	475780
479	eddccce0-eb00-4043-9680-6075ac80e66c.jpg	eddccce0-eb00-4043-9680-6075ac80e66c.jpg	2023-08-10 06:52:07.106	2023-08-10 06:52:07.106	\N	74241
483	23753a94-beca-4b1b-abb0-80b0ea08149b.jpg	23753a94-beca-4b1b-abb0-80b0ea08149b.jpg	2023-08-10 07:15:56.759	2023-08-10 07:15:56.759	\N	461777
484	3867e88b-468f-4015-803e-cdbada36b551.jpg	3867e88b-468f-4015-803e-cdbada36b551.jpg	2023-08-10 07:17:37.031	2023-08-10 07:17:37.031	\N	74241
480	5fcfa388-1232-4c03-9373-3ea96bdf37b0.jpg	5fcfa388-1232-4c03-9373-3ea96bdf37b0.jpg	2023-08-10 07:11:05.817	2023-08-10 07:11:05.817	\N	74241
478	01511e62-751b-44b3-9bd4-0db4fba7d9b2.jpg	01511e62-751b-44b3-9bd4-0db4fba7d9b2.jpg	2023-08-10 06:45:41.325	2023-08-10 06:45:41.325	\N	74241
379	99ec0e45-478c-41e2-a5b6-3976758d8cb8.pdf	99ec0e45-478c-41e2-a5b6-3976758d8cb8.pdf	2023-08-04 04:42:20.949	2023-08-04 04:42:20.949	\N	10184
390	76aefded-ab10-4379-bc7c-cea9e3150fb3.pdf	76aefded-ab10-4379-bc7c-cea9e3150fb3.pdf	2023-08-08 06:01:09.975	2023-08-08 06:01:09.975	\N	12807
385	15c5803d-76b2-400e-a5c5-41f9829275ac.pdf	15c5803d-76b2-400e-a5c5-41f9829275ac.pdf	2023-08-04 09:54:19.324	2023-08-04 09:54:19.324	\N	10184
394	66f8e1bc-a8ba-4517-95a6-46e74d891e6e.pdf	66f8e1bc-a8ba-4517-95a6-46e74d891e6e.pdf	2023-08-08 06:50:36.927	2023-08-08 06:50:36.927	\N	12807
391	90976e8f-8749-4f26-abec-6756183cc5f4.pdf	90976e8f-8749-4f26-abec-6756183cc5f4.pdf	2023-08-08 06:01:10.224	2023-08-08 06:01:10.224	\N	12807
397	b482a4c8-5299-4550-a420-8e38b708cd31.pdf	b482a4c8-5299-4550-a420-8e38b708cd31.pdf	2023-08-08 07:47:01.444	2023-08-08 07:47:01.444	\N	12807
389	220dd7e3-fb71-4525-b91d-1dc1ecfd8e21.pdf	220dd7e3-fb71-4525-b91d-1dc1ecfd8e21.pdf	2023-08-07 12:47:41.911	2023-08-07 12:47:41.911	\N	12807
380	b8be904b-ebba-456a-a317-0e980057a130.pdf	b8be904b-ebba-456a-a317-0e980057a130.pdf	2023-08-04 04:42:28.324	2023-08-04 04:42:28.324	\N	10184
384	6944d330-5953-49ee-98c9-bcadad3f9540.pdf	6944d330-5953-49ee-98c9-bcadad3f9540.pdf	2023-08-04 09:34:35.896	2023-08-04 09:34:35.896	\N	10184
383	9be56be9-44bf-49a1-be85-a3ea4a7a5013.pdf	9be56be9-44bf-49a1-be85-a3ea4a7a5013.pdf	2023-08-04 05:21:38.649	2023-08-04 05:21:38.649	\N	10184
388	5dd834ed-4ba1-45a7-a9f9-ab3502b06162.pdf	5dd834ed-4ba1-45a7-a9f9-ab3502b06162.pdf	2023-08-04 10:55:23.433	2023-08-04 10:55:23.433	\N	10184
398	9347a08a-48e7-40c0-9d00-b16271cdd9ea.pdf	9347a08a-48e7-40c0-9d00-b16271cdd9ea.pdf	2023-08-08 08:30:51.245	2023-08-08 08:30:51.245	\N	12807
396	ded02df4-dfb0-4254-a362-da747f949f42.pdf	ded02df4-dfb0-4254-a362-da747f949f42.pdf	2023-08-08 07:14:57.284	2023-08-08 07:14:57.284	\N	12807
393	001682ec-d48c-4feb-9942-2e685af195c6.pdf	001682ec-d48c-4feb-9942-2e685af195c6.pdf	2023-08-08 06:13:26.699	2023-08-08 06:13:26.699	\N	12807
395	4a5000d3-2145-4c6c-b200-819811dfeae6.pdf	4a5000d3-2145-4c6c-b200-819811dfeae6.pdf	2023-08-08 07:14:53.968	2023-08-08 07:14:53.968	\N	12807
392	460f8cf4-e4cc-4e75-867e-ffdf359afdd6.pdf	460f8cf4-e4cc-4e75-867e-ffdf359afdd6.pdf	2023-08-08 06:10:05.167	2023-08-08 06:10:05.167	\N	12807
387	c3164a2f-444d-491d-abf8-5514d1938063.pdf	c3164a2f-444d-491d-abf8-5514d1938063.pdf	2023-08-04 10:25:52.977	2023-08-04 10:25:52.977	\N	10184
381	cb844079-ba16-4340-80b4-4a5f9cbd775d.pdf	cb844079-ba16-4340-80b4-4a5f9cbd775d.pdf	2023-08-04 04:43:01.081	2023-08-04 04:43:01.081	\N	10184
489	206b0c5f-d4ee-4e9e-8213-f0e4a40008e2.jpg	206b0c5f-d4ee-4e9e-8213-f0e4a40008e2.jpg	2023-08-10 07:42:42.266	2023-08-10 07:42:42.266	\N	74241
490	18c33782-43a5-4113-88f1-494298378e96.jpg	18c33782-43a5-4113-88f1-494298378e96.jpg	2023-08-10 07:59:06.155	2023-08-10 07:59:06.155	\N	74241
491	cee699b9-9368-47de-9d4e-edfb93396e71.jpg	cee699b9-9368-47de-9d4e-edfb93396e71.jpg	2023-08-10 07:59:47.726	2023-08-10 07:59:47.726	\N	541053
492	73c42ec6-09ab-43ad-8b1c-758b358619b7.jpg	73c42ec6-09ab-43ad-8b1c-758b358619b7.jpg	2023-08-10 08:09:16.834	2023-08-10 08:09:16.834	\N	541053
493	499318ad-f244-425a-96a8-0065e14dba0a.jpg	499318ad-f244-425a-96a8-0065e14dba0a.jpg	2023-08-10 08:09:22.416	2023-08-10 08:09:22.416	\N	541053
494	da985525-81f1-4778-af66-fa8a9b5e796a.jpg	da985525-81f1-4778-af66-fa8a9b5e796a.jpg	2023-08-10 08:09:27.209	2023-08-10 08:09:27.209	\N	541053
495	cf703846-a2d0-42ac-a34e-45c116efb549.jpg	cf703846-a2d0-42ac-a34e-45c116efb549.jpg	2023-08-10 08:09:35.278	2023-08-10 08:09:35.278	\N	541053
496	dbc83c7a-bc1f-4608-9329-46cc3b133f47.jpg	dbc83c7a-bc1f-4608-9329-46cc3b133f47.jpg	2023-08-10 08:09:42.044	2023-08-10 08:09:42.044	\N	189182
513	./static/8be5e5af-8f46-46bc-b353-ed15ff613731.pdf	8be5e5af-8f46-46bc-b353-ed15ff613731.pdf	2023-08-13 11:33:35.922	2023-08-13 11:33:35.922	\N	12864
530	static/44382d95-fb32-4f02-9ede-ca329b482829.pdf	44382d95-fb32-4f02-9ede-ca329b482829.pdf	2023-08-15 05:58:05.81	2023-08-15 05:58:05.81	\N	15470
549	static/925db833-fb9b-4194-a2c7-485842e9eb55.pdf	925db833-fb9b-4194-a2c7-485842e9eb55.pdf	2023-08-17 11:02:54.748	2023-08-17 11:02:54.748	\N	13836
570	71b585bd-1981-4bea-b712-1ad26c75c4a5.jpg	71b585bd-1981-4bea-b712-1ad26c75c4a5.jpg	2023-08-21 20:37:21.144	2023-08-21 20:37:21.144	\N	475780
577	353b3a83-868c-4f01-82d0-6cf18ce60c47.jpg	353b3a83-868c-4f01-82d0-6cf18ce60c47.jpg	2023-08-21 20:47:58.424	2023-08-21 20:47:58.424	\N	119138
\.


--
-- Data for Name: Fabrik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fabrik" (id, name, description, minimum_order_quantity, capacity, created_at, updated_at, deleted_at, document_id, email, inn, password, "phoneNumber", is_confirmed) FROM stdin;
2	ООО "Тянь-Шань Премиум"	Швейное производство полного цикла. Специализируется на пошиве женской, мужской и детской одежды из тканей и трикотажных материалов. Работа.т на давальческом сырье.	1	50000	2023-07-11 09:51:22.499	2023-08-18 10:39:50.494	\N	495	fabrik@test.ru	561010369200	$2b$04$N.TE5PbBXmMa4MEO7sfLkeItB9GLHHR9t7QeiyaCSdnak8vXH3IiO	89619134546	t
8	АО Швейная Фабрика "Ишимская"		1	1000	2023-08-14 10:18:21.943	2023-08-14 10:31:42.151	\N	\N	masoro7226@tiuas.com	7205009367	$2b$04$cj3gwmZp/Az2rCNdGJwwhOp7OCiKj1natPTVnQ2whX3lcYYox3KxW	89192345718	f
13	ООО "Алекс-Софт"	Лучшая фабрика	1000	2000	2023-08-17 09:10:34.918	2023-08-17 09:18:13.549	\N	\N	966512@gmail.com	5612068967	$2b$04$AVFS9GlFlwa/cAbDQoAyYOWmxAfpyk.9vNdgFHz/TCBtWz9pS9M.i	+79853852785	f
9	ООО "Макс Фабрик"	Крутая фабрика	1	1000	2023-08-15 06:52:27.93	2023-08-15 07:05:31.089	\N	\N	OpezdalGit@yandex.ru	7842456125	$2b$04$opSC9XtQaqdoFmd9QGWZauFYW0AIpOw8DX1egDau8ToLJbCOzmHh6	89328453355	f
10	ООО "Разработчики Программ"	\N	\N	\N	2023-08-15 10:56:52.196	2023-08-15 10:56:52.196	\N	\N	tutsansu100@gmail.com	5610248330	$2b$04$vZU2q605nj6VRaC5ptPZ7.PQSBBJWXqVW1joomt1DSZdO4bjxoHfq	89581731004	f
12	ООО "Екб-Клининг"	\N	\N	\N	2023-08-16 09:25:12.995	2023-08-16 09:25:12.995	\N	\N	kexewam218@vreaa.com	665800326446	$2b$04$ueRfVtQur167BT3ieEuUBO0VmxoHYWq4GuSGol2JqfBSnQolP3DNK	79123403722	f
23	ООО "Итдеск"	Ну типо крутая фабрика реально, вам зайдет, отвечаю	100	100	2023-08-21 06:44:59.59	2023-08-21 06:53:45.052	\N	\N	pnd@code-creators.tech	560902808359	$2b$04$qXsy0pH7UEwQuqzu7Pv3mepYyDL6zG9iVkmyjfSAwqWRzyQJTgD1G	89328453355	f
24	Салтанюк Никита Андреевич	\N	\N	\N	2023-08-21 11:20:53.774	2023-08-21 11:20:53.774	\N	\N	yitib17439@avidapro.com	561213036767	$2b$04$ufT1AVWGGBRUPfqDww23Ee/0mpm/lMsvd8.HRlorea3o2Od.x3mDq	89328453355	f
14	ПАО Сбербанк	Топ фабрикаasdas	1	1111111	2023-08-17 10:26:40.445	2023-08-17 10:55:37.085	\N	\N	dima.derkach2004@gmail.com	7707083893	$2b$04$4jrT94lUFjeWAZidbvsQD.t7CmJOUD3AFJWbP2j36OP0CenO4jj9y	+79619322548	f
11	Vladimir's test fabrik	Тестовая фабрика	100	4500	2023-08-15 19:30:51.919	2023-08-17 11:44:59.19	\N	\N	fiday35051@viperace.com	7743931676	$2b$04$IEvT26m4aR4GtUIVu2aivORTIqkyFSioHi8CVDTmA3NHGFR1Zy.Uq	79225551211	f
26	ООО "Молочная Фабрика"	\N	1	50000	2023-08-23 06:15:13.009	2023-08-23 06:38:04.46	\N	\N	favisat813@prdalu.com	3920008221	$2b$04$Ft7G3D4h.hjy.fryoF1QKeKNKiVaPmm4GbrrsC68WxAN4z4rT3NTm	+78005551233	f
1	Фабрика А737	Test Test Test\nTest   2 3     Test	2	112	2023-07-11 09:51:22.499	2023-08-23 06:41:44.665	\N	\N	fabrik2@test.ru	111111111111	$2b$04$N.TE5PbBXmMa4MEO7sfLkeItB9GLHHR9t7QeiyaCSdnak8vXH3IiO	89328111111	f
25	ООО "Фабрика"111	\N	\N	\N	2023-08-22 06:43:15.382	2023-08-22 09:48:11.927	\N	\N	caxoveh755@chodyi.com	2543015476	$2b$04$2F6Q./YsWzPswMD7HYYwwu3VJG8wsZhLV2r9nuSaXp3ddZrTmwZ8u	88005553536	f
\.


--
-- Data for Name: FabrikAdditionalServices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FabrikAdditionalServices" (id, fabrik_id, additional_services_id, created_at, updated_at, deleted_at) FROM stdin;
36	13	2	2023-08-17 09:13:16.658	2023-08-17 09:17:55.931	\N
29	11	5	2023-08-15 19:32:28.84	2023-08-23 05:12:49.213	2023-08-23 05:12:49.211
41	13	5	2023-08-17 09:13:58.805	2023-08-23 05:12:49.213	2023-08-23 05:12:49.211
48	14	5	2023-08-17 10:27:25.887	2023-08-23 05:12:49.213	2023-08-23 05:12:49.211
11	2	5	2023-08-14 08:07:19.989	2023-08-23 05:12:49.213	2023-08-23 05:12:49.211
65	23	5	2023-08-21 06:47:33.956	2023-08-23 05:12:49.213	2023-08-23 05:12:49.211
14	2	8	2023-08-14 08:07:19.989	2023-08-17 10:55:32.521	2023-08-17 10:55:32.52
35	1	5	2023-08-17 05:17:19.963	2023-08-23 05:23:38.543	\N
50	14	8	2023-08-17 10:27:25.898	2023-08-17 10:55:32.521	2023-08-17 10:55:32.52
32	11	8	2023-08-15 19:32:35.248	2023-08-17 10:55:32.521	2023-08-17 10:55:32.52
51	14	2	2023-08-17 10:55:37.149	2023-08-17 10:55:37.149	\N
37	13	6	2023-08-17 09:13:16.666	2023-08-23 05:30:38.031	2023-08-23 05:30:38.029
30	11	6	2023-08-15 19:32:28.845	2023-08-23 05:30:38.031	2023-08-23 05:30:38.029
49	14	6	2023-08-17 10:27:25.893	2023-08-23 05:30:38.031	2023-08-23 05:30:38.029
12	2	6	2023-08-14 08:07:19.989	2023-08-23 05:30:38.031	2023-08-23 05:30:38.029
66	23	6	2023-08-21 06:47:33.96	2023-08-23 05:30:38.031	2023-08-23 05:30:38.029
58	1	6	2023-08-18 09:41:32.403	2023-08-23 06:40:54.78	\N
54	1	7	2023-08-17 11:17:59.688	2023-08-23 06:40:54.786	\N
78	1	14	2023-08-23 06:41:44.745	2023-08-23 06:41:44.745	\N
79	1	23	2023-08-23 06:41:44.754	2023-08-23 06:41:44.754	\N
10	2	2	2023-08-14 08:07:19.989	2023-08-17 09:17:05.52	2023-08-17 09:17:05.519
28	11	2	2023-08-15 19:32:28.83	2023-08-17 09:17:05.52	2023-08-17 09:17:05.519
34	1	2	2023-08-17 05:17:19.956	2023-08-18 09:44:46.297	\N
38	13	11	2023-08-17 09:13:16.671	2023-08-18 10:39:46.239	2023-08-18 10:39:46.237
17	2	11	2023-08-14 08:07:19.989	2023-08-18 10:39:46.239	2023-08-18 10:39:46.237
45	13	7	2023-08-17 09:17:55.92	2023-08-18 10:39:46.247	2023-08-18 10:39:46.246
31	11	7	2023-08-15 19:32:35.244	2023-08-18 10:39:46.247	2023-08-18 10:39:46.246
13	2	7	2023-08-14 08:07:19.989	2023-08-18 10:39:46.247	2023-08-18 10:39:46.246
64	23	2	2023-08-21 06:47:33.949	2023-08-21 06:47:33.949	\N
71	23	7	2023-08-21 06:47:33.982	2023-08-21 06:47:33.982	\N
15	2	9	2023-08-14 08:07:19.989	2023-08-21 06:47:55.176	2023-08-21 06:47:55.174
67	23	9	2023-08-21 06:47:33.964	2023-08-21 06:47:55.176	2023-08-21 06:47:55.174
16	2	10	2023-08-14 08:07:19.989	2023-08-21 06:47:55.19	2023-08-21 06:47:55.188
68	23	10	2023-08-21 06:47:33.969	2023-08-21 06:47:55.19	2023-08-21 06:47:55.188
19	2	13	2023-08-15 18:58:57.203	2023-08-21 06:47:55.197	2023-08-21 06:47:55.195
33	11	13	2023-08-15 19:34:49.595	2023-08-21 06:47:55.197	2023-08-21 06:47:55.195
40	13	13	2023-08-17 09:13:16.679	2023-08-21 06:47:55.197	2023-08-21 06:47:55.195
69	23	13	2023-08-21 06:47:33.973	2023-08-21 06:47:55.197	2023-08-21 06:47:55.195
39	13	12	2023-08-17 09:13:16.675	2023-08-21 06:47:55.202	2023-08-21 06:47:55.201
18	2	12	2023-08-14 08:07:19.989	2023-08-21 06:47:55.202	2023-08-21 06:47:55.201
70	23	12	2023-08-21 06:47:33.978	2023-08-21 06:47:55.202	2023-08-21 06:47:55.201
\.


--
-- Data for Name: FabrikDocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FabrikDocument" (id, fabrik_id, document_id, created_at, updated_at, deleted_at, description, name) FROM stdin;
2	2	416	2023-08-09 15:10:37.015	2023-08-09 18:37:42.965	2023-08-09 18:37:42.962		anime-morning-train-street.jpg
1	2	415	2023-08-09 15:10:37.012	2023-08-09 18:38:15.326	2023-08-09 18:38:15.323	asdzxc	andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
3	2	417	2023-08-09 15:10:37.022	2023-08-09 18:38:15.33	2023-08-09 18:38:15.329		art-kosmos-kosmonavt-kacheli-buket.jpg
5	2	419	2023-08-09 18:10:34.839	2023-08-09 18:38:21.195	2023-08-09 18:38:21.193		gory-les-ozero-nebo-raduga-svet.jpg
4	2	418	2023-08-09 18:10:34.833	2023-08-09 18:38:21.203	2023-08-09 18:38:21.201		gorod_tsvetenie_derevo_167023_1920x1080.jpg
6	2	420	2023-08-09 18:10:34.858	2023-08-09 18:38:24.89	2023-08-09 18:38:24.888		islandiia-jokulsarion-lagoon-more-poberezhe-liod-glyby-nebo.jpg
23	2	439	2023-08-09 18:38:58.783	2023-08-09 18:39:38.208	2023-08-09 18:39:38.206		nu-takoe-nastroenie-shutka.jpg
24	2	436	2023-08-09 18:38:58.788	2023-08-09 18:39:38.222	2023-08-09 18:39:38.217		m3-f80-orange.jpg
25	2	440	2023-08-09 18:38:58.787	2023-08-09 18:39:38.226	2023-08-09 18:39:38.224		ocean-smooth-sailing-with-silver-peak-sd-wan-at-solarwin-pla.jpg
22	2	435	2023-08-09 18:38:58.784	2023-08-09 18:39:38.231	2023-08-09 18:39:38.229		luna-samoliot-chiornyi-minimalizm.jpg
21	2	426	2023-08-09 18:38:58.779	2023-08-09 18:39:38.234	2023-08-09 18:39:38.232		bmw-m3-e92-white-3.jpg
26	2	441	2023-08-09 18:38:58.788	2023-08-09 18:39:38.245	2023-08-09 18:39:38.243		ozero-kamni-gory.jpg
7	2	421	2023-08-09 18:38:58.488	2023-08-09 18:39:51.082	2023-08-09 18:39:51.08		andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
11	2	424	2023-08-09 18:38:58.551	2023-08-09 18:39:51.092	2023-08-09 18:39:51.09		bmw-3-series-m3-e92-front.jpg
10	2	429	2023-08-09 18:38:58.541	2023-08-09 18:39:51.097	2023-08-09 18:39:51.095		canadian-rockies-banff-national-park-winter.jpg
8	2	423	2023-08-09 18:38:58.5	2023-08-09 18:39:51.102	2023-08-09 18:39:51.1		art-kosmos-kosmonavt-kacheli-buket.jpg
9	2	430	2023-08-09 18:38:58.507	2023-08-09 18:39:51.107	2023-08-09 18:39:51.105		gorod_tsvetenie_derevo_167023_1920x1080.jpg
12	2	427	2023-08-09 18:38:58.512	2023-08-09 18:39:51.115	2023-08-09 18:39:51.114		bmw-m3-f82-silver-sight-face-front.jpg
14	2	433	2023-08-09 18:38:58.747	2023-08-09 18:39:51.123	2023-08-09 18:39:51.117		lago-bianco-bernina-pass-alps-engadin-switzerland-oero-biank.jpg
15	2	437	2023-08-09 18:38:58.753	2023-08-09 18:39:51.127	2023-08-09 18:39:51.123		minimalizm-lakonizm-grafika-kompiuternaia-grafika-vektor-pti.jpg
17	2	422	2023-08-09 18:38:58.76	2023-08-09 18:39:51.135	2023-08-09 18:39:51.13		anime-morning-train-street.jpg
18	2	431	2023-08-09 18:38:58.763	2023-08-09 18:39:51.139	2023-08-09 18:39:51.137		gory-les-ozero-nebo-raduga-svet.jpg
20	2	425	2023-08-09 18:38:58.774	2023-08-09 18:39:51.149	2023-08-09 18:39:51.148		bmw-m3-e46-e92.jpg
27	2	438	2023-08-09 18:38:58.791	2023-08-09 18:39:51.152	2023-08-09 18:39:51.15		minimalizm-smekh-risunok-mashinka-ded-pes.jpg
19	2	432	2023-08-09 18:38:58.769	2023-08-09 18:39:51.157	2023-08-09 18:39:51.153		islandiia-jokulsarion-lagoon-more-poberezhe-liod-glyby-nebo.jpg
16	2	434	2023-08-09 18:38:58.749	2023-08-09 18:39:53.927	2023-08-09 18:39:53.925		lamborghini-gallardo-6270.jpg
13	2	428	2023-08-09 18:38:58.552	2023-08-09 18:39:53.932	2023-08-09 18:39:53.93		bmw-m3-f90-silver-face-sight-road.jpg
39	2	452	2023-08-09 18:57:11.036	2023-08-09 18:57:51.1	2023-08-09 18:57:51.098		tramvaj_gorod_transport_115374_1920x1080.jpg
38	2	453	2023-08-09 18:57:11.035	2023-08-09 18:57:51.109	2023-08-09 18:57:51.107		zima-sneg-derevia-peizazh-zimnii-elki-landscape-beautiful-wi.jpg
36	2	449	2023-08-09 18:56:43.134	2023-08-09 18:57:51.114	2023-08-09 18:57:51.113		gory-les-ozero-nebo-raduga-svet.jpg
34	2	448	2023-08-09 18:56:43.095	2023-08-09 18:57:51.119	2023-08-09 18:57:51.116		gorod_tsvetenie_derevo_167023_1920x1080.jpg
37	2	451	2023-08-09 18:57:11.035	2023-08-09 18:57:51.123	2023-08-09 18:57:51.121		priroda-okean-skaly-gory-tuchi-nebo-aisbergi.jpg
33	2	445	2023-08-09 18:46:08.244	2023-08-09 18:57:51.126	2023-08-09 18:57:51.124		bmw-3-series-m3-e92-front.jpg
31	2	447	2023-08-09 18:46:08.244	2023-08-09 18:57:51.132	2023-08-09 18:57:51.13		bmw-m3-e92-white-3.jpg
35	2	450	2023-08-09 18:56:43.137	2023-08-09 18:57:51.139	2023-08-09 18:57:51.138		islandiia-jokulsarion-lagoon-more-poberezhe-liod-glyby-nebo.jpg
28	2	442	2023-08-09 18:46:08.17	2023-08-09 18:57:51.144	2023-08-09 18:57:51.142		andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
30	2	444	2023-08-09 18:46:08.234	2023-08-09 18:57:51.157	2023-08-09 18:57:51.155		art-kosmos-kosmonavt-kacheli-buket.jpg
29	2	443	2023-08-09 18:46:08.196	2023-08-09 18:57:51.16	2023-08-09 18:57:51.158		anime-morning-train-street.jpg
32	2	446	2023-08-09 18:46:08.236	2023-08-09 18:57:51.167	2023-08-09 18:57:51.166		bmw-m3-e46-e92.jpg
42	2	456	2023-08-09 18:57:59.13	2023-08-09 18:59:11.532	2023-08-09 18:59:11.529		art-kosmos-kosmonavt-kacheli-buket.jpg
41	2	455	2023-08-09 18:57:59.123	2023-08-09 18:59:11.538	2023-08-09 18:59:11.536		anime-morning-train-street.jpg
40	2	454	2023-08-09 18:57:59.099	2023-08-09 18:59:11.544	2023-08-09 18:59:11.542		andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
43	2	457	2023-08-09 18:57:59.15	2023-08-09 18:59:15.672	2023-08-09 18:59:15.67		bmw-3-series-m3-e92-front.jpg
44	2	462	2023-08-09 18:59:22.977	2023-08-09 18:59:34.698	2023-08-09 18:59:34.696		bmw-m3-e46-e92.jpg
46	2	459	2023-08-09 18:59:22.987	2023-08-09 18:59:34.706	2023-08-09 18:59:34.704		anime-morning-train-street.jpg
47	2	461	2023-08-09 18:59:23	2023-08-09 18:59:34.71	2023-08-09 18:59:34.709		bmw-3-series-m3-e92-front.jpg
48	2	460	2023-08-09 18:59:23.024	2023-08-09 18:59:34.723	2023-08-09 18:59:34.721		art-kosmos-kosmonavt-kacheli-buket.jpg
45	2	458	2023-08-09 18:59:22.983	2023-08-09 18:59:34.728	2023-08-09 18:59:34.727		andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
49	2	464	2023-08-09 19:00:15.519	2023-08-09 21:08:18.444	2023-08-09 21:08:18.436		anime-morning-train-street.jpg
50	2	463	2023-08-09 19:00:15.527	2023-08-09 21:08:18.461	2023-08-09 21:08:18.459		andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
51	2	465	2023-08-09 19:00:15.529	2023-08-09 21:08:18.468	2023-08-09 21:08:18.466		art-kosmos-kosmonavt-kacheli-buket.jpg
55	2	469	2023-08-09 19:00:15.582	2023-08-09 21:08:18.477	2023-08-09 21:08:18.475		gorod_tsvetenie_derevo_167023_1920x1080.jpg
56	2	470	2023-08-09 19:00:15.586	2023-08-09 21:08:18.484	2023-08-09 21:08:18.482		gory-les-ozero-nebo-raduga-svet.jpg
52	2	468	2023-08-09 19:00:15.571	2023-08-09 21:08:18.493	2023-08-09 21:08:18.491		canadian-rockies-banff-national-park-winter.jpg
57	2	471	2023-08-09 19:31:27.236	2023-08-09 21:08:18.506	2023-08-09 21:08:18.504		m3-f80-orange.jpg
53	2	467	2023-08-09 19:00:15.574	2023-08-09 21:08:18.525	2023-08-09 21:08:18.516		bmw-m3-f90-silver-face-sight-road.jpg
54	2	466	2023-08-09 19:00:15.58	2023-08-09 21:08:18.529	2023-08-09 21:08:18.528		bmw-3-series-m3-e92-front.jpg
58	2	472	2023-08-09 21:10:45.064	2023-08-09 21:10:45.064	\N		driver.jpg
59	2	473	2023-08-09 21:10:45.069	2023-08-09 21:10:45.069	\N		gosling.jpg
62	2	477	2023-08-09 21:10:45.141	2023-08-09 21:10:45.141	\N		pedro.jpg
63	2	476	2023-08-09 21:10:45.111	2023-08-09 21:10:45.111	\N		makavoy.jpg
69	2	496	2023-08-10 08:09:42.144	2023-08-10 08:09:42.144	\N		driver.jpg
72	2	527	2023-08-14 12:40:09.015	2023-08-14 12:40:09.015	\N		makavoy.jpg
75	2	528	2023-08-14 12:40:09.082	2023-08-14 12:40:09.082	\N		pedro.jpg
61	2	475	2023-08-09 21:10:45.104	2023-08-14 12:40:42.722	2023-08-14 12:40:42.721		kianu-rivz.jpg
65	2	492	2023-08-10 08:09:16.977	2023-08-14 12:40:42.739	2023-08-14 12:40:42.738		kianu-rivz.jpg
64	2	491	2023-08-10 07:59:47.846	2023-08-14 12:40:42.744	2023-08-14 12:40:42.742		kianu-rivz.jpg
67	2	494	2023-08-10 08:09:27.339	2023-08-14 12:40:42.768	2023-08-14 12:40:42.757		kianu-rivz.jpg
66	2	493	2023-08-10 08:09:22.508	2023-08-14 12:40:42.75	2023-08-14 12:40:42.745		kianu-rivz.jpg
74	2	526	2023-08-14 12:40:09.031	2023-08-14 12:40:42.753	2023-08-14 12:40:42.752		kianu-rivz.jpg
68	2	495	2023-08-10 08:09:35.383	2023-08-14 12:40:42.761	2023-08-14 12:40:42.755		kianu-rivz.jpg
60	2	474	2023-08-09 21:10:45.11	2023-08-14 13:01:13.902	2023-08-14 13:01:13.9		inter.jpg
73	2	525	2023-08-14 12:40:09.02	2023-08-14 13:01:13.912	2023-08-14 13:01:13.911		inter.jpg
76	9	533	2023-08-15 07:04:39.305	2023-08-15 07:04:39.305	\N		photo_2023-07-03_10-36-36.jpg
81	13	543	2023-08-17 09:20:39.693	2023-08-17 09:20:39.693	\N		image.png
83	13	545	2023-08-17 09:23:24.148	2023-08-17 09:24:24.7	2023-08-17 09:24:24.698		photo_2023-08-17_13-34-23.jpg
82	13	544	2023-08-17 09:23:24.146	2023-08-17 09:24:24.704	2023-08-17 09:24:24.702		Frame 1.png
78	11	537	2023-08-15 19:34:19.468	2023-08-17 13:15:08.268	2023-08-17 13:15:08.267		gosling.jpg
80	11	539	2023-08-15 19:34:19.49	2023-08-17 13:15:08.265	2023-08-17 13:15:08.256		makavoy.jpg
79	11	538	2023-08-15 19:34:19.471	2023-08-17 13:15:08.278	2023-08-17 13:15:08.277		kianu-rivz.jpg
77	11	536	2023-08-15 19:34:19.447	2023-08-17 13:15:08.291	2023-08-17 13:15:08.29		driver.jpg
87	11	550	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N		driver.jpg
88	11	555	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N		pedro.jpg
89	11	552	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N		inter.jpg
90	11	551	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N		gosling.jpg
91	11	554	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N		makavoy.jpg
92	11	553	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N		kianu-rivz.jpg
93	23	563	2023-08-21 07:35:19.064	2023-08-21 07:35:36.391	2023-08-21 07:35:36.39		photo_2023-07-03_10-36-36.jpg
94	23	564	2023-08-21 07:36:10.136	2023-08-21 07:36:10.136	\N		photo_2023-05-12_16-44-03.jpg
95	23	565	2023-08-21 07:36:10.138	2023-08-21 07:36:10.138	\N		photo_2023-07-03_10-36-36.jpg
96	23	566	2023-08-21 07:36:10.147	2023-08-21 07:36:10.147	\N		Sad.jpg
97	11	571	2023-08-21 20:40:29.01	2023-08-21 20:40:29.01	\N		islandiia-jokulsarion-lagoon-more-poberezhe-liod-glyby-nebo.jpg
98	11	572	2023-08-21 20:43:16.803	2023-08-21 20:43:16.803	\N		bmw-m3-f90-silver-face-sight-road.jpg
99	11	574	2023-08-21 20:46:56.461	2023-08-21 20:46:56.461	\N	bmw-m3-f82-silver-sight-face-front.jpg	bmw-m3-f82-silver-sight-face-front.jpg
100	11	573	2023-08-21 20:46:56.464	2023-08-21 20:46:56.464	\N	andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg	andrei-egorov-kotionok-malysh-mordochka-vzgliad-trava.jpg
101	11	575	2023-08-21 20:46:56.497	2023-08-21 20:46:56.497	\N	bmw-m3-f90-silver-face-sight-road.jpg	bmw-m3-f90-silver-face-sight-road.jpg
102	11	576	2023-08-21 20:46:56.532	2023-08-21 20:46:56.532	\N	canadian-rockies-banff-national-park-winter.jpg	canadian-rockies-banff-national-park-winter.jpg
103	11	577	2023-08-21 20:47:58.916	2023-08-21 20:47:58.916	\N		minimalizm-lakonizm-grafika-kompiuternaia-grafika-vektor-pti.jpg
\.


--
-- Data for Name: FabrikProduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FabrikProduct" (id, fabrik_id, product_id, created_at, updated_at, deleted_at) FROM stdin;
59	2	32	2023-08-14 07:58:47.845	2023-08-18 10:39:50.761	\N
64	2	37	2023-08-14 07:58:47.845	2023-08-18 10:39:50.768	\N
66	2	39	2023-08-14 07:58:47.845	2023-08-18 10:39:50.775	\N
63	2	36	2023-08-14 07:58:47.845	2023-08-18 10:39:50.782	\N
369	13	16	2023-08-17 09:15:40.298	2023-08-17 09:15:42.216	\N
37	2	4	2023-08-14 07:58:47.845	2023-08-18 10:39:50.512	\N
80	2	59	2023-08-14 07:58:47.845	2023-08-18 10:39:50.79	\N
81	2	60	2023-08-14 07:58:47.845	2023-08-18 10:39:50.799	\N
82	2	61	2023-08-14 07:58:47.845	2023-08-18 10:39:50.805	\N
1	1	38	2023-08-08 14:52:34.376	2023-08-08 19:34:51.877	2023-08-08 19:34:51.875
83	2	62	2023-08-14 07:58:47.845	2023-08-18 10:39:50.812	\N
79	2	58	2023-08-14 07:58:47.845	2023-08-18 10:39:50.818	\N
69	2	47	2023-08-14 07:58:47.845	2023-08-18 10:39:50.826	\N
72	2	50	2023-08-14 07:58:47.845	2023-08-18 10:39:50.832	\N
70	2	48	2023-08-14 07:58:47.845	2023-08-18 10:39:50.851	\N
71	2	49	2023-08-14 07:58:47.845	2023-08-18 10:39:50.86	\N
68	2	46	2023-08-14 07:58:47.845	2023-08-18 10:39:50.867	\N
38	2	5	2023-08-14 07:58:47.845	2023-08-23 06:35:21.228	2023-08-23 06:35:21.227
530	26	6	2023-08-23 06:22:38.139	2023-08-23 06:38:04.481	\N
74	2	52	2023-08-14 07:58:47.845	2023-08-18 10:39:50.874	\N
93	8	5	2023-08-14 10:31:29.395	2023-08-23 06:35:21.228	2023-08-23 06:35:21.227
106	9	5	2023-08-15 07:05:31.154	2023-08-23 06:35:21.228	2023-08-23 06:35:21.227
75	2	54	2023-08-14 07:58:47.845	2023-08-18 10:39:50.882	\N
3	1	5	2023-08-08 14:53:33.058	2023-08-23 06:35:21.228	2023-08-23 06:35:21.227
531	26	14	2023-08-23 06:22:38.148	2023-08-23 06:37:56.01	\N
533	26	4	2023-08-23 06:22:38.167	2023-08-23 06:26:26.99	\N
76	2	55	2023-08-14 07:58:47.845	2023-08-18 10:39:50.888	\N
77	2	56	2023-08-14 07:58:47.845	2023-08-18 10:39:50.895	\N
534	26	5	2023-08-23 06:22:38.194	2023-08-23 06:37:56.051	\N
371	13	4	2023-08-17 09:15:40.32	2023-08-17 09:18:13.57	\N
78	2	57	2023-08-14 07:58:47.845	2023-08-18 10:39:50.901	\N
360	11	5	2023-08-15 19:33:09.628	2023-08-23 06:35:21.228	2023-08-23 06:35:21.227
4	1	6	2023-08-08 19:41:11.544	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
44	2	11	2023-08-14 07:58:47.845	2023-08-18 10:39:50.591	\N
40	2	7	2023-08-14 07:58:47.845	2023-08-23 06:35:21.231	2023-08-23 06:35:21.23
43	2	10	2023-08-14 07:58:47.845	2023-08-18 10:39:50.598	\N
87	2	69	2023-08-14 07:58:47.845	2023-08-18 10:39:50.913	\N
107	9	7	2023-08-15 07:05:31.163	2023-08-23 06:35:21.231	2023-08-23 06:35:21.23
46	2	13	2023-08-14 07:58:47.845	2023-08-18 10:39:50.613	\N
84	2	66	2023-08-14 07:58:47.845	2023-08-18 10:39:50.919	\N
94	8	4	2023-08-14 10:31:29.403	2023-08-14 10:31:42.145	\N
42	2	9	2023-08-14 07:58:47.845	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
92	8	23	2023-08-14 10:31:29.386	2023-08-14 10:31:42.177	\N
101	9	8	2023-08-15 07:05:31.112	2023-08-15 07:05:31.112	\N
102	9	4	2023-08-15 07:05:31.112	2023-08-15 07:05:31.112	\N
103	9	10	2023-08-15 07:05:31.13	2023-08-15 07:05:31.13	\N
58	2	31	2023-08-14 07:58:47.845	2023-08-18 10:39:50.622	\N
45	2	12	2023-08-14 07:58:47.845	2023-08-18 10:39:50.628	\N
49	2	16	2023-08-14 07:58:47.845	2023-08-18 10:39:50.64	\N
12	1	7	2023-08-10 06:30:30.602	2023-08-23 06:35:21.231	2023-08-23 06:35:21.23
16	1	11	2023-08-10 06:31:03.761	2023-08-23 05:22:37.131	\N
392	14	59	2023-08-17 10:32:45.392	2023-08-17 10:32:45.392	\N
393	14	60	2023-08-17 10:32:45.401	2023-08-17 10:32:45.401	\N
532	26	9	2023-08-23 06:22:38.158	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
15	1	10	2023-08-10 06:31:00.325	2023-08-23 05:22:37.154	\N
57	2	30	2023-08-14 07:58:47.845	2023-08-18 10:39:50.646	\N
13	1	8	2023-08-10 06:30:50.605	2023-08-23 05:22:37.163	\N
41	2	8	2023-08-14 07:58:47.845	2023-08-18 10:39:50.653	\N
48	2	15	2023-08-14 07:58:47.845	2023-08-18 10:39:50.659	\N
85	2	67	2023-08-14 07:58:47.845	2023-08-18 10:39:50.925	\N
468	23	59	2023-08-21 06:52:16.087	2023-08-21 06:53:45.061	\N
527	1	4	2023-08-23 05:22:37.172	2023-08-23 05:22:37.172	\N
376	13	9	2023-08-17 09:18:07.279	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
473	23	51	2023-08-21 06:52:16.185	2023-08-21 06:53:45.072	\N
86	2	68	2023-08-14 07:58:47.845	2023-08-18 10:39:50.931	\N
91	2	73	2023-08-14 07:58:47.845	2023-08-18 10:39:50.936	\N
88	2	70	2023-08-14 07:58:47.845	2023-08-18 10:39:50.941	\N
384	14	4	2023-08-17 10:28:10.671	2023-08-17 10:32:54.232	\N
51	2	24	2023-08-14 07:58:47.845	2023-08-18 10:39:50.67	\N
467	23	71	2023-08-21 06:52:16.074	2023-08-21 06:53:45.095	\N
483	23	4	2023-08-21 06:52:37.419	2023-08-21 06:53:45.104	\N
60	2	33	2023-08-14 07:58:47.845	2023-08-18 10:39:50.676	\N
56	2	29	2023-08-14 07:58:47.845	2023-08-18 10:39:50.683	\N
53	2	26	2023-08-14 07:58:47.845	2023-08-18 10:39:50.691	\N
89	2	71	2023-08-14 07:58:47.845	2023-08-18 10:39:50.946	\N
73	2	51	2023-08-14 07:58:47.845	2023-08-18 10:39:50.955	\N
472	23	47	2023-08-21 06:52:16.169	2023-08-21 06:53:45.115	\N
471	23	70	2023-08-21 06:52:16.141	2023-08-21 06:53:45.126	\N
474	23	60	2023-08-21 06:52:16.203	2023-08-21 06:53:45.131	\N
104	9	9	2023-08-15 07:05:31.138	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
469	23	61	2023-08-21 06:52:16.097	2023-08-21 06:53:45.14	\N
362	11	4	2023-08-15 19:33:09.643	2023-08-17 11:44:59.569	\N
90	2	72	2023-08-14 07:58:47.845	2023-08-18 10:39:50.963	\N
14	1	9	2023-08-10 06:30:55.737	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
406	11	33	2023-08-17 11:44:59.592	2023-08-17 11:44:59.592	\N
61	2	34	2023-08-14 07:58:47.845	2023-08-18 10:39:50.697	\N
50	2	23	2023-08-14 07:58:47.845	2023-08-18 10:39:50.703	\N
55	2	28	2023-08-14 07:58:47.845	2023-08-18 10:39:50.71	\N
52	2	25	2023-08-14 07:58:47.845	2023-08-18 10:39:50.716	\N
65	2	38	2023-08-14 07:58:47.845	2023-08-18 10:39:50.723	\N
62	2	35	2023-08-14 07:58:47.845	2023-08-18 10:39:50.738	\N
54	2	27	2023-08-14 07:58:47.845	2023-08-18 10:39:50.747	\N
67	2	40	2023-08-14 07:58:47.845	2023-08-18 10:39:50.753	\N
470	23	62	2023-08-21 06:52:16.125	2023-08-21 06:53:45.15	\N
363	11	7	2023-08-15 19:33:09.649	2023-08-23 06:35:21.231	2023-08-23 06:35:21.23
386	14	9	2023-08-17 10:28:10.699	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
485	23	9	2023-08-21 06:52:37.444	2023-08-23 06:37:56.069	2023-08-23 06:37:56.068
47	2	14	2023-08-14 07:58:47.845	2023-08-23 06:35:21.224	2023-08-23 06:35:21.223
387	14	14	2023-08-17 10:28:10.713	2023-08-23 06:35:21.224	2023-08-23 06:35:21.223
528	1	14	2023-08-23 05:22:37.19	2023-08-23 06:35:21.224	2023-08-23 06:35:21.223
39	2	6	2023-08-14 07:58:47.845	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
539	26	7	2023-08-23 06:22:47.273	2023-08-23 06:35:21.231	2023-08-23 06:35:21.23
370	13	6	2023-08-17 09:15:40.309	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
105	9	6	2023-08-15 07:05:31.146	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
484	23	6	2023-08-21 06:52:37.43	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
385	14	6	2023-08-17 10:28:10.684	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
361	11	6	2023-08-15 19:33:09.636	2023-08-23 06:37:56.075	2023-08-23 06:37:56.074
\.


--
-- Data for Name: FabrikProductFabrikDocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FabrikProductFabrikDocument" (id, fabrik_product_id, fabrik_document_id, created_at, updated_at, deleted_at) FROM stdin;
1	38	2	2023-08-14 08:12:51.906	2023-08-14 13:12:57	\N
2	361	87	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N
3	360	87	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N
4	362	87	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N
5	363	87	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N
6	406	87	2023-08-17 13:15:52.969	2023-08-17 13:15:52.969	\N
7	361	88	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N
8	360	88	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N
9	362	88	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N
10	363	88	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N
11	406	88	2023-08-17 13:15:52.974	2023-08-17 13:15:52.974	\N
12	361	89	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N
13	360	89	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N
14	362	89	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N
15	363	89	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N
16	406	89	2023-08-17 13:15:52.976	2023-08-17 13:15:52.976	\N
17	361	90	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N
18	360	90	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N
19	362	90	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N
20	363	90	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N
21	406	90	2023-08-17 13:15:52.988	2023-08-17 13:15:52.988	\N
22	361	91	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N
23	360	91	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N
24	362	91	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N
25	363	91	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N
26	406	91	2023-08-17 13:15:52.99	2023-08-17 13:15:52.99	\N
27	361	92	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N
28	360	92	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N
29	362	92	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N
30	363	92	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N
31	406	92	2023-08-17 13:15:53.048	2023-08-17 13:15:53.048	\N
32	361	97	2023-08-21 20:40:29.01	2023-08-21 20:40:29.01	\N
33	360	97	2023-08-21 20:40:29.01	2023-08-21 20:40:29.01	\N
34	361	98	2023-08-21 20:43:16.803	2023-08-21 20:43:16.803	\N
35	360	98	2023-08-21 20:43:16.803	2023-08-21 20:43:16.803	\N
36	362	98	2023-08-21 20:43:16.803	2023-08-21 20:43:16.803	\N
37	361	103	2023-08-21 20:47:58.916	2023-08-21 20:47:58.916	\N
38	360	103	2023-08-21 20:47:58.916	2023-08-21 20:47:58.916	\N
\.


--
-- Data for Name: FabrikResourceOrigin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FabrikResourceOrigin" (id, type, fabrik_id, resource_origin_id, created_at, updated_at, deleted_at) FROM stdin;
69	ADDITIONAL_MATERIALS	26	1	2023-08-23 06:22:38.221	2023-08-23 06:22:38.221	\N
70	TEXTILE	26	1	2023-08-23 06:22:38.221	2023-08-23 06:22:38.221	\N
71	ADDITIONAL_MATERIALS	26	2	2023-08-23 06:22:38.228	2023-08-23 06:22:38.228	\N
72	TEXTILE	26	2	2023-08-23 06:22:38.23	2023-08-23 06:22:38.23	\N
33	ADDITIONAL_MATERIALS	8	1	2023-08-14 10:31:42.203	2023-08-18 09:17:29.098	2023-08-18 09:17:29.097
41	ADDITIONAL_MATERIALS	11	1	2023-08-15 19:33:09.684	2023-08-18 09:17:29.098	2023-08-18 09:17:29.097
2	ADDITIONAL_MATERIALS	2	1	2023-08-13 11:36:33.648	2023-08-18 09:17:29.098	2023-08-18 09:17:29.097
53	ADDITIONAL_MATERIALS	14	1	2023-08-17 10:28:10.747	2023-08-18 09:17:29.098	2023-08-18 09:17:29.097
55	ADDITIONAL_MATERIALS	23	1	2023-08-21 06:52:16.219	2023-08-21 06:52:16.219	\N
34	TEXTILE	8	3	2023-08-14 10:31:42.207	2023-08-21 06:53:06.088	2023-08-21 06:53:06.087
8	TEXTILE	2	3	2023-08-13 14:36:05.844	2023-08-21 06:53:06.088	2023-08-21 06:53:06.087
47	TEXTILE	13	3	2023-08-17 09:15:40.341	2023-08-21 06:53:06.088	2023-08-21 06:53:06.087
52	TEXTILE	14	3	2023-08-17 10:28:10.744	2023-08-21 06:53:06.088	2023-08-21 06:53:06.087
60	TEXTILE	23	3	2023-08-21 06:52:16.29	2023-08-21 06:53:45.186	\N
67	ADDITIONAL_MATERIALS	1	1	2023-08-22 09:33:56.865	2023-08-22 09:33:56.865	\N
68	TEXTILE	1	3	2023-08-22 09:33:56.867	2023-08-22 09:33:56.867	\N
31	ADDITIONAL_MATERIALS	8	2	2023-08-14 10:31:29.437	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
37	ADDITIONAL_MATERIALS	9	2	2023-08-15 07:05:31.168	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
40	ADDITIONAL_MATERIALS	11	2	2023-08-15 19:33:09.677	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
45	ADDITIONAL_MATERIALS	13	2	2023-08-17 09:15:40.326	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
51	ADDITIONAL_MATERIALS	14	2	2023-08-17 10:28:10.741	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
6	ADDITIONAL_MATERIALS	2	2	2023-08-13 14:36:05.833	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
57	ADDITIONAL_MATERIALS	23	2	2023-08-21 06:52:16.255	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
63	ADDITIONAL_MATERIALS	1	2	2023-08-21 13:00:06.179	2023-08-23 05:22:37.227	2023-08-23 05:22:37.226
35	ADDITIONAL_MATERIALS	8	3	2023-08-14 10:31:42.212	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
42	ADDITIONAL_MATERIALS	11	3	2023-08-15 19:33:09.688	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
49	ADDITIONAL_MATERIALS	14	3	2023-08-17 10:28:10.729	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
3	ADDITIONAL_MATERIALS	2	3	2023-08-13 12:49:27.772	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
59	ADDITIONAL_MATERIALS	23	3	2023-08-21 06:52:16.287	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
65	ADDITIONAL_MATERIALS	1	3	2023-08-22 09:32:59.6	2023-08-23 05:22:37.243	2023-08-23 05:22:37.241
32	TEXTILE	8	1	2023-08-14 10:31:29.443	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
38	TEXTILE	9	1	2023-08-15 07:05:31.189	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
43	TEXTILE	11	1	2023-08-15 19:58:50.111	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
48	TEXTILE	14	1	2023-08-17 10:28:10.72	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
1	TEXTILE	2	1	2023-08-13 11:25:53.011	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
58	TEXTILE	23	1	2023-08-21 06:52:16.276	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
62	TEXTILE	1	1	2023-08-21 13:00:06.178	2023-08-23 05:22:37.229	2023-08-23 05:22:37.228
36	TEXTILE	8	2	2023-08-14 10:31:42.215	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
39	TEXTILE	11	2	2023-08-15 19:33:09.676	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
4	TEXTILE	2	2	2023-08-13 12:49:27.778	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
46	TEXTILE	13	2	2023-08-17 09:15:40.324	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
50	TEXTILE	14	2	2023-08-17 10:28:10.736	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
56	TEXTILE	23	2	2023-08-21 06:52:16.237	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
64	TEXTILE	1	2	2023-08-21 13:14:54.052	2023-08-23 05:22:37.297	2023-08-23 05:22:37.285
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, document_id, cloth_sex, product_id, custom_size, custom_model, custom_knot, custom_textile, additional_materials, artistic_description, created_at, updated_at, deleted_at, name, status, user_id, stage, quantity, production_time, additional_materials_origin_id, textile_origin_id, token) FROM stdin;
1	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-06 12:02:28.71	2023-06-06 12:02:28.71	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
2	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-06 12:09:41.39	2023-06-06 12:09:41.39	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
4	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-07 09:41:46.789	2023-06-07 09:41:46.789	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
5	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-07 11:08:40.367	2023-06-07 11:08:40.367	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
6	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-07 15:17:53.157	2023-06-07 15:17:53.157	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
7	\N	FEMALE	\N	\N	\N	\N	\N	\N	\N	2023-06-09 11:27:45.648	2023-06-09 12:37:41.746	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
8	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-13 11:53:11.797	2023-06-13 14:54:06.728	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
9	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-13 14:57:01.565	2023-06-13 14:57:01.565	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
10	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-14 11:26:35.92	2023-06-14 11:26:35.92	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
11	\N	FEMALE	\N	\N	\N	\N	\N	\N	\N	2023-06-15 13:14:51.399	2023-06-15 13:38:01.638	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
3	\N	MALE	2	описание нестандартного размера...	описание силуэта и покроя	описание обработки узлов	описание ткани	дополнительные материалы	художественное описание модели	2023-06-06 12:13:23.197	2023-06-16 10:52:43.187	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
13	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-16 11:16:01.812	2023-06-16 11:16:01.812	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
23	\N	UNISEX	10	\N	\N	\N	\N	\N	\N	2023-06-28 09:50:37.743	2023-07-03 09:53:45.945	2023-07-03 09:53:45.943	testOrder	DRAFT	1	SEX	1	1	\N	\N	\N
12	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-16 10:54:52.363	2023-06-16 12:47:19.963	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
14	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-19 06:05:03.787	2023-06-19 06:06:38.018	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
15	\N	MALE	\N	\N	56y	645y45	65hth	tnh	,mll	2023-06-19 06:50:08.796	2023-06-19 06:54:02.228	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
16	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-19 11:53:29.081	2023-06-19 11:53:37.227	\N	Безимянный заказ	DRAFT	\N	SEX	1	1	\N	\N	\N
18	\N	MALE	\N	customSIze				additional	artdesk	2023-06-27 10:14:28.897	2023-07-03 10:42:16.835	2023-07-03 10:42:16.832	Заявка 2	DRAFT	1	SEX	1	1	\N	\N	\N
19	\N	UNISEX	\N	\N	\N	\N	\N	\N	\N	2023-06-28 09:22:51.347	2023-07-03 12:29:40.791	2023-07-03 12:29:40.789	testOrder	DRAFT	1	SEX	1	1	\N	\N	\N
39	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-07-21 05:06:33.783	2023-08-15 05:22:18.317	2023-08-15 05:22:18.315	312	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
21	\N	UNISEX	2	описание нестандартного размера...	описание силуэта и покроя	описание обработки узлов	описание ткани	дополнительные материалы	художественное описание модели	2023-06-28 09:23:08.478	2023-08-13 08:08:53.613	\N	testOrder2	DONE	1	SEX	1	1	\N	\N	\N
50	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-14 10:32:55.874	2023-08-15 05:21:02.082	2023-08-15 05:21:02.079	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
40	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-01 04:58:17.708	2023-08-15 05:22:24.465	2023-08-15 05:22:24.464	222	DRAFT	1	SEX	1	1	\N	\N	\N
36	\N	MALE	50	ыва		\N	\N		\N	2023-07-11 10:50:41.102	2023-08-15 05:22:29.349	2023-08-15 05:22:29.348	\N	DRAFT	1	SIZE	1	1	\N	\N	\N
48	\N	MALE	10	\N	\N	\N	\N	\N	\N	2023-08-14 08:15:55.95	2023-08-15 05:21:08.697	2023-08-15 05:21:08.695	\N	FORMED	1	ARTISTIC_DESCRIPTION	1000	5	2	\N	\N
59	\N	MALE	4	\N	Силуэт заявки от 16.08	обработка узлов 16.08	ткани 16.08	\N	\N	2023-08-15 19:55:34.496	2023-08-17 06:59:05.804	2023-08-17 06:59:05.803	\N	FORMED	1	ARTISTIC_DESCRIPTION	100	12	1	1	\N
38	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-07-17 09:23:47.746	2023-08-13 08:21:01.218	2023-08-13 08:21:01.216	1234	DRAFT	1	SEX	1	1	\N	\N	\N
33	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-07-10 06:35:38.387	2023-08-15 05:22:35.892	2023-08-15 05:22:35.891	Куртка супер	DRAFT	1	ARTISTIC_DESCRIPTION	1	1	1	1	\N
24	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-28 10:13:55.208	2023-07-12 12:21:05.404	2023-07-12 12:21:05.402	\N	DRAFT	1	SEX	1	1	\N	\N	\N
22	\N	FEMALE	2	\N	\N	\N	\N	\N	\N	2023-06-28 09:37:43.025	2023-07-12 12:21:21.048	2023-07-12 12:21:21.047	\N	DRAFT	1	SEX	1	1	\N	\N	\N
26	\N	MALE	\N	\N		\N	\N	\N	\N	2023-06-28 13:05:24.738	2023-07-12 12:22:45.219	2023-07-12 12:22:45.217	\N	DRAFT	1	SEX	1	1	\N	\N	\N
27	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-06-28 13:08:31.59	2023-07-12 12:22:52.807	2023-07-12 12:22:52.803	\N	DRAFT	1	SEX	1	1	\N	\N	\N
29	\N	MALE	\N	\N	Gfgv	\N	\N	\N	\N	2023-06-29 12:57:41.155	2023-07-12 12:22:57.668	2023-07-12 12:22:57.666	\N	DRAFT	1	SEX	1	1	\N	\N	\N
32	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-07-05 07:14:52.8	2023-07-12 12:23:03.454	2023-07-12 12:23:03.451	\N	DRAFT	1	SEX	1	1	\N	\N	\N
31	\N	MALE	\N	\N	fgdr	rether	erthr	erth	erth	2023-07-03 09:55:17.387	2023-07-12 12:23:08.359	2023-07-12 12:23:08.357	\N	DRAFT	1	SEX	1	1	\N	\N	\N
49	\N	FEMALE	6	\N	sefsefes	sesefsf	\N		\N	2023-08-14 10:05:00.436	2023-08-15 05:21:14.665	2023-08-15 05:21:14.663	\N	FORMED	1	ARTISTIC_DESCRIPTION	1323	1	2	1	\N
25	\N	MALE	4	\N		\N	ну как то так 	\N	не плохо	2023-06-28 12:59:02.219	2023-08-15 05:22:41.155	2023-08-15 05:22:41.154	\N	DRAFT	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
47	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-14 07:36:52.644	2023-08-14 07:58:44.795	\N	\N	DRAFT	2	KNOT	0	0	\N	\N	\N
44	\N	MALE	12	\N	\N	\N	\N	\N	\N	2023-08-14 05:38:52.285	2023-08-15 05:21:21.152	2023-08-15 05:21:21.15	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
46	\N	MALE	11	\N	\N	\N	\N	\N	\N	2023-08-14 05:45:22.412	2023-08-15 05:21:27.672	2023-08-15 05:21:27.67	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
45	\N	MALE	14	\N	\N	\N	\N	\N	\N	2023-08-14 05:43:17.427	2023-08-15 05:21:34.012	2023-08-15 05:21:34.01	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
41	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-11 09:34:08.356	2023-08-13 15:42:04.701	\N	\N	FORMED	2	ARTISTIC_DESCRIPTION	29571	5	1	2	\N
20	\N	MALE	6	\N	\N	\N	\N	\N	\N	2023-06-28 09:23:07.796	2023-08-15 05:21:39.666	2023-08-15 05:21:39.664	testOrder1	FORMED	1	ARTISTIC_DESCRIPTION	200	3	3	1	\N
43	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-13 15:44:01.789	2023-08-14 05:10:13.899	\N	\N	FORMED	2	ARTISTIC_DESCRIPTION	1	1	1	1	\N
17	\N	FEMALE	7	\N	\N	\N	\N	\N	\N	2023-06-27 07:17:54.911	2023-08-15 05:21:44.857	2023-08-15 05:21:44.855	Заявка 123123	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
30	\N	MALE	5	\N	Тут остановился	next	\N	\N	\N	2023-06-30 21:22:26.059	2023-08-15 05:21:49.964	2023-08-15 05:21:49.962	\N	FORMED	1	ARTISTIC_DESCRIPTION	4324	1	2	2	\N
34	\N	MALE	11	\N	vfvdf	\N	b	34	c	2023-07-11 05:08:42.834	2023-08-15 05:21:56.619	2023-08-15 05:21:56.605	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
28	\N	MALE	9	\N	\N	\N	\N	\N	\N	2023-06-28 13:11:31.358	2023-08-15 05:22:01.381	2023-08-15 05:22:01.379	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
57	\N	MALE	8	\N	\N	\N	\N	\N	\N	2023-08-15 14:01:08.2	2023-08-17 06:59:26.473	2023-08-17 06:59:26.471	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
42	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-13 15:42:31.082	2023-08-18 10:43:16.731	\N	\N	FORMED	2	ARTISTIC_DESCRIPTION	1	1	1	1	\N
55	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-15 10:35:38.79	2023-08-15 10:35:51.732	\N	\N	FORMED	25	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
37	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-07-12 05:13:06.195	2023-08-15 05:22:06.956	2023-08-15 05:22:06.954	\N	FORMED	1	SIZE	1	1	\N	\N	\N
60	\N	MALE	9	\N	Курточка стонайланд	\N	\N	\N	\N	2023-08-15 20:04:13.68	2023-08-17 04:44:48.349	\N	Бомбер Петушок 🐔	FORMED	1	ARTISTIC_DESCRIPTION	1	1	3	2	\N
54	\N	MALE	11	\N	\N	\N	\N	\N	\N	2023-08-15 10:14:05.199	2023-08-17 06:58:42.766	2023-08-17 06:58:42.762	\N	FORMED	1	ARTISTIC_DESCRIPTION	100	2	1	\N	\N
35	\N	MALE	6	\N	\N	\N	\N	\N	\N	2023-07-11 07:27:38.894	2023-08-15 05:22:12.469	2023-08-15 05:22:12.467	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
52	\N	MALE	4	\N	Хочу анорак Napapijri	Крутые узлы\n		\N	Околофутбол\n	2023-08-15 06:26:47.661	2023-08-21 09:59:44.753	\N	OFFFFFFNIK2282010	FORMED	23	ARTISTIC_DESCRIPTION	32474	10	2	2	\N
53	\N	MALE	12	\N	\N	\N	\N	\N	Худой	2023-08-15 07:24:01.979	2023-08-17 06:58:37.336	2023-08-17 06:58:37.334	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	1	\N	\N
58	\N	MALE	7	\N	\N	\N	\N	\N	\N	2023-08-15 14:01:47.197	2023-08-17 06:59:00.198	2023-08-17 06:59:00.196	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
56	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-15 13:25:54.209	2023-08-21 10:30:18.105	\N	\N	FORMED	1	QUANTITY_AND_TIME	1	1	2	2	\N
61	\N	MALE	13	\N	\N	\N	\N	\N	\N	2023-08-16 07:36:50.306	2023-08-16 07:36:59.365	\N	\N	DRAFT	\N	SIZE	0	0	\N	\N	ea2b7118-91d8-441b-b52c-5c981e2dc0e8
62	\N	MALE	11	\N	 d,mfnms	,anfm,sn	\N	\N	\N	2023-08-16 08:56:26.182	2023-08-16 08:57:17.192	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	1	1	\N	\N	fec54e85-6050-46bc-951b-cc3268edcc72
63	\N	MALE	6	\N	ТЕСТ	ТЕСТ	ТЕСТ	ТЕСТ	ТЕСТ	2023-08-16 08:57:28.94	2023-08-16 08:58:12.217	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	1	1	1	2	648ea762-339f-4de6-ae14-152399d5c26b
64	\N	MALE	4	\N	ТЕСТ	ТЕСТ	ТЕСТ	ТЕСТ	TEST	2023-08-16 09:10:23.716	2023-08-16 09:11:20.991	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	20001	6	2	2	e9134d73-722a-4caa-b228-5355cacf2044
110	\N	MALE	15	\N	\N	\N	\N	\N	\N	2023-08-22 14:04:00.506	2023-08-22 15:13:04.746	\N	\N	DRAFT	\N	SIZE	1	1	\N	\N	3a287e27-fb6f-4238-bf4a-83ad9b1293d7
90	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-18 10:09:09.284	2023-08-18 10:09:47.891	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	11822	7	\N	\N	\N
72	\N	MALE	5	\N	\N	\N	\N	\N	\N	2023-08-16 14:22:11.642	2023-08-16 14:22:22.927	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	1	1	\N	\N	f2c53fc3-1ea9-4067-bf7c-224efdac63de
65	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-16 09:55:41.232	2023-08-16 11:36:47.366	\N	\N	DRAFT	\N	SEX	0	0	3	2	c57a9cfd-d2cf-4ae9-8473-1fa810c01079
81	\N	MALE	7	\N	\N	\N	\N	\N	\N	2023-08-17 09:43:50.65	2023-08-17 09:48:31.692	\N	\N	DRAFT	35	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
82	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-17 10:06:42.519	2023-08-17 10:06:42.519	\N	\N	DRAFT	1	SEX	0	0	\N	\N	\N
66	\N	FEMALE	16	\N	1	2	3	4	5	2023-08-16 11:46:52.342	2023-08-16 11:47:36.693	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	20	1	\N	\N	895ddbff-ca96-4954-ade6-d74606af2ed6
67	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-16 13:05:16.966	2023-08-16 13:05:16.966	\N	\N	DRAFT	\N	SEX	0	0	\N	\N	63c81c04-1694-48af-a4c5-cb419924fa82
85	\N	UNISEX	6	\N		\N	\N	\N	\N	2023-08-17 11:02:10.775	2023-08-17 11:02:35.259	\N	\N	FORMED	14	ARTISTIC_DESCRIPTION	46813	36	3	3	\N
94	\N	MALE	48	\N		\N	\N	\N	\N	2023-08-19 12:23:36.162	2023-08-19 12:32:33.634	\N	БристлБэк	FORMED	25	ARTISTIC_DESCRIPTION	10897	6	2	2	\N
68	\N	FEMALE	15	\N	1	2	3	4	6	2023-08-16 13:33:27.8	2023-08-16 13:34:06.022	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	20	1	\N	\N	a8fe6d0f-e6fb-46d1-914c-610f3b065b55
74	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-16 18:54:37.528	2023-08-16 18:54:52.526	\N	\N	DRAFT	\N	KNOT	0	0	\N	\N	7fd485d4-e2e0-4087-8454-51798bcf96e8
108	\N	MALE	4	\N		\N	\N	\N	\N	2023-08-22 12:20:51.934	2023-08-22 12:21:17.922	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	1	1	3	3	0e53ea50-8eeb-402f-aa6b-a4df7d8bede4
78	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-17 05:53:25.38	2023-08-17 05:58:00.802	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	1	1	3	2	534e658c-58b7-445b-abfd-c0e3590cc0ff
51	\N	MALE	9	\N	Силуэт и покрой	обработка узлов	ткани	дополнительные материалы	Художественное описание художника	2023-08-15 05:22:49.331	2023-08-17 06:58:31.058	2023-08-17 06:58:31.056	\N	FORMED	1	ARTISTIC_DESCRIPTION	200	2	1	2	\N
70	\N	FEMALE	49	\N	\N	\N	\N	\N	\N	2023-08-16 13:49:13.835	2023-08-17 06:59:12.024	2023-08-17 06:59:12.022	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
69	\N	FEMALE	23	\N	\N	\N	\N	\N	\N	2023-08-16 13:38:52.725	2023-08-16 13:39:08.516	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	1	1	\N	\N	b35f9169-2d15-49a4-994c-06641474cb2e
79	\N	MALE	28	\N	\N	\N	\N	\N	\N	2023-08-17 09:26:05.17	2023-08-17 09:27:03.672	\N	\N	DRAFT	\N	SIZE	0	0	\N	\N	e4a8ad7d-d18e-4020-b17b-5ff9a48100fe
95	\N	UNISEX	\N	\N	\N	\N	\N	\N	\N	2023-08-19 12:34:42.854	2023-08-19 12:41:42.577	\N	\N	DRAFT	\N	SEX	0	0	\N	\N	a74501f0-9c94-48d2-866c-e12dc98f06ec
75	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-17 04:43:19.617	2023-08-17 04:43:46.498	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	53200	1	1	2	babc1cf2-550c-4382-82d7-99d64f5df4cb
102	\N	MALE	4	\N	крутой силуэт 	\N	\N	\N	\N	2023-08-21 09:19:20.415	2023-08-21 09:21:01.86	\N	Тест	FORMED	23	ARTISTIC_DESCRIPTION	1	1	3	2	\N
91	\N	MALE	6	\N	\N	\N	\N	\N	\N	2023-08-18 10:11:30.424	2023-08-18 10:11:49.93	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	1	1	2	1	\N
96	\N	MALE	7	\N	\N	\N	\N	\N	\N	2023-08-21 04:58:49.15	2023-08-21 06:08:42.577	\N	\N	DRAFT	1	KNOT	0	0	\N	\N	\N
86	\N	MALE	51	\N	фцвфцвфцв	фвцфцвцв	фвццфв	фцвфцвцф	\N	2023-08-17 11:57:07.521	2023-08-17 12:03:08.306	\N	\N	DRAFT	2	ARTISTIC_DESCRIPTION	1	1	2	2	\N
88	\N	MALE	13	\N	khbkjbkjjkkj	jkkjjk	\N	\N	\N	2023-08-18 09:51:49.418	2023-08-18 09:54:06.777	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	44293	36	1	3	\N
106	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-21 12:11:44.1	2023-08-21 12:12:33.342	\N	\N	DRAFT	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
76	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-17 04:44:55.652	2023-08-17 04:45:18.393	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	1	1	3	1	2b3c5cb3-1351-41d1-991e-f20da8e7c088
71	\N	MALE	5	\N	\N	\N	\N	\N	\N	2023-08-16 14:15:15.923	2023-08-16 14:15:41.009	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	1	1	\N	\N	15acfcf4-1171-47a2-8af8-b087818b2dd9
103	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-21 09:22:48.335	2023-08-21 09:35:31.904	\N	\N	DRAFT	23	SEX	0	0	\N	\N	\N
80	\N	FEMALE	52	\N	\N	\N	\N	\N	\N	2023-08-17 09:28:53.867	2023-08-17 09:43:28.192	\N	\N	FORMED	35	ARTISTIC_DESCRIPTION	1	1	\N	2	\N
77	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-17 04:54:02.89	2023-08-17 05:26:12.905	\N	\N	FORMED	\N	ARTISTIC_DESCRIPTION	1	1	3	\N	1a8a309d-b970-4691-82c8-424da49df61c
97	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-21 05:34:14.816	2023-08-21 05:34:43.526	\N	\N	DRAFT	23	SEX	0	0	\N	\N	\N
98	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-21 05:35:04.836	2023-08-21 05:35:04.836	\N	\N	DRAFT	\N	SEX	0	0	\N	\N	c83b474c-9444-45d0-9be1-8c51c217070a
104	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-21 10:17:55.633	2023-08-21 10:18:02.507	\N	\N	DRAFT	23	SEX	0	0	\N	\N	\N
73	\N	MALE	5	\N	\N	\N	\N	\N	\N	2023-08-16 14:24:29.144	2023-08-21 10:49:38.192	\N	Djbdbdbdbd	FORMED	1	ARTISTIC_DESCRIPTION	1	1	3	2	\N
101	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-21 07:18:00.93	2023-08-21 11:13:48.671	\N	\N	DRAFT	1	SEX	0	0	\N	\N	\N
87	\N	MALE	73	\N	Hdhdbdhdhd	Fucddyvc	Fjvcc	Dyvxdd	Xuhsbsvdvdjdk	2023-08-17 18:15:44.315	2023-08-21 12:13:52.187	\N	\N	DRAFT	1	ARTISTIC_DESCRIPTION	1	1	1	1	\N
84	\N	MALE	6	\N	\N	\N	\N	\N	\N	2023-08-17 10:35:58.222	2023-08-17 10:36:09.966	\N	\N	FORMED	14	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
89	\N	MALE	7	\N	\N	\N	\N	\N	ЫЫЫЫ	2023-08-18 10:04:27.025	2023-08-18 10:05:02.508	\N	\N	FORMED	20	ARTISTIC_DESCRIPTION	19899	18	2	\N	\N
92	\N	MALE	37	\N	\N	\N	\N	\N	\N	2023-08-18 11:11:36.697	2023-08-18 11:27:27.08	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	1	1	3	2	\N
93	\N	MALE	\N	\N	\N	\N	\N	\N	\N	2023-08-18 11:33:38.375	2023-08-18 11:37:15.323	\N	\N	DRAFT	23	SEX	0	0	\N	\N	\N
100	\N	MALE	4	\N	явимв	\N	\N	\N	\N	2023-08-21 07:11:00.707	2023-08-21 07:11:22.984	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	3563	7	2	2	\N
83	\N	MALE	4	\N		\N	\N	\N		2023-08-17 10:11:56.69	2023-08-18 12:09:26.341	\N	\N	FORMED	1	QUANTITY_AND_TIME	200	2	3	3	\N
99	\N	MALE	4	\N	\N	\N	\N	\N	\N	2023-08-21 05:35:26.739	2023-08-21 05:36:07.103	\N	\N	FORMED	23	ARTISTIC_DESCRIPTION	4466	2	2	2	\N
107	\N	MALE	6	\N	\N	\N	\N	\N	\N	2023-08-22 07:07:39.64	2023-08-22 07:08:17.835	\N	\N	DRAFT	\N	ARTISTIC_DESCRIPTION	1	1	\N	\N	e8e91182-1952-4d94-9e73-95b03a48852e
105	\N	MALE	4	\N		\N	\N	\N	\N	2023-08-21 11:12:59.373	2023-08-21 11:17:58.386	\N	\N	FORMED	1	ARTISTIC_DESCRIPTION	1	1	\N	\N	\N
109	\N	MALE	8	\N	\N	\N	\N	\N	\N	2023-08-22 12:56:16.71	2023-08-22 13:59:01.542	\N	\N	DRAFT	1	SIZE	0	0	\N	\N	\N
\.


--
-- Data for Name: OrderAdditionalServices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderAdditionalServices" (id, order_id, additional_services_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: OrderFabrik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderFabrik" (id, order_id, fabrik_id, created_at, updated_at, deleted_at) FROM stdin;
1	35	1	2023-07-11 11:22:54.346	2023-07-11 16:22:55	\N
2	35	2	2023-07-11 11:22:54.346	2023-07-11 16:22:56	\N
3	34	1	2023-07-11 11:22:54.346	2023-07-11 16:22:57	\N
\.


--
-- Data for Name: OrderPerService; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderPerService" (id, name, phone_number, period, packet) FROM stdin;
1	asdasd	+78005553535	1	BUSINES
2	Тест заявки б2б лендинг	+79619134546	1	ADDED
3	dadasdasd	+79619478256	1	BUSINES
4	dadasdas	+79619478256	6	BUSINES
5	dadasdas	+79619478256	6	BUSINES
6	ddassdf	+79619478256	1	BUSINES
7	ddasdas	+79619478256	1	BUSINES
8	Test	+79619478256	1	BUSINES
9	Test	+79619478256	1	BUSINES
10	Test	+79619478256	1	BUSINES
11	Test	+79619478256	1	BUSINES
12	Тест заявки б2б лендинг	89619134546	6	ADDED
13	Тест заявки б2б лендинг	89619134546	6	ADDED
14	asdasdas	+79619478256	12	ADDED
15	dasdsad	+79619478256	12	BUSINES
16	dsadsad	+79619478256	1	ADDED
17	йцуйцу	89619134546	1	ADDED
18	Никита	+7 919 845-56-69	1	ADDED
19	Тест заявки б2б лендинг	89619134546	1	ADDED
20	Test	+79619478256	6	BUSINES
21	Test	+79619478256	1	BUSINES
22	Lat test	89619134546	1	ADDED
23	Афины	89619134546	1	ADDED
24	test	89619134546	1	ADDED
25	Афины	89619134546	1	ADDED
26	test	89619134546	\N	\N
27	Афины	89619134546	\N	\N
\.


--
-- Data for Name: OrderSize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderSize" (size_id, order_id, created_at, updated_at, deleted_at) FROM stdin;
5	59	2023-08-15 19:55:53.088	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
6	59	2023-08-15 19:55:53.685	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
7	58	2023-08-15 14:14:06.256	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
3	110	2023-08-22 14:45:59.489	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
4	59	2023-08-15 19:55:52.546	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	4	2023-06-07 10:59:55.621	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
7	59	2023-08-15 19:55:54.297	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	5	2023-06-07 11:08:48.951	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	6	2023-06-07 15:17:58.91	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
4	60	2023-08-15 20:05:00.501	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
5	60	2023-08-15 20:05:00.3	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
4	14	2023-06-19 06:05:28.391	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	15	2023-06-19 06:50:24.614	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	28	2023-06-28 13:11:55.05	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	29	2023-06-29 12:57:48.299	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	30	2023-06-30 21:22:38.368	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	110	2023-08-22 14:45:59.495	2023-08-22 15:13:04.748	\N
6	8	2023-06-13 11:57:01.963	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
4	32	2023-07-05 07:15:06.07	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	33	2023-07-10 09:55:38.847	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	25	2023-06-28 12:59:14.054	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
5	4	2023-06-07 10:59:59.484	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
7	4	2023-06-07 10:59:58.931	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	35	2023-07-11 07:42:57.311	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
5	5	2023-06-07 11:08:49.277	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	47	2023-08-16 04:28:02.48	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
6	47	2023-08-16 04:40:23.641	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
7	6	2023-06-07 15:17:59.312	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	11	2023-06-15 13:32:02.385	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	11	2023-07-21 11:52:00.019	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
5	11	2023-06-15 13:35:07.286	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
4	41	2023-08-11 09:34:23.33	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	42	2023-08-13 15:43:29.985	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	43	2023-08-13 15:44:15.796	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	83	2023-08-17 10:15:49.13	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
7	47	2023-08-14 07:37:00.344	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	48	2023-08-14 08:16:15.105	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	11	2023-06-15 13:15:05.647	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
4	49	2023-08-14 10:05:17.956	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
7	26	2023-06-28 13:05:35.569	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	50	2023-08-14 10:33:06.931	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	52	2023-08-15 06:34:16.327	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	15	2023-06-19 06:50:27.717	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	24	2023-06-28 11:24:10.532	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
7	31	2023-07-03 09:55:23.633	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	54	2023-08-15 10:14:33.466	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	55	2023-08-15 10:35:48.247	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	80	2023-08-17 09:36:48.929	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	85	2023-08-17 11:02:18.919	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	84	2023-08-17 10:36:05.501	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
7	33	2023-07-10 06:35:49.681	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
4	56	2023-08-15 13:26:01.106	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	26	2023-06-28 13:05:35.081	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	31	2023-07-03 09:55:23.595	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	17	2023-07-11 07:44:33.924	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	20	2023-07-11 11:28:41.451	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	65	2023-08-16 09:55:45.056	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	66	2023-08-16 11:47:06.977	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	68	2023-08-16 13:33:46.225	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
5	14	2023-06-19 06:05:19.37	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
6	71	2023-08-16 14:15:29.643	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	72	2023-08-16 14:22:17.741	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
5	15	2023-06-19 06:50:26.498	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	26	2023-06-28 13:05:34.531	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
7	62	2023-08-16 08:56:34.359	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
5	28	2023-06-28 13:11:54.688	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	29	2023-06-29 12:57:48.845	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	30	2023-06-30 21:22:38.917	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	34	2023-07-11 05:56:51.781	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	62	2023-08-16 08:56:34.019	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	25	2023-06-28 12:59:14.707	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	39	2023-07-21 05:06:52.888	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	69	2023-08-16 13:39:01.456	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	70	2023-08-16 13:49:23.795	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	71	2023-08-16 14:15:29.296	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	74	2023-08-16 18:54:44.083	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	75	2023-08-17 04:43:23.212	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	76	2023-08-17 04:45:02.353	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	41	2023-08-11 09:34:21.985	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	83	2023-08-17 10:15:49.526	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	77	2023-08-17 04:54:30.495	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	50	2023-08-14 10:33:07.162	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	33	2023-07-10 09:55:39.163	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
7	63	2023-08-16 08:57:35.255	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	17	2023-07-11 07:44:33.073	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	36	2023-07-11 10:51:51.292	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	64	2023-08-16 09:10:30.364	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	37	2023-07-12 05:23:30.38	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	66	2023-08-16 11:47:07.405	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	68	2023-08-16 13:33:46.641	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	41	2023-08-11 13:22:55.886	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	83	2023-08-17 10:15:50.375	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	77	2023-08-17 05:15:27.515	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	80	2023-08-17 09:31:13.047	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	43	2023-08-14 05:11:00.273	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	45	2023-08-14 05:43:54.1	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	53	2023-08-15 07:26:41.431	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	81	2023-08-17 09:43:55.408	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	84	2023-08-17 10:36:06.232	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
3	59	2023-08-15 19:55:52.022	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	4	2023-06-07 10:59:53.22	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	60	2023-08-15 20:05:00.789	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	14	2023-06-19 06:05:15.128	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	16	2023-06-19 11:53:36.134	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	28	2023-06-28 13:11:55.514	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
5	110	2023-08-22 14:24:58.605	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
3	29	2023-06-29 12:57:47.811	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	32	2023-07-05 07:15:04.925	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	61	2023-08-16 07:38:11.855	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	33	2023-07-10 08:04:36.607	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	30	2023-06-30 21:22:37.977	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	25	2023-06-28 12:59:13.46	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	41	2023-08-11 11:39:46.247	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	46	2023-08-14 05:45:37.357	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	49	2023-08-14 10:05:16.642	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
5	51	2023-08-15 05:50:22.149	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	52	2023-08-15 06:34:17.249	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	57	2023-08-15 14:01:28.361	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	85	2023-08-17 11:02:18.187	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	80	2023-08-17 09:31:11.763	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	84	2023-08-17 10:36:05.859	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	87	2023-08-17 18:15:53.589	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	88	2023-08-18 09:53:27.786	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	89	2023-08-18 10:04:40.998	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	94	2023-08-19 12:25:32.607	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	96	2023-08-21 05:02:01.684	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	100	2023-08-21 07:11:08.717	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
5	109	2023-08-22 13:59:01.544	2023-08-22 15:05:29.68	2023-08-22 15:05:29.679
7	92	2023-08-18 11:27:14.182	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	105	2023-08-21 11:16:04.234	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	106	2023-08-21 12:12:16.138	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	109	2023-08-22 13:50:11.516	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	110	2023-08-22 14:04:33.303	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	85	2023-08-17 11:02:20.338	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
7	87	2023-08-17 18:15:53.105	2023-08-22 15:10:36.553	2023-08-22 15:10:36.551
6	110	2023-08-22 14:04:33.26	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	73	2023-08-16 14:24:35.809	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	75	2023-08-17 04:43:23.583	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
3	52	2023-08-15 06:34:15.7	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	85	2023-08-17 11:02:18.618	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	83	2023-08-17 10:15:48.842	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	84	2023-08-17 10:36:05.201	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	90	2023-08-18 10:09:19.599	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	94	2023-08-19 12:25:31.494	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	99	2023-08-21 05:35:34.501	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
3	109	2023-08-22 13:50:11.498	2023-08-22 15:05:29.649	2023-08-22 15:05:29.647
4	91	2023-08-18 10:11:38.768	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	94	2023-08-19 12:25:32.024	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	99	2023-08-21 05:35:33.363	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	96	2023-08-21 05:49:01.567	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
4	102	2023-08-21 09:19:38.377	2023-08-22 15:05:29.656	2023-08-22 15:05:29.654
6	76	2023-08-17 04:45:02.797	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	41	2023-08-11 09:34:21.431	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	42	2023-08-13 15:43:10.484	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	83	2023-08-17 10:15:49.883	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	77	2023-08-17 04:54:08.24	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	78	2023-08-17 05:53:28.686	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	43	2023-08-14 05:11:01.007	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	44	2023-08-14 05:39:17.998	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	48	2023-08-14 08:16:16.32	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	50	2023-08-14 10:33:07.654	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	33	2023-07-10 06:35:49.331	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	51	2023-08-15 05:50:22.638	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	80	2023-08-17 09:31:12.211	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	84	2023-08-17 10:36:03.81	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	85	2023-08-17 11:02:20.548	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	56	2023-08-15 13:35:42.506	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	86	2023-08-17 11:57:12.928	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	87	2023-08-17 18:15:54.674	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	88	2023-08-18 09:53:26.13	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
6	109	2023-08-22 13:50:11.509	2023-08-22 15:11:11.584	2023-08-22 15:11:11.582
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, name, parent_id, created_at, updated_at, deleted_at, description, sex, mannequin) FROM stdin;
1	Верхняя	\N	2023-04-26 07:30:31.037	2023-04-26 12:15:27	\N	Куртки, плащи, пальто и другая одежда для выхода на улицу	UNISEX	\N
2	Легкая	\N	2023-04-26 07:30:31.037	2023-04-26 12:17:49	\N	Вся обычная одежда - майки, рубашки, штаны и т.п.	UNISEX	\N
3	Нижнее белье	\N	2023-04-26 07:30:31.037	2023-04-26 12:17:51	\N	Все типы нательного белья	UNISEX	\N
4	Анорак	1	2023-04-26 07:30:31.037	2023-04-26 12:25:17	\N	\N	UNISEX	UP
5	Жилетка	1	2023-04-26 07:30:31.037	2023-04-26 12:25:18	\N	\N	UNISEX	UP
6	Ветровка	1	2023-04-26 07:30:31.037	2023-04-26 12:25:19	\N	\N	UNISEX	UP
7	Комбинезон	1	2023-04-26 07:30:31.037	2023-04-26 12:25:20	\N	\N	UNISEX	FULL
8	Пуховик	1	2023-04-26 07:30:31.037	2023-04-26 12:25:20	\N	\N	UNISEX	UP
9	Бомбер	1	2023-04-26 07:30:31.037	2023-04-26 12:25:21	\N	\N	UNISEX	UP
10	Куртка	1	2023-04-26 07:30:31.037	2023-04-26 12:25:22	\N	\N	UNISEX	UP
11	Косуха	1	2023-04-26 07:30:31.037	2023-04-26 12:25:22	\N	\N	UNISEX	UP
13	Пальто	1	2023-04-26 07:30:31.037	2023-04-26 12:25:24	\N	\N	UNISEX	FULL
15	Шуба	1	2023-04-26 07:30:31.037	2023-04-26 12:25:25	\N	\N	UNISEX	FULL
16	Плащ	1	2023-04-26 07:30:31.037	2023-04-26 12:25:26	\N	\N	UNISEX	FULL
17	Верх	2	2023-04-26 07:38:48.507	2023-04-26 12:38:03	\N	\N	UNISEX	\N
18	Низ	2	2023-04-26 07:38:48.507	2023-04-26 12:38:05	\N	\N	UNISEX	\N
19	Комбинированные	2	2023-04-26 07:38:48.507	2023-04-26 12:38:05	\N	\N	UNISEX	\N
20	Длинный рукав	17	2023-04-26 07:40:15.895	2023-04-26 12:39:59	\N	\N	UNISEX	\N
21	Короткий рукав(без рукавов)	17	2023-04-26 07:40:15.895	2023-04-26 12:40:01	\N	\N	UNISEX	\N
23	Худи	20	2023-04-26 07:44:06.174	2023-04-26 12:44:03	\N	\N	UNISEX	UP
27	Поло(длинный рукав)	20	2023-04-26 07:44:06.174	2023-04-26 12:42:04	\N	\N	UNISEX	UP
28	Лонгслив	20	2023-04-26 07:44:06.174	2023-04-26 12:42:05	\N	\N	UNISEX	UP
29	Джемпер	20	2023-04-26 07:44:06.174	2023-04-26 12:42:07	\N	\N	UNISEX	UP
30	Свитер	20	2023-04-26 07:44:06.174	2023-04-26 12:42:06	\N	\N	UNISEX	UP
32	Пуловер	20	2023-04-26 07:44:06.174	2023-04-26 12:42:08	\N	\N	UNISEX	UP
33	Водолазка	20	2023-04-26 07:44:06.174	2023-04-26 12:42:09	\N	\N	UNISEX	UP
34	Кардиган	20	2023-04-26 07:44:06.174	2023-04-26 12:42:10	\N	\N	UNISEX	UP
35	Пиджак	20	2023-04-26 07:44:06.174	2023-04-26 12:42:10	\N	\N	UNISEX	UP
36	Футболка	21	2023-04-26 07:44:06.174	2023-04-26 12:42:48	\N	\N	UNISEX	UP
37	Поло	21	2023-04-26 07:44:06.174	2023-04-26 12:42:50	\N	\N	UNISEX	UP
38	Безрукавка	21	2023-04-26 07:44:06.174	2023-04-26 12:42:51	\N	\N	UNISEX	UP
39	Рубашка	21	2023-04-26 07:44:06.174	2023-04-26 12:42:52	\N	\N	UNISEX	UP
40	Жилет	21	2023-04-26 07:44:06.174	2023-04-26 12:42:52	\N	\N	UNISEX	UP
63	Верх	3	2023-04-26 08:06:35.728	2023-04-26 13:06:03	\N	\N	UNISEX	\N
64	Низ	3	2023-04-26 08:06:35.728	2023-04-26 13:06:04	\N	\N	UNISEX	\N
65	Комбинированное	3	2023-04-26 08:06:35.728	2023-04-26 13:06:05	\N	\N	UNISEX	\N
66	Майка	63	2023-04-26 08:08:47.516	2023-04-26 13:07:51	\N	\N	UNISEX	UP
67	Рубашка	63	2023-04-26 08:08:47.516	2023-04-26 13:07:53	\N	\N	UNISEX	UP
69	Бюстгалтер	63	2023-04-26 08:08:47.516	2023-04-26 13:07:54	\N	\N	FEMALE	UP
70	Трусы	64	2023-04-26 08:08:47.516	2023-04-26 13:07:55	\N	\N	UNISEX	DOWN
25	Олимпийка	20	2023-04-26 07:44:06.174	2023-04-26 12:42:02	\N	\N	UNISEX	UP
24	Свитшот	20	2023-04-26 07:44:06.174	2023-04-26 12:44:04	\N	\N	UNISEX	UP
71	Шорты	64	2023-04-26 08:08:47.516	2023-04-26 13:07:55	\N	\N	UNISEX	DOWN
31	Рубашка	20	2023-04-26 07:44:06.174	2023-04-26 12:42:08	\N	\N	UNISEX	UP
26	Толстовка	20	2023-04-26 07:44:06.174	2023-04-26 12:42:04	\N	\N	UNISEX	UP
43	Длинные	18	2023-04-26 07:46:04.384	2023-04-26 12:45:02	\N	\N	UNISEX	\N
44	Короткие	18	2023-04-26 07:46:04.384	2023-04-26 12:45:04	\N	\N	UNISEX	\N
52	Чиносы	43	2023-04-26 07:51:51.653	2023-04-26 12:49:10	\N	\N	UNISEX	DOWN
51	Брюки	43	2023-04-26 07:51:51.653	2023-04-26 12:49:09	\N	\N	UNISEX	DOWN
50	Джинсы	43	2023-04-26 07:51:51.653	2023-04-26 12:49:08	\N	\N	UNISEX	DOWN
54	Юбка	43	2023-04-26 07:51:51.653	2023-04-26 12:49:11	\N	\N	UNISEX	DOWN
49	Карго	43	2023-04-26 07:51:51.653	2023-04-26 12:49:08	\N	\N	UNISEX	DOWN
48	Джоггеры	43	2023-04-26 07:51:51.653	2023-04-26 12:49:07	\N	\N	UNISEX	DOWN
47	Горнолыжные	43	2023-04-26 07:51:51.653	2023-04-26 12:49:06	\N	\N	UNISEX	DOWN
46	Тайтсы	43	2023-04-26 07:51:51.653	2023-04-26 12:49:06	\N	\N	UNISEX	DOWN
55	Бриджи	44	2023-04-26 08:01:33.422	2023-04-26 13:00:52	\N	\N	UNISEX	DOWN
56	Шорты	44	2023-04-26 08:01:33.422	2023-04-26 13:00:53	\N	\N	UNISEX	DOWN
57	Юбка	44	2023-04-26 08:01:33.422	2023-04-26 13:00:55	\N	\N	FEMALE	DOWN
59	Комбинезоны	19	2023-04-26 08:05:44.761	2023-04-26 13:03:10	\N	\N	UNISEX	FULL
61	Платье	19	2023-04-26 08:05:44.761	2023-04-26 13:03:11	\N	\N	FEMALE	FULL
62	Сарафан	19	2023-04-26 08:05:44.761	2023-04-26 13:03:12	\N	\N	FEMALE	FULL
72	Штаны	64	2023-04-26 08:08:47.516	2023-04-26 13:07:56	\N	\N	UNISEX	DOWN
73	Пижама	65	2023-04-26 08:08:47.516	2023-04-26 13:07:57	\N	\N	UNISEX	FULL
58	Спортивные костюмы	19	2023-04-26 08:05:44.761	2023-04-26 13:03:09	\N	\N	UNISEX	FULL
68	Халат	63	2023-04-26 08:08:47.516	2023-04-26 13:07:53	\N	\N	UNISEX	FULL
60	Костюм	19	2023-04-26 08:05:44.761	2023-04-26 13:03:11	\N	\N	UNISEX	FULL
12	Парка	1	2023-04-26 07:30:31.037	2023-04-26 12:25:23	\N	\N	UNISEX	UP
14	Дубленка	1	2023-04-26 07:30:31.037	2023-04-26 12:25:24	\N	\N	UNISEX	UP
\.


--
-- Data for Name: ProductDocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductDocument" (id, product_id, document_id, type, created_at, updated_at, deleted_at, mannequin_sex) FROM stdin;
99	47	93	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:59:39	\N	MALE
100	48	96	MANNEQUIN	2023-05-12 05:01:44.584	2023-05-12 10:01:22	\N	MALE
81	14	97	MANNEQUIN	2023-05-12 04:51:24.364	2023-05-12 09:51:16	\N	MALE
72	71	77	MANNEQUIN	2023-05-11 09:53:09.548	2023-05-11 14:52:56	\N	MALE
69	70	36	MANNEQUIN	2023-05-05 11:42:14.942	2023-05-05 16:41:15	\N	MALE
48	70	78	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
53	71	40	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
74	66	43	MANNEQUIN	2023-05-11 12:11:21.956	2023-05-11 17:11:15	\N	MALE
58	60	46	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
59	60	47	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
75	59	79	MANNEQUIN	2023-05-11 12:37:13.102	2023-05-11 17:37:05	\N	MALE
95	38	86	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:33	\N	MALE
79	9	87	MANNEQUIN	2023-05-12 04:50:42.855	2023-05-12 09:50:04	\N	MALE
67	55	88	MANNEQUIN	2023-05-05 11:29:06.131	2023-05-05 16:28:03	\N	MALE
103	51	89	MANNEQUIN	2023-05-12 05:01:44.584	2023-05-12 10:01:35	\N	MALE
77	6	90	MANNEQUIN	2023-05-12 04:49:53.316	2023-05-12 09:49:47	\N	MALE
90	33	91	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:56:32	\N	MALE
102	50	95	MANNEQUIN	2023-05-12 05:01:44.584	2023-05-12 10:01:31	\N	MALE
86	29	94	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:55:00	\N	MALE
88	31	117	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:55:46	\N	MALE
97	40	98	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:59:02	\N	MALE
76	5	99	MANNEQUIN	2023-05-12 04:49:05.763	2023-05-12 09:48:59	\N	MALE
101	49	100	MANNEQUIN	2023-05-12 05:01:44.584	2023-05-12 10:01:27	\N	MALE
91	34	101	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:17	\N	MALE
68	56	102	MANNEQUIN	2023-05-05 11:29:49.116	2023-05-05 16:29:45	\N	MALE
80	11	103	MANNEQUIN	2023-05-12 04:51:02.713	2023-05-12 09:50:56	\N	MALE
85	28	104	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:54:38	\N	MALE
83	25	105	MANNEQUIN	2023-05-12 04:52:58.754	2023-05-12 09:52:53	\N	MALE
92	35	106	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:21	\N	MALE
89	32	107	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:56:29	\N	MALE
1	4	1	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
2	4	42	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
3	38	2	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
4	9	3	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
5	55	4	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
6	51	5	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
9	6	6	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
10	33	7	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
11	47	8	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
12	29	9	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
13	50	10	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
14	48	11	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
15	14	12	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
16	40	13	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
17	5	14	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
18	49	15	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
19	34	16	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
20	7	17	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
21	7	44	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
22	59	44	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
23	11	18	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
24	10	19	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
25	10	48	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
26	28	20	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
27	25	21	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
28	13	22	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
29	13	49	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
30	12	23	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
31	12	50	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
32	35	24	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
33	16	25	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
34	16	53	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
35	37	27	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
36	27	26	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
37	32	28	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
38	8	29	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
39	8	54	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
40	67	55	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
41	31	31	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
42	39	30	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
43	30	32	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
44	24	33	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
45	46	34	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
46	26	35	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
47	26	58	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
49	36	37	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
50	23	38	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
51	23	61	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
52	52	39	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
54	56	45	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
55	15	41	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
56	15	63	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
57	66	43	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
60	73	51	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
61	73	52	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
62	58	56	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
63	58	57	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
64	68	59	MANNEQUIN	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
65	68	60	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
66	72	62	PREVIEW	2023-04-28 13:50:56.693	2023-04-28 13:50:56.693	\N	MALE
98	46	108	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:59:25	\N	MALE
93	36	109	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:25	\N	MALE
104	52	110	MANNEQUIN	2023-05-12 05:01:44.584	2023-05-12 10:01:39	\N	MALE
82	24	111	MANNEQUIN	2023-05-12 04:52:58.754	2023-05-12 09:52:34	\N	MALE
87	30	112	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:55:41	\N	MALE
71	72	113	MANNEQUIN	2023-05-05 11:42:14.942	2023-05-05 16:41:16	\N	MALE
84	27	114	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:54:24	\N	MALE
94	37	115	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:29	\N	MALE
96	39	116	MANNEQUIN	2023-05-12 04:59:44.396	2023-05-12 09:58:41	\N	MALE
73	67	118	MANNEQUIN	2023-05-11 12:10:38.669	2023-05-11 17:10:30	\N	MALE
107	4	120	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
108	4	121	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
109	38	122	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
110	38	124	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
111	9	126	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
112	9	127	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
113	55	128	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
114	55	129	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
115	51	130	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
116	51	131	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
117	6	134	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
118	6	135	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
119	33	136	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
120	33	137	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
121	47	138	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
122	47	139	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
123	29	140	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
124	29	141	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
125	50	142	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
126	50	143	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
127	48	144	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
128	48	145	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
129	54	146	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
130	54	147	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
131	14	148	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
132	14	149	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
133	40	150	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
134	40	151	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
135	5	152	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
136	5	153	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
137	49	154	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
138	49	155	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
139	34	156	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
140	34	157	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
141	7	158	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
142	7	159	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
143	71	162	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
144	71	163	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
145	60	164	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
146	60	165	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
147	11	166	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
148	11	167	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
149	10	168	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
150	10	168	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
151	28	169	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
152	28	170	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
153	25	171	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
154	25	172	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
155	13	173	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
156	13	174	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
157	12	175	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
158	12	176	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
159	35	178	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
160	35	179	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
161	73	180	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
162	73	181	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
163	16	184	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
164	16	185	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
165	37	188	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
166	37	189	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
167	27	186	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
168	27	187	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
169	32	190	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
170	32	191	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
171	8	192	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
172	8	193	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
173	31	194	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
174	31	195	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
175	39	196	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
176	39	197	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
177	67	198	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
178	67	199	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
179	30	202	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
180	30	203	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
181	24	204	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
182	24	205	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
183	58	206	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
184	58	207	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
185	46	208	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
186	46	209	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
187	26	210	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
188	26	211	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
189	70	212	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
190	70	213	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
191	36	214	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
192	36	215	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
193	68	216	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
194	68	217	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
195	23	218	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
196	23	219	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
197	52	220	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
198	52	221	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
199	56	222	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
200	56	223	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
201	72	224	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
202	72	225	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
203	15	226	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
204	15	227	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
205	69	132	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
206	69	133	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
207	57	160	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
208	57	161	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
209	61	182	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
210	61	183	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
211	62	200	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
212	62	201	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
213	66	123	MANNEQUIN	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
214	66	125	PREVIEW	2023-06-08 20:55:42.506	2023-06-08 20:55:42.506	\N	FEMALE
\.


--
-- Data for Name: ResourceOrigin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ResourceOrigin" (id, materials, created_at, updated_at, deleted_at) FROM stdin;
1	their_materials	2023-08-12 13:59:14.943	2023-08-12 13:59:14.943	\N
2	fabrik_materials	2023-08-12 13:59:14.996	2023-08-12 13:59:14.996	\N
3	help_materials	2023-08-12 13:59:15.004	2023-08-12 13:59:15.004	\N
\.


--
-- Data for Name: Room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Room" (id, order_id, user_id, fabrik_id, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: Size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Size" (id, json, created_at, updated_at, deleted_at) FROM stdin;
3	{"bust": "98-101", "hips": "107-110", "waist": "81-84", "russian": "50", "international": "XL"}	2023-04-26 08:00:22	2023-04-26 07:58:36	\N
4	{"bust": "94-97", "hips": "103-106", "waist": "78-80", "russian": "48", "international": "L"}	2023-04-26 03:10:37.526	2023-04-26 07:58:38	\N
5	{"bust": "90-93", "hips": "99-102", "waist": "74-77", "russian": "46", "international": "M"}	2023-04-26 03:10:37.526	2023-04-26 07:58:39	\N
6	{"bust": "86-89", "hips": "95-97", "waist": "70-73", "russian": "44", "international": "S"}	2023-04-26 03:10:37.526	2023-04-26 07:58:40	\N
7	{"bust": "82-85", "hips": "93-95", "waist": "66-69", "russian": "42", "international": "XS"}	2023-04-26 03:10:37.526	2023-04-26 07:58:40	\N
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, name, email, password, created_at, updated_at, deleted_at, document_id, array_of_delivery_ids, is_confirmed, "phoneNumber") FROM stdin;
2	\N	test1@test.ru	$2b$04$uIFSlQP0za5gdDm.xhcDv.rU9MOff9KsyaygF/6Z6YA559Gssob8a	2023-06-02 10:03:44.537	2023-06-02 10:03:44.537	\N	\N	{}	f	\N
3	\N	test3@test.ru	$2b$04$P9vGsdNKbBT58MleFmzoruzkXfQbK9j75GPrUgC9Js5egfouS..ty	2023-06-02 10:07:26.367	2023-06-02 10:07:26.367	\N	\N	{}	f	\N
4	\N	test4@test.ru	$2b$04$kpCl6LDubOUOMLPLFPVKAeKdViv.I7C5IZQv.fWNAZvX3RVHWWubS	2023-06-02 10:37:18.725	2023-06-02 10:37:18.725	\N	\N	{}	f	\N
5	\N	test333@test.ru	$2b$04$.zQ7xXexmBAShKmVWuuQuORTnIwqAotjUtiDtVd49U/SrqFyHjeVy	2023-06-02 10:42:44.014	2023-06-02 10:42:44.014	\N	\N	{}	f	\N
34	\N	ravahid655@weishu8.com	$2b$04$av178gprjySsnVjZY7VzReYY3ren0LSWwA4iJgY4rrqYjuKte37Cm	2023-08-16 10:25:51.59	2023-08-16 10:26:28.738	\N	\N	{}	t	\N
35	\N	voa@vt2b.ru	$2b$04$RRM1pN7rAQAtkLCl.jZIY.Ssx9P7li3VIFGfJfp.iFa/L6kQ1LGXa	2023-08-17 09:43:25.344	2023-08-17 09:43:25.344	\N	\N	{}	f	\N
36	\N	art.leon@mail.ru	$2b$04$ZDeE.FOdYkLNjSuYhfitPu.uuS3Ho4AyZQjW9rxCZ0LYeTfWSSJNi	2023-08-17 18:17:42.917	2023-08-17 18:17:42.917	\N	\N	{}	f	\N
37	\N	art.leon1488@mail.ru	$2b$04$mDiyxDWJ2IeMiV2B3riVCeoy3hhRER6JmNkJ7Fwe/EIFn6cLbNWsa	2023-08-17 18:18:00.707	2023-08-17 18:18:00.707	\N	\N	{}	f	\N
38	\N	Sjdbdbkdijx@ishsbs.rjn	$2b$04$yAnJOwocaSJBwDkHCJcQBeM3JSq2xyZgG4CHbrElHD0XPdF6AFVHe	2023-08-17 18:18:15.833	2023-08-17 18:18:15.833	\N	\N	{}	f	\N
39	\N	Fhsbsjd@jdbd.rjn	$2b$04$HZp5DSJU13qGZupOmCh93eAXOnJnwqX4VuyQpCkKg67de.QAANczO	2023-08-17 18:19:01.807	2023-08-17 18:19:01.807	\N	\N	{}	f	\N
14	\N	test@mail.ru	$2b$04$jtLm9340s1bDzsjcbZr6m.ZRDObdrPtGDNfN0Jla.cqMPTz8yYF3S	2023-08-01 12:47:28.812	2023-08-01 12:47:28.812	\N	\N	{}	f	\N
15	\N	test2@mail.ru	$2b$04$0lQZfDFtl47HyTMPGXqlhuMK0ya/rbomV1tgSIBusLUdpsRAmoScO	2023-08-01 12:49:09.864	2023-08-01 12:49:09.864	\N	\N	{}	f	\N
16	\N	testdsadas@mail.ru	$2b$04$WsT3y7GLqhAntFZ1iz12fulnAdMywzd/QEt0H/KYTCRHiUGOArgcq	2023-08-01 12:49:28.299	2023-08-01 12:49:28.299	\N	\N	{}	f	\N
17	\N	test2@test2.ru	$2b$04$N/aDD4LmEgE4gPau5K9NcO1Jy1nlbhmDvltmHDLLF0A/v0hX9t7IW	2023-08-01 12:49:44.22	2023-08-01 12:49:44.22	\N	\N	{}	f	\N
18	\N	lenchenkoff.danil@yandex.ru	$2b$04$1ELdcNmalPGzDukRvfzUd.xM9EM1T2IVaahd6xa2XSGAWwkf7xAYe	2023-08-01 12:49:52.229	2023-08-01 12:49:52.229	\N	\N	{}	f	\N
19	\N	verel79726@mliok.com	$2b$04$RMV18Vzkc5ZqlxoETmUXqOAv/BVzW/JMrDaVFRfZstD99DgwYotAm	2023-08-02 06:02:17.263	2023-08-02 06:02:17.263	\N	\N	{}	f	\N
20	\N	jadissss@gmail.com	$2b$04$4grOq8oeKMJTtzIViMP13.8VYbPXtj6R0ISxgv2zYXqpw6S8346Ja	2023-08-08 10:39:32.766	2023-08-08 10:39:32.766	\N	\N	{}	f	\N
21	\N	thekingorder@gmail.com	$2b$04$5.ajqiEOy73B0uodbMiukOPyPMFBr8BywqjWxXIFa3Jcyx0PclUTe	2023-08-08 12:09:22.569	2023-08-08 12:09:22.569	\N	\N	{}	f	\N
24	\N	denisvalter309@gmai.com	$2b$04$RxsUjIKcI39g4D7SPLPlZOFeABx3LiCLd4o2cUAbakhNy6rgLwZyO	2023-08-15 10:31:59.522	2023-08-15 10:31:59.522	\N	\N	{}	f	\N
25	\N	denisvalter309@gmail.com	$2b$04$ogKVznnGwxyWQ6eNYev3eergQeNLpHg/J1NwmH6gcojBXHVoH3olC	2023-08-15 10:34:23.835	2023-08-15 10:34:23.835	\N	\N	{}	f	\N
26	\N	valterden04@gmail.com	$2b$04$Gwxh8cayb2lX9pyaZoC8mu2VsAtqsImp13JDP1X5b2HNHmtov/toC	2023-08-15 17:06:39.131	2023-08-15 17:06:39.131	\N	\N	{}	f	\N
27	\N	valterden00@gmail.com	$2b$04$nKibK.mSF9NT0qjHa4zBiuAdzL/1XsqdklWn0vBqj7NBem29Cd.JC	2023-08-15 17:08:30.878	2023-08-15 17:08:30.878	\N	\N	{}	f	\N
28	\N	vipate9924@weishu8.com	$2b$04$3BrR.i2/4HRxqXmlwA./S.UNohAAovwUPd8YADcqEoWykYrRZpnbW	2023-08-16 06:51:52.067	2023-08-16 06:51:52.067	\N	\N	{}	f	\N
29	\N	xayakiv315@vreaa.com	$2b$04$2NV2vHNYCZWMtVCU0w0q1uTmkyqVaKGNaA2OB6Xe2iNncen2FcwF2	2023-08-16 07:23:17.289	2023-08-16 07:23:17.289	\N	\N	{}	f	\N
30	\N	jahan78768@viperace.com	$2b$04$ATCH.LiDcdZVGhlWg1.jZenXmq19/codyMqvlvxWt.obqaeo/OlIS	2023-08-16 07:24:55.34	2023-08-16 07:24:55.34	\N	\N	{}	f	\N
31	\N	kavomag635@vreaa.com	$2b$04$wL20oCRWmu.pehTmgF2KCeTbCz/27Awib.OGblJsft2BQvom7j/Ha	2023-08-16 07:31:06.676	2023-08-16 07:31:06.676	\N	\N	{}	f	\N
23	Попов Николай	nikolaypopov03@mail.ru	$2b$04$MnrvOTpQmLZFgPgeb/yf2uFLuew6ML68efG0alh2T/ZVsN9CpH.Qu	2023-08-15 06:25:27.397	2023-08-16 07:36:29.995	\N	\N	{}	f	\N
32	\N	giwona1812@vreaa.com	$2b$04$JVK8bs8jqleeLDB/zSBTPOGMvsOR8e7Czc0jVYqV4yt5QPufu8K7K	2023-08-16 09:28:52.915	2023-08-16 09:36:36.56	\N	\N	{}	t	\N
33	\N	naxepe6206@vreaa.com	$2b$04$7wAZCN2U1ALWySNip4DTP.UA42thrqZRHOix.KX/tmz3PfvZX3P2W	2023-08-16 09:48:58.184	2023-08-16 09:48:58.184	\N	\N	{}	f	\N
1	Тестастерон	test@test.ru	$2b$04$z/xxbpdyg6.iIklxYioFJeLX4s0bgJcbPlR5x.6C3LIyxfSIDuitG	2023-05-18 11:25:50	2023-08-22 09:53:25.918	\N	\N	{}	f	\N
40	Петр Петров	wadaxer386@avidapro.com	$2b$04$UCNVhZew6SyXZJtXDx216ecpivQQPtkrQjRoCGE3W2y4y15VXN53O	2023-08-23 05:56:54.15	2023-08-23 06:13:51.193	\N	\N	{}	f	+78005671231
\.


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserRole" (user_id, created_at, updated_at, deleted_at, id, role_name) FROM stdin;
2	2023-06-02 10:03:44.614	2023-06-02 10:03:44.614	\N	1	USER
3	2023-06-02 10:07:26.378	2023-06-02 10:07:26.378	\N	2	USER
4	2023-06-02 10:37:18.739	2023-06-02 10:37:18.739	\N	3	USER
5	2023-06-02 10:42:44.024	2023-06-02 10:42:44.024	\N	4	USER
14	2023-08-01 12:47:28.826	2023-08-01 12:47:28.826	\N	13	USER
15	2023-08-01 12:49:09.873	2023-08-01 12:49:09.873	\N	14	USER
16	2023-08-01 12:49:28.308	2023-08-01 12:49:28.308	\N	15	USER
17	2023-08-01 12:49:44.226	2023-08-01 12:49:44.226	\N	16	USER
18	2023-08-01 12:49:52.24	2023-08-01 12:49:52.24	\N	17	USER
19	2023-08-02 06:02:17.283	2023-08-02 06:02:17.283	\N	18	USER
20	2023-08-08 10:39:32.78	2023-08-08 10:39:32.78	\N	19	USER
21	2023-08-08 12:09:22.587	2023-08-08 12:09:22.587	\N	20	USER
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
3fafe110-63ad-42cc-b894-fd5a0bb0a3c1	82282d8077efb17a43d293358319fc67c3a7943fc5e944678db0fcee2ca5caa5	2023-04-26 06:12:14.701661+00	20230217063629_fix_user_entity	\N	\N	2023-04-26 06:12:14.68673+00	1
56013fa1-de56-42df-8cd6-0adc111a453e	0b9eda079708903e4c448f28a31bd526a322ef8ae32f117fe6072561ed3c1ebf	2023-04-26 06:12:14.406301+00	20230113130247_init	\N	\N	2023-04-26 06:12:14.298079+00	1
3dfc8c52-7d53-4b28-b9b3-720393feeb33	a0cbb6cd52ba3c3ae525422879412c21f5536cb148322899df457c4e45a8b6b5	2023-04-26 06:12:14.428604+00	20230117093721_fix_cart	\N	\N	2023-04-26 06:12:14.408095+00	1
5cae7bcb-7260-4103-a8da-f715b7279718	be88bad305e0cc845c902366b5b19dd0080e0ce78564232c99a8cf1afc031c8f	2023-04-26 06:12:14.439543+00	20230119105202_modify_cartproduct	\N	\N	2023-04-26 06:12:14.430262+00	1
631a4c3c-2bed-42b2-a31e-20381c0ed125	c1629569250ed633ad4ba51a997e35dac2ea7970ecbe553715ccc7383ed09f68	2023-04-26 06:12:14.71184+00	20230222055845_remove_series	\N	\N	2023-04-26 06:12:14.703451+00	1
73b3bb4f-f6e1-4923-af59-1762720e0211	74ccee6c0e9a0025b8c6a2fe0c64658e171eda46b7fdc02b870f19f3c2913c38	2023-04-26 06:12:14.448737+00	20230119214130_modify_cartproduct_suplier_id	\N	\N	2023-04-26 06:12:14.441001+00	1
d28884ad-1f16-4b65-b150-b91281627d18	27f683f13b53ee9059680717849d84fca4ef7d476c453fd463faa2500cdf8c14	2023-04-26 06:12:14.462917+00	20230123105948_add_category	\N	\N	2023-04-26 06:12:14.450334+00	1
6fe834ad-007c-4b7d-8a5f-b0e848da482b	2431c535a7c3b74964b659008dfd1f000b7f58fbb1c0fe73dae207d366251ffd	2023-04-26 06:12:14.897486+00	20230426034218_fix_document_cart	\N	\N	2023-04-26 06:12:14.892808+00	1
26db297c-ab49-4a9c-abda-9dbf09ed4855	def33a515f6623c1729386044e078882aba4bb1b2865e19ded11d192ff5c504c	2023-04-26 06:12:14.568663+00	20230125130116_char	\N	\N	2023-04-26 06:12:14.464451+00	1
74a8e07d-bbdb-4b72-b04a-7873f49d25b8	1cf933ff2bef535ad0c50919a1bc5dcd415ce199cc999003ffbe64f283be2225	2023-04-26 06:12:14.74404+00	20230222070251_fix_namings	\N	\N	2023-04-26 06:12:14.71328+00	1
f016382d-a0fd-413b-b3ef-86199783f078	7cee877b8fe7bd8ed82f0765d53672107240e37c1a18375578d5c8428b180327	2023-04-26 06:12:14.574872+00	20230130094856_fix_supplier_product_price	\N	\N	2023-04-26 06:12:14.570211+00	1
89151344-b8b3-4b5b-af79-d1deaf179733	19b73fd10c21d29276f49802b1474328a9393941efab1d362da6b928d2e251fa	2023-04-26 06:12:14.602291+00	20230205230554_add_roles_and_profiles	\N	\N	2023-04-26 06:12:14.576222+00	1
b3e0779a-18de-4bc1-a0bf-654903730523	aa77e8d6d47c6a46485258ef0df27d7b7aefa2ad3f232307196ec71f9fa8cf76	2023-04-26 06:12:14.624108+00	20230209092045_watchlist	\N	\N	2023-04-26 06:12:14.603994+00	1
aa76446f-bea3-418a-8a7f-32eb5408a568	b602d3755ec1a64ed9a80a42504e7bf34cf00a907d2b946549eaac0131d3975c	2023-04-26 06:12:14.764738+00	20230407100912_add_address	\N	\N	2023-04-26 06:12:14.745798+00	1
0c9e5c28-ac03-4cf9-a40f-af5c333e1228	7ed042dd61f1923fb2039b1d74977982d8eaf6d5f2620a77cfd544e29d4e3bad	2023-04-26 06:12:14.64112+00	20230209134434_series	\N	\N	2023-04-26 06:12:14.625518+00	1
4cea6d22-2e4b-4d1f-b0ff-5530aa846cb6	5777a00fe8c783c1cba927860eb085a77f342393d99b2a375759d3114b731750	2023-04-26 06:12:14.658173+00	20230210062651_delete_roles_table	\N	\N	2023-04-26 06:12:14.642871+00	1
45870aec-895d-4b22-9ebe-9766e72bdaee	5107bff9d0719a6482d9a3722fdb1804fbefd6daaf55587a43af81a831e7c835	2023-04-26 06:12:14.671563+00	20230216064953_fix_documents	\N	\N	2023-04-26 06:12:14.65972+00	1
61099df8-41b1-4147-9724-e580cbdff3ee	154cff011310f32fc4982f077b542750a1658ae2525d9077e978c88d79cf068a	2023-04-26 06:12:14.783777+00	20230413102238_add_delivery_and_currency_to_user_and_supplier	\N	\N	2023-04-26 06:12:14.766445+00	1
18b8d722-dafb-4d00-96ac-8d774995e0f4	4f2d3ca0e5bae31d92f4e845a9b6971f2a55a2e0df7a660135208f8a1255292a	2023-04-26 06:12:14.68522+00	20230216093216_add_model_product	\N	\N	2023-04-26 06:12:14.673065+00	1
26f33c1f-7a2f-4622-8ed3-af949d5331ff	b3001bb5801aa6fac9cea3690ec26e6568b3c3549042ca0177da902c97b56bea	2023-04-26 06:12:14.906711+00	20230426035213_fix_cart	\N	\N	2023-04-26 06:12:14.899105+00	1
7c65f601-3c03-4f94-a7a0-4625ee07159a	e5129be1a642dbc6948b4948c4bcfaf45430231aa7edd184a72e50077ac1d67e	2023-04-26 06:12:14.847585+00	20230425060915_add_fabrika_entities	\N	\N	2023-04-26 06:12:14.785529+00	1
51335667-493d-4616-9ed5-66de10a0b689	9f17870cd713386c7179cba949d93f9becbccee3d3a1868f42e1cfe56fb34548	2023-04-26 06:12:14.869225+00	20230426021353_fix_sizes	\N	\N	2023-04-26 06:12:14.849029+00	1
2d0296d1-fec5-479e-9092-2c139565bdbf	a6198db3334c645186e379bf9aae40963a3ad5ab2ab6572f1c5f3b83f5aab70b	2023-04-26 14:20:20.961729+00	20230426141044_remove_uniq_email	\N	\N	2023-04-26 14:20:20.95095+00	1
050f6f81-18fa-45a3-a8b6-4bcaa158c6b8	2282d8b4116cfd47075a94f9ab66c01576c5d8d322312f8a9949fddd50de09d6	2023-04-26 06:12:14.884766+00	20230426032642_add_mannequin_enum	\N	\N	2023-04-26 06:12:14.870712+00	1
900a31cb-2de8-4c5a-b910-1852dbdb58a7	39c3730dc803acd1eb399a5fb63e201f90b9560bed39a2e6c00d6a03677eb1f7	2023-04-26 02:13:52.502836+00	20230217063629_fix_user_entity	\N	\N	2023-04-26 02:13:52.493577+00	1
2456686e-8123-446d-ba76-3c3c2fd04804	473d8adb1c80aa89bfcc0da141e01a325bea6831aae2ddfa2509b69b87643f0e	2023-04-26 06:12:14.891494+00	20230426034137_add_document_cart	\N	\N	2023-04-26 06:12:14.886403+00	1
43680318-3c9d-4384-b0c9-f5691b058d57	79a1cd82be58b9c278647e8f714d3515df7f65ff82ef9654d95149e1940a6526	2023-04-26 02:13:52.35243+00	20230113130247_init	\N	\N	2023-04-26 02:13:52.295236+00	1
dd809f9c-d868-4854-b2af-d3bbe8d38b0b	12f4fc95450a62d8561acae8c11cb43d810c4de51887d5f1f1789652380e54c9	2023-04-26 02:13:52.359722+00	20230117093721_fix_cart	\N	\N	2023-04-26 02:13:52.352918+00	1
1f9c07bd-fb41-45d0-abc4-ee986c9d12dd	52e15a2ece84f0d317e24acdbd9e688277336924f2b5545161b1037520456beb	2023-04-26 02:13:52.363751+00	20230119105202_modify_cartproduct	\N	\N	2023-04-26 02:13:52.36016+00	1
eb5733a1-39b3-4e9c-b270-8f2a0f2bc606	1490881ed4e897d126997aa5f1b17409dfd0875930996c382799f16450ba0d68	2023-04-26 02:13:52.508227+00	20230222055845_remove_series	\N	\N	2023-04-26 02:13:52.503296+00	1
132aec3e-3b74-433c-a94c-ac1992f68f8a	e240f65a908ce585a1510d5497faad1bccad41333561dec61395a44f00cab956	2023-04-26 02:13:52.366562+00	20230119214130_modify_cartproduct_suplier_id	\N	\N	2023-04-26 02:13:52.364189+00	1
8e19bcba-7502-42a4-af34-a12f943ed341	8d37e2f9c3b69ebef53ab71b91ec39d562cbda9f0c057151b2b4cd3b7d6431d4	2023-04-26 02:13:52.372557+00	20230123105948_add_category	\N	\N	2023-04-26 02:13:52.367006+00	1
243bd734-8d42-472f-bafd-aeabc6e83b98	337b465f8fead112b9e1c6b33a66e0986d8c784ca1f371b1c7e600f10494b73d	2023-04-26 02:13:52.432639+00	20230125130116_char	\N	\N	2023-04-26 02:13:52.373028+00	1
ad1808da-99c5-4d1d-a167-8a899911c868	f2e0c03c964a2e7b65897ce622c7ed241cef9a4d239d86670f85489b9a7d39aa	2023-04-26 02:13:52.519218+00	20230222070251_fix_namings	\N	\N	2023-04-26 02:13:52.508673+00	1
bf1482bf-5e8b-4b56-842d-53ba8831eedf	d311ab7d1d86f3f8367d523569bce90222c3f21e533093b0292f3d3799ea084c	2023-04-26 02:13:52.434591+00	20230130094856_fix_supplier_product_price	\N	\N	2023-04-26 02:13:52.433115+00	1
aafdd4f8-3a28-4d12-be81-28289b2f22ca	5372953d25288c8b511e5e13e7d9186655c06d6da66bbc872804fe45ff025b31	2023-04-26 02:13:52.45284+00	20230205230554_add_roles_and_profiles	\N	\N	2023-04-26 02:13:52.435052+00	1
082f6a90-b653-451b-a7e6-b7c11e80a52e	2431c535a7c3b74964b659008dfd1f000b7f58fbb1c0fe73dae207d366251ffd	2023-04-26 03:42:18.904124+00	20230426034218_fix_document_cart	\N	\N	2023-04-26 03:42:18.902186+00	1
0530cfff-a002-4367-95ca-a88031826f7d	a5c173ecb68b3bf6b052722cb1036fd9d28c00d970fdbaa36eec60a022d9282c	2023-04-26 02:13:52.463364+00	20230209092045_watchlist	\N	\N	2023-04-26 02:13:52.453319+00	1
9130a10a-e916-4f26-b4df-c19c60a98272	080282b7aa0de341a5ca2c418c75167c3d613c9b4a624900edef663793001c1c	2023-04-26 02:13:52.527023+00	20230407100912_add_address	\N	\N	2023-04-26 02:13:52.51968+00	1
05213981-e87f-4f2a-9b6b-71d24d28c276	bf3a1b2345947156a2fd62bba5b498c26457a81cae9571726343300284b7106f	2023-04-26 02:13:52.471976+00	20230209134434_series	\N	\N	2023-04-26 02:13:52.463863+00	1
352980e3-1def-465f-a707-2efeb8d371fd	259c4f9e20699309789e26ca752b529de5bbdd4a8d1619e91f4d25e35a137bd0	2023-04-26 02:13:52.480973+00	20230210062651_delete_roles_table	\N	\N	2023-04-26 02:13:52.472426+00	1
9fdb2f15-4177-4cf9-9d4a-cdcc92e61615	dfc34882c486f6c3baafd8b3ed0fafaf369ee86204f40c4a30737f1bc391743c	2023-04-26 02:13:52.488575+00	20230216064953_fix_documents	\N	\N	2023-04-26 02:13:52.48257+00	1
afac3050-0f38-43a6-8414-0cad3a93434c	8f4d0a3b3ca69523874e4c06842aea9843f6b17da12d74a7712128d82d897a47	2023-04-26 02:13:52.53535+00	20230413102238_add_delivery_and_currency_to_user_and_supplier	\N	\N	2023-04-26 02:13:52.527483+00	1
c3f76cc6-5ead-42cd-9a27-fff23039fd53	16e3beda33333d5d352a81987f62c2e16fe3ed670a1d04b035beb5bdc44fce0d	2023-04-26 02:13:52.493124+00	20230216093216_add_model_product	\N	\N	2023-04-26 02:13:52.489025+00	1
1a51d90f-5b1f-4f72-aafc-db6e594690ef	b3001bb5801aa6fac9cea3690ec26e6568b3c3549042ca0177da902c97b56bea	2023-04-26 03:52:13.392996+00	20230426035213_fix_cart	\N	\N	2023-04-26 03:52:13.386335+00	1
6fd01845-cb9c-42ed-bf7b-6c1845aa0ea8	cd2dbb6ddacd651cd6db78b9d027851cffcbd01d89c572ca15f66134cfd5b8e0	2023-04-26 02:13:52.570578+00	20230425060915_add_fabrika_entities	\N	\N	2023-04-26 02:13:52.535857+00	1
2a2ad84a-3c59-4873-b794-2527db763679	9f17870cd713386c7179cba949d93f9becbccee3d3a1868f42e1cfe56fb34548	2023-04-26 02:13:54.020629+00	20230426021353_fix_sizes	\N	\N	2023-04-26 02:13:54.006214+00	1
fb63b448-7367-49a1-b90e-00390c4ef6cf	2282d8b4116cfd47075a94f9ab66c01576c5d8d322312f8a9949fddd50de09d6	2023-04-26 03:26:42.257324+00	20230426032642_add_mannequin_enum	\N	\N	2023-04-26 03:26:42.245483+00	1
6086afa0-4cf4-4da8-97eb-f237de0c09a4	473d8adb1c80aa89bfcc0da141e01a325bea6831aae2ddfa2509b69b87643f0e	2023-04-26 03:41:37.602864+00	20230426034137_add_document_cart	\N	\N	2023-04-26 03:41:37.600526+00	1
03979d22-0cab-4d73-bf09-2302fda0c243	a6198db3334c645186e379bf9aae40963a3ad5ab2ab6572f1c5f3b83f5aab70b	2023-04-28 11:23:49.374663+00	20230426141044_remove_uniq_email	\N	\N	2023-04-28 11:23:49.245654+00	1
00d27d0e-dff7-4367-aa18-ecc4c8a7b4a2	f57394045e6907c8bb3a0bcc709e1a8d66d01a372a164a6ca62ff745a9b3d458	2023-04-28 11:23:49.970213+00	20230428105227_add_category_document	\N	\N	2023-04-28 11:23:49.376365+00	1
60dd6ed2-c582-4e66-8a19-66895117f7b6	cca71b90cc0b7b4f920e8d2fd74e0510fac00424e562be7ea9922b9fd307f4f9	2023-05-10 07:17:37.830129+00	20230509205255_add_document_relations	\N	\N	2023-05-10 07:17:37.792529+00	1
9e624d69-b420-4ebd-b32a-78fb0b0305a0	da4b1f91007b25011af378340f3a5e15c8845209d8b1173d9d4085389c833ed4	2023-05-31 20:49:55.983347+00	20230523102140_remove_and_rename_entities	\N	\N	2023-05-31 20:49:55.905792+00	1
d6368a48-5e00-4cd1-ad90-390844952b2d	f95c97c2633eac2b2404d23f6990cf13a027c5f6d6d4aae4b446c90d0342e21f	2023-05-31 20:49:55.996707+00	20230523102541_rename_category	\N	\N	2023-05-31 20:49:55.98484+00	1
5778ab5a-d1fc-42d5-b020-baa1931ee015	c5611b5f44339c739c7bfe6e8d025bc2492f7648a390fba7aa8adab4c833042d	2023-05-31 20:49:56.006713+00	20230523220713_add_telegram_id	\N	\N	2023-05-31 20:49:55.99849+00	1
0342716b-4c03-433c-b311-bf5c960d583d	e068c1e8e343c06674c9b59beab0b59b0cd548af2f8f5a33fbbb2b07331934fd	2023-05-31 20:49:56.014544+00	20230524222014_modify_user	\N	\N	2023-05-31 20:49:56.008393+00	1
5dd6ade1-86e1-465e-87c9-5f9730b6237a	84ee1deeda47f8d542b9562c6ad399dc9103410bf256489e7fbbeefb777647dc	2023-06-05 07:13:44.448545+00	20230605065348_delete_tg_id	\N	\N	2023-06-05 07:13:44.424277+00	1
3b1908d8-15dd-450e-86de-52446d81da3e	8c9f553e42dca6191daed2c078d08d69fb33f4ebc41992929b354f5e5a20f8e6	2023-06-08 21:19:11.776526+00	20230608103106_add_mannequin_sex	\N	\N	2023-06-08 21:19:11.760745+00	1
d6fbaa79-2566-448f-89fe-e6c394a9ade3	483264da34079c84611cc84409b68b5645ecde3717023b04585b73eb8e55d0e7	2023-07-11 05:16:21.272371+00	20230707125317_rename_order_status_enum	\N	\N	2023-07-11 05:16:21.228996+00	1
e4134f24-fd9c-4820-8d20-1dcfeda970f4	184e4889c744d05b7bec3a3f9390de34888d7771d074f9f8fb8e2242d7c1b8e8	2023-08-07 07:31:34.342348+00	20230803174427_add_order_additional_service	\N	\N	2023-08-07 07:31:34.316744+00	1
263d62c3-2a6c-4340-b94d-1588055fa8e6	0d1a9f097d58aa1b150930c18e1d564503fbbf6bd77471e5a2350ad7ebd9ee7f	2023-07-11 05:16:21.314466+00	20230710060509_add_room	\N	\N	2023-07-11 05:16:21.274509+00	1
3dc0dcf2-7995-4bfe-a657-bc8dd417e5a9	8d13575d4fa3e8ead6e2342b406caa023b3b052eb74354458f1e0681024401d3	2023-06-21 12:58:15.974171+00	20230621120147_modify_order	\N	\N	2023-06-21 12:58:15.923+00	1
39bf3e87-0376-401d-b526-7deed3e6cc72	0c80ffc97256b0bda2b96d3ade3e15a22e4f3e4da82696c99d123e231566410c	2023-06-26 23:02:52.140156+00	20230626045241_create_fabrik_and_change_order_name	\N	\N	2023-06-26 23:02:52.048861+00	1
2102e81f-e3cf-40cb-9006-d32a78a8aeb4	0ffb7ecef01f3ef60b7e62d8d8385abc0e3b7b31d532bdc30e6bed563005c9b6	2023-08-02 05:17:29.277784+00	20230723225229_add_quantity_to_order	\N	\N	2023-08-02 05:17:29.263521+00	1
c4ef81cf-e043-4a01-9431-98940acf89ad	408f38fad24530a065e0da652188525a3c92dda77f77311869d129375e352861	2023-07-05 04:48:12.202071+00	20230704225046_add_stage_to_order	\N	\N	2023-07-05 04:48:12.188307+00	1
2b9908a3-eb2f-44ea-aec5-cc9c878d9d9c	5e7232e07aea450ea9fa6927d93fd909470c7fa3f042e375217d87f8c687d964	2023-07-11 05:52:18.078969+00	20230711052501_add_document_size	\N	\N	2023-07-11 05:52:18.068027+00	1
d16fa2f4-7baf-4a93-bb1a-fa8fb121d586	4fabe2bab3bf6ccb7f29cda30465f2b91a9da3c1564cbbc5ae5a174a19d4cb91	2023-07-13 12:17:54.233151+00	20230713092935_add_order_per_service	\N	\N	2023-07-13 12:17:54.201263+00	1
a0a19f4a-e4a6-49b7-a1a2-07fb896aa74a	c30e86fade4e3b0d9c61c584dfe2be83d45d5bf06bfadadbb2ec4c9ca082463a	2023-08-02 05:17:29.291172+00	20230725010214_remove_file_type	\N	\N	2023-08-02 05:17:29.279608+00	1
1be37659-29ea-4a9a-9908-4cc139116e94	2f18aeae6c9a61dc3848051a307a53cf8e8568b0f2653086aca988a9010c07b4	2023-07-17 05:48:29.018626+00	20230714220746_order_per_service_int	\N	\N	2023-07-17 05:48:29.00569+00	1
d32f9930-7726-4f5d-a9db-04d856e030d2	7cded6f406bb1e45e364a1b429ddd77743da584be6e6e863fa2a3820c9d202b9	2023-07-24 12:41:26.07048+00	20230720101614_add_document_id_to_fabrik	\N	\N	2023-07-24 12:41:26.048369+00	1
82422fca-a0a4-4bf1-8b14-ba8f971dc41c	cdc7c48a8519d56e52962df85722db8bc5415fce4da8a8c0a92ac69cf0753fc7	2023-08-21 14:11:05.349513+00	20230821110013_fix_order_stage_enum	\N	\N	2023-08-21 14:11:05.336971+00	1
3fb0d6e8-0f46-4bc9-9493-63fdeb9735d0	51aea2dba4a81e1c598283ae350f8f4e811775327c3b3fb3a79cd24beb602050	2023-07-24 12:41:26.098617+00	20230720101955_add_fabrik_product_document	\N	\N	2023-07-24 12:41:26.07259+00	1
0928c6ca-a4d8-46b6-8317-a2065dc0ade1	bbcc4c97f5d668cb9f8dd1755475a13496be13209ea701ce22247b12746b0403	2023-08-02 05:17:29.299261+00	20230727115014_add_prodaction_time	\N	\N	2023-08-02 05:17:29.292943+00	1
15f2eecc-b794-4df0-89cf-fe324c58dd23	af6ef56f8357807871b95a16414619a0a03dc9c1032674c103313f144133f732	2023-07-24 12:41:26.125741+00	20230720102331_add_additional_services	\N	\N	2023-07-24 12:41:26.100408+00	1
d6c2b6d7-e2dd-4127-839b-4cd7fd2863e3	b356e00e0a47d4b119b1c3869aaf658349c9e530c884558520e61d8e938075bc	2023-07-24 12:41:26.135808+00	20230720102659_modify_address	\N	\N	2023-07-24 12:41:26.127942+00	1
a764296a-2aef-4331-a330-4a37a6eba46b	b782fc038d7675f415dd11f53f6c9c49eba9c1623ba4461963e158b6e8ddf7e4	2023-08-07 07:31:34.35186+00	20230803194054_modify_resource_origin	\N	\N	2023-08-07 07:31:34.343886+00	1
fcf7fb18-bf20-438d-a69f-8c196586bd98	c60fcd2ddc360d108d3d5b79a44674b4f5a16e2e15e830b08e7c0282349facb2	2023-08-02 08:57:56.151088+00	20230802084223_add_resource_origin	\N	\N	2023-08-02 08:57:56.104789+00	1
be8f9590-4598-439c-befa-af5f63832aec	28d7b20faed6f7c35f921c4e73c72c9e4cd16f7f6912d1d389ed243a9c2deb83	2023-08-08 18:57:10.819965+00	20230808142326_unique_fpfd	\N	\N	2023-08-08 18:57:10.811473+00	1
d0f42277-cb5f-4d91-a915-f3fa4d3e0426	c35bfcddfe4e4f610e31d3d2410f0bb2144c43c31d8599eee0dbdde0b44dbb1d	2023-08-07 06:24:40.705426+00	20230804114439_add_fabrik_document	\N	\N	2023-08-07 06:24:40.661501+00	1
3060b23a-9453-4b2b-b7f1-3df6a267840c	122d743a0403e77ad7e0ed9447f5b8826f2fbdbc55612d936eff004dd13c2eec	2023-08-07 07:31:34.358559+00	20230803195231_modify_order_textile	\N	\N	2023-08-07 07:31:34.353093+00	1
8773f256-2431-49fb-a721-a193ef014245	b715b4ccd5b1865f0fa925df7d4b18a914c81b942e172c1c1a2206de70ece84d	2023-08-07 12:31:00.228756+00	20230807101728_fabrik_document_name_desc	\N	\N	2023-08-07 12:31:00.196766+00	1
53f007df-2300-4427-83fd-1a302acfc543	356b81b05ad559b34e8cce35098b936178bec35d43ca6d0a14b47069c737ad88	2023-08-09 12:56:05.614025+00	20230808100118_add_is_confirmed	\N	\N	2023-08-09 12:56:05.577303+00	1
9341dfbc-05a1-4f4e-9b80-32ef7c42ed88	cbe2f5f844d138ec1fecf3970a7d0f7d67d087ae0e95818712754888a8388b12	2023-08-08 08:46:11.281455+00	20230808071523_fabrikDocument_fix	\N	\N	2023-08-08 08:46:11.263062+00	1
98101ff6-fe74-4273-afb1-bfbef20bba96	4b63354bd8a7cfd0b8308f7bdee81ac672f1ba7a513cffad58f7b4c7743d68e6	2023-08-08 12:49:17.553134+00	20230808103727_fabrol_resource_origin	\N	\N	2023-08-08 12:49:17.521107+00	1
897bd4e2-45c2-4d03-ba64-fd04735ddcd2	a03663417ef319a33a6b8240c97eca7b17e13b1d3f481750c5cd1989592a0b3c	2023-08-08 18:57:10.809716+00	20230804105626_modify_fabrik	\N	\N	2023-08-08 18:57:10.788673+00	1
4a062fca-546b-4592-a7de-832307b54541	18598cadbd6d73cd01fb41f8bce6e7147156d034969d9894194806f9e6021792	2023-08-11 13:30:02.90989+00	20230811110511_add_order_stages	\N	\N	2023-08-11 13:30:02.895115+00	1
c8f6d442-c1df-4050-999b-f926313f262f	ff01b4719fd189eaaf19807305b61a0a643bab5d6d143a16d2f2d24d84b1ad0a	2023-08-22 10:24:17.487799+00	20230822061409_modify_user_phone_number	\N	\N	2023-08-22 10:24:17.469548+00	1
6b186c42-abfb-4189-93db-2997e47260f3	5a3106fe3e29a8eceead81ad1c7be82dd96163064f31ad8b77f0709963a385ef	2023-08-16 06:24:39.952694+00	20230815110020_modify_order_token	\N	\N	2023-08-16 06:24:39.937827+00	1
a132846c-6f5e-41fb-b97b-b683c44cc8b2	31d9485fcad5b42650d661dd1dfaca0fa892f6f00d990eb684f93cf947825688	2023-08-22 14:23:46.442013+00	20230822133033_fix_fabrik_non_nullable_fields	\N	\N	2023-08-22 14:23:46.421404+00	1
\.


--
-- Name: AdditionalServices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AdditionalServices_id_seq"', 13, true);


--
-- Name: Address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Address_id_seq"', 71, true);


--
-- Name: Delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Delivery_id_seq"', 1, false);


--
-- Name: Document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Document_id_seq"', 577, true);


--
-- Name: FabrikAdditionalServices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FabrikAdditionalServices_id_seq"', 79, true);


--
-- Name: FabrikDocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FabrikDocument_id_seq"', 103, true);


--
-- Name: FabrikProductFabrikDocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FabrikProductFabrikDocument_id_seq"', 38, true);


--
-- Name: FabrikProduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FabrikProduct_id_seq"', 555, true);


--
-- Name: FabrikResourceOrigin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FabrikResourceOrigin_id_seq"', 72, true);


--
-- Name: Fabrik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fabrik_id_seq"', 26, true);


--
-- Name: OrderAdditionalServices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderAdditionalServices_id_seq"', 1, false);


--
-- Name: OrderFabrik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderFabrik_id_seq"', 3, true);


--
-- Name: OrderPerService_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderPerService_id_seq"', 27, true);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_id_seq"', 110, true);


--
-- Name: ProductDocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductDocument_id_seq"', 104, true);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_id_seq"', 73, true);


--
-- Name: ResourceOrigin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ResourceOrigin_id_seq"', 1, false);


--
-- Name: Room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Room_id_seq"', 1, false);


--
-- Name: Size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Size_id_seq"', 7, true);


--
-- Name: UserRole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserRole_id_seq"', 20, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 40, true);


--
-- Name: AdditionalServices AdditionalServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AdditionalServices"
    ADD CONSTRAINT "AdditionalServices_pkey" PRIMARY KEY (id);


--
-- Name: Delivery Delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_pkey" PRIMARY KEY (id);


--
-- Name: Document Documents_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Document"
    ADD CONSTRAINT "Documents_pk" PRIMARY KEY (id);


--
-- Name: FabrikAdditionalServices FabrikAdditionalServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikAdditionalServices"
    ADD CONSTRAINT "FabrikAdditionalServices_pkey" PRIMARY KEY (id);


--
-- Name: FabrikDocument FabrikDocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikDocument"
    ADD CONSTRAINT "FabrikDocument_pkey" PRIMARY KEY (id);


--
-- Name: FabrikProductFabrikDocument FabrikProductFabrikDocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProductFabrikDocument"
    ADD CONSTRAINT "FabrikProductFabrikDocument_pkey" PRIMARY KEY (id);


--
-- Name: FabrikProduct FabrikProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProduct"
    ADD CONSTRAINT "FabrikProduct_pkey" PRIMARY KEY (id);


--
-- Name: FabrikResourceOrigin FabrikResourceOrigin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikResourceOrigin"
    ADD CONSTRAINT "FabrikResourceOrigin_pkey" PRIMARY KEY (id);


--
-- Name: Fabrik Fabriks_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fabrik"
    ADD CONSTRAINT "Fabriks_pk" PRIMARY KEY (id);


--
-- Name: OrderAdditionalServices OrderAdditionalServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderAdditionalServices"
    ADD CONSTRAINT "OrderAdditionalServices_pkey" PRIMARY KEY (id);


--
-- Name: OrderFabrik OrderFabrik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderFabrik"
    ADD CONSTRAINT "OrderFabrik_pkey" PRIMARY KEY (id);


--
-- Name: OrderPerService OrderPerService_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderPerService"
    ADD CONSTRAINT "OrderPerService_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: ProductDocument ProductDocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDocument"
    ADD CONSTRAINT "ProductDocument_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: ResourceOrigin ResourceOrigin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ResourceOrigin"
    ADD CONSTRAINT "ResourceOrigin_pkey" PRIMARY KEY (id);


--
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id);


--
-- Name: Size Size_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Size"
    ADD CONSTRAINT "Size_pkey" PRIMARY KEY (id);


--
-- Name: UserRole UserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- Name: User user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: Delivery_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Delivery_name_key" ON public."Delivery" USING btree (name);


--
-- Name: Documents_image_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Documents_image_id_key" ON public."Document" USING btree (id);


--
-- Name: FabrikAdditionalServices_fabrik_id_additional_services_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "FabrikAdditionalServices_fabrik_id_additional_services_id_key" ON public."FabrikAdditionalServices" USING btree (fabrik_id, additional_services_id);


--
-- Name: FabrikProductFabrikDocument_fabrik_product_id_fabrik_docume_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "FabrikProductFabrikDocument_fabrik_product_id_fabrik_docume_key" ON public."FabrikProductFabrikDocument" USING btree (fabrik_product_id, fabrik_document_id);


--
-- Name: FabrikProduct_fabrik_id_product_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "FabrikProduct_fabrik_id_product_id_key" ON public."FabrikProduct" USING btree (fabrik_id, product_id);


--
-- Name: FabrikResourceOrigin_fabrik_id_resource_origin_id_type_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "FabrikResourceOrigin_fabrik_id_resource_origin_id_type_key" ON public."FabrikResourceOrigin" USING btree (fabrik_id, resource_origin_id, type);


--
-- Name: Fabriks_fabrik_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Fabriks_fabrik_id_key" ON public."Fabrik" USING btree (id);


--
-- Name: OrderFabrik_order_id_fabrik_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "OrderFabrik_order_id_fabrik_id_key" ON public."OrderFabrik" USING btree (order_id, fabrik_id);


--
-- Name: OrderSize_order_id_size_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "OrderSize_order_id_size_id_key" ON public."OrderSize" USING btree (order_id, size_id);


--
-- Name: Order_user_id_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Order_user_id_id_key" ON public."Order" USING btree (user_id, id);


--
-- Name: ProductDocument_product_id_type_mannequin_sex_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ProductDocument_product_id_type_mannequin_sex_key" ON public."ProductDocument" USING btree (product_id, type, mannequin_sex);


--
-- Name: Room_order_id_fabrik_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Room_order_id_fabrik_id_key" ON public."Room" USING btree (order_id, fabrik_id);


--
-- Name: UserRole_user_id_role_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserRole_user_id_role_name_key" ON public."UserRole" USING btree (user_id, role_name);


--
-- Name: User_document_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_document_id_key" ON public."User" USING btree (document_id);


--
-- Name: address_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX address_id_uindex ON public."Address" USING btree (id);


--
-- Name: fabrik_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fabrik_email_uindex ON public."Fabrik" USING btree (email);


--
-- Name: user_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_email_uindex ON public."User" USING btree (email);


--
-- Name: user_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_id_uindex ON public."User" USING btree (id);


--
-- Name: Delivery Delivery_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES public."Delivery"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Order Order_additional_materials_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_additional_materials_origin_id_fkey" FOREIGN KEY (additional_materials_origin_id) REFERENCES public."ResourceOrigin"(id);


--
-- Name: Order Order_textile_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_textile_origin_id_fkey" FOREIGN KEY (textile_origin_id) REFERENCES public."ResourceOrigin"(id);


--
-- Name: Product Product_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: FabrikAdditionalServices additional_services_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikAdditionalServices"
    ADD CONSTRAINT additional_services_id FOREIGN KEY (additional_services_id) REFERENCES public."AdditionalServices"(id);


--
-- Name: OrderAdditionalServices additional_services_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderAdditionalServices"
    ADD CONSTRAINT additional_services_id FOREIGN KEY (additional_services_id) REFERENCES public."AdditionalServices"(id);


--
-- Name: Fabrik document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fabrik"
    ADD CONSTRAINT document_id FOREIGN KEY (document_id) REFERENCES public."Document"(id);


--
-- Name: FabrikDocument document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikDocument"
    ADD CONSTRAINT document_id FOREIGN KEY (document_id) REFERENCES public."Document"(id);


--
-- Name: FabrikProductFabrikDocument fabrik_document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProductFabrikDocument"
    ADD CONSTRAINT fabrik_document_id FOREIGN KEY (fabrik_document_id) REFERENCES public."FabrikDocument"(id);


--
-- Name: OrderFabrik fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderFabrik"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: FabrikProduct fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProduct"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: Address fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: Room fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: FabrikAdditionalServices fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikAdditionalServices"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: FabrikDocument fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikDocument"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: FabrikResourceOrigin fabrik_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikResourceOrigin"
    ADD CONSTRAINT fabrik_id FOREIGN KEY (fabrik_id) REFERENCES public."Fabrik"(id);


--
-- Name: ProductDocument model_document_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDocument"
    ADD CONSTRAINT model_document_id_fk FOREIGN KEY (document_id) REFERENCES public."Document"(id);


--
-- Name: User model_document_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT model_document_id_fk FOREIGN KEY (document_id) REFERENCES public."Document"(id);


--
-- Name: Order model_document_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT model_document_id_fk FOREIGN KEY (document_id) REFERENCES public."Document"(id);


--
-- Name: OrderSize order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderSize"
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."Order"(id);


--
-- Name: OrderFabrik order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderFabrik"
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."Order"(id);


--
-- Name: Room order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."Order"(id);


--
-- Name: OrderAdditionalServices order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderAdditionalServices"
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."Order"(id);


--
-- Name: FabrikProductFabrikDocument product_document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProductFabrikDocument"
    ADD CONSTRAINT product_document_id FOREIGN KEY (fabrik_product_id) REFERENCES public."FabrikProduct"(id);


--
-- Name: ProductDocument product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDocument"
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public."Product"(id);


--
-- Name: Order product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public."Product"(id);


--
-- Name: FabrikProduct product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikProduct"
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public."Product"(id);


--
-- Name: FabrikResourceOrigin resource_origin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FabrikResourceOrigin"
    ADD CONSTRAINT resource_origin_id FOREIGN KEY (resource_origin_id) REFERENCES public."ResourceOrigin"(id);


--
-- Name: OrderSize size_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderSize"
    ADD CONSTRAINT size_id FOREIGN KEY (size_id) REFERENCES public."Size"(id);


--
-- Name: UserRole user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: Address user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: Order user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: Room user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."User"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

