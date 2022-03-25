#!/bin/bash
set x
/usr/local/bin/wp config set WP_HOME "'http://' . "'$'"_SERVER['HTTP_HOST'] . '/'" --raw
echo "SH-comment: WP_HOME set"
/usr/local/bin/wp config set WP_SITEURL "'http://' . "'$'"_SERVER['HTTP_HOST'] . '/'" --raw
echo "SH-comment: WP_SITEURL set"
/usr/local/bin/wp config set FORCE_SSL_ADMIN 'false' --raw