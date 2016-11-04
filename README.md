# lad-deploy-nginx-formula
Salt Formula for installing a basic nginx instance

Installing nginx with the option of adding php5-fpm.

I use this for production so it adds a default site which returns 404 for any request where the site name is not found (it removes the default nginx root page).

## Available States
 * nginx
 * nginx.php
