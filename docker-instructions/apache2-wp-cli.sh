#!/bin/bash
source /var/www/html/tmp/settings.txt
FORCE_TIMER=false

if [ "$FORCE_RUN_INITIALISATION" = true ] ; 
then
    sleep 10s
    echo ""
    echo "SH-comment: FORCE RUN"
    echo "SH-comment: Remove completion-file"
    rm /var/www/html/compose-complete.txt
    echo "SH-comment: Completion-file deleted"
    FORCE_TIMER=true
fi
file="/var/www/html/compose-complete.txt"
if [ -f "$file" ]
then
    sleep 5s
    echo ""
    echo "SH-comment: $file found."
    echo ""
    echo "SH-comment: Initialisation completed already, sleeping"
    echo ""
    echo "*********************************************"
    echo ""
    echo "Your $SITENAME-site is up and running: $SITEURL"
    echo ""
    echo "You can now login at $SITEURL/wp-admin"
    echo ""
    echo "User: $ADMIN_USER"
    echo "Password: $ADMIN_PASSWORD"
    echo ""
    echo "phpMyAdmin $PHPMYADMIN_COMPOSE"
    echo ""
    echo "mariaDB port: $MARIADB_PORT_COMPOSE"
    echo ""
    echo "*********************************************"
    echo "SH-comment: Complete"
    sleep 1000d
else
    if [ "$FORCE_TIMER" = false ] ; 
    then
        sleep 5s
        echo "SH-comment: Waiting system 20 seconds"
        sleep 5s
        echo "SH-comment: Waiting system 15 seconds"
        sleep 5s
    fi
    echo "SH-comment: Waiting system 10 seconds"
    sleep 5s
    echo "SH-comment: Waiting system 5 seconds"
    sleep 1s
    echo "SH-comment: Waiting system 4 seconds"
    sleep 1s
    echo "SH-comment: Waiting system 3 seconds"
    sleep 1s
    echo "SH-comment: Waiting system 2 seconds"
    sleep 1s
    echo "SH-comment: Waiting system 1 seconds"
    sleep 1s
    echo "SH-comment: Starting install"
    sleep 1s
    echo ""

    echo "SH-comment: Running wp-cli script for $SITENAME"
    /usr/local/bin/wp core install --url="$SITEURL" --title="$SITENAME" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email="$ADMIN_EMAIL"
    echo ""

    if [ "$RUN_CUSTOM_WP_CLI" = true ] ; 
    then
        echo "SH-comment: Run Custom wp-cli command"
        sleep 2s
        /usr/local/bin/$CUSTOM_WP_CLI
        echo ""
    fi

    echo "SH-comment: Theme update starting"
    sleep 2s
    /usr/local/bin/wp theme update --all
    echo ""
    
    echo "SH-comment: Theme activation starting"
    sleep 2s
    /usr/local/bin/wp theme activate $ACTIVE_THEME_NAME
    echo ""
    /usr/local/bin/wp theme list
    echo ""

    echo "SH-comment: Plugin install starting"
    sleep 2s
    /usr/local/bin/wp plugin install $PLUGINS
    echo ""

    echo "SH-comment: Plugin update starting"
    sleep 2s
    /usr/local/bin/wp plugin update --all
    echo ""

    echo "SH-comment: Plugin activation starting"
    sleep 2s
    /usr/local/bin/wp plugin activate --all
    echo ""

    if [ "$IMPORT" = true ] ; 
    then
        echo "SH-comment: Import starting"
        sleep 2s
        /usr/local/bin/wp import ./tmp/$IMPORT_FILE_NAME --authors=skip
        echo "SH-comment: Import complete"
        echo ""
    fi
   
    echo "SH-comment: Starting menu assigning"
    sleep 2s
    /usr/local/bin/wp menu location assign $MAIN_MENU
    /usr/local/bin/wp menu location assign $SEC_MENU
    /usr/local/bin/wp menu location assign $THRD_MENU
    echo "SH-comment: Menu assigning complete"
    echo ""

    if [ "$SHOW_ON_FRONT" = "page" ] ;
    then
        echo "SH-comment: Setting Front Page"
        sleep 2s
        /usr/local/bin/wp option update page_on_front $FRONT_PAGE_SLUG
        /usr/local/bin/wp option update show_on_front $SHOW_ON_FRONT
        echo "SH-comment: Front Page Set"
        echo ""
    else
        echo "SH-comment: Setting Front Page as Blogs"
        /usr/local/bin/wp option update page_on_front ""
        /usr/local/bin/wp option update show_on_front $SHOW_ON_FRONT
    fi

    if [ "$DO_SEARCH_REPLACE" = true ] ; 
    then
        echo "SH-comment: Changing url:s to localhost" 
        sleep 2s
        /usr/local/bin/wp search-replace $OLD_SITE_NAME $SITEURL
        /usr/local/bin/wp search-replace $OLD_SITE_NAME2 $SITEURL
        §echo ""
    fi
    
    echo "SH-comment: Setting permalink structure"
    sleep 2s
    /usr/local/bin/wp option update permalink_structure $PERMALINK_STRUCTURE
    echo ""

    sleep 2s
    echo "Completion-file created" > /var/www/html/compose-complete.txt
    echo "SH-comment: Completion-file created"
    
    sleep 2s
    echo ""
    echo "*********************************************"
    echo ""
    echo "That was awesome, your $SITENAME-site is up and running: $SITEURL"
    echo ""
    echo "You can now login at $SITEURL/wp-admin"
    echo ""
    echo "User: $ADMIN_USER"
    echo "Password: $ADMIN_PASSWORD"
    echo ""
    echo "phpMyAdmin $PHPMYADMIN_COMPOSE"
    echo ""
    echo "mariaDB port: $MARIADB_PORT_COMPOSE"
    echo ""
    echo "*********************************************"
    sleep 2s
    if [ "$FORCE_RUN_INITIALISATION" = true ] ; 
    then
        echo "SH-comment: FORCE RUN STILL VALID!"
        echo "SH-comment: REMEMBER TO REMOVE IT FROM settings.txt"    
        sleep 10s
    fi
    echo ""
    echo "SH-comment: Sleeping"
    echo ""
    echo "SH-comment: Setup complete"
    echo "*********************************************"

    sleep 1000d
fi
