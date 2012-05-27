#! /bin/bash

sudo apt-get install $(cat ~/.packages | xargs)
