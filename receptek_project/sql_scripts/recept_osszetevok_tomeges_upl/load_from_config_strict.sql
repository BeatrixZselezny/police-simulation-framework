\set ON_ERROR_STOP on
\set MODE validate
\set EXACT false

BEGIN;
SET search_path TO public;

-- psql változók csak itt vannak behelyettesítve (nem a DO-blokkon belül)
SET LOCAL app.mode  TO :'MODE';
SET LOCAL app.exact TO :'EXACT';

DO $$
DECLARE
  p           text;
  stage_total bigint;
  missing_cnt bigint;
  extra_cnt   bigint;
  mode        text := lower(coalesce(current_setting('app.mode', true), ''));
  exact_mode  boolean := (lower(coalesce(current_setting('app.exact', true), 'false')) = 'true');
BEGIN
  IF to_regclass('public.config') IS NULL THEN
    RAISE EXCEPTION 'CHK001: public.config nem létezik';
  END IF;

  SELECT param_value INTO p
  FROM public.config
  WHERE param_name = 'csv_path';

  IF p IS NULL OR btrim(p) = '' THEN
    RAISE EXCEPTION 'CHK002: config.csv_path nincs beállítva (param_name=csv_path)';
  END IF;

  -- fájl olvasható server-side
  PERFORM pg_read_file(p, 0, 1);

  IF to_regclass('public.recept_osszetevok') IS NULL THEN
    RAISE EXCEPTION 'CHK003: cél tábla nem létezik: public.recept_osszetevok';
  END IF;

  CREATE TEMP TABLE _stage_recept_osszetevok (
    receptid             int,
    recept_sorszam       int,
    osszetevo_id         int,
    mennyiseg            numeric(10,2),
    mertek_mennyiseg_id  int,
    osszetevo_osztaly_id int,
    recept_osztaly_id    int
  ) ON COMMIT DROP;

  EXECUTE format(
    'COPY _stage_recept_osszetevok FROM %L WITH (FORMAT csv, HEADER true, NULL '''')',
    p
  );

  SELECT count(*) INTO stage_total FROM _stage_recept_osszetevok;

  IF stage_total = 0 THEN
    RAISE EXCEPTION 'CHK004: a CSV üres (0 sor stagingben)';
  END IF;

  IF EXISTS (
    SELECT 1
    FROM _stage_recept_osszetevok
    GROUP BY receptid, recept_sorszam
    HAVING count(*) > 1
    LIMIT 1
  ) THEN
    RAISE EXCEPTION 'CHK005: duplikált (receptid,recept_sorszam) a CSV-ben';
  END IF;

  IF mode = 'validate' THEN
    -- VALIDATE: nem írunk semmit, csak ellenőrzünk
    CREATE TEMP TABLE _missing ON COMMIT DROP AS
      SELECT receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id
      FROM _stage_recept_osszetevok
      EXCEPT
      SELECT receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id
      FROM public.recept_osszetevok;

    SELECT count(*) INTO missing_cnt FROM _missing;

    IF missing_cnt <> 0 THEN
      RAISE EXCEPTION 'CHK006: VALIDATE FAIL – % CSV sor hiányzik a recept_osszetevok táblából', missing_cnt;
    END IF;

    IF exact_mode THEN
      CREATE TEMP TABLE _extra ON COMMIT DROP AS
        SELECT receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id
        FROM public.recept_osszetevok
        EXCEPT
        SELECT receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id
        FROM _stage_recept_osszetevok;

      SELECT count(*) INTO extra_cnt FROM _extra;

      IF extra_cnt <> 0 THEN
        RAISE EXCEPTION 'CHK007: VALIDATE EXACT FAIL – % extra sor van a táblában a CSV-hez képest', extra_cnt;
      END IF;
    END IF;

  ELSIF mode = 'apply' THEN
    -- APPLY: initial load, üres táblára
    IF EXISTS (SELECT 1 FROM public.recept_osszetevok LIMIT 1) THEN
      RAISE EXCEPTION 'CHK006: public.recept_osszetevok nem üres (initial load megszakítva)';
    END IF;

    INSERT INTO public.recept_osszetevok
      (receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id)
    SELECT
      receptid, recept_sorszam, osszetevo_id, mennyiseg, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id
    FROM _stage_recept_osszetevok;

    -- ha ide eljutott, akkor vagy betöltött mindent, vagy constraint hibára már elhasalt volna
  ELSE
    RAISE EXCEPTION 'CHK000: ismeretlen MODE: % (valid: validate|apply)', mode;
  END IF;
END $$;

SELECT (current_setting('app.mode', true) = 'apply') AS do_commit \gset
\if :do_commit
COMMIT;
\else
ROLLBACK;
\endif
