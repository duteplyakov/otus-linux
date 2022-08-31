--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 9.6.20

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
-- Name: AO_0A5972_NOTIFICATION_SETTING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_0A5972_NOTIFICATION_SETTING" (
    "ID" bigint NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "TYPE" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL,
    "VALUE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_0A5972_NOTIFICATION_SETTING" OWNER TO jira;

--
-- Name: AO_0A5972_NOTIFICATION_SETTING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_0A5972_NOTIFICATION_SETTING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_0A5972_NOTIFICATION_SETTING_ID_seq" OWNER TO jira;

--
-- Name: AO_0A5972_NOTIFICATION_SETTING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_0A5972_NOTIFICATION_SETTING_ID_seq" OWNED BY public."AO_0A5972_NOTIFICATION_SETTING"."ID";


--
-- Name: AO_0A5972_PUSH_REGISTRATION; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_0A5972_PUSH_REGISTRATION" (
    "BUILD" character varying(255) NOT NULL,
    "ENDPOINT" character varying(450),
    "ID" character varying(255) NOT NULL,
    "OS" character varying(255) NOT NULL,
    "TOKEN" character varying(450),
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_0A5972_PUSH_REGISTRATION" OWNER TO jira;

--
-- Name: AO_0AC321_RECOMMENDATION_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_0AC321_RECOMMENDATION_AO" (
    "CATEGORY" character varying(255),
    "CUSTOM_FIELD_ID" bigint,
    "ID" character varying(255) NOT NULL,
    "NAME" character varying(255),
    "PERFORMANCE_IMPACT" double precision,
    "PROJECT_IDS" text,
    "RESOLVED" boolean,
    "TYPE" character varying(255)
);


ALTER TABLE public."AO_0AC321_RECOMMENDATION_AO" OWNER TO jira;

--
-- Name: AO_21D670_WHITELIST_RULES; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_21D670_WHITELIST_RULES" (
    "ALLOWINBOUND" boolean,
    "AUTHENTICATIONREQUIRED" boolean DEFAULT false NOT NULL,
    "EXPRESSION" text NOT NULL,
    "ID" integer NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21D670_WHITELIST_RULES" OWNER TO jira;

--
-- Name: AO_21D670_WHITELIST_RULES_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_21D670_WHITELIST_RULES_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21D670_WHITELIST_RULES_ID_seq" OWNER TO jira;

--
-- Name: AO_21D670_WHITELIST_RULES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_21D670_WHITELIST_RULES_ID_seq" OWNED BY public."AO_21D670_WHITELIST_RULES"."ID";


--
-- Name: AO_21F425_MESSAGE_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_21F425_MESSAGE_AO" (
    "CONTENT" text NOT NULL,
    "ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_MESSAGE_AO" OWNER TO jira;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_21F425_MESSAGE_MAPPING_AO" (
    "ID" integer NOT NULL,
    "MESSAGE_ID" character varying(255) NOT NULL,
    "USER_HASH" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_MESSAGE_MAPPING_AO" OWNER TO jira;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq" OWNER TO jira;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq" OWNED BY public."AO_21F425_MESSAGE_MAPPING_AO"."ID";


--
-- Name: AO_21F425_USER_PROPERTY_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_21F425_USER_PROPERTY_AO" (
    "ID" integer NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "USER" character varying(255) NOT NULL,
    "VALUE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_USER_PROPERTY_AO" OWNER TO jira;

--
-- Name: AO_21F425_USER_PROPERTY_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_21F425_USER_PROPERTY_AO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21F425_USER_PROPERTY_AO_ID_seq" OWNER TO jira;

--
-- Name: AO_21F425_USER_PROPERTY_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_21F425_USER_PROPERTY_AO_ID_seq" OWNED BY public."AO_21F425_USER_PROPERTY_AO"."ID";


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_38321B_CUSTOM_CONTENT_LINK" (
    "CONTENT_KEY" character varying(255),
    "ID" integer NOT NULL,
    "LINK_LABEL" character varying(255),
    "LINK_URL" character varying(255),
    "SEQUENCE" integer DEFAULT 0
);


ALTER TABLE public."AO_38321B_CUSTOM_CONTENT_LINK" OWNER TO jira;

--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq" OWNER TO jira;

--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq" OWNED BY public."AO_38321B_CUSTOM_CONTENT_LINK"."ID";


--
-- Name: AO_3B1893_LOOP_DETECTION; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_3B1893_LOOP_DETECTION" (
    "COUNTER" integer DEFAULT 0 NOT NULL,
    "EXPIRES_AT" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "SENDER_EMAIL" text NOT NULL
);


ALTER TABLE public."AO_3B1893_LOOP_DETECTION" OWNER TO jira;

--
-- Name: AO_3B1893_LOOP_DETECTION_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_3B1893_LOOP_DETECTION_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_3B1893_LOOP_DETECTION_ID_seq" OWNER TO jira;

--
-- Name: AO_3B1893_LOOP_DETECTION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_3B1893_LOOP_DETECTION_ID_seq" OWNED BY public."AO_3B1893_LOOP_DETECTION"."ID";


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_4789DD_HEALTH_CHECK_STATUS" (
    "APPLICATION_NAME" character varying(255),
    "COMPLETE_KEY" character varying(255),
    "DESCRIPTION" text,
    "FAILED_DATE" timestamp without time zone,
    "FAILURE_REASON" text,
    "ID" integer NOT NULL,
    "IS_HEALTHY" boolean,
    "IS_RESOLVED" boolean,
    "RESOLVED_DATE" timestamp without time zone,
    "SEVERITY" character varying(255),
    "STATUS_NAME" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_STATUS" OWNER TO jira;

--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq" OWNER TO jira;

--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq" OWNED BY public."AO_4789DD_HEALTH_CHECK_STATUS"."ID";


--
-- Name: AO_4789DD_PROPERTIES; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_4789DD_PROPERTIES" (
    "ID" integer NOT NULL,
    "PROPERTY_NAME" character varying(255) NOT NULL,
    "PROPERTY_VALUE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_PROPERTIES" OWNER TO jira;

--
-- Name: AO_4789DD_PROPERTIES_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_4789DD_PROPERTIES_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_PROPERTIES_ID_seq" OWNER TO jira;

--
-- Name: AO_4789DD_PROPERTIES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_4789DD_PROPERTIES_ID_seq" OWNED BY public."AO_4789DD_PROPERTIES"."ID";


--
-- Name: AO_4789DD_READ_NOTIFICATIONS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_4789DD_READ_NOTIFICATIONS" (
    "ID" integer NOT NULL,
    "IS_SNOOZED" boolean,
    "NOTIFICATION_ID" integer NOT NULL,
    "SNOOZE_COUNT" integer,
    "SNOOZE_DATE" timestamp without time zone,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_READ_NOTIFICATIONS" OWNER TO jira;

--
-- Name: AO_4789DD_READ_NOTIFICATIONS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq" OWNER TO jira;

--
-- Name: AO_4789DD_READ_NOTIFICATIONS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq" OWNED BY public."AO_4789DD_READ_NOTIFICATIONS"."ID";


--
-- Name: AO_4789DD_TASK_MONITOR; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_4789DD_TASK_MONITOR" (
    "CLUSTERED_TASK_ID" character varying(255),
    "CREATED_TIMESTAMP" bigint DEFAULT 0,
    "ID" integer NOT NULL,
    "NODE_ID" character varying(255),
    "PROGRESS_MESSAGE" text,
    "PROGRESS_PERCENTAGE" integer,
    "SERIALIZED_ERRORS" text,
    "SERIALIZED_WARNINGS" text,
    "TASK_ID" character varying(255) NOT NULL,
    "TASK_MONITOR_KIND" character varying(255),
    "TASK_STATUS" text
);


ALTER TABLE public."AO_4789DD_TASK_MONITOR" OWNER TO jira;

--
-- Name: AO_4789DD_TASK_MONITOR_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_4789DD_TASK_MONITOR_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_TASK_MONITOR_ID_seq" OWNER TO jira;

--
-- Name: AO_4789DD_TASK_MONITOR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_4789DD_TASK_MONITOR_ID_seq" OWNED BY public."AO_4789DD_TASK_MONITOR"."ID";


--
-- Name: AO_4AEACD_WEBHOOK_DAO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_4AEACD_WEBHOOK_DAO" (
    "ENABLED" boolean,
    "ENCODED_EVENTS" text,
    "FILTER" text,
    "ID" integer NOT NULL,
    "JQL" character varying(255),
    "LAST_UPDATED" timestamp without time zone NOT NULL,
    "LAST_UPDATED_USER" character varying(255) NOT NULL,
    "NAME" text NOT NULL,
    "REGISTRATION_METHOD" character varying(255) NOT NULL,
    "URL" text NOT NULL,
    "PARAMETERS" text,
    "EXCLUDE_ISSUE_DETAILS" boolean
);


ALTER TABLE public."AO_4AEACD_WEBHOOK_DAO" OWNER TO jira;

--
-- Name: AO_4AEACD_WEBHOOK_DAO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_4AEACD_WEBHOOK_DAO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4AEACD_WEBHOOK_DAO_ID_seq" OWNER TO jira;

--
-- Name: AO_4AEACD_WEBHOOK_DAO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_4AEACD_WEBHOOK_DAO_ID_seq" OWNED BY public."AO_4AEACD_WEBHOOK_DAO"."ID";


--
-- Name: AO_550953_SHORTCUT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_550953_SHORTCUT" (
    "ID" integer NOT NULL,
    "NAME" character varying(255),
    "PROJECT_ID" bigint,
    "SHORTCUT_URL" text,
    "URL" character varying(255),
    "ICON" character varying(255)
);


ALTER TABLE public."AO_550953_SHORTCUT" OWNER TO jira;

--
-- Name: AO_550953_SHORTCUT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_550953_SHORTCUT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_550953_SHORTCUT_ID_seq" OWNER TO jira;

--
-- Name: AO_550953_SHORTCUT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_550953_SHORTCUT_ID_seq" OWNED BY public."AO_550953_SHORTCUT"."ID";


--
-- Name: AO_563AEE_ACTIVITY_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_563AEE_ACTIVITY_ENTITY" (
    "ACTIVITY_ID" bigint NOT NULL,
    "ACTOR_ID" integer,
    "CONTENT" text,
    "GENERATOR_DISPLAY_NAME" character varying(255),
    "GENERATOR_ID" character varying(450),
    "ICON_ID" integer,
    "ID" character varying(450),
    "ISSUE_KEY" character varying(255),
    "OBJECT_ID" integer,
    "POSTER" character varying(255),
    "PROJECT_KEY" character varying(255),
    "PUBLISHED" timestamp without time zone,
    "TARGET_ID" integer,
    "TITLE" character varying(255),
    "URL" character varying(450),
    "USERNAME" character varying(255),
    "VERB" character varying(450)
);


ALTER TABLE public."AO_563AEE_ACTIVITY_ENTITY" OWNER TO jira;

--
-- Name: AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq" OWNER TO jira;

--
-- Name: AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq" OWNED BY public."AO_563AEE_ACTIVITY_ENTITY"."ACTIVITY_ID";


--
-- Name: AO_563AEE_ACTOR_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_563AEE_ACTOR_ENTITY" (
    "FULL_NAME" character varying(255),
    "ID" integer NOT NULL,
    "PROFILE_PAGE_URI" character varying(450),
    "PROFILE_PICTURE_URI" character varying(450),
    "USERNAME" character varying(255)
);


ALTER TABLE public."AO_563AEE_ACTOR_ENTITY" OWNER TO jira;

--
-- Name: AO_563AEE_ACTOR_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_563AEE_ACTOR_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_ACTOR_ENTITY_ID_seq" OWNER TO jira;

--
-- Name: AO_563AEE_ACTOR_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_563AEE_ACTOR_ENTITY_ID_seq" OWNED BY public."AO_563AEE_ACTOR_ENTITY"."ID";


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_563AEE_MEDIA_LINK_ENTITY" (
    "DURATION" integer,
    "HEIGHT" integer,
    "ID" integer NOT NULL,
    "URL" character varying(450),
    "WIDTH" integer
);


ALTER TABLE public."AO_563AEE_MEDIA_LINK_ENTITY" OWNER TO jira;

--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq" OWNER TO jira;

--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq" OWNED BY public."AO_563AEE_MEDIA_LINK_ENTITY"."ID";


--
-- Name: AO_563AEE_OBJECT_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_563AEE_OBJECT_ENTITY" (
    "CONTENT" character varying(255),
    "DISPLAY_NAME" character varying(255),
    "ID" integer NOT NULL,
    "IMAGE_ID" integer,
    "OBJECT_ID" character varying(450),
    "OBJECT_TYPE" character varying(450),
    "SUMMARY" character varying(255),
    "URL" character varying(450)
);


ALTER TABLE public."AO_563AEE_OBJECT_ENTITY" OWNER TO jira;

--
-- Name: AO_563AEE_OBJECT_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_563AEE_OBJECT_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_OBJECT_ENTITY_ID_seq" OWNER TO jira;

--
-- Name: AO_563AEE_OBJECT_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_563AEE_OBJECT_ENTITY_ID_seq" OWNED BY public."AO_563AEE_OBJECT_ENTITY"."ID";


--
-- Name: AO_563AEE_TARGET_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_563AEE_TARGET_ENTITY" (
    "CONTENT" character varying(255),
    "DISPLAY_NAME" character varying(255),
    "ID" integer NOT NULL,
    "IMAGE_ID" integer,
    "OBJECT_ID" character varying(450),
    "OBJECT_TYPE" character varying(450),
    "SUMMARY" character varying(255),
    "URL" character varying(450)
);


ALTER TABLE public."AO_563AEE_TARGET_ENTITY" OWNER TO jira;

--
-- Name: AO_563AEE_TARGET_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_563AEE_TARGET_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_TARGET_ENTITY_ID_seq" OWNER TO jira;

--
-- Name: AO_563AEE_TARGET_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_563AEE_TARGET_ENTITY_ID_seq" OWNED BY public."AO_563AEE_TARGET_ENTITY"."ID";


--
-- Name: AO_575BF5_DEV_SUMMARY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_575BF5_DEV_SUMMARY" (
    "CREATED" timestamp without time zone NOT NULL,
    "ID" integer NOT NULL,
    "ISSUE_ID" bigint DEFAULT 0 NOT NULL,
    "JSON" text,
    "PROVIDER_SOURCE_ID" character varying(255) NOT NULL,
    "UPDATED" timestamp without time zone NOT NULL
);


ALTER TABLE public."AO_575BF5_DEV_SUMMARY" OWNER TO jira;

--
-- Name: AO_575BF5_DEV_SUMMARY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_575BF5_DEV_SUMMARY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_575BF5_DEV_SUMMARY_ID_seq" OWNER TO jira;

--
-- Name: AO_575BF5_DEV_SUMMARY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_575BF5_DEV_SUMMARY_ID_seq" OWNED BY public."AO_575BF5_DEV_SUMMARY"."ID";


--
-- Name: AO_575BF5_PROCESSED_COMMITS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_575BF5_PROCESSED_COMMITS" (
    "COMMIT_HASH" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "METADATA_HASH" character varying(255)
);


ALTER TABLE public."AO_575BF5_PROCESSED_COMMITS" OWNER TO jira;

--
-- Name: AO_575BF5_PROCESSED_COMMITS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_575BF5_PROCESSED_COMMITS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_575BF5_PROCESSED_COMMITS_ID_seq" OWNER TO jira;

--
-- Name: AO_575BF5_PROCESSED_COMMITS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_575BF5_PROCESSED_COMMITS_ID_seq" OWNED BY public."AO_575BF5_PROCESSED_COMMITS"."ID";


--
-- Name: AO_575BF5_PROVIDER_ISSUE; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_575BF5_PROVIDER_ISSUE" (
    "ID" integer NOT NULL,
    "ISSUE_ID" bigint DEFAULT 0 NOT NULL,
    "PROVIDER_SOURCE_ID" character varying(255) NOT NULL,
    "STALE_AFTER" bigint
);


ALTER TABLE public."AO_575BF5_PROVIDER_ISSUE" OWNER TO jira;

--
-- Name: AO_575BF5_PROVIDER_ISSUE_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_575BF5_PROVIDER_ISSUE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_575BF5_PROVIDER_ISSUE_ID_seq" OWNER TO jira;

--
-- Name: AO_575BF5_PROVIDER_ISSUE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_575BF5_PROVIDER_ISSUE_ID_seq" OWNED BY public."AO_575BF5_PROVIDER_ISSUE"."ID";


--
-- Name: AO_575BF5_PROVIDER_SEQ_NO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_575BF5_PROVIDER_SEQ_NO" (
    "ID" integer NOT NULL,
    "PROVIDER_SOURCE_ID" character varying(255) NOT NULL,
    "SEQUENCE_NO" character varying(255)
);


ALTER TABLE public."AO_575BF5_PROVIDER_SEQ_NO" OWNER TO jira;

--
-- Name: AO_575BF5_PROVIDER_SEQ_NO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_575BF5_PROVIDER_SEQ_NO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_575BF5_PROVIDER_SEQ_NO_ID_seq" OWNER TO jira;

--
-- Name: AO_575BF5_PROVIDER_SEQ_NO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_575BF5_PROVIDER_SEQ_NO_ID_seq" OWNED BY public."AO_575BF5_PROVIDER_SEQ_NO"."ID";


--
-- Name: AO_60DB71_AUDITENTRY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_AUDITENTRY" (
    "CATEGORY" character varying(255) NOT NULL,
    "DATA" text NOT NULL,
    "ENTITY_CLASS" character varying(255) NOT NULL,
    "ENTITY_ID" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "TIME" bigint,
    "USER" character varying(255)
);


ALTER TABLE public."AO_60DB71_AUDITENTRY" OWNER TO jira;

--
-- Name: AO_60DB71_AUDITENTRY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_AUDITENTRY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_AUDITENTRY_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_AUDITENTRY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_AUDITENTRY_ID_seq" OWNED BY public."AO_60DB71_AUDITENTRY"."ID";


--
-- Name: AO_60DB71_BOARDADMINS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_BOARDADMINS" (
    "ID" bigint NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_BOARDADMINS" OWNER TO jira;

--
-- Name: AO_60DB71_BOARDADMINS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_BOARDADMINS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_BOARDADMINS_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_BOARDADMINS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_BOARDADMINS_ID_seq" OWNED BY public."AO_60DB71_BOARDADMINS"."ID";


--
-- Name: AO_60DB71_CARDCOLOR; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_CARDCOLOR" (
    "COLOR" character varying(255),
    "ID" bigint NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "STRATEGY" character varying(255),
    "VAL" character varying(255)
);


ALTER TABLE public."AO_60DB71_CARDCOLOR" OWNER TO jira;

--
-- Name: AO_60DB71_CARDCOLOR_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_CARDCOLOR_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_CARDCOLOR_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_CARDCOLOR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_CARDCOLOR_ID_seq" OWNED BY public."AO_60DB71_CARDCOLOR"."ID";


--
-- Name: AO_60DB71_CARDLAYOUT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_CARDLAYOUT" (
    "FIELD_ID" character varying(255) NOT NULL,
    "ID" bigint NOT NULL,
    "MODE_NAME" character varying(255) NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_CARDLAYOUT" OWNER TO jira;

--
-- Name: AO_60DB71_CARDLAYOUT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_CARDLAYOUT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_CARDLAYOUT_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_CARDLAYOUT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_CARDLAYOUT_ID_seq" OWNED BY public."AO_60DB71_CARDLAYOUT"."ID";


--
-- Name: AO_60DB71_COLUMN; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_COLUMN" (
    "ID" bigint NOT NULL,
    "MAXIM" double precision,
    "MINIM" double precision,
    "NAME" character varying(255),
    "POS" integer DEFAULT 0 NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_COLUMN" OWNER TO jira;

--
-- Name: AO_60DB71_COLUMNSTATUS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_COLUMNSTATUS" (
    "COLUMN_ID" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "STATUS_ID" character varying(255)
);


ALTER TABLE public."AO_60DB71_COLUMNSTATUS" OWNER TO jira;

--
-- Name: AO_60DB71_COLUMNSTATUS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_COLUMNSTATUS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_COLUMNSTATUS_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_COLUMNSTATUS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_COLUMNSTATUS_ID_seq" OWNED BY public."AO_60DB71_COLUMNSTATUS"."ID";


--
-- Name: AO_60DB71_COLUMN_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_COLUMN_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_COLUMN_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_COLUMN_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_COLUMN_ID_seq" OWNED BY public."AO_60DB71_COLUMN"."ID";


--
-- Name: AO_60DB71_DETAILVIEWFIELD; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_DETAILVIEWFIELD" (
    "FIELD_ID" character varying(255) NOT NULL,
    "ID" bigint NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_DETAILVIEWFIELD" OWNER TO jira;

--
-- Name: AO_60DB71_DETAILVIEWFIELD_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_DETAILVIEWFIELD_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_DETAILVIEWFIELD_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_DETAILVIEWFIELD_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_DETAILVIEWFIELD_ID_seq" OWNED BY public."AO_60DB71_DETAILVIEWFIELD"."ID";


--
-- Name: AO_60DB71_ESTIMATESTATISTIC; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_ESTIMATESTATISTIC" (
    "FIELD_ID" character varying(255),
    "ID" bigint NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "TYPE_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_ESTIMATESTATISTIC" OWNER TO jira;

--
-- Name: AO_60DB71_ESTIMATESTATISTIC_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_ESTIMATESTATISTIC_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_ESTIMATESTATISTIC_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_ESTIMATESTATISTIC_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_ESTIMATESTATISTIC_ID_seq" OWNED BY public."AO_60DB71_ESTIMATESTATISTIC"."ID";


--
-- Name: AO_60DB71_ISSUERANKING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_ISSUERANKING" (
    "CUSTOM_FIELD_ID" bigint DEFAULT 0 NOT NULL,
    "ID" bigint NOT NULL,
    "ISSUE_ID" bigint DEFAULT 0 NOT NULL,
    "NEXT_ID" bigint
);


ALTER TABLE public."AO_60DB71_ISSUERANKING" OWNER TO jira;

--
-- Name: AO_60DB71_ISSUERANKINGLOG; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_ISSUERANKINGLOG" (
    "CUSTOM_FIELD_ID" bigint,
    "ID" bigint NOT NULL,
    "ISSUE_ID" bigint,
    "LOG_TYPE" character varying(255),
    "NEW_NEXT_ID" bigint,
    "NEW_PREVIOUS_ID" bigint,
    "OLD_NEXT_ID" bigint,
    "OLD_PREVIOUS_ID" bigint,
    "SANITY_CHECKED" character varying(255)
);


ALTER TABLE public."AO_60DB71_ISSUERANKINGLOG" OWNER TO jira;

--
-- Name: AO_60DB71_ISSUERANKINGLOG_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_ISSUERANKINGLOG_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_ISSUERANKINGLOG_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_ISSUERANKINGLOG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_ISSUERANKINGLOG_ID_seq" OWNED BY public."AO_60DB71_ISSUERANKINGLOG"."ID";


--
-- Name: AO_60DB71_ISSUERANKING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_ISSUERANKING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_ISSUERANKING_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_ISSUERANKING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_ISSUERANKING_ID_seq" OWNED BY public."AO_60DB71_ISSUERANKING"."ID";


--
-- Name: AO_60DB71_LEXORANK; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_LEXORANK" (
    "BUCKET" integer DEFAULT 0,
    "FIELD_ID" bigint DEFAULT 0 NOT NULL,
    "ID" bigint NOT NULL,
    "ISSUE_ID" bigint DEFAULT 0 NOT NULL,
    "LOCK_HASH" character varying(255),
    "LOCK_TIME" bigint,
    "RANK" character varying(255) NOT NULL,
    "TYPE" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."AO_60DB71_LEXORANK" OWNER TO jira;

--
-- Name: AO_60DB71_LEXORANKBALANCER; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_LEXORANKBALANCER" (
    "DISABLE_RANK_OPERATIONS" boolean NOT NULL,
    "FIELD_ID" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "REBALANCE_TIME" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_LEXORANKBALANCER" OWNER TO jira;

--
-- Name: AO_60DB71_LEXORANKBALANCER_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_LEXORANKBALANCER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_LEXORANKBALANCER_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_LEXORANKBALANCER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_LEXORANKBALANCER_ID_seq" OWNED BY public."AO_60DB71_LEXORANKBALANCER"."ID";


--
-- Name: AO_60DB71_LEXORANK_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_LEXORANK_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_LEXORANK_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_LEXORANK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_LEXORANK_ID_seq" OWNED BY public."AO_60DB71_LEXORANK"."ID";


--
-- Name: AO_60DB71_NONWORKINGDAY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_NONWORKINGDAY" (
    "ID" bigint NOT NULL,
    "ISO8601_DATE" character varying(255) NOT NULL,
    "WORKING_DAYS_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_NONWORKINGDAY" OWNER TO jira;

--
-- Name: AO_60DB71_NONWORKINGDAY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_NONWORKINGDAY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_NONWORKINGDAY_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_NONWORKINGDAY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_NONWORKINGDAY_ID_seq" OWNED BY public."AO_60DB71_NONWORKINGDAY"."ID";


--
-- Name: AO_60DB71_QUICKFILTER; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_QUICKFILTER" (
    "DESCRIPTION" character varying(255),
    "ID" bigint NOT NULL,
    "LONG_QUERY" text,
    "NAME" character varying(255) NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "QUERY" character varying(255),
    "RAPID_VIEW_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_QUICKFILTER" OWNER TO jira;

--
-- Name: AO_60DB71_QUICKFILTER_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_QUICKFILTER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_QUICKFILTER_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_QUICKFILTER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_QUICKFILTER_ID_seq" OWNED BY public."AO_60DB71_QUICKFILTER"."ID";


--
-- Name: AO_60DB71_RANKABLEOBJECT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_RANKABLEOBJECT" (
    "ID" bigint NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_RANKABLEOBJECT" OWNER TO jira;

--
-- Name: AO_60DB71_RANKABLEOBJECT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_RANKABLEOBJECT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_RANKABLEOBJECT_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_RANKABLEOBJECT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_RANKABLEOBJECT_ID_seq" OWNED BY public."AO_60DB71_RANKABLEOBJECT"."ID";


--
-- Name: AO_60DB71_RAPIDVIEW; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_RAPIDVIEW" (
    "CARD_COLOR_STRATEGY" character varying(255),
    "ID" bigint NOT NULL,
    "KAN_PLAN_ENABLED" boolean,
    "NAME" character varying(255) NOT NULL,
    "OLD_DONE_ISSUES_CUTOFF" character varying(255),
    "OWNER_USER_NAME" character varying(255) NOT NULL,
    "REFINED_VELOCITY_ACTIVE" boolean,
    "SAVED_FILTER_ID" bigint NOT NULL,
    "SHOW_DAYS_IN_COLUMN" boolean,
    "SHOW_EPIC_AS_PANEL" boolean,
    "SPRINTS_ENABLED" boolean,
    "SWIMLANE_STRATEGY" character varying(255)
);


ALTER TABLE public."AO_60DB71_RAPIDVIEW" OWNER TO jira;

--
-- Name: AO_60DB71_RAPIDVIEW_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_RAPIDVIEW_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_RAPIDVIEW_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_RAPIDVIEW_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_RAPIDVIEW_ID_seq" OWNED BY public."AO_60DB71_RAPIDVIEW"."ID";


--
-- Name: AO_60DB71_SPRINT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_SPRINT" (
    "ACTIVATED_DATE" bigint,
    "AUTO_START_STOP" boolean,
    "CLOSED" boolean NOT NULL,
    "COMPLETE_DATE" bigint,
    "END_DATE" bigint,
    "GOAL" text,
    "ID" bigint NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "RAPID_VIEW_ID" bigint,
    "SEQUENCE" bigint,
    "STARTED" boolean,
    "START_DATE" bigint
);


ALTER TABLE public."AO_60DB71_SPRINT" OWNER TO jira;

--
-- Name: AO_60DB71_SPRINT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_SPRINT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_SPRINT_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_SPRINT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_SPRINT_ID_seq" OWNED BY public."AO_60DB71_SPRINT"."ID";


--
-- Name: AO_60DB71_STATSFIELD; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_STATSFIELD" (
    "ID" bigint NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "TYPE_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_STATSFIELD" OWNER TO jira;

--
-- Name: AO_60DB71_STATSFIELD_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_STATSFIELD_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_STATSFIELD_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_STATSFIELD_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_STATSFIELD_ID_seq" OWNED BY public."AO_60DB71_STATSFIELD"."ID";


--
-- Name: AO_60DB71_SUBQUERY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_SUBQUERY" (
    "ID" bigint NOT NULL,
    "LONG_QUERY" text,
    "QUERY" character varying(255),
    "RAPID_VIEW_ID" bigint,
    "SECTION" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_SUBQUERY" OWNER TO jira;

--
-- Name: AO_60DB71_SUBQUERY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_SUBQUERY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_SUBQUERY_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_SUBQUERY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_SUBQUERY_ID_seq" OWNED BY public."AO_60DB71_SUBQUERY"."ID";


--
-- Name: AO_60DB71_SWIMLANE; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_SWIMLANE" (
    "DEFAULT_LANE" boolean NOT NULL,
    "DESCRIPTION" character varying(255),
    "ID" bigint NOT NULL,
    "LONG_QUERY" text,
    "NAME" character varying(255) NOT NULL,
    "POS" integer DEFAULT 0 NOT NULL,
    "QUERY" character varying(255),
    "RAPID_VIEW_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_SWIMLANE" OWNER TO jira;

--
-- Name: AO_60DB71_SWIMLANE_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_SWIMLANE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_SWIMLANE_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_SWIMLANE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_SWIMLANE_ID_seq" OWNED BY public."AO_60DB71_SWIMLANE"."ID";


--
-- Name: AO_60DB71_TRACKINGSTATISTIC; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_TRACKINGSTATISTIC" (
    "FIELD_ID" character varying(255),
    "ID" bigint NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "TYPE_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_60DB71_TRACKINGSTATISTIC" OWNER TO jira;

--
-- Name: AO_60DB71_TRACKINGSTATISTIC_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_TRACKINGSTATISTIC_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_TRACKINGSTATISTIC_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_TRACKINGSTATISTIC_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_TRACKINGSTATISTIC_ID_seq" OWNED BY public."AO_60DB71_TRACKINGSTATISTIC"."ID";


--
-- Name: AO_60DB71_VERSION; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_VERSION" (
    "ID" bigint NOT NULL,
    "START_DATE" bigint,
    "VERSION_ID" bigint NOT NULL
);


ALTER TABLE public."AO_60DB71_VERSION" OWNER TO jira;

--
-- Name: AO_60DB71_VERSION_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_VERSION_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_VERSION_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_VERSION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_VERSION_ID_seq" OWNED BY public."AO_60DB71_VERSION"."ID";


--
-- Name: AO_60DB71_WORKINGDAYS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_60DB71_WORKINGDAYS" (
    "FRIDAY" boolean NOT NULL,
    "ID" bigint NOT NULL,
    "MONDAY" boolean NOT NULL,
    "RAPID_VIEW_ID" bigint NOT NULL,
    "SATURDAY" boolean NOT NULL,
    "SUNDAY" boolean NOT NULL,
    "THURSDAY" boolean NOT NULL,
    "TIMEZONE" character varying(255) NOT NULL,
    "TUESDAY" boolean NOT NULL,
    "WEDNESDAY" boolean NOT NULL
);


ALTER TABLE public."AO_60DB71_WORKINGDAYS" OWNER TO jira;

--
-- Name: AO_60DB71_WORKINGDAYS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_60DB71_WORKINGDAYS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_60DB71_WORKINGDAYS_ID_seq" OWNER TO jira;

--
-- Name: AO_60DB71_WORKINGDAYS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_60DB71_WORKINGDAYS_ID_seq" OWNED BY public."AO_60DB71_WORKINGDAYS"."ID";


--
-- Name: AO_723324_CLIENT_CONFIG; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_723324_CLIENT_CONFIG" (
    "AUTHORIZATION_ENDPOINT" character varying(255) NOT NULL,
    "CLIENT_ID" character varying(255) NOT NULL,
    "CLIENT_SECRET" character varying(255) NOT NULL,
    "DESCRIPTION" character varying(255),
    "ID" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "SCOPES" text NOT NULL,
    "TOKEN_ENDPOINT" character varying(255) NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_723324_CLIENT_CONFIG" OWNER TO jira;

--
-- Name: AO_723324_CLIENT_TOKEN; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_723324_CLIENT_TOKEN" (
    "ACCESS_TOKEN" text NOT NULL,
    "ACCESS_TOKEN_EXPIRATION" bigint DEFAULT 0 NOT NULL,
    "CONFIG_ID" character varying(255) NOT NULL,
    "ID" character varying(255) NOT NULL,
    "LAST_REFRESHED" bigint,
    "LAST_STATUS_UPDATED" bigint NOT NULL,
    "REFRESH_COUNT" integer DEFAULT 0,
    "REFRESH_TOKEN" text,
    "REFRESH_TOKEN_EXPIRATION" bigint,
    "STATUS" character varying(255) NOT NULL
);


ALTER TABLE public."AO_723324_CLIENT_TOKEN" OWNER TO jira;

--
-- Name: AO_733371_EVENT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_733371_EVENT" (
    "ACTION" character varying(255),
    "ACTION_ID" character varying(255),
    "CREATED" timestamp without time zone NOT NULL,
    "EVENT_BUNDLE_ID" character varying(255),
    "EVENT_TYPE" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "USER_KEY" character varying(255)
);


ALTER TABLE public."AO_733371_EVENT" OWNER TO jira;

--
-- Name: AO_733371_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_733371_EVENT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_733371_EVENT_ID_seq" OWNER TO jira;

--
-- Name: AO_733371_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_733371_EVENT_ID_seq" OWNED BY public."AO_733371_EVENT"."ID";


--
-- Name: AO_733371_EVENT_PARAMETER; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_733371_EVENT_PARAMETER" (
    "EVENT_ID" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "VALUE" text
);


ALTER TABLE public."AO_733371_EVENT_PARAMETER" OWNER TO jira;

--
-- Name: AO_733371_EVENT_PARAMETER_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_733371_EVENT_PARAMETER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_733371_EVENT_PARAMETER_ID_seq" OWNER TO jira;

--
-- Name: AO_733371_EVENT_PARAMETER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_733371_EVENT_PARAMETER_ID_seq" OWNED BY public."AO_733371_EVENT_PARAMETER"."ID";


--
-- Name: AO_733371_EVENT_RECIPIENT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_733371_EVENT_RECIPIENT" (
    "CONSUMER_NAME" character varying(255) NOT NULL,
    "CREATED" timestamp without time zone NOT NULL,
    "EVENT_ID" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "SEND_DATE" timestamp without time zone,
    "STATUS" character varying(255) NOT NULL,
    "UPDATED" timestamp without time zone,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_733371_EVENT_RECIPIENT" OWNER TO jira;

--
-- Name: AO_733371_EVENT_RECIPIENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_733371_EVENT_RECIPIENT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_733371_EVENT_RECIPIENT_ID_seq" OWNER TO jira;

--
-- Name: AO_733371_EVENT_RECIPIENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_733371_EVENT_RECIPIENT_ID_seq" OWNED BY public."AO_733371_EVENT_RECIPIENT"."ID";


--
-- Name: AO_97EDAB_USERINVITATION; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_97EDAB_USERINVITATION" (
    "APPLICATION_KEYS" character varying(255),
    "EMAIL_ADDRESS" character varying(255),
    "EXPIRY" timestamp without time zone,
    "ID" integer NOT NULL,
    "REDEEMED" boolean,
    "SENDER_USERNAME" character varying(255),
    "TOKEN" character varying(255)
);


ALTER TABLE public."AO_97EDAB_USERINVITATION" OWNER TO jira;

--
-- Name: AO_97EDAB_USERINVITATION_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_97EDAB_USERINVITATION_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_97EDAB_USERINVITATION_ID_seq" OWNER TO jira;

--
-- Name: AO_97EDAB_USERINVITATION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_97EDAB_USERINVITATION_ID_seq" OWNED BY public."AO_97EDAB_USERINVITATION"."ID";


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO" (
    "DESCRIPTION" text,
    "ENABLED" boolean,
    "EVENTS" text,
    "EXCLUDE_BODY" boolean,
    "FILTERS" text,
    "ID" integer NOT NULL,
    "LAST_UPDATED" timestamp without time zone NOT NULL,
    "LAST_UPDATED_USER" character varying(255),
    "NAME" text NOT NULL,
    "PARAMETERS" text,
    "REGISTRATION_METHOD" character varying(255) NOT NULL,
    "URL" text NOT NULL
);


ALTER TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO" OWNER TO jira;

--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq" OWNER TO jira;

--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq" OWNED BY public."AO_A0B856_WEB_HOOK_LISTENER_AO"."ID";


--
-- Name: AO_AC3877_RL_USER_COUNTER; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_AC3877_RL_USER_COUNTER" (
    "ID" bigint NOT NULL,
    "INTERVAL_START" timestamp without time zone NOT NULL,
    "NODE_ID" character varying(255) NOT NULL,
    "REJECT_COUNT" bigint DEFAULT 0 NOT NULL,
    "USER_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_AC3877_RL_USER_COUNTER" OWNER TO jira;

--
-- Name: AO_AC3877_RL_USER_COUNTER_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_AC3877_RL_USER_COUNTER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_AC3877_RL_USER_COUNTER_ID_seq" OWNER TO jira;

--
-- Name: AO_AC3877_RL_USER_COUNTER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_AC3877_RL_USER_COUNTER_ID_seq" OWNED BY public."AO_AC3877_RL_USER_COUNTER"."ID";


--
-- Name: AO_AC3877_SETTINGS_VERSION; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_AC3877_SETTINGS_VERSION" (
    "TYPE" character varying(255) NOT NULL,
    "VERSION" bigint NOT NULL
);


ALTER TABLE public."AO_AC3877_SETTINGS_VERSION" OWNER TO jira;

--
-- Name: AO_AC3877_SYSTEM_RL_SETTINGS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_AC3877_SYSTEM_RL_SETTINGS" (
    "CAPACITY" integer DEFAULT 0 NOT NULL,
    "CLEAN_JOB_DURATION" character varying(255) NOT NULL,
    "FILL_RATE" integer DEFAULT 0 NOT NULL,
    "FLUSH_JOB_DURATION" character varying(255) NOT NULL,
    "INTERVAL_FREQUENCY" integer DEFAULT 0 NOT NULL,
    "INTERVAL_TIME_UNIT" character varying(255) NOT NULL,
    "MODE" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "REAPER_JOB_DURATION" character varying(255) NOT NULL,
    "RETENTION_PERIOD_DURATION" character varying(255) NOT NULL,
    "SETTINGS_RELOAD_JOB_DURATION" character varying(255) NOT NULL
);


ALTER TABLE public."AO_AC3877_SYSTEM_RL_SETTINGS" OWNER TO jira;

--
-- Name: AO_AC3877_USER_RL_SETTINGS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_AC3877_USER_RL_SETTINGS" (
    "CAPACITY" integer DEFAULT 0 NOT NULL,
    "FILL_RATE" integer DEFAULT 0 NOT NULL,
    "INTERVAL_FREQUENCY" integer DEFAULT 0 NOT NULL,
    "INTERVAL_TIME_UNIT" character varying(255) NOT NULL,
    "USER_ID" character varying(255) NOT NULL,
    "WHITELISTED" boolean NOT NULL
);


ALTER TABLE public."AO_AC3877_USER_RL_SETTINGS" OWNER TO jira;

--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_B9A0F0_APPLIED_TEMPLATE" (
    "ID" integer NOT NULL,
    "PROJECT_ID" bigint DEFAULT 0,
    "PROJECT_TEMPLATE_MODULE_KEY" character varying(255),
    "PROJECT_TEMPLATE_WEB_ITEM_KEY" character varying(255)
);


ALTER TABLE public."AO_B9A0F0_APPLIED_TEMPLATE" OWNER TO jira;

--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_B9A0F0_APPLIED_TEMPLATE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_B9A0F0_APPLIED_TEMPLATE_ID_seq" OWNER TO jira;

--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_B9A0F0_APPLIED_TEMPLATE_ID_seq" OWNED BY public."AO_B9A0F0_APPLIED_TEMPLATE"."ID";


--
-- Name: AO_C16815_ALERT_AO; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_C16815_ALERT_AO" (
    "CREATED_DATE" bigint DEFAULT 0,
    "DETAILS_JSON" text,
    "ID" bigint NOT NULL,
    "ISSUE_COMPONENT_ID" character varying(255),
    "ISSUE_ID" character varying(255),
    "ISSUE_SEVERITY" integer DEFAULT 0,
    "NODE_NAME" character varying(255),
    "TRIGGER_MODULE" character varying(255),
    "TRIGGER_PLUGIN_KEY" character varying(255),
    "TRIGGER_PLUGIN_KEY_VERSION" character varying(255),
    "TRIGGER_PLUGIN_VERSION" character varying(255)
);


ALTER TABLE public."AO_C16815_ALERT_AO" OWNER TO jira;

--
-- Name: AO_C16815_ALERT_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_C16815_ALERT_AO_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C16815_ALERT_AO_ID_seq" OWNER TO jira;

--
-- Name: AO_C16815_ALERT_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_C16815_ALERT_AO_ID_seq" OWNED BY public."AO_C16815_ALERT_AO"."ID";


--
-- Name: AO_C77861_AUDIT_ENTITY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_C77861_AUDIT_ENTITY" (
    "ACTION" character varying(255) NOT NULL,
    "ACTION_T_KEY" character varying(255),
    "AREA" character varying(255) NOT NULL,
    "ATTRIBUTES" text,
    "CATEGORY" character varying(255),
    "CATEGORY_T_KEY" character varying(255),
    "CHANGE_VALUES" text,
    "ENTITY_TIMESTAMP" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "LEVEL" character varying(255) NOT NULL,
    "METHOD" character varying(255),
    "NODE" character varying(255),
    "PRIMARY_RESOURCE_ID" character varying(255),
    "PRIMARY_RESOURCE_TYPE" character varying(255),
    "RESOURCES" text,
    "RESOURCE_ID_3" character varying(255),
    "RESOURCE_ID_4" character varying(255),
    "RESOURCE_ID_5" character varying(255),
    "RESOURCE_TYPE_3" character varying(255),
    "RESOURCE_TYPE_4" character varying(255),
    "RESOURCE_TYPE_5" character varying(255),
    "SEARCH_STRING" text,
    "SECONDARY_RESOURCE_ID" character varying(255),
    "SECONDARY_RESOURCE_TYPE" character varying(255),
    "SOURCE" character varying(255),
    "SYSTEM_INFO" character varying(255),
    "USER_ID" character varying(255),
    "USER_NAME" character varying(255),
    "USER_TYPE" character varying(255)
);


ALTER TABLE public."AO_C77861_AUDIT_ENTITY" OWNER TO jira;

--
-- Name: AO_C77861_AUDIT_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_C77861_AUDIT_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C77861_AUDIT_ENTITY_ID_seq" OWNER TO jira;

--
-- Name: AO_C77861_AUDIT_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_C77861_AUDIT_ENTITY_ID_seq" OWNED BY public."AO_C77861_AUDIT_ENTITY"."ID";


--
-- Name: AO_CFF990_AOTRANSITION_FAILURE; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_CFF990_AOTRANSITION_FAILURE" (
    "ERROR_MESSAGES" text,
    "FAILURE_TIME" timestamp without time zone,
    "ID" integer NOT NULL,
    "ISSUE_ID" bigint DEFAULT 0,
    "LOG_REFERRAL_HASH" character varying(255),
    "TRANSITION_ID" bigint DEFAULT 0,
    "TRIGGER_ID" bigint DEFAULT 0,
    "USER_KEY" character varying(255),
    "WORKFLOW_ID" character varying(255)
);


ALTER TABLE public."AO_CFF990_AOTRANSITION_FAILURE" OWNER TO jira;

--
-- Name: AO_CFF990_AOTRANSITION_FAILURE_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_CFF990_AOTRANSITION_FAILURE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_CFF990_AOTRANSITION_FAILURE_ID_seq" OWNER TO jira;

--
-- Name: AO_CFF990_AOTRANSITION_FAILURE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_CFF990_AOTRANSITION_FAILURE_ID_seq" OWNED BY public."AO_CFF990_AOTRANSITION_FAILURE"."ID";


--
-- Name: AO_E8B6CC_BRANCH; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_BRANCH" (
    "ID" integer NOT NULL,
    "NAME" character varying(255),
    "REPOSITORY_ID" integer
);


ALTER TABLE public."AO_E8B6CC_BRANCH" OWNER TO jira;

--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_BRANCH_HEAD_MAPPING" (
    "BRANCH_NAME" character varying(255),
    "HEAD" character varying(255),
    "ID" integer NOT NULL,
    "REPOSITORY_ID" integer
);


ALTER TABLE public."AO_E8B6CC_BRANCH_HEAD_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_BRANCH_HEAD_MAPPING"."ID";


--
-- Name: AO_E8B6CC_BRANCH_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_BRANCH_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_BRANCH_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_BRANCH_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_BRANCH_ID_seq" OWNED BY public."AO_E8B6CC_BRANCH"."ID";


--
-- Name: AO_E8B6CC_CHANGESET_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_CHANGESET_MAPPING" (
    "AUTHOR" character varying(255),
    "AUTHOR_EMAIL" character varying(255),
    "BRANCH" character varying(255),
    "DATE" timestamp without time zone,
    "FILES_DATA" text,
    "FILE_COUNT" integer DEFAULT 0,
    "FILE_DETAILS_JSON" text,
    "ID" integer NOT NULL,
    "ISSUE_KEY" character varying(255),
    "MESSAGE" text,
    "NODE" character varying(255),
    "PARENTS_DATA" character varying(255),
    "PROJECT_KEY" character varying(255),
    "RAW_AUTHOR" character varying(255),
    "RAW_NODE" character varying(255),
    "REPOSITORY_ID" integer DEFAULT 0,
    "SMARTCOMMIT_AVAILABLE" boolean,
    "VERSION" integer
);


ALTER TABLE public."AO_E8B6CC_CHANGESET_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_CHANGESET_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_CHANGESET_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_CHANGESET_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_CHANGESET_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_CHANGESET_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_CHANGESET_MAPPING"."ID";


--
-- Name: AO_E8B6CC_COMMIT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_COMMIT" (
    "AUTHOR" character varying(255),
    "AUTHOR_AVATAR_URL" character varying(255),
    "DATE" timestamp without time zone NOT NULL,
    "DOMAIN_ID" integer DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "MERGE" boolean,
    "MESSAGE" text,
    "NODE" character varying(255),
    "RAW_AUTHOR" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_COMMIT" OWNER TO jira;

--
-- Name: AO_E8B6CC_COMMIT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_COMMIT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_COMMIT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_COMMIT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_COMMIT_ID_seq" OWNED BY public."AO_E8B6CC_COMMIT"."ID";


--
-- Name: AO_E8B6CC_GIT_HUB_EVENT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_GIT_HUB_EVENT" (
    "CREATED_AT" timestamp without time zone NOT NULL,
    "GIT_HUB_ID" character varying(255) DEFAULT '0'::character varying NOT NULL,
    "ID" integer NOT NULL,
    "REPOSITORY_ID" integer NOT NULL,
    "SAVE_POINT" boolean
);


ALTER TABLE public."AO_E8B6CC_GIT_HUB_EVENT" OWNER TO jira;

--
-- Name: AO_E8B6CC_GIT_HUB_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_GIT_HUB_EVENT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_GIT_HUB_EVENT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_GIT_HUB_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_GIT_HUB_EVENT_ID_seq" OWNED BY public."AO_E8B6CC_GIT_HUB_EVENT"."ID";


--
-- Name: AO_E8B6CC_ISSUE_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ISSUE_MAPPING" (
    "ID" integer NOT NULL,
    "ISSUE_ID" character varying(255),
    "NODE" character varying(255),
    "PROJECT_KEY" character varying(255),
    "REPOSITORY_URI" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_ISSUE_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ISSUE_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ISSUE_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ISSUE_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_ISSUE_MAPPING"."ID";


--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ISSUE_MAPPING_V2" (
    "AUTHOR" character varying(255),
    "BRANCH" character varying(255),
    "DATE" timestamp without time zone,
    "FILES_DATA" text,
    "ID" integer NOT NULL,
    "ISSUE_ID" character varying(255),
    "MESSAGE" text,
    "NODE" character varying(255),
    "PARENTS_DATA" character varying(255),
    "RAW_AUTHOR" character varying(255),
    "RAW_NODE" character varying(255),
    "REPOSITORY_ID" integer DEFAULT 0,
    "VERSION" integer
);


ALTER TABLE public."AO_E8B6CC_ISSUE_MAPPING_V2" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq" OWNED BY public."AO_E8B6CC_ISSUE_MAPPING_V2"."ID";


--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ISSUE_TO_BRANCH" (
    "BRANCH_ID" integer,
    "ID" integer NOT NULL,
    "ISSUE_KEY" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_ISSUE_TO_BRANCH" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq" OWNED BY public."AO_E8B6CC_ISSUE_TO_BRANCH"."ID";


--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ISSUE_TO_CHANGESET" (
    "CHANGESET_ID" integer,
    "ID" integer NOT NULL,
    "ISSUE_KEY" character varying(255),
    "PROJECT_KEY" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_ISSUE_TO_CHANGESET" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq" OWNED BY public."AO_E8B6CC_ISSUE_TO_CHANGESET"."ID";


--
-- Name: AO_E8B6CC_MESSAGE; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_MESSAGE" (
    "ADDRESS" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "PAYLOAD" text NOT NULL,
    "PAYLOAD_TYPE" character varying(255) NOT NULL,
    "PRIORITY" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."AO_E8B6CC_MESSAGE" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_MESSAGE_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_MESSAGE_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_MESSAGE_ID_seq" OWNED BY public."AO_E8B6CC_MESSAGE"."ID";


--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" (
    "ID" integer NOT NULL,
    "LAST_FAILED" timestamp without time zone,
    "MESSAGE_ID" integer NOT NULL,
    "QUEUE" character varying(255) NOT NULL,
    "RETRIES_COUNT" integer DEFAULT 0 NOT NULL,
    "STATE" character varying(255) NOT NULL,
    "STATE_INFO" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq" OWNED BY public."AO_E8B6CC_MESSAGE_QUEUE_ITEM"."ID";


--
-- Name: AO_E8B6CC_MESSAGE_TAG; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_MESSAGE_TAG" (
    "ID" integer NOT NULL,
    "MESSAGE_ID" integer,
    "TAG" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_MESSAGE_TAG" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_TAG_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_MESSAGE_TAG_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_MESSAGE_TAG_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_MESSAGE_TAG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_MESSAGE_TAG_ID_seq" OWNED BY public."AO_E8B6CC_MESSAGE_TAG"."ID";


--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ORGANIZATION_MAPPING" (
    "ACCESS_TOKEN" character varying(255),
    "ADMIN_PASSWORD" character varying(255),
    "ADMIN_USERNAME" character varying(255),
    "APPROVAL_STATE" character varying(255),
    "AUTOLINK_NEW_REPOS" boolean,
    "DEFAULT_GROUPS_SLUGS" character varying(255),
    "DVCS_TYPE" character varying(255),
    "HOST_URL" character varying(255),
    "ID" integer NOT NULL,
    "LAST_POLLED" bigint,
    "NAME" character varying(255),
    "OAUTH_KEY" character varying(255),
    "OAUTH_SECRET" character varying(255),
    "PRINCIPAL_ID" character varying(255),
    "SMARTCOMMITS_FOR_NEW_REPOS" boolean
);


ALTER TABLE public."AO_E8B6CC_ORGANIZATION_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_ORGANIZATION_MAPPING"."ID";


--
-- Name: AO_E8B6CC_ORG_TO_PROJECT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_ORG_TO_PROJECT" (
    "ID" integer NOT NULL,
    "ORGANIZATION_ID" integer,
    "PROJECT_KEY" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_ORG_TO_PROJECT" OWNER TO jira;

--
-- Name: AO_E8B6CC_ORG_TO_PROJECT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_ORG_TO_PROJECT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_ORG_TO_PROJECT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_ORG_TO_PROJECT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_ORG_TO_PROJECT_ID_seq" OWNED BY public."AO_E8B6CC_ORG_TO_PROJECT"."ID";


--
-- Name: AO_E8B6CC_PROJECT_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PROJECT_MAPPING" (
    "ID" integer NOT NULL,
    "PASSWORD" character varying(255),
    "PROJECT_KEY" character varying(255),
    "REPOSITORY_URI" character varying(255),
    "USERNAME" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_PROJECT_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_PROJECT_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PROJECT_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PROJECT_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PROJECT_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PROJECT_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_PROJECT_MAPPING"."ID";


--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PROJECT_MAPPING_V2" (
    "ACCESS_TOKEN" character varying(255),
    "ADMIN_PASSWORD" character varying(255),
    "ADMIN_USERNAME" character varying(255),
    "ID" integer NOT NULL,
    "LAST_COMMIT_DATE" timestamp without time zone,
    "PROJECT_KEY" character varying(255),
    "REPOSITORY_NAME" character varying(255),
    "REPOSITORY_TYPE" character varying(255),
    "REPOSITORY_URL" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_PROJECT_MAPPING_V2" OWNER TO jira;

--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq" OWNED BY public."AO_E8B6CC_PROJECT_MAPPING_V2"."ID";


--
-- Name: AO_E8B6CC_PR_ISSUE_KEY; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PR_ISSUE_KEY" (
    "DOMAIN_ID" integer DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "ISSUE_KEY" character varying(255),
    "PULL_REQUEST_ID" integer DEFAULT 0
);


ALTER TABLE public."AO_E8B6CC_PR_ISSUE_KEY" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_ISSUE_KEY_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PR_ISSUE_KEY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PR_ISSUE_KEY_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_ISSUE_KEY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PR_ISSUE_KEY_ID_seq" OWNED BY public."AO_E8B6CC_PR_ISSUE_KEY"."ID";


--
-- Name: AO_E8B6CC_PR_PARTICIPANT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PR_PARTICIPANT" (
    "APPROVED" boolean,
    "DOMAIN_ID" integer DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "PULL_REQUEST_ID" integer,
    "ROLE" character varying(255),
    "USERNAME" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_PR_PARTICIPANT" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_PARTICIPANT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PR_PARTICIPANT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PR_PARTICIPANT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_PARTICIPANT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PR_PARTICIPANT_ID_seq" OWNED BY public."AO_E8B6CC_PR_PARTICIPANT"."ID";


--
-- Name: AO_E8B6CC_PR_TO_COMMIT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PR_TO_COMMIT" (
    "COMMIT_ID" integer NOT NULL,
    "DOMAIN_ID" integer DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "REQUEST_ID" integer NOT NULL
);


ALTER TABLE public."AO_E8B6CC_PR_TO_COMMIT" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_TO_COMMIT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PR_TO_COMMIT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PR_TO_COMMIT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PR_TO_COMMIT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PR_TO_COMMIT_ID_seq" OWNED BY public."AO_E8B6CC_PR_TO_COMMIT"."ID";


--
-- Name: AO_E8B6CC_PULL_REQUEST; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_PULL_REQUEST" (
    "AUTHOR" character varying(255),
    "COMMENT_COUNT" integer DEFAULT 0,
    "CREATED_ON" timestamp without time zone,
    "DESTINATION_BRANCH" character varying(255),
    "DOMAIN_ID" integer DEFAULT 0 NOT NULL,
    "EXECUTED_BY" character varying(255),
    "ID" integer NOT NULL,
    "LAST_STATUS" character varying(255),
    "NAME" character varying(255),
    "REMOTE_ID" bigint,
    "SOURCE_BRANCH" character varying(255),
    "SOURCE_REPO" character varying(255),
    "TO_REPOSITORY_ID" integer DEFAULT 0,
    "UPDATED_ON" timestamp without time zone,
    "URL" character varying(255)
);


ALTER TABLE public."AO_E8B6CC_PULL_REQUEST" OWNER TO jira;

--
-- Name: AO_E8B6CC_PULL_REQUEST_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_PULL_REQUEST_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_PULL_REQUEST_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_PULL_REQUEST_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_PULL_REQUEST_ID_seq" OWNED BY public."AO_E8B6CC_PULL_REQUEST"."ID";


--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_REPOSITORY_MAPPING" (
    "ACTIVITY_LAST_SYNC" timestamp without time zone,
    "DELETED" boolean,
    "FORK" boolean,
    "FORK_OF_NAME" character varying(255),
    "FORK_OF_OWNER" character varying(255),
    "FORK_OF_SLUG" character varying(255),
    "ID" integer NOT NULL,
    "LAST_CHANGESET_NODE" character varying(255),
    "LAST_COMMIT_DATE" timestamp without time zone,
    "LINKED" boolean,
    "LOGO" text,
    "NAME" character varying(255),
    "ORGANIZATION_ID" integer DEFAULT 0,
    "SLUG" character varying(255),
    "SMARTCOMMITS_ENABLED" boolean,
    "UPDATE_LINK_AUTHORISED" boolean
);


ALTER TABLE public."AO_E8B6CC_REPOSITORY_MAPPING" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_REPOSITORY_MAPPING_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_REPOSITORY_MAPPING_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_REPOSITORY_MAPPING_ID_seq" OWNED BY public."AO_E8B6CC_REPOSITORY_MAPPING"."ID";


--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_REPO_TO_CHANGESET" (
    "CHANGESET_ID" integer,
    "ID" integer NOT NULL,
    "REPOSITORY_ID" integer
);


ALTER TABLE public."AO_E8B6CC_REPO_TO_CHANGESET" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_REPO_TO_CHANGESET_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_REPO_TO_CHANGESET_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_REPO_TO_CHANGESET_ID_seq" OWNED BY public."AO_E8B6CC_REPO_TO_CHANGESET"."ID";


--
-- Name: AO_E8B6CC_REPO_TO_PROJECT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_REPO_TO_PROJECT" (
    "ID" integer NOT NULL,
    "PROJECT_KEY" character varying(255),
    "REPOSITORY_ID" integer
);


ALTER TABLE public."AO_E8B6CC_REPO_TO_PROJECT" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPO_TO_PROJECT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_REPO_TO_PROJECT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_REPO_TO_PROJECT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_REPO_TO_PROJECT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_REPO_TO_PROJECT_ID_seq" OWNED BY public."AO_E8B6CC_REPO_TO_PROJECT"."ID";


--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_SYNC_AUDIT_LOG" (
    "END_DATE" timestamp without time zone,
    "EXC_TRACE" text,
    "FIRST_REQUEST_DATE" timestamp without time zone,
    "FLIGHT_TIME_MS" integer DEFAULT 0,
    "ID" integer NOT NULL,
    "NUM_REQUESTS" integer DEFAULT 0,
    "REPO_ID" integer DEFAULT 0,
    "START_DATE" timestamp without time zone,
    "SYNC_STATUS" character varying(255),
    "SYNC_TYPE" character varying(255),
    "TOTAL_ERRORS" integer DEFAULT 0
);


ALTER TABLE public."AO_E8B6CC_SYNC_AUDIT_LOG" OWNER TO jira;

--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq" OWNED BY public."AO_E8B6CC_SYNC_AUDIT_LOG"."ID";


--
-- Name: AO_E8B6CC_SYNC_EVENT; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_E8B6CC_SYNC_EVENT" (
    "EVENT_CLASS" text NOT NULL,
    "EVENT_DATE" timestamp without time zone NOT NULL,
    "EVENT_JSON" text NOT NULL,
    "ID" integer NOT NULL,
    "REPO_ID" integer DEFAULT 0 NOT NULL,
    "SCHEDULED_SYNC" boolean
);


ALTER TABLE public."AO_E8B6CC_SYNC_EVENT" OWNER TO jira;

--
-- Name: AO_E8B6CC_SYNC_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_E8B6CC_SYNC_EVENT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_E8B6CC_SYNC_EVENT_ID_seq" OWNER TO jira;

--
-- Name: AO_E8B6CC_SYNC_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_E8B6CC_SYNC_EVENT_ID_seq" OWNED BY public."AO_E8B6CC_SYNC_EVENT"."ID";


--
-- Name: AO_ED669C_SEEN_ASSERTIONS; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public."AO_ED669C_SEEN_ASSERTIONS" (
    "ASSERTION_ID" character varying(255) NOT NULL,
    "EXPIRY_TIMESTAMP" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_ED669C_SEEN_ASSERTIONS" OWNER TO jira;

--
-- Name: AO_ED669C_SEEN_ASSERTIONS_ID_seq; Type: SEQUENCE; Schema: public; Owner: jira
--

CREATE SEQUENCE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq" OWNER TO jira;

--
-- Name: AO_ED669C_SEEN_ASSERTIONS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jira
--

ALTER SEQUENCE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq" OWNED BY public."AO_ED669C_SEEN_ASSERTIONS"."ID";


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.app_user (
    id numeric(18,0) NOT NULL,
    user_key character varying(255),
    lower_user_name character varying(255)
);


ALTER TABLE public.app_user OWNER TO jira;

--
-- Name: audit_changed_value; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.audit_changed_value (
    id numeric(18,0) NOT NULL,
    log_id numeric(18,0),
    name character varying(255),
    delta_from text,
    delta_to text
);


ALTER TABLE public.audit_changed_value OWNER TO jira;

--
-- Name: audit_item; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.audit_item (
    id numeric(18,0) NOT NULL,
    log_id numeric(18,0),
    object_type character varying(60),
    object_id character varying(255),
    object_name character varying(255),
    object_parent_id character varying(255),
    object_parent_name character varying(255)
);


ALTER TABLE public.audit_item OWNER TO jira;

--
-- Name: audit_log; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.audit_log (
    id numeric(18,0) NOT NULL,
    remote_address character varying(60),
    created timestamp with time zone,
    author_key character varying(255),
    summary character varying(255),
    category character varying(255),
    object_type character varying(60),
    object_id character varying(255),
    object_name character varying(255),
    object_parent_id character varying(255),
    object_parent_name character varying(255),
    author_type numeric(9,0),
    event_source_name character varying(255),
    description character varying(255),
    long_description text,
    search_field text
);


ALTER TABLE public.audit_log OWNER TO jira;

--
-- Name: avatar; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.avatar (
    id numeric(18,0) NOT NULL,
    filename character varying(255),
    contenttype character varying(255),
    avatartype character varying(60),
    owner character varying(255),
    systemavatar numeric(9,0)
);


ALTER TABLE public.avatar OWNER TO jira;

--
-- Name: board; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.board (
    id numeric(18,0) NOT NULL,
    jql text
);


ALTER TABLE public.board OWNER TO jira;

--
-- Name: boardproject; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.boardproject (
    board_id numeric(18,0) NOT NULL,
    project_id numeric(18,0) NOT NULL
);


ALTER TABLE public.boardproject OWNER TO jira;

--
-- Name: changegroup; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.changegroup (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    author character varying(255),
    created timestamp with time zone
);


ALTER TABLE public.changegroup OWNER TO jira;

--
-- Name: changeitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.changeitem (
    id numeric(18,0) NOT NULL,
    groupid numeric(18,0),
    fieldtype character varying(255),
    field character varying(255),
    oldvalue text,
    oldstring text,
    newvalue text,
    newstring text
);


ALTER TABLE public.changeitem OWNER TO jira;

--
-- Name: clusteredjob; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clusteredjob (
    id numeric(18,0) NOT NULL,
    job_id character varying(255),
    job_runner_key character varying(255),
    sched_type character(1),
    interval_millis numeric(18,0),
    first_run numeric(18,0),
    cron_expression character varying(255),
    time_zone character varying(60),
    next_run numeric(18,0),
    version numeric(18,0),
    parameters bytea
);


ALTER TABLE public.clusteredjob OWNER TO jira;

--
-- Name: clusterlockstatus; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clusterlockstatus (
    id numeric(18,0) NOT NULL,
    lock_name character varying(255),
    locked_by_node character varying(60),
    update_time numeric(18,0)
);


ALTER TABLE public.clusterlockstatus OWNER TO jira;

--
-- Name: clustermessage; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clustermessage (
    id numeric(18,0) NOT NULL,
    source_node character varying(60),
    destination_node character varying(60),
    claimed_by_node character varying(60),
    message character varying(255),
    message_time timestamp with time zone
);


ALTER TABLE public.clustermessage OWNER TO jira;

--
-- Name: clusternode; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clusternode (
    node_id character varying(60) NOT NULL,
    node_state character varying(60),
    "timestamp" numeric(18,0),
    ip character varying(60),
    cache_listener_port numeric(18,0),
    node_build_number numeric(18,0),
    node_version character varying(60)
);


ALTER TABLE public.clusternode OWNER TO jira;

--
-- Name: clusternodeheartbeat; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clusternodeheartbeat (
    node_id character varying(60) NOT NULL,
    heartbeat_time numeric(18,0),
    database_time numeric(18,0)
);


ALTER TABLE public.clusternodeheartbeat OWNER TO jira;

--
-- Name: clusterupgradestate; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.clusterupgradestate (
    id numeric(18,0) NOT NULL,
    database_time numeric(18,0),
    cluster_build_number numeric(18,0),
    cluster_version character varying(60),
    state character varying(60),
    order_number numeric(18,0)
);


ALTER TABLE public.clusterupgradestate OWNER TO jira;

--
-- Name: columnlayout; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.columnlayout (
    id numeric(18,0) NOT NULL,
    username character varying(255),
    searchrequest numeric(18,0)
);


ALTER TABLE public.columnlayout OWNER TO jira;

--
-- Name: columnlayoutitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.columnlayoutitem (
    id numeric(18,0) NOT NULL,
    columnlayout numeric(18,0),
    fieldidentifier character varying(255),
    horizontalposition numeric(18,0)
);


ALTER TABLE public.columnlayoutitem OWNER TO jira;

--
-- Name: comment_version; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.comment_version (
    comment_id numeric(18,0) NOT NULL,
    parent_issue_id numeric(18,0),
    update_time timestamp with time zone,
    index_version numeric(18,0),
    deleted character(1)
);


ALTER TABLE public.comment_version OWNER TO jira;

--
-- Name: component; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.component (
    id numeric(18,0) NOT NULL,
    project numeric(18,0),
    cname character varying(255),
    description text,
    url character varying(255),
    lead character varying(255),
    assigneetype numeric(18,0),
    archived character varying(10)
);


ALTER TABLE public.component OWNER TO jira;

--
-- Name: configurationcontext; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.configurationcontext (
    id numeric(18,0) NOT NULL,
    projectcategory numeric(18,0),
    project numeric(18,0),
    customfield character varying(255),
    fieldconfigscheme numeric(18,0)
);


ALTER TABLE public.configurationcontext OWNER TO jira;

--
-- Name: customfield; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.customfield (
    id numeric(18,0) NOT NULL,
    cfkey character varying(255),
    customfieldtypekey character varying(255),
    customfieldsearcherkey character varying(255),
    cfname character varying(255),
    description text,
    defaultvalue character varying(255),
    fieldtype numeric(18,0),
    project numeric(18,0),
    issuetype character varying(255)
);


ALTER TABLE public.customfield OWNER TO jira;

--
-- Name: customfieldoption; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.customfieldoption (
    id numeric(18,0) NOT NULL,
    customfield numeric(18,0),
    customfieldconfig numeric(18,0),
    parentoptionid numeric(18,0),
    sequence numeric(18,0),
    customvalue character varying(255),
    optiontype character varying(60),
    disabled character varying(60)
);


ALTER TABLE public.customfieldoption OWNER TO jira;

--
-- Name: customfieldvalue; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.customfieldvalue (
    id numeric(18,0) NOT NULL,
    issue numeric(18,0),
    customfield numeric(18,0),
    updated numeric(18,0),
    parentkey character varying(255),
    stringvalue character varying(255),
    numbervalue double precision,
    textvalue text,
    datevalue timestamp with time zone,
    valuetype character varying(255)
);


ALTER TABLE public.customfieldvalue OWNER TO jira;

--
-- Name: cwd_application; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_application (
    id numeric(18,0) NOT NULL,
    application_name character varying(255),
    lower_application_name character varying(255),
    created_date timestamp with time zone,
    updated_date timestamp with time zone,
    active numeric(9,0),
    description character varying(255),
    application_type character varying(255),
    credential character varying(255)
);


ALTER TABLE public.cwd_application OWNER TO jira;

--
-- Name: cwd_application_address; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_application_address (
    application_id numeric(18,0) NOT NULL,
    remote_address character varying(255) NOT NULL,
    encoded_address_binary character varying(255),
    remote_address_mask numeric(9,0)
);


ALTER TABLE public.cwd_application_address OWNER TO jira;

--
-- Name: cwd_directory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_directory (
    id numeric(18,0) NOT NULL,
    directory_name character varying(255),
    lower_directory_name character varying(255),
    created_date timestamp with time zone,
    updated_date timestamp with time zone,
    active numeric(9,0),
    description character varying(255),
    impl_class character varying(255),
    lower_impl_class character varying(255),
    directory_type character varying(60),
    directory_position numeric(18,0)
);


ALTER TABLE public.cwd_directory OWNER TO jira;

--
-- Name: cwd_directory_attribute; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_directory_attribute (
    directory_id numeric(18,0) NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_value text
);


ALTER TABLE public.cwd_directory_attribute OWNER TO jira;

--
-- Name: cwd_directory_operation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_directory_operation (
    directory_id numeric(18,0) NOT NULL,
    operation_type character varying(60) NOT NULL
);


ALTER TABLE public.cwd_directory_operation OWNER TO jira;

--
-- Name: cwd_group; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_group (
    id numeric(18,0) NOT NULL,
    group_name character varying(255),
    lower_group_name character varying(255),
    active numeric(9,0),
    local numeric(9,0),
    created_date timestamp with time zone,
    updated_date timestamp with time zone,
    description character varying(255),
    lower_description character varying(255),
    group_type character varying(60),
    directory_id numeric(18,0),
    external_id character varying(255)
);


ALTER TABLE public.cwd_group OWNER TO jira;

--
-- Name: cwd_group_attributes; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_group_attributes (
    id numeric(18,0) NOT NULL,
    group_id numeric(18,0),
    directory_id numeric(18,0),
    attribute_name character varying(255),
    attribute_value character varying(255),
    lower_attribute_value character varying(255)
);


ALTER TABLE public.cwd_group_attributes OWNER TO jira;

--
-- Name: cwd_membership; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_membership (
    id numeric(18,0) NOT NULL,
    parent_id numeric(18,0),
    child_id numeric(18,0),
    membership_type character varying(60),
    group_type character varying(60),
    parent_name character varying(255),
    lower_parent_name character varying(255),
    child_name character varying(255),
    lower_child_name character varying(255),
    directory_id numeric(18,0)
);


ALTER TABLE public.cwd_membership OWNER TO jira;

--
-- Name: cwd_synchronisation_status; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_synchronisation_status (
    id numeric(18,0) NOT NULL,
    directory_id numeric(18,0),
    node_id character varying(60),
    sync_start numeric(18,0),
    sync_end numeric(18,0),
    sync_status character varying(60),
    status_parameters text
);


ALTER TABLE public.cwd_synchronisation_status OWNER TO jira;

--
-- Name: cwd_synchronisation_token; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_synchronisation_token (
    directory_id numeric(18,0) NOT NULL,
    sync_status_token text
);


ALTER TABLE public.cwd_synchronisation_token OWNER TO jira;

--
-- Name: cwd_user; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_user (
    id numeric(18,0) NOT NULL,
    directory_id numeric(18,0),
    user_name character varying(255),
    lower_user_name character varying(255),
    active numeric(9,0),
    created_date timestamp with time zone,
    updated_date timestamp with time zone,
    first_name character varying(255),
    lower_first_name character varying(255),
    last_name character varying(255),
    lower_last_name character varying(255),
    display_name character varying(255),
    lower_display_name character varying(255),
    email_address character varying(255),
    lower_email_address character varying(255),
    credential character varying(255),
    deleted_externally numeric(9,0),
    external_id character varying(255)
);


ALTER TABLE public.cwd_user OWNER TO jira;

--
-- Name: cwd_user_attributes; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.cwd_user_attributes (
    id numeric(18,0) NOT NULL,
    user_id numeric(18,0),
    directory_id numeric(18,0),
    attribute_name character varying(255),
    attribute_value character varying(255),
    lower_attribute_value character varying(255)
);


ALTER TABLE public.cwd_user_attributes OWNER TO jira;

--
-- Name: deadletter; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.deadletter (
    id numeric(18,0) NOT NULL,
    message_id character varying(255),
    last_seen numeric(18,0),
    mail_server_id numeric(18,0),
    folder_name character varying(255)
);


ALTER TABLE public.deadletter OWNER TO jira;

--
-- Name: draftworkflowscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.draftworkflowscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text,
    workflow_scheme_id numeric(18,0),
    last_modified_date timestamp with time zone,
    last_modified_user character varying(255)
);


ALTER TABLE public.draftworkflowscheme OWNER TO jira;

--
-- Name: draftworkflowschemeentity; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.draftworkflowschemeentity (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    workflow character varying(255),
    issuetype character varying(255)
);


ALTER TABLE public.draftworkflowschemeentity OWNER TO jira;

--
-- Name: entity_property; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.entity_property (
    id numeric(18,0) NOT NULL,
    entity_name character varying(255),
    entity_id numeric(18,0),
    property_key character varying(255),
    created timestamp with time zone,
    updated timestamp with time zone,
    json_value text
);


ALTER TABLE public.entity_property OWNER TO jira;

--
-- Name: entity_property_index_document; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.entity_property_index_document (
    id numeric(18,0) NOT NULL,
    plugin_key character varying(255),
    module_key character varying(255),
    entity_key character varying(255),
    updated timestamp with time zone,
    document text
);


ALTER TABLE public.entity_property_index_document OWNER TO jira;

--
-- Name: entity_translation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.entity_translation (
    id numeric(18,0) NOT NULL,
    entity_name character varying(255),
    entity_id numeric(18,0),
    locale character varying(60),
    trans_name character varying(255),
    trans_desc character varying(255)
);


ALTER TABLE public.entity_translation OWNER TO jira;

--
-- Name: external_entities; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.external_entities (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    entitytype character varying(255)
);


ALTER TABLE public.external_entities OWNER TO jira;

--
-- Name: externalgadget; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.externalgadget (
    id numeric(18,0) NOT NULL,
    gadget_xml text
);


ALTER TABLE public.externalgadget OWNER TO jira;

--
-- Name: favouriteassociations; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.favouriteassociations (
    id numeric(18,0) NOT NULL,
    username character varying(255),
    entitytype character varying(60),
    entityid numeric(18,0),
    sequence numeric(18,0)
);


ALTER TABLE public.favouriteassociations OWNER TO jira;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.feature (
    id numeric(18,0) NOT NULL,
    feature_name character varying(255),
    feature_type character varying(10),
    user_key character varying(255)
);


ALTER TABLE public.feature OWNER TO jira;

--
-- Name: fieldconfigscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldconfigscheme (
    id numeric(18,0) NOT NULL,
    configname character varying(255),
    description text,
    fieldid character varying(60),
    customfield numeric(18,0)
);


ALTER TABLE public.fieldconfigscheme OWNER TO jira;

--
-- Name: fieldconfigschemeissuetype; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldconfigschemeissuetype (
    id numeric(18,0) NOT NULL,
    issuetype character varying(255),
    fieldconfigscheme numeric(18,0),
    fieldconfiguration numeric(18,0)
);


ALTER TABLE public.fieldconfigschemeissuetype OWNER TO jira;

--
-- Name: fieldconfiguration; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldconfiguration (
    id numeric(18,0) NOT NULL,
    configname character varying(255),
    description text,
    fieldid character varying(60),
    customfield numeric(18,0)
);


ALTER TABLE public.fieldconfiguration OWNER TO jira;

--
-- Name: fieldlayout; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldlayout (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description character varying(255),
    layout_type character varying(255),
    layoutscheme numeric(18,0)
);


ALTER TABLE public.fieldlayout OWNER TO jira;

--
-- Name: fieldlayoutitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldlayoutitem (
    id numeric(18,0) NOT NULL,
    fieldlayout numeric(18,0),
    fieldidentifier character varying(255),
    description text,
    verticalposition numeric(18,0),
    ishidden character varying(60),
    isrequired character varying(60),
    renderertype character varying(255)
);


ALTER TABLE public.fieldlayoutitem OWNER TO jira;

--
-- Name: fieldlayoutscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldlayoutscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.fieldlayoutscheme OWNER TO jira;

--
-- Name: fieldlayoutschemeassociation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldlayoutschemeassociation (
    id numeric(18,0) NOT NULL,
    issuetype character varying(255),
    project numeric(18,0),
    fieldlayoutscheme numeric(18,0)
);


ALTER TABLE public.fieldlayoutschemeassociation OWNER TO jira;

--
-- Name: fieldlayoutschemeentity; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldlayoutschemeentity (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    issuetype character varying(255),
    fieldlayout numeric(18,0)
);


ALTER TABLE public.fieldlayoutschemeentity OWNER TO jira;

--
-- Name: fieldscreen; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldscreen (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.fieldscreen OWNER TO jira;

--
-- Name: fieldscreenlayoutitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldscreenlayoutitem (
    id numeric(18,0) NOT NULL,
    fieldidentifier character varying(255),
    sequence numeric(18,0),
    fieldscreentab numeric(18,0)
);


ALTER TABLE public.fieldscreenlayoutitem OWNER TO jira;

--
-- Name: fieldscreenscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldscreenscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.fieldscreenscheme OWNER TO jira;

--
-- Name: fieldscreenschemeitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldscreenschemeitem (
    id numeric(18,0) NOT NULL,
    operation numeric(18,0),
    fieldscreen numeric(18,0),
    fieldscreenscheme numeric(18,0)
);


ALTER TABLE public.fieldscreenschemeitem OWNER TO jira;

--
-- Name: fieldscreentab; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fieldscreentab (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description character varying(255),
    sequence numeric(18,0),
    fieldscreen numeric(18,0)
);


ALTER TABLE public.fieldscreentab OWNER TO jira;

--
-- Name: fileattachment; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.fileattachment (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    mimetype character varying(255),
    filename character varying(255),
    created timestamp with time zone,
    filesize numeric(18,0),
    author character varying(255),
    zip numeric(9,0),
    thumbnailable numeric(9,0)
);


ALTER TABLE public.fileattachment OWNER TO jira;

--
-- Name: filtersubscription; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.filtersubscription (
    id numeric(18,0) NOT NULL,
    filter_i_d numeric(18,0),
    username character varying(60),
    groupname character varying(60),
    last_run timestamp with time zone,
    email_on_empty character varying(10)
);


ALTER TABLE public.filtersubscription OWNER TO jira;

--
-- Name: gadgetuserpreference; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.gadgetuserpreference (
    id numeric(18,0) NOT NULL,
    portletconfiguration numeric(18,0),
    userprefkey character varying(255),
    userprefvalue text
);


ALTER TABLE public.gadgetuserpreference OWNER TO jira;

--
-- Name: genericconfiguration; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.genericconfiguration (
    id numeric(18,0) NOT NULL,
    datatype character varying(60),
    datakey character varying(60),
    xmlvalue text
);


ALTER TABLE public.genericconfiguration OWNER TO jira;

--
-- Name: globalpermissionentry; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.globalpermissionentry (
    id numeric(18,0) NOT NULL,
    permission character varying(255),
    group_id character varying(255)
);


ALTER TABLE public.globalpermissionentry OWNER TO jira;

--
-- Name: groupbase; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.groupbase (
    id numeric(18,0) NOT NULL,
    groupname character varying(255)
);


ALTER TABLE public.groupbase OWNER TO jira;

--
-- Name: issue_field_option; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issue_field_option (
    id numeric(18,0) NOT NULL,
    option_id numeric(18,0),
    field_key character varying(255),
    option_value character varying(255),
    properties text
);


ALTER TABLE public.issue_field_option OWNER TO jira;

--
-- Name: issue_field_option_scope; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issue_field_option_scope (
    id numeric(18,0) NOT NULL,
    option_id numeric(18,0),
    entity_id character varying(255),
    scope_type character varying(255)
);


ALTER TABLE public.issue_field_option_scope OWNER TO jira;

--
-- Name: issue_version; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issue_version (
    issue_id numeric(18,0) NOT NULL,
    parent_issue_id numeric(18,0),
    update_time timestamp with time zone,
    index_version numeric(18,0),
    deleted character(1)
);


ALTER TABLE public.issue_version OWNER TO jira;

--
-- Name: issuelink; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuelink (
    id numeric(18,0) NOT NULL,
    linktype numeric(18,0),
    source numeric(18,0),
    destination numeric(18,0),
    sequence numeric(18,0)
);


ALTER TABLE public.issuelink OWNER TO jira;

--
-- Name: issuelinktype; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuelinktype (
    id numeric(18,0) NOT NULL,
    linkname character varying(255),
    inward character varying(255),
    outward character varying(255),
    pstyle character varying(60)
);


ALTER TABLE public.issuelinktype OWNER TO jira;

--
-- Name: issuesecurityscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuesecurityscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text,
    defaultlevel numeric(18,0)
);


ALTER TABLE public.issuesecurityscheme OWNER TO jira;

--
-- Name: issuestatus; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuestatus (
    id character varying(60) NOT NULL,
    sequence numeric(18,0),
    pname character varying(60),
    description text,
    iconurl character varying(255),
    statuscategory numeric(18,0)
);


ALTER TABLE public.issuestatus OWNER TO jira;

--
-- Name: issuetype; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuetype (
    id character varying(60) NOT NULL,
    sequence numeric(18,0),
    pname character varying(60),
    pstyle character varying(60),
    description text,
    iconurl character varying(255),
    avatar numeric(18,0)
);


ALTER TABLE public.issuetype OWNER TO jira;

--
-- Name: issuetypescreenscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuetypescreenscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.issuetypescreenscheme OWNER TO jira;

--
-- Name: issuetypescreenschemeentity; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.issuetypescreenschemeentity (
    id numeric(18,0) NOT NULL,
    issuetype character varying(255),
    scheme numeric(18,0),
    fieldscreenscheme numeric(18,0)
);


ALTER TABLE public.issuetypescreenschemeentity OWNER TO jira;

--
-- Name: jiraaction; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraaction (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    author character varying(255),
    actiontype character varying(255),
    actionlevel character varying(255),
    rolelevel numeric(18,0),
    actionbody text,
    created timestamp with time zone,
    updateauthor character varying(255),
    updated timestamp with time zone,
    actionnum numeric(18,0)
);


ALTER TABLE public.jiraaction OWNER TO jira;

--
-- Name: jiradraftworkflows; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiradraftworkflows (
    id numeric(18,0) NOT NULL,
    parentname character varying(255),
    descriptor text
);


ALTER TABLE public.jiradraftworkflows OWNER TO jira;

--
-- Name: jiraeventtype; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraeventtype (
    id numeric(18,0) NOT NULL,
    template_id numeric(18,0),
    name character varying(255),
    description text,
    event_type character varying(60)
);


ALTER TABLE public.jiraeventtype OWNER TO jira;

--
-- Name: jiraissue; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraissue (
    id numeric(18,0) NOT NULL,
    pkey character varying(255),
    issuenum numeric(18,0),
    project numeric(18,0),
    reporter character varying(255),
    assignee character varying(255),
    creator character varying(255),
    issuetype character varying(255),
    summary character varying(255),
    description text,
    environment text,
    priority character varying(255),
    resolution character varying(255),
    issuestatus character varying(255),
    created timestamp with time zone,
    updated timestamp with time zone,
    duedate timestamp with time zone,
    resolutiondate timestamp with time zone,
    votes numeric(18,0),
    watches numeric(18,0),
    timeoriginalestimate numeric(18,0),
    timeestimate numeric(18,0),
    timespent numeric(18,0),
    workflow_id numeric(18,0),
    security numeric(18,0),
    fixfor numeric(18,0),
    component numeric(18,0),
    archived character(1),
    archivedby character varying(255),
    archiveddate timestamp with time zone
);


ALTER TABLE public.jiraissue OWNER TO jira;

--
-- Name: jiraperms; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraperms (
    id numeric(18,0) NOT NULL,
    permtype numeric(18,0),
    projectid numeric(18,0),
    groupname character varying(255)
);


ALTER TABLE public.jiraperms OWNER TO jira;

--
-- Name: jiraworkflows; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraworkflows (
    id numeric(18,0) NOT NULL,
    workflowname character varying(255),
    creatorname character varying(255),
    descriptor text,
    islocked character varying(60)
);


ALTER TABLE public.jiraworkflows OWNER TO jira;

--
-- Name: jiraworkflowstatuses; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jiraworkflowstatuses (
    id numeric(18,0) NOT NULL,
    status character varying(255),
    parentname character varying(255)
);


ALTER TABLE public.jiraworkflowstatuses OWNER TO jira;

--
-- Name: jquartz_blob_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_blob_triggers (
    sched_name character varying(120),
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.jquartz_blob_triggers OWNER TO jira;

--
-- Name: jquartz_calendars; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_calendars (
    sched_name character varying(120),
    calendar_name character varying(200) NOT NULL,
    calendar bytea
);


ALTER TABLE public.jquartz_calendars OWNER TO jira;

--
-- Name: jquartz_cron_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_cron_triggers (
    sched_name character varying(120),
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120),
    time_zone_id character varying(80)
);


ALTER TABLE public.jquartz_cron_triggers OWNER TO jira;

--
-- Name: jquartz_fired_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_fired_triggers (
    sched_name character varying(120),
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200),
    trigger_group character varying(200),
    is_volatile boolean,
    instance_name character varying(200),
    fired_time numeric(18,0),
    sched_time numeric(18,0),
    priority numeric(9,0),
    state character varying(16),
    job_name character varying(200),
    job_group character varying(200),
    is_stateful boolean,
    is_nonconcurrent boolean,
    is_update_data boolean,
    requests_recovery boolean
);


ALTER TABLE public.jquartz_fired_triggers OWNER TO jira;

--
-- Name: jquartz_job_details; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_job_details (
    sched_name character varying(120),
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250),
    is_durable boolean,
    is_volatile boolean,
    is_stateful boolean,
    is_nonconcurrent boolean,
    is_update_data boolean,
    requests_recovery boolean,
    job_data bytea
);


ALTER TABLE public.jquartz_job_details OWNER TO jira;

--
-- Name: jquartz_job_listeners; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_job_listeners (
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    job_listener character varying(200) NOT NULL
);


ALTER TABLE public.jquartz_job_listeners OWNER TO jira;

--
-- Name: jquartz_locks; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_locks (
    sched_name character varying(120),
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.jquartz_locks OWNER TO jira;

--
-- Name: jquartz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_paused_trigger_grps (
    sched_name character varying(120),
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.jquartz_paused_trigger_grps OWNER TO jira;

--
-- Name: jquartz_scheduler_state; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_scheduler_state (
    sched_name character varying(120),
    instance_name character varying(200) NOT NULL,
    last_checkin_time numeric(18,0),
    checkin_interval numeric(18,0)
);


ALTER TABLE public.jquartz_scheduler_state OWNER TO jira;

--
-- Name: jquartz_simple_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_simple_triggers (
    sched_name character varying(120),
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count numeric(18,0),
    repeat_interval numeric(18,0),
    times_triggered numeric(18,0)
);


ALTER TABLE public.jquartz_simple_triggers OWNER TO jira;

--
-- Name: jquartz_simprop_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_simprop_triggers (
    sched_name character varying(120),
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 numeric(9,0),
    int_prop_2 numeric(9,0),
    long_prop_1 numeric(18,0),
    long_prop_2 numeric(18,0),
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.jquartz_simprop_triggers OWNER TO jira;

--
-- Name: jquartz_trigger_listeners; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_trigger_listeners (
    trigger_name character varying(200),
    trigger_group character varying(200) NOT NULL,
    trigger_listener character varying(200) NOT NULL
);


ALTER TABLE public.jquartz_trigger_listeners OWNER TO jira;

--
-- Name: jquartz_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.jquartz_triggers (
    sched_name character varying(120),
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_volatile boolean,
    description character varying(250),
    next_fire_time numeric(18,0),
    prev_fire_time numeric(18,0),
    priority numeric(9,0),
    trigger_state character varying(16),
    trigger_type character varying(8),
    start_time numeric(18,0),
    end_time numeric(18,0),
    calendar_name character varying(200),
    misfire_instr numeric(4,0),
    job_data bytea
);


ALTER TABLE public.jquartz_triggers OWNER TO jira;

--
-- Name: label; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.label (
    id numeric(18,0) NOT NULL,
    fieldid numeric(18,0),
    issue numeric(18,0),
    label character varying(255)
);


ALTER TABLE public.label OWNER TO jira;

--
-- Name: licenserolesdefault; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.licenserolesdefault (
    id numeric(18,0) NOT NULL,
    license_role_name character varying(255)
);


ALTER TABLE public.licenserolesdefault OWNER TO jira;

--
-- Name: licenserolesgroup; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.licenserolesgroup (
    id numeric(18,0) NOT NULL,
    license_role_name character varying(255),
    group_id character varying(255),
    primary_group character(1)
);


ALTER TABLE public.licenserolesgroup OWNER TO jira;

--
-- Name: listenerconfig; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.listenerconfig (
    id numeric(18,0) NOT NULL,
    clazz character varying(255),
    listenername character varying(255)
);


ALTER TABLE public.listenerconfig OWNER TO jira;

--
-- Name: mailserver; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.mailserver (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text,
    mailfrom character varying(255),
    prefix character varying(60),
    smtp_port character varying(60),
    protocol character varying(60),
    server_type character varying(60),
    servername character varying(255),
    jndilocation character varying(255),
    mailusername character varying(255),
    mailpassword character varying(255),
    cipher_type character varying(255),
    istlsrequired character varying(60),
    timeout numeric(18,0),
    socks_port character varying(60),
    socks_host character varying(60),
    auth_conf text
);


ALTER TABLE public.mailserver OWNER TO jira;

--
-- Name: managedconfigurationitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.managedconfigurationitem (
    id numeric(18,0) NOT NULL,
    item_id character varying(255),
    item_type character varying(255),
    managed character varying(10),
    access_level character varying(255),
    source character varying(255),
    description_key character varying(255)
);


ALTER TABLE public.managedconfigurationitem OWNER TO jira;

--
-- Name: membershipbase; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.membershipbase (
    id numeric(18,0) NOT NULL,
    user_name character varying(255),
    group_name character varying(255)
);


ALTER TABLE public.membershipbase OWNER TO jira;

--
-- Name: moved_issue_key; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.moved_issue_key (
    id numeric(18,0) NOT NULL,
    old_issue_key character varying(255),
    issue_id numeric(18,0)
);


ALTER TABLE public.moved_issue_key OWNER TO jira;

--
-- Name: nodeassociation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.nodeassociation (
    source_node_id numeric(18,0) NOT NULL,
    source_node_entity character varying(60) NOT NULL,
    sink_node_id numeric(18,0) NOT NULL,
    sink_node_entity character varying(60) NOT NULL,
    association_type character varying(60) NOT NULL,
    sequence numeric(9,0)
);


ALTER TABLE public.nodeassociation OWNER TO jira;

--
-- Name: nodeindexcounter; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.nodeindexcounter (
    id numeric(18,0) NOT NULL,
    node_id character varying(60),
    sending_node_id character varying(60),
    index_operation_id numeric(18,0)
);


ALTER TABLE public.nodeindexcounter OWNER TO jira;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.notification (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    event character varying(60),
    event_type_id numeric(18,0),
    template_id numeric(18,0),
    notif_type character varying(60),
    notif_parameter character varying(60)
);


ALTER TABLE public.notification OWNER TO jira;

--
-- Name: notificationinstance; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.notificationinstance (
    id numeric(18,0) NOT NULL,
    notificationtype character varying(60),
    source numeric(18,0),
    emailaddress character varying(255),
    messageid character varying(255)
);


ALTER TABLE public.notificationinstance OWNER TO jira;

--
-- Name: notificationscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.notificationscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.notificationscheme OWNER TO jira;

--
-- Name: oauthconsumer; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.oauthconsumer (
    id numeric(18,0) NOT NULL,
    created timestamp with time zone,
    consumername character varying(255),
    consumer_key character varying(255),
    consumerservice character varying(255),
    public_key text,
    private_key text,
    description text,
    callback text,
    signature_method character varying(60),
    shared_secret text
);


ALTER TABLE public.oauthconsumer OWNER TO jira;

--
-- Name: oauthconsumertoken; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.oauthconsumertoken (
    id numeric(18,0) NOT NULL,
    created timestamp with time zone,
    token_key character varying(255),
    token character varying(255),
    token_secret character varying(255),
    token_type character varying(60),
    consumer_key character varying(255)
);


ALTER TABLE public.oauthconsumertoken OWNER TO jira;

--
-- Name: oauthspconsumer; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.oauthspconsumer (
    id numeric(18,0) NOT NULL,
    created timestamp with time zone,
    consumer_key character varying(255),
    consumername character varying(255),
    public_key text,
    description text,
    callback text,
    two_l_o_allowed character varying(60),
    executing_two_l_o_user character varying(255),
    two_l_o_impersonation_allowed character varying(60),
    three_l_o_allowed character varying(60)
);


ALTER TABLE public.oauthspconsumer OWNER TO jira;

--
-- Name: oauthsptoken; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.oauthsptoken (
    id numeric(18,0) NOT NULL,
    created timestamp with time zone,
    token character varying(255),
    token_secret character varying(255),
    token_type character varying(60),
    consumer_key character varying(255),
    username character varying(255),
    ttl numeric(18,0),
    spauth character varying(60),
    callback text,
    spverifier character varying(255),
    spversion character varying(60),
    session_handle character varying(255),
    session_creation_time timestamp with time zone,
    session_last_renewal_time timestamp with time zone,
    session_time_to_live timestamp with time zone
);


ALTER TABLE public.oauthsptoken OWNER TO jira;

--
-- Name: optionconfiguration; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.optionconfiguration (
    id numeric(18,0) NOT NULL,
    fieldid character varying(60),
    optionid character varying(60),
    fieldconfig numeric(18,0),
    sequence numeric(18,0)
);


ALTER TABLE public.optionconfiguration OWNER TO jira;

--
-- Name: os_currentstep; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.os_currentstep (
    id numeric(18,0) NOT NULL,
    entry_id numeric(18,0),
    step_id numeric(9,0),
    action_id numeric(9,0),
    owner character varying(255),
    start_date timestamp with time zone,
    due_date timestamp with time zone,
    finish_date timestamp with time zone,
    status character varying(60),
    caller character varying(255)
);


ALTER TABLE public.os_currentstep OWNER TO jira;

--
-- Name: os_currentstep_prev; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.os_currentstep_prev (
    id numeric(18,0) NOT NULL,
    previous_id numeric(18,0) NOT NULL
);


ALTER TABLE public.os_currentstep_prev OWNER TO jira;

--
-- Name: os_historystep; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.os_historystep (
    id numeric(18,0) NOT NULL,
    entry_id numeric(18,0),
    step_id numeric(9,0),
    action_id numeric(9,0),
    owner character varying(255),
    start_date timestamp with time zone,
    due_date timestamp with time zone,
    finish_date timestamp with time zone,
    status character varying(60),
    caller character varying(255)
);


ALTER TABLE public.os_historystep OWNER TO jira;

--
-- Name: os_historystep_prev; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.os_historystep_prev (
    id numeric(18,0) NOT NULL,
    previous_id numeric(18,0) NOT NULL
);


ALTER TABLE public.os_historystep_prev OWNER TO jira;

--
-- Name: os_wfentry; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.os_wfentry (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    initialized numeric(9,0),
    state numeric(9,0)
);


ALTER TABLE public.os_wfentry OWNER TO jira;

--
-- Name: permissionscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.permissionscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.permissionscheme OWNER TO jira;

--
-- Name: permissionschemeattribute; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.permissionschemeattribute (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    attribute_key character varying(255),
    attribute_value text
);


ALTER TABLE public.permissionschemeattribute OWNER TO jira;

--
-- Name: pluginstate; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.pluginstate (
    pluginkey character varying(255) NOT NULL,
    pluginenabled character varying(60)
);


ALTER TABLE public.pluginstate OWNER TO jira;

--
-- Name: pluginversion; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.pluginversion (
    id numeric(18,0) NOT NULL,
    pluginname character varying(255),
    pluginkey character varying(255),
    pluginversion character varying(255),
    created timestamp with time zone
);


ALTER TABLE public.pluginversion OWNER TO jira;

--
-- Name: portalpage; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.portalpage (
    id numeric(18,0) NOT NULL,
    username character varying(255),
    pagename character varying(255),
    description character varying(255),
    sequence numeric(18,0),
    fav_count numeric(18,0),
    layout character varying(255),
    ppversion numeric(18,0)
);


ALTER TABLE public.portalpage OWNER TO jira;

--
-- Name: portletconfiguration; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.portletconfiguration (
    id numeric(18,0) NOT NULL,
    portalpage numeric(18,0),
    portlet_id character varying(255),
    column_number numeric(9,0),
    positionseq numeric(9,0),
    gadget_xml text,
    color character varying(255),
    dashboard_module_complete_key text
);


ALTER TABLE public.portletconfiguration OWNER TO jira;

--
-- Name: priority; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.priority (
    id character varying(60) NOT NULL,
    sequence numeric(18,0),
    pname character varying(60),
    description text,
    iconurl character varying(255),
    status_color character varying(60)
);


ALTER TABLE public.priority OWNER TO jira;

--
-- Name: productlicense; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.productlicense (
    id numeric(18,0) NOT NULL,
    license text
);


ALTER TABLE public.productlicense OWNER TO jira;

--
-- Name: project; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.project (
    id numeric(18,0) NOT NULL,
    pname character varying(255),
    url character varying(255),
    lead character varying(255),
    description text,
    pkey character varying(255),
    pcounter numeric(18,0),
    assigneetype numeric(18,0),
    avatar numeric(18,0),
    originalkey character varying(255),
    projecttype character varying(255)
);


ALTER TABLE public.project OWNER TO jira;

--
-- Name: project_key; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.project_key (
    id numeric(18,0) NOT NULL,
    project_id numeric(18,0),
    project_key character varying(255)
);


ALTER TABLE public.project_key OWNER TO jira;

--
-- Name: projectcategory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.projectcategory (
    id numeric(18,0) NOT NULL,
    cname character varying(255),
    description text
);


ALTER TABLE public.projectcategory OWNER TO jira;

--
-- Name: projectchangedtime; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.projectchangedtime (
    project_id numeric(18,0) NOT NULL,
    issue_changed_time timestamp with time zone
);


ALTER TABLE public.projectchangedtime OWNER TO jira;

--
-- Name: projectrole; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.projectrole (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.projectrole OWNER TO jira;

--
-- Name: projectroleactor; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.projectroleactor (
    id numeric(18,0) NOT NULL,
    pid numeric(18,0),
    projectroleid numeric(18,0),
    roletype character varying(255),
    roletypeparameter character varying(255)
);


ALTER TABLE public.projectroleactor OWNER TO jira;

--
-- Name: projectversion; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.projectversion (
    id numeric(18,0) NOT NULL,
    project numeric(18,0),
    vname character varying(255),
    description text,
    sequence numeric(18,0),
    released character varying(10),
    archived character varying(10),
    url character varying(255),
    startdate timestamp with time zone,
    releasedate timestamp with time zone
);


ALTER TABLE public.projectversion OWNER TO jira;

--
-- Name: propertydata; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertydata (
    id numeric(18,0) NOT NULL,
    propertyvalue oid
);


ALTER TABLE public.propertydata OWNER TO jira;

--
-- Name: propertydate; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertydate (
    id numeric(18,0) NOT NULL,
    propertyvalue timestamp with time zone
);


ALTER TABLE public.propertydate OWNER TO jira;

--
-- Name: propertydecimal; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertydecimal (
    id numeric(18,0) NOT NULL,
    propertyvalue double precision
);


ALTER TABLE public.propertydecimal OWNER TO jira;

--
-- Name: propertyentry; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertyentry (
    id numeric(18,0) NOT NULL,
    entity_name character varying(255),
    entity_id numeric(18,0),
    property_key character varying(255),
    propertytype numeric(9,0)
);


ALTER TABLE public.propertyentry OWNER TO jira;

--
-- Name: propertynumber; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertynumber (
    id numeric(18,0) NOT NULL,
    propertyvalue numeric(18,0)
);


ALTER TABLE public.propertynumber OWNER TO jira;

--
-- Name: propertystring; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertystring (
    id numeric(18,0) NOT NULL,
    propertyvalue text
);


ALTER TABLE public.propertystring OWNER TO jira;

--
-- Name: propertytext; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.propertytext (
    id numeric(18,0) NOT NULL,
    propertyvalue text
);


ALTER TABLE public.propertytext OWNER TO jira;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_calendars (
    id numeric(18,0),
    calendar_name character varying(255) NOT NULL,
    calendar text
);


ALTER TABLE public.qrtz_calendars OWNER TO jira;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_cron_triggers (
    id numeric(18,0) NOT NULL,
    trigger_id numeric(18,0),
    cronexperssion character varying(255)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO jira;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_fired_triggers (
    id numeric(18,0),
    entry_id character varying(255) NOT NULL,
    trigger_id numeric(18,0),
    trigger_listener character varying(255),
    fired_time timestamp with time zone,
    trigger_state character varying(255)
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO jira;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_job_details (
    id numeric(18,0) NOT NULL,
    job_name character varying(255),
    job_group character varying(255),
    class_name character varying(255),
    is_durable character varying(60),
    is_stateful character varying(60),
    requests_recovery character varying(60),
    job_data character varying(255)
);


ALTER TABLE public.qrtz_job_details OWNER TO jira;

--
-- Name: qrtz_job_listeners; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_job_listeners (
    id numeric(18,0) NOT NULL,
    job numeric(18,0),
    job_listener character varying(255)
);


ALTER TABLE public.qrtz_job_listeners OWNER TO jira;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_simple_triggers (
    id numeric(18,0) NOT NULL,
    trigger_id numeric(18,0),
    repeat_count numeric(9,0),
    repeat_interval numeric(18,0),
    times_triggered numeric(9,0)
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO jira;

--
-- Name: qrtz_trigger_listeners; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_trigger_listeners (
    id numeric(18,0) NOT NULL,
    trigger_id numeric(18,0),
    trigger_listener character varying(255)
);


ALTER TABLE public.qrtz_trigger_listeners OWNER TO jira;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.qrtz_triggers (
    id numeric(18,0) NOT NULL,
    trigger_name character varying(255),
    trigger_group character varying(255),
    job numeric(18,0),
    next_fire timestamp with time zone,
    trigger_state character varying(255),
    trigger_type character varying(60),
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    calendar_name character varying(255),
    misfire_instr numeric(9,0)
);


ALTER TABLE public.qrtz_triggers OWNER TO jira;

--
-- Name: reindex_component; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.reindex_component (
    id numeric(18,0) NOT NULL,
    request_id numeric(18,0),
    affected_index character varying(60),
    entity_type character varying(60)
);


ALTER TABLE public.reindex_component OWNER TO jira;

--
-- Name: reindex_request; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.reindex_request (
    id numeric(18,0) NOT NULL,
    type character varying(60),
    request_time timestamp with time zone,
    start_time timestamp with time zone,
    completion_time timestamp with time zone,
    status character varying(60),
    execution_node_id character varying(60),
    query text
);


ALTER TABLE public.reindex_request OWNER TO jira;

--
-- Name: remembermetoken; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.remembermetoken (
    id numeric(18,0) NOT NULL,
    created timestamp with time zone,
    token character varying(255),
    username character varying(255)
);


ALTER TABLE public.remembermetoken OWNER TO jira;

--
-- Name: remotelink; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.remotelink (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    globalid character varying(255),
    title character varying(255),
    summary text,
    url text,
    iconurl text,
    icontitle text,
    relationship character varying(255),
    resolved character(1),
    statusname character varying(255),
    statusdescription text,
    statusiconurl text,
    statusicontitle text,
    statusiconlink text,
    statuscategorykey character varying(255),
    statuscategorycolorname character varying(255),
    applicationtype character varying(255),
    applicationname character varying(255)
);


ALTER TABLE public.remotelink OWNER TO jira;

--
-- Name: replicatedindexoperation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.replicatedindexoperation (
    id numeric(18,0) NOT NULL,
    index_time timestamp with time zone,
    node_id character varying(60),
    affected_index character varying(60),
    entity_type character varying(60),
    affected_ids text,
    versions text,
    operation character varying(60),
    filename character varying(255)
);


ALTER TABLE public.replicatedindexoperation OWNER TO jira;

--
-- Name: resolution; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.resolution (
    id character varying(60) NOT NULL,
    sequence numeric(18,0),
    pname character varying(60),
    description text,
    iconurl character varying(255)
);


ALTER TABLE public.resolution OWNER TO jira;

--
-- Name: rundetails; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.rundetails (
    id numeric(18,0) NOT NULL,
    job_id character varying(255),
    start_time timestamp with time zone,
    run_duration numeric(18,0),
    run_outcome character(1),
    info_message character varying(255)
);


ALTER TABLE public.rundetails OWNER TO jira;

--
-- Name: schemeissuesecurities; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.schemeissuesecurities (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    security numeric(18,0),
    sec_type character varying(255),
    sec_parameter character varying(255)
);


ALTER TABLE public.schemeissuesecurities OWNER TO jira;

--
-- Name: schemeissuesecuritylevels; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.schemeissuesecuritylevels (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text,
    scheme numeric(18,0)
);


ALTER TABLE public.schemeissuesecuritylevels OWNER TO jira;

--
-- Name: schemepermissions; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.schemepermissions (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    permission numeric(18,0),
    perm_type character varying(255),
    perm_parameter character varying(255),
    permission_key character varying(255)
);


ALTER TABLE public.schemepermissions OWNER TO jira;

--
-- Name: searchrequest; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.searchrequest (
    id numeric(18,0) NOT NULL,
    filtername character varying(255),
    authorname character varying(255),
    description text,
    username character varying(255),
    groupname character varying(255),
    projectid numeric(18,0),
    reqcontent text,
    fav_count numeric(18,0),
    filtername_lower character varying(255)
);


ALTER TABLE public.searchrequest OWNER TO jira;

--
-- Name: sequence_value_item; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.sequence_value_item (
    seq_name character varying(60) NOT NULL,
    seq_id numeric(18,0)
);


ALTER TABLE public.sequence_value_item OWNER TO jira;

--
-- Name: serviceconfig; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.serviceconfig (
    id numeric(18,0) NOT NULL,
    delaytime numeric(18,0),
    clazz character varying(255),
    servicename character varying(255),
    cron_expression character varying(255)
);


ALTER TABLE public.serviceconfig OWNER TO jira;

--
-- Name: sharepermissions; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.sharepermissions (
    id numeric(18,0) NOT NULL,
    entityid numeric(18,0),
    entitytype character varying(60),
    sharetype character varying(10),
    param1 character varying(255),
    param2 character varying(60),
    rights numeric(9,0)
);


ALTER TABLE public.sharepermissions OWNER TO jira;

--
-- Name: tempattachmentsmonitor; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.tempattachmentsmonitor (
    temporary_attachment_id character varying(255) NOT NULL,
    form_token character varying(255),
    file_name character varying(255),
    content_type character varying(255),
    file_size numeric(18,0),
    created_time numeric(18,0)
);


ALTER TABLE public.tempattachmentsmonitor OWNER TO jira;

--
-- Name: trackback_ping; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.trackback_ping (
    id numeric(18,0) NOT NULL,
    issue numeric(18,0),
    url character varying(255),
    title character varying(255),
    blogname character varying(255),
    excerpt character varying(255),
    created timestamp with time zone
);


ALTER TABLE public.trackback_ping OWNER TO jira;

--
-- Name: trustedapp; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.trustedapp (
    id numeric(18,0) NOT NULL,
    application_id character varying(255),
    name character varying(255),
    public_key text,
    ip_match text,
    url_match text,
    timeout numeric(18,0),
    created timestamp with time zone,
    created_by character varying(255),
    updated timestamp with time zone,
    updated_by character varying(255)
);


ALTER TABLE public.trustedapp OWNER TO jira;

--
-- Name: upgradehistory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.upgradehistory (
    id numeric(18,0),
    upgradeclass character varying(255) NOT NULL,
    targetbuild character varying(255),
    status character varying(255),
    downgradetaskrequired character(1)
);


ALTER TABLE public.upgradehistory OWNER TO jira;

--
-- Name: upgradetaskhistory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.upgradetaskhistory (
    id numeric(18,0) NOT NULL,
    upgrade_task_factory_key character varying(255),
    build_number numeric(9,0),
    status character varying(60),
    upgrade_type character varying(10)
);


ALTER TABLE public.upgradetaskhistory OWNER TO jira;

--
-- Name: upgradetaskhistoryauditlog; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.upgradetaskhistoryauditlog (
    id numeric(18,0) NOT NULL,
    upgrade_task_factory_key character varying(255),
    build_number numeric(9,0),
    status character varying(60),
    upgrade_type character varying(10),
    timeperformed timestamp with time zone,
    action character varying(10)
);


ALTER TABLE public.upgradetaskhistoryauditlog OWNER TO jira;

--
-- Name: upgradeversionhistory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.upgradeversionhistory (
    id numeric(18,0),
    timeperformed timestamp with time zone,
    targetbuild character varying(255) NOT NULL,
    targetversion character varying(255)
);


ALTER TABLE public.upgradeversionhistory OWNER TO jira;

--
-- Name: userassociation; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userassociation (
    source_name character varying(60) NOT NULL,
    sink_node_id numeric(18,0) NOT NULL,
    sink_node_entity character varying(60) NOT NULL,
    association_type character varying(60) NOT NULL,
    sequence numeric(9,0),
    created timestamp with time zone
);


ALTER TABLE public.userassociation OWNER TO jira;

--
-- Name: userbase; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userbase (
    id numeric(18,0) NOT NULL,
    username character varying(255),
    password_hash character varying(255)
);


ALTER TABLE public.userbase OWNER TO jira;

--
-- Name: userhistoryitem; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userhistoryitem (
    id numeric(18,0) NOT NULL,
    entitytype character varying(10),
    entityid character varying(60),
    username character varying(255),
    lastviewed numeric(18,0),
    data text
);


ALTER TABLE public.userhistoryitem OWNER TO jira;

--
-- Name: userpickerfilter; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userpickerfilter (
    id numeric(18,0) NOT NULL,
    customfield numeric(18,0),
    customfieldconfig numeric(18,0),
    enabled character varying(60)
);


ALTER TABLE public.userpickerfilter OWNER TO jira;

--
-- Name: userpickerfiltergroup; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userpickerfiltergroup (
    id numeric(18,0) NOT NULL,
    userpickerfilter numeric(18,0),
    groupname character varying(255)
);


ALTER TABLE public.userpickerfiltergroup OWNER TO jira;

--
-- Name: userpickerfilterrole; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.userpickerfilterrole (
    id numeric(18,0) NOT NULL,
    userpickerfilter numeric(18,0),
    projectroleid numeric(18,0)
);


ALTER TABLE public.userpickerfilterrole OWNER TO jira;

--
-- Name: versioncontrol; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.versioncontrol (
    id numeric(18,0) NOT NULL,
    vcsname character varying(255),
    vcsdescription character varying(255),
    vcstype character varying(255)
);


ALTER TABLE public.versioncontrol OWNER TO jira;

--
-- Name: votehistory; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.votehistory (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    votes numeric(18,0),
    "timestamp" timestamp with time zone
);


ALTER TABLE public.votehistory OWNER TO jira;

--
-- Name: workflowscheme; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.workflowscheme (
    id numeric(18,0) NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.workflowscheme OWNER TO jira;

--
-- Name: workflowschemeentity; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.workflowschemeentity (
    id numeric(18,0) NOT NULL,
    scheme numeric(18,0),
    workflow character varying(255),
    issuetype character varying(255)
);


ALTER TABLE public.workflowschemeentity OWNER TO jira;

--
-- Name: worklog; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.worklog (
    id numeric(18,0) NOT NULL,
    issueid numeric(18,0),
    author character varying(255),
    grouplevel character varying(255),
    rolelevel numeric(18,0),
    worklogbody text,
    created timestamp with time zone,
    updateauthor character varying(255),
    updated timestamp with time zone,
    startdate timestamp with time zone,
    timeworked numeric(18,0)
);


ALTER TABLE public.worklog OWNER TO jira;

--
-- Name: worklog_version; Type: TABLE; Schema: public; Owner: jira
--

CREATE TABLE public.worklog_version (
    worklog_id numeric(18,0) NOT NULL,
    parent_issue_id numeric(18,0),
    update_time timestamp with time zone,
    index_version numeric(18,0),
    deleted character(1)
);


ALTER TABLE public.worklog_version OWNER TO jira;

--
-- Name: AO_0A5972_NOTIFICATION_SETTING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_0A5972_NOTIFICATION_SETTING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_0A5972_NOTIFICATION_SETTING_ID_seq"'::regclass);


--
-- Name: AO_21D670_WHITELIST_RULES ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21D670_WHITELIST_RULES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21D670_WHITELIST_RULES_ID_seq"'::regclass);


--
-- Name: AO_21F425_MESSAGE_MAPPING_AO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_MAPPING_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq"'::regclass);


--
-- Name: AO_21F425_USER_PROPERTY_AO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21F425_USER_PROPERTY_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21F425_USER_PROPERTY_AO_ID_seq"'::regclass);


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_38321B_CUSTOM_CONTENT_LINK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq"'::regclass);


--
-- Name: AO_3B1893_LOOP_DETECTION ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_3B1893_LOOP_DETECTION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_3B1893_LOOP_DETECTION_ID_seq"'::regclass);


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_STATUS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq"'::regclass);


--
-- Name: AO_4789DD_PROPERTIES ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_PROPERTIES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_PROPERTIES_ID_seq"'::regclass);


--
-- Name: AO_4789DD_READ_NOTIFICATIONS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_READ_NOTIFICATIONS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_READ_NOTIFICATIONS_ID_seq"'::regclass);


--
-- Name: AO_4789DD_TASK_MONITOR ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_TASK_MONITOR_ID_seq"'::regclass);


--
-- Name: AO_4AEACD_WEBHOOK_DAO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4AEACD_WEBHOOK_DAO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4AEACD_WEBHOOK_DAO_ID_seq"'::regclass);


--
-- Name: AO_550953_SHORTCUT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_550953_SHORTCUT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_550953_SHORTCUT_ID_seq"'::regclass);


--
-- Name: AO_563AEE_ACTIVITY_ENTITY ACTIVITY_ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY" ALTER COLUMN "ACTIVITY_ID" SET DEFAULT nextval('public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_ACTOR_ENTITY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTOR_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_ACTOR_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_MEDIA_LINK_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_OBJECT_ENTITY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_OBJECT_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_TARGET_ENTITY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_TARGET_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_575BF5_DEV_SUMMARY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_DEV_SUMMARY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_575BF5_DEV_SUMMARY_ID_seq"'::regclass);


--
-- Name: AO_575BF5_PROCESSED_COMMITS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROCESSED_COMMITS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_575BF5_PROCESSED_COMMITS_ID_seq"'::regclass);


--
-- Name: AO_575BF5_PROVIDER_ISSUE ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROVIDER_ISSUE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_575BF5_PROVIDER_ISSUE_ID_seq"'::regclass);


--
-- Name: AO_575BF5_PROVIDER_SEQ_NO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROVIDER_SEQ_NO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_575BF5_PROVIDER_SEQ_NO_ID_seq"'::regclass);


--
-- Name: AO_60DB71_AUDITENTRY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_AUDITENTRY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_AUDITENTRY_ID_seq"'::regclass);


--
-- Name: AO_60DB71_BOARDADMINS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_BOARDADMINS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_BOARDADMINS_ID_seq"'::regclass);


--
-- Name: AO_60DB71_CARDCOLOR ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDCOLOR" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_CARDCOLOR_ID_seq"'::regclass);


--
-- Name: AO_60DB71_CARDLAYOUT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDLAYOUT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_CARDLAYOUT_ID_seq"'::regclass);


--
-- Name: AO_60DB71_COLUMN ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMN" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_COLUMN_ID_seq"'::regclass);


--
-- Name: AO_60DB71_COLUMNSTATUS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMNSTATUS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_COLUMNSTATUS_ID_seq"'::regclass);


--
-- Name: AO_60DB71_DETAILVIEWFIELD ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_DETAILVIEWFIELD" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_DETAILVIEWFIELD_ID_seq"'::regclass);


--
-- Name: AO_60DB71_ESTIMATESTATISTIC ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ESTIMATESTATISTIC" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_ESTIMATESTATISTIC_ID_seq"'::regclass);


--
-- Name: AO_60DB71_ISSUERANKING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ISSUERANKING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_ISSUERANKING_ID_seq"'::regclass);


--
-- Name: AO_60DB71_ISSUERANKINGLOG ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ISSUERANKINGLOG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_ISSUERANKINGLOG_ID_seq"'::regclass);


--
-- Name: AO_60DB71_LEXORANK ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_LEXORANK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_LEXORANK_ID_seq"'::regclass);


--
-- Name: AO_60DB71_LEXORANKBALANCER ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_LEXORANKBALANCER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_LEXORANKBALANCER_ID_seq"'::regclass);


--
-- Name: AO_60DB71_NONWORKINGDAY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_NONWORKINGDAY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_NONWORKINGDAY_ID_seq"'::regclass);


--
-- Name: AO_60DB71_QUICKFILTER ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_QUICKFILTER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_QUICKFILTER_ID_seq"'::regclass);


--
-- Name: AO_60DB71_RANKABLEOBJECT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_RANKABLEOBJECT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_RANKABLEOBJECT_ID_seq"'::regclass);


--
-- Name: AO_60DB71_RAPIDVIEW ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_RAPIDVIEW" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_RAPIDVIEW_ID_seq"'::regclass);


--
-- Name: AO_60DB71_SPRINT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SPRINT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_SPRINT_ID_seq"'::regclass);


--
-- Name: AO_60DB71_STATSFIELD ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_STATSFIELD" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_STATSFIELD_ID_seq"'::regclass);


--
-- Name: AO_60DB71_SUBQUERY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SUBQUERY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_SUBQUERY_ID_seq"'::regclass);


--
-- Name: AO_60DB71_SWIMLANE ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SWIMLANE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_SWIMLANE_ID_seq"'::regclass);


--
-- Name: AO_60DB71_TRACKINGSTATISTIC ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_TRACKINGSTATISTIC" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_TRACKINGSTATISTIC_ID_seq"'::regclass);


--
-- Name: AO_60DB71_VERSION ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_VERSION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_VERSION_ID_seq"'::regclass);


--
-- Name: AO_60DB71_WORKINGDAYS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_WORKINGDAYS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_60DB71_WORKINGDAYS_ID_seq"'::regclass);


--
-- Name: AO_733371_EVENT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_733371_EVENT_ID_seq"'::regclass);


--
-- Name: AO_733371_EVENT_PARAMETER ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_PARAMETER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_733371_EVENT_PARAMETER_ID_seq"'::regclass);


--
-- Name: AO_733371_EVENT_RECIPIENT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_RECIPIENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_733371_EVENT_RECIPIENT_ID_seq"'::regclass);


--
-- Name: AO_97EDAB_USERINVITATION ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_97EDAB_USERINVITATION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_97EDAB_USERINVITATION_ID_seq"'::regclass);


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_A0B856_WEB_HOOK_LISTENER_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq"'::regclass);


--
-- Name: AO_AC3877_RL_USER_COUNTER ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_AC3877_RL_USER_COUNTER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_AC3877_RL_USER_COUNTER_ID_seq"'::regclass);


--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_B9A0F0_APPLIED_TEMPLATE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_B9A0F0_APPLIED_TEMPLATE_ID_seq"'::regclass);


--
-- Name: AO_C16815_ALERT_AO ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_C16815_ALERT_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C16815_ALERT_AO_ID_seq"'::regclass);


--
-- Name: AO_C77861_AUDIT_ENTITY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C77861_AUDIT_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_CFF990_AOTRANSITION_FAILURE ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_CFF990_AOTRANSITION_FAILURE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_CFF990_AOTRANSITION_FAILURE_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_BRANCH ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_BRANCH" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_BRANCH_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_BRANCH_HEAD_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_CHANGESET_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_CHANGESET_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_CHANGESET_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_COMMIT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_COMMIT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_COMMIT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_GIT_HUB_EVENT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_GIT_HUB_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_GIT_HUB_EVENT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ISSUE_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ISSUE_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2 ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_MAPPING_V2" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_TO_BRANCH" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_TO_CHANGESET" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_MESSAGE ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_MESSAGE_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_MESSAGE_TAG ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_TAG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_MESSAGE_TAG_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ORGANIZATION_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_ORG_TO_PROJECT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ORG_TO_PROJECT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_ORG_TO_PROJECT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PROJECT_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PROJECT_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PROJECT_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2 ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PROJECT_MAPPING_V2" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PR_ISSUE_KEY ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_ISSUE_KEY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PR_ISSUE_KEY_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PR_PARTICIPANT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_PARTICIPANT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PR_PARTICIPANT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PR_TO_COMMIT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_TO_COMMIT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PR_TO_COMMIT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_PULL_REQUEST ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PULL_REQUEST" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_PULL_REQUEST_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPOSITORY_MAPPING" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_REPOSITORY_MAPPING_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPO_TO_CHANGESET" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_REPO_TO_CHANGESET_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_REPO_TO_PROJECT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPO_TO_PROJECT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_REPO_TO_PROJECT_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_SYNC_AUDIT_LOG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq"'::regclass);


--
-- Name: AO_E8B6CC_SYNC_EVENT ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_SYNC_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_E8B6CC_SYNC_EVENT_ID_seq"'::regclass);


--
-- Name: AO_ED669C_SEEN_ASSERTIONS ID; Type: DEFAULT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_ED669C_SEEN_ASSERTIONS_ID_seq"'::regclass);


--
-- Data for Name: AO_0A5972_NOTIFICATION_SETTING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_0A5972_NOTIFICATION_SETTING" ("ID", "KEY", "TYPE", "USER_KEY", "VALUE") FROM stdin;
\.


--
-- Name: AO_0A5972_NOTIFICATION_SETTING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_0A5972_NOTIFICATION_SETTING_ID_seq"', 1, false);


--
-- Data for Name: AO_0A5972_PUSH_REGISTRATION; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_0A5972_PUSH_REGISTRATION" ("BUILD", "ENDPOINT", "ID", "OS", "TOKEN", "USER_KEY") FROM stdin;
\.


--
-- Data for Name: AO_0AC321_RECOMMENDATION_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_0AC321_RECOMMENDATION_AO" ("CATEGORY", "CUSTOM_FIELD_ID", "ID", "NAME", "PERFORMANCE_IMPACT", "PROJECT_IDS", "RESOLVED", "TYPE") FROM stdin;
\.


--
-- Data for Name: AO_21D670_WHITELIST_RULES; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_21D670_WHITELIST_RULES" ("ALLOWINBOUND", "AUTHENTICATIONREQUIRED", "EXPRESSION", "ID", "TYPE") FROM stdin;
f	f	http://www.atlassian.com/*	1	WILDCARD_EXPRESSION
f	f	http://www.atlassian.com/*	2	WILDCARD_EXPRESSION
\.


--
-- Name: AO_21D670_WHITELIST_RULES_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_21D670_WHITELIST_RULES_ID_seq"', 2, true);


--
-- Data for Name: AO_21F425_MESSAGE_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_21F425_MESSAGE_AO" ("CONTENT", "ID") FROM stdin;
\.


--
-- Data for Name: AO_21F425_MESSAGE_MAPPING_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_21F425_MESSAGE_MAPPING_AO" ("ID", "MESSAGE_ID", "USER_HASH") FROM stdin;
\.


--
-- Name: AO_21F425_MESSAGE_MAPPING_AO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq"', 1, false);


--
-- Data for Name: AO_21F425_USER_PROPERTY_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_21F425_USER_PROPERTY_AO" ("ID", "KEY", "USER", "VALUE") FROM stdin;
\.


--
-- Name: AO_21F425_USER_PROPERTY_AO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_21F425_USER_PROPERTY_AO_ID_seq"', 1, false);


--
-- Data for Name: AO_38321B_CUSTOM_CONTENT_LINK; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_38321B_CUSTOM_CONTENT_LINK" ("CONTENT_KEY", "ID", "LINK_LABEL", "LINK_URL", "SEQUENCE") FROM stdin;
\.


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq"', 1, false);


--
-- Data for Name: AO_3B1893_LOOP_DETECTION; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_3B1893_LOOP_DETECTION" ("COUNTER", "EXPIRES_AT", "ID", "SENDER_EMAIL") FROM stdin;
\.


--
-- Name: AO_3B1893_LOOP_DETECTION_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_3B1893_LOOP_DETECTION_ID_seq"', 1, false);


--
-- Data for Name: AO_4789DD_HEALTH_CHECK_STATUS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_4789DD_HEALTH_CHECK_STATUS" ("APPLICATION_NAME", "COMPLETE_KEY", "DESCRIPTION", "FAILED_DATE", "FAILURE_REASON", "ID", "IS_HEALTHY", "IS_RESOLVED", "RESOLVED_DATE", "SEVERITY", "STATUS_NAME") FROM stdin;
\.


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq"', 1, false);


--
-- Data for Name: AO_4789DD_PROPERTIES; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_4789DD_PROPERTIES" ("ID", "PROPERTY_NAME", "PROPERTY_VALUE") FROM stdin;
1	last-run	1611650784436
\.


--
-- Name: AO_4789DD_PROPERTIES_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_4789DD_PROPERTIES_ID_seq"', 1, true);


--
-- Data for Name: AO_4789DD_READ_NOTIFICATIONS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_4789DD_READ_NOTIFICATIONS" ("ID", "IS_SNOOZED", "NOTIFICATION_ID", "SNOOZE_COUNT", "SNOOZE_DATE", "USER_KEY") FROM stdin;
\.


--
-- Name: AO_4789DD_READ_NOTIFICATIONS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_4789DD_READ_NOTIFICATIONS_ID_seq"', 1, false);


--
-- Data for Name: AO_4789DD_TASK_MONITOR; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_4789DD_TASK_MONITOR" ("CLUSTERED_TASK_ID", "CREATED_TIMESTAMP", "ID", "NODE_ID", "PROGRESS_MESSAGE", "PROGRESS_PERCENTAGE", "SERIALIZED_ERRORS", "SERIALIZED_WARNINGS", "TASK_ID", "TASK_MONITOR_KIND", "TASK_STATUS") FROM stdin;
\.


--
-- Name: AO_4789DD_TASK_MONITOR_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_4789DD_TASK_MONITOR_ID_seq"', 1, false);


--
-- Data for Name: AO_4AEACD_WEBHOOK_DAO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_4AEACD_WEBHOOK_DAO" ("ENABLED", "ENCODED_EVENTS", "FILTER", "ID", "JQL", "LAST_UPDATED", "LAST_UPDATED_USER", "NAME", "REGISTRATION_METHOD", "URL", "PARAMETERS", "EXCLUDE_ISSUE_DETAILS") FROM stdin;
\.


--
-- Name: AO_4AEACD_WEBHOOK_DAO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_4AEACD_WEBHOOK_DAO_ID_seq"', 1, false);


--
-- Data for Name: AO_550953_SHORTCUT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_550953_SHORTCUT" ("ID", "NAME", "PROJECT_ID", "SHORTCUT_URL", "URL", "ICON") FROM stdin;
\.


--
-- Name: AO_550953_SHORTCUT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_550953_SHORTCUT_ID_seq"', 1, false);


--
-- Data for Name: AO_563AEE_ACTIVITY_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_563AEE_ACTIVITY_ENTITY" ("ACTIVITY_ID", "ACTOR_ID", "CONTENT", "GENERATOR_DISPLAY_NAME", "GENERATOR_ID", "ICON_ID", "ID", "ISSUE_KEY", "OBJECT_ID", "POSTER", "PROJECT_KEY", "PUBLISHED", "TARGET_ID", "TITLE", "URL", "USERNAME", "VERB") FROM stdin;
\.


--
-- Name: AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq"', 1, false);


--
-- Data for Name: AO_563AEE_ACTOR_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_563AEE_ACTOR_ENTITY" ("FULL_NAME", "ID", "PROFILE_PAGE_URI", "PROFILE_PICTURE_URI", "USERNAME") FROM stdin;
\.


--
-- Name: AO_563AEE_ACTOR_ENTITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_563AEE_ACTOR_ENTITY_ID_seq"', 1, false);


--
-- Data for Name: AO_563AEE_MEDIA_LINK_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_563AEE_MEDIA_LINK_ENTITY" ("DURATION", "HEIGHT", "ID", "URL", "WIDTH") FROM stdin;
\.


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq"', 1, false);


--
-- Data for Name: AO_563AEE_OBJECT_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_563AEE_OBJECT_ENTITY" ("CONTENT", "DISPLAY_NAME", "ID", "IMAGE_ID", "OBJECT_ID", "OBJECT_TYPE", "SUMMARY", "URL") FROM stdin;
\.


--
-- Name: AO_563AEE_OBJECT_ENTITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_563AEE_OBJECT_ENTITY_ID_seq"', 1, false);


--
-- Data for Name: AO_563AEE_TARGET_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_563AEE_TARGET_ENTITY" ("CONTENT", "DISPLAY_NAME", "ID", "IMAGE_ID", "OBJECT_ID", "OBJECT_TYPE", "SUMMARY", "URL") FROM stdin;
\.


--
-- Name: AO_563AEE_TARGET_ENTITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_563AEE_TARGET_ENTITY_ID_seq"', 1, false);


--
-- Data for Name: AO_575BF5_DEV_SUMMARY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_575BF5_DEV_SUMMARY" ("CREATED", "ID", "ISSUE_ID", "JSON", "PROVIDER_SOURCE_ID", "UPDATED") FROM stdin;
\.


--
-- Name: AO_575BF5_DEV_SUMMARY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_575BF5_DEV_SUMMARY_ID_seq"', 1, false);


--
-- Data for Name: AO_575BF5_PROCESSED_COMMITS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_575BF5_PROCESSED_COMMITS" ("COMMIT_HASH", "ID", "METADATA_HASH") FROM stdin;
\.


--
-- Name: AO_575BF5_PROCESSED_COMMITS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_575BF5_PROCESSED_COMMITS_ID_seq"', 1, false);


--
-- Data for Name: AO_575BF5_PROVIDER_ISSUE; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_575BF5_PROVIDER_ISSUE" ("ID", "ISSUE_ID", "PROVIDER_SOURCE_ID", "STALE_AFTER") FROM stdin;
\.


--
-- Name: AO_575BF5_PROVIDER_ISSUE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_575BF5_PROVIDER_ISSUE_ID_seq"', 1, false);


--
-- Data for Name: AO_575BF5_PROVIDER_SEQ_NO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_575BF5_PROVIDER_SEQ_NO" ("ID", "PROVIDER_SOURCE_ID", "SEQUENCE_NO") FROM stdin;
\.


--
-- Name: AO_575BF5_PROVIDER_SEQ_NO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_575BF5_PROVIDER_SEQ_NO_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_AUDITENTRY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_AUDITENTRY" ("CATEGORY", "DATA", "ENTITY_CLASS", "ENTITY_ID", "ID", "TIME", "USER") FROM stdin;
\.


--
-- Name: AO_60DB71_AUDITENTRY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_AUDITENTRY_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_BOARDADMINS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_BOARDADMINS" ("ID", "KEY", "RAPID_VIEW_ID", "TYPE") FROM stdin;
1	JIRAUSER10000	1	USER
\.


--
-- Name: AO_60DB71_BOARDADMINS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_BOARDADMINS_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_CARDCOLOR; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_CARDCOLOR" ("COLOR", "ID", "POS", "RAPID_VIEW_ID", "STRATEGY", "VAL") FROM stdin;
\.


--
-- Name: AO_60DB71_CARDCOLOR_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_CARDCOLOR_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_CARDLAYOUT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_CARDLAYOUT" ("FIELD_ID", "ID", "MODE_NAME", "POS", "RAPID_VIEW_ID") FROM stdin;
\.


--
-- Name: AO_60DB71_CARDLAYOUT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_CARDLAYOUT_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_COLUMN; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_COLUMN" ("ID", "MAXIM", "MINIM", "NAME", "POS", "RAPID_VIEW_ID") FROM stdin;
4	\N	\N	gh.workflow.preset.todo	0	1
5	\N	\N	gh.workflow.preset.inprogress	1	1
6	\N	\N	gh.workflow.preset.done	2	1
\.


--
-- Data for Name: AO_60DB71_COLUMNSTATUS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_COLUMNSTATUS" ("COLUMN_ID", "ID", "POS", "STATUS_ID") FROM stdin;
4	4	0	10000
5	5	0	3
6	6	0	10001
\.


--
-- Name: AO_60DB71_COLUMNSTATUS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_COLUMNSTATUS_ID_seq"', 6, true);


--
-- Name: AO_60DB71_COLUMN_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_COLUMN_ID_seq"', 6, true);


--
-- Data for Name: AO_60DB71_DETAILVIEWFIELD; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_DETAILVIEWFIELD" ("FIELD_ID", "ID", "POS", "RAPID_VIEW_ID") FROM stdin;
status	1	0	1
priority	2	1	1
components	3	2	1
labels	4	3	1
versions	5	4	1
fixVersions	6	5	1
issuelinks	7	6	1
reporter	8	7	1
assignee	9	8	1
created	10	9	1
updated	11	10	1
customfield_10101	12	11	1
\.


--
-- Name: AO_60DB71_DETAILVIEWFIELD_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_DETAILVIEWFIELD_ID_seq"', 12, true);


--
-- Data for Name: AO_60DB71_ESTIMATESTATISTIC; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_ESTIMATESTATISTIC" ("FIELD_ID", "ID", "RAPID_VIEW_ID", "TYPE_ID") FROM stdin;
customfield_10106	1	1	field
\.


--
-- Name: AO_60DB71_ESTIMATESTATISTIC_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_ESTIMATESTATISTIC_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_ISSUERANKING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_ISSUERANKING" ("CUSTOM_FIELD_ID", "ID", "ISSUE_ID", "NEXT_ID") FROM stdin;
\.


--
-- Data for Name: AO_60DB71_ISSUERANKINGLOG; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_ISSUERANKINGLOG" ("CUSTOM_FIELD_ID", "ID", "ISSUE_ID", "LOG_TYPE", "NEW_NEXT_ID", "NEW_PREVIOUS_ID", "OLD_NEXT_ID", "OLD_PREVIOUS_ID", "SANITY_CHECKED") FROM stdin;
\.


--
-- Name: AO_60DB71_ISSUERANKINGLOG_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_ISSUERANKINGLOG_ID_seq"', 1, false);


--
-- Name: AO_60DB71_ISSUERANKING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_ISSUERANKING_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_LEXORANK; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_LEXORANK" ("BUCKET", "FIELD_ID", "ID", "ISSUE_ID", "LOCK_HASH", "LOCK_TIME", "RANK", "TYPE") FROM stdin;
0	10100	7	-9223372036854775808	\N	\N	0|000000:	0
0	10100	9	10000	\N	\N	0|hzzzzz:	1
0	10100	10	10001	\N	\N	0|i00007:	1
0	10100	11	10002	\N	\N	0|i0000f:	1
0	10100	12	10003	\N	\N	0|i0000n:	1
0	10100	13	10004	\N	\N	0|i0000v:	1
0	10100	14	10005	\N	\N	0|i00013:	1
0	10100	15	10006	\N	\N	0|i0001b:	1
0	10100	16	10007	\N	\N	0|i0001j:	1
0	10100	17	10008	\N	\N	0|i0001r:	1
0	10100	18	10009	\N	\N	0|i0001z:	1
0	10100	19	10010	\N	\N	0|i00027:	1
0	10100	20	10011	\N	\N	0|i0002f:	1
0	10100	21	10012	\N	\N	0|i0002n:	1
0	10100	22	10013	\N	\N	0|i0002v:	1
0	10100	23	10014	\N	\N	0|i00033:	1
0	10100	24	10015	\N	\N	0|i0003b:	1
0	10100	25	10016	\N	\N	0|i0003j:	1
0	10100	26	10017	\N	\N	0|i0003r:	1
0	10100	27	10018	\N	\N	0|i0003z:	1
0	10100	28	10019	\N	\N	0|i00047:	1
0	10100	29	10020	\N	\N	0|i0004f:	1
0	10100	31	10022	\N	\N	0|i0004v:	1
0	10100	8	9223372036854775807	\N	\N	0|zzzzzz:	2
0	10100	30	10021	\N	\N	0|i0004n:	1
\.


--
-- Data for Name: AO_60DB71_LEXORANKBALANCER; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_LEXORANKBALANCER" ("DISABLE_RANK_OPERATIONS", "FIELD_ID", "ID", "REBALANCE_TIME") FROM stdin;
\.


--
-- Name: AO_60DB71_LEXORANKBALANCER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_LEXORANKBALANCER_ID_seq"', 1, false);


--
-- Name: AO_60DB71_LEXORANK_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_LEXORANK_ID_seq"', 43, true);


--
-- Data for Name: AO_60DB71_NONWORKINGDAY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_NONWORKINGDAY" ("ID", "ISO8601_DATE", "WORKING_DAYS_ID") FROM stdin;
\.


--
-- Name: AO_60DB71_NONWORKINGDAY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_NONWORKINGDAY_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_QUICKFILTER; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_QUICKFILTER" ("DESCRIPTION", "ID", "LONG_QUERY", "NAME", "POS", "QUERY", "RAPID_VIEW_ID") FROM stdin;
gh.rapid.quickfilters.only.my.issues.desc	1	assignee = currentUser()	gh.rapid.quickfilters.only.my.issues	0	\N	1
gh.rapid.quickfilters.recently.updated.desc	2	updatedDate >= -1d	gh.rapid.quickfilters.recently.updated	1	\N	1
\.


--
-- Name: AO_60DB71_QUICKFILTER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_QUICKFILTER_ID_seq"', 2, true);


--
-- Data for Name: AO_60DB71_RANKABLEOBJECT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_RANKABLEOBJECT" ("ID", "TYPE") FROM stdin;
\.


--
-- Name: AO_60DB71_RANKABLEOBJECT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_RANKABLEOBJECT_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_RAPIDVIEW; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_RAPIDVIEW" ("CARD_COLOR_STRATEGY", "ID", "KAN_PLAN_ENABLED", "NAME", "OLD_DONE_ISSUES_CUTOFF", "OWNER_USER_NAME", "REFINED_VELOCITY_ACTIVE", "SAVED_FILTER_ID", "SHOW_DAYS_IN_COLUMN", "SHOW_EPIC_AS_PANEL", "SPRINTS_ENABLED", "SWIMLANE_STRATEGY") FROM stdin;
none	1	\N	AOSP board	NONE	JIRAUSER10000	t	10000	f	t	t	parentChild
\.


--
-- Name: AO_60DB71_RAPIDVIEW_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_RAPIDVIEW_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_SPRINT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_SPRINT" ("ACTIVATED_DATE", "AUTO_START_STOP", "CLOSED", "COMPLETE_DATE", "END_DATE", "GOAL", "ID", "NAME", "RAPID_VIEW_ID", "SEQUENCE", "STARTED", "START_DATE") FROM stdin;
\.


--
-- Name: AO_60DB71_SPRINT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_SPRINT_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_STATSFIELD; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_STATSFIELD" ("ID", "RAPID_VIEW_ID", "TYPE_ID") FROM stdin;
1	1	none
\.


--
-- Name: AO_60DB71_STATSFIELD_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_STATSFIELD_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_SUBQUERY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_SUBQUERY" ("ID", "LONG_QUERY", "QUERY", "RAPID_VIEW_ID", "SECTION") FROM stdin;
\.


--
-- Name: AO_60DB71_SUBQUERY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_SUBQUERY_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_SWIMLANE; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_SWIMLANE" ("DEFAULT_LANE", "DESCRIPTION", "ID", "LONG_QUERY", "NAME", "POS", "QUERY", "RAPID_VIEW_ID") FROM stdin;
t		1		gh.rapid.swimlane.default.name	0	\N	1
\.


--
-- Name: AO_60DB71_SWIMLANE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_SWIMLANE_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_TRACKINGSTATISTIC; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_TRACKINGSTATISTIC" ("FIELD_ID", "ID", "RAPID_VIEW_ID", "TYPE_ID") FROM stdin;
\N	1	1	none
\.


--
-- Name: AO_60DB71_TRACKINGSTATISTIC_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_TRACKINGSTATISTIC_ID_seq"', 1, true);


--
-- Data for Name: AO_60DB71_VERSION; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_VERSION" ("ID", "START_DATE", "VERSION_ID") FROM stdin;
\.


--
-- Name: AO_60DB71_VERSION_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_VERSION_ID_seq"', 1, false);


--
-- Data for Name: AO_60DB71_WORKINGDAYS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_60DB71_WORKINGDAYS" ("FRIDAY", "ID", "MONDAY", "RAPID_VIEW_ID", "SATURDAY", "SUNDAY", "THURSDAY", "TIMEZONE", "TUESDAY", "WEDNESDAY") FROM stdin;
t	1	t	1	f	f	t	defaultTimeZoneId	t	t
\.


--
-- Name: AO_60DB71_WORKINGDAYS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_60DB71_WORKINGDAYS_ID_seq"', 1, true);


--
-- Data for Name: AO_723324_CLIENT_CONFIG; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_723324_CLIENT_CONFIG" ("AUTHORIZATION_ENDPOINT", "CLIENT_ID", "CLIENT_SECRET", "DESCRIPTION", "ID", "NAME", "SCOPES", "TOKEN_ENDPOINT", "TYPE") FROM stdin;
\.


--
-- Data for Name: AO_723324_CLIENT_TOKEN; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_723324_CLIENT_TOKEN" ("ACCESS_TOKEN", "ACCESS_TOKEN_EXPIRATION", "CONFIG_ID", "ID", "LAST_REFRESHED", "LAST_STATUS_UPDATED", "REFRESH_COUNT", "REFRESH_TOKEN", "REFRESH_TOKEN_EXPIRATION", "STATUS") FROM stdin;
\.


--
-- Data for Name: AO_733371_EVENT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_733371_EVENT" ("ACTION", "ACTION_ID", "CREATED", "EVENT_BUNDLE_ID", "EVENT_TYPE", "ID", "USER_KEY") FROM stdin;
\.


--
-- Name: AO_733371_EVENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_733371_EVENT_ID_seq"', 1, false);


--
-- Data for Name: AO_733371_EVENT_PARAMETER; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_733371_EVENT_PARAMETER" ("EVENT_ID", "ID", "NAME", "VALUE") FROM stdin;
\.


--
-- Name: AO_733371_EVENT_PARAMETER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_733371_EVENT_PARAMETER_ID_seq"', 1, false);


--
-- Data for Name: AO_733371_EVENT_RECIPIENT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_733371_EVENT_RECIPIENT" ("CONSUMER_NAME", "CREATED", "EVENT_ID", "ID", "SEND_DATE", "STATUS", "UPDATED", "USER_KEY") FROM stdin;
\.


--
-- Name: AO_733371_EVENT_RECIPIENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_733371_EVENT_RECIPIENT_ID_seq"', 1, false);


--
-- Data for Name: AO_97EDAB_USERINVITATION; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_97EDAB_USERINVITATION" ("APPLICATION_KEYS", "EMAIL_ADDRESS", "EXPIRY", "ID", "REDEEMED", "SENDER_USERNAME", "TOKEN") FROM stdin;
\.


--
-- Name: AO_97EDAB_USERINVITATION_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_97EDAB_USERINVITATION_ID_seq"', 1, false);


--
-- Data for Name: AO_A0B856_WEB_HOOK_LISTENER_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_A0B856_WEB_HOOK_LISTENER_AO" ("DESCRIPTION", "ENABLED", "EVENTS", "EXCLUDE_BODY", "FILTERS", "ID", "LAST_UPDATED", "LAST_UPDATED_USER", "NAME", "PARAMETERS", "REGISTRATION_METHOD", "URL") FROM stdin;
\.


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq"', 1, false);


--
-- Data for Name: AO_AC3877_RL_USER_COUNTER; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_AC3877_RL_USER_COUNTER" ("ID", "INTERVAL_START", "NODE_ID", "REJECT_COUNT", "USER_ID") FROM stdin;
\.


--
-- Name: AO_AC3877_RL_USER_COUNTER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_AC3877_RL_USER_COUNTER_ID_seq"', 1, false);


--
-- Data for Name: AO_AC3877_SETTINGS_VERSION; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_AC3877_SETTINGS_VERSION" ("TYPE", "VERSION") FROM stdin;
DEFAULT	1
\.


--
-- Data for Name: AO_AC3877_SYSTEM_RL_SETTINGS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_AC3877_SYSTEM_RL_SETTINGS" ("CAPACITY", "CLEAN_JOB_DURATION", "FILL_RATE", "FLUSH_JOB_DURATION", "INTERVAL_FREQUENCY", "INTERVAL_TIME_UNIT", "MODE", "NAME", "REAPER_JOB_DURATION", "RETENTION_PERIOD_DURATION", "SETTINGS_RELOAD_JOB_DURATION") FROM stdin;
50	PT1M10S	10	PT5M	1	SECONDS	OFF	SYSTEM	PT15M	PT24H	PT1M
\.


--
-- Data for Name: AO_AC3877_USER_RL_SETTINGS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_AC3877_USER_RL_SETTINGS" ("CAPACITY", "FILL_RATE", "INTERVAL_FREQUENCY", "INTERVAL_TIME_UNIT", "USER_ID", "WHITELISTED") FROM stdin;
\.


--
-- Data for Name: AO_B9A0F0_APPLIED_TEMPLATE; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_B9A0F0_APPLIED_TEMPLATE" ("ID", "PROJECT_ID", "PROJECT_TEMPLATE_MODULE_KEY", "PROJECT_TEMPLATE_WEB_ITEM_KEY") FROM stdin;
1	10000	com.pyxis.greenhopper.jira:gh-scrum-template	com.pyxis.greenhopper.jira:gh-scrum-template
\.


--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_B9A0F0_APPLIED_TEMPLATE_ID_seq"', 1, true);


--
-- Data for Name: AO_C16815_ALERT_AO; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_C16815_ALERT_AO" ("CREATED_DATE", "DETAILS_JSON", "ID", "ISSUE_COMPONENT_ID", "ISSUE_ID", "ISSUE_SEVERITY", "NODE_NAME", "TRIGGER_MODULE", "TRIGGER_PLUGIN_KEY", "TRIGGER_PLUGIN_KEY_VERSION", "TRIGGER_PLUGIN_VERSION") FROM stdin;
\.


--
-- Name: AO_C16815_ALERT_AO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_C16815_ALERT_AO_ID_seq"', 1, false);


--
-- Data for Name: AO_C77861_AUDIT_ENTITY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_C77861_AUDIT_ENTITY" ("ACTION", "ACTION_T_KEY", "AREA", "ATTRIBUTES", "CATEGORY", "CATEGORY_T_KEY", "CHANGE_VALUES", "ENTITY_TIMESTAMP", "ID", "LEVEL", "METHOD", "NODE", "PRIMARY_RESOURCE_ID", "PRIMARY_RESOURCE_TYPE", "RESOURCES", "RESOURCE_ID_3", "RESOURCE_ID_4", "RESOURCE_ID_5", "RESOURCE_TYPE_3", "RESOURCE_TYPE_4", "RESOURCE_TYPE_5", "SEARCH_STRING", "SECONDARY_RESOURCE_ID", "SECONDARY_RESOURCE_TYPE", "SOURCE", "SYSTEM_INFO", "USER_ID", "USER_NAME", "USER_TYPE") FROM stdin;
Группа создана	jira.auditing.group.created	USER_MANAGEMENT	[]	управление группой	jira.auditing.category.groupmanagement	[]	1611610086888	1	BASE	Browser	\N	\N	GROUP	[{"name":"jira-software-users","type":"GROUP","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	jira-software-users jira.auditing.group.created jira.auditing.category.groupmanagement группа создана управление группой anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-software-users"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Bulk Change"}]	1611610087012	2	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-software-users"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Browse Users"}]	1611610087021	3	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-software-users"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Group Filter Subscriptions"}]	1611610087026	4	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-software-users"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Create Shared Objects"}]	1611610087032	5	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Добавлена новая лицензия	jira.auditing.system.license.added	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	системы	jira.auditing.category.system	[{"i18nKey":"Support Entitlement Number (SEN)","key":"Support Entitlement Number (SEN)","from":"","to":"SEN-L16682303"},{"i18nKey":"Date Purchased","key":"Date Purchased","from":"","to":"24/янв/21"},{"i18nKey":"Server ID","key":"Server ID","from":"","to":"BCRZ-BX9D-FN9G-7911"},{"i18nKey":"Organisation","key":"Organisation","from":"","to":"not a company"},{"i18nKey":"jira-software","key":"jira-software","from":"","to":"-1"},{"i18nKey":"License Type","key":"License Type","from":"","to":"Jira Software (Server): Evaluation"},{"i18nKey":"User Limit","key":"User Limit","from":"","to":"Безлимитный"}]	1611610087146	6	BASE	Browser	\N	0	LICENSE	[{"name":"SEN-L16682303","type":"LICENSE","uri":null,"id":"0"}]	\N	\N	\N	\N	\N	\N	sen-l16682303 jira.auditing.system.license.added jira.auditing.category.system добавлена новая лицензия системы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользователь создан	jira.auditing.user.created	USER_MANAGEMENT	[]	управление пользователями	jira.auditing.category.usermanagement	[{"i18nKey":"Email","key":"Email","from":"","to":"aleksandr.oliferuk@gmail.com"},{"i18nKey":"Username","key":"Username","from":"","to":"aleksandr.oliferuk"},{"i18nKey":"Active / Inactive","key":"Active / Inactive","from":"","to":"Active"},{"i18nKey":"Full name","key":"Full name","from":"","to":"Aleksandr Oliferuk"}]	1611610330486	7	BASE	Browser	\N	JIRAUSER10000	USER	[{"name":"aleksandr.oliferuk","type":"USER","uri":null,"id":"JIRAUSER10000"}]	\N	\N	\N	\N	\N	\N	aleksandr.oliferuk jira.auditing.user.created jira.auditing.category.usermanagement пользователь создан управление пользователями anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользователь добавлен в группу	jira.auditing.user.added.to.group	USER_MANAGEMENT	[]	управление группой	jira.auditing.category.groupmanagement	[]	1611610330568	8	BASE	Browser	\N	\N	GROUP	[{"name":"jira-administrators","type":"GROUP","uri":null,"id":null},{"name":"aleksandr.oliferuk","type":"USER","uri":null,"id":"JIRAUSER10000"}]	\N	\N	\N	\N	\N	\N	jira-administrators aleksandr.oliferuk jira.auditing.user.added.to.group jira.auditing.category.groupmanagement пользователь добавлен в группу управление группой anonymous 10.0.2.2	JIRAUSER10000	USER	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Bulk Change"}]	1611610330626	9	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Create Shared Objects"}]	1611610330633	10	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Browse Users"}]	1611610330641	11	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Общие права доступа добавлены	jira.auditing.global.permission.added	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Group","key":"Group","from":"","to":"jira-administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Group Filter Subscriptions"}]	1611610330649	12	BASE	Browser	\N	\N	PERMISSIONS	[{"name":"Global Permissions","type":"PERMISSIONS","uri":null,"id":null}]	\N	\N	\N	\N	\N	\N	global permissions jira.auditing.global.permission.added jira.auditing.category.permissions общие права доступа добавлены anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Глобальный рейтинг"},{"i18nKey":"Description","key":"Description","from":"","to":"Поле «Глобальный рейтинг». Только для использования в Jira Software."},{"i18nKey":"Name","key":"Name","from":"","to":"Рейтинг"}]	1611610333902	14	BASE	Browser	\N	customfield_10100	CUSTOM_FIELD	[{"name":"Рейтинг","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10100"}]	\N	\N	\N	\N	\N	\N	рейтинг jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Отношение ссылок на эпик"},{"i18nKey":"Description","key":"Description","from":"","to":"Выберите эпик для присвоения данной проблемы."},{"i18nKey":"Name","key":"Name","from":"","to":"Ссылка на эпик"}]	1611610333967	15	BASE	Browser	\N	customfield_10101	CUSTOM_FIELD	[{"name":"Ссылка на эпик","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10101"}]	\N	\N	\N	\N	\N	\N	ссылка на эпик jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Статус эпика"},{"i18nKey":"Description","key":"Description","from":"","to":"Поле «Статус эпика». Только для использования в Jira Software."},{"i18nKey":"Name","key":"Name","from":"","to":"Статус эпика"}]	1611610334048	16	BASE	Browser	\N	customfield_10102	CUSTOM_FIELD	[{"name":"Статус эпика","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10102"}]	\N	\N	\N	\N	\N	\N	статус эпика jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Число (целое или дробное)"},{"i18nKey":"Description","key":"Description","from":"","to":"Измерение сложности и/или объема требований."},{"i18nKey":"Name","key":"Name","from":"","to":"Исторические точки"}]	1611610337882	22	BASE	Browser	\N	customfield_10106	CUSTOM_FIELD	[{"name":"Исторические точки","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10106"}]	\N	\N	\N	\N	\N	\N	исторические точки jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Проектная роль"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Sprints"}]	1611610338429	23	BASE	Browser	\N	0	SCHEME	[{"name":"Default Permission Scheme","type":"SCHEME","uri":null,"id":"0"}]	\N	\N	\N	\N	\N	\N	default permission scheme jira.auditing.permission.scheme.updated jira.auditing.category.permissions схема прав доступа обновлена права anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"Проектная роль","to":""},{"i18nKey":"Value","key":"Value","from":"Administrators","to":""},{"i18nKey":"Permission","key":"Permission","from":"Manage Sprints","to":""}]	1611610338452	24	BASE	Browser	\N	0	SCHEME	[{"name":"Default Permission Scheme","type":"SCHEME","uri":null,"id":"0"}]	\N	\N	\N	\N	\N	\N	default permission scheme jira.auditing.permission.scheme.updated jira.auditing.category.permissions схема прав доступа обновлена права anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Проектная роль"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Sprints"}]	1611610338462	25	BASE	Browser	\N	0	SCHEME	[{"name":"Default Permission Scheme","type":"SCHEME","uri":null,"id":"0"}]	\N	\N	\N	\N	\N	\N	default permission scheme jira.auditing.permission.scheme.updated jira.auditing.category.permissions схема прав доступа обновлена права anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользователь добавлен в группу	jira.auditing.user.added.to.group	USER_MANAGEMENT	[]	управление группой	jira.auditing.category.groupmanagement	[]	1611610330659	13	BASE	Browser	\N	\N	GROUP	[{"name":"jira-software-users","type":"GROUP","uri":null,"id":null},{"name":"aleksandr.oliferuk","type":"USER","uri":null,"id":"JIRAUSER10000"}]	\N	\N	\N	\N	\N	\N	jira-software-users aleksandr.oliferuk jira.auditing.user.added.to.group jira.auditing.category.groupmanagement пользователь добавлен в группу управление группой anonymous 10.0.2.2	JIRAUSER10000	USER	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Название Эпики"},{"i18nKey":"Description","key":"Description","from":"","to":"Укажите краткое имя для идентификации данного эпика."},{"i18nKey":"Name","key":"Name","from":"","to":"Имя эпика"}]	1611610334079	17	BASE	Browser	\N	customfield_10103	CUSTOM_FIELD	[{"name":"Имя эпика","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10103"}]	\N	\N	\N	\N	\N	\N	имя эпика jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Цвет эпика"},{"i18nKey":"Description","key":"Description","from":"","to":"Поле «Цвет эпика». Только для использования в Jira Software."},{"i18nKey":"Name","key":"Name","from":"","to":"Цвет эпика"}]	1611610334156	18	BASE	Browser	\N	customfield_10104	CUSTOM_FIELD	[{"name":"Цвет эпика","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10104"}]	\N	\N	\N	\N	\N	\N	цвет эпика jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Пользовательские поля созданы	jira.auditing.customfield.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	поля	jira.auditing.category.fields	[{"i18nKey":"Type","key":"Type","from":"","to":"Поле «Cпринт» в Jira"},{"i18nKey":"Description","key":"Description","from":"","to":"Поле «Cпринт» в Jira Software"},{"i18nKey":"Name","key":"Name","from":"","to":"Спринт"}]	1611610334247	19	BASE	Browser	\N	customfield_10105	CUSTOM_FIELD	[{"name":"Спринт","type":"CUSTOM_FIELD","uri":null,"id":"customfield_10105"}]	\N	\N	\N	\N	\N	\N	спринт jira.auditing.customfield.created jira.auditing.category.fields пользовательские поля созданы anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Тип задачи создан	jira.auditing.issue.type.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	типы проблем	jira.auditing.category.issuetypes	[]	1611610337766	20	BASE	Browser	\N	10000	ISSUE_TYPE	[{"name":"Epic","type":"ISSUE_TYPE","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	epic jira.auditing.issue.type.created jira.auditing.category.issuetypes тип задачи создан типы проблем anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Тип задачи создан	jira.auditing.issue.type.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	типы проблем	jira.auditing.category.issuetypes	[]	1611610337839	21	BASE	Browser	\N	10001	ISSUE_TYPE	[{"name":"История","type":"ISSUE_TYPE","uri":null,"id":"10001"}]	\N	\N	\N	\N	\N	\N	история jira.auditing.issue.type.created jira.auditing.category.issuetypes тип задачи создан типы проблем anonymous 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	-2	Anonymous	user
Создана новая резолюция	jira.auditing.resolutions.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[{"nameI18nKey":"common.concepts.description","name":"Описание","value":"Для этой проблемы работа завершена."}]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391413	26	BASE	Browser	\N	10000	RESOLUTION	[{"name":"Готово","type":"RESOLUTION","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	готово jira.auditing.resolutions.created jira.auditing.category.workflows создана новая резолюция рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Создана новая резолюция	jira.auditing.resolutions.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[{"nameI18nKey":"common.concepts.description","name":"Описание","value":"Данная проблема не будет выполняться."}]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391423	27	BASE	Browser	\N	10001	RESOLUTION	[{"name":"Не получится","type":"RESOLUTION","uri":null,"id":"10001"}]	\N	\N	\N	\N	\N	\N	не получится jira.auditing.resolutions.created jira.auditing.category.workflows создана новая резолюция рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Создана новая резолюция	jira.auditing.resolutions.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[{"nameI18nKey":"common.concepts.description","name":"Описание","value":"Проблема является дубликатом существующей проблемы."}]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391427	28	BASE	Browser	\N	10002	RESOLUTION	[{"name":"Дубликат","type":"RESOLUTION","uri":null,"id":"10002"}]	\N	\N	\N	\N	\N	\N	дубликат jira.auditing.resolutions.created jira.auditing.category.workflows создана новая резолюция рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Создана новая резолюция	jira.auditing.resolutions.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[{"nameI18nKey":"common.concepts.description","name":"Описание","value":"Не удалась ни одна попытка воспроизведения этой проблемы; возможно, было недостаточно информации. Чтение кода не дает какой-либо информации о причинах такого поведения. Если впоследствии появятся новые данные, откройте эту проблему заново."}]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391432	29	BASE	Browser	\N	10003	RESOLUTION	[{"name":"Не воспроизводится","type":"RESOLUTION","uri":null,"id":"10003"}]	\N	\N	\N	\N	\N	\N	не воспроизводится jira.auditing.resolutions.created jira.auditing.category.workflows создана новая резолюция рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Создана новая резолюция	jira.auditing.resolutions.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[{"nameI18nKey":"common.concepts.description","name":"Описание","value":"GreenHopper Managed Resolution"}]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391825	30	BASE	Browser	\N	10004	RESOLUTION	[{"name":"Done","type":"RESOLUTION","uri":null,"id":"10004"}]	\N	\N	\N	\N	\N	\N	done jira.auditing.resolutions.created jira.auditing.category.workflows создана новая резолюция рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Рабочий процесс создан	jira.auditing.workflow.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	рабочие процессы	jira.auditing.category.workflows	[{"i18nKey":"Status","key":"Status","from":"","to":"To Do, In Progress, Done"},{"i18nKey":"Description","key":"Description","from":"","to":"Generated by JIRA Software version 8.13.3. This workflow is managed internally by Jira Software. Do not manually modify this workflow."},{"i18nKey":"Transition","key":"Transition","from":"","to":"Create (To Do), To Do (To Do), In Progress (In Progress), Done (Done)"},{"i18nKey":"Name","key":"Name","from":"","to":"Software Simplified Workflow for Project AOSP"}]	1611610391889	31	BASE	Browser	\N	Software Simplified Workflow for Project AOSP	WORKFLOW	[{"name":"Software Simplified Workflow for Project AOSP","type":"WORKFLOW","uri":null,"id":"Software Simplified Workflow for Project AOSP"}]	\N	\N	\N	\N	\N	\N	software simplified workflow for project aosp jira.auditing.workflow.created jira.auditing.category.workflows рабочий процесс создан рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема рабочего процесса создана	jira.auditing.workflow.scheme.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	рабочие процессы	jira.auditing.category.workflows	[{"i18nKey":"Description","key":"Description","from":"","to":"Generated by JIRA Software version 8.13.3. This workflow scheme is managed internally by Jira Software. Do not manually modify this workflow scheme."},{"i18nKey":"Name","key":"Name","from":"","to":"AOSP: Software Simplified Workflow Scheme"}]	1611610391922	32	BASE	Browser	\N	10100	SCHEME	[{"name":"AOSP: Software Simplified Workflow Scheme","type":"SCHEME","uri":null,"id":"10100"}]	\N	\N	\N	\N	\N	\N	aosp: software simplified workflow scheme jira.auditing.workflow.scheme.created jira.auditing.category.workflows схема рабочего процесса создана рабочие процессы aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема рабочего процесса добавлена в проект	jira.auditing.workflow.scheme.added.to.project	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	рабочие процессы	jira.auditing.category.workflows	[]	1611610391968	33	BASE	Browser	\N	10000	PROJECT	[{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"},{"name":"AOSP: Software Simplified Workflow Scheme","type":"SCHEME","uri":null,"id":"10100"}]	\N	\N	\N	\N	\N	\N	aleksandr oliferuk sample project aosp: software simplified workflow scheme jira.auditing.workflow.scheme.added.to.project jira.auditing.category.workflows схема рабочего процесса добавлена в проект рабочие процессы aleksandr.oliferuk 10.0.2.2	10100	SCHEME	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Фильтр создан	jira.auditing.filter.created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	филтьтры	jira.auditing.category.filters	[{"i18nKey":"Owner","key":"Owner","from":"","to":"aleksandr.oliferuk"},{"i18nKey":"Description","key":"Description","from":"","to":""},{"i18nKey":"JQL Query","key":"JQL Query","from":"","to":"{project = \\"AOSP\\"} order by Рейтинг ASC"},{"i18nKey":"Shared with","key":"Shared with","from":"[]","to":"[Project: Aleksandr Oliferuk Sample Project (VIEW)]"},{"i18nKey":"Name","key":"Name","from":"","to":"Filter for AOSP board"}]	1611610392114	34	BASE	Browser	\N	10000	FILTER	[{"name":"Filter for AOSP board","type":"FILTER","uri":null,"id":"10000"},{"name":"aleksandr.oliferuk","type":"USER","uri":null,"id":"JIRAUSER10000"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	10000	\N	\N	PROJECT	\N	\N	filter for aosp board aleksandr.oliferuk aleksandr oliferuk sample project jira.auditing.filter.created jira.auditing.category.filters фильтр создан филтьтры 10.0.2.2	JIRAUSER10000	USER	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Board created	Board created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	досок	jira.auditing.category.boards	[]	1611610392390	35	BASE	Browser	\N	1	BOARD	[{"name":"AOSP board","type":"BOARD","uri":null,"id":"1"},{"name":"AOSP board","type":"BOARD","uri":null,"id":"1"}]	\N	\N	\N	\N	\N	\N	aosp board created jira.auditing.category.boards досок aleksandr.oliferuk 10.0.2.2	1	BOARD	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа создана	jira.auditing.permission.scheme.created	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Description","key":"Description","from":"","to":"Схема по умолчанию для проектов \\"Программа\\"."},{"i18nKey":"Name","key":"Name","from":"","to":"Схема для программ по умолчанию"}]	1611610392504	36	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.created jira.auditing.category.permissions прав доступа создана права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Browse Projects"}]	1611610392516	37	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Create Issues"}]	1611610392530	38	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit Issues"}]	1611610392540	39	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Assign Issues"}]	1611610392544	40	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Resolve Issues"}]	1611610392552	41	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Assignable User"}]	1611610392572	44	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Close Issues"}]	1611610392578	45	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Create Attachments"}]	1611610392584	46	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Move Issues"}]	1611610392627	50	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Modify Reporter"}]	1611610392638	52	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"View Voters and Watchers"}]	1611610392646	53	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Add Comments"}]	1611610392557	42	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete Issues"}]	1611610392566	43	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Work On Issues"}]	1611610392589	47	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Link Issues"}]	1611610392604	48	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Administer Projects"}]	1611610392620	49	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Schedule Issues"}]	1611610392632	51	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Watchers"}]	1611610392652	54	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit All Comments"}]	1611610392656	55	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete All Attachments"}]	1611610392678	59	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit Own Comments"}]	1611610392662	56	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete All Comments"}]	1611610392667	57	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete Own Comments"}]	1611610392671	58	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete Own Worklogs"}]	1611610392709	63	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete All Worklogs"}]	1611610392714	64	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"View Read-Only Workflow"}]	1611610392719	65	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Transition Issues"}]	1611610392723	66	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"View Development Tools"}]	1611610392728	67	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Тип задачи создан	jira.auditing.issue.type.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	типы проблем	jira.auditing.category.issuetypes	[]	1611610394917	79	BASE	Browser	\N	10005	ISSUE_TYPE	[{"name":"Sub-task","type":"ISSUE_TYPE","uri":null,"id":"10005"}]	\N	\N	\N	\N	\N	\N	sub-task jira.auditing.issue.type.created jira.auditing.category.issuetypes тип задачи создан типы проблем aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Тип задачи создан	jira.auditing.issue.type.created	GLOBAL_CONFIG_AND_ADMINISTRATION	[]	типы проблем	jira.auditing.category.issuetypes	[]	1611610395319	80	BASE	Browser	\N	10006	ISSUE_TYPE	[{"name":"Bug","type":"ISSUE_TYPE","uri":null,"id":"10006"}]	\N	\N	\N	\N	\N	\N	bug jira.auditing.issue.type.created jira.auditing.category.issuetypes тип задачи создан типы проблем aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Delete Own Attachments"}]	1611610392684	60	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit Own Worklogs"}]	1611610392691	61	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Project Role"},{"i18nKey":"Value","key":"Value","from":"","to":"Administrators"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit All Worklogs"}]	1611610392704	62	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Manage Sprints"}]	1611610392732	68	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Start/Complete Sprints"}]	1611610392739	69	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа обновлена	jira.auditing.permission.scheme.updated	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[{"i18nKey":"Type","key":"Type","from":"","to":"Application access"},{"i18nKey":"Permission","key":"Permission","from":"","to":"Edit Sprints"}]	1611610392743	70	BASE	Browser	\N	10000	SCHEME	[{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	схема для программ по умолчанию jira.auditing.permission.scheme.updated jira.auditing.category.permissions прав доступа обновлена права aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа удалена с проекта	jira.auditing.permission.scheme.removed.from.project	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[]	1611610392762	71	BASE	Browser	\N	10000	PROJECT	[{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"},{"name":"Default Permission Scheme","type":"SCHEME","uri":null,"id":"0"}]	\N	\N	\N	\N	\N	\N	aleksandr oliferuk sample project default permission scheme jira.auditing.permission.scheme.removed.from.project jira.auditing.category.permissions схема прав доступа удалена с проекта права aleksandr.oliferuk 10.0.2.2	0	SCHEME	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Схема прав доступа добавлена в проект	jira.auditing.permission.scheme.added.to.project	PERMISSIONS	[]	права доступа	jira.auditing.category.permissions	[]	1611610392781	72	BASE	Browser	\N	10000	PROJECT	[{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"},{"name":"Схема для программ по умолчанию","type":"SCHEME","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	aleksandr oliferuk sample project схема для программ по умолчанию jira.auditing.permission.scheme.added.to.project jira.auditing.category.permissions прав доступа добавлена в проект права aleksandr.oliferuk 10.0.2.2	10000	SCHEME	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Проект создан	jira.auditing.project.created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[{"i18nKey":"admin.projects.default.assignee","key":"Исполнитель по умолчанию","from":"","to":"Unassigned"},{"i18nKey":"common.concepts.projectlead","key":"Руководитель проекта","from":"","to":"aleksandr.oliferuk"},{"i18nKey":"common.words.name","key":"Название","from":"","to":"Aleksandr Oliferuk Sample Project"},{"i18nKey":"common.concepts.description","key":"Описание","from":"","to":""},{"i18nKey":"common.words.key","key":"Код","from":"","to":"AOSP"}]	1611610392905	73	BASE	Browser	\N	10000	PROJECT	[{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"},{"name":"aleksandr.oliferuk","type":"USER","uri":null,"id":"JIRAUSER10000"}]	\N	\N	\N	\N	\N	\N	aleksandr oliferuk sample project aleksandr.oliferuk jira.auditing.project.created jira.auditing.category.projects проект создан проекты 10.0.2.2	JIRAUSER10000	USER	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Роли проекта изменились	jira.auditing.project.roles.changed	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[{"i18nKey":"admin.common.words.users","key":"Пользователи","from":null,"to":"JIRAUSER10000"}]	1611610393147	74	BASE	Browser	\N	10100	PROJECT_ROLE	[{"name":"Developers","type":"PROJECT_ROLE","uri":null,"id":"10100"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	developers aleksandr oliferuk sample project jira.auditing.project.roles.changed jira.auditing.category.projects роли проекта изменились проекты aleksandr.oliferuk 10.0.2.2	10000	PROJECT	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Созданная версия проекта	jira.auditing.version.created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[{"i18nKey":"Release date","key":"Release date","from":"","to":"2021-01-18"},{"i18nKey":"Name","key":"Name","from":"","to":"Version 1.0"}]	1611610393170	75	BASE	Browser	\N	10000	VERSION	[{"name":"Version 1.0","type":"VERSION","uri":null,"id":"10000"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	version 1.0 aleksandr oliferuk sample project jira.auditing.version.created jira.auditing.category.projects созданная версия проекта проекты aleksandr.oliferuk 10.0.2.2	10000	PROJECT	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Проект выпустил версию	jira.auditing.version.released	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[]	1611610393189	76	BASE	Browser	\N	10000	VERSION	[{"name":"Version 1.0","type":"VERSION","uri":null,"id":"10000"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	version 1.0 aleksandr oliferuk sample project jira.auditing.version.released jira.auditing.category.projects проект выпустил версию проекты aleksandr.oliferuk 10.0.2.2	10000	PROJECT	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Созданная версия проекта	jira.auditing.version.created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[{"i18nKey":"Release date","key":"Release date","from":"","to":"2021-02-01"},{"i18nKey":"Name","key":"Name","from":"","to":"Version 2.0"}]	1611610393198	77	BASE	Browser	\N	10001	VERSION	[{"name":"Version 2.0","type":"VERSION","uri":null,"id":"10001"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	version 2.0 aleksandr oliferuk sample project jira.auditing.version.created jira.auditing.category.projects созданная версия проекта проекты aleksandr.oliferuk 10.0.2.2	10000	PROJECT	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Созданная версия проекта	jira.auditing.version.created	LOCAL_CONFIG_AND_ADMINISTRATION	[]	проекты	jira.auditing.category.projects	[{"i18nKey":"Name","key":"Name","from":null,"to":"Version 3.0"}]	1611610393204	78	BASE	Browser	\N	10002	VERSION	[{"name":"Version 3.0","type":"VERSION","uri":null,"id":"10002"},{"name":"Aleksandr Oliferuk Sample Project","type":"PROJECT","uri":null,"id":"10000"}]	\N	\N	\N	\N	\N	\N	version 3.0 aleksandr oliferuk sample project jira.auditing.version.created jira.auditing.category.projects созданная версия проекта проекты aleksandr.oliferuk 10.0.2.2	10000	PROJECT	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Пользователь создан	jira.auditing.user.created	USER_MANAGEMENT	[]	управление пользователями	jira.auditing.category.usermanagement	[{"i18nKey":"Email","key":"Email","from":"","to":"aleksandr.oliferuk@gmail.com"},{"i18nKey":"Username","key":"Username","from":"","to":"jira.otus"},{"i18nKey":"Active / Inactive","key":"Active / Inactive","from":"","to":"Active"},{"i18nKey":"Full name","key":"Full name","from":"","to":"Jira Otus"}]	1611650913510	81	BASE	Browser	\N	JIRAUSER10100	USER	[{"name":"jira.otus","type":"USER","uri":null,"id":"JIRAUSER10100"}]	\N	\N	\N	\N	\N	\N	jira.otus jira.auditing.user.created jira.auditing.category.usermanagement пользователь создан управление пользователями aleksandr.oliferuk 10.0.2.2	\N	\N	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Пользователь добавлен в группу	jira.auditing.user.added.to.group	USER_MANAGEMENT	[]	управление группой	jira.auditing.category.groupmanagement	[]	1611650913580	82	BASE	Browser	\N	\N	GROUP	[{"name":"jira-software-users","type":"GROUP","uri":null,"id":null},{"name":"jira.otus","type":"USER","uri":null,"id":"JIRAUSER10100"}]	\N	\N	\N	\N	\N	\N	jira-software-users jira.otus jira.auditing.user.added.to.group jira.auditing.category.groupmanagement пользователь добавлен в группу управление группой aleksandr.oliferuk 10.0.2.2	JIRAUSER10100	USER	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
Пользователь добавлен в группу	jira.auditing.user.added.to.group	USER_MANAGEMENT	[]	управление группой	jira.auditing.category.groupmanagement	[]	1611650923759	83	BASE	Browser	\N	\N	GROUP	[{"name":"jira-administrators","type":"GROUP","uri":null,"id":null},{"name":"jira.otus","type":"USER","uri":null,"id":"JIRAUSER10100"}]	\N	\N	\N	\N	\N	\N	jira-administrators jira.otus jira.auditing.user.added.to.group jira.auditing.category.groupmanagement пользователь добавлен в группу управление группой aleksandr.oliferuk 10.0.2.2	JIRAUSER10100	USER	10.0.2.2	http://192.168.12.43:8081	10000	aleksandr.oliferuk	ApplicationUser
\.


--
-- Name: AO_C77861_AUDIT_ENTITY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_C77861_AUDIT_ENTITY_ID_seq"', 83, true);


--
-- Data for Name: AO_CFF990_AOTRANSITION_FAILURE; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_CFF990_AOTRANSITION_FAILURE" ("ERROR_MESSAGES", "FAILURE_TIME", "ID", "ISSUE_ID", "LOG_REFERRAL_HASH", "TRANSITION_ID", "TRIGGER_ID", "USER_KEY", "WORKFLOW_ID") FROM stdin;
\.


--
-- Name: AO_CFF990_AOTRANSITION_FAILURE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_CFF990_AOTRANSITION_FAILURE_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_BRANCH; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_BRANCH" ("ID", "NAME", "REPOSITORY_ID") FROM stdin;
\.


--
-- Data for Name: AO_E8B6CC_BRANCH_HEAD_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_BRANCH_HEAD_MAPPING" ("BRANCH_NAME", "HEAD", "ID", "REPOSITORY_ID") FROM stdin;
\.


--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_BRANCH_HEAD_MAPPING_ID_seq"', 1, false);


--
-- Name: AO_E8B6CC_BRANCH_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_BRANCH_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_CHANGESET_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_CHANGESET_MAPPING" ("AUTHOR", "AUTHOR_EMAIL", "BRANCH", "DATE", "FILES_DATA", "FILE_COUNT", "FILE_DETAILS_JSON", "ID", "ISSUE_KEY", "MESSAGE", "NODE", "PARENTS_DATA", "PROJECT_KEY", "RAW_AUTHOR", "RAW_NODE", "REPOSITORY_ID", "SMARTCOMMIT_AVAILABLE", "VERSION") FROM stdin;
\.


--
-- Name: AO_E8B6CC_CHANGESET_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_CHANGESET_MAPPING_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_COMMIT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_COMMIT" ("AUTHOR", "AUTHOR_AVATAR_URL", "DATE", "DOMAIN_ID", "ID", "MERGE", "MESSAGE", "NODE", "RAW_AUTHOR") FROM stdin;
\.


--
-- Name: AO_E8B6CC_COMMIT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_COMMIT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_GIT_HUB_EVENT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_GIT_HUB_EVENT" ("CREATED_AT", "GIT_HUB_ID", "ID", "REPOSITORY_ID", "SAVE_POINT") FROM stdin;
\.


--
-- Name: AO_E8B6CC_GIT_HUB_EVENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_GIT_HUB_EVENT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ISSUE_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ISSUE_MAPPING" ("ID", "ISSUE_ID", "NODE", "PROJECT_KEY", "REPOSITORY_URI") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ISSUE_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ISSUE_MAPPING_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ISSUE_MAPPING_V2; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ISSUE_MAPPING_V2" ("AUTHOR", "BRANCH", "DATE", "FILES_DATA", "ID", "ISSUE_ID", "MESSAGE", "NODE", "PARENTS_DATA", "RAW_AUTHOR", "RAW_NODE", "REPOSITORY_ID", "VERSION") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ISSUE_MAPPING_V2_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ISSUE_TO_BRANCH; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ISSUE_TO_BRANCH" ("BRANCH_ID", "ID", "ISSUE_KEY") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ISSUE_TO_BRANCH_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ISSUE_TO_CHANGESET; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ISSUE_TO_CHANGESET" ("CHANGESET_ID", "ID", "ISSUE_KEY", "PROJECT_KEY") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ISSUE_TO_CHANGESET_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_MESSAGE; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_MESSAGE" ("ADDRESS", "ID", "PAYLOAD", "PAYLOAD_TYPE", "PRIORITY") FROM stdin;
\.


--
-- Name: AO_E8B6CC_MESSAGE_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_MESSAGE_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" ("ID", "LAST_FAILED", "MESSAGE_ID", "QUEUE", "RETRIES_COUNT", "STATE", "STATE_INFO") FROM stdin;
\.


--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_MESSAGE_QUEUE_ITEM_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_MESSAGE_TAG; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_MESSAGE_TAG" ("ID", "MESSAGE_ID", "TAG") FROM stdin;
\.


--
-- Name: AO_E8B6CC_MESSAGE_TAG_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_MESSAGE_TAG_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ORGANIZATION_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ORGANIZATION_MAPPING" ("ACCESS_TOKEN", "ADMIN_PASSWORD", "ADMIN_USERNAME", "APPROVAL_STATE", "AUTOLINK_NEW_REPOS", "DEFAULT_GROUPS_SLUGS", "DVCS_TYPE", "HOST_URL", "ID", "LAST_POLLED", "NAME", "OAUTH_KEY", "OAUTH_SECRET", "PRINCIPAL_ID", "SMARTCOMMITS_FOR_NEW_REPOS") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ORGANIZATION_MAPPING_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_ORG_TO_PROJECT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_ORG_TO_PROJECT" ("ID", "ORGANIZATION_ID", "PROJECT_KEY") FROM stdin;
\.


--
-- Name: AO_E8B6CC_ORG_TO_PROJECT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_ORG_TO_PROJECT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PROJECT_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PROJECT_MAPPING" ("ID", "PASSWORD", "PROJECT_KEY", "REPOSITORY_URI", "USERNAME") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PROJECT_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PROJECT_MAPPING_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PROJECT_MAPPING_V2; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PROJECT_MAPPING_V2" ("ACCESS_TOKEN", "ADMIN_PASSWORD", "ADMIN_USERNAME", "ID", "LAST_COMMIT_DATE", "PROJECT_KEY", "REPOSITORY_NAME", "REPOSITORY_TYPE", "REPOSITORY_URL") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PROJECT_MAPPING_V2_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PR_ISSUE_KEY; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PR_ISSUE_KEY" ("DOMAIN_ID", "ID", "ISSUE_KEY", "PULL_REQUEST_ID") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PR_ISSUE_KEY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PR_ISSUE_KEY_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PR_PARTICIPANT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PR_PARTICIPANT" ("APPROVED", "DOMAIN_ID", "ID", "PULL_REQUEST_ID", "ROLE", "USERNAME") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PR_PARTICIPANT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PR_PARTICIPANT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PR_TO_COMMIT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PR_TO_COMMIT" ("COMMIT_ID", "DOMAIN_ID", "ID", "REQUEST_ID") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PR_TO_COMMIT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PR_TO_COMMIT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_PULL_REQUEST; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_PULL_REQUEST" ("AUTHOR", "COMMENT_COUNT", "CREATED_ON", "DESTINATION_BRANCH", "DOMAIN_ID", "EXECUTED_BY", "ID", "LAST_STATUS", "NAME", "REMOTE_ID", "SOURCE_BRANCH", "SOURCE_REPO", "TO_REPOSITORY_ID", "UPDATED_ON", "URL") FROM stdin;
\.


--
-- Name: AO_E8B6CC_PULL_REQUEST_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_PULL_REQUEST_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_REPOSITORY_MAPPING; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_REPOSITORY_MAPPING" ("ACTIVITY_LAST_SYNC", "DELETED", "FORK", "FORK_OF_NAME", "FORK_OF_OWNER", "FORK_OF_SLUG", "ID", "LAST_CHANGESET_NODE", "LAST_COMMIT_DATE", "LINKED", "LOGO", "NAME", "ORGANIZATION_ID", "SLUG", "SMARTCOMMITS_ENABLED", "UPDATE_LINK_AUTHORISED") FROM stdin;
\.


--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_REPOSITORY_MAPPING_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_REPO_TO_CHANGESET; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_REPO_TO_CHANGESET" ("CHANGESET_ID", "ID", "REPOSITORY_ID") FROM stdin;
\.


--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_REPO_TO_CHANGESET_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_REPO_TO_PROJECT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_REPO_TO_PROJECT" ("ID", "PROJECT_KEY", "REPOSITORY_ID") FROM stdin;
\.


--
-- Name: AO_E8B6CC_REPO_TO_PROJECT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_REPO_TO_PROJECT_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_SYNC_AUDIT_LOG; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_SYNC_AUDIT_LOG" ("END_DATE", "EXC_TRACE", "FIRST_REQUEST_DATE", "FLIGHT_TIME_MS", "ID", "NUM_REQUESTS", "REPO_ID", "START_DATE", "SYNC_STATUS", "SYNC_TYPE", "TOTAL_ERRORS") FROM stdin;
\.


--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_SYNC_AUDIT_LOG_ID_seq"', 1, false);


--
-- Data for Name: AO_E8B6CC_SYNC_EVENT; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_E8B6CC_SYNC_EVENT" ("EVENT_CLASS", "EVENT_DATE", "EVENT_JSON", "ID", "REPO_ID", "SCHEDULED_SYNC") FROM stdin;
\.


--
-- Name: AO_E8B6CC_SYNC_EVENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_E8B6CC_SYNC_EVENT_ID_seq"', 1, false);


--
-- Data for Name: AO_ED669C_SEEN_ASSERTIONS; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public."AO_ED669C_SEEN_ASSERTIONS" ("ASSERTION_ID", "EXPIRY_TIMESTAMP", "ID") FROM stdin;
\.


--
-- Name: AO_ED669C_SEEN_ASSERTIONS_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: jira
--

SELECT pg_catalog.setval('public."AO_ED669C_SEEN_ASSERTIONS_ID_seq"', 1, false);


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.app_user (id, user_key, lower_user_name) FROM stdin;
10000	JIRAUSER10000	aleksandr.oliferuk
10100	JIRAUSER10100	jira.otus
\.


--
-- Data for Name: audit_changed_value; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.audit_changed_value (id, log_id, name, delta_from, delta_to) FROM stdin;
\.


--
-- Data for Name: audit_item; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.audit_item (id, log_id, object_type, object_id, object_name, object_parent_id, object_parent_name) FROM stdin;
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.audit_log (id, remote_address, created, author_key, summary, category, object_type, object_id, object_name, object_parent_id, object_parent_name, author_type, event_source_name, description, long_description, search_field) FROM stdin;
\.


--
-- Data for Name: avatar; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.avatar (id, filename, contenttype, avatartype, owner, systemavatar) FROM stdin;
10000	codegeist.png	image/png	project	\N	1
10321	development_task.svg	image/svg+xml	issuetype	\N	1
10322	feedback.svg	image/svg+xml	issuetype	\N	1
10323	request_access.svg	image/svg+xml	issuetype	\N	1
10001	bird.svg	image/svg+xml	project	\N	1
10324	default.svg	image/svg+xml	project	\N	1
10002	jm_black.png	image/png	project	\N	1
10325	code.svg	image/svg+xml	project	\N	1
10003	jm_brown.png	image/png	project	\N	1
10326	coffee.svg	image/svg+xml	project	\N	1
10004	jm_orange.png	image/png	project	\N	1
10327	design.svg	image/svg+xml	project	\N	1
10005	jm_red.png	image/png	project	\N	1
10328	drill.svg	image/svg+xml	project	\N	1
10006	jm_white.png	image/png	project	\N	1
10329	food.svg	image/svg+xml	project	\N	1
10330	notes.svg	image/svg+xml	project	\N	1
10331	red-flag.svg	image/svg+xml	project	\N	1
10332	science.svg	image/svg+xml	project	\N	1
10333	support.svg	image/svg+xml	project	\N	1
10334	bull.svg	image/svg+xml	user	\N	1
10335	cat.svg	image/svg+xml	user	\N	1
10336	dog.svg	image/svg+xml	user	\N	1
10007	jm_yellow.png	image/png	project	\N	1
10337	female_1.svg	image/svg+xml	user	\N	1
10008	monster.png	image/png	project	\N	1
10338	female_2.svg	image/svg+xml	user	\N	1
10339	female_3.svg	image/svg+xml	user	\N	1
10009	nature.svg	image/svg+xml	project	\N	1
10340	female_4.svg	image/svg+xml	user	\N	1
10010	koala.svg	image/svg+xml	project	\N	1
10011	rocket.svg	image/svg+xml	project	\N	1
10341	ghost.svg	image/svg+xml	user	\N	1
10100	Avatar-1.png	image/png	user	\N	1
10101	Avatar-2.png	image/png	user	\N	1
10342	male_1.svg	image/svg+xml	user	\N	1
10102	Avatar-3.png	image/png	user	\N	1
10103	Avatar-4.png	image/png	user	\N	1
10343	male_2.svg	image/svg+xml	user	\N	1
10104	Avatar-5.png	image/png	user	\N	1
10344	male_3.svg	image/svg+xml	user	\N	1
10105	Avatar-6.png	image/png	user	\N	1
10106	Avatar-7.png	image/png	user	\N	1
10345	male_4.svg	image/svg+xml	user	\N	1
10107	Avatar-8.png	image/png	user	\N	1
10108	Avatar-9.png	image/png	user	\N	1
10346	male_5.svg	image/svg+xml	user	\N	1
10109	Avatar-10.png	image/png	user	\N	1
10347	male_6.svg	image/svg+xml	user	\N	1
10110	Avatar-11.png	image/png	user	\N	1
10348	male_8.svg	image/svg+xml	user	\N	1
10111	Avatar-12.png	image/png	user	\N	1
10349	owl.svg	image/svg+xml	user	\N	1
10350	pirate.svg	image/svg+xml	user	\N	1
10351	robot.svg	image/svg+xml	user	\N	1
10112	Avatar-13.png	image/png	user	\N	1
10352	vampire.svg	image/svg+xml	user	\N	1
10113	Avatar-14.png	image/png	user	\N	1
10114	Avatar-15.png	image/png	user	\N	1
10115	Avatar-16.png	image/png	user	\N	1
10116	Avatar-17.png	image/png	user	\N	1
10117	Avatar-18.png	image/png	user	\N	1
10118	Avatar-19.png	image/png	user	\N	1
10119	Avatar-20.png	image/png	user	\N	1
10120	Avatar-21.png	image/png	user	\N	1
10121	Avatar-22.png	image/png	user	\N	1
10122	Avatar-default.svg	image/svg+xml	user	\N	1
10123	Avatar-unknown.png	image/png	user	\N	1
10200	cloud.svg	image/svg+xml	project	\N	1
10201	spanner.svg	image/svg+xml	project	\N	1
10202	cd.svg	image/svg+xml	project	\N	1
10203	money.svg	image/svg+xml	project	\N	1
10204	mouse-hand.svg	image/svg+xml	project	\N	1
10205	yeti.svg	image/svg+xml	project	\N	1
10206	power.svg	image/svg+xml	project	\N	1
10207	refresh.svg	image/svg+xml	project	\N	1
10208	phone.svg	image/svg+xml	project	\N	1
10209	settings.svg	image/svg+xml	project	\N	1
10210	storm.svg	image/svg+xml	project	\N	1
10211	plane.svg	image/svg+xml	project	\N	1
10300	genericissue.svg	image/svg+xml	issuetype	\N	1
10303	bug.svg	image/svg+xml	issuetype	\N	1
10304	defect.svg	image/svg+xml	issuetype	\N	1
10306	documentation.svg	image/svg+xml	issuetype	\N	1
10307	epic.svg	image/svg+xml	issuetype	\N	1
10308	exclamation.svg	image/svg+xml	issuetype	\N	1
10309	design_task.svg	image/svg+xml	issuetype	\N	1
10310	improvement.svg	image/svg+xml	issuetype	\N	1
10311	newfeature.svg	image/svg+xml	issuetype	\N	1
10312	remove_feature.svg	image/svg+xml	issuetype	\N	1
10313	requirement.svg	image/svg+xml	issuetype	\N	1
10314	sales.svg	image/svg+xml	issuetype	\N	1
10315	story.svg	image/svg+xml	issuetype	\N	1
10316	subtask.svg	image/svg+xml	issuetype	\N	1
10318	task.svg	image/svg+xml	issuetype	\N	1
10320	question.svg	image/svg+xml	issuetype	\N	1
10500	female_5.svg	image/svg+xml	user	\N	1
10501	female_6.svg	image/svg+xml	user	\N	1
10502	female_7.svg	image/svg+xml	user	\N	1
10503	female_8.svg	image/svg+xml	user	\N	1
10504	female_9.svg	image/svg+xml	user	\N	1
10505	male_7.svg	image/svg+xml	user	\N	1
10506	male_9.svg	image/svg+xml	user	\N	1
10507	pirate_female.svg	image/svg+xml	user	\N	1
10508	princess.svg	image/svg+xml	user	\N	1
10509	spectrum.svg	image/svg+xml	project	\N	1
\.


--
-- Data for Name: board; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.board (id, jql) FROM stdin;
\.


--
-- Data for Name: boardproject; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.boardproject (board_id, project_id) FROM stdin;
\.


--
-- Data for Name: changegroup; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.changegroup (id, issueid, author, created) FROM stdin;
10000	10010	JIRAUSER10000	2021-01-22 03:25:13.064+03
10001	10011	JIRAUSER10000	2021-01-23 00:50:13.067+03
10002	10009	JIRAUSER10000	2021-01-18 15:23:13.064+03
10003	10012	JIRAUSER10000	2021-01-18 15:23:13.067+03
10004	10013	JIRAUSER10000	2021-01-24 20:23:13.068+03
10005	10014	JIRAUSER10000	2021-01-18 15:23:13.068+03
10006	10014	JIRAUSER10000	2021-01-20 20:07:13.068+03
10007	10014	JIRAUSER10000	2021-01-23 05:59:13.069+03
10008	10015	JIRAUSER10000	2021-01-04 14:13:13.069+03
10009	10015	JIRAUSER10000	2021-01-18 15:23:13.069+03
10010	10015	JIRAUSER10000	2021-01-18 20:07:13.069+03
10011	10015	JIRAUSER10000	2021-01-19 21:55:13.069+03
10012	10016	JIRAUSER10000	2021-01-18 15:23:13.069+03
10013	10016	JIRAUSER10000	2021-01-19 02:07:13.069+03
10014	10016	JIRAUSER10000	2021-01-22 07:59:13.069+03
10015	10017	JIRAUSER10000	2021-01-04 14:13:13.069+03
10016	10017	JIRAUSER10000	2021-01-05 10:43:13.069+03
10017	10018	JIRAUSER10000	2021-01-04 14:13:13.07+03
10018	10018	JIRAUSER10000	2021-01-08 10:37:13.07+03
10019	10019	JIRAUSER10000	2021-01-04 14:13:13.07+03
10020	10019	JIRAUSER10000	2021-01-09 23:12:13.07+03
10021	10020	JIRAUSER10000	2021-01-04 14:13:13.07+03
10022	10020	JIRAUSER10000	2021-01-12 05:50:13.07+03
10023	10021	JIRAUSER10000	2021-01-04 14:13:13.071+03
10024	10021	JIRAUSER10000	2021-01-14 21:10:13.071+03
10025	10022	JIRAUSER10000	2021-01-04 14:13:13.072+03
10026	10022	JIRAUSER10000	2021-01-16 22:48:13.072+03
\.


--
-- Data for Name: changeitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.changeitem (id, groupid, fieldtype, field, oldvalue, oldstring, newvalue, newstring) FROM stdin;
10000	10000	jira	status	10000	To Do	3	In Progress
10001	10001	jira	status	10000	To Do	3	In Progress
10002	10002	custom	Sprint	\N			Sample Sprint 2
10003	10003	custom	Sprint	\N			Sample Sprint 2
10004	10004	custom	Sprint	\N			Sample Sprint 2
10005	10005	custom	Sprint	\N			Sample Sprint 2
10006	10006	jira	status	10000	To Do	3	In Progress
10007	10007	jira	status	3	In Progress	10001	Done
10008	10008	custom	Sprint	\N			Sample Sprint 1
10009	10009	custom	Sprint		Sample Sprint 1		Sample Sprint 1, Sample Sprint 2
10010	10010	jira	status	10000	To Do	3	In Progress
10011	10011	jira	status	3	In Progress	10001	Done
10012	10012	custom	Sprint	\N			Sample Sprint 2
10013	10013	jira	status	10000	To Do	3	In Progress
10014	10014	jira	status	3	In Progress	10001	Done
10015	10015	custom	Sprint	\N			Sample Sprint 1
10016	10016	jira	status	10000	To Do	10001	Done
10017	10017	custom	Sprint	\N			Sample Sprint 1
10018	10018	jira	status	10000	To Do	10001	Done
10019	10019	custom	Sprint	\N			Sample Sprint 1
10020	10020	jira	status	10000	To Do	10001	Done
10021	10021	custom	Sprint	\N			Sample Sprint 1
10022	10022	jira	status	10000	To Do	10001	Done
10023	10023	custom	Sprint	\N			Sample Sprint 1
10024	10024	jira	status	10000	To Do	10001	Done
10025	10025	custom	Sprint	\N			Sample Sprint 1
10026	10026	jira	status	10000	To Do	10001	Done
\.


--
-- Data for Name: clusteredjob; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clusteredjob (id, job_id, job_runner_key, sched_type, interval_millis, first_run, cron_expression, time_zone, next_run, version, parameters) FROM stdin;
10207	CompatibilityPluginScheduler.JobId.LEXO_RANK_SCHEDULER_JOB	CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.greenhopper.service.lexorank.balance.LexoRankBalancePluginJob	I	60000	1611610336686	\N	\N	1611651628751	25	\N
10114	com.atlassian.jira.service.JiraService:10200	com.atlassian.jira.service.DefaultServiceManager	C	\N	\N	0 25 9/12 * * ?	\N	1611653100000	1	\\xaced000573720037636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c6542694d61702453657269616c697a6564466f726d000000000000000002000078720035636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c654d61702453657269616c697a6564466f726d00000000000000000200025b00046b6579737400135b4c6a6176612f6c616e672f4f626a6563743b5b000676616c75657371007e00027870757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c020000787000000001740033636f6d2e61746c61737369616e2e6a6972612e736572766963652e536572766963654d616e616765723a7365727669636549647571007e0004000000017372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000027d8
10201	LocalPluginLicenseNotificationJob-job	LocalPluginLicenseNotificationJob-runner	I	86400000	1611610333607	\N	\N	1611696733610	2	\N
10204	InstanceTopologyJob-job	InstanceTopologyJob-runner	I	86400000	1611659549442	\N	\N	1611659549442	1	\N
10203	PluginUpdateCheckJob-job	PluginUpdateCheckJob-runner	I	86400000	1611611654703	\N	\N	1611736997203	2	\N
10202	PluginRequestCheckJob-job	PluginRequestCheckJob-runner	I	3600000	1611610333611	\N	\N	1611654197211	3	\N
10211	com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job	com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler	I	3600000	1611612020173	\N	\N	1611654197211	2	\N
10014	com.atlassian.jira.service.JiraService:10001	com.atlassian.jira.service.DefaultServiceManager	C	\N	\N	0 0 0/12 * * ?	\N	1611662400000	2	\\xaced000573720037636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c6542694d61702453657269616c697a6564466f726d000000000000000002000078720035636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c654d61702453657269616c697a6564466f726d00000000000000000200025b00046b6579737400135b4c6a6176612f6c616e672f4f626a6563743b5b000676616c75657371007e00027870757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c020000787000000001740033636f6d2e61746c61737369616e2e6a6972612e736572766963652e536572766963654d616e616765723a7365727669636549647571007e0004000000017372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000002711
10015	com.atlassian.jira.service.JiraService:10002	com.atlassian.jira.service.DefaultServiceManager	C	\N	\N	0 0 0 * * ?	\N	1611705600000	2	\\xaced000573720037636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c6542694d61702453657269616c697a6564466f726d000000000000000002000078720035636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c654d61702453657269616c697a6564466f726d00000000000000000200025b00046b6579737400135b4c6a6176612f6c616e672f4f626a6563743b5b000676616c75657371007e00027870757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c020000787000000001740033636f6d2e61746c61737369616e2e6a6972612e736572766963652e536572766963654d616e616765723a7365727669636549647571007e0004000000017372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000002712
10421	com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob-job	com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob	I	60000	1611650723078	\N	\N	1611651629050	16	\N
10411	HistoryCleanupJob	com.atlassian.ratelimiting.internal.history.HistoryCleanupJob	I	86400000	1611650786292	\N	\N	1611737186292	2	\N
10400	com.atlassian.oauth2.client.jobs.TokenPruningJob	TokenPruningJob	C	\N	\N	0 0 23 * * ?	\N	1611702000000	1	\N
10401	com.atlassian.oauth2.client.analytics.StatisticsCollectionService	StatisticsCollectionService	C	\N	\N	0 0 23 * * ?	\N	1611702000000	1	\N
10402	assertionId-cleanup	com.atlassian.plugins.authentication.impl.web.saml.SamlAssertionValidationService	I	3600000	1611654287821	\N	\N	1611654287821	1	\N
10403	analytics-collection	com.atlassian.plugins.authentication.impl.analytics.ClusterWideStatisticsCollectionService	C	\N	\N	0 0 23 * * ?	\N	1611702000000	1	\N
10404	OidcDiscoveryRefresh	com.atlassian.plugins.authentication.impl.web.oidc.OidcDiscoveryRefreshJob-refresh	C	\N	\N	0 0 1 * * ?	\N	1611709200000	1	\N
10425	com.atlassian.crowd.manager.directory.monitor.DirectoryMonitorRefresherStarter-job	com.atlassian.crowd.manager.directory.monitor.DirectoryMonitorRefresherJob-runner	I	120000	\N	\N	\N	1611651689090	9	\N
10410	HistoryFlushJob	com.atlassian.ratelimiting.internal.history.HistoryFlushJob	I	300000	1611651016282	\N	\N	1611651916282	4	\N
10407	com.atlassian.audit.retention.RetentionJobRunner	com.atlassian.audit.retention.RetentionJobRunner	C	\N	\N	0 0 0 1/1 * ? *	\N	1611705600000	1	\N
10408	com.atlassian.audit.schedule.db.limit.DbLimiterJobRunner	com.atlassian.audit.schedule.db.limit.DbLimiterJobRunner	I	3600000	1611654308577	\N	\N	1611654308577	1	\N
10409	com.atlassian.diagnostics.internal.analytics.DailyAlertAnalyticsJob	DailyAlertAnalyticsJob	C	\N	\N	0 19 * * * ?	\N	1611652740000	1	\N
10417	com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl	com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl	I	60000	1611650782510	\N	\N	1611651682559	16	\\xaced000573720035636f6d2e676f6f676c652e636f6d6d6f6e2e636f6c6c6563742e496d6d757461626c654d61702453657269616c697a6564466f726d00000000000000000200025b00046b6579737400135b4c6a6176612f6c616e672f4f626a6563743b5b000676616c75657371007e00017870757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c0200007870000000027400116576656e74436f6e73756d65724e616d6574000d636c75737465724c6f636b49647571007e0003000000027400116d61696c4576656e74436f6e73756d6572740059636f6d2e61746c61737369616e2e6a6972612e706c7567696e732e696e666f726d2e6261746368696e672e63726f6e2e4f6e6365506572436c75737465724a6f6252756e6e65722e6d61696c4576656e74436f6e73756d6572
10412	com.atlassian.jira.web.action.issue.DefaultTemporaryWebAttachmentsMonitor	com.atlassian.jira.web.action.issue.DefaultTemporaryWebAttachmentsMonitor	I	3600000	1611654318127	\N	\N	1611654318127	1	\N
10416	Service Provider Session Remover	com.atlassian.oauth.serviceprovider.internal.ExpiredSessionRemover	I	28800000	1611679522492	\N	\N	1611679522492	1	\N
10418	com.atlassian.jira.analytics.scheduler.AnalyticsScheduler	com.atlassian.jira.analytics.scheduler.AnalyticsScheduler	I	604800000	1611737122522	\N	\N	1611737122522	1	\N
10419	com.atlassian.whisper.plugin.fetch.FetchJob	com.atlassian.whisper.plugin.fetch.FetchJob	I	21600000	1611654322530	\N	\N	1611654322530	1	\N
10422	com.atlassian.jira.plugins.inform.events.cleanup.CleanupJobScheduler	com.atlassian.jira.plugins.inform.events.cleanup.CleanupJobScheduler	C	\N	\N	0 0 0 1/1 * ? *	\N	1611705600000	1	\N
10424	TruncateAlertsJobRunner	com.atlassian.diagnostics.internal.DefaultMonitoringService$TruncateAlertsJobRunner	I	86400000	1611737123366	\N	\N	1611737123366	1	\N
10406	data-provider-cleanup	com.atlassian.jira.plugin.devstatus.provider.DataProviderCleanupJob	I	1800000	1611650704363	\N	\N	1611652528691	2	\N
10415	applink-status-analytics-job	com.atlassian.applinks.analytics.ApplinkStatusJob	I	86400000	\N	\N	\N	1611737128852	2	\N
10413	com.atlassian.jira.versioning.VersioningCleanupService	com.atlassian.jira.versioning.VersioningCleanupService	I	86400000	1611651018151	\N	\N	1611737418152	2	\N
10405	data-provider-poll	com.atlassian.jira.plugin.devstatus.provider.DevSummaryUpdateJob	I	300000	1611650703844	\N	\N	1611651628690	4	\N
\.


--
-- Data for Name: clusterlockstatus; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clusterlockstatus (id, lock_name, locked_by_node, update_time) FROM stdin;
\.


--
-- Data for Name: clustermessage; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clustermessage (id, source_node, destination_node, claimed_by_node, message, message_time) FROM stdin;
\.


--
-- Data for Name: clusternode; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clusternode (node_id, node_state, "timestamp", ip, cache_listener_port, node_build_number, node_version) FROM stdin;
\.


--
-- Data for Name: clusternodeheartbeat; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clusternodeheartbeat (node_id, heartbeat_time, database_time) FROM stdin;
\.


--
-- Data for Name: clusterupgradestate; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.clusterupgradestate (id, database_time, cluster_build_number, cluster_version, state, order_number) FROM stdin;
\.


--
-- Data for Name: columnlayout; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.columnlayout (id, username, searchrequest) FROM stdin;
10000	\N	\N
\.


--
-- Data for Name: columnlayoutitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.columnlayoutitem (id, columnlayout, fieldidentifier, horizontalposition) FROM stdin;
10000	10000	issuekey	0
10001	10000	status	1
10002	10000	created	2
10003	10000	updated	3
10004	10000	customfield_10000	4
\.


--
-- Data for Name: comment_version; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.comment_version (comment_id, parent_issue_id, update_time, index_version, deleted) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.component (id, project, cname, description, url, lead, assigneetype, archived) FROM stdin;
\.


--
-- Data for Name: configurationcontext; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.configurationcontext (id, projectcategory, project, customfield, fieldconfigscheme) FROM stdin;
10000	\N	\N	issuetype	10000
10100	\N	\N	customfield_10000	10100
10101	\N	\N	priority	10101
10200	\N	\N	customfield_10100	10200
10201	\N	\N	customfield_10101	10201
10202	\N	\N	customfield_10105	10202
10203	\N	\N	customfield_10103	10203
10204	\N	\N	customfield_10102	10204
10205	\N	\N	customfield_10104	10205
10206	\N	\N	customfield_10106	10206
10207	\N	10000	issuetype	10207
\.


--
-- Data for Name: customfield; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.customfield (id, cfkey, customfieldtypekey, customfieldsearcherkey, cfname, description, defaultvalue, fieldtype, project, issuetype) FROM stdin;
10000	\N	com.atlassian.jira.plugins.jira-development-integration-plugin:devsummary	com.atlassian.jira.plugins.jira-development-integration-plugin:devsummarysearcher	Разработка	Поле сводок о разработке, используемое только для Jira Software.	\N	\N	\N	\N
10100	\N	com.pyxis.greenhopper.jira:gh-lexo-rank	com.pyxis.greenhopper.jira:gh-lexo-rank-searcher	Рейтинг	Поле «Глобальный рейтинг». Только для использования в Jira Software.	\N	\N	\N	\N
10101	\N	com.pyxis.greenhopper.jira:gh-epic-link	com.pyxis.greenhopper.jira:gh-epic-link-searcher	Ссылка на эпик	Выберите эпик для присвоения данной проблемы.	\N	\N	\N	\N
10102	\N	com.pyxis.greenhopper.jira:gh-epic-status	com.pyxis.greenhopper.jira:gh-epic-status-searcher	Статус эпика	Поле «Статус эпика». Только для использования в Jira Software.	\N	\N	\N	\N
10103	\N	com.pyxis.greenhopper.jira:gh-epic-label	com.pyxis.greenhopper.jira:gh-epic-label-searcher	Имя эпика	Укажите краткое имя для идентификации данного эпика.	\N	\N	\N	\N
10104	\N	com.pyxis.greenhopper.jira:gh-epic-color	com.pyxis.greenhopper.jira:gh-epic-color-searcher	Цвет эпика	Поле «Цвет эпика». Только для использования в Jira Software.	\N	\N	\N	\N
10105	\N	com.pyxis.greenhopper.jira:gh-sprint	com.pyxis.greenhopper.jira:gh-sprint-searcher	Спринт	Поле «Cпринт» в Jira Software	\N	\N	\N	\N
10106	\N	com.atlassian.jira.plugin.system.customfieldtypes:float	com.atlassian.jira.plugin.system.customfieldtypes:exactnumber	Исторические точки	Измерение сложности и/или объема требований.	\N	\N	\N	\N
\.


--
-- Data for Name: customfieldoption; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.customfieldoption (id, customfield, customfieldconfig, parentoptionid, sequence, customvalue, optiontype, disabled) FROM stdin;
10000	10102	10204	\N	0	Нужно сделать	\N	N
10001	10102	10204	\N	1	В работе	\N	N
10002	10102	10204	\N	2	Выполнено	\N	N
\.


--
-- Data for Name: customfieldvalue; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.customfieldvalue (id, issue, customfield, updated, parentkey, stringvalue, numbervalue, textvalue, datevalue, valuetype) FROM stdin;
10000	10000	10106	1611610393325	\N	\N	2	\N	\N	\N
10001	10001	10106	1611610393937	\N	\N	2	\N	\N	\N
10002	10002	10106	1611610394155	\N	\N	5	\N	\N	\N
10003	10003	10106	1611610394333	\N	\N	5	\N	\N	\N
10004	10004	10106	1611610394479	\N	\N	1	\N	\N	\N
10005	10005	10106	1611610394687	\N	\N	1	\N	\N	\N
10006	10008	10106	1611610395576	\N	\N	3	\N	\N	\N
10007	10009	10106	1611610395711	\N	\N	5	\N	\N	\N
10008	10013	10106	1611610399285	\N	\N	3	\N	\N	\N
10009	10014	10106	1611610399450	\N	\N	4	\N	\N	\N
10010	10015	10106	1611610399583	\N	\N	2	\N	\N	\N
10011	10017	10106	1611610399930	\N	\N	3	\N	\N	\N
10012	10018	10106	1611610400074	\N	\N	5	\N	\N	\N
10013	10019	10106	1611610400248	\N	\N	3	\N	\N	\N
10014	10020	10106	1611610400593	\N	\N	1	\N	\N	\N
10015	10021	10106	1611610401199	\N	\N	2	\N	\N	\N
10016	10022	10106	1611610401640	\N	\N	2	\N	\N	\N
\.


--
-- Data for Name: cwd_application; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_application (id, application_name, lower_application_name, created_date, updated_date, active, description, application_type, credential) FROM stdin;
1	crowd-embedded	crowd-embedded	2013-02-28 15:57:51.302+04	2013-02-28 15:57:51.302+04	1		CROWD	X
\.


--
-- Data for Name: cwd_application_address; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_application_address (application_id, remote_address, encoded_address_binary, remote_address_mask) FROM stdin;
\.


--
-- Data for Name: cwd_directory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_directory (id, directory_name, lower_directory_name, created_date, updated_date, active, description, impl_class, lower_impl_class, directory_type, directory_position) FROM stdin;
1	Jira Internal Directory	jira internal directory	2013-02-28 15:57:51.308+04	2013-02-28 15:57:51.308+04	1	Jira default internal directory	com.atlassian.crowd.directory.InternalDirectory	com.atlassian.crowd.directory.internaldirectory	INTERNAL	0
\.


--
-- Data for Name: cwd_directory_attribute; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_directory_attribute (directory_id, attribute_name, attribute_value) FROM stdin;
1	user_encryption_method	atlassian-security
\.


--
-- Data for Name: cwd_directory_operation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_directory_operation (directory_id, operation_type) FROM stdin;
1	CREATE_GROUP
1	CREATE_ROLE
1	CREATE_USER
1	DELETE_GROUP
1	DELETE_ROLE
1	DELETE_USER
1	UPDATE_GROUP
1	UPDATE_GROUP_ATTRIBUTE
1	UPDATE_ROLE
1	UPDATE_ROLE_ATTRIBUTE
1	UPDATE_USER
1	UPDATE_USER_ATTRIBUTE
\.


--
-- Data for Name: cwd_group; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_group (id, group_name, lower_group_name, active, local, created_date, updated_date, description, lower_description, group_type, directory_id, external_id) FROM stdin;
10000	jira-administrators	jira-administrators	1	0	2013-02-28 15:57:51.326+04	2013-02-28 15:57:51.326+04		\N	GROUP	1	\N
10010	jira-software-users	jira-software-users	1	0	2021-01-26 00:28:06.861+03	2021-01-26 00:28:06.861+03	\N	\N	GROUP	1	\N
\.


--
-- Data for Name: cwd_group_attributes; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_group_attributes (id, group_id, directory_id, attribute_name, attribute_value, lower_attribute_value) FROM stdin;
\.


--
-- Data for Name: cwd_membership; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_membership (id, parent_id, child_id, membership_type, group_type, parent_name, lower_parent_name, child_name, lower_child_name, directory_id) FROM stdin;
10000	10000	10000	GROUP_USER	\N	jira-administrators	jira-administrators	aleksandr.oliferuk	aleksandr.oliferuk	1
10001	10010	10000	GROUP_USER	\N	jira-software-users	jira-software-users	aleksandr.oliferuk	aleksandr.oliferuk	1
10100	10010	10100	GROUP_USER	\N	jira-software-users	jira-software-users	jira.otus	jira.otus	1
10101	10000	10100	GROUP_USER	\N	jira-administrators	jira-administrators	jira.otus	jira.otus	1
\.


--
-- Data for Name: cwd_synchronisation_status; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_synchronisation_status (id, directory_id, node_id, sync_start, sync_end, sync_status, status_parameters) FROM stdin;
\.


--
-- Data for Name: cwd_synchronisation_token; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_synchronisation_token (directory_id, sync_status_token) FROM stdin;
\.


--
-- Data for Name: cwd_user; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_user (id, directory_id, user_name, lower_user_name, active, created_date, updated_date, first_name, lower_first_name, last_name, lower_last_name, display_name, lower_display_name, email_address, lower_email_address, credential, deleted_externally, external_id) FROM stdin;
10000	1	aleksandr.oliferuk	aleksandr.oliferuk	1	2021-01-26 00:32:09.267+03	2021-01-26 11:48:00.915+03	Aleksandr	aleksandr	Oliferuk	oliferuk	Aleksandr Oliferuk	aleksandr oliferuk	aleksandr.oliferuk@gmail.com	aleksandr.oliferuk@gmail.com	{PKCS5S2}Bs5zwzuUuqJd+FkPY4/QgUZIIkzUkfp1yKKvPgCCUco7vnW75DrP/kMpQB/bhcCP	\N	ededf128-b0a5-4363-822d-51558f6b144f
10100	1	jira.otus	jira.otus	1	2021-01-26 11:48:33.412+03	2021-01-26 11:49:00.399+03	Jira	jira	Otus	otus	Jira Otus	jira otus	aleksandr.oliferuk@gmail.com	aleksandr.oliferuk@gmail.com	{PKCS5S2}EGdPecmpa3syxT/vElIkVdIfBJWD4VY46JPa06/+WPn13ewa481ZDo7t7Z/u2Ssi	\N	3e3a8151-f600-46ae-b2c5-93c5b1c73f38
\.


--
-- Data for Name: cwd_user_attributes; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.cwd_user_attributes (id, user_id, directory_id, attribute_name, attribute_value, lower_attribute_value) FROM stdin;
10000	10000	1	requiresPasswordChange	false	false
10001	10000	1	invalidPasswordAttempts	0	0
10002	10000	1	passwordLastChanged	1611610330051	1611610330051
10003	10000	1	password.reset.request.expiry	1611696730519	1611696730519
10004	10000	1	password.reset.request.token	dacbe82e7500d7f7dbe2c5bf6f8890ad2fafc26a	dacbe82e7500d7f7dbe2c5bf6f8890ad2fafc26a
10100	10000	1	login.currentFailedCount	0	0
10200	10000	1	lastAuthenticated	1611650880891	1611650880891
10101	10000	1	login.lastLoginMillis	1611650880901	1611650880901
10201	10000	1	login.previousLoginMillis	1611650865808	1611650865808
10102	10000	1	login.count	3	3
10202	10100	1	requiresPasswordChange	false	false
10203	10100	1	invalidPasswordAttempts	0	0
10204	10100	1	passwordLastChanged	1611650913452	1611650913452
10205	10100	1	password.reset.request.expiry	1611737313641	1611737313641
10206	10100	1	password.reset.request.token	f1faee8abad3b4985e29c318b74a99b4301468ec	f1faee8abad3b4985e29c318b74a99b4301468ec
10207	10100	1	com.atlassian.jira.dvcs.invite.groups	 	 
10208	10100	1	lastAuthenticated	1611650940377	1611650940377
10209	10100	1	login.currentFailedCount	0	0
10210	10100	1	login.lastLoginMillis	1611650940390	1611650940390
10211	10100	1	login.count	1	1
\.


--
-- Data for Name: deadletter; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.deadletter (id, message_id, last_seen, mail_server_id, folder_name) FROM stdin;
\.


--
-- Data for Name: draftworkflowscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.draftworkflowscheme (id, name, description, workflow_scheme_id, last_modified_date, last_modified_user) FROM stdin;
\.


--
-- Data for Name: draftworkflowschemeentity; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.draftworkflowschemeentity (id, scheme, workflow, issuetype) FROM stdin;
\.


--
-- Data for Name: entity_property; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.entity_property (id, entity_name, entity_id, property_key, created, updated, json_value) FROM stdin;
10000	ProjectProperty	10000	searchRequests	2021-01-26 00:33:12.802+03	2021-01-26 00:33:12.802+03	{"ids":[]}
\.


--
-- Data for Name: entity_property_index_document; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.entity_property_index_document (id, plugin_key, module_key, entity_key, updated, document) FROM stdin;
10000	com.atlassian.jira.plugins.jira-development-integration-plugin	jira-issue-fusion-jql	IssueProperty	2021-01-26 00:25:09.825+03	<?xml version="1.0" encoding="UTF-8"?>\n<index-document-configuration entity-key="IssueProperty"><key property-key="development"><extract path="totalBuilds" type="NUMBER"/><extract path="failingbuilds" type="NUMBER"/><extract path="passedbuilds" type="NUMBER"/><extract path="buildstatus" type="STRING"/><extract path="openprs" type="NUMBER"/><extract path="mergedprs" type="NUMBER"/><extract path="declinedprs" type="NUMBER"/><extract path="prs" type="NUMBER"/><extract path="prstatus" type="STRING"/><extract path="reviews" type="NUMBER"/><extract path="openreviews" type="NUMBER"/><extract path="commits" type="NUMBER"/><extract path="totalDeployments" type="NUMBER"/><extract path="deployed" type="NUMBER"/><extract path="notDeployed" type="NUMBER"/><extract path="environment" type="STRING"/><extract path="totalBranches" type="NUMBER"/></key></index-document-configuration>
\.


--
-- Data for Name: entity_translation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.entity_translation (id, entity_name, entity_id, locale, trans_name, trans_desc) FROM stdin;
\.


--
-- Data for Name: external_entities; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.external_entities (id, name, entitytype) FROM stdin;
\.


--
-- Data for Name: externalgadget; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.externalgadget (id, gadget_xml) FROM stdin;
\.


--
-- Data for Name: favouriteassociations; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.favouriteassociations (id, username, entitytype, entityid, sequence) FROM stdin;
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.feature (id, feature_name, feature_type, user_key) FROM stdin;
10001	com.atlassian.jira.projects.issuenavigator	site	
10000	com.atlassian.jira.projects.ProjectCentricNavigation.Switch	site	
10100	mail.batching.enabled	site	\N
10101	com.atlassian.jira.agile.darkfeature.kanplan.enabled	site	
10102	com.atlassian.jira.agile.darkfeature.kanplan.epics.and.versions.enabled	site	
10103	com.atlassian.jira.agile.darkfeature.sprint.goal.enabled	site	
10104	com.atlassian.jira.agile.darkfeature.edit.closed.sprint.enabled	site	
10105	com.atlassian.jira.agile.darkfeature.splitissue	site	
\.


--
-- Data for Name: fieldconfigscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldconfigscheme (id, configname, description, fieldid, customfield) FROM stdin;
10000	Default Issue Type Scheme	Default issue type scheme is the list of global issue types. All newly created issue types will automatically be added to this scheme.	issuetype	\N
10100	Default Configuration Scheme for Разработка	Default configuration scheme generated by Jira	customfield_10000	\N
10101	Default priority scheme	This is default priority scheme used by all projects without any other scheme assigned	priority	\N
10200	Схема конфигурации по умолчанию для Рейтинг	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10100	\N
10201	Схема конфигурации по умолчанию для Ссылка на эпик	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10101	\N
10202	Схема конфигурации по умолчанию для Спринт	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10105	\N
10203	Схема конфигурации по умолчанию для Имя эпика	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10103	\N
10204	Схема конфигурации по умолчанию для Статус эпика	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10102	\N
10205	Схема конфигурации по умолчанию для Цвет эпика	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10104	\N
10206	Схема конфигурации по умолчанию для Исторические точки	Схема конфигурации по умолчанию сгенерированная Jira	customfield_10106	\N
10207	AOSP: Схема типов проблем Scrum	\N	issuetype	\N
\.


--
-- Data for Name: fieldconfigschemeissuetype; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldconfigschemeissuetype (id, issuetype, fieldconfigscheme, fieldconfiguration) FROM stdin;
10100	\N	10000	10000
10200	\N	10100	10100
10201	\N	10101	10101
10300	\N	10200	10200
10301	\N	10201	10201
10302	\N	10202	10202
10303	10000	10203	10203
10304	10000	10204	10204
10305	10000	10205	10205
10306	10000	10206	10206
10307	10001	10206	10206
10312	\N	10207	10207
\.


--
-- Data for Name: fieldconfiguration; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldconfiguration (id, configname, description, fieldid, customfield) FROM stdin;
10000	Default Configuration for Issue Type	Default configuration generated by Jira	issuetype	\N
10100	Default Configuration for Разработка	Default configuration generated by Jira	customfield_10000	\N
10101	Default configuration for priority	Default configuration generated by Jira	priority	\N
10200	Default Configuration for Рейтинг	Default configuration generated by JIRA	customfield_10100	\N
10201	Default Configuration for Ссылка на эпик	Default configuration generated by JIRA	customfield_10101	\N
10202	Default Configuration for Спринт	Default configuration generated by JIRA	customfield_10105	\N
10203	Default Configuration for Имя эпика	Default configuration generated by JIRA	customfield_10103	\N
10204	Default Configuration for Статус эпика	Default configuration generated by JIRA	customfield_10102	\N
10205	Default Configuration for Цвет эпика	Default configuration generated by JIRA	customfield_10104	\N
10206	Default Configuration for Исторические точки	Default configuration generated by JIRA	customfield_10106	\N
10207	Default Configuration for Issue Type	Default configuration generated by JIRA	issuetype	\N
\.


--
-- Data for Name: fieldlayout; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldlayout (id, name, description, layout_type, layoutscheme) FROM stdin;
10000	Default Field Configuration	The default field configuration	default	\N
\.


--
-- Data for Name: fieldlayoutitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldlayoutitem (id, fieldlayout, fieldidentifier, description, verticalposition, ishidden, isrequired, renderertype) FROM stdin;
10120	10000	customfield_10000	Поле сводок о разработке, используемое только для Jira Software.	\N	false	false	jira-text-renderer
10121	10000	summary	\N	\N	false	true	jira-text-renderer
10122	10000	issuetype	\N	\N	false	true	jira-text-renderer
10123	10000	security	\N	\N	false	false	jira-text-renderer
10124	10000	priority	\N	\N	false	false	jira-text-renderer
10125	10000	duedate	\N	\N	false	false	jira-text-renderer
10126	10000	components	\N	\N	false	false	frother-control-renderer
10127	10000	versions	\N	\N	false	false	frother-control-renderer
10128	10000	fixVersions	\N	\N	false	false	frother-control-renderer
10129	10000	assignee	\N	\N	false	false	jira-text-renderer
10130	10000	reporter	\N	\N	false	true	jira-text-renderer
10131	10000	environment	For example operating system, software platform and/or hardware specifications (include as appropriate for the issue).	\N	false	false	atlassian-wiki-renderer
10132	10000	description	\N	\N	false	false	atlassian-wiki-renderer
10133	10000	timetracking	An estimate of how much work remains until this issue will be resolved. The format of this is ' *w *d *h *m ' (representing weeks, days, hours and minutes - where * can be any number). Examples: 4d, 5h 30m, 60m and 3w.	\N	false	false	jira-text-renderer
10134	10000	resolution	\N	\N	false	false	jira-text-renderer
10135	10000	attachment	\N	\N	false	false	jira-text-renderer
10136	10000	comment	\N	\N	false	false	atlassian-wiki-renderer
10137	10000	labels	\N	\N	false	false	jira-text-renderer
10138	10000	worklog	Allows work to be logged whilst creating, editing or transitioning issues.	\N	false	false	atlassian-wiki-renderer
10139	10000	issuelinks	\N	\N	false	false	jira-text-renderer
10140	10000	customfield_10100	Поле «Глобальный рейтинг». Только для использования в Jira Software.	\N	false	false	jira-text-renderer
10141	10000	customfield_10101	Выберите эпик для присвоения данной проблемы.	\N	false	false	jira-text-renderer
10142	10000	customfield_10102	Поле «Статус эпика». Только для использования в Jira Software.	\N	false	false	jira-text-renderer
10143	10000	customfield_10103	Укажите краткое имя для идентификации данного эпика.	\N	false	true	jira-text-renderer
\.


--
-- Data for Name: fieldlayoutscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldlayoutscheme (id, name, description) FROM stdin;
\.


--
-- Data for Name: fieldlayoutschemeassociation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldlayoutschemeassociation (id, issuetype, project, fieldlayoutscheme) FROM stdin;
\.


--
-- Data for Name: fieldlayoutschemeentity; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldlayoutschemeentity (id, scheme, issuetype, fieldlayout) FROM stdin;
\.


--
-- Data for Name: fieldscreen; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldscreen (id, name, description) FROM stdin;
1	Default Screen	Allows to update all system fields.
2	Workflow Screen	This screen is used in the workflow and enables you to assign issues
3	Resolve Issue Screen	Allows to set resolution, change fix versions and assign an issue.
10000	AOSP: Экран проблемы по умолчанию для Scrum	
10001	AOSP: Экран ошибок Scrum	
\.


--
-- Data for Name: fieldscreenlayoutitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldscreenlayoutitem (id, fieldidentifier, sequence, fieldscreentab) FROM stdin;
10000	summary	0	10000
10001	issuetype	1	10000
10002	security	2	10000
10003	priority	3	10000
10004	duedate	4	10000
10005	components	5	10000
10006	versions	6	10000
10007	fixVersions	7	10000
10008	assignee	8	10000
10009	reporter	9	10000
10010	environment	10	10000
10011	description	11	10000
10012	timetracking	12	10000
10013	attachment	13	10000
10014	assignee	0	10001
10015	resolution	0	10002
10016	fixVersions	1	10002
10017	assignee	2	10002
10018	worklog	3	10002
10100	labels	14	10000
10212	summary	0	10101
10213	issuetype	1	10101
10214	reporter	2	10101
10215	components	3	10101
10216	description	4	10101
10217	fixVersions	5	10101
10218	priority	6	10101
10219	labels	7	10101
10220	security	8	10101
10221	environment	9	10101
10222	attachment	10	10101
10223	versions	11	10101
10224	issuelinks	12	10101
10225	assignee	13	10101
10226	customfield_10103	0	10100
10200	summary	1	10100
10201	issuetype	2	10100
10202	reporter	3	10100
10203	components	4	10100
10204	description	5	10100
10205	fixVersions	6	10100
10206	priority	7	10100
10207	labels	8	10100
10208	security	9	10100
10209	attachment	10	10100
10210	issuelinks	11	10100
10211	assignee	12	10100
10227	customfield_10101	13	10100
10228	customfield_10101	14	10101
10229	customfield_10105	14	10100
10230	customfield_10105	15	10101
\.


--
-- Data for Name: fieldscreenscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldscreenscheme (id, name, description) FROM stdin;
1	Default Screen Scheme	Default Screen Scheme
10000	AOSP: Схема экрана Scrum по умолчанию	
10001	AOSP: Схема экрана ошибок Scrum	
\.


--
-- Data for Name: fieldscreenschemeitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldscreenschemeitem (id, operation, fieldscreen, fieldscreenscheme) FROM stdin;
10000	\N	1	1
10100	\N	10000	10000
10101	\N	10001	10001
\.


--
-- Data for Name: fieldscreentab; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fieldscreentab (id, name, description, sequence, fieldscreen) FROM stdin;
10000	Field Tab	\N	0	1
10001	Field Tab	\N	0	2
10002	Field Tab	\N	0	3
10100	Поле Вкладки	\N	0	10000
10101	Поле Вкладки	\N	0	10001
\.


--
-- Data for Name: fileattachment; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.fileattachment (id, issueid, mimetype, filename, created, filesize, author, zip, thumbnailable) FROM stdin;
\.


--
-- Data for Name: filtersubscription; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.filtersubscription (id, filter_i_d, username, groupname, last_run, email_on_empty) FROM stdin;
\.


--
-- Data for Name: gadgetuserpreference; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.gadgetuserpreference (id, portletconfiguration, userprefkey, userprefvalue) FROM stdin;
10000	10002	isConfigured	true
10001	10003	keys	__all_projects__
10002	10003	isConfigured	true
10003	10003	title	Your Company Jira
10004	10003	numofentries	5
\.


--
-- Data for Name: genericconfiguration; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.genericconfiguration (id, datatype, datakey, xmlvalue) FROM stdin;
10000	DefaultValue	10000	<string>1</string>
10100	DefaultValue	10207	<string>10001</string>
10101	DefaultValue	10204	<long>10000</long>
\.


--
-- Data for Name: globalpermissionentry; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.globalpermissionentry (id, permission, group_id) FROM stdin;
10000	ADMINISTER	jira-administrators
10006	SYSTEM_ADMIN	jira-administrators
10100	BULK_CHANGE	jira-software-users
10101	USER_PICKER	jira-software-users
10102	MANAGE_GROUP_FILTER_SUBSCRIPTIONS	jira-software-users
10103	CREATE_SHARED_OBJECTS	jira-software-users
10104	BULK_CHANGE	jira-administrators
10105	CREATE_SHARED_OBJECTS	jira-administrators
10106	USER_PICKER	jira-administrators
10107	MANAGE_GROUP_FILTER_SUBSCRIPTIONS	jira-administrators
\.


--
-- Data for Name: groupbase; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.groupbase (id, groupname) FROM stdin;
\.


--
-- Data for Name: issue_field_option; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issue_field_option (id, option_id, field_key, option_value, properties) FROM stdin;
\.


--
-- Data for Name: issue_field_option_scope; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issue_field_option_scope (id, option_id, entity_id, scope_type) FROM stdin;
\.


--
-- Data for Name: issue_version; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issue_version (issue_id, parent_issue_id, update_time, index_version, deleted) FROM stdin;
10000	\N	2021-01-26 00:33:22.045069+03	2	N
10001	\N	2021-01-26 00:33:22.093565+03	2	N
10002	\N	2021-01-26 00:33:22.160007+03	2	N
10003	\N	2021-01-26 00:33:22.217165+03	2	N
10004	\N	2021-01-26 00:33:22.262304+03	2	N
10005	\N	2021-01-26 00:33:22.295971+03	3	N
10006	\N	2021-01-26 00:33:22.329723+03	3	N
10007	\N	2021-01-26 00:33:22.366115+03	2	N
10008	\N	2021-01-26 00:33:22.490388+03	2	N
10009	\N	2021-01-26 00:33:22.59132+03	4	N
10010	\N	2021-01-26 00:33:22.661866+03	3	N
10011	\N	2021-01-26 00:33:22.731964+03	3	N
10012	\N	2021-01-26 00:33:22.772104+03	2	N
10013	\N	2021-01-26 00:33:22.813633+03	2	N
10014	\N	2021-01-26 00:33:22.890677+03	2	N
10015	\N	2021-01-26 00:33:22.942561+03	2	N
10016	\N	2021-01-26 00:33:22.988147+03	2	N
10017	\N	2021-01-26 00:33:23.035012+03	2	N
10018	\N	2021-01-26 00:33:23.150908+03	2	N
10019	\N	2021-01-26 00:33:23.212906+03	2	N
10020	\N	2021-01-26 00:33:23.308044+03	2	N
10021	\N	2021-01-26 00:33:23.41975+03	2	N
10022	\N	2021-01-26 00:33:23.505316+03	2	N
\.


--
-- Data for Name: issuelink; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuelink (id, linktype, source, destination, sequence) FROM stdin;
10000	10100	10005	10006	0
10001	10100	10009	10010	0
10002	10100	10009	10011	1
\.


--
-- Data for Name: issuelinktype; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuelinktype (id, linkname, inward, outward, pstyle) FROM stdin;
10100	jira_subtask_link	jira_subtask_inward	jira_subtask_outward	jira_subtask
10000	Blocks	is blocked by	blocks	\N
10001	Cloners	is cloned by	clones	\N
10002	Duplicate	is duplicated by	duplicates	\N
10003	Relates	relates to	relates to	\N
10200	Epic-Story Link	has Epic	is Epic of	jira_gh_epic_story
\.


--
-- Data for Name: issuesecurityscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuesecurityscheme (id, name, description, defaultlevel) FROM stdin;
\.


--
-- Data for Name: issuestatus; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuestatus (id, sequence, pname, description, iconurl, statuscategory) FROM stdin;
1	1	Open	The issue is open and ready for the assignee to start work on it.	/images/icons/statuses/open.png	2
3	3	In Progress	This issue is being actively worked on at the moment by the assignee.	/images/icons/statuses/inprogress.png	4
4	4	Reopened	This issue was once resolved, but the resolution was deemed incorrect. From here issues are either marked assigned or resolved.	/images/icons/statuses/reopened.png	2
5	5	Resolved	A resolution has been taken, and it is awaiting verification by reporter. From here issues are either reopened, or are closed.	/images/icons/statuses/resolved.png	3
6	6	Closed	The issue is considered finished, the resolution is correct. Issues which are closed can be reopened.	/images/icons/statuses/closed.png	3
10000	7	To Do		/	2
10001	8	Done		/	3
\.


--
-- Data for Name: issuetype; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuetype (id, sequence, pname, pstyle, description, iconurl, avatar) FROM stdin;
10000	\N	Epic	\N	Создано Jira Software — не изменять и не удалять. Тип задачи для большой пользовательской истории, требующей декомпозиции.	/images/icons/issuetypes/epic.svg	\N
10001	\N	История	\N	Создано Jira Software — не изменять и не удалять. Тип задачи для пользовательской истории.	/images/icons/issuetypes/story.svg	\N
10002	\N	Задача		Задание для выполнения.	\N	10318
10003	\N	Подзадача	jira_subtask	Подзадача запроса	\N	10316
10004	\N	Ошибка			\N	10303
10005	\N	Sub-task	\N		/images/icons/issuetypes/genericissue.png	\N
10006	\N	Bug	\N		/images/icons/issuetypes/genericissue.png	\N
\.


--
-- Data for Name: issuetypescreenscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuetypescreenscheme (id, name, description) FROM stdin;
1	Default Issue Type Screen Scheme	The default issue type screen scheme
10000	AOSP: Схема экрана для типа проблемы Scrum	
\.


--
-- Data for Name: issuetypescreenschemeentity; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.issuetypescreenschemeentity (id, issuetype, scheme, fieldscreenscheme) FROM stdin;
10000	\N	1	1
10100	\N	10000	10000
10101	10004	10000	10001
\.


--
-- Data for Name: jiraaction; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraaction (id, issueid, author, actiontype, actionlevel, rolelevel, actionbody, created, updateauthor, updated, actionnum) FROM stdin;
10000	10006	JIRAUSER10000	comment	\N	\N	Hello	2021-01-26 00:33:15.2+03	JIRAUSER10000	2021-01-26 00:33:15.2+03	\N
10001	10009	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 7 days 9 hours 10 minutes ago	2021-01-18 15:23:13.064+03	JIRAUSER10000	2021-01-18 15:23:13.064+03	\N
10002	10010	JIRAUSER10000	comment	\N	\N	To Do to In Progress 3 days 21 hours 8 minutes ago	2021-01-22 03:25:13.065+03	JIRAUSER10000	2021-01-22 03:25:13.065+03	\N
10003	10011	JIRAUSER10000	comment	\N	\N	To Do to In Progress 2 days 23 hours 43 minutes ago	2021-01-23 00:50:13.067+03	JIRAUSER10000	2021-01-23 00:50:13.067+03	\N
10004	10012	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 7 days 9 hours 10 minutes ago	2021-01-18 15:23:13.068+03	JIRAUSER10000	2021-01-18 15:23:13.068+03	\N
10005	10013	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 1 days 4 hours 10 minutes ago	2021-01-24 20:23:13.068+03	JIRAUSER10000	2021-01-24 20:23:13.068+03	\N
10006	10014	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 7 days 9 hours 10 minutes ago	2021-01-23 05:59:13.069+03	JIRAUSER10000	2021-01-23 05:59:13.069+03	\N
10007	10014	JIRAUSER10000	comment	\N	\N	To Do to In Progress 5 days 4 hours 26 minutes ago\r\nIn Progress to Done 2 days 18 hours 34 minutes ago	2021-01-23 05:59:13.069+03	JIRAUSER10000	2021-01-23 05:59:13.069+03	\N
10008	10015	JIRAUSER10000	comment	\N	\N	Created 28 days 5 hours 14 minutes ago\r\nJoined Sample Sprint 1 21 days 10 hours 20 minutes ago	2021-01-19 21:55:13.069+03	JIRAUSER10000	2021-01-19 21:55:13.069+03	\N
10009	10015	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 7 days 9 hours 10 minutes ago	2021-01-19 21:55:13.069+03	JIRAUSER10000	2021-01-19 21:55:13.069+03	\N
10010	10015	JIRAUSER10000	comment	\N	\N	To Do to In Progress 7 days 4 hours 26 minutes ago\r\nIn Progress to Done 6 days 2 hours 38 minutes ago	2021-01-19 21:55:13.069+03	JIRAUSER10000	2021-01-19 21:55:13.069+03	\N
10011	10016	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 2 7 days 9 hours 10 minutes ago	2021-01-22 07:59:13.069+03	JIRAUSER10000	2021-01-22 07:59:13.069+03	\N
10012	10016	JIRAUSER10000	comment	\N	\N	To Do to In Progress 6 days 22 hours 26 minutes ago\r\nIn Progress to Done 3 days 16 hours 34 minutes ago	2021-01-22 07:59:13.069+03	JIRAUSER10000	2021-01-22 07:59:13.069+03	\N
10013	10017	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 20 days 13 hours 50 minutes ago	2021-01-05 10:43:13.07+03	JIRAUSER10000	2021-01-05 10:43:13.07+03	\N
10014	10018	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 17 days 13 hours 56 minutes ago	2021-01-08 10:37:13.07+03	JIRAUSER10000	2021-01-08 10:37:13.07+03	\N
10015	10019	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 16 days 1 hours 21 minutes ago	2021-01-09 23:12:13.07+03	JIRAUSER10000	2021-01-09 23:12:13.07+03	\N
10016	10020	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 13 days 18 hours 43 minutes ago	2021-01-12 05:50:13.071+03	JIRAUSER10000	2021-01-12 05:50:13.071+03	\N
10017	10021	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 11 days 3 hours 23 minutes ago	2021-01-14 21:10:13.072+03	JIRAUSER10000	2021-01-14 21:10:13.072+03	\N
10018	10022	JIRAUSER10000	comment	\N	\N	Joined Sample Sprint 1 21 days 10 hours 20 minutes ago\r\nTo Do to Done 9 days 1 hours 45 minutes ago	2021-01-16 22:48:13.072+03	JIRAUSER10000	2021-01-16 22:48:13.072+03	\N
\.


--
-- Data for Name: jiradraftworkflows; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiradraftworkflows (id, parentname, descriptor) FROM stdin;
\.


--
-- Data for Name: jiraeventtype; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraeventtype (id, template_id, name, description, event_type) FROM stdin;
1	\N	Issue Created	This is the 'issue created' event.	jira.system.event.type
2	\N	Issue Updated	This is the 'issue updated' event.	jira.system.event.type
3	\N	Issue Assigned	This is the 'issue assigned' event.	jira.system.event.type
4	\N	Issue Resolved	This is the 'issue resolved' event.	jira.system.event.type
5	\N	Issue Closed	This is the 'issue closed' event.	jira.system.event.type
6	\N	Issue Commented	This is the 'issue commented' event.	jira.system.event.type
7	\N	Issue Reopened	This is the 'issue reopened' event.	jira.system.event.type
8	\N	Issue Deleted	This is the 'issue deleted' event.	jira.system.event.type
9	\N	Issue Moved	This is the 'issue moved' event.	jira.system.event.type
10	\N	Work Logged On Issue	This is the 'work logged on issue' event.	jira.system.event.type
11	\N	Work Started On Issue	This is the 'work started on issue' event.	jira.system.event.type
12	\N	Work Stopped On Issue	This is the 'work stopped on issue' event.	jira.system.event.type
13	\N	Generic Event	This is the 'generic event' event.	jira.system.event.type
14	\N	Issue Comment Edited	This is the 'issue comment edited' event.	jira.system.event.type
15	\N	Issue Worklog Updated	This is the 'issue worklog updated' event.	jira.system.event.type
16	\N	Issue Worklog Deleted	This is the 'issue worklog deleted' event.	jira.system.event.type
17	\N	Issue Comment Deleted	This is the 'issue comment deleted' event.	jira.system.event.type
18	\N	Issue Archived	This is the 'issue archived' event	jira.system.event.type
19	\N	Issue Restored	This is the 'issue restored' event	jira.system.event.type
\.


--
-- Data for Name: jiraissue; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraissue (id, pkey, issuenum, project, reporter, assignee, creator, issuetype, summary, description, environment, priority, resolution, issuestatus, created, updated, duedate, resolutiondate, votes, watches, timeoriginalestimate, timeestimate, timespent, workflow_id, security, fixfor, component, archived, archivedby, archiveddate) FROM stdin;
10000	\N	1	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As an Agile team, I'd like to learn about Scrum >> Click the "AOSP-1" link at the left of this row to see detail in the Description tab on the right	*About Scrum*\n\nScrum is an iterative approach to Agile software development. The methodology has been around since the 1980s but was popularised by Jeff Sutherland and Ken Schwaber. \n\nScrum breaks the development of a product down in to discrete iterations (termed Sprints) that each deliver functionality that could potentially be shipped to users.\n\nThe Scrum Alliance offers an excellent [introduction to Scrum|http://www.scrumalliance.org/resources/47] that provides an overview of key Scrum concepts, stakeholders, processes and artefacts.	\N	3	\N	10000	2021-01-26 00:33:13.243+03	2021-01-26 00:33:13.243+03	\N	\N	0	0	\N	\N	\N	10000	\N	\N	\N	N	\N	\N
10001	\N	2	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a product owner, I'd like to express work in terms of actual user problems, aka User Stories, and place them in the backlog >> Try creating a new story with the "+ Create Issue" button (top right of screen)	When you click "+ Create Issue" you will be asked for the correct project (select "Aleksandr Oliferuk Sample Project") and Issue Type (select "Story").\n\n*About User Stories*\n\nThe Scrum methodology drops traditional software requirement statements in favour of real world problems expressed as User Stories. Stories describe the task a particular user is trying to achieve and its value. They are typically of the form "As a (role) I want (something) so that (benefit)". This approach focuses the team on the core user need rather than on implementation details. \n\nStories are "placeholders for a conversation" -- they do not need to be especially detailed since it is expected that the team will work together to resolve ambiguity as the story is developed. \n\nStories to be implemented in the future are stored in the Product Backlog. The backlog is ranked by the Product Owner so that the next items to be completed are at the top.	\N	3	\N	10000	2021-01-26 00:33:13.9+03	2021-01-26 00:33:13.9+03	\N	\N	0	0	\N	\N	\N	10001	\N	\N	\N	N	\N	\N
10002	\N	3	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a product owner, I'd like to rank stories in the backlog so I can communicate the proposed implementation order >> Try dragging this story up above the previous story	*About the Product Backlog*\n\nThe backlog is the source of truth for the order of work to be completed. It is expected that the Product Owner will work with the team to make sure that the backlog represents the current approach to delivering the product. JIRA Software makes it easy to prioritise (rank) Stories by dragging them up and down the backlog.	\N	3	\N	10000	2021-01-26 00:33:14.141+03	2021-01-26 00:33:14.141+03	\N	\N	0	0	\N	\N	\N	10002	\N	\N	\N	N	\N	\N
10003	\N	4	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a team, I'd like to estimate the effort of a story in Story Points so we can understand the work remaining >> Try setting the Story Points for this story in the "Estimate" field	This story is estimated at 5 Story Points (as shown in the "Estimate" field at the top right of the Detail View). \n\nTry updating the Story Point estimate to 4 by clicking on the "Estimate" then typing.\n\n*Estimating using Story Points*\n\nBecause the traditional process of estimating tasks in weeks or days is often wildly inaccurate, many Scrum teams estimate in Story Points instead. Story Points exist merely as a way to estimate a task's difficulty compared to some other task (for example, a 10-point story would probably take double the effort of a 5-point story). As teams mature with Scrum they tend to achieve a consistent number of Story Points from Sprint to Sprint -- this is termed the team's _velocity_. This allows the Product Owner to use the velocity to predict how many Sprints it will take to deliver parts of the backlog. \n\nMany teams use Planning Poker to achieve consensus on Story Point estimates.\n\n*Using Other Estimation Units*\n\nYou can configure JIRA Software to use time-based estimates if you wish. In the configuration for the board, on the "Estimation" tab, select "Original Time Estimate" as your Estimation Statistic. If you also wish to track the time used during the Sprint, select "Remaining Estimate and Time Spent" to enable Time Tracking in JIRA Software.	\N	3	\N	10000	2021-01-26 00:33:14.316+03	2021-01-26 00:33:14.316+03	\N	\N	0	0	\N	\N	\N	10003	\N	\N	\N	N	\N	\N
10004	\N	5	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a team, I'd like to commit to a set of stories to be completed in a sprint (or iteration) >> Click "Create Sprint" then drag the footer down to select issues for a sprint (you can't start a sprint at the moment because one is already active)	*Starting a Sprint*\n\nDuring the Planning Meeting the team will examine the stories at the top of the backlog and determine which they can commit to completing during the coming sprint. Based on this information the Product Owner might break down stories into smaller stories, adjust story priorities or otherwise work with the team to define the ideal sprint outcome. When the sprint is started the stories are moved into the sprint backlog.	\N	3	\N	10000	2021-01-26 00:33:14.467+03	2021-01-26 00:33:14.467+03	\N	\N	0	0	\N	\N	\N	10004	\N	\N	\N	N	\N	\N
10005	\N	6	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a scrum master, I'd like to break stories down into tasks we can track during the sprint >> Try creating a task by clicking the Sub-Tasks tab in the Detail View on the right	*Task Breakdown*\n\nMany teams choose to break down user stories into a set of tasks needed to implement the story. They then update the status of these tasks during a sprint to track progress. The completion of the last task signals the end of the story. \n\nYou can add sub-tasks to a story on the sub-task tab (folder icon) above.	\N	3	\N	10000	2021-01-26 00:33:14.658+03	2021-01-26 00:33:14.658+03	\N	\N	0	0	\N	\N	\N	10005	\N	\N	\N	N	\N	\N
10006	\N	7	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10005	This is a sample task. Tasks are used to break down the steps to implement a user story	\N	\N	3	\N	10000	2021-01-26 00:33:14.963+03	2021-01-26 00:33:14.963+03	\N	\N	0	0	\N	\N	\N	10006	\N	\N	\N	N	\N	\N
10007	\N	8	10000	JIRAUSER10000	\N	JIRAUSER10000	10006	As a product owner, I'd like to include bugs, tasks and other issue types in my backlog >> Bugs like this one will also appear in your backlog but they are not normally estimated	*Estimation of Bugs*\n\nScrum teams do not normally apply story point estimates to bugs because bugs are considered to be part of the ongoing work that the team must deal with (i.e the overhead). If you view the story points completed in a sprint as a measure of progress, then bugs also have no value because they do not deliver anything additional to the customer. \n\nHowever, you can apply estimates to bugs if you wish by configuring the "Story Points" field to apply to other Issue Types (by default it only applies to Stories and Epics). Some more information on this is in the [documentation|https://confluence.atlassian.com/display/GH/Story+Point].	\N	3	\N	10000	2021-01-26 00:33:15.341+03	2021-01-26 00:33:15.341+03	\N	\N	0	0	\N	\N	\N	10007	\N	\N	\N	N	\N	\N
10008	\N	9	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a developer, I'd like to update story status during the sprint >> Click the Active sprints link at the top right of the screen to go to the Active sprints where the current Sprint's items can be updated	\N	\N	3	\N	10000	2021-01-26 00:33:15.557+03	2021-01-26 00:33:15.557+03	\N	\N	0	0	\N	\N	\N	10008	\N	\N	\N	N	\N	\N
10009	\N	10	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a developer, I can update story and task status with drag and drop (click the triangle at far left of this story to show sub-tasks)	\N	\N	3	\N	3	2021-01-18 15:23:13.064+03	2021-01-18 15:23:13.064+03	\N	\N	0	0	\N	\N	\N	10009	\N	\N	\N	N	\N	\N
10010	\N	11	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10005	Update task status by dragging and dropping from column to column >> Try dragging this task to "Done"	\N	\N	3	\N	3	2021-01-22 03:25:13.066+03	2021-01-22 03:25:13.065+03	\N	\N	0	0	\N	\N	\N	10010	\N	\N	\N	N	\N	\N
10011	\N	12	10000	JIRAUSER10000	\N	JIRAUSER10000	10005	When the last task is done, the story can be automatically closed >> Drag this task to "Done" too	\N	\N	3	\N	3	2021-01-23 00:50:13.067+03	2021-01-23 00:50:13.067+03	\N	\N	0	0	\N	\N	\N	10011	\N	\N	\N	N	\N	\N
10012	\N	13	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10006	As a developer, I can update details on an item using the Detail View >> Click the "AOSP-13" link at the top of this card to open the detail view	*Editing using the Detail View*\n\nMany of the fields in the detail view can be inline edited by simply clicking on them. \n\nFor other fields you can open Quick Edit, select "Edit" from the cog drop-down.	\N	3	\N	10000	2021-01-18 15:23:13.068+03	2021-01-18 15:23:13.068+03	\N	\N	0	0	\N	\N	\N	10012	\N	\N	\N	N	\N	\N
10013	\N	14	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I can find important items on the board by using the customisable "Quick Filters" above >> Try clicking the "Only My Issues" Quick Filter above	*Creating Quick Filters*\n\nYou can add your own Quick Filters in the board configuration (select *Board > Configure*)	\N	3	\N	10000	2021-01-24 20:23:13.068+03	2021-01-24 20:23:13.068+03	\N	\N	0	0	\N	\N	\N	10013	\N	\N	\N	N	\N	\N
10014	\N	15	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a scrum master, I can see the progress of a sprint via the Burndown Chart >> Click "Reports" to view the Burndown Chart	\N	\N	3	10004	10001	2021-01-18 15:23:13.069+03	2021-01-23 05:59:13.069+03	\N	2021-01-23 05:59:13.069+03	0	0	\N	\N	\N	10014	\N	\N	\N	N	\N	\N
10015	\N	16	10000	JIRAUSER10000	\N	JIRAUSER10000	10001	As a team, we can finish the sprint by clicking the cog icon next to the sprint name above the "To Do" column then selecting "Complete Sprint" >> Try closing this sprint now	\N	\N	3	10004	10001	2020-12-28 19:19:13.069+03	2021-01-19 21:55:13.069+03	\N	2021-01-19 21:55:13.069+03	0	0	\N	\N	\N	10015	\N	\N	\N	N	\N	\N
10016	\N	17	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10006	Instructions for deleting this sample board and project are in the description for this issue >> Click the "AOSP-17" link and read the description tab of the detail view for more	*To delete this Sample Project _(must be performed by a user with Administration rights)_* \n- Open the administration interface to the projects page by using the keyboard shortcut 'g' then 'g' and typing 'Projects' in to the search dialog\n- Select the "Delete" link for the "Aleksandr Oliferuk Sample Project" project\n\n*To delete the Sample Project workflow and workflow scheme _(must be performed by a user with Administration rights)_* \n- Open the administration interface to the workflow schemes page by using the keyboard shortcut 'g' then 'g' and typing 'Workflow Schemes' in to the search dialog\n- Select the "Delete" link for the "AOSP: Software Simplified Workflow Scheme" workflow scheme\n- Go to the workflows page by using the keyboard shortcut 'g' then 'g' and typing 'Workflows' in to the search dialog(_OnDemand users should select the second match for Workflows_)\n- Expand the "Inactive" section\n- Select the "Delete" link for the "Software Simplified Workflow  for Project AOSP" workflow\n\n*To delete this Board _(must be performed by the owner of this Board or an Administrator)_*\n- Click the "Tools" cog at the top right of this board\n- Select "Delete"	\N	3	10004	10001	2021-01-18 15:23:13.069+03	2021-01-22 07:59:13.069+03	\N	2021-01-22 07:59:13.069+03	0	0	\N	\N	\N	10016	\N	\N	\N	N	\N	\N
10017	\N	18	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.07+03	2021-01-05 10:43:13.07+03	\N	2021-01-05 10:43:13.07+03	0	0	\N	\N	\N	10017	\N	\N	\N	N	\N	\N
10018	\N	19	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.07+03	2021-01-08 10:37:13.07+03	\N	2021-01-08 10:37:13.07+03	0	0	\N	\N	\N	10018	\N	\N	\N	N	\N	\N
10019	\N	20	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.07+03	2021-01-09 23:12:13.07+03	\N	2021-01-09 23:12:13.07+03	0	0	\N	\N	\N	10019	\N	\N	\N	N	\N	\N
10020	\N	21	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.071+03	2021-01-12 05:50:13.071+03	\N	2021-01-12 05:50:13.071+03	0	0	\N	\N	\N	10020	\N	\N	\N	N	\N	\N
10021	\N	22	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.072+03	2021-01-14 21:10:13.072+03	\N	2021-01-14 21:10:13.072+03	0	0	\N	\N	\N	10021	\N	\N	\N	N	\N	\N
10022	\N	23	10000	JIRAUSER10000	JIRAUSER10000	JIRAUSER10000	10001	As a user, I'd like a historical story to show in reports	\N	\N	3	10004	10001	2021-01-04 14:13:13.072+03	2021-01-16 22:48:13.072+03	\N	2021-01-16 22:48:13.072+03	0	0	\N	\N	\N	10022	\N	\N	\N	N	\N	\N
\.


--
-- Data for Name: jiraperms; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraperms (id, permtype, projectid, groupname) FROM stdin;
\.


--
-- Data for Name: jiraworkflows; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraworkflows (id, workflowname, creatorname, descriptor, islocked) FROM stdin;
10000	classic default workflow	\N	<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE workflow PUBLIC "-//OpenSymphony Group//DTD OSWorkflow 2.8//EN" "http://www.opensymphony.com/osworkflow/workflow_2_8.dtd">\n<workflow>\n  <meta name="jira.description">The classic Jira default workflow</meta>\n  <initial-actions>\n    <action id="1" name="Create Issue">\n      <meta name="opsbar-sequence">0</meta>\n      <meta name="jira.i18n.title">common.forms.create</meta>\n      <validators>\n        <validator name="" type="class">\n          <arg name="class.name">com.atlassian.jira.workflow.validator.PermissionValidator</arg>\n          <arg name="permission">Create Issue</arg>\n        </validator>\n      </validators>\n      <results>\n        <unconditional-result old-status="Finished" status="Open" step="1">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name="eventTypeId">1</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </initial-actions>\n  <common-actions>\n    <action id="2" name="Close Issue" view="resolveissue">\n      <meta name="opsbar-sequence">60</meta>\n      <meta name="jira.i18n.submit">closeissue.close</meta>\n      <meta name="jira.i18n.description">closeissue.desc</meta>\n      <meta name="jira.i18n.title">closeissue.title</meta>\n      <restrict-to>\n        <conditions type="AND">\n          <condition type="class">\n            <arg name="class.name">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name="permission">Resolve Issue</arg>\n          </condition>\n          <condition type="class">\n            <arg name="class.name">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name="permission">Close Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status="Finished" status="Closed" step="6">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name="eventTypeId">5</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id="3" name="Reopen Issue" view="commentassign">\n      <meta name="opsbar-sequence">80</meta>\n      <meta name="jira.i18n.submit">issue.operations.reopen.issue</meta>\n      <meta name="jira.i18n.description">issue.operations.reopen.description</meta>\n      <meta name="jira.i18n.title">issue.operations.reopen.issue</meta>\n      <restrict-to>\n        <conditions>\n          <condition type="class">\n            <arg name="class.name">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name="permission">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status="Finished" status="Reopened" step="5">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name="field.value"></arg>\n              <arg name="field.name">resolution</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name="eventTypeId">7</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id="4" name="Start Progress">\n      <meta name="opsbar-sequence">20</meta>\n      <meta name="jira.i18n.title">startprogress.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type="class">\n            <arg name="class.name">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status="Finished" status="Underway" step="3">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name="field.value"></arg>\n              <arg name="field.name">resolution</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name="eventTypeId">11</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id="5" name="Resolve Issue" view="resolveissue">\n      <meta name="opsbar-sequence">40</meta>\n      <meta name="jira.i18n.submit">resolveissue.resolve</meta>\n      <meta name="jira.i18n.description">resolveissue.desc.line1</meta>\n      <meta name="jira.i18n.title">resolveissue.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type="class">\n            <arg name="class.name">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name="permission">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status="Finished" status="Resolved" step="4">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name="eventTypeId">4</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </common-actions>\n  <steps>\n    <step id="1" name="Open">\n      <meta name="jira.status.id">1</meta>\n      <actions>\n<common-action id="4" />\n<common-action id="5" />\n<common-action id="2" />\n      </actions>\n    </step>\n    <step id="3" name="In Progress">\n      <meta name="jira.status.id">3</meta>\n      <actions>\n<common-action id="5" />\n<common-action id="2" />\n        <action id="301" name="Stop Progress">\n          <meta name="opsbar-sequence">20</meta>\n          <meta name="jira.i18n.title">stopprogress.title</meta>\n          <restrict-to>\n            <conditions>\n              <condition type="class">\n                <arg name="class.name">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status="Finished" status="Assigned" step="1">\n              <post-functions>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n                  <arg name="field.value"></arg>\n                  <arg name="field.name">resolution</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name="eventTypeId">12</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id="4" name="Resolved">\n      <meta name="jira.status.id">5</meta>\n      <actions>\n<common-action id="3" />\n        <action id="701" name="Close Issue" view="commentassign">\n          <meta name="opsbar-sequence">60</meta>\n          <meta name="jira.i18n.submit">closeissue.close</meta>\n          <meta name="jira.i18n.description">closeissue.desc</meta>\n          <meta name="jira.i18n.title">closeissue.title</meta>\n          <meta name="jira.description">Closing an issue indicates there is no more work to be done on it, and it has been verified as complete.</meta>\n          <restrict-to>\n            <conditions>\n              <condition type="class">\n                <arg name="class.name">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n                <arg name="permission">Close Issue</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status="Finished" status="Closed" step="6">\n              <post-functions>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type="class">\n                  <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name="eventTypeId">5</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id="5" name="Reopened">\n      <meta name="jira.status.id">4</meta>\n      <actions>\n<common-action id="5" />\n<common-action id="2" />\n<common-action id="4" />\n      </actions>\n    </step>\n    <step id="6" name="Closed">\n      <meta name="jira.status.id">6</meta>\n      <meta name="jira.issue.editable">false</meta>\n      <actions>\n<common-action id="3" />\n      </actions>\n    </step>\n  </steps>\n</workflow>\n	\N
10100	Software Simplified Workflow for Project AOSP	\N	<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE workflow PUBLIC "-//OpenSymphony Group//DTD OSWorkflow 2.8//EN" "http://www.opensymphony.com/osworkflow/workflow_2_8.dtd">\n<workflow>\n  <meta name="jira.description">Generated by JIRA Software version 8.13.3. This workflow is managed internally by Jira Software. Do not manually modify this workflow.</meta>\n  <meta name="jira.update.author.key">JIRAUSER10000</meta>\n  <meta name="jira.updated.date">1611610391844</meta>\n  <meta name="jira.update.author.name">admin</meta>\n  <meta name="gh.version">8.13.3</meta>\n  <initial-actions>\n    <action id="1" name="Create">\n      <meta name="jira.i18n.title">common.forms.create</meta>\n      <validators>\n        <validator name="" type="class">\n          <arg name="permission">Create Issue</arg>\n          <arg name="class.name">com.atlassian.jira.workflow.validator.PermissionValidator</arg>\n        </validator>\n      </validators>\n      <results>\n        <unconditional-result old-status="null" status="To Do" step="1">\n          <post-functions>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="eventTypeId">1</arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction\n                            </arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </initial-actions>\n  <global-actions>\n    <action id="11" name="To Do">\n      <meta name="jira.description"></meta>\n      <meta name="jira.i18n.title">gh.workflow.preset.todo</meta>\n      <results>\n        <unconditional-result old-status="Not Done" status="Done" step="1">\n          <post-functions>\n            <function type="class">\n              <arg name="field.name">resolution</arg>\n              <arg name="field.value"></arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">\n                                com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="eventTypeId">13</arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction\n                            </arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id="21" name="In Progress">\n      <meta name="jira.description"></meta>\n      <meta name="jira.i18n.title">gh.workflow.preset.inprogress</meta>\n      <results>\n        <unconditional-result old-status="Not Done" status="Done" step="6">\n          <post-functions>\n            <function type="class">\n              <arg name="field.name">resolution</arg>\n              <arg name="field.value"></arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">\n                                com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="eventTypeId">13</arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction\n                            </arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id="31" name="Done">\n      <meta name="jira.description"></meta>\n      <meta name="jira.i18n.title">gh.workflow.preset.done</meta>\n      <results>\n        <unconditional-result old-status="Not Done" status="Done" step="11">\n          <post-functions>\n            <function type="class">\n              <arg name="field.name">resolution</arg>\n              <arg name="field.value">10004</arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">\n                                com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction\n                            </arg>\n            </function>\n            <function type="class">\n              <arg name="class.name">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type="class">\n              <arg name="eventTypeId">13</arg>\n              <arg name="class.name">com.atlassian.jira.workflow.function.event.FireIssueEventFunction\n                            </arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </global-actions>\n  <steps>\n    <step id="1" name="To Do">\n      <meta name="jira.status.id">10000</meta>\n    </step>\n    <step id="6" name="In Progress">\n      <meta name="jira.status.id">3</meta>\n    </step>\n    <step id="11" name="Done">\n      <meta name="jira.status.id">10001</meta>\n    </step>\n  </steps>\n</workflow>\n	\N
\.


--
-- Data for Name: jiraworkflowstatuses; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jiraworkflowstatuses (id, status, parentname) FROM stdin;
\.


--
-- Data for Name: jquartz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: jquartz_calendars; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: jquartz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: jquartz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, is_volatile, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_stateful, is_nonconcurrent, is_update_data, requests_recovery) FROM stdin;
\.


--
-- Data for Name: jquartz_job_details; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_volatile, is_stateful, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: jquartz_job_listeners; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_job_listeners (job_name, job_group, job_listener) FROM stdin;
\.


--
-- Data for Name: jquartz_locks; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_locks (sched_name, lock_name) FROM stdin;
\N	TRIGGER_ACCESS
\N	JOB_ACCESS
\N	CALENDAR_ACCESS
\N	STATE_ACCESS
\N	MISFIRE_ACCESS
\.


--
-- Data for Name: jquartz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: jquartz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- Data for Name: jquartz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: jquartz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: jquartz_trigger_listeners; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_trigger_listeners (trigger_name, trigger_group, trigger_listener) FROM stdin;
\.


--
-- Data for Name: jquartz_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.jquartz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, is_volatile, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.label (id, fieldid, issue, label) FROM stdin;
\.


--
-- Data for Name: licenserolesdefault; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.licenserolesdefault (id, license_role_name) FROM stdin;
10000	jira-software
\.


--
-- Data for Name: licenserolesgroup; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.licenserolesgroup (id, license_role_name, group_id, primary_group) FROM stdin;
10000	jira-software	jira-software-users	Y
10001	jira-software	jira-administrators	N
\.


--
-- Data for Name: listenerconfig; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.listenerconfig (id, clazz, listenername) FROM stdin;
10000	com.atlassian.jira.event.listeners.mail.MailListener	Mail Listener
10001	com.atlassian.jira.event.listeners.history.IssueAssignHistoryListener	Issue Assignment Listener
10200	com.atlassian.jira.event.listeners.search.IssueIndexListener	Issue Index Listener
\.


--
-- Data for Name: mailserver; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.mailserver (id, name, description, mailfrom, prefix, smtp_port, protocol, server_type, servername, jndilocation, mailusername, mailpassword, cipher_type, istlsrequired, timeout, socks_port, socks_host, auth_conf) FROM stdin;
\.


--
-- Data for Name: managedconfigurationitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.managedconfigurationitem (id, item_id, item_type, managed, access_level, source, description_key) FROM stdin;
10000	customfield_10000	CUSTOM_FIELD	true	LOCKED	com.atlassian.jira.plugins.jira-development-integration-plugin:reserved-field-locked	devstatus.customfield.locked.desc
10100	customfield_10100	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
10101	customfield_10101	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
10102	customfield_10102	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
10103	customfield_10103	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
10104	customfield_10104	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
10105	customfield_10105	CUSTOM_FIELD	true	LOCKED	com.pyxis.greenhopper.jira:reference-select-locked	gh.customfield.locked.desc
\.


--
-- Data for Name: membershipbase; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.membershipbase (id, user_name, group_name) FROM stdin;
\.


--
-- Data for Name: moved_issue_key; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.moved_issue_key (id, old_issue_key, issue_id) FROM stdin;
\.


--
-- Data for Name: nodeassociation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.nodeassociation (source_node_id, source_node_entity, sink_node_id, sink_node_entity, association_type, sequence) FROM stdin;
10000	Project	10000	NotificationScheme	ProjectScheme	\N
10000	Project	10000	IssueTypeScreenScheme	ProjectScheme	\N
10000	Project	10100	WorkflowScheme	ProjectScheme	\N
10000	Project	10000	PermissionScheme	ProjectScheme	\N
10000	Issue	10001	Version	IssueFixVersion	\N
10001	Issue	10001	Version	IssueFixVersion	\N
10002	Issue	10002	Version	IssueFixVersion	\N
10003	Issue	10002	Version	IssueFixVersion	\N
10007	Issue	10001	Version	IssueFixVersion	\N
10009	Issue	10001	Version	IssueFixVersion	\N
10010	Issue	10001	Version	IssueFixVersion	\N
10011	Issue	10001	Version	IssueFixVersion	\N
10012	Issue	10001	Version	IssueFixVersion	\N
10017	Issue	10001	Version	IssueFixVersion	\N
10018	Issue	10001	Version	IssueFixVersion	\N
10019	Issue	10000	Version	IssueFixVersion	\N
10020	Issue	10000	Version	IssueFixVersion	\N
10021	Issue	10000	Version	IssueFixVersion	\N
10022	Issue	10000	Version	IssueFixVersion	\N
\.


--
-- Data for Name: nodeindexcounter; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.nodeindexcounter (id, node_id, sending_node_id, index_operation_id) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.notification (id, scheme, event, event_type_id, template_id, notif_type, notif_parameter) FROM stdin;
10000	10000	\N	1	\N	Current_Assignee	\N
10001	10000	\N	1	\N	Current_Reporter	\N
10002	10000	\N	1	\N	All_Watchers	\N
10003	10000	\N	2	\N	Current_Assignee	\N
10004	10000	\N	2	\N	Current_Reporter	\N
10005	10000	\N	2	\N	All_Watchers	\N
10006	10000	\N	3	\N	Current_Assignee	\N
10007	10000	\N	3	\N	Current_Reporter	\N
10008	10000	\N	3	\N	All_Watchers	\N
10009	10000	\N	4	\N	Current_Assignee	\N
10010	10000	\N	4	\N	Current_Reporter	\N
10011	10000	\N	4	\N	All_Watchers	\N
10012	10000	\N	5	\N	Current_Assignee	\N
10013	10000	\N	5	\N	Current_Reporter	\N
10014	10000	\N	5	\N	All_Watchers	\N
10015	10000	\N	6	\N	Current_Assignee	\N
10016	10000	\N	6	\N	Current_Reporter	\N
10017	10000	\N	6	\N	All_Watchers	\N
10018	10000	\N	7	\N	Current_Assignee	\N
10019	10000	\N	7	\N	Current_Reporter	\N
10020	10000	\N	7	\N	All_Watchers	\N
10021	10000	\N	8	\N	Current_Assignee	\N
10022	10000	\N	8	\N	Current_Reporter	\N
10023	10000	\N	8	\N	All_Watchers	\N
10024	10000	\N	9	\N	Current_Assignee	\N
10025	10000	\N	9	\N	Current_Reporter	\N
10026	10000	\N	9	\N	All_Watchers	\N
10027	10000	\N	10	\N	Current_Assignee	\N
10028	10000	\N	10	\N	Current_Reporter	\N
10029	10000	\N	10	\N	All_Watchers	\N
10030	10000	\N	11	\N	Current_Assignee	\N
10031	10000	\N	11	\N	Current_Reporter	\N
10032	10000	\N	11	\N	All_Watchers	\N
10033	10000	\N	12	\N	Current_Assignee	\N
10034	10000	\N	12	\N	Current_Reporter	\N
10035	10000	\N	12	\N	All_Watchers	\N
10036	10000	\N	13	\N	Current_Assignee	\N
10037	10000	\N	13	\N	Current_Reporter	\N
10038	10000	\N	13	\N	All_Watchers	\N
10100	10000	\N	14	\N	Current_Assignee	\N
10101	10000	\N	14	\N	Current_Reporter	\N
10102	10000	\N	14	\N	All_Watchers	\N
10103	10000	\N	15	\N	Current_Assignee	\N
10104	10000	\N	15	\N	Current_Reporter	\N
10105	10000	\N	15	\N	All_Watchers	\N
10106	10000	\N	16	\N	Current_Assignee	\N
10107	10000	\N	16	\N	Current_Reporter	\N
10108	10000	\N	16	\N	All_Watchers	\N
10200	10000	\N	18	\N	Current_Assignee	\N
10201	10000	\N	18	\N	Current_Reporter	\N
10202	10000	\N	18	\N	All_Watchers	\N
10203	10000	\N	19	\N	Current_Assignee	\N
10204	10000	\N	19	\N	Current_Reporter	\N
10205	10000	\N	19	\N	All_Watchers	\N
\.


--
-- Data for Name: notificationinstance; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.notificationinstance (id, notificationtype, source, emailaddress, messageid) FROM stdin;
\.


--
-- Data for Name: notificationscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.notificationscheme (id, name, description) FROM stdin;
10000	Default Notification Scheme	\N
\.


--
-- Data for Name: oauthconsumer; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.oauthconsumer (id, created, consumername, consumer_key, consumerservice, public_key, private_key, description, callback, signature_method, shared_secret) FROM stdin;
\.


--
-- Data for Name: oauthconsumertoken; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.oauthconsumertoken (id, created, token_key, token, token_secret, token_type, consumer_key) FROM stdin;
\.


--
-- Data for Name: oauthspconsumer; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.oauthspconsumer (id, created, consumer_key, consumername, public_key, description, callback, two_l_o_allowed, executing_two_l_o_user, two_l_o_impersonation_allowed, three_l_o_allowed) FROM stdin;
\.


--
-- Data for Name: oauthsptoken; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.oauthsptoken (id, created, token, token_secret, token_type, consumer_key, username, ttl, spauth, callback, spverifier, spversion, session_handle, session_creation_time, session_last_renewal_time, session_time_to_live) FROM stdin;
\.


--
-- Data for Name: optionconfiguration; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.optionconfiguration (id, fieldid, optionid, fieldconfig, sequence) FROM stdin;
10200	priority	1	10101	1
10201	priority	2	10101	2
10202	priority	3	10101	3
10203	priority	4	10101	4
10204	priority	5	10101	5
10300	issuetype	10000	10000	0
10301	issuetype	10001	10000	1
10311	issuetype	10005	10000	2
10318	issuetype	10006	10000	3
10319	issuetype	10002	10207	0
10320	issuetype	10003	10207	1
10321	issuetype	10001	10207	2
10322	issuetype	10004	10207	3
10323	issuetype	10000	10207	4
10324	issuetype	10005	10207	5
10325	issuetype	10006	10207	6
\.


--
-- Data for Name: os_currentstep; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.os_currentstep (id, entry_id, step_id, action_id, owner, start_date, due_date, finish_date, status, caller) FROM stdin;
10000	10000	1	0		2021-01-26 00:33:13.29+03	\N	\N	To Do	\N
10001	10001	1	0		2021-01-26 00:33:13.907+03	\N	\N	To Do	\N
10002	10002	1	0		2021-01-26 00:33:14.144+03	\N	\N	To Do	\N
10003	10003	1	0		2021-01-26 00:33:14.322+03	\N	\N	To Do	\N
10004	10004	1	0		2021-01-26 00:33:14.47+03	\N	\N	To Do	\N
10005	10005	1	0		2021-01-26 00:33:14.662+03	\N	\N	To Do	\N
10006	10006	1	0		2021-01-26 00:33:14.976+03	\N	\N	To Do	\N
10007	10007	1	0		2021-01-26 00:33:15.35+03	\N	\N	To Do	\N
10008	10008	1	0		2021-01-26 00:33:15.563+03	\N	\N	To Do	\N
10009	10009	6	0		2021-01-26 00:33:15.702+03	\N	\N	To Do	\N
10010	10010	6	0		2021-01-26 00:33:15.816+03	\N	\N	To Do	\N
10011	10011	6	0		2021-01-26 00:33:16.04+03	\N	\N	To Do	\N
10012	10012	1	0		2021-01-26 00:33:16.558+03	\N	\N	To Do	\N
10013	10013	1	0		2021-01-26 00:33:19.276+03	\N	\N	To Do	\N
10014	10014	11	0		2021-01-26 00:33:19.442+03	\N	\N	To Do	\N
10015	10015	11	0		2021-01-26 00:33:19.574+03	\N	\N	To Do	\N
10016	10016	11	0		2021-01-26 00:33:19.769+03	\N	\N	To Do	\N
10017	10017	11	0		2021-01-26 00:33:19.92+03	\N	\N	To Do	\N
10018	10018	11	0		2021-01-26 00:33:20.065+03	\N	\N	To Do	\N
10019	10019	11	0		2021-01-26 00:33:20.23+03	\N	\N	To Do	\N
10020	10020	11	0		2021-01-26 00:33:20.57+03	\N	\N	To Do	\N
10021	10021	11	0		2021-01-26 00:33:21.189+03	\N	\N	To Do	\N
10022	10022	11	0		2021-01-26 00:33:21.627+03	\N	\N	To Do	\N
\.


--
-- Data for Name: os_currentstep_prev; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.os_currentstep_prev (id, previous_id) FROM stdin;
\.


--
-- Data for Name: os_historystep; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.os_historystep (id, entry_id, step_id, action_id, owner, start_date, due_date, finish_date, status, caller) FROM stdin;
\.


--
-- Data for Name: os_historystep_prev; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.os_historystep_prev (id, previous_id) FROM stdin;
\.


--
-- Data for Name: os_wfentry; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.os_wfentry (id, name, initialized, state) FROM stdin;
10000	Software Simplified Workflow for Project AOSP	\N	1
10001	Software Simplified Workflow for Project AOSP	\N	1
10002	Software Simplified Workflow for Project AOSP	\N	1
10003	Software Simplified Workflow for Project AOSP	\N	1
10004	Software Simplified Workflow for Project AOSP	\N	1
10005	Software Simplified Workflow for Project AOSP	\N	1
10006	Software Simplified Workflow for Project AOSP	\N	1
10007	Software Simplified Workflow for Project AOSP	\N	1
10008	Software Simplified Workflow for Project AOSP	\N	1
10009	Software Simplified Workflow for Project AOSP	\N	1
10010	Software Simplified Workflow for Project AOSP	\N	1
10011	Software Simplified Workflow for Project AOSP	\N	1
10012	Software Simplified Workflow for Project AOSP	\N	1
10013	Software Simplified Workflow for Project AOSP	\N	1
10014	Software Simplified Workflow for Project AOSP	\N	1
10015	Software Simplified Workflow for Project AOSP	\N	1
10016	Software Simplified Workflow for Project AOSP	\N	1
10017	Software Simplified Workflow for Project AOSP	\N	1
10018	Software Simplified Workflow for Project AOSP	\N	1
10019	Software Simplified Workflow for Project AOSP	\N	1
10020	Software Simplified Workflow for Project AOSP	\N	1
10021	Software Simplified Workflow for Project AOSP	\N	1
10022	Software Simplified Workflow for Project AOSP	\N	1
\.


--
-- Data for Name: permissionscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.permissionscheme (id, name, description) FROM stdin;
0	Default Permission Scheme	This is the default Permission Scheme. Any new projects that are created will be assigned this scheme.
10000	Схема для программ по умолчанию	Схема по умолчанию для проектов "Программа".
\.


--
-- Data for Name: permissionschemeattribute; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.permissionschemeattribute (id, scheme, attribute_key, attribute_value) FROM stdin;
\.


--
-- Data for Name: pluginstate; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.pluginstate (pluginkey, pluginenabled) FROM stdin;
\.


--
-- Data for Name: pluginversion; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.pluginversion (id, pluginname, pluginkey, pluginversion, created) FROM stdin;
10000	Jira Projects Plugin	com.atlassian.jira.jira-projects-plugin	6.0.5	2021-01-26 00:25:10.273+03
10001	Jira Software Application	com.atlassian.jira.jira-software-application	8.13.3	2021-01-26 00:25:10.278+03
10002	Atlassian OAuth Consumer Plugin	com.atlassian.oauth.consumer	4.0.2	2021-01-26 00:25:10.28+03
10003	Atlassian Jira - Plugins - My Jira Home	com.atlassian.jira.jira-my-home-plugin	8.13.3	2021-01-26 00:25:10.282+03
10004	JIRA Software English (United States) Language Pack	tac.jira software.languages.en_US	8.14.0.v20200826125100	2021-01-26 00:25:10.293+03
10005	Project Creation Plugin SPI for JIRA	com.atlassian.plugins.jira-project-creation	4.0.0-74bdd7a6fa	2021-01-26 00:25:10.295+03
10006	Atlassian Embedded Crowd - Administration Plugin	com.atlassian.crowd.embedded.admin	4.0.1	2021-01-26 00:25:10.296+03
10007	Analytics Client Plugin	com.atlassian.analytics.analytics-client	6.1.7	2021-01-26 00:25:10.303+03
10008	JIRA Software Chinese (China) Language Pack	tac.jira software.languages.zh_CN	8.14.0.v20200826125100	2021-01-26 00:25:10.305+03
10009	Jira Index Analyzer	com.atlassian.jira.plugins.jira-index-analyzer-plugin	8.13.3	2021-01-26 00:25:10.313+03
10010	Jira Help Tips plugin	com.atlassian.plugins.helptips.jira-help-tips	8.13.3	2021-01-26 00:25:10.315+03
10011	Atlassian Navigation Links Plugin	com.atlassian.plugins.atlassian-nav-links-plugin	6.0.1	2021-01-26 00:25:10.316+03
10012	JIRA Core Romanian (Romania) Language Pack	tac.jira core.languages.ro_RO	8.14.0.v20200826125100	2021-01-26 00:25:10.317+03
10013	Atlassian Jira - Plugins - Issue Web Link	com.atlassian.jira.jira-issue-link-web-plugin	8.13.3	2021-01-26 00:25:10.317+03
10014	JIRA Core Slovak (Slovakia) Language Pack	tac.jira core.languages.sk_SK	8.14.0.v20200826125100	2021-01-26 00:25:10.318+03
10015	Whisper Messages Plugin	whisper.messages	1.0	2021-01-26 00:25:10.319+03
10016	Project Role Actors Plugin	com.atlassian.jira.plugin.system.projectroleactors	1.0	2021-01-26 00:25:10.32+03
10017	Atlassian Jira - Plugins - OAuth Service Provider SPI	com.atlassian.jira.oauth.serviceprovider	8.13.3	2021-01-26 00:25:10.321+03
10018	Keyboard Shortcuts Plugin	jira.keyboard.shortcuts	1.0	2021-01-26 00:25:10.321+03
10019	Bitbucket Importer Plugin for JIM	com.atlassian.jira.plugins.jira-importers-bitbucket-plugin	3.1.1	2021-01-26 00:25:10.322+03
10020	Atlassian Remote Event Common Plugin	com.atlassian.plugins.atlassian-remote-event-common-plugin	6.2.2	2021-01-26 00:25:10.323+03
10021	Jira GitHub Issue Importer	com.atlassian.jira.plugins.jira-importers-github-plugin	3.1.0	2021-01-26 00:25:10.324+03
10022	JIRA Password Policy Plugin	com.atlassian.jira.plugins.jira-password-policy-plugin	2.1.0	2021-01-26 00:25:10.325+03
10023	ROME: RSS/Atom syndication and publishing tools	com.springsource.com.sun.syndication-0.9.0	0.9.0	2021-01-26 00:25:10.326+03
10024	JIRA iCalendar Plugin	com.atlassian.jira.extra.jira-ical-feed	1.5.0	2021-01-26 00:25:10.327+03
10025	Jira Drag and Drop Attachment Plugin	com.atlassian.jira.plugins.jira-dnd-attachment-plugin	5.0.9	2021-01-26 00:25:10.328+03
10026	Atlassian Jira - Plugins - Post setup announcements plugin	com.atlassian.jira.jira-postsetup-announcements-plugin	8.13.3	2021-01-26 00:25:10.329+03
10027	Streams Inline Actions Plugin	com.atlassian.streams.actions	8.2.2	2021-01-26 00:25:10.33+03
10028	JIRA Software Spanish (Spain) Language Pack	tac.jira software.languages.es_ES	8.14.0.v20200826125100	2021-01-26 00:25:10.331+03
10029	Apache Apache HttpClient OSGi bundle	org.apache.httpcomponents.httpclient-4.5.10	4.5.10	2021-01-26 00:25:10.332+03
10030	JIRA Core Swedish (Sweden) Language Pack	tac.jira core.languages.sv_SE	8.14.0.v20200826125100	2021-01-26 00:25:10.333+03
10031	Comment Panel Plugin	com.atlassian.jira.plugin.system.comment-panel	1.0	2021-01-26 00:25:10.334+03
10032	Atlassian Jira - Plugins - Development Integration Plugin	com.atlassian.jira.plugins.jira-development-integration-plugin	5.7.2	2021-01-26 00:25:10.335+03
10033	Atlassian Remote Event Consumer Plugin	com.atlassian.plugins.atlassian-remote-event-consumer-plugin	6.2.2	2021-01-26 00:25:10.336+03
10034	scala-2.11-provider-plugin	com.atlassian.scala.plugins.scala-2.11-provider-plugin	0.13	2021-01-26 00:25:10.337+03
10035	JIRA Workflow Transition Tabs	com.atlassian.jira.plugin.system.workfloweditor.transition.tabs	1.0	2021-01-26 00:25:10.338+03
10036	Jira inform - batching plugin	com.atlassian.jira.plugins.inform.batching-plugin	1.4.4	2021-01-26 00:25:10.339+03
10037	JIRA Core Czech (Czech Republic) Language Pack	tac.jira core.languages.cs_CZ	8.14.0.v20200826125100	2021-01-26 00:25:10.34+03
10038	Renderer Plugin	com.atlassian.jira.plugin.system.jirarenderers	1.0	2021-01-26 00:25:10.342+03
10039	Atlassian Gadgets OAuth Service Provider Plugin	com.atlassian.gadgets.oauth.serviceprovider	6.0.1	2021-01-26 00:25:10.343+03
10040	JIRA Software Finnish (Finland) Language Pack	tac.jira software.languages.fi_FI	8.14.0.v20200826125100	2021-01-26 00:25:10.344+03
10041	JIRA Core Japanese (Japan) Language Pack	tac.jira core.languages.ja_JP	8.14.0.v20200826125100	2021-01-26 00:25:10.345+03
10042	JIRA Core Italian (Italy) Language Pack	tac.jira core.languages.it_IT	8.14.0.v20200826125100	2021-01-26 00:25:10.346+03
10043	Jira for Software Plugin	com.atlassian.jira.plugins.jira-software-plugin	8.13.3	2021-01-26 00:25:10.35+03
10044	JIRA Core Polish (Poland) Language Pack	tac.jira core.languages.pl_PL	8.14.0.v20200826125100	2021-01-26 00:25:10.351+03
10045	Atlassian Jira - Plugins - Admin Navigation Component	com.atlassian.jira.jira-admin-navigation-plugin	8.13.3	2021-01-26 00:25:10.352+03
10046	JIRA Software Danish (Denmark) Language Pack	tac.jira software.languages.da_DK	8.14.0.v20200826125100	2021-01-26 00:25:10.353+03
10047	JIRA Core German (Germany) Language Pack	tac.jira core.languages.de_DE	8.14.0.v20200826125100	2021-01-26 00:25:10.354+03
10048	Atlassian Plugins - Web Resources - Implementation Plugin	com.atlassian.plugins.atlassian-plugins-webresource-plugin	4.1.4	2021-01-26 00:25:10.355+03
10049	Preset Filters Sections	jira.webfragments.preset.filters	1.0	2021-01-26 00:25:10.357+03
10050	Atlassian Jira - Plugins - Project Config Plugin	com.atlassian.jira.jira-project-config-plugin	8.13.3	2021-01-26 00:25:10.357+03
10051	Crowd System Password Encoders	crowd.system.passwordencoders	1.0	2021-01-26 00:25:10.358+03
10052	Atlassian UI Plugin	com.atlassian.auiplugin	9.1.4	2021-01-26 00:25:10.36+03
10053	Atlassian Jira - Plugins - Share Content Component	com.atlassian.jira.jira-share-plugin	8.13.3	2021-01-26 00:25:10.361+03
10054	Atlassian Jira - Plugins - Statistics plugin	com.atlassian.jira.jira-statistics-plugin	8.13.3	2021-01-26 00:25:10.363+03
10055	Atlassian Jira - Plugins - Remote Jira Link	com.atlassian.jira.jira-issue-link-remote-jira-plugin	8.13.3	2021-01-26 00:25:10.365+03
10056	Functional Extensions Guava Inter-Ops	io.atlassian.fugue.guava-4.7.2	4.7.2	2021-01-26 00:25:10.366+03
10057	Remote Link Aggregator Plugin	com.atlassian.plugins.remote-link-aggregator-plugin	3.0.0	2021-01-26 00:25:10.367+03
10058	Atlassian HealthCheck Common Module	com.atlassian.healthcheck.atlassian-healthcheck	6.0.0	2021-01-26 00:25:10.369+03
10059	Workbox - Common Plugin	com.atlassian.mywork.mywork-common-plugin	7.0.1	2021-01-26 00:25:10.37+03
10060	Jira Workflow Sharing Plugin	com.atlassian.jira.plugins.workflow.sharing.jira-workflow-sharing-plugin	2.2.8	2021-01-26 00:25:10.371+03
10061	Entity property conditions	system.entity.property.conditions	1.0	2021-01-26 00:25:10.373+03
10062	org.osgi:org.osgi.service.cm	org.osgi.service.cm-1.5.0.201505202024	1.5.0.201505202024	2021-01-26 00:25:10.374+03
10063	JIRA Software Korean (South Korea) Language Pack	tac.jira software.languages.ko_KR	8.14.0.v20200826125100	2021-01-26 00:25:10.375+03
10064	Atlassian Jira - Plugins - APDEX	com.atlassian.jira.jira-apdex-plugin	8.13.3	2021-01-26 00:25:10.376+03
10065	JQL Functions	jira.jql.function	1.0	2021-01-26 00:25:10.378+03
10066	Atlassian Soy - Plugin	com.atlassian.soy.soy-template-plugin	5.0.0	2021-01-26 00:25:10.379+03
10067	JIRA Software Icelandic (Iceland) Language Pack	tac.jira software.languages.is_IS	8.14.0.v20200826125100	2021-01-26 00:25:10.38+03
10068	Mobile Plugin for Jira	com.atlassian.jira.mobile.jira-mobile-rest	3.1.0	2021-01-26 00:25:10.381+03
10069	atlassian-failure-cache-plugin	com.atlassian.atlassian-failure-cache-plugin	2.0.0	2021-01-26 00:25:10.383+03
10070	Atlassian Jira - Plugins - View Issue Panels	com.atlassian.jira.jira-view-issue-plugin	8.13.3	2021-01-26 00:25:10.384+03
10071	JIRA Footer	jira.footer	1.0	2021-01-26 00:25:10.385+03
10072	Applinks - Plugin - Core	com.atlassian.applinks.applinks-plugin	8.0.0	2021-01-26 00:25:10.386+03
10073	Jira inform - batchers	com.atlassian.jira.plugins.inform.batchers	1.4.4	2021-01-26 00:25:10.387+03
10074	jira-optimizer-plugin	com.atlassian.jira.plugins.jira-optimizer-plugin	3.0.0	2021-01-26 00:25:10.389+03
10075	Analytics Whitelist Plugin	com.atlassian.analytics.analytics-whitelist	3.80	2021-01-26 00:25:10.39+03
10076	Atlassian Jira - Plugins - Invite User	com.atlassian.jira.jira-invite-user-plugin	2.3.2	2021-01-26 00:25:10.391+03
10077	Atlassian Jira - Plugins - Cluster Monitoring	com.atlassian.jira.jira-cluster-monitoring-plugin	8.13.3	2021-01-26 00:25:10.392+03
10078	JIRA Software Norwegian (Norway) Language Pack	tac.jira software.languages.no_NO	8.14.0.v20200826125100	2021-01-26 00:25:10.394+03
10079	Applinks - Plugin - Basic Authentication	com.atlassian.applinks.applinks-basicauth-plugin	8.0.0	2021-01-26 00:25:10.395+03
10080	Atlassian Jira - Plugins - Quick Search	com.atlassian.jira.plugins.jira-quicksearch-plugin	8.13.3	2021-01-26 00:25:10.396+03
10081	User Profile Links	jira.webfragments.user.profile.links	1.0	2021-01-26 00:25:10.397+03
10082	JIRA Software Italian (Italy) Language Pack	tac.jira software.languages.it_IT	8.14.0.v20200826125100	2021-01-26 00:25:10.399+03
10083	Admin Menu Sections	jira.webfragments.admin	1.0	2021-01-26 00:25:10.4+03
10084	wiki-editor	com.atlassian.jira.plugins.jira-wiki-editor	4.2.10	2021-01-26 00:25:10.401+03
10085	Atlassian OAuth Service Provider SPI	com.atlassian.oauth.atlassian-oauth-service-provider-spi	4.0.2	2021-01-26 00:25:10.403+03
10086	Top Navigation Bar	jira.top.navigation.bar	1.0	2021-01-26 00:25:10.405+03
10087	Applinks - Plugin - Trusted Apps	com.atlassian.applinks.applinks-trustedapps-plugin	8.0.0	2021-01-26 00:25:10.407+03
10088	Wiki Renderer Macros Plugin	com.atlassian.jira.plugin.system.renderers.wiki.macros	1.0	2021-01-26 00:25:10.409+03
10089	Issue Views Plugin	jira.issueviews	1.0	2021-01-26 00:25:10.41+03
10090	JIRA Core Icelandic (Iceland) Language Pack	tac.jira core.languages.is_IS	8.14.0.v20200826125100	2021-01-26 00:25:10.411+03
10091	Streams SPI	com.atlassian.streams.streams-spi	8.2.2	2021-01-26 00:25:10.412+03
10092	Jira inform - event plugin	com.atlassian.jira.plugins.inform.event-plugin	1.4.4	2021-01-26 00:25:10.413+03
10093	Applinks - Plugin - CORS	com.atlassian.applinks.applinks-cors-plugin	8.0.0	2021-01-26 00:25:10.414+03
10094	Streams Third Party Provider Plugin	com.atlassian.streams.streams-thirdparty-plugin	8.2.2	2021-01-26 00:25:10.415+03
10095	Atlassian OAuth Service Provider Plugin	com.atlassian.oauth.serviceprovider	4.0.2	2021-01-26 00:25:10.416+03
10096	Atlassian Jira - Plugins - Common AppLinks Based Issue Link Plugin	com.atlassian.jira.jira-issue-link-applinks-common-plugin	8.13.3	2021-01-26 00:25:10.416+03
10097	Functional Extensions	io.atlassian.fugue-4.7.2	4.7.2	2021-01-26 00:25:10.417+03
10098	jira-webresources-plugin	jira.webresources	1.0	2021-01-26 00:25:10.418+03
10099	Embedded Gadgets Plugin	com.atlassian.gadgets.embedded	6.0.1	2021-01-26 00:25:10.419+03
10100	Atlassian Jira - Plugins - Core Reports	com.atlassian.jira.jira-core-reports-plugin	8.13.3	2021-01-26 00:25:10.42+03
10101	Streams Plugin	com.atlassian.streams	8.2.2	2021-01-26 00:25:10.423+03
10102	Browse Project Operations Sections	jira.webfragments.browse.project.links	1.0	2021-01-26 00:25:10.424+03
10103	Jira Issue Collector Plugin	com.atlassian.jira.collector.plugin.jira-issue-collector-plugin	4.0.4	2021-01-26 00:25:10.425+03
10104	Atlassian Whitelist Core Plugin	com.atlassian.plugins.atlassian-whitelist-core-plugin	5.0.2	2021-01-26 00:25:10.425+03
10105	JIRA Core Russian (Russia) Language Pack	tac.jira core.languages.ru_RU	8.14.0.v20200826125100	2021-01-26 00:25:10.426+03
10106	ICU4J	com.atlassian.bundles.icu4j-3.8.0.1	3.8.0.1	2021-01-26 00:25:10.427+03
10107	Streams Core Plugin	com.atlassian.streams.core	8.2.2	2021-01-26 00:25:10.428+03
10108	Atlassian Jira - Plugins - WebHooks Plugin	com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin	8.13.3	2021-01-26 00:25:10.429+03
10109	Issue Operations Plugin	com.atlassian.jira.plugin.system.issueoperations	1.0	2021-01-26 00:25:10.43+03
10110	Gadget Directory Plugin	com.atlassian.gadgets.directory	6.0.1	2021-01-26 00:25:10.431+03
10111	Attach Image for JIRA	com.atlassian.plugins.jira-html5-attach-images	4.0.0	2021-01-26 00:25:10.432+03
10112	Jira Monitoring Plugin	com.atlassian.jira.jira-monitoring-plugin	05.7.3	2021-01-26 00:25:10.433+03
10113	Atlassian Jira - Plugins - Project Centric Issue Navigator	com.atlassian.jira.jira-projects-issue-navigator	10.0.9	2021-01-26 00:25:10.434+03
10114	jira-importers-plugin	com.atlassian.jira.plugins.jira-importers-plugin	9.2.2	2021-01-26 00:25:10.436+03
10115	Atlassian Plugins - JavaScript libraries	com.atlassian.plugin.jslibs	2.1.0	2021-01-26 00:25:10.438+03
10116	JIRA Software Portuguese (Brazil) Language Pack	tac.jira software.languages.pt_BR	8.14.0.v20200826125100	2021-01-26 00:25:10.44+03
10117	Jira Time Zone Detection plugin	com.atlassian.jira.jira-tzdetect-plugin	3.0.4	2021-01-26 00:25:10.441+03
10118	Atlassian Jira - Plugins - Diagnostics Plugin	com.atlassian.jira.diagnostics	8.13.3	2021-01-26 00:25:10.442+03
10119	JIRA Core Dutch (Netherlands) Language Pack	tac.jira core.languages.nl_NL	8.14.0.v20200826125100	2021-01-26 00:25:10.444+03
10120	JIRA Core Estonian (Estonia) Language Pack	tac.jira core.languages.et_EE	8.14.0.v20200826125100	2021-01-26 00:25:10.445+03
10121	JSON Library	com.atlassian.bundles.json-20070829.0.0.1	20070829.0.0.1	2021-01-26 00:25:10.446+03
10122	JDOM DOM Processor	com.springsource.org.jdom-1.0.0	1.0.0	2021-01-26 00:25:10.447+03
10123	JIRA Core Chinese (China) Language Pack	tac.jira core.languages.zh_CN	8.14.0.v20200826125100	2021-01-26 00:25:10.448+03
10185	Streams API	com.atlassian.streams.streams-api	8.2.2	2021-01-26 00:25:10.526+03
10124	Atlassian Jira - Plugins - Feedback Plugin	com.atlassian.feedback.jira-feedback-plugin	8.13.3	2021-01-26 00:25:10.449+03
10125	Atlassian OAuth 2 Client - Plugin	com.atlassian.oauth2.oauth2-client-plugin	1.0.3	2021-01-26 00:25:10.45+03
10126	ActiveObjects Plugin - OSGi Bundle	com.atlassian.activeobjects.activeobjects-plugin	3.2.4	2021-01-26 00:25:10.452+03
10127	Atlassian Jira - Plugins - Header Plugin	com.atlassian.jira.jira-header-plugin	8.13.3	2021-01-26 00:25:10.453+03
10128	Issue Tab Panels Plugin	com.atlassian.jira.plugin.system.issuetabpanels	1.0	2021-01-26 00:25:10.454+03
10129	JIRA Feature Keys	jira.feature.keys	1.0	2021-01-26 00:25:10.455+03
10130	JIRA Streams Inline Actions Plugin	com.atlassian.streams.jira.inlineactions	8.2.2	2021-01-26 00:25:10.456+03
10131	Atlassian Jira - Plugins - Application Properties	com.atlassian.jira.jira-application-properties-plugin	8.13.3	2021-01-26 00:25:10.457+03
10132	Atlassian Jira - Plugins - Gadgets Plugin	com.atlassian.jira.gadgets	8.13.3	2021-01-26 00:25:10.459+03
10133	Atlassian Jira - Plugins - Analytics whitelist	com.atlassian.jira.jira-analytics-whitelist-plugin	8.13.3	2021-01-26 00:25:10.46+03
10134	jira-inline-issue-create-plugin	com.atlassian.jira.plugins.inline-create.jira-inline-issue-create-plugin	2.0.22	2021-01-26 00:25:10.461+03
10135	Functional Extensions Scala Inter-Ops	io.atlassian.fugue.scala-4.7.2	4.7.2	2021-01-26 00:25:10.462+03
10136	Workbox - JIRA Provider Plugin	com.atlassian.mywork.mywork-jira-provider-plugin	7.0.1	2021-01-26 00:25:10.463+03
10137	JIRA Core Korean (South Korea) Language Pack	tac.jira core.languages.ko_KR	8.14.0.v20200826125100	2021-01-26 00:25:10.464+03
10138	Content Link Resolvers Plugin	com.atlassian.jira.plugin.wiki.contentlinkresolvers	1.0	2021-01-26 00:25:10.465+03
10139	Atlassian Application Manager plugin	com.atlassian.upm.upm-application-plugin	4.1.6	2021-01-26 00:25:10.467+03
10140	JIRA Core Spanish (Spain) Language Pack	tac.jira core.languages.es_ES	8.14.0.v20200826125100	2021-01-26 00:25:10.468+03
10141	JIRA Software Russian (Russia) Language Pack	tac.jira software.languages.ru_RU	8.14.0.v20200826125100	2021-01-26 00:25:10.469+03
10142	JIRA Software Swedish (Sweden) Language Pack	tac.jira software.languages.sv_SE	8.14.0.v20200826125100	2021-01-26 00:25:10.47+03
10143	Atlassian Jira - Plugins - Credits Plugin	com.atlassian.jira.jira-credits-plugin	8.13.3	2021-01-26 00:25:10.473+03
10144	Jira Mobile	com.atlassian.jira.mobile	3.2.17	2021-01-26 00:25:10.475+03
10145	Atlassian Jira - Plugins - Onboarding	com.atlassian.jira.jira-onboarding-assets-plugin	8.13.3	2021-01-26 00:25:10.476+03
10146	FishEye Plugin	com.atlassian.jirafisheyeplugin	8.13.3	2021-01-26 00:25:10.477+03
10147	JIRA Software French (France) Language Pack	tac.jira software.languages.fr_FR	8.14.0.v20200826125100	2021-01-26 00:25:10.478+03
10148	Atlassian JIRA - Admin Helper Plugin	com.atlassian.jira.plugins.jira-admin-helper-plugin	5.0.1	2021-01-26 00:25:10.479+03
10149	Atlassian browser metrics plugin	com.atlassian.plugins.browser.metrics.browser-metrics-plugin	7.0.1	2021-01-26 00:25:10.48+03
10150	JIRA Software German (Germany) Language Pack	tac.jira software.languages.de_DE	8.14.0.v20200826125100	2021-01-26 00:25:10.481+03
10151	Atlassian Jira - Plugins - Global Issue Navigator	com.atlassian.jira.jira-issue-nav-plugin	10.0.9	2021-01-26 00:25:10.482+03
10152	User Navigation Bar Sections	jira.webfragments.user.navigation.bar	1.0	2021-01-26 00:25:10.483+03
10153	Atlassian Troubleshooting and Support Tools	com.atlassian.troubleshooting.plugin-jira	1.29.0	2021-01-26 00:25:10.484+03
10154	Neko HTML	com.atlassian.bundles.nekohtml-1.9.12.1	1.9.12.1	2021-01-26 00:25:10.485+03
10155	JIRA Global Permissions	jira.system.global.permissions	1.0	2021-01-26 00:25:10.487+03
10156	JIRA Software Slovak (Slovakia) Language Pack	tac.jira software.languages.sk_SK	8.14.0.v20200826125100	2021-01-26 00:25:10.488+03
10157	Atlassian Template Renderer API	com.atlassian.templaterenderer.api	4.0.2	2021-01-26 00:25:10.489+03
10158	JIRA Core Danish (Denmark) Language Pack	tac.jira core.languages.da_DK	8.14.0.v20200826125100	2021-01-26 00:25:10.49+03
10159	Atlassian JIRA - Plugins - File viewer plugin	com.atlassian.jira.jira-fileviewer-plugin	8.0.0	2021-01-26 00:25:10.491+03
10160	Atlassian Pretty URLs Plugin	com.atlassian.prettyurls.atlassian-pretty-urls-plugin	3.0.0	2021-01-26 00:25:10.493+03
10161	JIRA Attachment Archive File Processors	jira.system.attachment.processors	1.0	2021-01-26 00:25:10.495+03
10162	Atlassian Jira - Plugins - Admin Upgrades	com.atlassian.jira.jira-admin-updates-plugin	8.13.3	2021-01-26 00:25:10.496+03
10163	Atlassian Cluster Monitoring Plugin	com.atlassian.cluster.monitoring.cluster-monitoring-plugin	4.1.9	2021-01-26 00:25:10.498+03
10164	jira-ui	com.atlassian.jira.plugins.jira-ui	0.3.0	2021-01-26 00:25:10.5+03
10165	Atlassian Universal Plugin Manager Plugin	com.atlassian.upm.atlassian-universal-plugin-manager-plugin	4.1.6	2021-01-26 00:25:10.501+03
10166	SSO for Atlassian Data Center	com.atlassian.plugins.authentication.atlassian-authentication-plugin	4.1.1	2021-01-26 00:25:10.503+03
10167	Atlassian Whitelist UI Plugin	com.atlassian.plugins.atlassian-whitelist-ui-plugin	5.0.2	2021-01-26 00:25:10.505+03
10168	JIRA Core Portuguese (Brazil) Language Pack	tac.jira core.languages.pt_BR	8.14.0.v20200826125100	2021-01-26 00:25:10.506+03
10169	Atlassian Jira - Plugins - Frontend Features	com.atlassian.jira.jira-frontend-plugin	8.13.3	2021-01-26 00:25:10.507+03
10170	Redmine Importers Plugin for JIM	com.atlassian.jira.plugins.jira-importers-redmine-plugin	2.2.0	2021-01-26 00:25:10.509+03
10171	Atlassian Whitelist API Plugin	com.atlassian.plugins.atlassian-whitelist-api-plugin-5.0.2	5.0.2	2021-01-26 00:25:10.51+03
10172	jira-capabilities-plugin	jira.capabilities	1.0	2021-01-26 00:25:10.511+03
10173	Atlassian JIRA - Plugins - Quick Edit Plugin	com.atlassian.jira.jira-quick-edit-plugin	4.0.0	2021-01-26 00:25:10.513+03
10174	Soy Function Plugin	com.atlassian.jira.plugin.system.soyfunction	1.0	2021-01-26 00:25:10.514+03
10175	Universal Plugin Manager - Role-Based Licensing Implementation Plugin	com.atlassian.upm.role-based-licensing-plugin	4.1.6	2021-01-26 00:25:10.515+03
10176	Jira Core Project Templates Plugin	com.atlassian.jira-core-project-templates	7.0.5	2021-01-26 00:25:10.516+03
10177	Atlassian OAuth Admin Plugin	com.atlassian.oauth.admin	4.0.2	2021-01-26 00:25:10.517+03
10178	Atlassian REST - Module Types	com.atlassian.plugins.rest.atlassian-rest-module	6.0.7	2021-01-26 00:25:10.518+03
10179	Crowd REST API - Application Management	crowd-rest-application-management	1.0	2021-01-26 00:25:10.519+03
10180	jira-issue-nav-components	com.atlassian.jira.jira-issue-nav-components	10.0.9	2021-01-26 00:25:10.52+03
10181	jquery	com.atlassian.plugins.jquery	2.2.4.7	2021-01-26 00:25:10.522+03
10182	Atlassian Jira - Plugins - Auditing Plugin [Audit Log]	com.atlassian.jira.plugins.jira-auditing-plugin	8.13.3	2021-01-26 00:25:10.523+03
10183	Apache Apache HttpCore OSGi bundle	org.apache.httpcomponents.httpcore-4.4.12	4.4.12	2021-01-26 00:25:10.524+03
10184	JIRA Remote Link Aggregator Plugin	com.atlassian.plugins.jira-remote-link-aggregator-plugin	3.0.0	2021-01-26 00:25:10.525+03
10186	Atlassian Jira - Plugins - Atlassian Notifications Plugin	com.atlassian.jira.jira-whisper-plugin	8.13.3	2021-01-26 00:25:10.527+03
10187	Atlassian HTTP Client, Apache HTTP components impl	com.atlassian.httpclient.atlassian-httpclient-plugin	2.0.0	2021-01-26 00:25:10.528+03
10188	Jira DVCS Connector Plugin	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin	5.2.10	2021-01-26 00:25:10.529+03
10189	JIRA Software Hungarian (Hungary) Language Pack	tac.jira software.languages.hu_HU	8.14.0.v20200826125100	2021-01-26 00:25:10.53+03
10190	Atlassian Audit Plugin	com.atlassian.audit.atlassian-audit-plugin	1.12.2	2021-01-26 00:25:10.531+03
10191	Asana Importers Plugin for JIM	com.atlassian.jira.plugins.jira-importers-asana-plugin	2.1.0	2021-01-26 00:25:10.532+03
10192	Atlassian Awareness Capability	com.atlassian.plugins.atlassian-awareness-capability	0.0.6	2021-01-26 00:25:10.533+03
10193	Atlassian Plugins - Web Resources REST	com.atlassian.plugins.atlassian-plugins-webresource-rest	4.1.4	2021-01-26 00:25:10.534+03
10194	Custom Field Types & Searchers	com.atlassian.jira.plugin.system.customfieldtypes	1.0	2021-01-26 00:25:10.534+03
10195	Project Creation Capability Product REST Plugin	com.atlassian.plugins.atlassian-project-creation-plugin	4.0.0-74bdd7a6fa	2021-01-26 00:25:10.536+03
10196	Atlassian Jira - Plugins - REST Plugin	com.atlassian.jira.rest	8.13.3	2021-01-26 00:25:10.537+03
10197	Atlassian Spring Scanner Runtime	com.atlassian.plugin.atlassian-spring-scanner-runtime	2.1.13	2021-01-26 00:25:10.538+03
10198	JIRA Software Czech (Czech Republic) Language Pack	tac.jira software.languages.cs_CZ	8.14.0.v20200826125100	2021-01-26 00:25:10.539+03
10199	Opensocial Plugin	com.atlassian.gadgets.opensocial	6.0.1	2021-01-26 00:25:10.54+03
10200	Atlassian Jira - Plugins - Confluence Link	com.atlassian.jira.jira-issue-link-confluence-plugin	8.13.3	2021-01-26 00:25:10.541+03
10201	ROME, RSS and atOM utilitiEs for Java	rome.rome-1.0	1.0	2021-01-26 00:25:10.546+03
10202	User Format	jira.user.format	1.0	2021-01-26 00:25:10.548+03
10203	JIRA Core Finnish (Finland) Language Pack	tac.jira core.languages.fi_FI	8.14.0.v20200826125100	2021-01-26 00:25:10.549+03
10204	JIRA Software Japanese (Japan) Language Pack	tac.jira software.languages.ja_JP	8.14.0.v20200826125100	2021-01-26 00:25:10.55+03
10205	View Project Operations Sections	jira.webfragments.view.project.operations	1.0	2021-01-26 00:25:10.551+03
10206	atlassian-servlet-plugin	com.atlassian.web.atlassian-servlet-plugin	5.2.0	2021-01-26 00:25:10.553+03
10207	Crowd REST API	crowd-rest-plugin	1.0	2021-01-26 00:25:10.555+03
10208	JIRA Software Polish (Poland) Language Pack	tac.jira software.languages.pl_PL	8.14.0.v20200826125100	2021-01-26 00:25:10.557+03
10209	Atlassian OAuth Consumer SPI	com.atlassian.oauth.atlassian-oauth-consumer-spi	4.0.2	2021-01-26 00:25:10.558+03
10210	Atlassian Jira - Plugins - Post-Upgrade Landing Page	com.atlassian.jira.plugins.jira-post-upgrade-landing-page-plugin	8.13.3	2021-01-26 00:25:10.56+03
10211	JIRA Core Hungarian (Hungary) Language Pack	tac.jira core.languages.hu_HU	8.14.0.v20200826125100	2021-01-26 00:25:10.561+03
10212	Atlassian Spring Scanner Annotations	com.atlassian.plugin.atlassian-spring-scanner-annotation	2.1.13	2021-01-26 00:25:10.562+03
10213	jackson-module-scala-2.10-provider	com.atlassian.scala.plugins.jackson-module-scala-2.10-provider-plugin	0.5	2021-01-26 00:25:10.564+03
10214	User anonymization in Jira Core	com.atlassian.jira.user.anonymize	1.0	2021-01-26 00:25:10.568+03
10215	Rich Text Editor for JIRA	com.atlassian.jira.plugins.jira-editor-plugin	4.2.10	2021-01-26 00:25:10.57+03
10216	Web Resources Plugin Jira Core	jira.core	1.0	2021-01-26 00:25:10.571+03
10217	Workflow Plugin	com.atlassian.jira.plugin.system.workflow	1.0	2021-01-26 00:25:10.573+03
10218	jira-importers-trello-plugin	com.atlassian.jira.plugins.jira-importers-trello-plugin	3.1.0	2021-01-26 00:25:10.575+03
10219	JIRA Software Dutch (Netherlands) Language Pack	tac.jira software.languages.nl_NL	8.14.0.v20200826125100	2021-01-26 00:25:10.576+03
10220	Icon Types Plugin	jira.icontypes	1.0	2021-01-26 00:25:10.578+03
10221	JIRA Core Norwegian (Norway) Language Pack	tac.jira core.languages.no_NO	8.14.0.v20200826125100	2021-01-26 00:25:10.579+03
10222	Atlassian WebHooks Plugin	com.atlassian.webhooks.atlassian-webhooks-plugin	3.3.0	2021-01-26 00:25:10.581+03
10223	Help Paths Plugin	jira.help.paths	1.0	2021-01-26 00:25:10.583+03
10224	Jira Base URL Plugin	com.atlassian.jira.jira-baseurl-plugin	3.3.0	2021-01-26 00:25:10.585+03
10225	Atlassian Jira - Plugins - Look And Feel Logo Upload Plugin	com.atlassian.jira.lookandfeel	8.13.3	2021-01-26 00:25:10.586+03
10226	Issue Status Plugin	com.atlassian.plugins.issue-status-plugin	2.1.1	2021-01-26 00:25:10.588+03
10227	Gadget Spec Publisher Plugin	com.atlassian.gadgets.publisher	6.0.1	2021-01-26 00:25:10.59+03
10228	Atlassian Jira - Plugins - OAuth Consumer SPI	com.atlassian.jira.oauth.consumer	8.13.3	2021-01-26 00:25:10.592+03
10229	Jira Agile	com.pyxis.greenhopper.jira	8.13.3	2021-01-26 00:25:10.593+03
10230	JIRA Software Estonian (Estonia) Language Pack	tac.jira software.languages.et_EE	8.14.0.v20200826125100	2021-01-26 00:25:10.595+03
10231	JIRA Core French (France) Language Pack	tac.jira core.languages.fr_FR	8.14.0.v20200826125100	2021-01-26 00:25:10.597+03
10232	Renderer Component Factories Plugin	com.atlassian.jira.plugin.wiki.renderercomponentfactories	1.0	2021-01-26 00:25:10.599+03
10233	Atlassian LESS Transformer Plugin	com.atlassian.plugins.less-transformer-plugin	4.0.0	2021-01-26 00:25:10.6+03
10234	Pocketknife Feature Flags Plugin	com.atlassian.pocketknife.featureflags-plugin	0.5.4	2021-01-26 00:25:10.602+03
10235	Functional Optics Library	io.atlassian.fugue.optics-4.7.2	4.7.2	2021-01-26 00:25:10.603+03
10236	Functional Extensions Retry Inter-Ops	io.atlassian.fugue.retry-4.7.2	4.7.2	2021-01-26 00:25:10.605+03
10237	Jira Bamboo Plugin	com.atlassian.jira.plugin.ext.bamboo	8.13.3	2021-01-26 00:25:10.606+03
10238	Atlassian Jira - Plugins - Transition Trigger Plugin	com.atlassian.jira.plugins.jira-transition-triggers-plugin	8.13.3	2021-01-26 00:25:10.608+03
10239	Atlassian Front-End Runtime Plugin	com.atlassian.frontend.atlassian-frontend-runtime-plugin	0.4.0	2021-01-26 00:25:10.609+03
10240	Atlassian Bot Session Killer	com.atlassian.labs.atlassian-bot-killer	1.7.10	2021-01-26 00:25:10.623+03
10241	User Profile Panels	jira.user.profile.panels	1.0	2021-01-26 00:25:10.624+03
10242	scala-2.10-provider-plugin	com.atlassian.scala.plugins.scala-2.10-provider-plugin	0.14	2021-01-26 00:25:10.626+03
10243	JIRA Software Romanian (Romania) Language Pack	tac.jira software.languages.ro_RO	8.14.0.v20200826125100	2021-01-26 00:25:10.628+03
10244	Atlassian Jira - Plugins - ActiveObjects SPI	com.atlassian.jira.jira-activeobjects-spi-plugin	8.13.3	2021-01-26 00:25:10.629+03
10245	Atlassian Rate Limiting - Plugin	com.atlassian.ratelimiting.rate-limiting-plugin	1.0.6	2021-01-26 00:25:10.631+03
10246	JIRA Project Permissions	jira.system.project.permissions	1.0	2021-01-26 00:25:10.632+03
10247	Wallboard Plugin	com.atlassian.jirawallboard.atlassian-wallboard-plugin	4.0.1	2021-01-26 00:25:10.633+03
10248	Atlassian Jira - Plugins - User Profile Plugin	com.atlassian.jira.jira-user-profile-plugin	4.0.6	2021-01-26 00:25:10.635+03
10249	Project Templates Plugin	com.atlassian.jira.project-templates-plugin	7.0.5	2021-01-26 00:25:10.636+03
10250	Atlassian Notifications	com.atlassian.whisper.atlassian-whisper-plugin	3.0.0	2021-01-26 00:25:10.637+03
10251	Filter Deletion Warning Plugin	jira.filter.deletion.warning	1.0	2021-01-26 00:25:10.639+03
10252	Jira Software Monitor Plugin	com.atlassian.jira.plugins.jira-software-monitor-plugin	8.13.3	2021-01-26 00:25:10.64+03
10253	English (United States) Language Pack	com.atlassian.jira.jira-languages.en_US	8.13.3	2021-01-26 00:25:10.641+03
10254	Atlassian Jira - Plugins - LESS integration	com.atlassian.jira.jira-less-integration	8.13.3	2021-01-26 00:25:10.643+03
10255	Atlassian Jira - Plugins - SAL Plugin	com.atlassian.sal.jira	8.13.3	2021-01-26 00:25:10.644+03
10256	Atlassian Diagnostics - Plugin	com.atlassian.diagnostics.atlassian-diagnostics-plugin	1.1.10	2021-01-26 00:25:10.645+03
10257	Atlassian Template Renderer Velocity 1.6 Plugin	com.atlassian.templaterenderer.atlassian-template-renderer-velocity1.6-plugin	4.0.2	2021-01-26 00:25:10.647+03
10258	Atlassian Jira - Plugins - Mail Plugin	com.atlassian.jira.jira-mail-plugin	11.0.11	2021-01-26 00:25:10.648+03
10259	Atlassian Jira - Plugins - Closure Template Renderer	com.atlassian.jira.jira-soy-plugin	8.13.3	2021-01-26 00:25:10.65+03
10260	Jira Workflow Designer Plugin	com.atlassian.jira.plugins.jira-workflow-designer	8.0.7	2021-01-26 00:25:10.651+03
10261	Gadget Dashboard Plugin	com.atlassian.gadgets.dashboard	6.0.1	2021-01-26 00:25:10.652+03
10262	Atlassian - Administration - Quick Search - JIRA	com.atlassian.administration.atlassian-admin-quicksearch-jira	2.3.3	2021-01-26 00:25:10.654+03
10263	Web Panel Plugin	jira.webpanels	1.0	2021-01-26 00:25:10.655+03
10264	Applinks - Plugin - OAuth	com.atlassian.applinks.applinks-oauth-plugin	8.0.0	2021-01-26 00:25:10.657+03
10265	JIRA browser metrics integration plugin	com.atlassian.jira.plugins.jira-browser-metrics	2.0.14	2021-01-26 00:25:10.659+03
10266	JIRA Activity Stream Plugin	com.atlassian.streams.streams-jira-plugin	8.2.2	2021-01-26 00:25:10.661+03
10267	English (United Kingdom) Language Pack	com.atlassian.jira.jira-languages.en_UK	8.13.3	2021-01-26 00:25:10.663+03
10268	Static Assets (CDN) Plugin	com.atlassian.plugins.static-assets-url	1.0.5	2021-01-26 00:25:10.664+03
10269	JIRA Usage Hints	jira.usage.hints	1.0	2021-01-26 00:25:10.666+03
\.


--
-- Data for Name: portalpage; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.portalpage (id, username, pagename, description, sequence, fav_count, layout, ppversion) FROM stdin;
10000	\N	System Dashboard	\N	0	0	AA	0
\.


--
-- Data for Name: portletconfiguration; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.portletconfiguration (id, portalpage, portlet_id, column_number, positionseq, gadget_xml, color, dashboard_module_complete_key) FROM stdin;
10000	10000	\N	0	0	\N	\N	com.atlassian.jira.gadgets:introduction-dashboard-item
10002	10000	\N	1	0	rest/gadgets/1.0/g/com.atlassian.jira.gadgets:assigned-to-me-gadget/gadgets/assigned-to-me-gadget.xml	\N	\N
10003	10000	\N	1	1	rest/gadgets/1.0/g/com.atlassian.streams.streams-jira-plugin:activitystream-gadget/gadgets/activitystream-gadget.xml	\N	\N
\.


--
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.priority (id, sequence, pname, description, iconurl, status_color) FROM stdin;
1	1	Highest	This problem will block progress.	/images/icons/priorities/highest.png	#ff7452
2	2	High	Serious problem that could block progress.	/images/icons/priorities/high.png	#ff8f73
3	3	Medium	Has the potential to affect progress.	/images/icons/priorities/medium.png	#ffab00
4	4	Low	Minor problem or easily worked around.	/images/icons/priorities/low.png	#0065ff
5	5	Lowest	Trivial problem with little or no impact on progress.	/images/icons/priorities/lowest.png	#2684ff
\.


--
-- Data for Name: productlicense; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.productlicense (id, license) FROM stdin;
10000	AAAB1Q0ODAoPeNp9UmFvokAQ/c6vILkvd7mALKJWk01OEe80qA3Ypmn8ssVRtsJCZhet/74omqOt9ePM7rz35r35ERZCnzCh245OrJ7l9OyW7oYL3bZsom3h8AgoeSYoaVtWx7prNom2QQARZ3kOaPo8AiHBW3F1/OXNFl5wH4xDT5sV6QvgfP0gSwRqEM3NhGKRmrEUKEtgK5lYoZklfA1YbP9sUsYTM8pS7ZUjM7+M3xcYxUzCkCmgR3WGRQy7pZ0VLA45nKDd+XTqBe6471+evLec46E2Zxu2c5HjTUva23pCwB3geEgHbvBsDJ66Q2M06/41Ol1CKrE5ZqsiUuaxMGS2VnuGYJbofAdUYQFaUkn5x2RMp+7eHblckX7m5OErDiz/IS4O27DFnHgt034cNFrhWzv9/TxxnsYjv++zVeclb3Cyb2yWdEkr1u+9v5LQNX/K1YUCwUT0jUc3lvuSz5mntMkfD0NvZvik3b6zm1ZTKyv6sXMDOFQMFSBds0SCNscNE1yy04YiUzrTy0hyJg6ai3Bqfz6Is9WXw7U/uAHlwpgjl+dchiAj5PkJflLq0MOzDv1nFfuvZU/3diwpTlyV8Hqw9SSueVwnr8/9x6zqd12UNL8wLAIUboz3tKlTmioLCnKM6I6g1G+C5IMCFADlWu2jPuefD/qNAgcJK4+8OuWRX02ma
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.project (id, pname, url, lead, description, pkey, pcounter, assigneetype, avatar, originalkey, projecttype) FROM stdin;
10000	Aleksandr Oliferuk Sample Project	\N	JIRAUSER10000	\N	AOSP	23	3	10324	AOSP	software
\.


--
-- Data for Name: project_key; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.project_key (id, project_id, project_key) FROM stdin;
10000	10000	AOSP
\.


--
-- Data for Name: projectcategory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.projectcategory (id, cname, description) FROM stdin;
\.


--
-- Data for Name: projectchangedtime; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.projectchangedtime (project_id, issue_changed_time) FROM stdin;
\.


--
-- Data for Name: projectrole; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.projectrole (id, name, description) FROM stdin;
10002	Administrators	A project role that represents administrators in a project
10100	Developers	\N
\.


--
-- Data for Name: projectroleactor; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.projectroleactor (id, pid, projectroleid, roletype, roletypeparameter) FROM stdin;
10002	\N	10002	atlassian-group-role-actor	jira-administrators
10100	10000	10002	atlassian-group-role-actor	jira-administrators
10101	10000	10100	atlassian-user-role-actor	JIRAUSER10000
\.


--
-- Data for Name: projectversion; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.projectversion (id, project, vname, description, sequence, released, archived, url, startdate, releasedate) FROM stdin;
10000	10000	Version 1.0	\N	1	true	\N	\N	\N	2021-01-18 12:53:13.062+03
10001	10000	Version 2.0	\N	2	\N	\N	\N	\N	2021-02-01 12:53:13.062+03
10002	10000	Version 3.0	\N	3	\N	\N	\N	\N	\N
\.


--
-- Data for Name: propertydata; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertydata (id, propertyvalue) FROM stdin;
\.


--
-- Data for Name: propertydate; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertydate (id, propertyvalue) FROM stdin;
\.


--
-- Data for Name: propertydecimal; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertydecimal (id, propertyvalue) FROM stdin;
\.


--
-- Data for Name: propertyentry; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertyentry (id, entity_name, entity_id, property_key, propertytype) FROM stdin;
6	jira.properties	1	jira.avatar.user.anonymous.id	5
7	jira.properties	1	jira.scheme.default.issue.type	5
9	jira.properties	1	jira.whitelist.disabled	1
10	jira.properties	1	jira.whitelist.rules	6
11	jira.properties	1	jira.option.timetracking	1
12	jira.properties	1	jira.timetracking.estimates.legacy.behaviour	1
13	jira.properties	1	jira.version	5
14	jira.properties	1	jira.downgrade.minimum.version	5
15	jira.properties	1	jira.option.allowunassigned	1
16	jira.properties	1	jira.path.index.use.default.directory	1
21	com.atlassian.jira.plugins.jira-workflow-designer	1	jira.workflow.layout:8a6044147cf2c19c02d099279cfbfd47	6
22	jira.properties	1	jira.onboarding.app_user.id.threshold	5
23	jira.properties	1	post.migration.page.displayed	1
1	jira.properties	1	jira.version.patched	5
2	jira.properties	1	jira.avatar.issuetype.subtask.default.id	5
3	jira.properties	1	jira.avatar.default.id	5
4	jira.properties	1	jira.avatar.issuetype.default.id	5
5	jira.properties	1	jira.avatar.user.default.id	5
10100	jira.properties	1	webwork.i18n.encoding	5
10101	jira.properties	1	jira.sid.key	5
10102	BambooServerProperties	1	bamboo.config.version	2
10103	GreenHopper.Run.History	1	lastRunVersion	6
10104	GreenHopper.Run.History	2	2021-01-25T21:24:57.340Z	6
10105	jira.properties	1	com.atlassian.audit.plugin:audit-config:retention:period	5
10106	jira.properties	1	AO_550953_#	5
10107	jira.properties	1	AO_60DB71_#	5
10108	jira.properties	1	AO_E8B6CC_#	5
10109	jira.properties	1	dvcs.connector.bitbucket.url	5
10110	jira.properties	1	dvcs.connector.github.url	5
10111	jira.plugin.devstatus.datastorage	1	upgrade.state	5
10112	jira.properties	1	com.atlassian.jira.plugins.inform.jira-inform-plugin:batching.interval.minutes	5
10113	jira.properties	1	AO_4AEACD_#	5
10114	jira.properties	1	AO_21D670_#	5
10115	jira.properties	1	com.atlassian.jira.util.index.IndexingCounterManagerImpl.counterValue	3
10116	jira.properties	1	jvm.system.timezone	5
10117	jira.properties	1	jira.webresource.superbatch.flushcounter	5
10118	jira.properties	1	jira.i18n.language.index	5
10119	jira.properties	1	jira.scheme.default.priority	5
10122	com.atlassian.jira.user.flag.FlagDismissalServiceImpl	1	com.atlassian.jira.flag.resets	6
10200	jira.properties	1	jira.webresource.flushcounter	5
10201	jira.properties	1	mailsetting.jira.mail.send.disabled.modifiedBy	5
10202	jira.properties	1	mailsetting.jira.mail.send.disabled.modifiedDate	5
10203	jira.properties	1	jira.i18n.default.locale	5
10204	jira.properties	1	jira.title	5
10205	jira.properties	1	jira.baseurl	5
10206	jira.properties	1	jira.mode	5
10207	jira.properties	1	jira.path.attachments	5
10208	jira.properties	1	jira.path.attachments.use.default.directory	1
10209	jira.properties	1	jira.option.allowattachments	1
10210	ServiceConfig	10200	USE_DEFAULT_DIRECTORY	5
10211	jira.properties	1	jira.path.backup	5
10212	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:user_management	5
10213	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:global_config_and_administration	5
10214	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:audit_log	5
10215	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:end_user_activity	5
10216	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:local_config_and_administration	5
10217	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:security	5
10218	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:permissions	5
10219	jira.properties	1	com.atlassian.audit.plugin:audit-config:coverage:ecosystem	5
10220	jira.properties	1	jira.setup	5
10221	jira.properties	1	jira.initial.build.number	5
10222	jira.properties	1	jira.option.voting	1
10223	jira.properties	1	jira.option.watching	1
10224	jira.properties	1	jira.option.issuelinking	1
10225	jira.properties	1	jira.option.emailvisible	5
10300	jira.properties	1	jira.option.allowsubtasks	1
10301	jira.properties	1	com.atlassian.upm:notifications:notification-plugin.request	5
10302	jira.properties	1	com.atlassian.upm:notifications:notification-edition.mismatch	5
10303	jira.properties	1	com.atlassian.upm:notifications:notification-evaluation.expired	5
10304	jira.properties	1	com.atlassian.upm:notifications:notification-evaluation.nearlyexpired	5
10305	jira.properties	1	com.atlassian.upm:notifications:notification-maintenance.expired	5
10306	jira.properties	1	com.atlassian.upm:notifications:notification-maintenance.nearlyexpired	5
10307	jira.properties	1	com.atlassian.upm:notifications:notification-license.expired	5
10308	jira.properties	1	com.atlassian.upm:notifications:notification-license.nearlyexpired	5
10309	GreenHopper.properties	1	GreenHopper.LexoRank.Default.customfield.id	3
10310	GreenHopper.properties	1	GreenHopper.EpicLink.Default.customfield.id	3
10314	GreenHopper.properties	1	GreenHopper.EpicStatus.Default.customfield.id	3
10315	GreenHopper.properties	1	GreenHopper.EpicLabel.Default.customfield.id	3
10316	GreenHopper.properties	1	GreenHopper.EpicColor.Default.customfield.id	3
10391	user.format.mapping	1	fullName	5
10317	GreenHopper.properties	1	GreenHopper.Sprint.Default.customfield.id	3
10319	GreenHopper.properties	1	GreenHopper.JIRA60.Version.Migration	1
10321	GreenHopper.properties	1	GreenHopper.Epic.Default.issuetype.id	5
10322	GreenHopper.properties	1	GreenHopper.Story.Default.issuetype.id	5
10363	jira.properties	1	com.atlassian.streams.InlineActivityStream:loaded.from.jira.projects	5
10370	fisheye-jira-plugin.properties	1	Upgrade Conditions Applied	5
10371	fisheye-jira-plugin.properties	1	FISH-375-fixed	5
10372	fisheye-jira-plugin.properties	1	fisheye.ual.migration.complete	5
10373	fisheye-jira-plugin.properties	1	fisheye.ual.crucible.enabled.property.fix.complete	5
10374	fisheye-jira-plugin.properties	1	Perforce Update Applied	5
10375	ApplicationUser	10000	jira.onboarding.first.use.flow.started	5
10376	jira.properties	1	com.atlassian.jira.onboarding.postsetup.AppPropertiesPostSetupAnnouncementStore.all	6
10377	jira.properties	1	com.atlassian.upm:notifications:notification-update	5
10378	ApplicationUser	10000	newsletter.signup.first.view	3
10379	ApplicationUser	10000	jira.user.locale	5
10381	ApplicationUser	10000	user.avatar.id	3
10320	GreenHopper.properties	1	JIRA.Software.Simplified.Workflow.Upgraded	1
10323	GreenHopper.properties	1	GreenHopper.StoryPoints.Default.customfield.id	3
10324	GreenHopper.properties	1	GreenHopper.Epic.Default.linktype.id	3
10325	jira.properties	1	com.atlassian.sal.jira:build	5
10326	jira.properties	1	com.atlassian.plugins.atlassian-whitelist-api-plugin:whitelist.enabled	5
10327	jira.properties	1	com.atlassian.jira.gadgets:build	5
10328	jira.properties	1	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin:build	5
10329	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.290Z	6
10330	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.303Z	6
10331	GreenHopper.properties	1	GreenHopper.Upgrade.Latest.Upgraded.Version	3
10332	jira.properties	1	com.pyxis.greenhopper.jira:build	5
10333	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.317Z	6
10334	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.338Z	6
10335	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.353Z	6
10336	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.364Z	6
10337	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.381Z	6
10338	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.429Z	6
10339	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.441Z	6
10340	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.462Z	6
10341	GreenHopper.UpgradeHistory	1	2021-01-25T21:32:18.478Z	6
10342	GreenHopper.UpgradeHistory	2	2021-01-25T21:32:18.484Z	6
10343	jira.properties	1	com.atlassian.crowd.embedded.admin:build	5
10344	jira.properties	1	com.atlassian.plugins.atlassian-whitelist-core-plugin:build	5
10345	jira.properties	1	com.atlassian.jira.plugin.ext.bamboo:build	5
10346	jira.properties	1	com.atlassian.jira.jira-mail-plugin:build	5
10347	jira.properties	1	com.atlassian.plugins.custom_apps.hasCustomOrder	5
10348	jira.properties	1	com.atlassian.plugins.atlassian-nav-links-plugin:build	5
10349	jira.properties	1	com.atlassian.jira.plugins.jira-workflow-designer:build	5
10350	jira.properties	1	com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin:build	5
10351	jira.properties	1	com.atlassian.jirawallboard.atlassian-wallboard-plugin:build	5
10352	jira.properties	1	com.atlassian.upm.atlassian-universal-plugin-manager-plugin:build	5
10353	jira.properties	1	com.atlassian.jira.lookandfeel:isDefaultFavicon	5
10354	jira.properties	1	com.atlassian.jira.lookandfeel:usingCustomFavicon	5
10355	jira.properties	1	com.atlassian.jira.lookandfeel:customDefaultFaviconURL	5
10356	jira.properties	1	com.atlassian.jira.lookandfeel:customDefaultFaviconHiresURL	5
10357	jira.properties	1	com.atlassian.jira.lookandfeel:faviconWidth	5
10358	jira.properties	1	com.atlassian.jira.lookandfeel:faviconHeight	5
10359	jira.properties	1	com.atlassian.jira.lookandfeel:build	5
10360	jira.properties	1	com.atlassian.plugins.authentication.atlassian-authentication-plugin:build	5
10361	jira.properties	1	com.atlassian.plugins.authentication.sso.config.sso-type	5
10362	jira.properties	1	com.atlassian.jira.project-templates-plugin:build	5
10364	jira.properties	1	com.atlassian.analytics.client.configuration..analytics_enabled	5
10366	jira.properties	1	com.atlassian.analytics.client.configuration.uuid	5
10367	jira.properties	1	com.atlassian.analytics.client.configuration.serverid	5
10368	jira.properties	1	jira-header-plugin.studio-tab-migration-complete	5
10369	jira.properties	1	com.atlassian.analytics.client.configuration..policy_acknowledged	5
10380	ApplicationUser	10000	jira.onboarding.first.use.flow.current.sequence	5
10382	ApplicationUser	10000	jira.onboarding.first.use.flow.completed	1
10383	jira.properties	1	com.pyxis.greenhopper.jira:default.permission.scheme.id	5
10384	ApplicationUser	10000	com.atlassian.jira.jira-projects-plugin:release-page.badge	2
10385	user.format.mapping	1	profileLink	5
10386	ApplicationUser	10000	last-visited-item.10000	5
10387	ApplicationUser	10000	jira.user.timezone	5
10388	ApplicationUser	10000	com.atlassian.jira.flag.dismissals	6
10389	ApplicationUser	10000	jira.user.suppressedTips.qs-onboarding-tip	1
10390	ApplicationUser	10000	jira.user.suppressedTips.onboarding-create-sprint	1
10400	jira.properties	1	com.atlassian.jira.upgrade.untranslatedkeyfixer.disabled	5
10365	jira.properties	1	com.atlassian.upm.log.PluginSettingsAuditLogService:log:upm_audit_log_v3	6
10500	jira.properties	1	com.atlassian.analytics.client.configuration..logged_base_analytics_data	5
10600	ApplicationUser	10000	jira.onboarding.first.use.flow.resolved	1
10601	jira.properties	1	org.apache.shindig.common.crypto.BlobCrypter:key	5
10602	jira.properties	1	jira.trustedapp.key.private.data	6
10603	jira.properties	1	jira.trustedapp.key.public.data	6
10604	jira.properties	1	jira.trustedapp.uid	5
10605	ApplicationUser	10000	jira.user.suppressedTips.add.new.users	1
10606	ApplicationUser	10100	com.atlassian.jira.flag.dismissals	6
10607	ApplicationUser	10100	jira.onboarding.first.use.flow.started	5
10608	ApplicationUser	10100	newsletter.signup.first.view	3
10609	ApplicationUser	10100	jira.onboarding.first.use.flow.current.sequence	5
10610	ApplicationUser	10100	user.avatar.id	3
10611	ApplicationUser	10100	jira.onboarding.first.use.flow.completed	1
10612	ApplicationUser	10100	com.atlassian.jira.jira-projects-plugin:release-page.badge	2
10613	ApplicationUser	10100	last-visited-item.10000	5
10614	ApplicationUser	10100	jira.user.suppressedTips.qs-onboarding-tip	1
10615	ApplicationUser	10100	jira.user.suppressedTips.onboarding-create-sprint	1
10616	ApplicationUser	10100	jira.onboarding.first.use.flow.resolved	1
\.


--
-- Data for Name: propertynumber; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertynumber (id, propertyvalue) FROM stdin;
9	0
11	1
12	0
15	1
16	1
23	1
10102	22
10208	1
10209	1
10222	1
10223	1
10224	1
10300	1
10309	10100
10310	10101
10314	10102
10315	10103
10316	10104
10317	10105
10319	1
10320	1
10323	10106
10324	10200
10331	51
10378	1611610353960
10381	10335
10382	1
10384	0
10389	1
10390	1
10115	2
10600	1
10605	1
10608	1611650941132
10610	10350
10611	1
10612	0
10614	1
10615	1
10616	1
\.


--
-- Data for Name: propertystring; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertystring (id, propertyvalue) FROM stdin;
10212	base
10213	base
10214	base
10215	base
10216	base
10217	base
10218	base
10219	base
10210	true
10117	4
10220	true
10221	813003
10225	show
10302	#java.util.List\n
10303	#java.util.List\n
10304	#java.util.List\n
10305	#java.util.List\n
10306	#java.util.List\n
10307	#java.util.List\n
10308	#java.util.List\n
2	10316
3	10011
4	10300
5	10122
6	10123
7	10000
22	0
10100	UTF-8
10101	B24L-GIO2-41WW-6X7B
10105	P20Y
10106	1
10107	1
10321	10000
10322	10001
10325	2
10109	https://bitbucket.org
10110	https://github.com
10327	1
10328	2
10108	16
10111	UPGRADED
10112	1
10113	1
10114	1
10116	UTC
10119	10101
1	813003
13	8.13.3
14	7.1.2
10200	6411e0087192541a09d88223fb51a6a0
10201	
10202	1611609911727
10203	ru_RU
10118	russian
10204	Jira
10205	http://192.168.12.43:8081
10206	private
10207	/var/atlassian/application-data/jira/data/attachments
10211	/var/atlassian/application-data/jira/export
10332	51
10343	3
10326	true
10344	4
10345	1
10346	2
10347	false
10348	1
10349	1
10350	3
10351	6086
10352	5
10353	false
10354	false
10355	/favicon.ico
10356	/images/64jira.png
10357	64
10358	64
10359	1
10361	NONE
10360	5
10362	2001
10363	true
10364	true
10366	c78ec2c6-a2c7-47e1-9b55-87574fbfd697
10367	B24L-GIO2-41WW-6X7B
10368	migrated
10370	1
10371	1
10372	1
10373	1
10374	1
10375	cyoaFirstUseFlow
10379	en_US
10380	cyoa:return
10383	10000
10385	jira.user.format:profile-link-user-format
10386	com.pyxis.greenhopper.jira:project-sidebar-plan-scrum
10387	Europe/Moscow
10391	jira.user.format:full-name-user-format
10400	true
10301	#java.util.List\n
10369	true
10377	#java.util.List\ncom.atlassian.jira.extra.jira-ical-feed\ncom.atlassian.troubleshooting.plugin-jira
10500	true
10601	DtaEAg2RYNdQ0RUsY5BUc+7Uv0CMNyHGzwg65KFT2p0=
10604	jira:11529364
10607	cyoaFirstUseFlow
10609	cyoa
10613	com.pyxis.greenhopper.jira:project-sidebar-plan-scrum
\.


--
-- Data for Name: propertytext; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.propertytext (id, propertyvalue) FROM stdin;
10	http://www.atlassian.com/*\n
21	{\n    "edgeMap": {\n        "1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA": {\n            "actionId": 5,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1806.5,\n                    "y": 434.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1801.0,\n                    "y": 115.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1801.0,\n                "y": 115.0\n            },\n            "endStepId": 4,\n            "id": "1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA",\n            "label": "Resolve Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1776.85,\n                "y": 355.25\n            },\n            "lineType": "straight",\n            "startNodeId": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1806.5,\n                "y": 434.0\n            },\n            "startStepId": 5\n        },\n        "3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230": {\n            "actionId": 2,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1469.5,\n                    "y": 113.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1614.0,\n                    "y": 226.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1614.0,\n                "y": 226.0\n            },\n            "endStepId": 6,\n            "id": "3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230",\n            "label": "Close Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1492.25,\n                "y": 154.25\n            },\n            "lineType": "straight",\n            "startNodeId": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1469.5,\n                "y": 113.0\n            },\n            "startStepId": 1\n        },\n        "483797F1-1BF4-5E0F-86C6-4D19CE6023A2": {\n            "actionId": 5,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1469.5,\n                    "y": 113.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1763.0,\n                    "y": 113.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1763.0,\n                "y": 113.0\n            },\n            "endStepId": 4,\n            "id": "483797F1-1BF4-5E0F-86C6-4D19CE6023A2",\n            "label": "Resolve Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1551.0,\n                "y": 104.0\n            },\n            "lineType": "straight",\n            "startNodeId": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1469.5,\n                "y": 113.0\n            },\n            "startStepId": 1\n        },\n        "517D7F32-20FB-309E-8639-4D19CE2ACB54": {\n            "actionId": 5,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1434.0,\n                    "y": 435.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1435.0,\n                    "y": 490.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1947.0,\n                    "y": 494.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1950.0,\n                    "y": 118.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1763.0,\n                    "y": 113.0\n                }\n            ],\n            "controlPoints": [\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1435.0,\n                    "y": 490.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1947.0,\n                    "y": 494.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1950.0,\n                    "y": 118.0\n                }\n            ],\n            "endNodeId": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1763.0,\n                "y": 113.0\n            },\n            "endStepId": 4,\n            "id": "517D7F32-20FB-309E-8639-4D19CE2ACB54",\n            "label": "Resolve Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1631.25,\n                "y": 479.5\n            },\n            "lineType": "poly",\n            "startNodeId": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1434.0,\n                "y": 435.0\n            },\n            "startStepId": 3\n        },\n        "58BD4605-5FB9-84EA-6952-4D19CE7B454B": {\n            "actionId": 1,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1470.0,\n                    "y": 16.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1469.5,\n                    "y": 113.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1469.5,\n                "y": 113.0\n            },\n            "endStepId": 1,\n            "id": "58BD4605-5FB9-84EA-6952-4D19CE7B454B",\n            "label": "Create Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1475.5,\n                "y": 48.5\n            },\n            "lineType": "straight",\n            "startNodeId": "15174530-AE75-04E0-1D9D-4D19CD200835",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1470.0,\n                "y": 16.0\n            },\n            "startStepId": 1\n        },\n        "92D3DEFD-13AC-06A7-E5D8-4D19CE537791": {\n            "actionId": 4,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1439.5,\n                    "y": 116.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1393.0,\n                    "y": 116.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1390.0,\n                    "y": 434.0\n                }\n            ],\n            "controlPoints": [\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1393.0,\n                    "y": 116.0\n                }\n            ],\n            "endNodeId": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1390.0,\n                "y": 434.0\n            },\n            "endStepId": 3,\n            "id": "92D3DEFD-13AC-06A7-E5D8-4D19CE537791",\n            "label": "Start Progress",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1323.65,\n                "y": 193.75\n            },\n            "lineType": "poly",\n            "startNodeId": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1439.5,\n                "y": 116.0\n            },\n            "startStepId": 1\n        },\n        "C049EE11-C5BB-F93B-36C3-4D19CDF12B8F": {\n            "actionId": 3,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1677.0,\n                    "y": 227.0\n                },\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1767.05,\n                    "y": 230.05\n                },\n                {\n                    "positiveController": null,\n                    "x": 1773.5,\n                    "y": 425.0\n                }\n            ],\n            "controlPoints": [\n                {\n                    "positiveController": {\n                        "positiveController": null,\n                        "x": 0.0,\n                        "y": 0.0\n                    },\n                    "x": 1767.05,\n                    "y": 230.05\n                }\n            ],\n            "endNodeId": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1773.5,\n                "y": 425.0\n            },\n            "endStepId": 5,\n            "id": "C049EE11-C5BB-F93B-36C3-4D19CDF12B8F",\n            "label": "Reopen Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1703.85,\n                "y": 218.5\n            },\n            "lineType": "poly",\n            "startNodeId": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1677.0,\n                "y": 227.0\n            },\n            "startStepId": 6\n        },\n        "C9EA1792-2332-8B56-A04D-4D19CD725367": {\n            "actionId": 301,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1465.0,\n                    "y": 436.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1469.5,\n                    "y": 113.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1469.5,\n                "y": 113.0\n            },\n            "endStepId": 1,\n            "id": "C9EA1792-2332-8B56-A04D-4D19CD725367",\n            "label": "Stop Progress",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1407.8,\n                "y": 308.5\n            },\n            "lineType": "straight",\n            "startNodeId": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1465.0,\n                "y": 436.0\n            },\n            "startStepId": 3\n        },\n        "CAF37138-6321-E03A-8E41-4D19CDD7DC78": {\n            "actionId": 2,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1764.5,\n                    "y": 430.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1614.0,\n                    "y": 226.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1614.0,\n                "y": 226.0\n            },\n            "endStepId": 6,\n            "id": "CAF37138-6321-E03A-8E41-4D19CDD7DC78",\n            "label": "Close Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1677.65,\n                "y": 365.0\n            },\n            "lineType": "straight",\n            "startNodeId": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1764.5,\n                "y": 430.0\n            },\n            "startStepId": 5\n        },\n        "E1F8462A-8B0A-87EA-4F70-4D19CE423C83": {\n            "actionId": 2,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1488.0,\n                    "y": 430.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1614.0,\n                    "y": 226.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1614.0,\n                "y": 226.0\n            },\n            "endStepId": 6,\n            "id": "E1F8462A-8B0A-87EA-4F70-4D19CE423C83",\n            "label": "Close Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1492.0,\n                "y": 345.0\n            },\n            "lineType": "straight",\n            "startNodeId": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1488.0,\n                "y": 430.0\n            },\n            "startStepId": 3\n        },\n        "E27D8EB8-8E49-430B-8FCB-4D19CE127171": {\n            "actionId": 3,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1840.0,\n                    "y": 130.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1846.5,\n                    "y": 428.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1846.5,\n                "y": 428.0\n            },\n            "endStepId": 5,\n            "id": "E27D8EB8-8E49-430B-8FCB-4D19CE127171",\n            "label": "Reopen Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1814.05,\n                "y": 169.5\n            },\n            "lineType": "straight",\n            "startNodeId": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1840.0,\n                "y": 130.0\n            },\n            "startStepId": 4\n        },\n        "F79E742D-A9E4-0124-D7D4-4D19CDE48C9C": {\n            "actionId": 4,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1806.5,\n                    "y": 434.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1434.0,\n                    "y": 435.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1434.0,\n                "y": 435.0\n            },\n            "endStepId": 3,\n            "id": "F79E742D-A9E4-0124-D7D4-4D19CDE48C9C",\n            "label": "Start Progress",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1607.25,\n                "y": 423.5\n            },\n            "lineType": "straight",\n            "startNodeId": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1806.5,\n                "y": 434.0\n            },\n            "startStepId": 5\n        },\n        "FD6BA267-475B-70B3-8AA4-4D19CE00BCD1": {\n            "actionId": 701,\n            "allPoints": [\n                {\n                    "positiveController": null,\n                    "x": 1763.0,\n                    "y": 113.0\n                },\n                {\n                    "positiveController": null,\n                    "x": 1614.0,\n                    "y": 226.0\n                }\n            ],\n            "controlPoints": [],\n            "endNodeId": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "endPoint": {\n                "positiveController": null,\n                "x": 1614.0,\n                "y": 226.0\n            },\n            "endStepId": 6,\n            "id": "FD6BA267-475B-70B3-8AA4-4D19CE00BCD1",\n            "label": "Close Issue",\n            "labelPoint": {\n                "positiveController": null,\n                "x": 1635.75,\n                "y": 152.25\n            },\n            "lineType": "straight",\n            "startNodeId": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "startPoint": {\n                "positiveController": null,\n                "x": 1763.0,\n                "y": 113.0\n            },\n            "startStepId": 4\n        }\n    },\n    "nodeMap": {\n        "0740FFFA-2AA1-C90A-38ED-4D19CD61899B": {\n            "id": "0740FFFA-2AA1-C90A-38ED-4D19CD61899B",\n            "inLinkIds": [\n                "F79E742D-A9E4-0124-D7D4-4D19CDE48C9C",\n                "92D3DEFD-13AC-06A7-E5D8-4D19CE537791"\n            ],\n            "isInitialAction": false,\n            "label": "In Progress",\n            "outLinkIds": [\n                "C9EA1792-2332-8B56-A04D-4D19CD725367",\n                "517D7F32-20FB-309E-8639-4D19CE2ACB54",\n                "E1F8462A-8B0A-87EA-4F70-4D19CE423C83"\n            ],\n            "rect": {\n                "height": 45.0,\n                "positiveController": null,\n                "width": 146.0,\n                "x": 1373.0,\n                "y": 419.0\n            },\n            "stepId": 3\n        },\n        "15174530-AE75-04E0-1D9D-4D19CD200835": {\n            "id": "15174530-AE75-04E0-1D9D-4D19CD200835",\n            "inLinkIds": [],\n            "isInitialAction": true,\n            "label": "Create Issue",\n            "outLinkIds": [\n                "58BD4605-5FB9-84EA-6952-4D19CE7B454B"\n            ],\n            "rect": {\n                "height": 45.0,\n                "positiveController": null,\n                "width": 157.0,\n                "x": 1405.0,\n                "y": 0.0\n            },\n            "stepId": 1\n        },\n        "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34": {\n            "id": "1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34",\n            "inLinkIds": [\n                "CAF37138-6321-E03A-8E41-4D19CDD7DC78",\n                "E1F8462A-8B0A-87EA-4F70-4D19CE423C83",\n                "FD6BA267-475B-70B3-8AA4-4D19CE00BCD1",\n                "3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230"\n            ],\n            "isInitialAction": false,\n            "label": "Closed",\n            "outLinkIds": [\n                "C049EE11-C5BB-F93B-36C3-4D19CDF12B8F"\n            ],\n            "rect": {\n                "height": 45.0,\n                "positiveController": null,\n                "width": 120.0,\n                "x": 1569.0,\n                "y": 210.0\n            },\n            "stepId": 6\n        },\n        "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D": {\n            "id": "6DA64EEB-08FE-2870-C90C-4D19CDA2F72D",\n            "inLinkIds": [\n                "517D7F32-20FB-309E-8639-4D19CE2ACB54",\n                "1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA",\n                "483797F1-1BF4-5E0F-86C6-4D19CE6023A2"\n            ],\n            "isInitialAction": false,\n            "label": "Resolved",\n            "outLinkIds": [\n                "FD6BA267-475B-70B3-8AA4-4D19CE00BCD1",\n                "E27D8EB8-8E49-430B-8FCB-4D19CE127171"\n            ],\n            "rect": {\n                "height": 44.0,\n                "positiveController": null,\n                "width": 137.0,\n                "x": 1709.0,\n                "y": 97.0\n            },\n            "stepId": 4\n        },\n        "778534F4-7595-88B6-45E1-4D19CD518712": {\n            "id": "778534F4-7595-88B6-45E1-4D19CD518712",\n            "inLinkIds": [\n                "C9EA1792-2332-8B56-A04D-4D19CD725367",\n                "58BD4605-5FB9-84EA-6952-4D19CE7B454B"\n            ],\n            "isInitialAction": false,\n            "label": "Open",\n            "outLinkIds": [\n                "92D3DEFD-13AC-06A7-E5D8-4D19CE537791",\n                "483797F1-1BF4-5E0F-86C6-4D19CE6023A2",\n                "3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230"\n            ],\n            "rect": {\n                "height": 45.0,\n                "positiveController": null,\n                "width": 106.0,\n                "x": 1429.5,\n                "y": 97.0\n            },\n            "stepId": 1\n        },\n        "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB": {\n            "id": "A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB",\n            "inLinkIds": [\n                "E27D8EB8-8E49-430B-8FCB-4D19CE127171",\n                "C049EE11-C5BB-F93B-36C3-4D19CDF12B8F"\n            ],\n            "isInitialAction": false,\n            "label": "Reopened",\n            "outLinkIds": [\n                "1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA",\n                "CAF37138-6321-E03A-8E41-4D19CDD7DC78",\n                "F79E742D-A9E4-0124-D7D4-4D19CDE48C9C"\n            ],\n            "rect": {\n                "height": 45.0,\n                "positiveController": null,\n                "width": 142.0,\n                "x": 1749.5,\n                "y": 418.0\n            },\n            "stepId": 5\n        }\n    },\n    "rootIds": [\n        "15174530-AE75-04E0-1D9D-4D19CD200835"\n    ],\n    "width": 1136\n}\n
10104	<map>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:24:57.325Z</string>\n  </entry>\n  <entry>\n    <string>buildDate</string>\n    <string>2021-01-14T13:49:11.200Z</string>\n  </entry>\n  <entry>\n    <string>latestUpgradeTaskRun</string>\n    <string>0</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10122	{"com.atlassian.jira.reindex.required":1611610337903}
10329	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.290Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>46</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10330	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>9</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.303Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>46</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10333	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.317Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>47</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10334	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>14</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.337Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>47</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10335	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.353Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>48</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10336	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>7</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.364Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>48</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10337	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.381Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>49</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10338	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>42</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.429Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>49</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10339	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.441Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>50</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10340	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>18</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.462Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>50</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10341	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>-1</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.478Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>51</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10342	<map>\n  <entry>\n    <string>timeTaken</string>\n    <string>3</string>\n  </entry>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-25T21:32:18.484Z</string>\n  </entry>\n  <entry>\n    <string>buildNumber</string>\n    <string>51</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10365	#java.util.List\n{"userKey":"JIRA","date":1611650722904,"i18nKey":"upm.auditLog.upm.startup","entryType":"UPM_STARTUP","params":[]}\n{"userKey":"JIRA","date":1611650592088,"i18nKey":"upm.auditLog.upm.startup","entryType":"UPM_STARTUP","params":[]}\n{"userKey":"JIRA","date":1611610339860,"i18nKey":"upm.auditLog.upm.startup","entryType":"UPM_STARTUP","params":[]}
10103	<map>\n  <entry>\n    <string>pluginVersion</string>\n    <string>8.13.3</string>\n  </entry>\n  <entry>\n    <string>ranOn</string>\n    <string>2021-01-26T08:45:05.736Z</string>\n  </entry>\n  <entry>\n    <string>buildDate</string>\n    <string>2021-01-14T13:49:11.200Z</string>\n  </entry>\n  <entry>\n    <string>latestUpgradeTaskRun</string>\n    <string>0</string>\n  </entry>\n  <entry>\n    <string>changeSet</string>\n    <string>aaffa01d8cbab744</string>\n  </entry>\n</map>
10376	app.properties.setup=FULLFILLED;create.user.mail.properties.setup=ANNOUNCED;database.setup=AWAITS;mail.properties.setup=ANNOUNCE
10388	{"com.atlassian.jira.tzdetect.10800000,10800000":1611610423021}
10606	{"com.atlassian.jira.tzdetect.10800000,10800000":1611650956441}
10602	MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCfdDWaw9FYyrkSsUKbPF2aqZDVKiTqL3tdLcwlorznn9flhBjdsPrPZvAR/32aaIAGvRJsCzEH49BkJ6XPNckZrjA5NYnSTbFbKGT0Q/u2sVat7dWczCLyinBzBUWmii7bierWlO9CdDlgmn3/OuJ30vh2mo0DdskgOfC8yAO8OongiZPzW08Lg9icDPr3VsmfMesv8WZX+nfl/XHqG5DPUFcsmxsjeV7Zhm7+jTyrqPg6roKTJZPwuvYshEVNs4myrsb+fURI+m6uyY/eGaMUr+s7UoLYwbWJ+gtZwVC+G5x8OJ5lP/SDypBrHBOeiB5pDn4RtTuLJC+/2p2bnXC3AgMBAAECggEAEiDOoAKc5Y41U07he9pK6V9XeXyknMFQMlbswOdLDb7/ocw5CCnrod0Z9G81EvMdgbvzgQ1sAhx1ipAdYDzvrjfpAKAPGWCUMNZwqnqjfpuTzLYKP/IkvlQHQR8Q0kR0hlNxkPrMEXnlig+WZ92EdiCp9yX5W92giRrn5+E014HWtnEp61EGcGkBZ63zTD9cPeuNcR6JXGMAGE0Em9Se389c4XtVnSOXiWhVQvudiT/FpCX4BaNOzJnEXvLczdu7Q7sO3mBfNYyN97R0fFxcjES4f0uQBlsfJuzqCqxGyl8tC8X395aXcvprXiiAqfbP2zz08iRUA6z8HZ1JDsEHgQKBgQDgxlKOpyJk//QOpc/k72vpFLYo/eZKqtT/dpJr1nCNImrMrxn0lt3NQKgCRxvLatzAJP3pLmYamNGSIDGOX01C4yVxOOLYs0UUqcrXXItA6V6wdHp1SovvbbuDuLtup5c2C6IPx2OL6vtQOa0s8uIqVTv/Wv5+Fj+KbtuAARLoNwKBgQC1muFtQwEy4b/LUAuiJlwGpvNqw6IC+xxZUC0v6GoGGCT+pQ4mLwTyOB0lats7VnS5F6ra/2D6h3BS2ZiaSSmFTHzNXWiF3y/FSh2bttWbMELtY6SZ+GhJUvguh0tukEj9xKVXF1tJq/r+mBzOrwKwCj4cdM3+1cpCg9D3Vpx7gQKBgH+cOIyimKVMpuuV+YRY5SPLzWtSUmc7u3dZguFUOkv2KToRgyPYbw4zUe8RHdeL0M4JclnrLK6W6gwS2O+ibYO236/7AtbSWDrV9sHz2V893rNBPbDPZMjGvLmYrFizLubRDe31Xi+2dX1jcUzei8ZK46giqe89hE98hoOSmIBbAoGAd8iHpgTLFp+WXOkYM0Sv8GdQKPyOsP6mbTaYB4B55jkotZly4raiwY1HlDWOEu5soOU+eaJ2eei5qrwBjspxC44ux1o0JhDXNn8zVlDbRbgofOH7YN9bEfoa3r24gF3E9zUshWxPdyFrtV/pqF4BHNI0s5pLgSnMdeDyBSJopoECgYAhjAic1oN2EUO+l70T4spVbFvt2LZLmEn4DCiyCHtRSP0fQ+GsZsIqDILRkEd0IyyIodLCMELF74wROVq+zQX/udBfNuucaw2C6QcsZnVNorUCBlWoop/TorQt+fTcpLS8Io79k6RGf1R36v2oXm4aTBhbl83bqe1eqBSDSM6vyw==
10603	MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn3Q1msPRWMq5ErFCmzxdmqmQ1Sok6i97XS3MJaK855/X5YQY3bD6z2bwEf99mmiABr0SbAsxB+PQZCelzzXJGa4wOTWJ0k2xWyhk9EP7trFWre3VnMwi8opwcwVFpoou24nq1pTvQnQ5YJp9/zrid9L4dpqNA3bJIDnwvMgDvDqJ4ImT81tPC4PYnAz691bJnzHrL/FmV/p35f1x6huQz1BXLJsbI3le2YZu/o08q6j4Oq6CkyWT8Lr2LIRFTbOJsq7G/n1ESPpursmP3hmjFK/rO1KC2MG1ifoLWcFQvhucfDieZT/0g8qQaxwTnogeaQ5+EbU7iyQvv9qdm51wtwIDAQAB
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_calendars (id, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_cron_triggers (id, trigger_id, cronexperssion) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_fired_triggers (id, entry_id, trigger_id, trigger_listener, fired_time, trigger_state) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_job_details (id, job_name, job_group, class_name, is_durable, is_stateful, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_job_listeners; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_job_listeners (id, job, job_listener) FROM stdin;
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_simple_triggers (id, trigger_id, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_trigger_listeners; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_trigger_listeners (id, trigger_id, trigger_listener) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.qrtz_triggers (id, trigger_name, trigger_group, job, next_fire, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr) FROM stdin;
\.


--
-- Data for Name: reindex_component; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.reindex_component (id, request_id, affected_index, entity_type) FROM stdin;
10100	10000	ISSUE	NONE
10101	10000	COMMENT	NONE
10102	10000	CHANGEHISTORY	NONE
10103	10000	WORKLOG	NONE
\.


--
-- Data for Name: reindex_request; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.reindex_request (id, type, request_time, start_time, completion_time, status, execution_node_id, query) FROM stdin;
10000	IMMEDIATE	2021-01-26 00:25:11.247+03	2021-01-26 00:32:13.306+03	2021-01-26 00:32:13.467+03	COMPLETE	\N	\N
\.


--
-- Data for Name: remembermetoken; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.remembermetoken (id, created, token, username) FROM stdin;
\.


--
-- Data for Name: remotelink; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.remotelink (id, issueid, globalid, title, summary, url, iconurl, icontitle, relationship, resolved, statusname, statusdescription, statusiconurl, statusicontitle, statusiconlink, statuscategorykey, statuscategorycolorname, applicationtype, applicationname) FROM stdin;
\.


--
-- Data for Name: replicatedindexoperation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.replicatedindexoperation (id, index_time, node_id, affected_index, entity_type, affected_ids, versions, operation, filename) FROM stdin;
\.


--
-- Data for Name: resolution; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.resolution (id, sequence, pname, description, iconurl) FROM stdin;
10000	1	Готово	Для этой проблемы работа завершена.	\N
10001	2	Не получится	Данная проблема не будет выполняться.	\N
10002	3	Дубликат	Проблема является дубликатом существующей проблемы.	\N
10003	4	Не воспроизводится	Не удалась ни одна попытка воспроизведения этой проблемы; возможно, было недостаточно информации. Чтение кода не дает какой-либо информации о причинах такого поведения. Если впоследствии появятся новые данные, откройте эту проблему заново.	\N
10004	5	Done	GreenHopper Managed Resolution	\N
\.


--
-- Data for Name: rundetails; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.rundetails (id, job_id, start_time, run_duration, run_outcome, info_message) FROM stdin;
10020	com.atlassian.jira.service.JiraService:10200	2021-01-26 00:27:42.181+03	4018	S	
10027	com.atlassian.jira.cache.monitor.CacheStatisticsMonitor	2021-01-26 00:29:15.087+03	1	S	
10439	com.atlassian.jira.versioning.VersioningCleanupService	2021-01-26 11:50:18.152+03	16	S	
10102	LocalPluginLicenseNotificationJob-job	2021-01-26 00:32:13.61+03	168	S	
10204	PluginRequestCheckJob-job	2021-01-26 11:43:17.211+03	36	S	
10205	com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job	2021-01-26 11:43:17.211+03	44	S	
10206	com.atlassian.jira.service.JiraService:10002	2021-01-26 11:43:17.257+03	34	S	
10522	com.atlassian.jira.plugin.cluster.monitoring.internal.job.ApplicationStatusCollector	2021-01-26 11:59:28.691+03	1	S	
10523	CompatibilityPluginScheduler.JobId.LEXO_RANK_SCHEDULER_JOB	2021-01-26 11:59:28.751+03	9	S	
10524	class com.atlassian.scheduler.core.util.JobRunnerRegistry:com.atlassian.cluster.monitoring.cluster-monitoring-plugin:runtime-information	2021-01-26 11:59:28.821+03	3	S	
10525	JiraPluginScheduler:LEXO_RANK_STATS_COLLECTOR_JOB	2021-01-26 11:59:29.048+03	1	S	
10526	com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateJob-job	2021-01-26 11:59:29.05+03	11	S	
10527	com.atlassian.crowd.manager.directory.monitor.DirectoryMonitorRefresherStarter-job	2021-01-26 11:59:29.09+03	5	S	
10528	com.atlassian.jira.service.JiraService:10000	2021-01-26 12:00:00.001+03	2	S	
10529	HistoryFlushJob	2021-01-26 12:00:16.282+03	7	S	
10530	SettingsReloaderJob	2021-01-26 12:00:16.282+03	11	S	
10531	RateLimitReaperJob	2021-01-26 12:00:16.303+03	1	S	
10302	data-provider-cleanup	2021-01-26 11:45:28.691+03	89	S	
10532	com.atlassian.jira.plugins.inform.batching.cron.BatchNotificationJobSchedulerImpl	2021-01-26 12:00:22.559+03	16	S	
10304	com.atlassian.jira.user.UserHistoryDatabaseCompactor	2021-01-26 11:45:28.839+03	6	S	
10305	ConfigurationLoggerJob	2021-01-26 11:45:28.815+03	31	S	
10306	applink-status-analytics-job	2021-01-26 11:45:28.852+03	69	S	
10308	BundledUpdateCheckJob-job	2021-01-26 11:45:29.011+03	15	S	
10313	com.atlassian.troubleshooting.jira.scheduler.CustomisationsCheckScheduler:job	2021-01-26 11:45:28.854+03	471	S	
10314	08c5cca2-de75-4365-b9ac-9f78b3dd29b5	2021-01-26 11:45:29.099+03	3429	S	
10315	com.atlassian.analytics.client.upload.RemoteFilterRead:job	2021-01-26 11:45:32.47+03	3156	S	
10316	2d290726-920a-4b76-a365-040620e714de	2021-01-26 11:45:29.178+03	20108	S	
10318	com.atlassian.jira.plugins.software.monitor.ApplicationPluginsEnablerJobRunner	2021-01-26 11:46:13.706+03	13	S	
10320	7fbb6b4a-6d92-44c8-b60f-214fbd66e065	2021-01-26 11:46:17.126+03	314	S	
10400	com.atlassian.jira.upgrade.UpgradeService	2021-01-26 11:46:21.891+03	285	S	
10402	JiraPluginScheduler:com.atlassian.troubleshooting.healthcheck.scheduler.HealthCheckSchedulerImpl:job	2021-01-26 11:46:22.504+03	1981	S	
10403	HistoryCleanupJob	2021-01-26 11:46:26.292+03	19	S	
10423	43c068e4-f5ae-4311-8c3a-efb30557bc2b	2021-01-26 11:48:28.714+03	45	S	
10487	data-provider-poll	2021-01-26 11:55:28.69+03	10	S	
10489	class com.atlassian.scheduler.core.util.JobRunnerRegistry:com.atlassian.cluster.monitoring.cluster-monitoring-plugin:system-information	2021-01-26 11:55:28.8+03	2	S	
\.


--
-- Data for Name: schemeissuesecurities; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.schemeissuesecurities (id, scheme, security, sec_type, sec_parameter) FROM stdin;
\.


--
-- Data for Name: schemeissuesecuritylevels; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.schemeissuesecuritylevels (id, name, description, scheme) FROM stdin;
\.


--
-- Data for Name: schemepermissions; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.schemepermissions (id, scheme, permission, perm_type, perm_parameter, permission_key) FROM stdin;
10025	0	32	projectrole	10002	MANAGE_WATCHERS
10026	0	34	projectrole	10002	EDIT_ALL_COMMENTS
10027	0	35	applicationRole		EDIT_OWN_COMMENTS
10028	0	36	projectrole	10002	DELETE_ALL_COMMENTS
10029	0	37	applicationRole		DELETE_OWN_COMMENTS
10030	0	38	projectrole	10002	DELETE_ALL_ATTACHMENTS
10031	0	39	applicationRole		DELETE_OWN_ATTACHMENTS
10033	0	29	applicationRole		VIEW_DEV_TOOLS
10101	\N	44	group	jira-administrators	\N
10200	0	45	applicationRole		VIEW_READONLY_WORKFLOW
10300	0	46	applicationRole		TRANSITION_ISSUES
10000	\N	0	group	jira-administrators	\N
10004	0	23	projectrole	10002	ADMINISTER_PROJECTS
10005	0	10	applicationRole		BROWSE_PROJECTS
10006	0	11	applicationRole		CREATE_ISSUES
10007	0	15	applicationRole		ADD_COMMENTS
10008	0	19	applicationRole		CREATE_ATTACHMENTS
10009	0	13	applicationRole		ASSIGN_ISSUES
10010	0	17	applicationRole		ASSIGNABLE_USER
10011	0	14	applicationRole		RESOLVE_ISSUES
10012	0	21	applicationRole		LINK_ISSUES
10013	0	12	applicationRole		EDIT_ISSUES
10014	0	16	projectrole	10002	DELETE_ISSUES
10015	0	18	applicationRole		CLOSE_ISSUES
10016	0	25	applicationRole		MOVE_ISSUES
10017	0	28	applicationRole		SCHEDULE_ISSUES
10018	0	30	projectrole	10002	MODIFY_REPORTER
10019	0	20	applicationRole		WORK_ON_ISSUES
10020	0	43	projectrole	10002	DELETE_ALL_WORKLOGS
10021	0	42	applicationRole		DELETE_OWN_WORKLOGS
10022	0	41	projectrole	10002	EDIT_ALL_WORKLOGS
10023	0	40	applicationRole		EDIT_OWN_WORKLOGS
10024	0	31	applicationRole		VIEW_VOTERS_AND_WATCHERS
10401	0	\N	projectrole	10002	MANAGE_SPRINTS_PERMISSION
10402	10000	\N	applicationRole	\N	BROWSE_PROJECTS
10403	10000	\N	applicationRole	\N	CREATE_ISSUES
10404	10000	\N	applicationRole	\N	EDIT_ISSUES
10405	10000	\N	applicationRole	\N	ASSIGN_ISSUES
10406	10000	\N	applicationRole	\N	RESOLVE_ISSUES
10407	10000	\N	applicationRole	\N	ADD_COMMENTS
10408	10000	\N	projectrole	10002	DELETE_ISSUES
10409	10000	\N	applicationRole	\N	ASSIGNABLE_USER
10410	10000	\N	applicationRole	\N	CLOSE_ISSUES
10411	10000	\N	applicationRole	\N	CREATE_ATTACHMENTS
10412	10000	\N	applicationRole	\N	WORK_ON_ISSUES
10413	10000	\N	applicationRole	\N	LINK_ISSUES
10414	10000	\N	projectrole	10002	ADMINISTER_PROJECTS
10415	10000	\N	applicationRole	\N	MOVE_ISSUES
10416	10000	\N	applicationRole	\N	SCHEDULE_ISSUES
10417	10000	\N	projectrole	10002	MODIFY_REPORTER
10418	10000	\N	applicationRole	\N	VIEW_VOTERS_AND_WATCHERS
10419	10000	\N	projectrole	10002	MANAGE_WATCHERS
10420	10000	\N	projectrole	10002	EDIT_ALL_COMMENTS
10421	10000	\N	applicationRole	\N	EDIT_OWN_COMMENTS
10422	10000	\N	projectrole	10002	DELETE_ALL_COMMENTS
10423	10000	\N	applicationRole	\N	DELETE_OWN_COMMENTS
10424	10000	\N	projectrole	10002	DELETE_ALL_ATTACHMENTS
10425	10000	\N	applicationRole	\N	DELETE_OWN_ATTACHMENTS
10426	10000	\N	applicationRole	\N	EDIT_OWN_WORKLOGS
10427	10000	\N	projectrole	10002	EDIT_ALL_WORKLOGS
10428	10000	\N	applicationRole	\N	DELETE_OWN_WORKLOGS
10429	10000	\N	projectrole	10002	DELETE_ALL_WORKLOGS
10430	10000	\N	applicationRole	\N	VIEW_READONLY_WORKFLOW
10431	10000	\N	applicationRole	\N	TRANSITION_ISSUES
10432	10000	\N	applicationRole	\N	VIEW_DEV_TOOLS
10433	10000	\N	applicationRole	\N	MANAGE_SPRINTS_PERMISSION
10434	10000	\N	applicationRole	\N	START_STOP_SPRINTS_PERMISSION
10435	10000	\N	applicationRole	\N	EDIT_SPRINT_NAME_AND_GOAL_PERMISSION
\.


--
-- Data for Name: searchrequest; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.searchrequest (id, filtername, authorname, description, username, groupname, projectid, reqcontent, fav_count, filtername_lower) FROM stdin;
10000	Filter for AOSP board	JIRAUSER10000	\N	JIRAUSER10000	\N	\N	project = AOSP ORDER BY Рейтинг ASC	0	filter for aosp board
\.


--
-- Data for Name: sequence_value_item; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.sequence_value_item (seq_name, seq_id) FROM stdin;
ListenerConfig	10300
ServiceConfig	10300
ChangeItem	10100
ProductLicense	10100
Group	10110
LicenseRoleGroup	10100
GlobalPermissionEntry	10200
LicenseRoleDefault	10100
ReindexComponent	10200
FieldLayoutItem	10200
CustomField	10200
FieldConfiguration	10300
FieldConfigScheme	10300
FieldConfigSchemeIssueType	10400
ConfigurationContext	10300
ManagedConfigurationItem	10200
IssueType	10100
OptionConfiguration	10400
IssueLinkType	10300
SchemePermissions	10500
EventType	10000
FieldLayout	10100
GadgetUserPreference	10100
NotificationScheme	10100
OAuthConsumer	10100
PortalPage	10100
PortletConfiguration	10100
Priority	10000
UpgradeTaskHistory	10100
UpgradeTaskHistoryAuditLog	10100
TaskIdSequence	10200
ColumnLayout	10100
ColumnLayoutItem	10100
Feature	10200
EntityPropertyIndexDocument	10100
Project	10100
PluginVersion	10300
UpgradeHistory	10200
ReindexRequest	10100
Avatar	10600
Notification	10300
UpgradeVersionHistory	10100
ProjectKey	10100
ProjectRoleActor	10200
GenericConfiguration	10200
FieldScreen	10100
FieldScreenTab	10200
FieldScreenLayoutItem	10300
FieldScreenScheme	10100
FieldScreenSchemeItem	10200
IssueTypeScreenScheme	10100
IssueTypeScreenSchemeEntity	10200
Resolution	10100
CustomFieldOption	10100
Status	10100
Workflow	10200
WorkflowScheme	10200
WorkflowSchemeEntity	10200
SearchRequest	10100
SharePermissions	10200
PermissionScheme	10100
EntityProperty	10100
ProjectRole	10200
Version	10100
OSWorkflowEntry	10100
OSCurrentStep	10100
Issue	10100
CustomFieldValue	10100
Action	10100
IssueLink	10100
ChangeGroup	10100
ClusteredJob	10500
UserAttribute	10300
UserHistoryItem	10200
OSPropertyEntry	10700
ApplicationUser	10200
User	10200
Membership	10200
RunDetails	10600
\.


--
-- Data for Name: serviceconfig; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.serviceconfig (id, delaytime, clazz, servicename, cron_expression) FROM stdin;
10000	60000	com.atlassian.jira.service.services.mail.MailQueueService	Mail Queue Service	0 * * * * ?
10001	43200000	com.atlassian.jira.service.services.export.ExportService	Backup Service	0 0 0/12 * * ?
10002	86400000	com.atlassian.jira.service.services.auditing.AuditLogCleaningService	Audit log cleaning service	0 0 0 * * ?
10200	43200000	com.atlassian.jira.service.services.export.ExportService	Служба Резервного Копирования	0 25 9/12 * * ?
\.


--
-- Data for Name: sharepermissions; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.sharepermissions (id, entityid, entitytype, sharetype, param1, param2, rights) FROM stdin;
10000	10000	PortalPage	global	\N	\N	1
10100	10000	SearchRequest	project	10000	\N	1
\.


--
-- Data for Name: tempattachmentsmonitor; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.tempattachmentsmonitor (temporary_attachment_id, form_token, file_name, content_type, file_size, created_time) FROM stdin;
\.


--
-- Data for Name: trackback_ping; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.trackback_ping (id, issue, url, title, blogname, excerpt, created) FROM stdin;
\.


--
-- Data for Name: trustedapp; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.trustedapp (id, application_id, name, public_key, ip_match, url_match, timeout, created, created_by, updated, updated_by) FROM stdin;
\.


--
-- Data for Name: upgradehistory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.upgradehistory (id, upgradeclass, targetbuild, status, downgradetaskrequired) FROM stdin;
10000	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70100	70100	complete	Y
10100	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70101	70101	complete	N
10101	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build70102	70102	complete	N
10102	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build71001	71001	complete	N
10103	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build72001	72001	complete	N
10104	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build72002	72002	complete	N
10105	com.atlassian.jira.upgrade.tasks.UpgradeTask_Build73002	73002	complete	N
\.


--
-- Data for Name: upgradetaskhistory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.upgradetaskhistory (id, upgrade_task_factory_key, build_number, status, upgrade_type) FROM stdin;
10032	host	800007	COMPLETED	SERVER
10033	host	800009	COMPLETED	SERVER
10034	host	801000	COMPLETED	SERVER
10035	host	804000	COMPLETED	SERVER
10036	host	810001	COMPLETED	SERVER
10000	com.atlassian.audit.atlassian-audit-plugin	1	COMPLETED	SERVER
10001	com.atlassian.audit.atlassian-audit-plugin	2	COMPLETED	SERVER
10002	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin	1	COMPLETED	SERVER
10003	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin	2	COMPLETED	SERVER
10004	com.atlassian.jira.plugins.jira-development-integration-plugin	1	COMPLETED	SERVER
10005	com.atlassian.jira.plugins.jira-development-integration-plugin	2	COMPLETED	SERVER
10006	com.atlassian.jira.plugins.jira-development-integration-plugin	3	COMPLETED	SERVER
10007	com.atlassian.jira.plugins.inform.batching-plugin	1	COMPLETED	SERVER
10008	com.atlassian.jira.plugins.inform.batching-plugin	2	COMPLETED	SERVER
10037	host	811001	COMPLETED	SERVER
10038	host	812001	COMPLETED	SERVER
10015	host	73010	COMPLETED	SERVER
10016	host	73011	COMPLETED	SERVER
10017	host	74002	COMPLETED	SERVER
10018	host	75002	COMPLETED	SERVER
10019	host	75003	COMPLETED	SERVER
10020	host	75004	COMPLETED	SERVER
10021	host	75005	COMPLETED	SERVER
10022	host	76001	COMPLETED	SERVER
10023	host	77001	COMPLETED	SERVER
10024	host	710001	COMPLETED	SERVER
10025	host	711001	COMPLETED	SERVER
10026	host	712001	COMPLETED	SERVER
10027	host	800000	COMPLETED	SERVER
10028	host	800003	COMPLETED	SERVER
10029	host	800004	COMPLETED	SERVER
10030	host	800005	COMPLETED	SERVER
10031	host	800006	COMPLETED	SERVER
\.


--
-- Data for Name: upgradetaskhistoryauditlog; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.upgradetaskhistoryauditlog (id, upgrade_task_factory_key, build_number, status, upgrade_type, timeperformed, action) FROM stdin;
10000	com.atlassian.audit.atlassian-audit-plugin	1	COMPLETED	SERVER	2021-01-26 00:24:59.229+03	upgrade
10001	com.atlassian.audit.atlassian-audit-plugin	2	COMPLETED	SERVER	2021-01-26 00:24:59.246+03	upgrade
10002	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin	1	COMPLETED	SERVER	2021-01-26 00:25:06.561+03	upgrade
10003	com.atlassian.jira.plugins.jira-bitbucket-connector-plugin	2	COMPLETED	SERVER	2021-01-26 00:25:06.776+03	upgrade
10004	com.atlassian.jira.plugins.jira-development-integration-plugin	1	COMPLETED	SERVER	2021-01-26 00:25:07.235+03	upgrade
10005	com.atlassian.jira.plugins.jira-development-integration-plugin	2	COMPLETED	SERVER	2021-01-26 00:25:07.25+03	upgrade
10006	com.atlassian.jira.plugins.jira-development-integration-plugin	3	COMPLETED	SERVER	2021-01-26 00:25:07.615+03	upgrade
10007	com.atlassian.jira.plugins.inform.batching-plugin	1	COMPLETED	SERVER	2021-01-26 00:25:08.128+03	upgrade
10008	com.atlassian.jira.plugins.inform.batching-plugin	2	COMPLETED	SERVER	2021-01-26 00:25:08.145+03	upgrade
10009	host	70101	COMPLETED	SERVER	2021-01-26 00:25:10.806+03	upgrade
10010	host	70102	COMPLETED	SERVER	2021-01-26 00:25:10.822+03	upgrade
10011	host	71001	COMPLETED	SERVER	2021-01-26 00:25:10.836+03	upgrade
10012	host	72001	COMPLETED	SERVER	2021-01-26 00:25:10.845+03	upgrade
10013	host	72002	COMPLETED	SERVER	2021-01-26 00:25:10.881+03	upgrade
10014	host	73002	COMPLETED	SERVER	2021-01-26 00:25:10.887+03	upgrade
10015	host	73010	COMPLETED	SERVER	2021-01-26 00:25:10.917+03	upgrade
10016	host	73011	COMPLETED	SERVER	2021-01-26 00:25:10.922+03	upgrade
10017	host	74002	COMPLETED	SERVER	2021-01-26 00:25:10.935+03	upgrade
10018	host	75002	COMPLETED	SERVER	2021-01-26 00:25:10.949+03	upgrade
10019	host	75003	COMPLETED	SERVER	2021-01-26 00:25:10.957+03	upgrade
10020	host	75004	COMPLETED	SERVER	2021-01-26 00:25:10.964+03	upgrade
10021	host	75005	COMPLETED	SERVER	2021-01-26 00:25:10.972+03	upgrade
10022	host	76001	COMPLETED	SERVER	2021-01-26 00:25:11.013+03	upgrade
10023	host	77001	COMPLETED	SERVER	2021-01-26 00:25:11.044+03	upgrade
10024	host	710001	COMPLETED	SERVER	2021-01-26 00:25:11.094+03	upgrade
10025	host	711001	COMPLETED	SERVER	2021-01-26 00:25:11.124+03	upgrade
10026	host	712001	COMPLETED	SERVER	2021-01-26 00:25:11.14+03	upgrade
10027	host	800000	COMPLETED	SERVER	2021-01-26 00:25:11.146+03	upgrade
10028	host	800003	COMPLETED	SERVER	2021-01-26 00:25:11.24+03	upgrade
10029	host	800004	COMPLETED	SERVER	2021-01-26 00:25:11.298+03	upgrade
10030	host	800005	COMPLETED	SERVER	2021-01-26 00:25:11.369+03	upgrade
10031	host	800006	COMPLETED	SERVER	2021-01-26 00:25:11.405+03	upgrade
10032	host	800007	COMPLETED	SERVER	2021-01-26 00:25:11.443+03	upgrade
10033	host	800009	COMPLETED	SERVER	2021-01-26 00:25:11.49+03	upgrade
10034	host	801000	COMPLETED	SERVER	2021-01-26 00:25:11.575+03	upgrade
10035	host	804000	COMPLETED	SERVER	2021-01-26 00:25:11.589+03	upgrade
10036	host	810001	COMPLETED	SERVER	2021-01-26 00:25:11.597+03	upgrade
10037	host	811001	COMPLETED	SERVER	2021-01-26 00:25:11.609+03	upgrade
10038	host	812001	COMPLETED	SERVER	2021-01-26 00:25:11.623+03	upgrade
\.


--
-- Data for Name: upgradeversionhistory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.upgradeversionhistory (id, timeperformed, targetbuild, targetversion) FROM stdin;
10000	2021-01-26 00:25:11.633+03	812001	8.13.3
\.


--
-- Data for Name: userassociation; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userassociation (source_name, sink_node_id, sink_node_entity, association_type, sequence, created) FROM stdin;
\.


--
-- Data for Name: userbase; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userbase (id, username, password_hash) FROM stdin;
\.


--
-- Data for Name: userhistoryitem; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userhistoryitem (id, entitytype, entityid, username, lastviewed, data) FROM stdin;
10001	Project	10000	JIRAUSER10000	1611610407581	\N
10000	RapidView	1	JIRAUSER10000	1611610415366	AOSP board
10100	Dashboard	10000	JIRAUSER10000	1611650866713	\N
10102	Project	10000	JIRAUSER10100	1611650965033	\N
10101	RapidView	1	JIRAUSER10100	1611650967909	AOSP board
10103	Dashboard	10000	JIRAUSER10100	1611650974709	\N
\.


--
-- Data for Name: userpickerfilter; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userpickerfilter (id, customfield, customfieldconfig, enabled) FROM stdin;
\.


--
-- Data for Name: userpickerfiltergroup; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userpickerfiltergroup (id, userpickerfilter, groupname) FROM stdin;
\.


--
-- Data for Name: userpickerfilterrole; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.userpickerfilterrole (id, userpickerfilter, projectroleid) FROM stdin;
\.


--
-- Data for Name: versioncontrol; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.versioncontrol (id, vcsname, vcsdescription, vcstype) FROM stdin;
\.


--
-- Data for Name: votehistory; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.votehistory (id, issueid, votes, "timestamp") FROM stdin;
\.


--
-- Data for Name: workflowscheme; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.workflowscheme (id, name, description) FROM stdin;
10000	classic	classic
10100	AOSP: Software Simplified Workflow Scheme	Generated by JIRA Software version 8.13.3. This workflow scheme is managed internally by Jira Software. Do not manually modify this workflow scheme.
\.


--
-- Data for Name: workflowschemeentity; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.workflowschemeentity (id, scheme, workflow, issuetype) FROM stdin;
10000	10000	classic default workflow	0
10100	10100	Software Simplified Workflow for Project AOSP	0
\.


--
-- Data for Name: worklog; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.worklog (id, issueid, author, grouplevel, rolelevel, worklogbody, created, updateauthor, updated, startdate, timeworked) FROM stdin;
\.


--
-- Data for Name: worklog_version; Type: TABLE DATA; Schema: public; Owner: jira
--

COPY public.worklog_version (worklog_id, parent_issue_id, update_time, index_version, deleted) FROM stdin;
\.


--
-- Name: AO_0A5972_NOTIFICATION_SETTING AO_0A5972_NOTIFICATION_SETTING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_0A5972_NOTIFICATION_SETTING"
    ADD CONSTRAINT "AO_0A5972_NOTIFICATION_SETTING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_0A5972_PUSH_REGISTRATION AO_0A5972_PUSH_REGISTRATION_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_0A5972_PUSH_REGISTRATION"
    ADD CONSTRAINT "AO_0A5972_PUSH_REGISTRATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_0AC321_RECOMMENDATION_AO AO_0AC321_RECOMMENDATION_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_0AC321_RECOMMENDATION_AO"
    ADD CONSTRAINT "AO_0AC321_RECOMMENDATION_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21D670_WHITELIST_RULES AO_21D670_WHITELIST_RULES_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21D670_WHITELIST_RULES"
    ADD CONSTRAINT "AO_21D670_WHITELIST_RULES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_MESSAGE_AO AO_21F425_MESSAGE_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_AO"
    ADD CONSTRAINT "AO_21F425_MESSAGE_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_MESSAGE_MAPPING_AO AO_21F425_MESSAGE_MAPPING_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_MAPPING_AO"
    ADD CONSTRAINT "AO_21F425_MESSAGE_MAPPING_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_USER_PROPERTY_AO AO_21F425_USER_PROPERTY_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_21F425_USER_PROPERTY_AO"
    ADD CONSTRAINT "AO_21F425_USER_PROPERTY_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK AO_38321B_CUSTOM_CONTENT_LINK_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_38321B_CUSTOM_CONTENT_LINK"
    ADD CONSTRAINT "AO_38321B_CUSTOM_CONTENT_LINK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_3B1893_LOOP_DETECTION AO_3B1893_LOOP_DETECTION_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_3B1893_LOOP_DETECTION"
    ADD CONSTRAINT "AO_3B1893_LOOP_DETECTION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS AO_4789DD_HEALTH_CHECK_STATUS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_STATUS"
    ADD CONSTRAINT "AO_4789DD_HEALTH_CHECK_STATUS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_PROPERTIES AO_4789DD_PROPERTIES_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_PROPERTIES"
    ADD CONSTRAINT "AO_4789DD_PROPERTIES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_READ_NOTIFICATIONS AO_4789DD_READ_NOTIFICATIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_READ_NOTIFICATIONS"
    ADD CONSTRAINT "AO_4789DD_READ_NOTIFICATIONS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_TASK_MONITOR AO_4789DD_TASK_MONITOR_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR"
    ADD CONSTRAINT "AO_4789DD_TASK_MONITOR_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4AEACD_WEBHOOK_DAO AO_4AEACD_WEBHOOK_DAO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4AEACD_WEBHOOK_DAO"
    ADD CONSTRAINT "AO_4AEACD_WEBHOOK_DAO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_550953_SHORTCUT AO_550953_SHORTCUT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_550953_SHORTCUT"
    ADD CONSTRAINT "AO_550953_SHORTCUT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY AO_563AEE_ACTIVITY_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT "AO_563AEE_ACTIVITY_ENTITY_pkey" PRIMARY KEY ("ACTIVITY_ID");


--
-- Name: AO_563AEE_ACTOR_ENTITY AO_563AEE_ACTOR_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTOR_ENTITY"
    ADD CONSTRAINT "AO_563AEE_ACTOR_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY AO_563AEE_MEDIA_LINK_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_MEDIA_LINK_ENTITY"
    ADD CONSTRAINT "AO_563AEE_MEDIA_LINK_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_OBJECT_ENTITY AO_563AEE_OBJECT_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY"
    ADD CONSTRAINT "AO_563AEE_OBJECT_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_TARGET_ENTITY AO_563AEE_TARGET_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY"
    ADD CONSTRAINT "AO_563AEE_TARGET_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_575BF5_DEV_SUMMARY AO_575BF5_DEV_SUMMARY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_DEV_SUMMARY"
    ADD CONSTRAINT "AO_575BF5_DEV_SUMMARY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_575BF5_PROCESSED_COMMITS AO_575BF5_PROCESSED_COMMITS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROCESSED_COMMITS"
    ADD CONSTRAINT "AO_575BF5_PROCESSED_COMMITS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_575BF5_PROVIDER_ISSUE AO_575BF5_PROVIDER_ISSUE_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROVIDER_ISSUE"
    ADD CONSTRAINT "AO_575BF5_PROVIDER_ISSUE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_575BF5_PROVIDER_SEQ_NO AO_575BF5_PROVIDER_SEQ_NO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_575BF5_PROVIDER_SEQ_NO"
    ADD CONSTRAINT "AO_575BF5_PROVIDER_SEQ_NO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_AUDITENTRY AO_60DB71_AUDITENTRY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_AUDITENTRY"
    ADD CONSTRAINT "AO_60DB71_AUDITENTRY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_BOARDADMINS AO_60DB71_BOARDADMINS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_BOARDADMINS"
    ADD CONSTRAINT "AO_60DB71_BOARDADMINS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_CARDCOLOR AO_60DB71_CARDCOLOR_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDCOLOR"
    ADD CONSTRAINT "AO_60DB71_CARDCOLOR_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_CARDLAYOUT AO_60DB71_CARDLAYOUT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDLAYOUT"
    ADD CONSTRAINT "AO_60DB71_CARDLAYOUT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_COLUMNSTATUS AO_60DB71_COLUMNSTATUS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMNSTATUS"
    ADD CONSTRAINT "AO_60DB71_COLUMNSTATUS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_COLUMN AO_60DB71_COLUMN_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMN"
    ADD CONSTRAINT "AO_60DB71_COLUMN_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_DETAILVIEWFIELD AO_60DB71_DETAILVIEWFIELD_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_DETAILVIEWFIELD"
    ADD CONSTRAINT "AO_60DB71_DETAILVIEWFIELD_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_ESTIMATESTATISTIC AO_60DB71_ESTIMATESTATISTIC_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ESTIMATESTATISTIC"
    ADD CONSTRAINT "AO_60DB71_ESTIMATESTATISTIC_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_ISSUERANKINGLOG AO_60DB71_ISSUERANKINGLOG_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ISSUERANKINGLOG"
    ADD CONSTRAINT "AO_60DB71_ISSUERANKINGLOG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_ISSUERANKING AO_60DB71_ISSUERANKING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ISSUERANKING"
    ADD CONSTRAINT "AO_60DB71_ISSUERANKING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_LEXORANKBALANCER AO_60DB71_LEXORANKBALANCER_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_LEXORANKBALANCER"
    ADD CONSTRAINT "AO_60DB71_LEXORANKBALANCER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_LEXORANK AO_60DB71_LEXORANK_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_LEXORANK"
    ADD CONSTRAINT "AO_60DB71_LEXORANK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_NONWORKINGDAY AO_60DB71_NONWORKINGDAY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_NONWORKINGDAY"
    ADD CONSTRAINT "AO_60DB71_NONWORKINGDAY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_QUICKFILTER AO_60DB71_QUICKFILTER_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_QUICKFILTER"
    ADD CONSTRAINT "AO_60DB71_QUICKFILTER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_RANKABLEOBJECT AO_60DB71_RANKABLEOBJECT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_RANKABLEOBJECT"
    ADD CONSTRAINT "AO_60DB71_RANKABLEOBJECT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_RAPIDVIEW AO_60DB71_RAPIDVIEW_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_RAPIDVIEW"
    ADD CONSTRAINT "AO_60DB71_RAPIDVIEW_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_SPRINT AO_60DB71_SPRINT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SPRINT"
    ADD CONSTRAINT "AO_60DB71_SPRINT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_STATSFIELD AO_60DB71_STATSFIELD_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_STATSFIELD"
    ADD CONSTRAINT "AO_60DB71_STATSFIELD_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_SUBQUERY AO_60DB71_SUBQUERY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SUBQUERY"
    ADD CONSTRAINT "AO_60DB71_SUBQUERY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_SWIMLANE AO_60DB71_SWIMLANE_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SWIMLANE"
    ADD CONSTRAINT "AO_60DB71_SWIMLANE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_TRACKINGSTATISTIC AO_60DB71_TRACKINGSTATISTIC_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_TRACKINGSTATISTIC"
    ADD CONSTRAINT "AO_60DB71_TRACKINGSTATISTIC_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_VERSION AO_60DB71_VERSION_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_VERSION"
    ADD CONSTRAINT "AO_60DB71_VERSION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_60DB71_WORKINGDAYS AO_60DB71_WORKINGDAYS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_WORKINGDAYS"
    ADD CONSTRAINT "AO_60DB71_WORKINGDAYS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_723324_CLIENT_CONFIG AO_723324_CLIENT_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_723324_CLIENT_CONFIG"
    ADD CONSTRAINT "AO_723324_CLIENT_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_723324_CLIENT_TOKEN AO_723324_CLIENT_TOKEN_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_723324_CLIENT_TOKEN"
    ADD CONSTRAINT "AO_723324_CLIENT_TOKEN_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_733371_EVENT_PARAMETER AO_733371_EVENT_PARAMETER_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_PARAMETER"
    ADD CONSTRAINT "AO_733371_EVENT_PARAMETER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_733371_EVENT_RECIPIENT AO_733371_EVENT_RECIPIENT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_RECIPIENT"
    ADD CONSTRAINT "AO_733371_EVENT_RECIPIENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_733371_EVENT AO_733371_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT"
    ADD CONSTRAINT "AO_733371_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_97EDAB_USERINVITATION AO_97EDAB_USERINVITATION_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_97EDAB_USERINVITATION"
    ADD CONSTRAINT "AO_97EDAB_USERINVITATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO AO_A0B856_WEB_HOOK_LISTENER_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_A0B856_WEB_HOOK_LISTENER_AO"
    ADD CONSTRAINT "AO_A0B856_WEB_HOOK_LISTENER_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_AC3877_RL_USER_COUNTER AO_AC3877_RL_USER_COUNTER_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_AC3877_RL_USER_COUNTER"
    ADD CONSTRAINT "AO_AC3877_RL_USER_COUNTER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_AC3877_SETTINGS_VERSION AO_AC3877_SETTINGS_VERSION_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_AC3877_SETTINGS_VERSION"
    ADD CONSTRAINT "AO_AC3877_SETTINGS_VERSION_pkey" PRIMARY KEY ("TYPE");


--
-- Name: AO_AC3877_SYSTEM_RL_SETTINGS AO_AC3877_SYSTEM_RL_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_AC3877_SYSTEM_RL_SETTINGS"
    ADD CONSTRAINT "AO_AC3877_SYSTEM_RL_SETTINGS_pkey" PRIMARY KEY ("NAME");


--
-- Name: AO_AC3877_USER_RL_SETTINGS AO_AC3877_USER_RL_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_AC3877_USER_RL_SETTINGS"
    ADD CONSTRAINT "AO_AC3877_USER_RL_SETTINGS_pkey" PRIMARY KEY ("USER_ID");


--
-- Name: AO_B9A0F0_APPLIED_TEMPLATE AO_B9A0F0_APPLIED_TEMPLATE_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_B9A0F0_APPLIED_TEMPLATE"
    ADD CONSTRAINT "AO_B9A0F0_APPLIED_TEMPLATE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_C16815_ALERT_AO AO_C16815_ALERT_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_C16815_ALERT_AO"
    ADD CONSTRAINT "AO_C16815_ALERT_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_C77861_AUDIT_ENTITY AO_C77861_AUDIT_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ENTITY"
    ADD CONSTRAINT "AO_C77861_AUDIT_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_CFF990_AOTRANSITION_FAILURE AO_CFF990_AOTRANSITION_FAILURE_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_CFF990_AOTRANSITION_FAILURE"
    ADD CONSTRAINT "AO_CFF990_AOTRANSITION_FAILURE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_BRANCH_HEAD_MAPPING AO_E8B6CC_BRANCH_HEAD_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_BRANCH_HEAD_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_BRANCH_HEAD_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_BRANCH AO_E8B6CC_BRANCH_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_BRANCH"
    ADD CONSTRAINT "AO_E8B6CC_BRANCH_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_CHANGESET_MAPPING AO_E8B6CC_CHANGESET_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_CHANGESET_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_CHANGESET_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_COMMIT AO_E8B6CC_COMMIT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_COMMIT"
    ADD CONSTRAINT "AO_E8B6CC_COMMIT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_GIT_HUB_EVENT AO_E8B6CC_GIT_HUB_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_GIT_HUB_EVENT"
    ADD CONSTRAINT "AO_E8B6CC_GIT_HUB_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ISSUE_MAPPING_V2 AO_E8B6CC_ISSUE_MAPPING_V2_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_MAPPING_V2"
    ADD CONSTRAINT "AO_E8B6CC_ISSUE_MAPPING_V2_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ISSUE_MAPPING AO_E8B6CC_ISSUE_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_ISSUE_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH AO_E8B6CC_ISSUE_TO_BRANCH_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_TO_BRANCH"
    ADD CONSTRAINT "AO_E8B6CC_ISSUE_TO_BRANCH_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ISSUE_TO_CHANGESET AO_E8B6CC_ISSUE_TO_CHANGESET_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_TO_CHANGESET"
    ADD CONSTRAINT "AO_E8B6CC_ISSUE_TO_CHANGESET_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM AO_E8B6CC_MESSAGE_QUEUE_ITEM_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_QUEUE_ITEM"
    ADD CONSTRAINT "AO_E8B6CC_MESSAGE_QUEUE_ITEM_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_MESSAGE_TAG AO_E8B6CC_MESSAGE_TAG_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_TAG"
    ADD CONSTRAINT "AO_E8B6CC_MESSAGE_TAG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_MESSAGE AO_E8B6CC_MESSAGE_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE"
    ADD CONSTRAINT "AO_E8B6CC_MESSAGE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ORGANIZATION_MAPPING AO_E8B6CC_ORGANIZATION_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ORGANIZATION_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_ORGANIZATION_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_ORG_TO_PROJECT AO_E8B6CC_ORG_TO_PROJECT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ORG_TO_PROJECT"
    ADD CONSTRAINT "AO_E8B6CC_ORG_TO_PROJECT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PROJECT_MAPPING_V2 AO_E8B6CC_PROJECT_MAPPING_V2_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PROJECT_MAPPING_V2"
    ADD CONSTRAINT "AO_E8B6CC_PROJECT_MAPPING_V2_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PROJECT_MAPPING AO_E8B6CC_PROJECT_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PROJECT_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_PROJECT_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PR_ISSUE_KEY AO_E8B6CC_PR_ISSUE_KEY_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_ISSUE_KEY"
    ADD CONSTRAINT "AO_E8B6CC_PR_ISSUE_KEY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PR_PARTICIPANT AO_E8B6CC_PR_PARTICIPANT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_PARTICIPANT"
    ADD CONSTRAINT "AO_E8B6CC_PR_PARTICIPANT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PR_TO_COMMIT AO_E8B6CC_PR_TO_COMMIT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_TO_COMMIT"
    ADD CONSTRAINT "AO_E8B6CC_PR_TO_COMMIT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_PULL_REQUEST AO_E8B6CC_PULL_REQUEST_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PULL_REQUEST"
    ADD CONSTRAINT "AO_E8B6CC_PULL_REQUEST_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_REPOSITORY_MAPPING AO_E8B6CC_REPOSITORY_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPOSITORY_MAPPING"
    ADD CONSTRAINT "AO_E8B6CC_REPOSITORY_MAPPING_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_REPO_TO_CHANGESET AO_E8B6CC_REPO_TO_CHANGESET_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPO_TO_CHANGESET"
    ADD CONSTRAINT "AO_E8B6CC_REPO_TO_CHANGESET_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_REPO_TO_PROJECT AO_E8B6CC_REPO_TO_PROJECT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPO_TO_PROJECT"
    ADD CONSTRAINT "AO_E8B6CC_REPO_TO_PROJECT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_SYNC_AUDIT_LOG AO_E8B6CC_SYNC_AUDIT_LOG_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_SYNC_AUDIT_LOG"
    ADD CONSTRAINT "AO_E8B6CC_SYNC_AUDIT_LOG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_E8B6CC_SYNC_EVENT AO_E8B6CC_SYNC_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_SYNC_EVENT"
    ADD CONSTRAINT "AO_E8B6CC_SYNC_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_ED669C_SEEN_ASSERTIONS AO_ED669C_SEEN_ASSERTIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS"
    ADD CONSTRAINT "AO_ED669C_SEEN_ASSERTIONS_pkey" PRIMARY KEY ("ID");


--
-- Name: app_user pk_app_user; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT pk_app_user PRIMARY KEY (id);


--
-- Name: audit_changed_value pk_audit_changed_value; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.audit_changed_value
    ADD CONSTRAINT pk_audit_changed_value PRIMARY KEY (id);


--
-- Name: audit_item pk_audit_item; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.audit_item
    ADD CONSTRAINT pk_audit_item PRIMARY KEY (id);


--
-- Name: audit_log pk_audit_log; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT pk_audit_log PRIMARY KEY (id);


--
-- Name: avatar pk_avatar; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.avatar
    ADD CONSTRAINT pk_avatar PRIMARY KEY (id);


--
-- Name: board pk_board; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.board
    ADD CONSTRAINT pk_board PRIMARY KEY (id);


--
-- Name: boardproject pk_boardproject; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.boardproject
    ADD CONSTRAINT pk_boardproject PRIMARY KEY (board_id, project_id);


--
-- Name: changegroup pk_changegroup; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.changegroup
    ADD CONSTRAINT pk_changegroup PRIMARY KEY (id);


--
-- Name: changeitem pk_changeitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.changeitem
    ADD CONSTRAINT pk_changeitem PRIMARY KEY (id);


--
-- Name: clusteredjob pk_clusteredjob; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clusteredjob
    ADD CONSTRAINT pk_clusteredjob PRIMARY KEY (id);


--
-- Name: clusterlockstatus pk_clusterlockstatus; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clusterlockstatus
    ADD CONSTRAINT pk_clusterlockstatus PRIMARY KEY (id);


--
-- Name: clustermessage pk_clustermessage; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clustermessage
    ADD CONSTRAINT pk_clustermessage PRIMARY KEY (id);


--
-- Name: clusternode pk_clusternode; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clusternode
    ADD CONSTRAINT pk_clusternode PRIMARY KEY (node_id);


--
-- Name: clusternodeheartbeat pk_clusternodeheartbeat; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clusternodeheartbeat
    ADD CONSTRAINT pk_clusternodeheartbeat PRIMARY KEY (node_id);


--
-- Name: clusterupgradestate pk_clusterupgradestate; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.clusterupgradestate
    ADD CONSTRAINT pk_clusterupgradestate PRIMARY KEY (id);


--
-- Name: columnlayout pk_columnlayout; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.columnlayout
    ADD CONSTRAINT pk_columnlayout PRIMARY KEY (id);


--
-- Name: columnlayoutitem pk_columnlayoutitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.columnlayoutitem
    ADD CONSTRAINT pk_columnlayoutitem PRIMARY KEY (id);


--
-- Name: comment_version pk_comment_version; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.comment_version
    ADD CONSTRAINT pk_comment_version PRIMARY KEY (comment_id);


--
-- Name: component pk_component; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT pk_component PRIMARY KEY (id);


--
-- Name: configurationcontext pk_configurationcontext; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.configurationcontext
    ADD CONSTRAINT pk_configurationcontext PRIMARY KEY (id);


--
-- Name: customfield pk_customfield; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.customfield
    ADD CONSTRAINT pk_customfield PRIMARY KEY (id);


--
-- Name: customfieldoption pk_customfieldoption; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.customfieldoption
    ADD CONSTRAINT pk_customfieldoption PRIMARY KEY (id);


--
-- Name: customfieldvalue pk_customfieldvalue; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.customfieldvalue
    ADD CONSTRAINT pk_customfieldvalue PRIMARY KEY (id);


--
-- Name: cwd_application pk_cwd_application; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_application
    ADD CONSTRAINT pk_cwd_application PRIMARY KEY (id);


--
-- Name: cwd_application_address pk_cwd_application_address; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_application_address
    ADD CONSTRAINT pk_cwd_application_address PRIMARY KEY (application_id, remote_address);


--
-- Name: cwd_directory pk_cwd_directory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_directory
    ADD CONSTRAINT pk_cwd_directory PRIMARY KEY (id);


--
-- Name: cwd_directory_attribute pk_cwd_directory_attribute; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_directory_attribute
    ADD CONSTRAINT pk_cwd_directory_attribute PRIMARY KEY (directory_id, attribute_name);


--
-- Name: cwd_directory_operation pk_cwd_directory_operation; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_directory_operation
    ADD CONSTRAINT pk_cwd_directory_operation PRIMARY KEY (directory_id, operation_type);


--
-- Name: cwd_group pk_cwd_group; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_group
    ADD CONSTRAINT pk_cwd_group PRIMARY KEY (id);


--
-- Name: cwd_group_attributes pk_cwd_group_attributes; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_group_attributes
    ADD CONSTRAINT pk_cwd_group_attributes PRIMARY KEY (id);


--
-- Name: cwd_membership pk_cwd_membership; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT pk_cwd_membership PRIMARY KEY (id);


--
-- Name: cwd_synchronisation_status pk_cwd_synchronisation_status; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_synchronisation_status
    ADD CONSTRAINT pk_cwd_synchronisation_status PRIMARY KEY (id);


--
-- Name: cwd_synchronisation_token pk_cwd_synchronisation_token; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_synchronisation_token
    ADD CONSTRAINT pk_cwd_synchronisation_token PRIMARY KEY (directory_id);


--
-- Name: cwd_user pk_cwd_user; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_user
    ADD CONSTRAINT pk_cwd_user PRIMARY KEY (id);


--
-- Name: cwd_user_attributes pk_cwd_user_attributes; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.cwd_user_attributes
    ADD CONSTRAINT pk_cwd_user_attributes PRIMARY KEY (id);


--
-- Name: deadletter pk_deadletter; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.deadletter
    ADD CONSTRAINT pk_deadletter PRIMARY KEY (id);


--
-- Name: draftworkflowscheme pk_draftworkflowscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.draftworkflowscheme
    ADD CONSTRAINT pk_draftworkflowscheme PRIMARY KEY (id);


--
-- Name: draftworkflowschemeentity pk_draftworkflowschemeentity; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.draftworkflowschemeentity
    ADD CONSTRAINT pk_draftworkflowschemeentity PRIMARY KEY (id);


--
-- Name: entity_property pk_entity_property; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.entity_property
    ADD CONSTRAINT pk_entity_property PRIMARY KEY (id);


--
-- Name: entity_property_index_document pk_entity_property_index_docum; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.entity_property_index_document
    ADD CONSTRAINT pk_entity_property_index_docum PRIMARY KEY (id);


--
-- Name: entity_translation pk_entity_translation; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.entity_translation
    ADD CONSTRAINT pk_entity_translation PRIMARY KEY (id);


--
-- Name: external_entities pk_external_entities; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.external_entities
    ADD CONSTRAINT pk_external_entities PRIMARY KEY (id);


--
-- Name: externalgadget pk_externalgadget; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.externalgadget
    ADD CONSTRAINT pk_externalgadget PRIMARY KEY (id);


--
-- Name: favouriteassociations pk_favouriteassociations; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.favouriteassociations
    ADD CONSTRAINT pk_favouriteassociations PRIMARY KEY (id);


--
-- Name: feature pk_feature; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT pk_feature PRIMARY KEY (id);


--
-- Name: fieldconfigscheme pk_fieldconfigscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldconfigscheme
    ADD CONSTRAINT pk_fieldconfigscheme PRIMARY KEY (id);


--
-- Name: fieldconfigschemeissuetype pk_fieldconfigschemeissuetype; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldconfigschemeissuetype
    ADD CONSTRAINT pk_fieldconfigschemeissuetype PRIMARY KEY (id);


--
-- Name: fieldconfiguration pk_fieldconfiguration; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldconfiguration
    ADD CONSTRAINT pk_fieldconfiguration PRIMARY KEY (id);


--
-- Name: fieldlayout pk_fieldlayout; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldlayout
    ADD CONSTRAINT pk_fieldlayout PRIMARY KEY (id);


--
-- Name: fieldlayoutitem pk_fieldlayoutitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldlayoutitem
    ADD CONSTRAINT pk_fieldlayoutitem PRIMARY KEY (id);


--
-- Name: fieldlayoutscheme pk_fieldlayoutscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldlayoutscheme
    ADD CONSTRAINT pk_fieldlayoutscheme PRIMARY KEY (id);


--
-- Name: fieldlayoutschemeassociation pk_fieldlayoutschemeassociatio; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldlayoutschemeassociation
    ADD CONSTRAINT pk_fieldlayoutschemeassociatio PRIMARY KEY (id);


--
-- Name: fieldlayoutschemeentity pk_fieldlayoutschemeentity; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldlayoutschemeentity
    ADD CONSTRAINT pk_fieldlayoutschemeentity PRIMARY KEY (id);


--
-- Name: fieldscreen pk_fieldscreen; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldscreen
    ADD CONSTRAINT pk_fieldscreen PRIMARY KEY (id);


--
-- Name: fieldscreenlayoutitem pk_fieldscreenlayoutitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldscreenlayoutitem
    ADD CONSTRAINT pk_fieldscreenlayoutitem PRIMARY KEY (id);


--
-- Name: fieldscreenscheme pk_fieldscreenscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldscreenscheme
    ADD CONSTRAINT pk_fieldscreenscheme PRIMARY KEY (id);


--
-- Name: fieldscreenschemeitem pk_fieldscreenschemeitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldscreenschemeitem
    ADD CONSTRAINT pk_fieldscreenschemeitem PRIMARY KEY (id);


--
-- Name: fieldscreentab pk_fieldscreentab; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fieldscreentab
    ADD CONSTRAINT pk_fieldscreentab PRIMARY KEY (id);


--
-- Name: fileattachment pk_fileattachment; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.fileattachment
    ADD CONSTRAINT pk_fileattachment PRIMARY KEY (id);


--
-- Name: filtersubscription pk_filtersubscription; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.filtersubscription
    ADD CONSTRAINT pk_filtersubscription PRIMARY KEY (id);


--
-- Name: gadgetuserpreference pk_gadgetuserpreference; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.gadgetuserpreference
    ADD CONSTRAINT pk_gadgetuserpreference PRIMARY KEY (id);


--
-- Name: genericconfiguration pk_genericconfiguration; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.genericconfiguration
    ADD CONSTRAINT pk_genericconfiguration PRIMARY KEY (id);


--
-- Name: globalpermissionentry pk_globalpermissionentry; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.globalpermissionentry
    ADD CONSTRAINT pk_globalpermissionentry PRIMARY KEY (id);


--
-- Name: groupbase pk_groupbase; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.groupbase
    ADD CONSTRAINT pk_groupbase PRIMARY KEY (id);


--
-- Name: issue_field_option pk_issue_field_option; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issue_field_option
    ADD CONSTRAINT pk_issue_field_option PRIMARY KEY (id);


--
-- Name: issue_field_option_scope pk_issue_field_option_scope; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issue_field_option_scope
    ADD CONSTRAINT pk_issue_field_option_scope PRIMARY KEY (id);


--
-- Name: issue_version pk_issue_version; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issue_version
    ADD CONSTRAINT pk_issue_version PRIMARY KEY (issue_id);


--
-- Name: issuelink pk_issuelink; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuelink
    ADD CONSTRAINT pk_issuelink PRIMARY KEY (id);


--
-- Name: issuelinktype pk_issuelinktype; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuelinktype
    ADD CONSTRAINT pk_issuelinktype PRIMARY KEY (id);


--
-- Name: issuesecurityscheme pk_issuesecurityscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuesecurityscheme
    ADD CONSTRAINT pk_issuesecurityscheme PRIMARY KEY (id);


--
-- Name: issuestatus pk_issuestatus; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuestatus
    ADD CONSTRAINT pk_issuestatus PRIMARY KEY (id);


--
-- Name: issuetype pk_issuetype; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuetype
    ADD CONSTRAINT pk_issuetype PRIMARY KEY (id);


--
-- Name: issuetypescreenscheme pk_issuetypescreenscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuetypescreenscheme
    ADD CONSTRAINT pk_issuetypescreenscheme PRIMARY KEY (id);


--
-- Name: issuetypescreenschemeentity pk_issuetypescreenschemeentity; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.issuetypescreenschemeentity
    ADD CONSTRAINT pk_issuetypescreenschemeentity PRIMARY KEY (id);


--
-- Name: jiraaction pk_jiraaction; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraaction
    ADD CONSTRAINT pk_jiraaction PRIMARY KEY (id);


--
-- Name: jiradraftworkflows pk_jiradraftworkflows; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiradraftworkflows
    ADD CONSTRAINT pk_jiradraftworkflows PRIMARY KEY (id);


--
-- Name: jiraeventtype pk_jiraeventtype; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraeventtype
    ADD CONSTRAINT pk_jiraeventtype PRIMARY KEY (id);


--
-- Name: jiraissue pk_jiraissue; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraissue
    ADD CONSTRAINT pk_jiraissue PRIMARY KEY (id);


--
-- Name: jiraperms pk_jiraperms; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraperms
    ADD CONSTRAINT pk_jiraperms PRIMARY KEY (id);


--
-- Name: jiraworkflows pk_jiraworkflows; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraworkflows
    ADD CONSTRAINT pk_jiraworkflows PRIMARY KEY (id);


--
-- Name: jiraworkflowstatuses pk_jiraworkflowstatuses; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jiraworkflowstatuses
    ADD CONSTRAINT pk_jiraworkflowstatuses PRIMARY KEY (id);


--
-- Name: jquartz_blob_triggers pk_jquartz_blob_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_blob_triggers
    ADD CONSTRAINT pk_jquartz_blob_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: jquartz_calendars pk_jquartz_calendars; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_calendars
    ADD CONSTRAINT pk_jquartz_calendars PRIMARY KEY (calendar_name);


--
-- Name: jquartz_cron_triggers pk_jquartz_cron_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_cron_triggers
    ADD CONSTRAINT pk_jquartz_cron_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: jquartz_fired_triggers pk_jquartz_fired_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_fired_triggers
    ADD CONSTRAINT pk_jquartz_fired_triggers PRIMARY KEY (entry_id);


--
-- Name: jquartz_job_details pk_jquartz_job_details; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_job_details
    ADD CONSTRAINT pk_jquartz_job_details PRIMARY KEY (job_name, job_group);


--
-- Name: jquartz_job_listeners pk_jquartz_job_listeners; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_job_listeners
    ADD CONSTRAINT pk_jquartz_job_listeners PRIMARY KEY (job_name, job_group, job_listener);


--
-- Name: jquartz_locks pk_jquartz_locks; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_locks
    ADD CONSTRAINT pk_jquartz_locks PRIMARY KEY (lock_name);


--
-- Name: jquartz_paused_trigger_grps pk_jquartz_paused_trigger_grps; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_paused_trigger_grps
    ADD CONSTRAINT pk_jquartz_paused_trigger_grps PRIMARY KEY (trigger_group);


--
-- Name: jquartz_scheduler_state pk_jquartz_scheduler_state; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_scheduler_state
    ADD CONSTRAINT pk_jquartz_scheduler_state PRIMARY KEY (instance_name);


--
-- Name: jquartz_simple_triggers pk_jquartz_simple_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_simple_triggers
    ADD CONSTRAINT pk_jquartz_simple_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: jquartz_simprop_triggers pk_jquartz_simprop_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_simprop_triggers
    ADD CONSTRAINT pk_jquartz_simprop_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: jquartz_trigger_listeners pk_jquartz_trigger_listeners; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_trigger_listeners
    ADD CONSTRAINT pk_jquartz_trigger_listeners PRIMARY KEY (trigger_group, trigger_listener);


--
-- Name: jquartz_triggers pk_jquartz_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.jquartz_triggers
    ADD CONSTRAINT pk_jquartz_triggers PRIMARY KEY (trigger_name, trigger_group);


--
-- Name: label pk_label; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT pk_label PRIMARY KEY (id);


--
-- Name: licenserolesdefault pk_licenserolesdefault; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.licenserolesdefault
    ADD CONSTRAINT pk_licenserolesdefault PRIMARY KEY (id);


--
-- Name: licenserolesgroup pk_licenserolesgroup; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.licenserolesgroup
    ADD CONSTRAINT pk_licenserolesgroup PRIMARY KEY (id);


--
-- Name: listenerconfig pk_listenerconfig; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.listenerconfig
    ADD CONSTRAINT pk_listenerconfig PRIMARY KEY (id);


--
-- Name: mailserver pk_mailserver; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.mailserver
    ADD CONSTRAINT pk_mailserver PRIMARY KEY (id);


--
-- Name: managedconfigurationitem pk_managedconfigurationitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.managedconfigurationitem
    ADD CONSTRAINT pk_managedconfigurationitem PRIMARY KEY (id);


--
-- Name: membershipbase pk_membershipbase; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.membershipbase
    ADD CONSTRAINT pk_membershipbase PRIMARY KEY (id);


--
-- Name: moved_issue_key pk_moved_issue_key; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.moved_issue_key
    ADD CONSTRAINT pk_moved_issue_key PRIMARY KEY (id);


--
-- Name: nodeassociation pk_nodeassociation; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.nodeassociation
    ADD CONSTRAINT pk_nodeassociation PRIMARY KEY (source_node_id, source_node_entity, sink_node_id, sink_node_entity, association_type);


--
-- Name: nodeindexcounter pk_nodeindexcounter; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.nodeindexcounter
    ADD CONSTRAINT pk_nodeindexcounter PRIMARY KEY (id);


--
-- Name: notification pk_notification; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT pk_notification PRIMARY KEY (id);


--
-- Name: notificationinstance pk_notificationinstance; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.notificationinstance
    ADD CONSTRAINT pk_notificationinstance PRIMARY KEY (id);


--
-- Name: notificationscheme pk_notificationscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.notificationscheme
    ADD CONSTRAINT pk_notificationscheme PRIMARY KEY (id);


--
-- Name: oauthconsumer pk_oauthconsumer; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.oauthconsumer
    ADD CONSTRAINT pk_oauthconsumer PRIMARY KEY (id);


--
-- Name: oauthconsumertoken pk_oauthconsumertoken; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.oauthconsumertoken
    ADD CONSTRAINT pk_oauthconsumertoken PRIMARY KEY (id);


--
-- Name: oauthspconsumer pk_oauthspconsumer; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.oauthspconsumer
    ADD CONSTRAINT pk_oauthspconsumer PRIMARY KEY (id);


--
-- Name: oauthsptoken pk_oauthsptoken; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.oauthsptoken
    ADD CONSTRAINT pk_oauthsptoken PRIMARY KEY (id);


--
-- Name: optionconfiguration pk_optionconfiguration; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.optionconfiguration
    ADD CONSTRAINT pk_optionconfiguration PRIMARY KEY (id);


--
-- Name: os_currentstep pk_os_currentstep; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.os_currentstep
    ADD CONSTRAINT pk_os_currentstep PRIMARY KEY (id);


--
-- Name: os_currentstep_prev pk_os_currentstep_prev; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.os_currentstep_prev
    ADD CONSTRAINT pk_os_currentstep_prev PRIMARY KEY (id, previous_id);


--
-- Name: os_historystep pk_os_historystep; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.os_historystep
    ADD CONSTRAINT pk_os_historystep PRIMARY KEY (id);


--
-- Name: os_historystep_prev pk_os_historystep_prev; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.os_historystep_prev
    ADD CONSTRAINT pk_os_historystep_prev PRIMARY KEY (id, previous_id);


--
-- Name: os_wfentry pk_os_wfentry; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.os_wfentry
    ADD CONSTRAINT pk_os_wfentry PRIMARY KEY (id);


--
-- Name: permissionscheme pk_permissionscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.permissionscheme
    ADD CONSTRAINT pk_permissionscheme PRIMARY KEY (id);


--
-- Name: permissionschemeattribute pk_permissionschemeattribute; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.permissionschemeattribute
    ADD CONSTRAINT pk_permissionschemeattribute PRIMARY KEY (id);


--
-- Name: pluginstate pk_pluginstate; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.pluginstate
    ADD CONSTRAINT pk_pluginstate PRIMARY KEY (pluginkey);


--
-- Name: pluginversion pk_pluginversion; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.pluginversion
    ADD CONSTRAINT pk_pluginversion PRIMARY KEY (id);


--
-- Name: portalpage pk_portalpage; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.portalpage
    ADD CONSTRAINT pk_portalpage PRIMARY KEY (id);


--
-- Name: portletconfiguration pk_portletconfiguration; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.portletconfiguration
    ADD CONSTRAINT pk_portletconfiguration PRIMARY KEY (id);


--
-- Name: priority pk_priority; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.priority
    ADD CONSTRAINT pk_priority PRIMARY KEY (id);


--
-- Name: productlicense pk_productlicense; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.productlicense
    ADD CONSTRAINT pk_productlicense PRIMARY KEY (id);


--
-- Name: project pk_project; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT pk_project PRIMARY KEY (id);


--
-- Name: project_key pk_project_key; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.project_key
    ADD CONSTRAINT pk_project_key PRIMARY KEY (id);


--
-- Name: projectcategory pk_projectcategory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.projectcategory
    ADD CONSTRAINT pk_projectcategory PRIMARY KEY (id);


--
-- Name: projectchangedtime pk_projectchangedtime; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.projectchangedtime
    ADD CONSTRAINT pk_projectchangedtime PRIMARY KEY (project_id);


--
-- Name: projectrole pk_projectrole; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.projectrole
    ADD CONSTRAINT pk_projectrole PRIMARY KEY (id);


--
-- Name: projectroleactor pk_projectroleactor; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.projectroleactor
    ADD CONSTRAINT pk_projectroleactor PRIMARY KEY (id);


--
-- Name: projectversion pk_projectversion; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.projectversion
    ADD CONSTRAINT pk_projectversion PRIMARY KEY (id);


--
-- Name: propertydata pk_propertydata; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertydata
    ADD CONSTRAINT pk_propertydata PRIMARY KEY (id);


--
-- Name: propertydate pk_propertydate; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertydate
    ADD CONSTRAINT pk_propertydate PRIMARY KEY (id);


--
-- Name: propertydecimal pk_propertydecimal; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertydecimal
    ADD CONSTRAINT pk_propertydecimal PRIMARY KEY (id);


--
-- Name: propertyentry pk_propertyentry; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertyentry
    ADD CONSTRAINT pk_propertyentry PRIMARY KEY (id);


--
-- Name: propertynumber pk_propertynumber; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertynumber
    ADD CONSTRAINT pk_propertynumber PRIMARY KEY (id);


--
-- Name: propertystring pk_propertystring; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertystring
    ADD CONSTRAINT pk_propertystring PRIMARY KEY (id);


--
-- Name: propertytext pk_propertytext; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.propertytext
    ADD CONSTRAINT pk_propertytext PRIMARY KEY (id);


--
-- Name: qrtz_calendars pk_qrtz_calendars; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT pk_qrtz_calendars PRIMARY KEY (calendar_name);


--
-- Name: qrtz_cron_triggers pk_qrtz_cron_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT pk_qrtz_cron_triggers PRIMARY KEY (id);


--
-- Name: qrtz_fired_triggers pk_qrtz_fired_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT pk_qrtz_fired_triggers PRIMARY KEY (entry_id);


--
-- Name: qrtz_job_details pk_qrtz_job_details; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT pk_qrtz_job_details PRIMARY KEY (id);


--
-- Name: qrtz_job_listeners pk_qrtz_job_listeners; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_job_listeners
    ADD CONSTRAINT pk_qrtz_job_listeners PRIMARY KEY (id);


--
-- Name: qrtz_simple_triggers pk_qrtz_simple_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT pk_qrtz_simple_triggers PRIMARY KEY (id);


--
-- Name: qrtz_trigger_listeners pk_qrtz_trigger_listeners; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_trigger_listeners
    ADD CONSTRAINT pk_qrtz_trigger_listeners PRIMARY KEY (id);


--
-- Name: qrtz_triggers pk_qrtz_triggers; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT pk_qrtz_triggers PRIMARY KEY (id);


--
-- Name: reindex_component pk_reindex_component; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.reindex_component
    ADD CONSTRAINT pk_reindex_component PRIMARY KEY (id);


--
-- Name: reindex_request pk_reindex_request; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.reindex_request
    ADD CONSTRAINT pk_reindex_request PRIMARY KEY (id);


--
-- Name: remembermetoken pk_remembermetoken; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.remembermetoken
    ADD CONSTRAINT pk_remembermetoken PRIMARY KEY (id);


--
-- Name: remotelink pk_remotelink; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.remotelink
    ADD CONSTRAINT pk_remotelink PRIMARY KEY (id);


--
-- Name: replicatedindexoperation pk_replicatedindexoperation; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.replicatedindexoperation
    ADD CONSTRAINT pk_replicatedindexoperation PRIMARY KEY (id);


--
-- Name: resolution pk_resolution; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.resolution
    ADD CONSTRAINT pk_resolution PRIMARY KEY (id);


--
-- Name: rundetails pk_rundetails; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.rundetails
    ADD CONSTRAINT pk_rundetails PRIMARY KEY (id);


--
-- Name: schemeissuesecurities pk_schemeissuesecurities; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.schemeissuesecurities
    ADD CONSTRAINT pk_schemeissuesecurities PRIMARY KEY (id);


--
-- Name: schemeissuesecuritylevels pk_schemeissuesecuritylevels; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.schemeissuesecuritylevels
    ADD CONSTRAINT pk_schemeissuesecuritylevels PRIMARY KEY (id);


--
-- Name: schemepermissions pk_schemepermissions; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.schemepermissions
    ADD CONSTRAINT pk_schemepermissions PRIMARY KEY (id);


--
-- Name: searchrequest pk_searchrequest; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.searchrequest
    ADD CONSTRAINT pk_searchrequest PRIMARY KEY (id);


--
-- Name: sequence_value_item pk_sequence_value_item; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.sequence_value_item
    ADD CONSTRAINT pk_sequence_value_item PRIMARY KEY (seq_name);


--
-- Name: serviceconfig pk_serviceconfig; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.serviceconfig
    ADD CONSTRAINT pk_serviceconfig PRIMARY KEY (id);


--
-- Name: sharepermissions pk_sharepermissions; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.sharepermissions
    ADD CONSTRAINT pk_sharepermissions PRIMARY KEY (id);


--
-- Name: tempattachmentsmonitor pk_tempattachmentsmonitor; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.tempattachmentsmonitor
    ADD CONSTRAINT pk_tempattachmentsmonitor PRIMARY KEY (temporary_attachment_id);


--
-- Name: trackback_ping pk_trackback_ping; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.trackback_ping
    ADD CONSTRAINT pk_trackback_ping PRIMARY KEY (id);


--
-- Name: trustedapp pk_trustedapp; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.trustedapp
    ADD CONSTRAINT pk_trustedapp PRIMARY KEY (id);


--
-- Name: upgradehistory pk_upgradehistory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.upgradehistory
    ADD CONSTRAINT pk_upgradehistory PRIMARY KEY (upgradeclass);


--
-- Name: upgradetaskhistory pk_upgradetaskhistory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.upgradetaskhistory
    ADD CONSTRAINT pk_upgradetaskhistory PRIMARY KEY (id);


--
-- Name: upgradetaskhistoryauditlog pk_upgradetaskhistoryauditlog; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.upgradetaskhistoryauditlog
    ADD CONSTRAINT pk_upgradetaskhistoryauditlog PRIMARY KEY (id);


--
-- Name: upgradeversionhistory pk_upgradeversionhistory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.upgradeversionhistory
    ADD CONSTRAINT pk_upgradeversionhistory PRIMARY KEY (targetbuild);


--
-- Name: userassociation pk_userassociation; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userassociation
    ADD CONSTRAINT pk_userassociation PRIMARY KEY (source_name, sink_node_id, sink_node_entity, association_type);


--
-- Name: userbase pk_userbase; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userbase
    ADD CONSTRAINT pk_userbase PRIMARY KEY (id);


--
-- Name: userhistoryitem pk_userhistoryitem; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userhistoryitem
    ADD CONSTRAINT pk_userhistoryitem PRIMARY KEY (id);


--
-- Name: userpickerfilter pk_userpickerfilter; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userpickerfilter
    ADD CONSTRAINT pk_userpickerfilter PRIMARY KEY (id);


--
-- Name: userpickerfiltergroup pk_userpickerfiltergroup; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userpickerfiltergroup
    ADD CONSTRAINT pk_userpickerfiltergroup PRIMARY KEY (id);


--
-- Name: userpickerfilterrole pk_userpickerfilterrole; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.userpickerfilterrole
    ADD CONSTRAINT pk_userpickerfilterrole PRIMARY KEY (id);


--
-- Name: versioncontrol pk_versioncontrol; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.versioncontrol
    ADD CONSTRAINT pk_versioncontrol PRIMARY KEY (id);


--
-- Name: votehistory pk_votehistory; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.votehistory
    ADD CONSTRAINT pk_votehistory PRIMARY KEY (id);


--
-- Name: workflowscheme pk_workflowscheme; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.workflowscheme
    ADD CONSTRAINT pk_workflowscheme PRIMARY KEY (id);


--
-- Name: workflowschemeentity pk_workflowschemeentity; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.workflowschemeentity
    ADD CONSTRAINT pk_workflowschemeentity PRIMARY KEY (id);


--
-- Name: worklog pk_worklog; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.worklog
    ADD CONSTRAINT pk_worklog PRIMARY KEY (id);


--
-- Name: worklog_version pk_worklog_version; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public.worklog_version
    ADD CONSTRAINT pk_worklog_version PRIMARY KEY (worklog_id);


--
-- Name: AO_4789DD_TASK_MONITOR u_ao_4789dd_task_mo1827547914; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR"
    ADD CONSTRAINT u_ao_4789dd_task_mo1827547914 UNIQUE ("TASK_ID");


--
-- Name: AO_723324_CLIENT_CONFIG u_ao_723324_client_config_name; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_723324_CLIENT_CONFIG"
    ADD CONSTRAINT u_ao_723324_client_config_name UNIQUE ("NAME");


--
-- Name: AO_ED669C_SEEN_ASSERTIONS u_ao_ed669c_seen_as1055534769; Type: CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS"
    ADD CONSTRAINT u_ao_ed669c_seen_as1055534769 UNIQUE ("ASSERTION_ID");


--
-- Name: action_author_created; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX action_author_created ON public.jiraaction USING btree (author, created);


--
-- Name: action_issue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX action_issue ON public.jiraaction USING btree (issueid);


--
-- Name: attach_issue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX attach_issue ON public.fileattachment USING btree (issueid);


--
-- Name: avatar_filename_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX avatar_filename_index ON public.avatar USING btree (filename, avatartype, systemavatar);


--
-- Name: avatar_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX avatar_index ON public.avatar USING btree (avatartype, owner);


--
-- Name: cf_cfoption; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cf_cfoption ON public.customfieldoption USING btree (customfield);


--
-- Name: cf_userpickerfiltergroup; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cf_userpickerfiltergroup ON public.userpickerfiltergroup USING btree (userpickerfilter);


--
-- Name: cf_userpickerfilterrole; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cf_userpickerfilterrole ON public.userpickerfilterrole USING btree (userpickerfilter);


--
-- Name: cfvalue_issue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cfvalue_issue ON public.customfieldvalue USING btree (issue, customfield);


--
-- Name: chggroup_author_created; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX chggroup_author_created ON public.changegroup USING btree (author, created);


--
-- Name: chggroup_issue_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX chggroup_issue_id ON public.changegroup USING btree (issueid, id);


--
-- Name: chgitem_group_field; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX chgitem_group_field ON public.changeitem USING btree (groupid, field);


--
-- Name: cl_searchrequest; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cl_searchrequest ON public.columnlayout USING btree (searchrequest);


--
-- Name: cl_username; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cl_username ON public.columnlayout USING btree (username);


--
-- Name: cluster_lock_name_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX cluster_lock_name_idx ON public.clusterlockstatus USING btree (lock_name);


--
-- Name: clusteredjob_jobid_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX clusteredjob_jobid_idx ON public.clusteredjob USING btree (job_id);


--
-- Name: clusteredjob_jrk_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX clusteredjob_jrk_idx ON public.clusteredjob USING btree (job_runner_key);


--
-- Name: clusteredjob_nextrun_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX clusteredjob_nextrun_idx ON public.clusteredjob USING btree (next_run);


--
-- Name: confcontext; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX confcontext ON public.configurationcontext USING btree (projectcategory, project, customfield);


--
-- Name: confcontextfieldconfigscheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX confcontextfieldconfigscheme ON public.configurationcontext USING btree (fieldconfigscheme);


--
-- Name: confcontextkey; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX confcontextkey ON public.configurationcontext USING btree (customfield);


--
-- Name: confcontextprojectkey; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX confcontextprojectkey ON public.configurationcontext USING btree (project, customfield);


--
-- Name: cv_deleted_update_time_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cv_deleted_update_time_idx ON public.comment_version USING btree (deleted, update_time);


--
-- Name: cv_parent_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cv_parent_id ON public.comment_version USING btree (parent_issue_id);


--
-- Name: cv_update_time; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX cv_update_time ON public.comment_version USING btree (update_time);


--
-- Name: deadletter_lastseen; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX deadletter_lastseen ON public.deadletter USING btree (last_seen);


--
-- Name: deadletter_msg_server_folder; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX deadletter_msg_server_folder ON public.deadletter USING btree (message_id, mail_server_id, folder_name);


--
-- Name: draft_workflow_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX draft_workflow_scheme ON public.draftworkflowschemeentity USING btree (scheme);


--
-- Name: draft_workflow_scheme_parent; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX draft_workflow_scheme_parent ON public.draftworkflowscheme USING btree (workflow_scheme_id);


--
-- Name: entityproperty_id_name_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX entityproperty_id_name_key ON public.entity_property USING btree (entity_id, entity_name, property_key);


--
-- Name: entityproperty_key_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX entityproperty_key_name ON public.entity_property USING btree (property_key, entity_name);


--
-- Name: entitytranslation_locale; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX entitytranslation_locale ON public.entity_translation USING btree (locale);


--
-- Name: entpropindexdoc_module; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX entpropindexdoc_module ON public.entity_property_index_document USING btree (plugin_key, module_key);


--
-- Name: ext_entity_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX ext_entity_name ON public.external_entities USING btree (name);


--
-- Name: favourite_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX favourite_index ON public.favouriteassociations USING btree (username, entitytype, entityid);


--
-- Name: fc_fieldid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fc_fieldid ON public.fieldconfiguration USING btree (fieldid);


--
-- Name: fcs_fieldid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fcs_fieldid ON public.fieldconfigscheme USING btree (fieldid);


--
-- Name: fcs_issuetype; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fcs_issuetype ON public.fieldconfigschemeissuetype USING btree (issuetype);


--
-- Name: fcs_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fcs_scheme ON public.fieldconfigschemeissuetype USING btree (fieldconfigscheme);


--
-- Name: feature_id_userkey; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX feature_id_userkey ON public.feature USING btree (id, user_key);


--
-- Name: fieldid_fieldconf; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldid_fieldconf ON public.optionconfiguration USING btree (fieldid, fieldconfig);


--
-- Name: fieldid_optionid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldid_optionid ON public.optionconfiguration USING btree (fieldid, optionid);


--
-- Name: fieldlayout_layout; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldlayout_layout ON public.fieldlayoutschemeentity USING btree (fieldlayout);


--
-- Name: fieldlayout_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldlayout_scheme ON public.fieldlayoutschemeentity USING btree (scheme);


--
-- Name: fieldscitem_tab; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldscitem_tab ON public.fieldscreenlayoutitem USING btree (fieldscreentab);


--
-- Name: fieldscreen_field; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldscreen_field ON public.fieldscreenlayoutitem USING btree (fieldidentifier);


--
-- Name: fieldscreen_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldscreen_scheme ON public.issuetypescreenschemeentity USING btree (fieldscreenscheme);


--
-- Name: fieldscreen_tab; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fieldscreen_tab ON public.fieldscreentab USING btree (fieldscreen);


--
-- Name: fl_scheme_assoc; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX fl_scheme_assoc ON public.fieldlayoutschemeassociation USING btree (project, issuetype);


--
-- Name: historystep_entryid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX historystep_entryid ON public.os_historystep USING btree (entry_id);


--
-- Name: idx_all_project_ids; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_all_project_ids ON public.project_key USING btree (project_id);


--
-- Name: idx_all_project_keys; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX idx_all_project_keys ON public.project_key USING btree (project_key);


--
-- Name: idx_audit_item_log_id2; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_audit_item_log_id2 ON public.audit_item USING btree (log_id);


--
-- Name: idx_audit_log_created; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_audit_log_created ON public.audit_log USING btree (created);


--
-- Name: idx_board_board_ids; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_board_board_ids ON public.boardproject USING btree (board_id);


--
-- Name: idx_board_project_ids; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_board_project_ids ON public.boardproject USING btree (project_id);


--
-- Name: idx_changed_value_log_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_changed_value_log_id ON public.audit_changed_value USING btree (log_id);


--
-- Name: idx_cli_fieldidentifier; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_cli_fieldidentifier ON public.columnlayoutitem USING btree (fieldidentifier);


--
-- Name: idx_component_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_component_name ON public.component USING btree (cname);


--
-- Name: idx_component_project; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_component_project ON public.component USING btree (project);


--
-- Name: idx_directory_active; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_directory_active ON public.cwd_directory USING btree (active);


--
-- Name: idx_directory_impl; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_directory_impl ON public.cwd_directory USING btree (lower_impl_class);


--
-- Name: idx_directory_type; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_directory_type ON public.cwd_directory USING btree (directory_type);


--
-- Name: idx_display_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_display_name ON public.cwd_user USING btree (lower_display_name);


--
-- Name: idx_email_address; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_email_address ON public.cwd_user USING btree (lower_email_address);


--
-- Name: idx_first_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_first_name ON public.cwd_user USING btree (lower_first_name);


--
-- Name: idx_fli_fieldidentifier; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_fli_fieldidentifier ON public.fieldlayoutitem USING btree (fieldidentifier);


--
-- Name: idx_fli_fieldlayout; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_fli_fieldlayout ON public.fieldlayoutitem USING btree (fieldlayout);


--
-- Name: idx_group_active; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_group_active ON public.cwd_group USING btree (lower_group_name, active);


--
-- Name: idx_group_attr_dir_name_lval; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_group_attr_dir_name_lval ON public.cwd_group_attributes USING btree (directory_id, attribute_name, lower_attribute_value);


--
-- Name: idx_group_dir_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_group_dir_id ON public.cwd_group USING btree (directory_id);


--
-- Name: idx_last_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_last_name ON public.cwd_user USING btree (lower_last_name);


--
-- Name: idx_mem_dir_child; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_mem_dir_child ON public.cwd_membership USING btree (lower_child_name, membership_type, directory_id);


--
-- Name: idx_mem_dir_parent; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_mem_dir_parent ON public.cwd_membership USING btree (lower_parent_name, membership_type, directory_id);


--
-- Name: idx_mem_dir_parent_child; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_mem_dir_parent_child ON public.cwd_membership USING btree (lower_parent_name, lower_child_name, membership_type, directory_id);


--
-- Name: idx_old_issue_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX idx_old_issue_key ON public.moved_issue_key USING btree (old_issue_key);


--
-- Name: idx_parent_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_parent_name ON public.jiraworkflowstatuses USING btree (parentname);


--
-- Name: idx_project_category_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_project_category_name ON public.projectcategory USING btree (cname);


--
-- Name: idx_project_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX idx_project_key ON public.project USING btree (pkey);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.jquartz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_j_g ON public.jquartz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_jg ON public.jquartz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_t_g ON public.jquartz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_tg ON public.jquartz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.jquartz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_g; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_j_g ON public.jquartz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_j_grp ON public.jquartz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.jquartz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_j_state; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_j_state ON public.jquartz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_c ON public.jquartz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_j ON public.jquartz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_jg ON public.jquartz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.jquartz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_n_state ON public.jquartz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.jquartz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.jquartz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_nft_st ON public.jquartz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.jquartz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.jquartz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_reindex_component_req_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_reindex_component_req_id ON public.reindex_component USING btree (request_id);


--
-- Name: idx_sync_status_dir; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_sync_status_dir ON public.cwd_synchronisation_status USING btree (directory_id);


--
-- Name: idx_sync_status_end; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_sync_status_end ON public.cwd_synchronisation_status USING btree (sync_end);


--
-- Name: idx_sync_status_node; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_sync_status_node ON public.cwd_synchronisation_status USING btree (node_id);


--
-- Name: idx_tam_by_created_time; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_tam_by_created_time ON public.tempattachmentsmonitor USING btree (created_time);


--
-- Name: idx_tam_by_form_token; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_tam_by_form_token ON public.tempattachmentsmonitor USING btree (form_token);


--
-- Name: idx_user_attr_dir_name_lval; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_user_attr_dir_name_lval ON public.cwd_user_attributes USING btree (directory_id, attribute_name, lower_attribute_value);


--
-- Name: idx_version_project; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_version_project ON public.projectversion USING btree (project);


--
-- Name: idx_version_sequence; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX idx_version_sequence ON public.projectversion USING btree (sequence);


--
-- Name: index_ao_0a5972_not187736835; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_0a5972_not187736835 ON public."AO_0A5972_NOTIFICATION_SETTING" USING btree ("USER_KEY");


--
-- Name: index_ao_0a5972_pus2127422409; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_0a5972_pus2127422409 ON public."AO_0A5972_PUSH_REGISTRATION" USING btree ("USER_KEY");


--
-- Name: index_ao_21f425_mes1965715920; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_21f425_mes1965715920 ON public."AO_21F425_MESSAGE_MAPPING_AO" USING btree ("MESSAGE_ID");


--
-- Name: index_ao_21f425_mes223897723; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_21f425_mes223897723 ON public."AO_21F425_MESSAGE_MAPPING_AO" USING btree ("USER_HASH");


--
-- Name: index_ao_21f425_use1458667739; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_21f425_use1458667739 ON public."AO_21F425_USER_PROPERTY_AO" USING btree ("USER");


--
-- Name: index_ao_38321b_cus1828044926; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_38321b_cus1828044926 ON public."AO_38321B_CUSTOM_CONTENT_LINK" USING btree ("CONTENT_KEY");


--
-- Name: index_ao_4789dd_tas42846517; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_4789dd_tas42846517 ON public."AO_4789DD_TASK_MONITOR" USING btree ("TASK_MONITOR_KIND");


--
-- Name: index_ao_550953_sho1778115994; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_550953_sho1778115994 ON public."AO_550953_SHORTCUT" USING btree ("PROJECT_ID");


--
-- Name: index_ao_563aee_act1642652291; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_act1642652291 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("OBJECT_ID");


--
-- Name: index_ao_563aee_act1978295567; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_act1978295567 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("TARGET_ID");


--
-- Name: index_ao_563aee_act972488439; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_act972488439 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("ICON_ID");


--
-- Name: index_ao_563aee_act995325379; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_act995325379 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("ACTOR_ID");


--
-- Name: index_ao_563aee_obj696886343; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_obj696886343 ON public."AO_563AEE_OBJECT_ENTITY" USING btree ("IMAGE_ID");


--
-- Name: index_ao_563aee_tar521440921; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_563aee_tar521440921 ON public."AO_563AEE_TARGET_ENTITY" USING btree ("IMAGE_ID");


--
-- Name: index_ao_575bf5_dev567785983; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_dev567785983 ON public."AO_575BF5_DEV_SUMMARY" USING btree ("ISSUE_ID");


--
-- Name: index_ao_575bf5_dev996442447; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_dev996442447 ON public."AO_575BF5_DEV_SUMMARY" USING btree ("PROVIDER_SOURCE_ID");


--
-- Name: index_ao_575bf5_pro1117502689; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro1117502689 ON public."AO_575BF5_PROVIDER_ISSUE" USING btree ("STALE_AFTER");


--
-- Name: index_ao_575bf5_pro1348521624; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro1348521624 ON public."AO_575BF5_PROVIDER_ISSUE" USING btree ("PROVIDER_SOURCE_ID");


--
-- Name: index_ao_575bf5_pro1681808571; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro1681808571 ON public."AO_575BF5_PROCESSED_COMMITS" USING btree ("COMMIT_HASH");


--
-- Name: index_ao_575bf5_pro741170824; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro741170824 ON public."AO_575BF5_PROVIDER_ISSUE" USING btree ("ISSUE_ID");


--
-- Name: index_ao_575bf5_pro78019725; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro78019725 ON public."AO_575BF5_PROCESSED_COMMITS" USING btree ("METADATA_HASH");


--
-- Name: index_ao_575bf5_pro996609822; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_575bf5_pro996609822 ON public."AO_575BF5_PROVIDER_SEQ_NO" USING btree ("PROVIDER_SOURCE_ID");


--
-- Name: index_ao_60db71_aud137736645; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_aud137736645 ON public."AO_60DB71_AUDITENTRY" USING btree ("ENTITY_CLASS");


--
-- Name: index_ao_60db71_aud1756477597; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_aud1756477597 ON public."AO_60DB71_AUDITENTRY" USING btree ("CATEGORY");


--
-- Name: index_ao_60db71_aud604788536; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_aud604788536 ON public."AO_60DB71_AUDITENTRY" USING btree ("ENTITY_ID");


--
-- Name: index_ao_60db71_boa2110227660; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_boa2110227660 ON public."AO_60DB71_BOARDADMINS" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_car149237770; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_car149237770 ON public."AO_60DB71_CARDLAYOUT" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_car2031978979; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_car2031978979 ON public."AO_60DB71_CARDCOLOR" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_col1856623434; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_col1856623434 ON public."AO_60DB71_COLUMNSTATUS" USING btree ("COLUMN_ID");


--
-- Name: index_ao_60db71_col2098611346; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_col2098611346 ON public."AO_60DB71_COLUMN" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_det878495474; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_det878495474 ON public."AO_60DB71_DETAILVIEWFIELD" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_est1680565966; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_est1680565966 ON public."AO_60DB71_ESTIMATESTATISTIC" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_iss1616896230; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_iss1616896230 ON public."AO_60DB71_ISSUERANKING" USING btree ("ISSUE_ID");


--
-- Name: index_ao_60db71_iss1786461035; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_iss1786461035 ON public."AO_60DB71_ISSUERANKING" USING btree ("CUSTOM_FIELD_ID");


--
-- Name: index_ao_60db71_lex1569533973; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_lex1569533973 ON public."AO_60DB71_LEXORANK" USING btree ("FIELD_ID", "RANK");


--
-- Name: index_ao_60db71_lex1632828616; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_lex1632828616 ON public."AO_60DB71_LEXORANK" USING btree ("LOCK_HASH");


--
-- Name: index_ao_60db71_lex1694305086; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_lex1694305086 ON public."AO_60DB71_LEXORANK" USING btree ("FIELD_ID", "BUCKET", "RANK");


--
-- Name: index_ao_60db71_lex604083109; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_lex604083109 ON public."AO_60DB71_LEXORANK" USING btree ("ISSUE_ID");


--
-- Name: index_ao_60db71_non1145824037; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_non1145824037 ON public."AO_60DB71_NONWORKINGDAY" USING btree ("WORKING_DAYS_ID");


--
-- Name: index_ao_60db71_qui432573905; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_qui432573905 ON public."AO_60DB71_QUICKFILTER" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_spr1457658269; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_spr1457658269 ON public."AO_60DB71_SPRINT" USING btree ("SEQUENCE");


--
-- Name: index_ao_60db71_sta1907922871; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_sta1907922871 ON public."AO_60DB71_STATSFIELD" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_sub730851836; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_sub730851836 ON public."AO_60DB71_SUBQUERY" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_swi1429284592; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_swi1429284592 ON public."AO_60DB71_SWIMLANE" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_tra1711190333; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_tra1711190333 ON public."AO_60DB71_TRACKINGSTATISTIC" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_60db71_wor1205491794; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_60db71_wor1205491794 ON public."AO_60DB71_WORKINGDAYS" USING btree ("RAPID_VIEW_ID");


--
-- Name: index_ao_733371_eve1266474620; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve1266474620 ON public."AO_733371_EVENT_RECIPIENT" USING btree ("CONSUMER_NAME");


--
-- Name: index_ao_733371_eve1423945899; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve1423945899 ON public."AO_733371_EVENT_PARAMETER" USING btree ("NAME");


--
-- Name: index_ao_733371_eve1645451632; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve1645451632 ON public."AO_733371_EVENT_RECIPIENT" USING btree ("EVENT_ID");


--
-- Name: index_ao_733371_eve525098581; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve525098581 ON public."AO_733371_EVENT_RECIPIENT" USING btree ("SEND_DATE");


--
-- Name: index_ao_733371_eve673683319; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve673683319 ON public."AO_733371_EVENT" USING btree ("EVENT_BUNDLE_ID");


--
-- Name: index_ao_733371_eve678699426; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve678699426 ON public."AO_733371_EVENT_RECIPIENT" USING btree ("STATUS");


--
-- Name: index_ao_733371_eve704112384; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve704112384 ON public."AO_733371_EVENT_PARAMETER" USING btree ("EVENT_ID");


--
-- Name: index_ao_733371_eve902883849; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_eve902883849 ON public."AO_733371_EVENT" USING btree ("EVENT_TYPE");


--
-- Name: index_ao_733371_event_action; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_event_action ON public."AO_733371_EVENT" USING btree ("ACTION");


--
-- Name: index_ao_733371_event_created; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_event_created ON public."AO_733371_EVENT" USING btree ("CREATED");


--
-- Name: index_ao_733371_event_user_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_733371_event_user_key ON public."AO_733371_EVENT" USING btree ("USER_KEY");


--
-- Name: index_ao_ac3877_rl_1696242418; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_ac3877_rl_1696242418 ON public."AO_AC3877_RL_USER_COUNTER" USING btree ("INTERVAL_START");


--
-- Name: index_ao_ac3877_rl_2023752663; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_ac3877_rl_2023752663 ON public."AO_AC3877_RL_USER_COUNTER" USING btree ("USER_ID");


--
-- Name: index_ao_c77861_aud148201205; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud148201205 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("CATEGORY");


--
-- Name: index_ao_c77861_aud1490488814; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud1490488814 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("USER_ID", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud2071685161; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud2071685161 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("ENTITY_TIMESTAMP", "ID");


--
-- Name: index_ao_c77861_aud237541374; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud237541374 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("PRIMARY_RESOURCE_ID", "PRIMARY_RESOURCE_TYPE", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud265617021; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud265617021 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("ACTION");


--
-- Name: index_ao_c77861_aud470300084; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_c77861_aud470300084 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("SECONDARY_RESOURCE_ID", "SECONDARY_RESOURCE_TYPE", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_e8b6cc_bra1368852151; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_bra1368852151 ON public."AO_E8B6CC_BRANCH_HEAD_MAPPING" USING btree ("REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_bra405461593; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_bra405461593 ON public."AO_E8B6CC_BRANCH" USING btree ("REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_cha1086340152; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_cha1086340152 ON public."AO_E8B6CC_CHANGESET_MAPPING" USING btree ("SMARTCOMMIT_AVAILABLE");


--
-- Name: index_ao_e8b6cc_cha1483243924; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_cha1483243924 ON public."AO_E8B6CC_CHANGESET_MAPPING" USING btree ("NODE");


--
-- Name: index_ao_e8b6cc_cha509722037; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_cha509722037 ON public."AO_E8B6CC_CHANGESET_MAPPING" USING btree ("RAW_NODE");


--
-- Name: index_ao_e8b6cc_cha897886051; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_cha897886051 ON public."AO_E8B6CC_CHANGESET_MAPPING" USING btree ("AUTHOR");


--
-- Name: index_ao_e8b6cc_com1308336834; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_com1308336834 ON public."AO_E8B6CC_COMMIT" USING btree ("DOMAIN_ID");


--
-- Name: index_ao_e8b6cc_commit_node; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_commit_node ON public."AO_E8B6CC_COMMIT" USING btree ("NODE");


--
-- Name: index_ao_e8b6cc_git1120895454; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_git1120895454 ON public."AO_E8B6CC_GIT_HUB_EVENT" USING btree ("GIT_HUB_ID");


--
-- Name: index_ao_e8b6cc_git1804640320; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_git1804640320 ON public."AO_E8B6CC_GIT_HUB_EVENT" USING btree ("REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_iss1229805759; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_iss1229805759 ON public."AO_E8B6CC_ISSUE_TO_CHANGESET" USING btree ("CHANGESET_ID");


--
-- Name: index_ao_e8b6cc_iss1325927291; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_iss1325927291 ON public."AO_E8B6CC_ISSUE_TO_BRANCH" USING btree ("BRANCH_ID");


--
-- Name: index_ao_e8b6cc_iss353204826; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_iss353204826 ON public."AO_E8B6CC_ISSUE_TO_BRANCH" USING btree ("ISSUE_KEY");


--
-- Name: index_ao_e8b6cc_iss417950110; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_iss417950110 ON public."AO_E8B6CC_ISSUE_TO_CHANGESET" USING btree ("ISSUE_KEY");


--
-- Name: index_ao_e8b6cc_iss648895902; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_iss648895902 ON public."AO_E8B6CC_ISSUE_TO_CHANGESET" USING btree ("PROJECT_KEY");


--
-- Name: index_ao_e8b6cc_mes1247039512; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes1247039512 ON public."AO_E8B6CC_MESSAGE" USING btree ("ADDRESS");


--
-- Name: index_ao_e8b6cc_mes1391090780; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes1391090780 ON public."AO_E8B6CC_MESSAGE_TAG" USING btree ("MESSAGE_ID");


--
-- Name: index_ao_e8b6cc_mes1648007831; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes1648007831 ON public."AO_E8B6CC_MESSAGE_TAG" USING btree ("TAG");


--
-- Name: index_ao_e8b6cc_mes344532677; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes344532677 ON public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" USING btree ("MESSAGE_ID");


--
-- Name: index_ao_e8b6cc_mes59146529; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes59146529 ON public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" USING btree ("STATE");


--
-- Name: index_ao_e8b6cc_mes60959905; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_mes60959905 ON public."AO_E8B6CC_MESSAGE_QUEUE_ITEM" USING btree ("QUEUE");


--
-- Name: index_ao_e8b6cc_org1513110290; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_org1513110290 ON public."AO_E8B6CC_ORGANIZATION_MAPPING" USING btree ("DVCS_TYPE");


--
-- Name: index_ao_e8b6cc_org1899590324; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_org1899590324 ON public."AO_E8B6CC_ORG_TO_PROJECT" USING btree ("ORGANIZATION_ID");


--
-- Name: index_ao_e8b6cc_pr_1045528152; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_1045528152 ON public."AO_E8B6CC_PR_TO_COMMIT" USING btree ("REQUEST_ID");


--
-- Name: index_ao_e8b6cc_pr_1105917040; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_1105917040 ON public."AO_E8B6CC_PR_PARTICIPANT" USING btree ("PULL_REQUEST_ID");


--
-- Name: index_ao_e8b6cc_pr_1458633226; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_1458633226 ON public."AO_E8B6CC_PR_TO_COMMIT" USING btree ("COMMIT_ID");


--
-- Name: index_ao_e8b6cc_pr_1639282617; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_1639282617 ON public."AO_E8B6CC_PR_ISSUE_KEY" USING btree ("DOMAIN_ID");


--
-- Name: index_ao_e8b6cc_pr_2106805302; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_2106805302 ON public."AO_E8B6CC_PR_ISSUE_KEY" USING btree ("ISSUE_KEY");


--
-- Name: index_ao_e8b6cc_pr_281193494; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_281193494 ON public."AO_E8B6CC_PR_ISSUE_KEY" USING btree ("PULL_REQUEST_ID");


--
-- Name: index_ao_e8b6cc_pr_685151049; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_685151049 ON public."AO_E8B6CC_PR_TO_COMMIT" USING btree ("DOMAIN_ID");


--
-- Name: index_ao_e8b6cc_pr_758084799; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pr_758084799 ON public."AO_E8B6CC_PR_PARTICIPANT" USING btree ("DOMAIN_ID");


--
-- Name: index_ao_e8b6cc_pul1230717024; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pul1230717024 ON public."AO_E8B6CC_PULL_REQUEST" USING btree ("DOMAIN_ID");


--
-- Name: index_ao_e8b6cc_pul1448445182; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pul1448445182 ON public."AO_E8B6CC_PULL_REQUEST" USING btree ("TO_REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_pul602811170; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_pul602811170 ON public."AO_E8B6CC_PULL_REQUEST" USING btree ("REMOTE_ID");


--
-- Name: index_ao_e8b6cc_rep1082901832; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_rep1082901832 ON public."AO_E8B6CC_REPO_TO_CHANGESET" USING btree ("REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_rep1928770529; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_rep1928770529 ON public."AO_E8B6CC_REPO_TO_PROJECT" USING btree ("REPOSITORY_ID");


--
-- Name: index_ao_e8b6cc_rep702725269; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_rep702725269 ON public."AO_E8B6CC_REPOSITORY_MAPPING" USING btree ("ORGANIZATION_ID");


--
-- Name: index_ao_e8b6cc_rep922992576; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_rep922992576 ON public."AO_E8B6CC_REPO_TO_CHANGESET" USING btree ("CHANGESET_ID");


--
-- Name: index_ao_e8b6cc_rep93578901; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_rep93578901 ON public."AO_E8B6CC_REPOSITORY_MAPPING" USING btree ("LINKED");


--
-- Name: index_ao_e8b6cc_syn203792807; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_syn203792807 ON public."AO_E8B6CC_SYNC_AUDIT_LOG" USING btree ("REPO_ID");


--
-- Name: index_ao_e8b6cc_syn493078035; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_e8b6cc_syn493078035 ON public."AO_E8B6CC_SYNC_EVENT" USING btree ("REPO_ID");


--
-- Name: index_ao_ed669c_see20117222; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX index_ao_ed669c_see20117222 ON public."AO_ED669C_SEEN_ASSERTIONS" USING btree ("EXPIRY_TIMESTAMP");


--
-- Name: issue_assignee; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_assignee ON public.jiraissue USING btree (assignee);


--
-- Name: issue_created; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_created ON public.jiraissue USING btree (created);


--
-- Name: issue_duedate; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_duedate ON public.jiraissue USING btree (duedate);


--
-- Name: issue_proj_num; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_proj_num ON public.jiraissue USING btree (issuenum, project);


--
-- Name: issue_proj_status; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_proj_status ON public.jiraissue USING btree (project, issuestatus);


--
-- Name: issue_reporter; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_reporter ON public.jiraissue USING btree (reporter);


--
-- Name: issue_resolutiondate; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_resolutiondate ON public.jiraissue USING btree (resolutiondate);


--
-- Name: issue_updated; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_updated ON public.jiraissue USING btree (updated);


--
-- Name: issue_votes; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_votes ON public.jiraissue USING btree (votes);


--
-- Name: issue_watches; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_watches ON public.jiraissue USING btree (watches);


--
-- Name: issue_workflow; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issue_workflow ON public.jiraissue USING btree (workflow_id);


--
-- Name: issuelink_dest; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issuelink_dest ON public.issuelink USING btree (destination);


--
-- Name: issuelink_src; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issuelink_src ON public.issuelink USING btree (source);


--
-- Name: issuelink_type; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX issuelink_type ON public.issuelink USING btree (linktype);


--
-- Name: iv_deleted_update_time_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX iv_deleted_update_time_idx ON public.issue_version USING btree (deleted, update_time);


--
-- Name: iv_parent_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX iv_parent_id ON public.issue_version USING btree (parent_issue_id);


--
-- Name: iv_update_time; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX iv_update_time ON public.issue_version USING btree (update_time);


--
-- Name: label_fieldissue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX label_fieldissue ON public.label USING btree (issue, fieldid);


--
-- Name: label_fieldissuelabel; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX label_fieldissuelabel ON public.label USING btree (issue, fieldid, label);


--
-- Name: label_issue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX label_issue ON public.label USING btree (issue);


--
-- Name: label_label; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX label_label ON public.label USING btree (label);


--
-- Name: licenseroledefault_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX licenseroledefault_index ON public.licenserolesdefault USING btree (license_role_name);


--
-- Name: licenserolegroup_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX licenserolegroup_index ON public.licenserolesgroup USING btree (license_role_name, group_id);


--
-- Name: linktypename; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX linktypename ON public.issuelinktype USING btree (linkname);


--
-- Name: linktypestyle; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX linktypestyle ON public.issuelinktype USING btree (pstyle);


--
-- Name: managedconfigitem_id_type_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX managedconfigitem_id_type_idx ON public.managedconfigurationitem USING btree (item_id, item_type);


--
-- Name: mshipbase_group; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX mshipbase_group ON public.membershipbase USING btree (group_name);


--
-- Name: mshipbase_user; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX mshipbase_user ON public.membershipbase USING btree (user_name);


--
-- Name: node_id_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX node_id_idx ON public.nodeindexcounter USING btree (node_id, sending_node_id);


--
-- Name: node_operation_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX node_operation_idx ON public.replicatedindexoperation USING btree (node_id, affected_index, operation, index_time);


--
-- Name: node_sink; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX node_sink ON public.nodeassociation USING btree (sink_node_id, sink_node_entity);


--
-- Name: node_source; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX node_source ON public.nodeassociation USING btree (source_node_id, source_node_entity);


--
-- Name: notif_messageid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX notif_messageid ON public.notificationinstance USING btree (messageid);


--
-- Name: notif_source; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX notif_source ON public.notificationinstance USING btree (source);


--
-- Name: ntfctn_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX ntfctn_scheme ON public.notification USING btree (scheme);


--
-- Name: oauth_consumer_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX oauth_consumer_index ON public.oauthconsumer USING btree (consumer_key);


--
-- Name: oauth_consumer_service_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX oauth_consumer_service_index ON public.oauthconsumer USING btree (consumerservice);


--
-- Name: oauth_consumer_token_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX oauth_consumer_token_index ON public.oauthconsumertoken USING btree (token);


--
-- Name: oauth_consumer_token_key_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX oauth_consumer_token_key_index ON public.oauthconsumertoken USING btree (token_key);


--
-- Name: oauth_sp_consumer_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX oauth_sp_consumer_index ON public.oauthspconsumer USING btree (consumer_key);


--
-- Name: oauth_sp_consumer_key_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX oauth_sp_consumer_key_index ON public.oauthsptoken USING btree (consumer_key);


--
-- Name: oauth_sp_token_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX oauth_sp_token_index ON public.oauthsptoken USING btree (token);


--
-- Name: ordernumber_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX ordernumber_idx ON public.clusterupgradestate USING btree (order_number);


--
-- Name: osgroup_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX osgroup_name ON public.groupbase USING btree (groupname);


--
-- Name: osproperty_entid_name_propkey; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX osproperty_entid_name_propkey ON public.propertyentry USING btree (entity_id, entity_name, property_key);


--
-- Name: osproperty_propertykey; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX osproperty_propertykey ON public.propertyentry USING btree (property_key);


--
-- Name: osuser_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX osuser_name ON public.userbase USING btree (username);


--
-- Name: permission_key_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX permission_key_idx ON public.schemepermissions USING btree (permission_key);


--
-- Name: ppage_username; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX ppage_username ON public.portalpage USING btree (username);


--
-- Name: prmssn_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX prmssn_scheme ON public.schemepermissions USING btree (scheme);


--
-- Name: prmssn_scheme_attr_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX prmssn_scheme_attr_idx ON public.permissionschemeattribute USING btree (scheme);


--
-- Name: prmssn_scheme_attr_key_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX prmssn_scheme_attr_key_idx ON public.permissionschemeattribute USING btree (scheme, attribute_key);


--
-- Name: remembermetoken_username_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX remembermetoken_username_index ON public.remembermetoken USING btree (username);


--
-- Name: remotelink_globalid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX remotelink_globalid ON public.remotelink USING btree (globalid);


--
-- Name: remotelink_issueid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX remotelink_issueid ON public.remotelink USING btree (issueid, globalid);


--
-- Name: role_pid_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX role_pid_idx ON public.projectroleactor USING btree (pid);


--
-- Name: role_player_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX role_player_idx ON public.projectroleactor USING btree (projectroleid, pid);


--
-- Name: rundetails_jobid_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX rundetails_jobid_idx ON public.rundetails USING btree (job_id);


--
-- Name: rundetails_starttime_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX rundetails_starttime_idx ON public.rundetails USING btree (start_time);


--
-- Name: screenitem_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX screenitem_scheme ON public.fieldscreenschemeitem USING btree (fieldscreenscheme);


--
-- Name: searchrequest_filternamelower; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX searchrequest_filternamelower ON public.searchrequest USING btree (filtername_lower);


--
-- Name: sec_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX sec_scheme ON public.schemeissuesecurities USING btree (scheme);


--
-- Name: sec_security; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX sec_security ON public.schemeissuesecurities USING btree (security);


--
-- Name: share_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX share_index ON public.sharepermissions USING btree (entityid, entitytype);


--
-- Name: source_destination_node_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX source_destination_node_idx ON public.clustermessage USING btree (source_node, destination_node);


--
-- Name: sr_author; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX sr_author ON public.searchrequest USING btree (authorname);


--
-- Name: subscrpt_user; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX subscrpt_user ON public.filtersubscription USING btree (filter_i_d, username);


--
-- Name: subscrptn_group; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX subscrptn_group ON public.filtersubscription USING btree (filter_i_d, groupname);


--
-- Name: trustedapp_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX trustedapp_id ON public.trustedapp USING btree (application_id);


--
-- Name: type_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX type_key ON public.genericconfiguration USING btree (datatype, datakey);


--
-- Name: uh_type_user_entity; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uh_type_user_entity ON public.userhistoryitem USING btree (entitytype, username, entityid);


--
-- Name: uk_application_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_application_name ON public.cwd_application USING btree (lower_application_name);


--
-- Name: uk_directory_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX uk_directory_name ON public.cwd_directory USING btree (lower_directory_name);


--
-- Name: uk_entitytranslation; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_entitytranslation ON public.entity_translation USING btree (entity_name, entity_id, locale);


--
-- Name: uk_group_attr_name_lval; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_group_attr_name_lval ON public.cwd_group_attributes USING btree (group_id, attribute_name, lower_attribute_value);


--
-- Name: uk_group_name_dir_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_group_name_dir_id ON public.cwd_group USING btree (lower_group_name, directory_id);


--
-- Name: uk_lower_user_name; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_lower_user_name ON public.app_user USING btree (lower_user_name);


--
-- Name: uk_mem_parent_child_type; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_mem_parent_child_type ON public.cwd_membership USING btree (parent_id, child_id, membership_type);


--
-- Name: uk_user_attr_name_lval; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX uk_user_attr_name_lval ON public.cwd_user_attributes USING btree (user_id, attribute_name);


--
-- Name: uk_user_externalid_dir_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX uk_user_externalid_dir_id ON public.cwd_user USING btree (external_id, directory_id);


--
-- Name: uk_user_key; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_user_key ON public.app_user USING btree (user_key);


--
-- Name: uk_user_name_dir_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE UNIQUE INDEX uk_user_name_dir_id ON public.cwd_user USING btree (lower_user_name, directory_id);


--
-- Name: upf_customfield; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX upf_customfield ON public.userpickerfilter USING btree (customfield);


--
-- Name: upf_fieldconfigid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX upf_fieldconfigid ON public.userpickerfilter USING btree (customfieldconfig);


--
-- Name: user_sink; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX user_sink ON public.userassociation USING btree (sink_node_id, sink_node_entity);


--
-- Name: user_source; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX user_source ON public.userassociation USING btree (source_name);


--
-- Name: userpref_portletconfiguration; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX userpref_portletconfiguration ON public.gadgetuserpreference USING btree (portletconfiguration);


--
-- Name: votehistory_issue_index; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX votehistory_issue_index ON public.votehistory USING btree (issueid);


--
-- Name: wf_entryid; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX wf_entryid ON public.os_currentstep USING btree (entry_id);


--
-- Name: workflow_scheme; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX workflow_scheme ON public.workflowschemeentity USING btree (scheme);


--
-- Name: worklog_author; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX worklog_author ON public.worklog USING btree (author);


--
-- Name: worklog_issue; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX worklog_issue ON public.worklog USING btree (issueid);


--
-- Name: wv_deleted_update_time_idx; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX wv_deleted_update_time_idx ON public.worklog_version USING btree (deleted, update_time);


--
-- Name: wv_parent_id; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX wv_parent_id ON public.worklog_version USING btree (parent_issue_id);


--
-- Name: wv_update_time; Type: INDEX; Schema: public; Owner: jira
--

CREATE INDEX wv_update_time ON public.worklog_version USING btree (update_time);


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_actor_id FOREIGN KEY ("ACTOR_ID") REFERENCES public."AO_563AEE_ACTOR_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_icon_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_icon_id FOREIGN KEY ("ICON_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_object_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_object_id FOREIGN KEY ("OBJECT_ID") REFERENCES public."AO_563AEE_OBJECT_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_target_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_target_id FOREIGN KEY ("TARGET_ID") REFERENCES public."AO_563AEE_TARGET_ENTITY"("ID");


--
-- Name: AO_563AEE_OBJECT_ENTITY fk_ao_563aee_object_entity_image_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_object_entity_image_id FOREIGN KEY ("IMAGE_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_563AEE_TARGET_ENTITY fk_ao_563aee_target_entity_image_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_target_entity_image_id FOREIGN KEY ("IMAGE_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_60DB71_BOARDADMINS fk_ao_60db71_boardadmins_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_BOARDADMINS"
    ADD CONSTRAINT fk_ao_60db71_boardadmins_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_CARDCOLOR fk_ao_60db71_cardcolor_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDCOLOR"
    ADD CONSTRAINT fk_ao_60db71_cardcolor_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_CARDLAYOUT fk_ao_60db71_cardlayout_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_CARDLAYOUT"
    ADD CONSTRAINT fk_ao_60db71_cardlayout_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_COLUMN fk_ao_60db71_column_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMN"
    ADD CONSTRAINT fk_ao_60db71_column_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_COLUMNSTATUS fk_ao_60db71_columnstatus_column_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_COLUMNSTATUS"
    ADD CONSTRAINT fk_ao_60db71_columnstatus_column_id FOREIGN KEY ("COLUMN_ID") REFERENCES public."AO_60DB71_COLUMN"("ID");


--
-- Name: AO_60DB71_DETAILVIEWFIELD fk_ao_60db71_detailviewfield_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_DETAILVIEWFIELD"
    ADD CONSTRAINT fk_ao_60db71_detailviewfield_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_ESTIMATESTATISTIC fk_ao_60db71_estimatestatistic_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_ESTIMATESTATISTIC"
    ADD CONSTRAINT fk_ao_60db71_estimatestatistic_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_NONWORKINGDAY fk_ao_60db71_nonworkingday_working_days_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_NONWORKINGDAY"
    ADD CONSTRAINT fk_ao_60db71_nonworkingday_working_days_id FOREIGN KEY ("WORKING_DAYS_ID") REFERENCES public."AO_60DB71_WORKINGDAYS"("ID");


--
-- Name: AO_60DB71_QUICKFILTER fk_ao_60db71_quickfilter_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_QUICKFILTER"
    ADD CONSTRAINT fk_ao_60db71_quickfilter_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_STATSFIELD fk_ao_60db71_statsfield_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_STATSFIELD"
    ADD CONSTRAINT fk_ao_60db71_statsfield_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_SUBQUERY fk_ao_60db71_subquery_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SUBQUERY"
    ADD CONSTRAINT fk_ao_60db71_subquery_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_SWIMLANE fk_ao_60db71_swimlane_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_SWIMLANE"
    ADD CONSTRAINT fk_ao_60db71_swimlane_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_TRACKINGSTATISTIC fk_ao_60db71_trackingstatistic_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_TRACKINGSTATISTIC"
    ADD CONSTRAINT fk_ao_60db71_trackingstatistic_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_60DB71_WORKINGDAYS fk_ao_60db71_workingdays_rapid_view_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_60DB71_WORKINGDAYS"
    ADD CONSTRAINT fk_ao_60db71_workingdays_rapid_view_id FOREIGN KEY ("RAPID_VIEW_ID") REFERENCES public."AO_60DB71_RAPIDVIEW"("ID");


--
-- Name: AO_733371_EVENT_PARAMETER fk_ao_733371_event_parameter_event_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_PARAMETER"
    ADD CONSTRAINT fk_ao_733371_event_parameter_event_id FOREIGN KEY ("EVENT_ID") REFERENCES public."AO_733371_EVENT"("ID");


--
-- Name: AO_733371_EVENT_RECIPIENT fk_ao_733371_event_recipient_event_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_733371_EVENT_RECIPIENT"
    ADD CONSTRAINT fk_ao_733371_event_recipient_event_id FOREIGN KEY ("EVENT_ID") REFERENCES public."AO_733371_EVENT"("ID");


--
-- Name: AO_E8B6CC_BRANCH fk_ao_e8b6cc_branch_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_BRANCH"
    ADD CONSTRAINT fk_ao_e8b6cc_branch_repository_id FOREIGN KEY ("REPOSITORY_ID") REFERENCES public."AO_E8B6CC_REPOSITORY_MAPPING"("ID");


--
-- Name: AO_E8B6CC_GIT_HUB_EVENT fk_ao_e8b6cc_git_hub_event_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_GIT_HUB_EVENT"
    ADD CONSTRAINT fk_ao_e8b6cc_git_hub_event_repository_id FOREIGN KEY ("REPOSITORY_ID") REFERENCES public."AO_E8B6CC_REPOSITORY_MAPPING"("ID");


--
-- Name: AO_E8B6CC_ISSUE_TO_BRANCH fk_ao_e8b6cc_issue_to_branch_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ISSUE_TO_BRANCH"
    ADD CONSTRAINT fk_ao_e8b6cc_issue_to_branch_branch_id FOREIGN KEY ("BRANCH_ID") REFERENCES public."AO_E8B6CC_BRANCH"("ID");


--
-- Name: AO_E8B6CC_MESSAGE_QUEUE_ITEM fk_ao_e8b6cc_message_queue_item_message_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_QUEUE_ITEM"
    ADD CONSTRAINT fk_ao_e8b6cc_message_queue_item_message_id FOREIGN KEY ("MESSAGE_ID") REFERENCES public."AO_E8B6CC_MESSAGE"("ID");


--
-- Name: AO_E8B6CC_MESSAGE_TAG fk_ao_e8b6cc_message_tag_message_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_MESSAGE_TAG"
    ADD CONSTRAINT fk_ao_e8b6cc_message_tag_message_id FOREIGN KEY ("MESSAGE_ID") REFERENCES public."AO_E8B6CC_MESSAGE"("ID");


--
-- Name: AO_E8B6CC_ORG_TO_PROJECT fk_ao_e8b6cc_org_to_project_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_ORG_TO_PROJECT"
    ADD CONSTRAINT fk_ao_e8b6cc_org_to_project_organization_id FOREIGN KEY ("ORGANIZATION_ID") REFERENCES public."AO_E8B6CC_ORGANIZATION_MAPPING"("ID");


--
-- Name: AO_E8B6CC_PR_PARTICIPANT fk_ao_e8b6cc_pr_participant_pull_request_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_PARTICIPANT"
    ADD CONSTRAINT fk_ao_e8b6cc_pr_participant_pull_request_id FOREIGN KEY ("PULL_REQUEST_ID") REFERENCES public."AO_E8B6CC_PULL_REQUEST"("ID");


--
-- Name: AO_E8B6CC_PR_TO_COMMIT fk_ao_e8b6cc_pr_to_commit_commit_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_TO_COMMIT"
    ADD CONSTRAINT fk_ao_e8b6cc_pr_to_commit_commit_id FOREIGN KEY ("COMMIT_ID") REFERENCES public."AO_E8B6CC_COMMIT"("ID");


--
-- Name: AO_E8B6CC_PR_TO_COMMIT fk_ao_e8b6cc_pr_to_commit_request_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_PR_TO_COMMIT"
    ADD CONSTRAINT fk_ao_e8b6cc_pr_to_commit_request_id FOREIGN KEY ("REQUEST_ID") REFERENCES public."AO_E8B6CC_PULL_REQUEST"("ID");


--
-- Name: AO_E8B6CC_REPO_TO_PROJECT fk_ao_e8b6cc_repo_to_project_repository_id; Type: FK CONSTRAINT; Schema: public; Owner: jira
--

ALTER TABLE ONLY public."AO_E8B6CC_REPO_TO_PROJECT"
    ADD CONSTRAINT fk_ao_e8b6cc_repo_to_project_repository_id FOREIGN KEY ("REPOSITORY_ID") REFERENCES public."AO_E8B6CC_REPOSITORY_MAPPING"("ID");


--
-- PostgreSQL database dump complete
--

