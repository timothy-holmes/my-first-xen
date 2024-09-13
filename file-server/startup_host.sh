# Run this script with (export $(cat .env | xargs) && sh ./startup_host.sh)

# Stops execution if env vars not set
set -u # or set -o nounset
: "$WRITE_SHARED_KEY"

docker compose down --remove-orphans && sudo rm -rf files & rm -rf seed_files.txt & docker compose up --build -d

# for each file in files, do curl command
for file in ./files/*; do
    echo $file >> ./seed_files.txt
    curl \
        -d "$(cat $file)" \
        -X POST -H "Authorization: Bearer $WRITE_SHARED_KEY" \
        https://sfs.cloud.timothyholmes.com.au >> ./seed_files.txt
    echo "\n" >> ./seed_files.txt
done