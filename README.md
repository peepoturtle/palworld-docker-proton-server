# A docker container to run Palworld's Windows dedicated server

since most mods for palworld uses UE4SS and UE4SS only supports windows; using this docker setup will allow you to run the windows server under linux (using proton)

## Instructions
- build the docker image
```
./docker/build-docker-image.sh
```

- (optional) make .env file and edit settings
```
cp env.sample .env
vi .env
...
```

- start the server
```
docker compose up -d
```

- (optional) check docker log
```
docker compose logs -f
```

- shutdown server
```
docker compose down
```


## Files
the server installation will be under `server/PalServer`, this is where you can go install mods

## Backups
there's automatic hourly backup of the server save, backups will be in `server/backups`, you can change the frequency in `./server/crontab`
