#!/bin/bash

# activate conda env
. activate texta-rasa

# train models
cd /var/texta-rasa && rasa train

# run rasa
rasa run --enable-api
