#!/bin/bash

# Script to set up a Django project on Vagrant.

# Installation settings

PROJECT_NAME=$1

PROJECT_DIR=/vagrant/
VIRTUALENV_DIR=/home/vagrant/.virtualenvs/$PROJECT_NAME

PGSQL_VERSION=9.3

# Install essential packages from Apt
apt-get update -y
# Python dev packages
apt-get install -y build-essential python python-dev python-pip python-virtualenv
apt-get install -y git

if ! command -v workon; then
    pip install virtualenvwrapper
fi

# Postgresql
if ! command -v psql; then
    apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
    cp /vagrant/provision/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
    /etc/init.d/postgresql reload
fi

# bash environment global setup
echo "export WORKON_HOME=/home/vagrant/.virtualenvs" >> /home/vagrant/.bash_profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.bash_profile

# ---

# Create postgresql user and database
su -l postgres -c 'createuser --no-password -s -e khan'
createdb -Ukhan $PROJECT_NAME

# virtualenv setup for project
su - vagrant -c "/usr/bin/virtualenv $VIRTUALENV_DIR && \
    echo $PROJECT_DIR > $VIRTUALENV_DIR/.project && \
    $VIRTUALENV_DIR/bin/pip install -r $PROJECT_DIR/requirements.txt"

echo "workon $PROJECT_NAME" >> /home/vagrant/.bash_profile
