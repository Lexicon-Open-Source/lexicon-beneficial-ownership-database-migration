ALTER TABLE public.draft_cases ADD extra_data jsonb NULL;
ALTER TABLE public.cases ADD extra_data jsonb NULL;
ALTER TABLE public.cases ALTER COLUMN extra_data SET STORAGE EXTENDED;
