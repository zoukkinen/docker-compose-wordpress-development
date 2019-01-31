# Docker install instructions. 

1. Install Docker Desktop

    https://www.docker.com/products/docker-desktop

2. Copy all files from [docker-insructions/plugins](../docker-instructions/plugins) to [wp-content/plugins](../wp-content/plugins) folder you should add the neede plugins to the plugins folder before starting the Docker container. This way the import will work. For example if your export site has ACF, this site needs it too for importing.

3. Copy setting-sample.txt file to the same folder [docker-insructions/](./) and rename it as settings.txt. 
    In this file you can find all important settings for your installation and change them if you wish. 
    There is stuff like, menu assignement, fronpage-settings and so on.

4. If you want the latest import of data, follow these [instructions](../docker-instructions#update-content-importer).
    After you have legit export file set `settings.txt`varable `IMPORT` to `true`
5. Open repository in commandline

6. Run ```docker-compose up```

        OBS!!
        If you run in to problems on Windows (wp-cli can't run anything) check that the settings.txt and apache2-wp-cli.sh are saved in LF  - End Of Line Sequnce.
        You can do this on Visual Studio Code and change the End Of Line Sequnce from the lower right (it says CRLF) cahnge it to LF and save the file again

7. After everything You get the login info and commet: **SH-comment: Complete**, you can Control+C the terminal

8. To start the terminal on the background use command:

    ```docker-compose up -d```

    And to shutdown the containers use command:
    
    ```docker-compose down```
    
    To remove the containers for good (you need to start over) use command: 
    
    ```docker-compose down --volumes```


## Here are the settings and credentials when the containers are running:

WordPress:
* http://localhost:8080/

WordPress Login:
* http://localhost:8080/wp-admin

    * User: admin
    * Password: password

phpMyAdmin:
* http://localhost:8181/

mariaDB:
   * Port: 32000
   * MYSQL_ROOT_PASSWORD: somewordpress
   * MYSQL_DATABASE: wordpress
   * MYSQL_USER: wordpress
   * MYSQL_PASSWORD: wordpress


---
---
---
---
---
---
---


# Update content importer: 

1. Go to your production or staging site and under tools you can export a file. Check first that you have `wp-export-menus`-plugin installed to also get the menus Put this file in the [docker-insructions/](./) (this) folder and save it on it's own name and dublicate as  `yoursite.wordpress.latest.xml`
    You can change the name in `settings.txt` file.

2. Delete yor local environment with command: `docker-compose down --volumes`

3. Run the `docker compose up` again to install fresh version with new data. 

