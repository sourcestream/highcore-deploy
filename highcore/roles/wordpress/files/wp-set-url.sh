#!/usr/bin/env bash

echo "UPDATE $1.wp_options SET option_value = '$2' WHERE option_name IN (\"siteurl\", \"home\");" | php "$3/wp-cli.phar" db cli