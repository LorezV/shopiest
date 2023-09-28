CREATE SEQUENCE IF NOT EXISTS public."user_id_seq" AS INTEGER START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE IF NOT EXISTS public."user"
(
    id         integer                                                  NOT NULL DEFAULT nextval('public."user_id_seq"'::regclass),
    email      text                                                     NOT NULL,
    password   text                                                     NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(3) without time zone
);

CREATE UNIQUE INDEX IF NOT EXISTS user_email_index ON public."user" USING btree (email);

ALTER SEQUENCE public."user_id_seq" OWNED BY public."user".id;

SELECT setval('public."user_id_seq"', (SELECT MAX(public."user".id) FROM public."user"));