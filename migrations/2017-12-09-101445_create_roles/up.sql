CREATE ROLE loc_anonymous NOLOGIN;
CREATE ROLE loc_user NOLOGIN;
CREATE ROLE loc_admin NOLOGIN;

GRANT loc_anonymous TO loc_user;
GRANT loc_user TO loc_admin;

ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM public;

GRANT USAGE ON SCHEMA loc_api TO loc_anonymous;
GRANT SELECT ON TABLE loc_api.edition TO loc_anonymous;
