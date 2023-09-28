CREATE SEQUENCE IF NOT EXISTS public."product_id_seq" AS INTEGER START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE IF NOT EXISTS public."product"
(
    id          integer                                                  NOT NULL DEFAULT nextval('public."product_id_seq"'::regclass),
    name        text                                                     NOT NULL,
    description text,
    price       float                                                    NOT NULL,
    created_at  timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at  timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at  timestamp(3) without time zone
);

ALTER SEQUENCE public."product_id_seq" OWNED BY public."product".id;

SELECT setval('public."product_id_seq"', (SELECT MAX(public."product".id) FROM public."product"));