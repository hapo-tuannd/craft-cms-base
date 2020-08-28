# Development environmet setup
[Follow this link](https://craftcms.com/docs/3.x/requirements.html#required-php-extensions)
- Note: point root directory to: `<path-to-source>/web`
## Step 1: Download Craft
```
$ git clone git@github.com:hapo-tuannd/craft-cms-base.git
```
You can learn about what all these folders and files are for and how to customize them from the [Directory Structure](https://craftcms.com/docs/3.x/directory-structure.html) page.
## Step 2: Set the File Permissions
For Craft to run properly, PHP needs to be able to write to the following places:

- .env
- composer.json
- composer.lock
- config/license.key
- config/project/*
- storage/*
- vendor/*
- web/cpresources/*

The exact permissions you should be setting depends on the relationship between the system user that PHP is running as, and who owns the actual folders/files.

- If they are the same user, use 744.
- If they’re in the same group, then use 774.
- If you’re not sure and like to live life on the edge, use 777.

## Step 3: Set a Security Key
In your terminal, go to your project’s root directory and run the following command:
```
$ cd <path-to-source>
$ cp .env.example .env
$ php craft setup/security-key
```
## Step 4: Create a Database
- MySQL
   - Default Character Set: utf8
   - Default Collation: utf8_unicode_ci
Fill database connection to `.env`
```
# The database driver that will be used ("mysql" or "pgsql")
DB_DRIVER="mysql"

# The database server name or IP address
DB_SERVER="127.0.0.1"

# The port to connect to the database with
DB_PORT="3306"

# The name of the database to select
DB_DATABASE="craft_test_db"

# The database username to connect with
DB_USER="root"

# The database password to connect with
DB_PASSWORD=""
```
### Composer install
```
$ composer install
```

### Run build laravel mix to compile resources
```sh
$ npm i
$ npm run dev
```


