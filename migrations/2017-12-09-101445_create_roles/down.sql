REVOKE USAGE ON SCHEMA loc_api FROM loc_anonymous;
REVOKE SELECT ON TABLE loc_api.edition FROM loc_anonymous;
DROP ROLE loc_admin;
DROP ROLE loc_user;
DROP ROLE loc_anonymous;
