CREATE SCHEMA test;

\c test;

create role web_anon nologin;

grant usage on schema test to web_anon;

create role authenticator noinherit login password 'ydab2d';
grant web_anon to authenticator;


CREATE FUNCTION test.get_headers()
RETURNS json AS $$
    SELECT current_setting('request.headers', true)::json;
$$ LANGUAGE SQL IMMUTABLE;
