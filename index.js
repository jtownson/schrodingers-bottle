'use latest';

import bodyParser from 'body-parser';
import express from 'express';
import Webtask from 'webtask-tools';

const server = express();

server.use(bodyParser.json());

server.post('/new', (req, res) => {
    const storage = req.webtaskContext.storage;
    storage.get((error, data) => {
        data = {};
        storage.set(data);
        res.end("New game started.\n");
    });
});

server.get('/secrets', (req, res) => {

    const storage = req.webtaskContext.storage;

    storage.get((error, allSecrets) => {

        const anonymousSecrets = Object.keys(allSecrets).map(key => allSecrets[key]);

        res.end(JSON.stringify(anonymousSecrets, null, 2) + '\n');
    });
});

server.post('/secret', (req, res) => {
    const storage = req.webtaskContext.storage;
    const body = req.body;
    const name = body.name;
    const secret = body.secret;

    storage.get((error, allSecrets) => {

        const newSecrets = {...allSecrets, [name]: {secret: secret}} || {};

        storage.set(newSecrets, function (error) {
            if (error) {
                res.end(JSON.stringify(error, null, 2));
            }
            else {
                res.end("Thanks " + name + ". I got your secret.\n");
            }
        });
    });
});

server.post('/vote', (req, res) => {
    const storage = req.webtaskContext.storage;
    const vote = req.body;

    storage.get((error, allSecrets) => {

        allSecrets[vote.name] = {...allSecrets[vote.name], opinion: vote.opinion};

        storage.set(allSecrets, function (error) {
            if (error) {
                res.end(JSON.stringify(error, null, 2));
            }
            else {
                // res.end(JSON.stringify(allSecrets, null, 2));
                res.end("Thanks " + vote.name + ". I got your vote.\n");
            }
        });
    });
});

const positives = new Set(["true", "yes"]);

server.get('/spin-the-bottle', (req, res) => {

    const storage = req.webtaskContext.storage;

    storage.get((error, allSecrets) => {

        const allIn = Object.keys(allSecrets).every(key => positives.has(allSecrets[key].opinion.toLowerCase()));

        if (allIn) {
            res.end(JSON.stringify(allSecrets, null, 2) + '\n');
        } else {
            res.end("Try again!\n");
        }
    });
});

module.exports = Webtask.fromExpress(server);
