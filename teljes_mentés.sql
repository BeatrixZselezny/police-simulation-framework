--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE debiana;
ALTER ROLE debiana WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:RpllZcNI09J0kOcjKG9k7A==$FKUJweSvvwk/H/OHW73SC2XC/ZrPXkc+HQLq//WBZEM=:jF1OABYEYoHhMHqlawAm5fj1Oqn/T1C+j5KLSLLASUA=';
CREATE ROLE learner_role;
ALTER ROLE learner_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1gWvk/1xdjw8codACpCZ4w==$4Ikem/ucVHzkU2pGgEyeg73FtOV1X3p344cQEKLU798=:AowFjNwfx5wr1aSsV55UVmq3Ao/jCtGfI8t14l6Nw0s=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:daD7lynEg5SO02m6FBfv8w==$gQFj1N6DcChTsm+xaukLmpvcLGsS2ixDi39lFPwPav4=:2DRd5CIG7gVyijb/x6FsRDnsdxTMtTYB/RmaNbUt2Zo=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

