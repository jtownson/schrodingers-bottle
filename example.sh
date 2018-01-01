#!/usr/bin/env bash

# Create a new game
./new.sh

# a team of three telling their secrets
./secret.sh -n Bob -s "I like dog food"
./secret.sh -n Sam -s "World peace"
./secret.sh -n Lulu -s "I prefer ES5 to ES6"

# anybody can examine the anonymised secrets
./secrets.sh

# each vote on whether these secrets are suitably revealing
./vote.sh -n Bob -o no
./vote.sh -n Sam -o yes
./vote.sh -n Lulu -o no

# spin the bottle - no joy
./spin-the-bottle.sh

# some player need to be more revealing
./secret.sh -n Bob -s "I like dog food"
./secret.sh -n Sam -s "I registered for the wrong uni degree"
./secret.sh -n Lulu -s "I prefer ES5 to ES6"

# re-examine the anonymised secrets
./secrets.sh

# each vote on whether these secrets are suitably revealing
./vote.sh -n Bob -o yes
./vote.sh -n Sam -o yes
./vote.sh -n Lulu -o yes

# finally we learn something
./spin-the-bottle.sh
