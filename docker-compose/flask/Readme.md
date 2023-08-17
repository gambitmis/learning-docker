# COMMAND
## Dev ENV
```sh
docker compose -f dev.docker-compose.yaml up -d --build
```
```sh
docker compose -f dev.docker-compose.yaml down -v
```
```sh
docker compose -f dev.docker-compose.yaml exec python sh
```
```sh
docker compose -f dev.docker-compose.yaml logs -f
```
## Production ENV
```sh
docker compose up -d --build
```
```sh
docker compose down -v
```
```sh
docker compose exec python sh
```
```sh
docker compose logs -f
```