#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt-get install ansible
