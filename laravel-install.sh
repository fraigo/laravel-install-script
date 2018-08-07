#!/bin/bash

# Laravel installation script
# https://github.com/fraigo/laravel-install-script/

message () {
  echo -e "\033[0;32m$1\033[0m"
}

message "Install PHP"
sudo apt-get update
sudo apt-get install php

message "Install php dependencies"
sudo apt-get install php-zip
sudo apt-get install php-mbstring

message "Install composer"
sudo apt-get install composer

message "Install laravel"
composer global require "laravel/installer"
PATH=$PATH:$HOME/.config/composer/vendor/bin
echo 'PATH=$PATH:$HOME/.config/composer/vendor/bin' >> $HOME/.bashrc

message "Create a new Laravel project"
laravel new laravel-app
cd laravel-app

message "Update dependencies"
composer install

message "Create environment"
### Create initial .env file using the template file .env.example
### Creating a security key for the application
cp .env.example .env
php artisan key:generate


## message "Modify config file"
## In laravel-app/config/app.php, change APP_DEBUG to true
##  'debug' => env('APP_DEBUG', true),


message "Starting local application service"
echo "Point your browser to http://localhost:8000/"
php artisan serve

