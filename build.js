#! /usr/bin/env node

var exec = require('child_process').exec;

function hexoClean() {
    console.log('hexo clean...');
    exec('hexo clean', function(error, stdout, stderr) {
        if (error !== null) {
            console.log('hexo clean error: ' + error);
        } else {
            console.log('hexo clean complete.');

            hexoGenerate();
        }
    });
}

function hexoGenerate() {
    console.log('hexo generate...');
    exec('hexo generate', function(error, stdout, stderr) {
        if (error !== null) {
            console.log('hexo generate error: ' + error);
        } else {
            console.log('hexo generate complete.');

            gulp();
        }
    });
}

function gulp() {
    console.log('gulp...');
    exec('gulp', function(error, stdout, stderr) {
        if (error !== null) {
            console.log('gulp error: ' + error);
        } else {
            console.log('gulp complete.');

            hexoServer();
        }
    });
}

function hexoServer() {
    console.log('start hexo server...');
    exec('hexo server', function(error, stdout, stderr) {
        if (error !== null) {
            console.log('hexo server error: ' + error);
        } else {
            console.log('server started.');
        }
    });
}

hexoClean();
