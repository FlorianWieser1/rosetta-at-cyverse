#!/usr/bin/env bash
# env bash is better for portability

set -e
#exit if something exits with non-zero status 

# the app should be in the same working directory as this script.
APP_PATH="$(dirname $0)/app.sh"

# Call the app with the command-line arguments.
$APP_PATH "$@"

# Do some postprocessing.
echo "Doing stuff.. renaming etc."
