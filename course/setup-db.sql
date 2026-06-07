-- ══════════════════════════════════════════════
-- Setup DB — AI for SMEs Course · Homework Submissions
-- Rulează în: supabase.com → Project → SQL Editor
-- ══════════════════════════════════════════════

-- 1. Creare tabel teme
create table if not exists public.teme (
  id            uuid primary key default gen_random_uuid(),
  name          text not null,
  session       smallint not null default 1,
  text_body     text,
  file_url      text,
  link_url      text,
  submitted_at  timestamptz not null default now()
);

-- 2. Row Level Security — orice vizitator poate adăuga, nimeni nu poate citi (decât service_role)
alter table public.teme enable row level security;

create policy "anon can insert" on public.teme
  for insert to anon with check (true);

create policy "anon can read own session" on public.teme
  for select to anon using (false);

-- 3. Bucket storage pentru fișiere (dacă nu există)
insert into storage.buckets (id, name, public)
  values ('teme-files', 'teme-files', true)
  on conflict (id) do nothing;

create policy "anon upload teme-files" on storage.objects
  for insert to anon with check (bucket_id = 'teme-files');

create policy "public read teme-files" on storage.objects
  for select using (bucket_id = 'teme-files');
