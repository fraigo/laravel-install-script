# laravel-install-script
Laravel installation and configuration script for first time

## References

* https://laravel.com/docs/5.6/installation


## Installation steps 

1. Install php 
1. Install php dependencies
1. Install composer
1. Install laravel
1. Create a new Laravel project
1. Update dependencies
1. Create environment
1. Start local service


## Installation details

### Install php

```bash
sudo apt-get update
sudo apt-get install php
```

### Install php dependencies

```bash
sudo apt-get install php-zip
sudo apt-get install php-mbstring
```

### Install composer

```bash
sudo apt-get install composer
```

### Install laravel

```bash
composer global require "laravel/installer"
PATH=$PATH:$HOME/.config/composer/vendor/bin
echo 'PATH=$PATH:$HOME/.config/composer/vendor/bin' >> $HOME/.bashrc
```

### Create a new Laravel project

```bash
laravel new laravel-app
cd laravel-app
```

### Update dependencies

```bash
composer install
```

### Create environment

* Create initial .env file using the template file .env.example
* Creating a security key for the application

```bash
cp .env.example .env
php artisan key:generate
```

### Modify config file 

In `laravel-app/config/app.php`, change APP_DEBUG to true

```php
  'debug' => env('APP_DEBUG', true),
```

### Start local service

```bash
php artisan serve
```

### Open local application

http://localhost:8000/


