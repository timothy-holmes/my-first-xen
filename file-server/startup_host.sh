# Run this script with (export $(cat .env | xargs) && sh ./startup_host.sh)

# Stops execution if env vars not set
set -u # or set -o nounset
: "$WRITE_SHARED_KEY"

# Clean up previous run
docker compose down --remove-orphans
-sudo rm -rf files & rm -rf seed_files.txt

# Let's gooo
docker compose up --build -d

sleep 20

# for each file in files, do curl command
docker exec -it mfx-file-server sh -c 'for file in /seed/*; do curl -d "$(cat $file)" -X POST -H "Authorization: Bearer $WRITE_SHARED_KEY" https://sfs.cloud.timothyholmes.com.au >> ./seed_files.txt; cat ./seed_files.txt; done'