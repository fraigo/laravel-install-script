#!/bin/bash

# Laravel installation script
# https://github.com/fraigo/laravel-install-script/

## Install PHP
sudo apt-get update
sudo apt-get install php

## Install php dependencies
sudo apt-get install php-zip
sudo apt-get install php-mbstring

## Install composer
sudo apt-get install composer

## Install laravel
composer global require "laravel/installer"
PATH=$PATH:$HOME/.config/composer/vendor/bin
echo 'PATH=$PATH:$HOME/.config/composer/vendor/bin' >> $HOME/.bashrc

## Create a new Laravel project
laravel new laravel-app
cd laravel-app

## Update dependencies
composer install

## Create environment
### Create initial .env file using the template file .env.example
### Creating a security key for the application
cp .env.example .env
php artisan key:generate

## Modify config file
In laravel-app/config/app.php, change APP_DEBUG to true

  'debug' => env('APP_DEBUG', true),

## Start local service
php artisan serve

## Open local application
http://localhost:8000/
