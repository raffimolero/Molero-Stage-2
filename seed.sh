#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

echo "Note: The following operation takes about 7 seconds on my machine. It does not have a loading bar or icon or anything."
npx prisma generate
npx prisma migrate deploy
npx prisma db seed

docker compose down
echo "Seeded. Now try ./run.sh"