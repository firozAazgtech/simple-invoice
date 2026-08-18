#!/bin/sh
set -e

# Idempotent: seed.ts skips the reviewer account and any invoice number that
# already exists, so re-running this on every container start is safe and
# means `docker compose up` alone is enough to get a working, logged-in-able
# app — no separate `docker compose exec backend npm run seed` step needed.
echo "Seeding database..."
npm run seed

echo "Starting server..."
exec npm run start:prod
