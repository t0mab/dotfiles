#!/bin/sh

ansible-playbook -i "$(hostname)," all.yml
