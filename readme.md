# Schrodinger's bottle 
### A simple teambuilding exercise inspired by the two-phase commit protocol 

We once had a retro that involved revealing something about your past to the rest of the team.
Most people came up with stories that were genuinely revealing, embarrassing even, so we learnt
something about them.

For example, one team member confessed that he had wanted to become a doctor not a software developer
but when enrolling for medicine at university he had filled in the wrong course code,
accidentally switching his choice from medicine to computer science. One or two others chose not to 
reveal anything about themselves beyond a love of sports or food, so were not really playing the game.

I was reading the wikipedia article about two-phase commit
(https://en.wikipedia.org/wiki/Two-phase_commit_protocol). The protocol involves a _voting_ phase where
nodes in a transaction collaborate to reach a decision about whether to commit or rollback.

Adding a commit/rollback choice to the retro game would have allowed us to consider the revealing stories
anonymously and reject them en-bloc if any single one were not suitably juicy.

This little app (is the seed of a more robust app that) lets you do this remotely.

### Tech details and getting started

- Take a look at ```example.sh``` and ```index.js```
- ```npm run build``` to push the webtask.
