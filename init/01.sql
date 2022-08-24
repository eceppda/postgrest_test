CREATE SCHEMA test;

create role web_anon nologin;

grant usage on schema test to web_anon;

CREATE FUNCTION test.get_headers()
RETURNS json AS $$
    SELECT current_setting('request.headers', true)::json;
$$ LANGUAGE SQL IMMUTABLE;
