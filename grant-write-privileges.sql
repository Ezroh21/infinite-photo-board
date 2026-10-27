-- Ensure authenticated users have SQL privileges matching the RLS policies already created.
grant insert, update, delete on table public.photos to authenticated;
