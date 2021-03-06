#!/usr/bin/env bash

function usage {
    echo "Usage: vote.sh -o|--opinion yes|no -n|--name <your name>"
    exit 1;
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -o|--opinion)
    OPINION="$2"
    shift # past argument
    shift # past value
    ;;
    -n|--name)
    NAME="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ -z "$OPINION" ] || [ -z "$NAME" ]; then
  usage
fi

curl -d "{\"opinion\":\"$OPINION\", \"name\":\"$NAME\"}" \
    -H "Content-Type: application/json" \
    -X POST \
    https://wt-8dff049a1fced3962c31701974150fd2-0.run.webtask.io/schrodingers-bottle/vote

