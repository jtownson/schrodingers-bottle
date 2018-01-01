#!/usr/bin/env bash

function usage {
    echo "Usage: secret.sh -s|--secret <something to tell> -n|--name <your name>"
    exit 1;
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--secret)
    SECRET="$2"
    shift # past argument
    shift # past value
    ;;
    -n|--name)
    NAME="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    usage
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ -z "$SECRET" ] || [ -z "$NAME" ]; then
  usage
fi

curl -d "{\"secret\":\"$SECRET\", \"name\":\"$NAME\"}" \
    -H "Content-Type: application/json" \
    -X POST \
    https://wt-8dff049a1fced3962c31701974150fd2-0.run.webtask.io/schrodingers-bottle/secret
