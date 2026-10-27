# Infinite Photo Board

A static, mobile-friendly photo wall using GitHub Pages and Supabase.

## Important setup notes

- Never put a Supabase `service_role` or secret key in this website.
- This first version expects the `photos` table and `photo-wall` bucket from the setup guide.
- It uses SHA-256 to skip exact duplicate files.
- The date initially uses the file's last-modified timestamp. This version does **not** parse EXIF metadata yet.
- The title edit is currently saved only in the browser/device. Shared title settings will be added in a later iteration.
- Photos are publicly viewable if `photo-wall` is a public bucket. Do not upload private/sensitive photos unless you are comfortable with that.
- The policies must be restricted to your two approved accounts before real photos are uploaded. Also ensure SQL table privileges are granted to `authenticated` for insert/update/delete.

## Configure

1. Open `index.html`.
2. Find `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
3. Replace the placeholders with the Project URL and publishable/anon key from Supabase Project Settings → API.
4. Commit the file to GitHub.
5. In GitHub, open Settings → Pages, choose Deploy from a branch, select `main` and `/ (root)`, then Save.

## Current features

- Responsive sky-blue theme
- Pan and zoom around a large photo canvas
- Owner sign-in
- Multi-image upload
- SHA-256 exact duplicate detection
- Capture-date field editable from the wall
- Lightbox image viewing
- Remove photos while signed in

## Before production

Review the RLS policies in Supabase and restrict authenticated write access to only the two owner accounts. Configure Storage `SELECT` access intentionally; a public bucket allows public retrieval. Never expose a service-role key in frontend code.
