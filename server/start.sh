#!/bin/bash

die() {
    echo "error"
    while [ 1 ]; do sleep 10;done
    # exit 1
}

id
if [ "$(id -u)" != "1000" ];then
    echo "script must run as steam"
    die
fi

steamcmd=${STEAM_HOME}/steamcmd/steamcmd.sh

ACTUAL_PORT=8211
if [ "${PORT}" != "" ];then
    ACTUAL_PORT=${PORT}
fi
ARGS="${ARGS} -port=${ACTUAL_PORT} -publicport=${ACTUAL_PORT}"

if [ "${PLAYERS}" != "" ];then
    ARGS="${ARGS} -players=${PLAYERS}"
fi
if [ "${SERVER_NAME}" != "" ];then
    ARGS="${ARGS} -servername=${SERVER_NAME}"
fi
if [ "${SERVER_PASSWORD}" != "" ];then
    ARGS="${ARGS} -serverpassword=${SERVER_PASSWORD}"
fi
if [ "${SERVER_PASSWORD}" != "" ];then
    ARGS="${ARGS} -serverpassword=${SERVER_PASSWORD}"
fi
if [ "${NO_MULTITHREADING}" ]; then
    ARGS=${ARGS}
else
    ARGS="${ARGS} -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS"
fi 

# advertise server
ARGS="${ARGS} EpicApp=PalServer"

PalServerDir=/app/PalServer

CMD="$PROTON run ${PalServerDir}/Pal/Binaries/Win64/PalServer-Win64-Test.exe ${ARGS}"

$steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir ${PalServerDir} +login anonymous +app_update ${APPID} validate +quit || die

crontab /app/crontab || die

echo "starting server with: ${CMD}"
${CMD} || die
