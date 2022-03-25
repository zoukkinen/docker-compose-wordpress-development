# Initial stuff for wordpress

SITENAME="Wordpress site"
SITEURL="http://localhost:8080"
ADMIN_USER="admin"
ADMIN_PASSWORD="password"
ADMIN_EMAIL="example@example.com"
ACTIVE_THEME_NAME="twentynineteen"

# List the wordpress.org hosted plugins you want to install to the site. (slug1 slug2)
PLUGINS="better-search-replace classic-editor wordpress-importer wp-export-menus"

# Use Importer
IMPORT=false

# Run the wp-cli script even when you alredy did it once
FORCE_RUN_INITIALISATION=false

# Importer filename
IMPORT_FILE_NAME=site.wordpress.latest.xml

# Do you want to do search replace
DO_SEARCH_REPLACE=false

# Old site url ("http://example.com" remove the last "/" If you want only one change, use same url in both site-name areas)
OLD_SITE_NAME="http://example.com"
OLD_SITE_NAME2="http://example.dev"

# Menu and locations
MAIN_MENU="main-menu main-menu"
SEC_MENU="secondary-menu secondary-menu"
THRD_MENU="third-menu third-menu"

# Homepage
# What to show on the front page
# posts : Your latest posts (default)
# page : A static page (see page_on_front)
SHOW_ON_FRONT="page"
FRONT_PAGE_SLUG="2"
PERMALINK_STRUCTURE="/%postname%/"

#Stuff from docker-compose
PHPMYADMIN_COMPOSE="http://localhost:8181"
MARIADB_PORT_COMPOSE="32000"

# Custom WP-cli command you wish to run. Note:  /docker-instructions folder is mapped as /tmp in wp-cli
# To run more complex wp-cli commands, use wp-cli-multidomain.sh-file
RUN_CUSTOM_WP_CLI=false
CUSTOM_WP_CLI="wp plugin install /var/www/html/tmp/plugins/your-purchased-plugin.zip"
