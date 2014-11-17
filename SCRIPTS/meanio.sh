#!/bin/bash

npm install -g meanio
mean init
cd mean
npm install -g
npm link
grunt
