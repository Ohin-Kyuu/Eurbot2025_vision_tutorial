docker compose -p vision_tutorial down --volumes --remove-orphans
docker compose -p vision_tutorial -f $PWD/docker-compose-build.yml up

docker compose -p vision_tutorial down --volumes --remove-orphans
docker compose -p vision_tutorial -f $PWD/docker-compose-run.yml up -d