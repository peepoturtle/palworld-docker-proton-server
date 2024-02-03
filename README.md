# A docker container to run Palworld's Windows dedicated server

since most mods for palworld uses UE4SS and UE4SS only supports windows; using this docker setup will allow you to run the windows server under linux (using proton)

## Instructions
- (optional) make .env file and edit settings
```
cp env.sample .env
vi .env
...
```

- (optional) force build image
```
docker compose build
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
The server installation will be under `server/PalServer`

## Mods
Mods can be put in the `mods` folder (`mods/LogicMods` for blueprint mods and `mods/LuaMods` for lua mods)

## Backups
There's automatic hourly backup of the server save, backups will be in `backups`, you can change the frequency in `./backups/crontab` *(it will be generated after the first run)*

## Common Errors
If you get the `unexpected permission` error, run `sudo chmod -R 755 ./server`