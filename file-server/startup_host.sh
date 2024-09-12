docker compose up --build -d

# for each file in files, do curl command
for file in ./files/*; do
    echo $file >> ./seed_files.txt
    curl -d "$(cat $file)" http://localhost:4000 >> ./seed_files.txt
    echo "" >> ./seed_files.txt
done